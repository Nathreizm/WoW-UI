local Addon = PetTracker
local Tabs = LibStub('SecureTabs-1.0')
local Journal = PetTrackerTamerJournal


--[[ Events ]]--

function Journal:Startup()
	self.Slots = PetTracker.JournalSlot:CreateLine('TOP', self.RightInset, 0, 104)
	self.SearchBox:SetText(PetTracker_Sets.TamerSearch or SEARCH)
	self.SearchBox:SetScript('OnTextChanged', self.OnSearch)
	self.Count.Number:SetText(#PetTracker_Tamers)
	self.Startup = nil

	HybridScrollFrame_CreateButtons(self.List, 'PetTrackerTamerButton', 44, 0)
	self.List.scrollBar.doNotHide = true
	self:Display(Addon.Tamer:Get(1))
	self:SetScript('OnShow', nil)

	hooksecurefunc('PetJournalParent_UpdateSelectedTab', function(...)
		Tabs:Update(...)
	end)
end

function Journal:OnSearch()
	PetTracker_Sets.TamerSearch = self:GetText() ~= SEARCH and self:GetText() or nil
	self:GetParent().List:update()
end


--[[ Redraw ]]--

function Journal.List:update()
	local self = Journal.List
	local off = HybridScrollFrame_GetOffset(self)
	local tamers = {}

	for id in pairs(PetTracker_Tamers) do
		local tamer = Addon.Tamer:Get(id)
		if Addon:Filter(tamer, PetTracker_Sets.TamerSearch) then
			tinsert(tamers, tamer)
		end
	end

	for i, button in ipairs(self.buttons) do
		local tamer = tamers[i + off]

		if tamer then
			button.name:SetText(tamer.name)
			button.model:SetDisplayInfo(tamer.model)
			button.model.level:SetText(tamer:GetLevel())
			button.petTypeIcon:SetTexture(Addon:GetTypeIcon(tamer:GetType()))
			button.model.quality:SetVertexColor(Addon:GetQualityColor(tamer:GetQuality()))
			button.selectedTexture:SetShown(tamer.name == self.selected)
		end

		button:SetShown(tamer)
		button.tamer = tamer
	end

	HybridScrollFrame_Update(self, #tamers * 46, self:GetHeight())
end

function Journal:Display(tamer)
	for i, slot in ipairs(self.Slots) do
		slot:Display(tamer[i])
	end

	self.Card:Display(tamer)
	self.List.selected = tamer.name
	self.List:update()
end

function Journal.Card:Display(tamer)
	self.model:SetRotation(.3)
	self.name:SetText(tamer.name)
	self.model:SetDisplayInfo(tamer.model)
	self.daily:SetText(IsQuestFlaggedCompleted(tamer.quest) and '|cffff0000Completed|r' or '|cff00ff00Available|r')
	self.money:SetText(tamer.money > 0 and ('Daily Rewards: ' .. GetCoinTextureString(tamer.money)) or '')

	for i, slot in ipairs(self) do
		slot:Hide()
	end

	for i, loot in pairs(tamer:GetRewards()) do
		local slot = self[i] or CreateFrame('Button', '$parentLoot' .. i, self, 'PetTrackerTamerLoot')
		slot:SetPoint('TOPRIGHT', -55 + 45 * (i % 2), 10 - 45 * ceil(i/2))
		slot.icon:SetTexture(loot.icon)
		slot.count:SetText(loot.count)
		slot.count:Show()
		slot:Show()

		slot.link = loot.link
		self[i] = slot
	end
end


--[[ Start this Baby ]]--

Tabs:Startup(PetJournalParent, MountJournal, PetJournal)
Tabs:Add(PetJournalParent, Journal, 'Tamers')
Journal:SetScript('OnShow', Journal.Startup)