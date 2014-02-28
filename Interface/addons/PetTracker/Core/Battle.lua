--[[
Copyright 2012-2013 João Cardoso
PetTracker is distributed under the terms of the GNU General Public License (Version 3).
As a special exception, the copyright holders of this addon do not give permission to
redistribute and/or modify it.

This addon is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with the addon. If not, see <http://www.gnu.org/licenses/gpl-3.0.txt>.

This file is part of PetTracker.
--]]

local _, Addon = ...
local Server, Specie = C_PetBattles, Addon.Specie

local Battle = Addon:NewModule('Battle')
local Listener = CreateFrame('Frame')
Listener:RegisterEvent('PET_BATTLE_OVER')
Listener:RegisterEvent('CHAT_MSG_PET_BATTLE_COMBAT_LOG')
Listener:SetScript('OnEvent', function(self, event, ...)
	Battle[event](Battle, ...)
end)

local ENEMY_PLAYER = LE_BATTLE_PET_ENEMY
local HEALED = ACTION_SPELL_HEAL
local PET_BATTLE = 5


--[[ Events ]]--

function Battle:Startup()
	if not Addon.State.Casts then
		self:PET_BATTLE_OVER()
	end
end

function Battle:CHAT_MSG_PET_BATTLE_COMBAT_LOG(message)
	local id = tonumber(message:match('^|T.-|t|cff......|HbattlePetAbil:(%d+)'))
	if id then
		local isTargetEnemy = message:find(ENEMY)
		local isHeal = message:find(HEALED)

		if (isHeal and isTargetEnemy) or not (isHeal or isTargetEnemy) then
			local pet = self:GetCurrent(ENEMY_PLAYER)
			local casts = Addon.State.Casts[pet.index]

			for i, ability in ipairs(pet:GetAbilities()) do
				if ability == id then
					local k = i % 3
					casts.turn[k] = Addon.State.Turn
					casts.id[k] = id
					return
				end 
			end
		end
	else
		local round = message:match(PET_BATTLE_COMBAT_LOG_NEW_ROUND:gsub('%%d', '(%%d+)'))
		if round then
			Addon.State.Turn = tonumber(round)
		end
	end
end

function Battle:PET_BATTLE_OVER()
	Addon.State.Casts = {{id = {}, turn = {}}, {id = {}, turn = {}}, {id = {}, turn = {}}}
	Addon.State.Turn = 0
end


--[[ Static ]]--

function Battle:GetCurrent(owner)
	local index = Server.GetActivePet(owner)
	return self:Get(owner, index)
end

function Battle:Get(owner, index)
	return setmetatable({
		owner = owner,
		index = index
	}, self)
end

function Battle:AnyUpgrade()
	for i = 1, self:GetNum(ENEMY_PLAYER) do
		local pet = self:Get(ENEMY_PLAYER, i)
		if pet:IsUpgrade() then
			return true
		end
	end

	return false
end

function Battle:GetNum(owner)
	return Server.GetNumPets(owner)
end

function Battle:IsPvE()
	return Server.IsPlayerNPC(ENEMY_PLAYER)
end


--[[ Status ]]--

function Battle:Swap()
	if self:IsAlly() and Server.CanPetSwapIn(self.index) then
		Server.ChangePet(self.index)
		return true
	end
end

function Battle:Exists()
	return self:GetNum(self.owner) >= self.index
end

function Battle:IsUpgrade()
	if self:IsWildBattle() then 
		if self:GetSpecie() and self:GetSource() == PET_BATTLE then
			local pet, quality, level = self:GetBestOwned()
			
			if self:GetQuality() > quality then
				return true

			elseif self:GetQuality() == quality then
				if level > 20 then
					level = level + 2
				elseif level > 15 then
					level = level + 1
				end

				return self:GetLevel() > level
			end
		end
	end

	return false
end

function Battle:GetAbility(i)
	local abilities, levels = self:GetAbilities()

	if self:IsAlly() or self:IsPvE() then
		if i < 4 then
			local usable, cooldown = self:GetAbilityState(i)
			local requisite = not (cooldown or usable) and levels[i]
			local id = self:GetAbilityInfo(i) or abilities[i]

			return id, cooldown ~= 0 and cooldown, requisite, true
		end
	else
		local k = i % 3
		local casts = Addon.State.Casts[self.index]
		if not casts.id[k] and self:GetLevel() >= max(levels[i], levels[i+3] or 0) then
			return abilities[i]
		end

		if i < 4 then
			local id = casts.id[k] or abilities[i]
			local cooldown = select(4, Server.GetAbilityInfoByID(id)) or 0
			local requisite = self:GetLevel() < levels[i] and levels[i]
			local remaining = casts.turn[k] and (cooldown + casts.turn[k] - Addon.State.Turn) or 0

			return id, remaining > 0 and remaining, requisite, true
		end
	end
end

function Battle:IsAlly()
	return self.owner ~= ENEMY_PLAYER
end

function Battle:IsAlive()
	return self:GetHealth() > 0
end


--[[ General ]]--

function Battle:GetSpecie()
	return self:GetPetSpeciesID()
end

function Battle:GetModel()
	return self:GetDisplayID()
end

function Battle:GetQuality()
	return self:GetBreedQuality()
end

function Battle:GetType()
	return self:GetPetType()
end

function Battle:GetBreed()
	return LibStub('LibPetBreedInfo-1.0'):GetBreedByPetBattleSlot(self.owner, self.index)
end

function Battle:GetStats()
	return self:GetMaxHealth(), self:GetPower(), self:GetSpeed()
end


--[[ Metamagic ]]--

setmetatable(Battle, {__index = function(Battle, key)
	Battle[key] = Server[key] and function(self, ...)
		return Server[key](self.owner, self.index, ...)
	end or Specie[key]

	return rawget(Battle, key)
end}).__index = Battle