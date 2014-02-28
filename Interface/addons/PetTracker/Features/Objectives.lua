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
local Objectives = Addon:NewModule('Objectives', Addon.Tracker())

function Objectives:Startup()
	WatchFrame_AddObjectiveHandler(function(parent, anchor, _, width)
		if Addon.Sets.HideTracker then
			self:Hide()
		else
			self:SetParent(parent)
			self:DisplayAt(anchor, width)
			self:Show()
		end
		
		return self:Last() or anchor, 0, self:Count(), 0
	end)

	hooksecurefunc(WatchFrameHeaderDropDown, 'initialize', function()
		self:ShowOptions(Addon.Locals.BattlePets)
	end)
end

function Objectives:TrackingChanged()
	self:Update()
	WatchFrame_Update()
end

function Objectives:DisplayAt(anchor, width)
	local point = anchor and 'BOTTOMLEFT' or 'TOPLEFT'
	local at = anchor or self:GetParent()
	
	self.Title:SetPoint('TOPLEFT', at, point, 2, -4)
	self.Bar:SetWidth(width - 5)
end