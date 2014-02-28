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
local ActionBar = PetBattleFrame.BottomFrame
local Actions = Addon:NewModule('EnemyActions', CreateFrame('CheckButton', nil, ActionBar))

local Ability = Addon.AbilityAction
local Pets = Addon.Battle

local Enemy = LE_BATTLE_PET_ENEMY
local Player = LE_BATTLE_PET_ALLY


--[[ Startup ]]--

function Actions:Startup()
	self:SetPoint('BOTTOM', ActionBar, 'TOP')
	self:SetSize(300, 100)
	self:SetScale(.8)
	
	self:RegisterEvent('PET_BATTLE_PET_CHANGED')
	self:RegisterEvent('PET_BATTLE_PET_ROUND_PLAYBACK_COMPLETE')
	self:SetScript('OnEvent', self.Update)

	self:SetHook('PetBattlePetSelectionFrame_Hide', self.Show)
	self:SetHook('PetBattlePetSelectionFrame_Show', self.Hide)
	self:SetScript('OnShow', self.Update)
	
	for i = 1, 6 do
		self:CreateButton(i)
	end
end

function Actions:SetHook(target, hook)
	hooksecurefunc(target, function()
		hook(self)
	end)
end

function Actions:CreateButton(i)
	local y = floor((i-1) / 3)
	local x = (i-1) % 3 + 1

	local button = Ability(self)
	button:SetPoint('LEFT', (button:GetWidth() + 5) * x, y * button:GetHeight())
	button:SetHighlightTexture(nil)
	button:SetPushedTexture(nil)
	button:UnregisterAllEvents()
	button:SetFrameLevel(5-y)
	
	self[i] = button
end


--[[ Update ]]--

function Actions:Update()
	local enemy = Pets:GetCurrent(Enemy)
	local target = Pets:GetCurrent(Player):GetType()
	
	for i = 1, 6 do
		self[i]:Display(enemy, i, target)
	end
end