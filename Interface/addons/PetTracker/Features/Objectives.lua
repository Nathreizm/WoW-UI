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

if IsAddOnLoaded('Carbonite.Quests') then
	return
end

local ADDON, Addon = ...
local Objectives = Addon:NewModule('Objectives', Addon.Tracker())
local Parent, HeaderButton = ObjectiveTrackerBlocksFrame, ObjectiveTrackerFrame.HeaderMenu

do
	OBJECTIVE_TRACKER_ADDONS = OBJECTIVE_TRACKER_ADDONS or {}
	tinsert(OBJECTIVE_TRACKER_ADDONS, 0)
	Objectives.Index = #OBJECTIVE_TRACKER_ADDONS
end


--[[ Events ]]--

function Objectives:Startup()
	local header = CreateFrame('Button', nil, self, 'ObjectiveTrackerHeaderTemplate')
	header:SetScript('OnClick', self.ToggleOptions)
	header.Text:SetText(Addon.Locals.BattlePets)
	header:SetPoint('TOPLEFT')
	header:Show()

	self.Anchor:SetPoint('TOPLEFT', header, 'BOTTOMLEFT', -4, -10)
	self.Anchor:SetScript('OnMouseDown', self.ToggleOptions)
	self:SetParent(Parent)
	self.Header = header

	hooksecurefunc('ObjectiveTracker_Update', function()
		local off = self:GetUsedHeight()
		local availableEntries = floor((Parent.maxHeight - off - 45) / 20)

		if availableEntries ~= self.maxEntries then
			self.maxEntries = availableEntries
			self:TrackingChanged()
		end

		self:SetPoint('TOPLEFT', Parent, -10, -off)
	end)

	HeaderButton:HookScript('OnHide', function()
		if self:IsShown() then
			HeaderButton:Show()
		end
	end)
end

function Objectives:TrackingChanged()
	self:Update()
	self:SetShown(not Addon.Sets.HideTracker and self.Anchor:IsShown())

	HeaderButton:SetShown(Parent.currentBlock or self:IsShown())
	OBJECTIVE_TRACKER_ADDONS[self.Index] = self:IsShown() and self:GetHeight() or 0
end


--[[ API ]]--

function Objectives:GetUsedHeight()
	local height = 0

	for i, mod in pairs(ObjectiveTrackerFrame.MODULES) do -- can't trust blizzard value
		if mod.lastBlock then
			local top, bottom = mod.Header:GetTop(), mod.lastBlock:GetBottom()
			if top and bottom then
				height = height + top - bottom + 15
			end
		end
	end

	for i = 1, self.Index-1 do
		height = height + OBJECTIVE_TRACKER_ADDONS[i]
	end

	return height
end