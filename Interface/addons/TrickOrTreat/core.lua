--[[
Name: TreatOrTreat
Revision: 2.5.5
Author(s): falconindy, tuxedobob, initial 4.0 fixes and ongoing support by sp00n
Description: Warnings for targets and recipient rogues of Tricks of the Trade.
Inspired by: SimpleMD and Misdrection Helper
	]]--

--[[ Addon Declaration/Namespace ]]--
TrickOrTreat = LibStub("AceAddon-3.0"):NewAddon("TrickOrTreat", "AceEvent-3.0", "AceConsole-3.0", "LibSink-2.0")
local addon = TrickOrTreat
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceConfig = LibStub("AceConfig-3.0")
local callbacks = LibStub("CallbackHandler-1.0"):New(TrickOrTreat)
local LSM = LibStub("LibSharedMedia-3.0")

addon.ClassColor = {
	["DEATHKNIGHT"]		= "|cffc41f3b",
	["DRUID"]			= "|cffff7d0a",
	["HUNTER"]			= "|cffabd473",
	["MAGE"]			= "|cff69ccf0",
	["MONK"]			= "|cff00ff96",
	["PALADIN"]			= "|cfff58cba",
	["PRIEST"]			= "|cffffffff",
	["ROGUE"]			= "|cfffff569",
	["SHAMAN"]			= "|cff2459ff",
	["WARLOCK"]			= "|cff9482c9",
	["WARRIOR"]			= "|cffc79c6e",
}

local UnitDetailedThreatSituation = _G.UnitDetailedThreatSituation
local UnitExists = _G.UnitExists
local mfloor = math.floor
local tinsert = tinsert
local pairs = pairs
local ipairs = ipairs

local damageMod = 1.15 -- for now; we'll check for actual value later
local pName = UnitName("player")

local function triggerEvent(...)
	callbacks:Fire(...)
end

LSM:Register("sound", "Ding", [[Sound\Spells\SimonGame_Visual_GameTick.ogg]])
LSM:Register("sound", "ToT: Klaxon", [[Interface\AddOns\TrickOrTreat\sounds\klaxon.mp3]])


--COOLDOWN BLOCK START

function addon:CheckCooldowns()
	if not warned then warned=1 end
		-- start is the value of GetTime() at the point the spell began cooling down
	-- duration is the total duration of the cooldown, NOT the remaining
	local start, duration, enable = GetSpellCooldown(57934) -- FEINT: 1966 TRICKS: 57934
	if start and duration then -- the spell is on cooldown
		local getTime = GetTime()
		
		-- start + duration gives us the value of GetTime() at the point when the cd will end
		-- the time when the cd ends (a time in the future) minus the current time gives us the remaining duration on the cooldown
		local remainingCD = start + duration - getTime
		
		-- if we're on cooldown and the total cooldown is greater than 2 seconds
		-- this filters out global cooldown spells or spells whose cds are otherwise irrelevant
		if remainingCD > 28  and duration > 2 then -- CHANGE REMAINING TO 27 FOR TRICKS
			-- we should show cooldown information for our spell
			warned = 0
		end
		if (remainingCD <= self.db.profile.cdwarntime) or (not start) then
			if warned == 0 then
				addon:FireWarnings()
			end
			warned = 1
		end
	end
	if (not start) and (warned == 0) then -- if cdtime is 0, above won't fire; start is nil
		addon:FireWarnings()
		warned = 1
	end
end

function addon:FireWarnings() --fire warning shot?
	-- ***************************************
	-- ******* REAL WARNINGS GO HERE *********
	-- ***************************************
	if self.db.profile.cdwarn then --cdwarn is bool
		if self.db.profile.cdprint then
			self:Print("Tricks is Ready!")
		end
		if self.db.profile.cdpour then
			self:Pour("Tricks is Ready!")
		end
		if self.db.profile.cdsound then
			if self.db.profile.cdmaster then
				PlaySoundFile(LSM:Fetch("sound", self.db.profile.cdsoundfile), "Master")
			else
				PlaySoundFile(LSM:Fetch("sound", self.db.profile.cdsoundfile))
			end
		end
	end
end

local f = CreateFrame('Frame')
local last = 0 -- the time since we last checked cooldowns (don't change this value)
local throttle = .25 -- check every .25 seconds
local warned = 1
if (select(2, UnitClass("player")) == "ROGUE") then
	f:SetScript('OnUpdate', function(f, elapsed)
		last = last + elapsed
		if last >= throttle then
			addon:CheckCooldowns()
			last = 0 -- reset time since we last checked
		end
	end)
end

   --COOLDOWN BLOCK END


--[[ Addon Methods ]]--
function addon:OnInitialize()
	self:SetSinkStorage({ ["sink20OutputSink"] = "RaidWarning" })

	self.db = LibStub("AceDB-3.0"):New("ToTDB", self.defaults, "Default")

	self:RegisterChatCommand("tot", function() AceConfigDialog:Open("TrickOrTreat") end )
	self:RegisterChatCommand("trickortreat", function() AceConfigDialog:Open("TrickOrTreat") end )
	self:RegisterChatCommand("totdebug", function() self:Debug() end)
	
	local optFrame = AceConfigDialog:AddToBlizOptions("TrickOrTreat", "TrickOrTreat")
	self.options.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	AceConfig:RegisterOptionsTable("TrickOrTreat", self.options)
end

function addon:OnEnable()
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "CheckForParty")
	self:RegisterEvent("RAID_ROSTER_UPDATE", "CheckForParty")
	self:RegisterEvent("PARTY_MEMBERS_CHANGED", "CheckForParty")
	self:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED", "CheckForTricksGlyph")
	self:RegisterEvent("GLYPH_ADDED", "CheckForTricksGlyph")
	self:RegisterEvent("GLYPH_REMOVED", "CheckForTricksGlyph")
--	self:RegisterEvent("GLYPH_UPDATED", "CheckForTricksGlyph") --Talent group covers this
	
	self:RegisterEvent("PLAYER_REGEN_DISABLED", function() --[[ self:ClearActors() ]] end) --on entering combat, clear table
	self:RegisterEvent("PLAYER_REGEN_ENABLED", function() --[[self:ReportActors("ALL") ]] end) --on leaving combat, print table
	
	self.dmgCounter_self = 0
	self.dmgCounter_target = 0
	self.extra_dmg = 0
	self.parse_dmg_self = false
	self.parse_dmg_target = false
	self.last_tricked = nil
	
	self.tracking = self.tracking or {}
	
	triggerEvent("NO_TARGET")
end

function addon:Debug()
	local name = ''
	local spellId = 1
	local x = 1
	name,_,_,_,_,_,_,_,_,_,spellId = UnitBuff("player",x)
	while (spellId)	do
		self:Print(spellId.." "..name)
		x=x+1
		name,_,_,_,_,_,_,_,_,_,spellId = UnitBuff("player",x)
	end
		self:FireWarnings()
end

function addon:CheckForTricksGlyph(event)
	--Checks to see if Tricks of the Trade glyph is active. If so, changes damageMod to 1.0 (no bonus in MOP)
	--Major glyph sockets are IDs 1, 4, and 6. Well, at least they were during Cata
	--Active glyph spellID is 63256
	--http://www.wowpedia.org/API_GetGlyphSocketInfo
	local tricksGlyphActive = 0
	local spellID = 0
	for i = 1, NUM_GLYPH_SLOTS do
		spellID = select(4, GetGlyphSocketInfo(i))
		if (spellID==63256) then
			tricksGlyphActive = 1
		end
	end
--	local spellID = select(4, GetGlyphSocketInfo(1))	
--	if (spellID==63256) then
--		tricksGlyphActive = 1
--	end
--	spellID = select(4, GetGlyphSocketInfo(4))
--	if (spellID==63256) then
--		tricksGlyphActive = 1
--	end
--	spellID = select(4, GetGlyphSocketInfo(6))
--	if (spellID==63256) then
--		tricksGlyphActive = 1
--	end
	if (tricksGlyphActive>0) then
		damageMod = 1.0
	else
		damageMod = 1.15
	end
	
--	self:Print(tricksGlyphActive.."    "..damageMod.."    "..event.."    "..1.15) --DEBUG
	return damageMod
end

function addon:CheckForParty(event) --only enable CLEU handler in a group
	if (GetNumGroupMembers() > 0) then
		self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		triggerEvent("NO_TARGET")
	else
		self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		self.last_tricked = nil
	end
	if (event=="PLAYER_ENTERING_WORLD") then --Let's make sure we start with the right number
		self:CheckForTricksGlyph(event)
	end
end

--[[ Actor Tracking 
tracking = {	--table layout
	{
		name = <actor name>,
		n = <num tricks>,
		dmg = <total dmg>,
	},
	...
}
]]--
do
	local function getActorID(actor)
		if #addon.tracking == 0 then return 0 end
		for k,v in ipairs(addon.tracking) do
			if v.name == actor then
				return k
			end
		end
		return 0
	end

	function addon:AddActor(actor, damage)
		id = getActorID(actor)
		if id > 0 then
			self.tracking[id].n = self.tracking[id].n + 1
			self.tracking[id].dmg = self.tracking[id].dmg + damage
		else
			tinsert(self.tracking, {name = actor, n = 1, dmg = damage})
		end
	end

	function addon:ClearActors()
		if #self.tracking == 0 then return end
		self:Print("Resetting saved actor data.")
		for k in ipairs(self.tracking) do
			self.tracking[k] = nil
		end
	end

	function addon:ReportActors(method, actor)
		if #self.tracking == 0 then return end
		if method == "ALL" then
			self:Print("Extra damage by actor:")
			for _,v in pairs(self.tracking) do
				print(v.name, ":", v.dmg, "(" .. v.n .. ")")
			end
		elseif method == "TARGET" then
			SendChatMessage("Tricks has granted you " .. self.tracking[actor].dmg .. " extra damage.", "WHISPER", nil, actor)
		end
	end
end

do
	local function AddDamage(counter, damage, overkill)
		if not damage then damage = 0 end
		if not overkill then overkill = 0 end
		return counter + damage - overkill
	end
	
	local function ClearCounters()
		addon.dmgCounter_self = 0
		addon.dmgCounter_target = 0
	end
	
	function addon:COMBAT_LOG_EVENT_UNFILTERED(event, timestamp, eventType, hideCaster, srcGUID, sourceName, srcFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID, spellName, spellSchool, ...)
		-- Search for tricks casts and track damage while tricks is active
		-- http://www.wowpedia.org/API_COMBAT_LOG_EVENT
	
		if spellID == 57934 and sourceName == pName then --primer applied
			if eventType == "SPELL_CAST_SUCCESS" then
				self.last_tricked = destName
				self.parse_dmg_self = true
				
				-- /script DEFAULT_CHAT_FRAME:AddMessage("\124cff71d5ff\124Hspell:57934\124h[Tricks of the Trade]\124h\124r");
				-- local tottmsg = "|cffff6600[Trick or Treat] |cffffffffon " .. addon.ClassColor[select(2, UnitClass(destName))] .. destName .. "|r"
				
				local tottmsg = "\124cff71d5ff\124Hspell:57934\124h[Tricks of the Trade]\124h\124r on " .. addon.ClassColor[select(2, UnitClass(destName))] .. destName
				self:Pour(tottmsg)
				self:Print(tottmsg)
				triggerEvent("TRICKS_APPLIED")
				ClearCounters()
			elseif eventType == "SPELL_AURA_REMOVED" and self.dmgCounter_self == 0 then
				triggerEvent("NO_TARGET")
			end
		elseif spellID == 57933 then --transferring threat
			if eventType == "SPELL_AURA_APPLIED" and sourceName == pName then
				self.parse_dmg_target = true
				local themessage = self.db.profile.warningmsg
				if self.db.profile.threatwarn and UnitExists("target") then --to avoid issues when Tricking with FoK and no target
					local isTanking,_,threatpct,_,threatvalue = UnitDetailedThreatSituation(destName, "target");
					if threatvalue == nil then threatvalue, threatpct = 0, 0 end
					local rawtotank = threatvalue * (100 / threatpct - 1)
					if not isTanking and (threatpct > self.db.profile.threatpercent or rawtotank <= self.db.profile.threatraw) then
						threatpct = tostring(mfloor(threatpct))
						themessage = themessage .. " Careful! You're at " .. threatpct.."% threat on " .. UnitName("target") .. "."
					end
				end
				if self.db.profile.targetwarn then 
					if (self.db.profile.ignoretanks == false or UnitGroupRolesAssigned(destName) ~= "TANK") then 
							SendChatMessage(themessage, "WHISPER", nil, destName)
					end
				end
				--CHANNEL WARN TRICKS ON
				if self.db.profile.channelwarn then
					local themessage = pName .. " has used Tricks on " .. destName .. "."
					local channelname = self.db.profile.channelname
					local id, name = GetChannelName(channelname)
					if (id > 0) then
						SendChatMessage(themessage, "CHANNEL", nil, id)
					end
				end
				--END CHANNEL WARN
			elseif eventType == "SPELL_AURA_APPLIED" and destName == pName and self.db.profile.selfwarn then --tricks applied to you
				self:Pour(sourceName.." tricked you!")
				if self.db.profile.usemasterchannel then
					PlaySoundFile("Interface\\AddOns\\TrickOrTreat\\sounds\\alert.mp3", "Master")
				else
					PlaySoundFile("Interface\\AddOns\\TrickOrTreat\\sounds\\alert.mp3", "SFX")
				end					
			elseif eventType == "SPELL_AURA_REMOVED" and sourceName == pName and destName == self.last_tricked then --threat transfer expired
				self.extra_dmg = mfloor(self.dmgCounter_target - self.dmgCounter_target/damageMod)
				if self.db.profile.selfreport then self:Print(self.dmgCounter_self.." damage dealt during Tricks. Target did "..self.extra_dmg.." extra.") end
				if self.db.profile.targetreport then
				 	if (self.db.profile.ignoretanks == false or UnitGroupRolesAssigned(destName) ~= "TANK") then 
						SendChatMessage("Tricks gave you " .. self.extra_dmg .. " extra damage.", "WHISPER", nil, self.last_tricked)
					end
				end
				--CHANNEL WARN TRICKS OFF
				if self.db.profile.channelwarn then
					local themessage = pName .. "'s Tricks has ended on " .. destName .. "."
					if self.db.profile.channeldamage then
						themessage = themessage .. " " .. destName .. " did " .. self.extra_dmg .. " extra damage."
					end
					local channelname = self.db.profile.channelname
					local id, name = GetChannelName(channelname)
					if (id > 0) then
						SendChatMessage(themessage, "CHANNEL", nil, id)
					end
				end
				--END CHANNEL WARN
				
				self:AddActor(self.last_tricked, self.extra_dmg)
				
				self.parse_dmg_target = false
				self.parse_dmg_self = false
				triggerEvent("TRICKS_EXPIRED")
			end
		end

		--damage accrual
		if self.parse_dmg_self then
			if sourceName == pName then
				if eventType == "SWING_DAMAGE" then
					--For SWING_DAMAGE, spellID = amount and spellName = overkill
					self.dmgCounter_self = AddDamage(self.dmgCounter_self, spellID, spellName)
				elseif (eventType == "SPELL_DAMAGE" or eventType == "SPELL_PERIODIC_DAMAGE" or eventType == "RANGE_DAMAGE") then
					local amount, overkill = select(1, ...) --UPDATE
					self.dmgCounter_self = AddDamage(self.dmgCounter_self, amount, overkill)
				end
			end
		end

		if self.parse_dmg_target then
			if sourceName == self.last_tricked then
				if eventType == "SWING_DAMAGE" then
					--For SWING_DAMAGE, spellID = amount and spellName = overkill
					self.dmgCounter_target = AddDamage(self.dmgCounter_target, spellID, spellName)
				elseif (eventType == "SPELL_DAMAGE" or eventType == "SPELL_PERIODIC_DAMAGE" or eventType == "RANGE_DAMAGE") then
					local amount, overkill = select(1, ...)
					self.dmgCounter_target = AddDamage(self.dmgCounter_target, amount, overkill)
				end
			end
		end

	end
end

--[[ Relevant SpellIDs (dummy reference ftw)
>tricks cast on target
SPELL_CAST_SUCCESS 57934 player target => used to detect player casting on other (primer)
SPELL_AURA_APPLIED 57934 player player 

>transferring threat
SPELL_AURA_REMOVED 57934 player player => if self damage is 0 when this fires, the following events don't happen
SPELL_AURA_APPLIED 57933 player target => alert is sent to primered target, or player is alerted if a rogue tricks the player
SPELL_AURA_APPLIED 59628 player player 

expiration
SPELL_AURA_REMOVED 59628 player player 
SPELL_AURA_REMOVED 57933 player target => followup tell is sent with damage report
 	]]