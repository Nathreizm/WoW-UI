




-------------------------------------------------------------------------------

------ 1. Introduction ------


-- You probably opened this file to edit the warnings.
-- To do that, go to part 7. Raid Warnings, and follow the instructions there.


-------------------------------------------------------------------------------







------ 2. The map ------

--http://www.wowpedia.org/File:WorldMap-DragonSoul2.jpg?c=1




 
------ 3. Effects of letting the respective ooze hit the boss on 10/25 NORMAL and 10/25 HEROIC ------

--Yellow: Enrage of boss basically - uses abilities twice as often + 50% inc attack speed
	--Also void bolt hits all (...) targets instead of just tank, no need to spread
--Blue: Mana Void spawns, which leeches mana from all casters/healers, this mana void should be killed asap to get mana back to all.
--Red: 3 random targets get fire damage, further they are from the boss the greater the damage, therefore should stack on boss
--Black: Adds spawn (Forgotten ones) and should be dpsd down. Stack and AoE if possible.
--Green: Acid damage to player and nearby allies within 4 yds
--Purple: Deep corruption spreads to every player, causes every 5th healing/absorb cast on a player to trigger 50000 damage to all players
 
 



------ 4. Differences of raid finder mode compared to normal ------

--Damage from green ooze DOES NOT HIT NEARBY TARGETS, so no need to spread at green.





------ 5. The six possible combinations, with their spell ID's, for RF/NORMAL and HEROIC ------

--local oozeColors = {
	--[105420] = RF/NORMAL { L.Purple, L.Green, L.Blue }, HEROIC { L.Purple, L.Green, L.Blue, L.Black }
	--[105435] = RF/NORMAL { L.Green, L.Red, L.Black }, HEROIC { L.Green, L.Red, L.Black, L.Blue }
	--[105436] = RF/NORMAL { L.Green, L.Yellow, L.Red }, HEROIC { L.Green, L.Yellow, L.Red, L.Black }
	--[105437] = RF/NORMAL { L.Blue, L.Purple, L.Yellow }, HEROIC { L.Blue, L.Purple, L.Yellow, L.Green }
	--[105439] = RF/NORMAL { L.Blue, L.Black, L.Yellow }, HEROIC { L.Blue, L.Black, L.Yellow, L.Purple }
	--[105440] = RF/NORMAL { L.Purple, L.Red, L.Black }, HEROIC { L.Purple, L.Red, L.Black, L. Yellow } 
	--[105441] = { L.Red, L.Red, L.Red }, NOT USED




	
------ 6. Suggestions for 10 man normal ------

-- if Blue + Purple + X, then kill X
-- otherwise prio order Purple > Green > Yellow > Blue > Red/Black


	
	

local frame = CreateFrame("FRAME");
frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")



function frame:TEST_YS(event, ...)

	if (time()-YORelapsed)>20 then
	
	local spellID = select(5,...)

	
	


----- 7. Raid Warnings -----



---- !!INSTRUCTIONS!! ----


---- OVERVIEW ----

-- The below paragraphs 7.1 to 7.6 each contain one of the 6 possible combinations of oozes. 
-- Each paragraph contains the raid warnings for all 3 difficulties: raid finder, normal and heroic.


---- CHANGING THE TEXT OF THE RAID WARNING ----

-- To change warnings, find the corrent combination, and find the 4 lines right below the correct difficulty.
-- *Changing which ooze you want in your kill-RaidWarning: change ("Kill X!", "RAID_WARNING"); to ("Kill Y!", "RAID_WARNING");
-- *Changing the suggestion you want in your RaidWarning: change ("afterwards X", "RAID_WARNING"); to change ("afterwards Y", "RAID_WARNING");

-- *** {rtX} are colored marks in the raid warnings. {rt1}=yellow, {rt3}=purple, {rt4}=green, {rt6}=blue, {rt7}=red, {rt8}=black 


-- 7.1 RF(Raid Finder)/NORMAL: PURPLE, GREEN, BLUE  --  HEROIC: PURPLE, GREEN, BLUE, BLACK	
	if spellID == 105420 then
		YORelapsed=time()
		if YORmode == 1 then
			-- RAID FINDER MODE
			SendChatMessage ("{rt3} Kill PURPLE! {rt3}", "RAID_WARNING");
			SendChatMessage ("{rt3} Kill PURPLE! {rt3}", "RAID_WARNING");
			SendChatMessage ("{rt3} Kill PURPLE! {rt3}", "RAID_WARNING");
			SendChatMessage ("afterwards STACK and KILL MANA VOID!", "RAID_WARNING");
		elseif YORmode == 2 then
			-- NORMAL MODE
			SendChatMessage ("{rt3} Kill PURPLE! {rt3}", "RAID_WARNING");
			SendChatMessage ("{rt3} Kill PURPLE! {rt3}", "RAID_WARNING");
			SendChatMessage ("{rt3} Kill PURPLE! {rt3}", "RAID_WARNING");
			SendChatMessage ("afterwards SPREAD and KILL MANA VOID!", "RAID_WARNING");
		elseif YORmode == 3 then
			-- HEROIC MODE
			SendChatMessage ("{rt8} Kill BLACK! {rt8}", "RAID_WARNING");
			SendChatMessage ("{rt8} Kill BLACK! {rt8}", "RAID_WARNING");
			SendChatMessage ("{rt8} Kill BLACK! {rt8}", "RAID_WARNING");
			SendChatMessage ("afterwards SPREAD and KILL MANA VOID! >>HEALING DEBUFF<<", "RAID_WARNING");
		end
			
			
-- 7.2 RF/NORMAL: GREEN, RED, BLACK  --  HEROIC: GREEN, RED, BLACK, BLUE				
	elseif spellID == 105435 then
		YORelapsed=time()
		if YORmode == 1 then
			-- RAID FINDER MODE
			SendChatMessage ("{rt8} Kill BLACK! {rt8}", "RAID_WARNING");
			SendChatMessage ("{rt8} Kill BLACK! {rt8}", "RAID_WARNING");
			SendChatMessage ("{rt8} Kill BLACK! {rt8}", "RAID_WARNING");
			SendChatMessage ("afterwards STACK and USE HEALING CD's!", "RAID_WARNING");
		elseif YORmode == 2 then
			-- NORMAL MODE
			SendChatMessage ("{rt4} Kill GREEN! {rt4}", "RAID_WARNING");
			SendChatMessage ("{rt4} Kill GREEN! {rt4}", "RAID_WARNING");
			SendChatMessage ("{rt4} Kill GREEN! {rt4}", "RAID_WARNING");
			SendChatMessage ("afterwards STACK and AOE ADDS!", "RAID_WARNING");
		elseif YORmode == 3 then
			-- HEROIC MODE
			SendChatMessage ("{rt4} Kill GREEN! {rt4}", "RAID_WARNING");
			SendChatMessage ("{rt4} Kill GREEN! {rt4}", "RAID_WARNING");
			SendChatMessage ("{rt4} Kill GREEN! {rt4}", "RAID_WARNING");
			SendChatMessage ("afterwards STACK, KILL MANA VOID, then AOE ADDS!", "RAID_WARNING");
		end
			
			
-- 7.3 RF/NORMAL: GREEN, YELLOW, RED  --  HEROIC: GREEN, YELLOW, RED, BLACK
	elseif spellID == 105436 then
		YORelapsed=time()
		if YORmode == 1 then
			-- RAID FINDER MODE
			SendChatMessage ("{rt1} Kill YELLOW! {rt1}", "RAID_WARNING");
			SendChatMessage ("{rt1} Kill YELLOW! {rt1}", "RAID_WARNING");
			SendChatMessage ("{rt1} Kill YELLOW! {rt1}", "RAID_WARNING");
			SendChatMessage ("afterwards STACK and USE HEALING CD'S!", "RAID_WARNING");
		elseif YORmode == 2 then
			-- NORMAL MODE
			SendChatMessage ("{rt4} Kill GREEN! {rt4}", "RAID_WARNING");
			SendChatMessage ("{rt4} Kill GREEN! {rt4}", "RAID_WARNING");
			SendChatMessage ("{rt4} Kill GREEN! {rt4}", "RAID_WARNING");
			SendChatMessage ("afterwards STACK and USE HEALING CD'S!", "RAID_WARNING");
		elseif YORmode == 3 then
			-- HEROIC MODE
			SendChatMessage ("{rt4} Kill GREEN! {rt4}", "RAID_WARNING");
			SendChatMessage ("{rt4} Kill GREEN! {rt4}", "RAID_WARNING");
			SendChatMessage ("{rt4} Kill GREEN! {rt4}", "RAID_WARNING");
			SendChatMessage ("afterwards STACK and USE HEALING CD'S and AOE 2 WAVES OF ADDS!", "RAID_WARNING");
		end
		
		
-- 7.4 RF/NORMAL: BLUE, PURPLE, YELLOW  --  HEROIC: BLUE, PURPLE, YELLOW, GREEN	
	elseif spellID == 105437 then
		YORelapsed=time()
		if YORmode == 1 then
			-- RAID FINDER MODE
			SendChatMessage ("{rt3} Kill PURPLE! {rt3}", "RAID_WARNING");
			SendChatMessage ("{rt3} Kill PURPLE! {rt3}", "RAID_WARNING");
			SendChatMessage ("{rt3} Kill PURPLE! {rt3}", "RAID_WARNING");
			SendChatMessage ("afterwards STACK and KILL MANA VOID!", "RAID_WARNING");
		elseif YORmode == 2 then
			-- NORMAL MODE
			SendChatMessage ("{rt3} Kill PURPLE! {rt3}", "RAID_WARNING");
			SendChatMessage ("{rt3} Kill PURPLE! {rt3}", "RAID_WARNING");
			SendChatMessage ("{rt3} Kill PURPLE! {rt3}", "RAID_WARNING");
			SendChatMessage ("afterwards STACK and KILL MANA VOID!", "RAID_WARNING");
		elseif YORmode == 3 then
			-- HEROIC MODE
			SendChatMessage ("{rt1} Kill YELLOW! {rt1}", "RAID_WARNING");
			SendChatMessage ("{rt1} Kill YELLOW! {rt1}", "RAID_WARNING");
			SendChatMessage ("{rt1} Kill YELLOW! {rt1}", "RAID_WARNING");
			SendChatMessage ("afterwards SPREAD and KILL MANA VOID! >>HEALING DEBUFF<<", "RAID_WARNING");
		end

		
-- 7.5 RF/NORMAL: BLUE, BLACK, YELLOW  --  HEROIC: BLUE, BLACK, YELLOW, PURPLE			
	elseif spellID == 105439 then
		YORelapsed=time()
		if YORmode == 1 then
			-- RAID FINDER MODE
			SendChatMessage ("{rt1} Kill YELLOW! {rt1}", "RAID_WARNING");
			SendChatMessage ("{rt1} Kill YELLOW! {rt1}", "RAID_WARNING");
			SendChatMessage ("{rt1} Kill YELLOW! {rt1}", "RAID_WARNING");
			SendChatMessage ("afterwards STACK, KILL MANA VOID, then AOE ADDS!", "RAID_WARNING");
		elseif YORmode == 2 then
			-- NORMAL MODE
			SendChatMessage ("{rt1} Kill YELLOW! {rt1}", "RAID_WARNING");
			SendChatMessage ("{rt1} Kill YELLOW! {rt1}", "RAID_WARNING");
			SendChatMessage ("{rt1} Kill YELLOW! {rt1}", "RAID_WARNING");
			SendChatMessage ("afterwards STACK, KILL MANA VOID, then AOE ADDS!", "RAID_WARNING");
		elseif YORmode == 3 then
			-- HEROIC MODE
			SendChatMessage ("{rt8} Kill BLACK! {rt8}", "RAID_WARNING");
			SendChatMessage ("{rt8} Kill BLACK! {rt8}", "RAID_WARNING");
			SendChatMessage ("{rt8} Kill BLACK! {rt8}", "RAID_WARNING");
			SendChatMessage ("afterwards STACK and KILL MANA VOID! >>HEALING DEBUFF<<", "RAID_WARNING");
		end
			

-- 7.6 RF/NORMAL: PURPLE, RED, BLACK  --  HEROIC: PURPLE, RED, BLACK, YELLOW				
	elseif spellID == 105440 then
		YORelapsed=time()
		if YORmode == 1 then
			-- RAID FINDER MODE
			SendChatMessage ("{rt3} Kill PURPLE! {rt3}", "RAID_WARNING");
			SendChatMessage ("{rt3} Kill PURPLE! {rt3}", "RAID_WARNING");
			SendChatMessage ("{rt3} Kill PURPLE! {rt3}", "RAID_WARNING");
			SendChatMessage ("afterwards STACK and AOE ADDS!", "RAID_WARNING");
		elseif YORmode == 2 then
			-- NORMAL MODE
			SendChatMessage ("{rt3} Kill PURPLE! {rt3}", "RAID_WARNING");
			SendChatMessage ("{rt3} Kill PURPLE! {rt3}", "RAID_WARNING");
			SendChatMessage ("{rt3} Kill PURPLE! {rt3}", "RAID_WARNING");
			SendChatMessage ("afterwards STACK and AOE ADDS!", "RAID_WARNING");
		elseif YORmode == 3 then
			-- HEROIC MODE
			SendChatMessage ("{rt1} Kill YELLOW! {rt1}", "RAID_WARNING");
			SendChatMessage ("{rt1} Kill YELLOW! {rt1}", "RAID_WARNING");
			SendChatMessage ("{rt1} Kill YELLOW! {rt1}", "RAID_WARNING");
			SendChatMessage ("afterwards STACK and AOE ADDS! >>HEALING DEBUFF<<", "RAID_WARNING");
		end
	end
	end
end



frame:SetScript("OnEvent", frame.TEST_YS)





----- 8. Slash menu -----

function YORIntro()
	SlashCmdList["YOR"] = YOR_SlashHandler;
	SLASH_YOR1, SLASH_YOR2 = "/yor", "/yorsahj";
	YORFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
	YORFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA");
end

StaticPopupDialogs["YOR_Welcome"] = {
  text = "Welcome to Yor'sahj Automatic /RW's!                           -----------------------------------------                        To change between difficulty modes:                                /yor rf (default) - /yor normal - /yor heroic ",
  button1 = "Accept",
  timeout = 0,
  whileDead = true,
  hideOnEscape = true,
}

function YOR_SlashHandler(msg, editbox)
	local arg1, arg2, rest = string.split(" ", msg);
	
	if (arg1 == "help") then
		print "***Available commands:***";
		print "   /yor rf         - Raid Finder mode";
		print "   /yor normal - Normal mode";
		print "   /yor heroic  - Heroic mode";
		print "   /yor off  - Disable the addon";
		print "*To edit the raid warnings for each mode, please open the .lua file with a text editor like notepad, and follow the instructions inside."; 
	elseif (arg1 == "rf") then
        print "--Yorsahj: Mode set to warnings for Raid Finder."
        YORmode = 1  
    elseif (arg1 == "normal") then
        print "--Yorsahj: Mode set to warnings for Normal."
        YORmode = 2
    elseif (arg1 == "heroic") then
        print "--Yorsahj: Mode set to warnings for Heroic."
        YORmode = 3
	elseif (arg1 == "off") then
		print "--Yorsahj: Warnings will not be sent."
		YORmode = 4
    end
end

function YOR_OnEvent(frame, event, arg1, ...)
	if (event == "PLAYER_ENTERING_WORLD") then
		if YORmode == nil then
		StaticPopup_Show ("YOR_Welcome")
		YORmode = 1
		end
		
		YORelapsed=time()
    elseif (event == "ZONE_CHANGED_NEW_AREA") then
        local name, instanceType, difficulty, difficultyName, maxPlayers, playerDifficulty, isDynamicInstance = GetInstanceInfo()
        if name =='Dragon Soul' then
            if IsPartyLFG() and IsInLFGDungeon() and instanceType == "raid" and maxPlayers == 25 then
                print ("--Yorsahj: Mode set to warnings for Raid Finder.")  -- we are in a LFR
                YORmode = 1
            elseif difficulty == 3 or difficulty == 4 then
                print ("--Yorsahj: Mode set to warnings for Heroic.") -- 10/25 heroic mode.
                YORmode = 3
            elseif (difficulty == 1 or difficulty == 2) and (maxPlayers == 10 or maxPlayers == 25) then
                print ("--Yorsahj: Mode set to warnings for Normal.")  -- 10/25 normal mode
                YORmode = 2
            end
        end
    end
	end
		
