if select(2, UnitClass("player")) ~= "ROGUE" then return end
if not LibStub then return end

local ldb = LibStub:GetLibrary("LibDataBroker-1.1", true)
if not ldb then return end

local TrickOrTreat = TrickOrTreat

TrickOrTreat.LDB = ldb:NewDataObject("TrickOrTreat", {
	type = "data source",
	icon = "Interface\\Icons\\Ability_Rogue_TricksOftheTrade",
	label = "TrickOrTreat",
})

local function set_ldb_text(event)
	local text = ""
	if event == "TRICKS_APPLIED" then
		text = "|cffffd700Tricks on: " .. TrickOrTreat.ClassColor[select(2, UnitClass(TrickOrTreat.last_tricked))] .. TrickOrTreat.last_tricked .. "|r"
	elseif event == "TRICKS_EXPIRED" then
		text = "|cffffffff" .. TrickOrTreat.dmgCounter_self .. "|r/|cffffffff" .. TrickOrTreat.extra_dmg .. "|r" 
	elseif event == "NO_PARTY" then
		text = "|cffbbbbbbInactive|r"
	else
		text = "|cffffd700No Target|r"
	end

	TrickOrTreat.LDB.text = text
end

function TrickOrTreat.LDB.OnTooltipShow(tip)
	local actors = #TrickOrTreat.tracking
	tip:AddLine("TrickOrTreat")
	tip:AddLine("|cff8888eeExtra damage tracking|r")
	tip:AddLine(" ")
	if actors > 0 then 
		tip:AddDoubleLine("|cffff0033Target|r","|cffff0033Damage(#)|r")
		for k, v in ipairs(TrickOrTreat.tracking) do
			tip:AddDoubleLine(TrickOrTreat.tracking[k].name, TrickOrTreat.tracking[k].dmg .. "(" .. TrickOrTreat.tracking[k].n .. ")")
		end
		tip:AddLine(" ")
		tip:AddLine("Alt-click to reset data")
	else
		tip:AddLine("|cffbbbbbbNo saved data|r")
	end
end

function TrickOrTreat.LDB.OnClick(self, button)
	if IsAltKeyDown() and button == "LeftButton" then 
		TrickOrTreat:ClearActors()
	end
end

TrickOrTreat:RegisterCallback("TRICKS_APPLIED", function() set_ldb_text("TRICKS_APPLIED") end)
TrickOrTreat:RegisterCallback("TRICKS_EXPIRED", function() set_ldb_text("TRICKS_EXPIRED") end)
TrickOrTreat:RegisterCallback("NO_PARTY", function() set_ldb_text("NO_PARTY") end)
TrickOrTreat:RegisterCallback("NO_TARGET", function() set_ldb_text("NO_TARGET") end)
