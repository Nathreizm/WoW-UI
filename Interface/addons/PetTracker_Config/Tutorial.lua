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

local Addon = PetTracker
local Tutorial = Addon:NewModule('Tutorial')
local Lib = LibStub('CustomTutorials-2.1')
local L = Addon.Locals

Lib.RegisterTutorials(Addon, {
	savedvariable = 'PetTracker_Tutorial',
	title = 'PetTracker',
	
	{
		text = L.Tutorial[1],
		image = 'Interface\\Addons\\PetTracker\\Art\\Pets',
		point = 'Center'
	},
	{
		text = L.Tutorial[2],
		point = 'TOPRIGHT', relPoint = 'TOPLEFT',
		image = 'Interface\\Addons\\PetTracker\\Art\\Tracker',
		shineRight = 2, shineLeft = -14,
		shineTop = 6, shineBottom = 50,
		anchor = WatchFrame,
		shine = WatchFrame,
		x = -10
	},
	{
		text = L.Tutorial[3],
		point = 'TOPRIGHT', relPoint = 'TOPLEFT',
		shineTop = 11, shineBottom = -8,
		shineRight = 6, shineLeft = -12,
		shine = WatchFrameHeader,
		anchor = WatchFrame,
		x = -10
	},
	{
		text = L.Tutorial[4],
		point = 'TOPRIGHT', relPoint = 'TOPLEFT',
		shineRight = 6, shineLeft = 2,
		anchor = MiniMapWorldMapButton,
		shine = MiniMapWorldMapButton,
		y = -10
	},
	{
		text = L.Tutorial[5],
		point = 'BOTTOM', relPoint = 'TOP',
		shineRight = -12, shineLeft = 12,
		shineTop = 2, shineBottom = 2,
		shine = WorldMapShowDropDown,
		anchor = WorldMapShowDropDown,
		y = 5
	},
	{
		text = L.Tutorial[6],
		image = 'Interface\\Addons\\PetTracker\\Art\\Filters',
		point = 'LEFT', relPoint = 'RIGHT',
		shineTop = 6, shineBottom = -6,
		shineRight = 6, shineLeft = -12,
		shine = PetTrackerMapFilter,
		anchor = WorldMapFrame,
		height = 180,
		x = 15
	},
	{
		text = L.Tutorial[7],
		image = 'Interface\\Addons\\PetTracker\\Art\\Filters',
		point = 'LEFT', relPoint = 'RIGHT',
		shineTop = 6, shineBottom = -6,
		shineRight = 6, shineLeft = -12,
		shine = PetTrackerMapFilter,
		anchor = WorldMapFrame,
		height = 180,
		x = 15
	},
	{
		text = L.Tutorial[8],
		image = 'Interface\\Addons\\PetTracker\\Art\\Pets',
		point = 'Center',

		shine = MainMenuMicroButton,
		shineTop = -18, shineBottom, -6,
		shineRight = 3, shineLeft = -3
	},
})

WorldMapFrame:HookScript('OnShow', function()
	Tutorial:End()
end)

function Tutorial:Start()
	Lib.TriggerTutorial(Addon, 4)
end

function Tutorial:End()
	Lib.TriggerTutorial(Addon, 8)
end

function Tutorial:Restart()
	Lib.ResetTutorials(Addon)
	self:Start()
end

Tutorial:Start()