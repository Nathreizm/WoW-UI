
WeakAurasSaved = {
	["displays"] = {
		["Dark Shamans - Iron Prison"] = {
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["message"] = "",
					["do_sound"] = true,
					["message_type"] = "SAY",
					["do_message"] = false,
					["sound"] = "Sound\\Creature\\AlgalonTheObserver\\UR_Algalon_BHole01.wav",
				},
				["finish"] = {
				},
			},
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["subeventPrefix"] = "SPELL",
				["type"] = "aura",
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["names"] = {
					"Iron Prison", -- [1]
				},
				["event"] = "Health",
				["debuffType"] = "HARMFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["font"] = "Friz Quadrata TT",
			["height"] = 64,
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["use_zone"] = true,
				["zone"] = "Siege of Orgrimmar",
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["use_combat"] = true,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 24,
			["displayStacks"] = "Move out!  %p",
			["regionType"] = "icon",
			["icon"] = true,
			["additional_triggers"] = {
			},
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["cooldown"] = true,
			["id"] = "Dark Shamans - Iron Prison",
			["xOffset"] = -320.9997863769531,
			["frameStrata"] = 1,
			["width"] = 64,
			["selfPoint"] = "CENTER",
			["inverse"] = false,
			["numTriggers"] = 1,
			["yOffset"] = 294.9999389648438,
			["stickyDuration"] = false,
			["stacksPoint"] = "BOTTOM",
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Cloak of Shadows"] = {
			["fontSize"] = 12,
			["displayStacks"] = "%s",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
			},
			["cooldown"] = true,
			["yOffset"] = -11.00015258789063,
			["anchorPoint"] = "CENTER",
			["regionType"] = "icon",
			["xOffset"] = -335.0001831054688,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
			},
			["customTextUpdate"] = "update",
			["numTriggers"] = 1,
			["icon"] = true,
			["id"] = "Cloak of Shadows",
			["stacksContainment"] = "INSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventPrefix"] = "SPELL",
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HELPFUL",
				["names"] = {
					"Cloak of Shadows", -- [1]
				},
				["event"] = "Health",
				["unit"] = "player",
			},
			["desaturate"] = false,
			["frameStrata"] = 1,
			["stickyDuration"] = false,
			["width"] = 40,
			["font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["selfPoint"] = "CENTER",
			["height"] = 40,
			["stacksPoint"] = "BOTTOMRIGHT",
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Nazgrim - Coolong Off Timer"] = {
			["outline"] = true,
			["xOffset"] = 554,
			["displayText"] = "%p",
			["untrigger"] = {
				["form"] = 0,
				["unit"] = "boss1",
				["use_specific_unit"] = true,
			},
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "update",
			["icon"] = true,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["use_form"] = true,
				["source"] = "Kor'kron Warshaman",
				["use_inverse"] = false,
				["names"] = {
					"Cooling Off", -- [1]
				},
				["subeventPrefix"] = "SPELL",
				["powertype"] = 1,
				["debuffType"] = "HELPFUL",
				["specificUnit"] = "boss1",
				["dest"] = "Kor'kron Warshaman",
				["use_dest"] = true,
				["use_powertype"] = true,
				["custom_hide"] = "timed",
				["spellName"] = "Earth Shield",
				["type"] = "aura",
				["duration"] = "10",
				["unevent"] = "timed",
				["power_operator"] = "<",
				["form"] = 0,
				["use_source"] = true,
				["use_percentpower"] = false,
				["use_power"] = true,
				["use_spellName"] = true,
				["power"] = "50",
				["subeventSuffix"] = "_AURA_APPLIED",
				["event"] = "Combat Log",
				["use_specific_unit"] = true,
				["unit"] = "boss1",
				["use_unit"] = true,
			},
			["stickyDuration"] = false,
			["font"] = "Friz Quadrata TT",
			["height"] = 23.99998283386231,
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["use_zone"] = true,
				["zone"] = "Siege of Orgrimmar",
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["use_combat"] = true,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 24,
			["displayStacks"] = "%p",
			["regionType"] = "text",
			["justify"] = "LEFT",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["disjunctive"] = false,
			["desaturate"] = false,
			["stacksContainment"] = "INSIDE",
			["zoom"] = 0,
			["auto"] = false,
			["yOffset"] = 80.0001220703125,
			["id"] = "Nazgrim - Coolong Off Timer",
			["cooldown"] = true,
			["frameStrata"] = 5,
			["width"] = 43.00003433227539,
			["animation"] = {
				["start"] = {
					["preset"] = "fade",
					["duration_type"] = "seconds",
					["type"] = "preset",
				},
				["main"] = {
					["preset"] = "bounce",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["preset"] = "fade",
					["duration_type"] = "seconds",
					["type"] = "preset",
				},
			},
			["additional_triggers"] = {
				{
					["trigger"] = {
						["custom_hide"] = "timed",
						["type"] = "custom",
						["custom"] = "function()\n    if UnitName(\"boss1\") == \"General Nazgrim\" then\n        return true\n    else \n        return false\n    end\nend",
						["subeventSuffix"] = "_CAST_START",
						["check"] = "update",
						["custom_type"] = "status",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
						["custom"] = "function()\nreturn true\nend",
					},
				}, -- [1]
			},
			["inverse"] = false,
			["numTriggers"] = 2,
			["actions"] = {
				["start"] = {
					["message"] = "",
					["do_sound"] = false,
					["message_type"] = "SAY",
					["sound"] = "Interface\\Quiet.ogg",
					["do_message"] = false,
				},
				["finish"] = {
				},
			},
			["displayIcon"] = "Interface\\Icons\\",
			["stacksPoint"] = "CENTER",
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Thok - Acceleration"] = {
			["outline"] = true,
			["fontSize"] = 72,
			["xOffset"] = 539.3001708984375,
			["displayText"] = "%s",
			["yOffset"] = 227.9857177734375,
			["regionType"] = "text",
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
			},
			["untrigger"] = {
			},
			["justify"] = "LEFT",
			["selfPoint"] = "BOTTOMRIGHT",
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"Acceleration", -- [1]
				},
				["specificUnit"] = "boss1",
				["custom_hide"] = "timed",
				["subeventPrefix"] = "SPELL",
				["unit"] = "member",
				["debuffType"] = "HELPFUL",
			},
			["color"] = {
				1, -- [1]
				0.09411764705882353, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["frameStrata"] = 5,
			["width"] = 47.04003524780273,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["font"] = "DorisPP",
			["numTriggers"] = 1,
			["id"] = "Thok - Acceleration",
			["height"] = 71.99997711181641,
			["anchorPoint"] = "CENTER",
			["load"] = {
				["use_name"] = false,
				["role"] = {
					["multi"] = {
					},
				},
				["zone"] = "Siege of Orgrimmar",
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["use_zone"] = true,
				["size"] = {
					["single"] = "twentyfive",
					["multi"] = {
						["twentyfive"] = true,
					},
				},
			},
			["additional_triggers"] = {
			},
		},
		["Malkorok - Ancient Barrier"] = {
			["fontSize"] = 16,
			["displayStacks"] = "%c",
			["anchorPoint"] = "CENTER",
			["xOffset"] = -318.7037353515625,
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["use_zone"] = true,
				["zone"] = "Siege of Orgrimmar",
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["customText"] = "function()\n    local i,name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId, canApplyAura, isBossDebuff, value1,value2;\n    for i = 1, 40 do\n        name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId, canApplyAura, isBossDebuff, value1,value2 = UnitAura(\"player\", i, \"HARMFUL\");\n        if (name == \"Ancient Barrier\" or name == \"Weak Ancient Barrier\" or name == \"Strong Ancient Barrier\") then\n            return value2;\n        end\n    end\n    return \"Nope\";\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["untrigger"] = {
			},
			["regionType"] = "icon",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
			},
			["id"] = "Malkorok - Ancient Barrier",
			["customTextUpdate"] = "update",
			["inverse"] = false,
			["icon"] = true,
			["additional_triggers"] = {
			},
			["stacksContainment"] = "INSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["subeventPrefix"] = "SPELL",
				["type"] = "aura",
				["names"] = {
					"Ancient Barrier", -- [1]
					"Weak Ancient Barrier", -- [2]
					"Strong Ancient Barrier", -- [3]
				},
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["debuffType"] = "HARMFUL",
				["event"] = "Health",
				["custom_hide"] = "timed",
			},
			["stickyDuration"] = false,
			["frameStrata"] = 1,
			["desaturate"] = false,
			["width"] = 64,
			["font"] = "Friz Quadrata TT",
			["numTriggers"] = 1,
			["selfPoint"] = "CENTER",
			["height"] = 64,
			["yOffset"] = 295.251708984375,
			["stacksPoint"] = "BOTTOMRIGHT",
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Tricks"] = {
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["customText"] = "function(...)\n    local GetAuraSourceName = function(aura)\n        local RAID_SIZE = 25 -- CHANGE THIS        \n        if not aura then return end\n        local auraName = aura\n        if type(aura) == 'number' then auraName = GetSpellInfo(aura) end\n        for i=1,RAID_SIZE do\n            local unitCaster = select(8, UnitAura('raid'..i, auraName))\n            if unitCaster and UnitExists(unitCaster) then return UnitName(unitCaster) end\n        end    \n        local unitCaster = select(8, UnitAura('player', auraName))\n        if unitCaster and UnitExists(unitCaster) then return UnitName(unitCaster) end\n    end\n    \n    return GetAuraSourceName(select(5, ...))    \nend",
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["do_message"] = true,
					["message_type"] = "SAY",
				},
				["finish"] = {
				},
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["trigger"] = {
				["stack_info"] = "count",
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["groupclone"] = true,
				["name_info"] = "aura",
				["unit"] = "group",
				["custom_hide"] = "timed",
				["names"] = {
					"Tricks of the Trade", -- [1]
				},
				["group_countOperator"] = ">=",
				["group_count"] = "1",
				["subeventPrefix"] = "SPELL",
				["event"] = "Health",
				["debuffType"] = "HELPFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["font"] = "Friz Quadrata TT",
			["height"] = 45,
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 16,
			["displayStacks"] = "  %p  %n",
			["regionType"] = "icon",
			["parent"] = "Tricks of the Trade",
			["selfPoint"] = "CENTER",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = false,
			["id"] = "Tricks",
			["additional_triggers"] = {
			},
			["stickyDuration"] = false,
			["frameStrata"] = 1,
			["width"] = 45,
			["yOffset"] = 371.0000610351563,
			["numTriggers"] = 1,
			["inverse"] = false,
			["icon"] = true,
			["xOffset"] = -661.9999084472656,
			["displayIcon"] = "Interface\\Icons\\Ability_Rogue_TricksOftheTrade",
			["stacksPoint"] = "RIGHT",
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Dextrous"] = {
			["fontSize"] = 12,
			["displayStacks"] = "%s",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
			},
			["cooldown"] = true,
			["yOffset"] = -58.00015258789063,
			["anchorPoint"] = "CENTER",
			["regionType"] = "icon",
			["xOffset"] = -287.0001831054688,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
			},
			["customTextUpdate"] = "update",
			["numTriggers"] = 1,
			["icon"] = true,
			["id"] = "Dextrous",
			["stacksContainment"] = "INSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventPrefix"] = "SPELL",
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HELPFUL",
				["names"] = {
					"Dextrous", -- [1]
				},
				["event"] = "Health",
				["unit"] = "player",
			},
			["desaturate"] = false,
			["frameStrata"] = 1,
			["stickyDuration"] = false,
			["width"] = 40,
			["font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["selfPoint"] = "CENTER",
			["height"] = 40,
			["stacksPoint"] = "BOTTOMRIGHT",
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Rupture"] = {
			["fontSize"] = 12,
			["displayStacks"] = "%s",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
			},
			["cooldown"] = true,
			["yOffset"] = -107.0000305175781,
			["anchorPoint"] = "CENTER",
			["regionType"] = "icon",
			["xOffset"] = 73.00018310546875,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
			},
			["customTextUpdate"] = "update",
			["numTriggers"] = 1,
			["icon"] = true,
			["id"] = "Rupture",
			["stacksContainment"] = "INSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["names"] = {
					"Rupture", -- [1]
				},
				["type"] = "aura",
				["subeventPrefix"] = "SPELL",
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HARMFUL",
				["ownOnly"] = true,
				["event"] = "Health",
				["unit"] = "target",
			},
			["desaturate"] = false,
			["frameStrata"] = 1,
			["stickyDuration"] = false,
			["width"] = 64,
			["font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["selfPoint"] = "CENTER",
			["height"] = 64,
			["stacksPoint"] = "BOTTOMRIGHT",
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Sha of Pride - Projection"] = {
			["fontSize"] = 24,
			["displayStacks"] = "Find Projection: %p",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["xOffset"] = -205.369873046875,
			["load"] = {
				["use_name"] = false,
				["role"] = {
					["multi"] = {
					},
				},
				["zone"] = "Siege of Orgrimmar",
				["use_zone"] = true,
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["yOffset"] = 202.62890625,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["id"] = "Sha of Pride - Projection",
			["actions"] = {
				["start"] = {
					["message"] = "To the Arrow!",
					["do_sound"] = true,
					["message_type"] = "SAY",
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.mp3",
					["do_message"] = true,
				},
				["finish"] = {
				},
			},
			["inverse"] = false,
			["customTextUpdate"] = "update",
			["additional_triggers"] = {
			},
			["icon"] = true,
			["stickyDuration"] = false,
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["subeventPrefix"] = "SPELL",
				["type"] = "aura",
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["debuffType"] = "HARMFUL",
				["event"] = "Health",
				["names"] = {
					"Projection", -- [1]
				},
			},
			["desaturate"] = false,
			["frameStrata"] = 9,
			["width"] = 64,
			["progressPrecision"] = 0,
			["font"] = "Arial Narrow",
			["numTriggers"] = 1,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["height"] = 64,
			["regionType"] = "icon",
			["stacksPoint"] = "BOTTOM",
			["textColor"] = {
				0.9725490196078431, -- [1]
				1, -- [2]
				0.984313725490196, -- [3]
				1, -- [4]
			},
		},
		["Slice and Dice"] = {
			["fontSize"] = 12,
			["displayStacks"] = "%s",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
			},
			["cooldown"] = true,
			["yOffset"] = -106.9999389648438,
			["anchorPoint"] = "CENTER",
			["regionType"] = "icon",
			["xOffset"] = -2.99993896484375,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
			},
			["customTextUpdate"] = "update",
			["numTriggers"] = 1,
			["icon"] = true,
			["id"] = "Slice and Dice",
			["stacksContainment"] = "INSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventPrefix"] = "SPELL",
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HELPFUL",
				["names"] = {
					"Slice and Dice", -- [1]
				},
				["event"] = "Health",
				["unit"] = "player",
			},
			["desaturate"] = false,
			["frameStrata"] = 1,
			["stickyDuration"] = false,
			["width"] = 64,
			["font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["selfPoint"] = "CENTER",
			["height"] = 64,
			["stacksPoint"] = "BOTTOMRIGHT",
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Sha of Pride - Power of the Titans"] = {
			["xOffset"] = -219.9999389648438,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "update",
			["icon"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["subeventPrefix"] = "SPELL",
				["type"] = "aura",
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["names"] = {
					"Power of the Titans", -- [1]
				},
				["event"] = "Health",
				["debuffType"] = "HARMFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["font"] = "Friz Quadrata TT",
			["height"] = 64,
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["use_zone"] = true,
				["zone"] = "Siege of Orgrimmar",
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["use_combat"] = true,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 24,
			["displayStacks"] = "%p",
			["regionType"] = "icon",
			["id"] = "Sha of Pride - Power of the Titans",
			["cooldown"] = true,
			["stacksContainment"] = "INSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["additional_triggers"] = {
			},
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["width"] = 64,
			["inverse"] = false,
			["yOffset"] = 305,
			["numTriggers"] = 1,
			["stickyDuration"] = false,
			["actions"] = {
				["start"] = {
					["message"] = "",
					["do_message"] = false,
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\Applause.mp3",
					["do_sound"] = true,
				},
				["finish"] = {
				},
			},
			["stacksPoint"] = "BOTTOMRIGHT",
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Dark Shamans - Falling Ash"] = {
			["textFlags"] = "None",
			["stacksSize"] = 38,
			["borderBackdrop"] = "Blizzard Tooltip",
			["color"] = {
				0.8392156862745098, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["stacksFlags"] = "None",
			["untrigger"] = {
				["unit"] = "Earthbreaker Haromm",
				["use_specific_unit"] = true,
			},
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["customTextUpdate"] = "update",
			["rotateText"] = "NONE",
			["actions"] = {
				["start"] = {
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.mp3",
					["do_sound"] = false,
				},
				["finish"] = {
					["do_glow"] = false,
					["sound"] = "Sound\\Creature\\AlgalonTheObserver\\UR_Algalon_BHole01.wav",
					["do_sound"] = false,
				},
			},
			["textSize"] = 38,
			["displayTextLeft"] = "Falling Ash",
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["preset"] = "alphaPulse",
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["selfPoint"] = "BOTTOM",
			["trigger"] = {
				["use_castType"] = false,
				["sourceunit"] = "target",
				["source"] = "Earthbreaker Haromm",
				["duration"] = "15",
				["use_spell"] = true,
				["use_specific_unit"] = true,
				["custom_hide"] = "timed",
				["spell"] = "Ashen Wall",
				["subeventPrefix"] = "SPELL",
				["unevent"] = "timed",
				["names"] = {
				},
				["debuffType"] = "HELPFUL",
				["use_source"] = false,
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "Earthbreaker Haromm",
				["use_spellName"] = true,
				["event"] = "Combat Log",
				["use_sourceunit"] = false,
				["use_destunit"] = false,
				["type"] = "event",
				["spellName"] = "Falling Ash",
				["use_unit"] = true,
			},
			["text"] = true,
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["displayText"] = "Adds Wall Incoming!!",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["inverse"] = false,
			["timer"] = true,
			["height"] = 40,
			["timerFlags"] = "None",
			["load"] = {
				["use_name"] = false,
				["role"] = {
					["single"] = "TANK",
					["multi"] = {
						["TANK"] = true,
					},
				},
				["zone"] = "Siege of Orgrimmar",
				["use_zone"] = true,
				["class"] = {
					["single"] = "PALADIN",
					["multi"] = {
						["PALADIN"] = true,
					},
				},
				["spec"] = {
					["single"] = 2,
					["multi"] = {
						[2] = true,
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["stickyDuration"] = false,
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["barInFront"] = true,
			["frameStrata"] = 1,
			["timerColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["stacks"] = true,
			["additional_triggers"] = {
			},
			["border"] = false,
			["borderEdge"] = "None",
			["regionType"] = "aurabar",
			["borderSize"] = 16,
			["stacksFont"] = "Friz Quadrata TT",
			["icon_side"] = "LEFT",
			["timerSize"] = 38,
			["borderOffset"] = 5,
			["displayTextRight"] = "%p",
			["texture"] = "Blizzard",
			["textFont"] = "Friz Quadrata TT",
			["stacksColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["justify"] = "LEFT",
			["auto"] = true,
			["id"] = "Dark Shamans - Falling Ash",
			["timerFont"] = "Friz Quadrata TT",
			["alpha"] = 1,
			["width"] = 300,
			["outline"] = true,
			["borderInset"] = 11,
			["numTriggers"] = 1,
			["xOffset"] = 384.230712890625,
			["orientation"] = "HORIZONTAL",
			["yOffset"] = 254.26708984375,
			["icon"] = true,
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["MaliceSay"] = {
			["outline"] = true,
			["fontSize"] = 12,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayText"] = " ",
			["yOffset"] = 0,
			["regionType"] = "text",
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.mp3",
					["do_sound"] = true,
				},
				["finish"] = {
				},
			},
			["untrigger"] = {
			},
			["id"] = "MaliceSay",
			["justify"] = "LEFT",
			["selfPoint"] = "BOTTOM",
			["additional_triggers"] = {
			},
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["frameStrata"] = 1,
			["width"] = 7.000008583068848,
			["xOffset"] = 0,
			["font"] = "Friz Quadrata TT",
			["numTriggers"] = 1,
			["anchorPoint"] = "CENTER",
			["height"] = 11.99999141693115,
			["load"] = {
				["zone"] = "Siege of Orgrimmar",
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = "heroic",
				["use_zone"] = true,
				["use_difficulty"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["trigger"] = {
				["type"] = "custom",
				["custom_type"] = "status",
				["event"] = "Health",
				["names"] = {
					"Malice", -- [1]
				},
				["subeventPrefix"] = "SPELL",
				["subeventSuffix"] = "_CAST_START",
				["events"] = "COMBAT_LOG_EVENT_UNFILTERED",
				["unit"] = "player",
				["check"] = "event",
				["custom_hide"] = "custom",
				["custom"] = "function(event, timestamp, message, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, ...)  \n    \n    if message == \"SPELL_AURA_APPLIED\" then\n        local spellId, spellName, spellSchool = ...\n        if spellName == \"Malice\" then\n            malTicks = 7\n            malWA = GetTime() + 1\n        end\n    end\n    \n    if message == \"SPELL_DAMAGE\" then\n        local spellId, spellName, spellSchool = ...\n        if spellName == \"Malicious Blast\" then   \n            if UnitDebuff(\"player\", \"Malice\") then\n                if malWA - GetTime() <= 0 then\n                    malTicks = malTicks - 1\n                    SendChatMessage(\"Ticks: \"..malTicks, \"SAY\")\n                    malWA = GetTime() + 1 \n                end\n            end\n        end\n    end\n    \nend",
				["debuffType"] = "HARMFUL",
			},
		},
		["Nazgrim - Berserker Stance"] = {
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
				["form"] = 0,
				["use_specific_unit"] = true,
				["unit"] = "member",
			},
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "update",
			["icon"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["duration_type"] = "seconds",
					["preset"] = "bounceDecay",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["use_form"] = true,
				["source"] = "General Nazgrim",
				["use_inverse"] = false,
				["names"] = {
					"Defensive Stance", -- [1]
				},
				["specificUnit"] = "boss1",
				["custom_hide"] = "timed",
				["type"] = "event",
				["unevent"] = "timed",
				["subeventPrefix"] = "SPELL",
				["form"] = 0,
				["event"] = "Combat Log",
				["use_unit"] = true,
				["use_source"] = true,
				["use_spellName"] = true,
				["use_specific_unit"] = true,
				["unit"] = "member",
				["subeventSuffix"] = "_AURA_APPLIED",
				["duration"] = "60",
				["debuffType"] = "HARMFUL",
				["spellName"] = "Berserker Stance",
			},
			["desaturate"] = false,
			["font"] = "Friz Quadrata TT",
			["height"] = 64,
			["load"] = {
				["use_zone"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["zone"] = "Siege of Orgrimmar",
				["spec"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 24,
			["displayStacks"] = "Berserker Stance",
			["regionType"] = "icon",
			["stacksPoint"] = "BOTTOM",
			["additional_triggers"] = {
			},
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["xOffset"] = 555,
			["id"] = "Nazgrim - Berserker Stance",
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["width"] = 64,
			["inverse"] = false,
			["yOffset"] = 166,
			["numTriggers"] = 1,
			["stickyDuration"] = false,
			["actions"] = {
				["start"] = {
					["message"] = "",
					["do_message"] = false,
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BikeHorn.mp3",
					["do_sound"] = false,
				},
				["finish"] = {
				},
			},
			["displayIcon"] = "Interface\\Icons\\Ability_Racial_Avatar",
			["cooldown"] = true,
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Nazgrim - Defensive Stance Alert"] = {
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
				["form"] = 0,
				["use_specific_unit"] = true,
				["unit"] = "member",
			},
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "update",
			["icon"] = true,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["duration_type"] = "seconds",
					["preset"] = "bounceDecay",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["use_form"] = true,
				["source"] = "General Nazgrim",
				["duration"] = "60.5",
				["use_unit"] = true,
				["specificUnit"] = "boss1",
				["custom_hide"] = "timed",
				["type"] = "event",
				["subeventSuffix"] = "_AURA_APPLIED",
				["subeventPrefix"] = "SPELL",
				["form"] = 0,
				["use_source"] = true,
				["names"] = {
					"Defensive Stance", -- [1]
				},
				["event"] = "Combat Log",
				["use_spellName"] = true,
				["use_specific_unit"] = true,
				["unit"] = "member",
				["unevent"] = "timed",
				["debuffType"] = "HARMFUL",
				["use_inverse"] = false,
				["spellName"] = "Defensive Stance",
			},
			["desaturate"] = false,
			["font"] = "Friz Quadrata TT",
			["height"] = 64,
			["load"] = {
				["use_zone"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["zone"] = "Siege of Orgrimmar",
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["use_combat"] = true,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 24,
			["displayStacks"] = "Defensive Stance",
			["regionType"] = "icon",
			["stacksPoint"] = "BOTTOM",
			["additional_triggers"] = {
			},
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["xOffset"] = 555,
			["id"] = "Nazgrim - Defensive Stance Alert",
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["width"] = 64,
			["inverse"] = false,
			["yOffset"] = 166,
			["numTriggers"] = 1,
			["stickyDuration"] = false,
			["actions"] = {
				["start"] = {
					["message"] = "",
					["do_message"] = false,
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BikeHorn.mp3",
					["do_sound"] = true,
				},
				["finish"] = {
				},
			},
			["displayIcon"] = "Interface\\Icons\\Ability_Warrior_DefensiveStance",
			["cooldown"] = true,
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Vicious"] = {
			["fontSize"] = 12,
			["displayStacks"] = "%s",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
			},
			["cooldown"] = true,
			["yOffset"] = -58.00006103515625,
			["anchorPoint"] = "CENTER",
			["regionType"] = "icon",
			["xOffset"] = -239.000244140625,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
			},
			["customTextUpdate"] = "update",
			["numTriggers"] = 1,
			["icon"] = true,
			["id"] = "Vicious",
			["stacksContainment"] = "INSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventPrefix"] = "SPELL",
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HELPFUL",
				["names"] = {
					"Vicious", -- [1]
				},
				["event"] = "Health",
				["unit"] = "player",
			},
			["desaturate"] = false,
			["frameStrata"] = 1,
			["stickyDuration"] = false,
			["width"] = 40,
			["font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["selfPoint"] = "CENTER",
			["height"] = 40,
			["stacksPoint"] = "BOTTOMRIGHT",
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Sha of Pride - Weakened Resolve Rift"] = {
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "update",
			["icon"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["subeventPrefix"] = "SPELL",
				["type"] = "aura",
				["custom_hide"] = "timed",
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["debuffType"] = "HARMFUL",
				["event"] = "Health",
				["names"] = {
					"Weakened Resolve", -- [1]
				},
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["font"] = "Friz Quadrata TT",
			["height"] = 64,
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["zone"] = "Siege of Orgrimmar",
				["use_zone"] = true,
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 18,
			["displayStacks"] = "Can't Soak %p",
			["regionType"] = "icon",
			["id"] = "Sha of Pride - Weakened Resolve Rift",
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["actions"] = {
				["start"] = {
					["do_sound"] = true,
					["sound"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Xylo.ogg",
					["sound_channel"] = "SFX",
				},
				["finish"] = {
				},
			},
			["additional_triggers"] = {
			},
			["xOffset"] = -397,
			["frameStrata"] = 1,
			["width"] = 64,
			["selfPoint"] = "CENTER",
			["yOffset"] = 124.9998779296875,
			["numTriggers"] = 1,
			["inverse"] = false,
			["stickyDuration"] = false,
			["stacksPoint"] = "TOP",
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Sha of Pride - Gift of the Titans"] = {
			["xOffset"] = -289.9999694824219,
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "update",
			["icon"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["subeventPrefix"] = "SPELL",
				["type"] = "aura",
				["names"] = {
					"Gift of the Titans", -- [1]
				},
				["subeventSuffix"] = "_CAST_START",
				["unit"] = "player",
				["custom_hide"] = "timed",
				["event"] = "Health",
				["debuffType"] = "HARMFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["font"] = "Friz Quadrata TT",
			["height"] = 64,
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["use_zone"] = true,
				["zone"] = "Siege of Orgrimmar",
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["use_combat"] = true,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 24,
			["displayStacks"] = "%p",
			["regionType"] = "icon",
			["additional_triggers"] = {
			},
			["cooldown"] = true,
			["stacksContainment"] = "INSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "Sha of Pride - Gift of the Titans",
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["width"] = 64,
			["inverse"] = false,
			["yOffset"] = 307,
			["numTriggers"] = 1,
			["stickyDuration"] = false,
			["actions"] = {
				["start"] = {
					["message"] = "Gift of the Titans",
					["do_sound"] = true,
					["message_type"] = "SAY",
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BikeHorn.mp3",
					["do_message"] = true,
				},
				["finish"] = {
				},
			},
			["stacksPoint"] = "BOTTOMRIGHT",
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Galakras - Flames of Galakrond"] = {
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["message"] = "",
					["do_sound"] = true,
					["message_type"] = "SAY",
					["do_message"] = false,
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.mp3",
				},
				["finish"] = {
				},
			},
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["spellId"] = "147068",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"Flames of Galakrond", -- [1]
				},
				["use_spellId"] = true,
				["subeventPrefix"] = "SPELL",
				["unit"] = "player",
				["fullscan"] = true,
				["custom_hide"] = "timed",
				["debuffType"] = "HARMFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["font"] = "Friz Quadrata TT",
			["height"] = 64,
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["use_zone"] = true,
				["zone"] = "Siege of Orgrimmar",
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["use_combat"] = true,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 24,
			["displayStacks"] = "Move out! %p",
			["regionType"] = "icon",
			["icon"] = true,
			["additional_triggers"] = {
			},
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["cooldown"] = true,
			["id"] = "Galakras - Flames of Galakrond",
			["xOffset"] = -393.0001831054688,
			["frameStrata"] = 1,
			["width"] = 64,
			["selfPoint"] = "CENTER",
			["inverse"] = false,
			["numTriggers"] = 1,
			["yOffset"] = 293.9999389648438,
			["stickyDuration"] = false,
			["stacksPoint"] = "BOTTOM",
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Sha of Pride - Bursting Pride"] = {
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
			},
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
					["message"] = "Aura of Pride, Get Away!",
					["do_sound"] = true,
					["message_type"] = "SAY",
					["do_message"] = true,
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.mp3",
				},
				["finish"] = {
				},
			},
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["ownOnly"] = true,
				["event"] = "Health",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["names"] = {
					"Bursting Pride", -- [1]
				},
				["custom_hide"] = "timed",
				["debuffType"] = "HARMFUL",
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["font"] = "Friz Quadrata TT",
			["height"] = 64,
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["use_zone"] = true,
				["zone"] = "Siege of Orgrimmar",
				["spec"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 24,
			["displayStacks"] = "Spread 5 Yards! %p",
			["regionType"] = "icon",
			["icon"] = true,
			["additional_triggers"] = {
			},
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["stacksPoint"] = "BOTTOM",
			["id"] = "Sha of Pride - Bursting Pride",
			["xOffset"] = -357.9998168945313,
			["frameStrata"] = 1,
			["width"] = 64,
			["selfPoint"] = "CENTER",
			["inverse"] = false,
			["numTriggers"] = 1,
			["yOffset"] = 308.0000610351563,
			["stickyDuration"] = false,
			["cooldown"] = true,
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Revealing Strike"] = {
			["fontSize"] = 12,
			["displayStacks"] = "%s",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
			},
			["cooldown"] = true,
			["yOffset"] = -107.0000915527344,
			["anchorPoint"] = "CENTER",
			["regionType"] = "icon",
			["xOffset"] = -78,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
			},
			["customTextUpdate"] = "update",
			["numTriggers"] = 1,
			["icon"] = true,
			["id"] = "Revealing Strike",
			["stacksContainment"] = "INSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["names"] = {
					"Revealing Strike", -- [1]
				},
				["type"] = "aura",
				["subeventPrefix"] = "SPELL",
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HARMFUL",
				["ownOnly"] = true,
				["event"] = "Health",
				["unit"] = "target",
			},
			["desaturate"] = false,
			["frameStrata"] = 1,
			["stickyDuration"] = false,
			["width"] = 64,
			["font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["selfPoint"] = "CENTER",
			["height"] = 64,
			["stacksPoint"] = "BOTTOMRIGHT",
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Synapse Springs"] = {
			["fontSize"] = 12,
			["displayStacks"] = "%s",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
			},
			["cooldown"] = true,
			["yOffset"] = -59.00033569335938,
			["anchorPoint"] = "CENTER",
			["regionType"] = "icon",
			["xOffset"] = -338.0003356933594,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
			},
			["customTextUpdate"] = "update",
			["numTriggers"] = 1,
			["icon"] = true,
			["id"] = "Synapse Springs",
			["stacksContainment"] = "INSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventPrefix"] = "SPELL",
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HELPFUL",
				["names"] = {
					"Synapse Springs", -- [1]
				},
				["event"] = "Health",
				["unit"] = "player",
			},
			["desaturate"] = false,
			["frameStrata"] = 1,
			["stickyDuration"] = false,
			["width"] = 40,
			["font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["selfPoint"] = "CENTER",
			["height"] = 40,
			["stacksPoint"] = "BOTTOMRIGHT",
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Recuperate"] = {
			["fontSize"] = 12,
			["displayStacks"] = "%s",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
			},
			["cooldown"] = true,
			["yOffset"] = -34.00015258789063,
			["anchorPoint"] = "CENTER",
			["regionType"] = "icon",
			["xOffset"] = 75.00006103515625,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
			},
			["customTextUpdate"] = "update",
			["numTriggers"] = 1,
			["icon"] = true,
			["id"] = "Recuperate",
			["stacksContainment"] = "INSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventPrefix"] = "SPELL",
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HELPFUL",
				["names"] = {
					"Recuperate", -- [1]
				},
				["event"] = "Health",
				["unit"] = "player",
			},
			["desaturate"] = false,
			["frameStrata"] = 1,
			["stickyDuration"] = false,
			["width"] = 64,
			["font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["selfPoint"] = "CENTER",
			["height"] = 64,
			["stacksPoint"] = "BOTTOMRIGHT",
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Feint"] = {
			["fontSize"] = 12,
			["displayStacks"] = "%s",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
			},
			["cooldown"] = true,
			["yOffset"] = -38.00003051757813,
			["anchorPoint"] = "CENTER",
			["regionType"] = "icon",
			["xOffset"] = -74.00006103515625,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
			},
			["customTextUpdate"] = "update",
			["numTriggers"] = 1,
			["icon"] = true,
			["id"] = "Feint",
			["stacksContainment"] = "INSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["type"] = "aura",
				["subeventPrefix"] = "SPELL",
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HELPFUL",
				["names"] = {
					"Feint", -- [1]
				},
				["event"] = "Health",
				["unit"] = "player",
			},
			["desaturate"] = false,
			["frameStrata"] = 1,
			["stickyDuration"] = false,
			["width"] = 64,
			["font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["selfPoint"] = "CENTER",
			["height"] = 64,
			["stacksPoint"] = "BOTTOMRIGHT",
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Tricks of the Trade"] = {
			["grow"] = "DOWN",
			["controlledChildren"] = {
				"Tricks", -- [1]
			},
			["animate"] = false,
			["xOffset"] = -518.1777038574219,
			["anchorPoint"] = "CENTER",
			["border"] = "None",
			["untrigger"] = {
			},
			["regionType"] = "dynamicgroup",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
			},
			["sort"] = "none",
			["backgroundInset"] = 0,
			["space"] = 2,
			["background"] = "None",
			["expanded"] = false,
			["constantFactor"] = "RADIUS",
			["trigger"] = {
				["type"] = "aura",
				["unit"] = "player",
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["event"] = "Health",
				["subeventPrefix"] = "SPELL",
			},
			["borderOffset"] = 16,
			["additional_triggers"] = {
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["align"] = "CENTER",
			["selfPoint"] = "TOP",
			["frameStrata"] = 1,
			["width"] = 44.99998474121094,
			["rotation"] = 0,
			["stagger"] = 0,
			["numTriggers"] = 1,
			["id"] = "Tricks of the Trade",
			["height"] = 45.00006103515625,
			["radius"] = 200,
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["yOffset"] = 225.7037963867188,
		},
		["GET IN"] = {
			["outline"] = true,
			["color"] = {
				0.02745098039215686, -- [1]
				1, -- [2]
				0.1764705882352941, -- [3]
				1, -- [4]
			},
			["displayText"] = "GET IN",
			["yOffset"] = 87.14764404296875,
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "update",
			["icon"] = true,
			["selfPoint"] = "CENTER",
			["trigger"] = {
				["type"] = "aura",
				["subeventSuffix"] = "_CAST_START",
				["countOperator"] = "<",
				["names"] = {
					"Malicious Blast", -- [1]
				},
				["subeventPrefix"] = "SPELL",
				["count"] = "0",
				["event"] = "Health",
				["unit"] = "player",
				["inverse"] = true,
				["custom_hide"] = "timed",
				["debuffType"] = "HARMFUL",
			},
			["stickyDuration"] = false,
			["font"] = "Friz Quadrata TT",
			["height"] = 52.00001525878906,
			["load"] = {
				["zone"] = "Siege of Orgrimmar",
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = "heroic",
				["use_zone"] = true,
				["use_combat"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["use_difficulty"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 52,
			["displayStacks"] = "GET IN",
			["regionType"] = "text",
			["untrigger"] = {
			},
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["stacksContainment"] = "INSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["actions"] = {
				["start"] = {
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BoxingArenaSound.mp3",
					["do_sound"] = true,
				},
				["finish"] = {
				},
			},
			["additional_triggers"] = {
				{
					["trigger"] = {
						["stack_info"] = "count",
						["type"] = "aura",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["group_countOperator"] = "==",
						["name_info"] = "aura",
						["specificUnit"] = "Creapur",
						["group_count"] = "1",
						["names"] = {
							"Malice", -- [1]
						},
						["unit"] = "group",
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["xOffset"] = -393.9426879882813,
			["frameStrata"] = 1,
			["width"] = 178.7500152587891,
			["inverse"] = false,
			["justify"] = "LEFT",
			["numTriggers"] = 2,
			["id"] = "GET IN",
			["desaturate"] = false,
			["displayIcon"] = "Interface\\Icons\\Ability_Warlock_Eradication",
			["stacksPoint"] = "BOTTOMRIGHT",
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Nazgrim - Battle Stance"] = {
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
				["form"] = 0,
				["unit"] = "member",
				["use_specific_unit"] = true,
			},
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "update",
			["icon"] = true,
			["animation"] = {
				["start"] = {
					["preset"] = "bounceDecay",
					["duration_type"] = "seconds",
					["type"] = "preset",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["use_form"] = true,
				["source"] = "General Nazgrim",
				["duration"] = "60",
				["names"] = {
					"Defensive Stance", -- [1]
				},
				["specificUnit"] = "boss1",
				["custom_hide"] = "timed",
				["type"] = "event",
				["subeventSuffix"] = "_AURA_APPLIED",
				["subeventPrefix"] = "SPELL",
				["form"] = 0,
				["event"] = "Combat Log",
				["spellName"] = "Battle Stance",
				["use_inverse"] = false,
				["use_spellName"] = true,
				["debuffType"] = "HARMFUL",
				["unevent"] = "timed",
				["unit"] = "member",
				["use_source"] = true,
				["use_unit"] = true,
				["use_specific_unit"] = true,
			},
			["desaturate"] = false,
			["font"] = "Friz Quadrata TT",
			["height"] = 64,
			["load"] = {
				["role"] = {
					["multi"] = {
					},
				},
				["use_zone"] = true,
				["zone"] = "Siege of Orgrimmar",
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["use_combat"] = true,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 24,
			["displayStacks"] = "Battle Stance",
			["regionType"] = "icon",
			["cooldown"] = true,
			["yOffset"] = 166,
			["stacksContainment"] = "OUTSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["xOffset"] = 555,
			["id"] = "Nazgrim - Battle Stance",
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["width"] = 64,
			["inverse"] = false,
			["stickyDuration"] = false,
			["numTriggers"] = 1,
			["actions"] = {
				["start"] = {
					["message"] = "",
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BikeHorn.mp3",
					["do_message"] = false,
					["do_sound"] = false,
				},
				["finish"] = {
				},
			},
			["additional_triggers"] = {
			},
			["displayIcon"] = "Interface\\Icons\\Ability_Warrior_OffensiveStance",
			["stacksPoint"] = "BOTTOM",
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
	},
	["registered"] = {
	},
	["talent_cache"] = {
		["HUNTER"] = {
		},
		["WARRIOR"] = {
			{
				["name"] = "Juggernaut",
				["icon"] = "Interface\\Icons\\Ability_Warrior_BullRush",
			}, -- [1]
			{
				["name"] = "Double Time",
				["icon"] = "Interface\\Icons\\INV_Misc_Horn_04",
			}, -- [2]
			{
				["name"] = "Warbringer",
				["icon"] = "Interface\\Icons\\Ability_Warrior_Warbringer",
			}, -- [3]
			{
				["name"] = "Enraged Regeneration",
				["icon"] = "Interface\\Icons\\Ability_Warrior_FocusedRage",
			}, -- [4]
			{
				["name"] = "Second Wind",
				["icon"] = "Interface\\Icons\\Ability_Hunter_Harass",
			}, -- [5]
			{
				["name"] = "Impending Victory",
				["icon"] = "Interface\\Icons\\spell_impending_victory",
			}, -- [6]
			{
				["name"] = "Staggering Shout",
				["icon"] = "Interface\\Icons\\Ability_BullRush",
			}, -- [7]
			{
				["name"] = "Piercing Howl",
				["icon"] = "Interface\\Icons\\Spell_Shadow_DeathScream",
			}, -- [8]
			{
				["name"] = "Disrupting Shout",
				["icon"] = "Interface\\Icons\\warrior_disruptingshout",
			}, -- [9]
			{
				["name"] = "Bladestorm",
				["icon"] = "Interface\\Icons\\Ability_Warrior_Bladestorm",
			}, -- [10]
			{
				["name"] = "Shockwave",
				["icon"] = "Interface\\Icons\\Ability_Warrior_Shockwave",
			}, -- [11]
			{
				["name"] = "Dragon Roar",
				["icon"] = "Interface\\Icons\\ability_warrior_dragonroar",
			}, -- [12]
			{
				["name"] = "Mass Spell Reflection",
				["icon"] = "Interface\\Icons\\Ability_Warrior_ShieldBreak",
			}, -- [13]
			{
				["name"] = "Safeguard",
				["icon"] = "Interface\\Icons\\Ability_Warrior_Safeguard",
			}, -- [14]
			{
				["name"] = "Vigilance",
				["icon"] = "Interface\\Icons\\Ability_Warrior_Vigilance",
			}, -- [15]
			{
				["name"] = "Avatar",
				["icon"] = "Interface\\Icons\\warrior_talent_icon_avatar",
			}, -- [16]
			{
				["name"] = "Bloodbath",
				["icon"] = "Interface\\Icons\\Ability_Warrior_BloodBath",
			}, -- [17]
			{
				["name"] = "Storm Bolt",
				["icon"] = "Interface\\Icons\\warrior_talent_icon_stormbolt",
			}, -- [18]
		},
		["ROGUE"] = {
			{
				["name"] = "Nightstalker",
				["icon"] = "Interface\\Icons\\Ability_Stealth",
			}, -- [1]
			{
				["name"] = "Subterfuge",
				["icon"] = "Interface\\Icons\\rogue_subterfuge",
			}, -- [2]
			{
				["name"] = "Shadow Focus",
				["icon"] = "Interface\\Icons\\rogue_shadowfocus",
			}, -- [3]
			{
				["name"] = "Deadly Throw",
				["icon"] = "Interface\\Icons\\INV_ThrowingKnife_06",
			}, -- [4]
			{
				["name"] = "Nerve Strike",
				["icon"] = "Interface\\Icons\\rogue_nerve _strike",
			}, -- [5]
			{
				["name"] = "Combat Readiness",
				["icon"] = "INTERFACE\\ICONS\\ability_rogue_combatreadiness",
			}, -- [6]
			{
				["name"] = "Cheat Death",
				["icon"] = "Interface\\Icons\\Ability_Rogue_CheatDeath",
			}, -- [7]
			{
				["name"] = "Leeching Poison",
				["icon"] = "Interface\\Icons\\rogue_leeching_poison",
			}, -- [8]
			{
				["name"] = "Elusiveness",
				["icon"] = "Interface\\Icons\\Ability_Rogue_TurntheTables",
			}, -- [9]
			{
				["name"] = "Cloak and Dagger",
				["icon"] = "Interface\\Icons\\Ability_Rogue_UnfairAdvantage",
			}, -- [10]
			{
				["name"] = "Shadowstep",
				["icon"] = "Interface\\Icons\\Ability_Rogue_Shadowstep",
			}, -- [11]
			{
				["name"] = "Burst of Speed",
				["icon"] = "Interface\\Icons\\rogue_burstofspeed",
			}, -- [12]
			{
				["name"] = "Prey on the Weak",
				["icon"] = "Interface\\Icons\\Ability_Rogue_PreyontheWeak",
			}, -- [13]
			{
				["name"] = "Paralytic Poison",
				["icon"] = "Interface\\Icons\\rogue_paralytic_poison",
			}, -- [14]
			{
				["name"] = "Dirty Tricks",
				["icon"] = "Interface\\Icons\\ability_rogue_dirtydeeds",
			}, -- [15]
			{
				["name"] = "Shuriken Toss",
				["icon"] = "INTERFACE\\ICONS\\inv_throwingknife_07",
			}, -- [16]
			{
				["name"] = "Marked for Death",
				["icon"] = "Interface\\Icons\\Achievement_BG_killingblow_berserker",
			}, -- [17]
			{
				["name"] = "Anticipation",
				["icon"] = "Interface\\Icons\\Ability_Rogue_SlaughterfromtheShadows",
			}, -- [18]
		},
		["MAGE"] = {
		},
		["PRIEST"] = {
		},
		["WARLOCK"] = {
		},
		["PALADIN"] = {
		},
		["DEATHKNIGHT"] = {
		},
		["DRUID"] = {
		},
		["MONK"] = {
		},
		["SHAMAN"] = {
			{
				["name"] = "Nature's Guardian",
				["icon"] = "Interface\\Icons\\Spell_Nature_NatureGuardian",
			}, -- [1]
			{
				["name"] = "Stone Bulwark Totem",
				["icon"] = "Interface\\Icons\\ability_shaman_stonebulwark",
			}, -- [2]
			{
				["name"] = "Astral Shift",
				["icon"] = "Interface\\Icons\\ability_shaman_astralshift",
			}, -- [3]
			{
				["name"] = "Frozen Power",
				["icon"] = "Interface\\Icons\\Spell_Fire_BlueCano",
			}, -- [4]
			{
				["name"] = "Earthgrab Totem",
				["icon"] = "Interface\\Icons\\Spell_Nature_StrangleVines",
			}, -- [5]
			{
				["name"] = "Windwalk Totem",
				["icon"] = "Interface\\Icons\\ability_shaman_windwalktotem",
			}, -- [6]
			{
				["name"] = "Call of the Elements",
				["icon"] = "Interface\\Icons\\ability_shaman_multitotemactivation",
			}, -- [7]
			{
				["name"] = "Totemic Persistence",
				["icon"] = "Interface\\Icons\\ability_shaman_totemcooldownrefund",
			}, -- [8]
			{
				["name"] = "Totemic Projection",
				["icon"] = "Interface\\Icons\\ability_shaman_totemrelocation",
			}, -- [9]
			{
				["name"] = "Elemental Mastery",
				["icon"] = "Interface\\Icons\\Spell_Nature_WispHeal",
			}, -- [10]
			{
				["name"] = "Ancestral Swiftness",
				["icon"] = "Interface\\Icons\\Spell_Shaman_ElementalOath",
			}, -- [11]
			{
				["name"] = "Echo of the Elements",
				["icon"] = "Interface\\Icons\\ability_shaman_echooftheelements",
			}, -- [12]
			{
				["name"] = "Rushing Streams",
				["icon"] = "Interface\\Icons\\INV_Spear_04",
			}, -- [13]
			{
				["name"] = "Ancestral Guidance",
				["icon"] = "Interface\\Icons\\ability_shaman_ancestralguidance",
			}, -- [14]
			{
				["name"] = "Conductivity",
				["icon"] = "Interface\\Icons\\ability_shaman_fortifyingwaters",
			}, -- [15]
			{
				["name"] = "Unleashed Fury",
				["icon"] = "Interface\\Icons\\shaman_talent_unleashedfury",
			}, -- [16]
			{
				["name"] = "Primal Elementalist",
				["icon"] = "Interface\\Icons\\shaman_talent_primalelementalist",
			}, -- [17]
			{
				["name"] = "Elemental Blast",
				["icon"] = "Interface\\Icons\\shaman_talent_elementalblast",
			}, -- [18]
		},
	},
	["frame"] = {
		["xOffset"] = -361.9989013671875,
		["width"] = 630.000244140625,
		["height"] = 492,
		["yOffset"] = -283.000244140625,
	},
	["tempIconCache"] = {
		["Cloak of Shadows"] = "Interface\\Icons\\Spell_Shadow_NetherCloak",
		["Synapse Springs"] = "Interface\\Icons\\Spell_Shaman_ElementalOath",
		["Weakened Resolve"] = "Interface\\Icons\\ability_titankeeper_phasing",
		["Revealing Strike"] = "INTERFACE\\ICONS\\inv_sword_97",
		["Weakened Armor"] = "Interface\\Icons\\Ability_Warrior_Sunder",
		["Slice and Dice"] = "Interface\\Icons\\Ability_Rogue_SliceDice",
		["Rupture"] = "Interface\\Icons\\Ability_Rogue_Rupture",
		["Recuperate"] = "INTERFACE\\ICONS\\ability_rogue_recuperate",
		["Feint"] = "Interface\\Icons\\Ability_Rogue_Feint",
		["Tricks of the Trade"] = "Interface\\Icons\\Ability_Rogue_TricksOftheTrade",
		["Vicious"] = "INTERFACE\\ICONS\\ability_racial_viciousness",
		["Dextrous"] = "Interface\\Icons\\Spell_Shadow_FingerOfDeath",
	},
	["login_squelch_time"] = 10,
}
