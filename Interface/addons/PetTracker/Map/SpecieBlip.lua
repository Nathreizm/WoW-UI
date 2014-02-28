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
local Blip = Addon:NewClass(nil, 'SpecieBlip', nil, Addon.Blip)

local InlineTexture = '|T%s:%d:%d:-2:0|t'
local Journal = Addon.Journal


--[[ Overrides ]]--

function Blip:OnCreate()
	local border = self:CreateTexture(nil, 'BORDER')
	border:SetTexture('Interface/Minimap/UI-Minimap-TargetOverlay')
	border:SetPoint('CENTER', .3, .3)
	border:SetTexCoord(1, .5, 1, 0)
	border:SetSize(28, 28)

	self.__super.OnCreate(self)
	self.icon:SetTexCoord(0.79687500, 0.49218750, 0.50390625, 0.65625000)
	self.border = border
	self:SetSize(13, 13)
end

function Blip:ShowJournal()
	HideUIPanel(WorldMapFrame)
	self.specie:Display()
end

function Blip:GetTooltip()
	local name, icon, _,_, source = self.specie:GetInfo()
	local comments = self.specie:IsSpecial() and '|n|n|cff20ff20Uncommon Abilities|r' or ''
	local title = InlineTexture:format(icon, 20, 20) .. name
	
	return title, Addon:KeepShort(source) .. comments
end