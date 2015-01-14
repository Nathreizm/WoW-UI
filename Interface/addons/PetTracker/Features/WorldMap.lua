--[[
Copyright 2012-2014 João Cardoso
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

local ADDON, Addon = ...
local Journal, Tamer = Addon.Journal, Addon.Tamer
local MapFrame, BlipParent = WorldMapDetailFrame, WorldMapButton
local FilterButton = WorldMapFrame.UIElementsFrame.TrackingOptionsButton.Button

local Map = Addon:NewModule('WorldMap', PetTrackerMapFilter)
local Tooltip = Addon.MapTip(WorldMapFrame)

local L = Addon.Locals
local SUGGESTIONS = {
	L.CommonSearches,
	LibStub('CustomSearch-1.0').NOT .. ' ' .. L.Maximized,
	'< ' .. ITEM_QUALITY2_DESC,
	ADDON_MISSING
}


--[[ Dropdown ]]--

do
	local function BlizzLine(drop, value, cvar, text, tip, visible)
		if visible then
			drop:AddLine {
				text = text, value = value,
				tooltipTitle = tip,
				checked = GetCVarBool(cvar),
				func = WorldMapTrackingOptionsDropDown_OnClick,
				keepShownOnClick = 1,
				isNotRadio = 1
			}
		end
	end

	local function CustomLine(drop, arg, text)
		drop:AddLine {
			text = text,
			func = function() Map:Toggle(arg) end,
			checked = Map:Active(arg),
			keepShownOnClick = 1,
			isNotRadio = 1
		}
	end

	FilterButton:SetScript('OnClick', function(button)
		SushiDropFrame:Toggle('TOPRIGHT', button:GetParent(), 'BOTTOM', 10, -15, true, function(drop)
			BlizzLine(drop, 'quests', 'questPOI', SHOW_QUEST_OBJECTIVES_ON_MAP_TEXT, OPTION_TOOLTIP_SHOW_QUEST_OBJECTIVES_ON_MAP, 1)
			BlizzLine(drop, 'bosses', 'showBosses', SHOW_BOSSES_ON_MAP_TEXT, OPTION_TOOLTIP_SHOW_BOSSES_ON_MAP, WorldMapFrame.hasBosses)
			BlizzLine(drop, 'digsites', 'digSites', ARCHAEOLOGY_SHOW_DIG_SITES, OPTION_TOOLTIP_SHOW_DIG_SITES_ON_MAP, select(3, GetProfessions()))
			BlizzLine(drop, 'tamers', 'showTamers', SHOW_BATTLE_PET_TAMERS_ON_MAP_TEXT, OPTION_TOOLTIP_SHOW_BATTLE_PET_TAMERS_ON_MAP, CanTrackBattlePets())
			CustomLine(drop, 'Species', L.ShowPets)
			CustomLine(drop, 'Stables', L.ShowStables)
		end)
	end)
end


--[[ Events ]]--

function Map:Startup()
	self:SetText(Addon.Sets.MapFilter or '')
	self:SetPoint('RIGHT', FilterButton, 'LEFT', 0, 1)
	self:SetFrameLevel(FilterButton:GetFrameLevel() - 1)
	self.Instructions:SetText(L.FilterPets)
	self.blips, self.tamers = {}, {}

	self:RegisterEvent('ZONE_CHANGED_NEW_AREA')
	self:SetScript('OnEvent', SetMapToCurrentZone)
	self:SetScript('OnTextChanged', self.FilterChanged)
	self:SetScript('OnShow', self.TrackingChanged)
	self:SetScript('OnUpdate', self.UpdateTip)
	self:SetScript('OnHide', self.HideTip)

	for i, text in ipairs(SUGGESTIONS) do
		local button = CreateFrame('Button', '$parentButton'..i, self.Suggestions, 'PetTrackerSuggestionButton')
		button:SetPoint('TOPLEFT', 18, -16*i + 7)
		button:SetText(text)

		if i == 1 then
			button:SetDisabledFontObject(GameFontNormalSmallLeft)
			button:Disable()
		end
	end
end

function Map:TrackingChanged()
	if self:IsVisible() then
		self:CacheTamers()
		self:UpdateBlips()
	end
end

function Map:FilterChanged()
	Addon.Sets.MapFilter = self:GetText()
	self.Instructions:SetShown(self:GetText() == '')
	self:TrackingChanged()
end


--[[ Blips ]]--

function Map:UpdateBlips()
	self:ColorTamers()
	self:ResetBlips()

	if self:Active('Species') then
		self:ShowSpecies()
	else
		self:ShowFilter(false)
	end

	if self:Active('Stables') then
		self:ShowStables()
	end
end

function Map:ShowFilter(show)
	self:SetAlpha(show and 1 or 0)
	self:EnableMouse(show)
end

function Map:ShowSpecies()
	local species = Journal:GetSpeciesIn(Addon.zone)
	
	for specie, floors in pairs(species) do
		local spots = floors[Addon.level]
		local specie = Addon.Specie:Get(specie)
			
		if spots and Addon:Filter(specie, Addon.Sets.MapFilter) then
			local icon = specie:GetTypeIcon()

			for x, y in gmatch(spots, '(%w%w)(%w%w)') do 
				local blip = Addon.SpecieBlip(BlipParent)
				blip.icon:SetTexture(icon)
				blip.specie = specie

				self:AddBlip(blip, x, y)
			end
		end
	end

	self:ShowFilter(next(species))
end

function Map:ShowStables()
	local stables = Journal:GetStablesIn(Addon.zone, Addon.level)

	for x, y in gmatch(stables, '(%w%w)(%w%w)') do    
		self:AddBlip(
			Addon.StableBlip(BlipParent), x, y)
	end
end

function Map:AddBlip(blip, x, y)
	local width, height = MapFrame:GetSize()
	local x = tonumber(x, 36) / 1000
	local y = tonumber(y, 36) / 1000

	blip:SetPoint('CENTER', MapFrame, 'TOPLEFT', x * width, -y * height)
	blip.x, blip.y = x, y
	blip:Show()

	tinsert(self.blips, blip)
end

function Map:ResetBlips()
	for _, blip in ipairs(self.blips) do
		blip:Release()
	end
	wipe(self.blips)
end


--[[ Tamers ]]--

function Map:CacheTamers()
	wipe(self.tamers)

	for i = 1, GetNumMapLandmarks() do
		local frame = _G['WorldMapFramePOI' .. i]
		if frame then
			self.tamers[frame] = Tamer:At(select(10, GetMapLandmarkInfo(i)))
			frame:SetScript('PreClick', self.ShowTamer)
		end
	end
end

function Map:ColorTamers()
	for frame, tamer in pairs(self.tamers) do
		frame.Texture:SetDesaturated(IsQuestFlaggedCompleted(tamer.quest))
	end
end

function Map:ShowTamer()
	local tamer = Map.tamers[self]
	if tamer then
		tamer:Display()
	end
end


--[[ Tooltip ]]--

function Map:UpdateTip()
	if WorldMapTooltip:IsVisible() or GameTooltip:IsVisible() then
		Tooltip:Hide()
	else
		Tooltip:Anchor(BlipParent, 'ANCHOR_CURSOR')

		for i, blip in ipairs(self.blips) do
			if blip:IsMouseOver() then
				local title, text = blip:GetTooltip()
				
				Tooltip:AddHeader(title)
				Tooltip:AddLine(text, 1,1,1)
			end
		end

		for frame, tamer in pairs(self.tamers) do
			if frame:IsMouseOver() then
				Tooltip:AddHeader(frame.name)
				Tooltip:AddLine(NORMAL_FONT_COLOR_CODE .. frame.description .. FONT_COLOR_CODE_CLOSE)

				for i, pet in ipairs(tamer) do
					local r,g,b = Addon:GetQualityColor(pet:GetQuality())
					local icon = format('|T%s:16:16:-3:0:128:256:60:100:130:170:255:255:255|t', Journal:GetTypeIcon(pet:GetSpecie()))

					Tooltip:AddLine(icon .. pet:GetName() .. ' (' .. pet:GetLevel() .. ')', r,g,b)
				end
			end
		end

		Tooltip:Display()
	end
end

function Map:HideTip()
	Tooltip:Hide()
end


--[[ Settings ]]--

function Map:Toggle(type)
	Addon.Sets['Hide'..type] = self:Active(type)
	self:UpdateBlips()
end

function Map:Active(type)
	return not Addon.Sets['Hide'..type]
end