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
local DarkYellow = PASSIVE_SPELL_FONT_COLOR
local Tracker = Addon:NewClass('Frame', 'Tracker', nil, Addon.List)
local Journal = Addon.Journal


--[[ Constructor ]]--

function Tracker:OnCreate()
	self:SetScript('OnShow', self.Update)
	self:SetScript('OnHide', self.Reset)

	self.Title = Addon.Line(self)
	self.Title.text:SetTextColor(DarkYellow.r, DarkYellow.g, DarkYellow.b)
	self.Title.text:SetText(Addon.Locals.BattlePets)

	self.Bar = Addon.ProgressBar(self)
	self.Bar:SetPoint('TOPLEFT', self.Title, 'BOTTOMLEFT', 0, -2)

	self.__super.OnCreate(self)
	self.Anchor = self.Bar
end


--[[ Display ]]--

function Tracker:Update()
	self:Reset()

	if self:IsVisible() then
		self:ShowSpecies()
	end
end

function Tracker:ShowSpecies()
	local progress = Journal:GetCurrentProgress()

	self.Title:SetShown(progress.total > 0)
	self.Bar:SetProgress(progress)

	for quality = 0, self:MaxQuality() do
		for level = 0, Addon.MaxLevel do
			for i, specie in ipairs(progress[quality][level] or {}) do
				self:AddSpecie(specie, quality, level)
			end
		end
	end
end


function Tracker:AddSpecie(specie, quality, level)
	local sourceIcon = Journal:GetSourceIcon(specie)
	if sourceIcon then
		local name, icon = Journal:GetInfo(specie)
		local r,g,b = self:GetColor(quality)
		
		local line = self:NewLine()
		line.text:SetText(name .. (level > 0 and format(' (%s)', level) or ''))
		line.text:SetWidth(self.Bar:GetWidth())
		line.subIcon:SetTexture(sourceIcon)
		line.icon:SetTexture(icon)
		line:SetScript('OnClick', function()
			Journal:Display(specie)
		end)

		line:SetScript('OnEnter', function()
			line.text:SetTextColor(r, g, b)
		end)

		line:SetScript('OnLeave', function()
			line.text:SetTextColor(r-.2, g-.2, b-.2)
		end)

		line:GetScript('OnLeave')(line)
	end
end


--[[ Settings ]]--

function Tracker:ShowOptions(title)
	UIDropDownMenu_AddButton {
		text = title,
		checked = not Addon.Sets.HideTracker,
		func = self.Toggle,
		isNotRadio = true
	}

	UIDropDownMenu_AddButton {
		text = Addon.Locals.CapturedPets,
		checked = Addon.Sets.CapturedPets,
		isNotRadio = true,
		func = function()
			Addon.Sets.CapturedPets = not Addon.Sets.CapturedPets

			for i, tracker in ipairs(self.usedFrames) do
				tracker:Update()
			end

			WatchFrame_Update()
		end
	}
end

function Tracker:Toggle()
	Addon.Sets.HideTracker = not Addon.Sets.HideTracker
	WatchFrame_Update()
end

function Tracker:MaxQuality()
	return Addon.Sets.CapturedPets and Addon.MaxQuality or 0
end

function Tracker:GetColor(quality)
	if Addon.Sets.CapturedPets then
		return Addon:GetQualityColor(quality)
	end
	return 1,1,1
end