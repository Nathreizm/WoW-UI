local _, Addon = ...
local Breeds = LibStub('LibPetBreedInfo-1.0')
local Pet = setmetatable(Addon:NewModule('TamerPet'), Addon.Specie)
local Tamer = Addon:NewModule('Tamer')

Tamer.__index = Tamer
Pet.__index = Pet


--[[ Tamer ]]--

function Tamer:At(location)
	return self:Get(PetTracker_TamerLocations[location])
end

function Tamer:Get(id)
	local data = PetTracker_Tamers[id]
	if data then
		local name, model, quest, money, items, currencies, pets = data:match('^([^:]+):(%w%w%w%w)(%w%w%w)(%w%w%w)([^:]*):([^:]*):(.*)$')
		local tamer = setmetatable({
			name = name, items = items, currencies = currencies,
			money = tonumber(money, 36) * 100,
			quest = tonumber(quest, 36),
			model = tonumber(model, 36)
		}, self)

		for name, model, specie, level, quality in pets:gmatch('([^:]+):(%w%w%w%w)(%w%w%w)(%w)(%w)') do
			tinsert(tamer, setmetatable({
				Name = name,
				Model = tonumber(model, 36),
				Specie = tonumber(specie, 36),
				Level = tonumber(level, 36),
				Quality = tonumber(quality, 36)
			}, Pet))
		end

		return tamer
	end
end

function Tamer:GetRewards()
	local rewards = {}

	for item, count in self.items:gmatch('(%w%w%w%w)(%w)') do
		local id = tonumber(item, 36)

		tinsert(rewards, {
			icon = GetItemIcon(id),
			link = select(2, GetItemInfo(id)),
			count = tonumber(count, 36)
		})
	end

	for currency, count in self.currencies:gmatch('(%w%w)(%w)') do
		local id = tonumber(currency, 36)

		tinsert(rewards, {
			link = GetCurrencyLink(id),
			icon = select(3, GetCurrencyInfo(id)),
			count = tonumber(count, 36)
		})
	end

	return rewards
end

function Tamer:GetType()
	local list = {}
	for i, pet in ipairs(self) do
		local family = pet:GetType()
		if list[family] then
			return family
		elseif family then
			list[family] = true
		end
	end
end

function Tamer:GetAbstract()
	local text = self.name
	for i, pet in ipairs(self) do
		text = strjoin(' ', text, pet:GetName(), pet:GetTypeName())
	end

	return text
end

for _, key in pairs {'Level', 'Quality'} do
	Tamer['Get' .. key] = function(self)
		local value = 0
		for i, pet in ipairs(self) do
			value = value + pet['Get' .. key](pet)
		end

		return floor(value / #self + .5)
	end
end


--[[ Pets ]]--

for _, key in pairs {'Name', 'Specie', 'Model', 'Level', 'Quality'} do
	Pet['Get' .. key] = function(self)
		return self[key]
	end
end

function Pet:GetStats()
	return Breeds:GetPetPredictedStats(self.Specie, self:GetBreed(), self.Quality, self.Level)
end

function Pet:GetBreed()
	return Breeds:GetAvailableBreeds(self.Specie)[1]
end

function Pet:GetAbility(i)
	local ids = self:GetAbilities()
	for _, id in pairs(ids) do
		i = i - 1
		if i == 0 then
			return id, nil, nil, true
		end
	end
end