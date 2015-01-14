
ElvDB = {
	["profileKeys"] = {
		["Boomflower - Rexxar"] = "Boomflower - Rexxar",
		["Nathreizm - Drenden"] = "Nathreizm - Drenden",
		["Ahrian - Arthas"] = "Ahrian - Arthas",
		["Mithrios - Rexxar"] = "Mithrios - Rexxar",
		["Nathreizm - Stormreaver"] = "Nathreizm - Stormreaver",
		["Nathreizm - Cho'gall"] = "Nathreizm - Cho'gall",
		["Littleboytoy - Cho'gall"] = "Littleboytoy - Cho'gall",
		["Nathreizm - Azralon"] = "Nathreizm - Azralon",
		["Nathreizm - Arthas"] = "Nathreizm - Arthas",
		["Prettypretty - Rexxar"] = "Prettypretty - Rexxar",
		["Nathreizm - Thrall"] = "Nathreizm - Thrall",
	},
	["gold"] = {
		["Thrall"] = {
			["Nathreizm"] = 0,
		},
		["Rexxar"] = {
			["Mithrios"] = 95055238,
			["Prettypretty"] = 69858069,
			["Boomflower"] = 265274,
		},
		["Stormreaver"] = {
			["Nathreizm"] = 0,
		},
		["Azralon"] = {
			["Nathreizm"] = 0,
		},
		["Cho'gall"] = {
			["Nathreizm"] = 337459863,
			["Littleboytoy"] = 13402,
		},
		["Arthas"] = {
			["Nathreizm"] = 716283821,
			["Ahrian"] = 141885286,
		},
		["Drenden"] = {
			["Nathreizm"] = 1257,
		},
	},
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
		},
	},
	["global"] = {
		["unitframe"] = {
			["ChannelTicks"] = {
				["Insanity"] = 3,
				["Mind Flay"] = 3,
			},
		},
	},
	["profiles"] = {
		["Boomflower - Rexxar"] = {
			["bagsOffsetFixed"] = true,
			["movers"] = {
				["ElvUF_PartyMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT4195",
				["ElvUF_RaidMover"] = "TOPLEFTElvUIParentBOTTOMLEFT4427",
				["ElvUF_Raid40Mover"] = "TOPLEFTElvUIParentBOTTOMLEFT4424",
				["ElvUF_RaidpetMover"] = "TOPLEFTElvUIParentBOTTOMLEFT4736",
			},
		},
		["Nathreizm - Drenden"] = {
			["currentTutorial"] = 1,
			["bagsOffsetFixed"] = true,
			["movers"] = {
				["ElvUF_PartyMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT4195",
				["ElvUF_RaidMover"] = "TOPLEFTElvUIParentBOTTOMLEFT4427",
				["ElvUF_Raid40Mover"] = "TOPLEFTElvUIParentBOTTOMLEFT4424",
				["ElvUF_RaidpetMover"] = "TOPLEFTElvUIParentBOTTOMLEFT4736",
			},
		},
		["Mithrios - Rexxar"] = {
			["currentTutorial"] = 5,
			["bagsOffsetFixed"] = true,
			["movers"] = {
				["ElvUF_RaidpetMover"] = "TOPLEFTElvUIParentBOTTOMLEFT4736",
				["ElvUF_TargetMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-367278",
				["ElvUF_FocusMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT0302",
				["ElvAB_2"] = "BOTTOMElvUIParentBOTTOM038",
				["ElvUF_RaidMover"] = "TOPLEFTElvUIParentBOTTOMLEFT4427",
				["BNETMover"] = "TOPRIGHTElvUIParentTOPRIGHT0-262",
				["BossHeaderMover"] = "TOPRIGHTElvUIParentTOPRIGHT-373-168",
				["ElvUF_PlayerMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT0361",
				["ArenaHeaderMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-99251",
				["LeftChatMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT00",
				["LootFrameMover"] = "TOPLEFTElvUIParentTOPLEFT447-356",
				["DebuffsMover"] = "TOPLEFTElvUIParentTOPLEFT0-427",
				["DigSiteProgressBarMover"] = "TOPRIGHTElvUIParentTOPRIGHT-357-376",
			},
			["auras"] = {
				["buffs"] = {
					["wrapAfter"] = 10,
					["size"] = 28,
				},
				["debuffs"] = {
					["wrapAfter"] = 8,
					["size"] = 30,
				},
			},
			["unitframe"] = {
				["colors"] = {
					["auraBarBuff"] = {
						["r"] = 0.78,
						["g"] = 0.61,
						["b"] = 0.43,
					},
					["castClassColor"] = true,
					["healthclass"] = true,
				},
				["units"] = {
					["boss"] = {
						["enable"] = false,
					},
					["tank"] = {
						["enable"] = false,
					},
					["raid40"] = {
						["enable"] = false,
					},
					["player"] = {
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["target"] = {
						["debuffs"] = {
							["anchorPoint"] = "BOTTOMRIGHT",
							["attachTo"] = "FRAME",
							["yOffset"] = -35,
						},
						["buffs"] = {
							["anchorPoint"] = "BOTTOMRIGHT",
						},
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["raid"] = {
						["enable"] = false,
					},
					["targettarget"] = {
						["enable"] = false,
					},
					["party"] = {
						["enable"] = false,
					},
				},
			},
			["datatexts"] = {
				["panels"] = {
					["LeftChatDataPanel"] = {
						["left"] = "DPS",
						["right"] = "Attack Power",
					},
				},
			},
			["actionbar"] = {
				["bar3"] = {
					["enabled"] = false,
				},
				["barPet"] = {
					["enabled"] = false,
				},
				["bar1"] = {
					["enabled"] = false,
				},
				["stanceBar"] = {
					["enabled"] = false,
				},
				["bar5"] = {
					["enabled"] = false,
				},
				["bar4"] = {
					["enabled"] = false,
				},
			},
			["layoutSet"] = "tank",
			["general"] = {
				["valuecolor"] = {
					["r"] = 0.78,
					["g"] = 0.61,
					["b"] = 0.43,
				},
				["bordercolor"] = {
					["r"] = 0.31,
					["g"] = 0.31,
					["b"] = 0.31,
				},
			},
			["chat"] = {
				["emotionIcons"] = false,
			},
		},
		["Nathreizm - Stormreaver"] = {
		},
		["Prettypretty - Rexxar"] = {
			["bagsOffsetFixed"] = true,
			["currentTutorial"] = 12,
			["general"] = {
				["valuecolor"] = {
					["b"] = 0.73,
					["g"] = 0.55,
					["r"] = 0.96,
				},
				["bordercolor"] = {
					["b"] = 0.31,
					["g"] = 0.31,
					["r"] = 0.31,
				},
			},
			["movers"] = {
				["ElvUF_Raid40Mover"] = "TOPLEFTElvUIParentBOTTOMLEFT0900",
				["ElvUF_PlayerCastbarMover"] = "BOTTOMElvUIParentBOTTOM-218161",
				["ElvUF_RaidMover"] = "TOPLEFTElvUIParentBOTTOMLEFT4427",
				["LeftChatMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT00",
				["ElvUF_Raid10Mover"] = "TOPLEFTElvUIParentTOPLEFT00",
				["LootFrameMover"] = "TOPLEFTElvUIParentTOPLEFT291-292",
				["BNETMover"] = "TOPRIGHTElvUIParentTOPRIGHT0-262",
				["ElvUF_RaidpetMover"] = "TOPLEFTElvUIParentBOTTOMLEFT0662",
				["ElvUF_TargetCastbarMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT0296",
				["ElvUF_FocusMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT0366",
				["ArenaHeaderMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-99251",
				["ElvAB_2"] = "BOTTOMElvUIParentBOTTOM038",
				["ElvUF_Raid25Mover"] = "TOPLEFTElvUIParentTOPLEFT00",
				["BossHeaderMover"] = "TOPRIGHTElvUIParentTOPRIGHT-309-295",
				["TotemBarMover"] = "TOPLEFTElvUIParentTOPLEFT4680",
				["VehicleSeatMover"] = "TOPRIGHTElvUIParentTOPRIGHT-256-160",
				["ElvUF_PartyMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT0668",
				["ElvUF_PlayerMover"] = "BOTTOMElvUIParentBOTTOM-218187",
				["DebuffsMover"] = "BOTTOMElvUIParentBOTTOM-210243",
				["ElvUF_TargetMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT0207",
			},
			["layoutSet"] = "tank",
			["datatexts"] = {
				["panels"] = {
					["LeftChatDataPanel"] = {
						["left"] = "HPS",
						["right"] = "Spell/Heal Power",
					},
				},
			},
			["unitframe"] = {
				["colors"] = {
					["auraBarBuff"] = {
						["b"] = 0.43,
						["g"] = 0.61,
						["r"] = 0.78,
					},
					["castClassColor"] = true,
					["healthclass"] = true,
				},
				["units"] = {
					["target"] = {
						["aurabar"] = {
							["enable"] = false,
						},
						["debuffs"] = {
							["anchorPoint"] = "BOTTOMLEFT",
							["yOffset"] = -35,
						},
					},
					["tank"] = {
						["enable"] = false,
					},
					["targettarget"] = {
						["enable"] = false,
					},
					["player"] = {
						["aurabar"] = {
							["enable"] = false,
						},
					},
				},
			},
			["auras"] = {
				["buffs"] = {
					["size"] = 28,
					["wrapAfter"] = 10,
				},
				["debuffs"] = {
					["size"] = 30,
					["wrapAfter"] = 8,
				},
			},
		},
		["Nathreizm - Arthas"] = {
			["currentTutorial"] = 4,
			["general"] = {
				["bordercolor"] = {
					["r"] = 0.31,
					["g"] = 0.31,
					["b"] = 0.31,
				},
				["valuecolor"] = {
					["r"] = 1,
					["g"] = 0.96,
					["b"] = 0.41,
				},
			},
			["movers"] = {
				["BNETMover"] = "TOPRIGHTElvUIParentTOPRIGHT0-262",
				["DigSiteProgressBarMover"] = "TOPRIGHTElvUIParentTOPRIGHT-357-376",
				["ElvUF_FocusMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT0302",
				["ElvAB_2"] = "BOTTOMElvUIParentBOTTOM038",
				["ElvUF_RaidMover"] = "TOPLEFTElvUIParentBOTTOMLEFT4427",
				["ElvUF_RaidpetMover"] = "TOPLEFTElvUIParentBOTTOMLEFT4736",
				["BossHeaderMover"] = "TOPRIGHTElvUIParentTOPRIGHT-373-168",
				["ElvUF_PlayerMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT0361",
				["LeftChatMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT00",
				["ArenaHeaderMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-99251",
				["LootFrameMover"] = "TOPLEFTElvUIParentTOPLEFT447-356",
				["DebuffsMover"] = "TOPLEFTElvUIParentTOPLEFT0-427",
				["ElvUF_TargetMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-367278",
			},
			["bagsOffsetFixed"] = true,
			["auras"] = {
				["buffs"] = {
					["wrapAfter"] = 10,
					["size"] = 28,
				},
				["debuffs"] = {
					["wrapAfter"] = 8,
					["size"] = 30,
				},
			},
			["unitframe"] = {
				["units"] = {
					["tank"] = {
						["enable"] = false,
					},
					["boss"] = {
						["enable"] = false,
					},
					["raid40"] = {
						["enable"] = false,
					},
					["target"] = {
						["debuffs"] = {
							["yOffset"] = -35,
							["anchorPoint"] = "BOTTOMRIGHT",
							["attachTo"] = "FRAME",
						},
						["aurabar"] = {
							["enable"] = false,
						},
						["buffs"] = {
							["anchorPoint"] = "BOTTOMRIGHT",
						},
					},
					["raid"] = {
						["enable"] = false,
					},
					["targettarget"] = {
						["enable"] = false,
					},
					["player"] = {
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["party"] = {
						["enable"] = false,
					},
				},
				["colors"] = {
					["auraBarBuff"] = {
						["r"] = 0.78,
						["g"] = 0.61,
						["b"] = 0.43,
					},
					["healthclass"] = true,
					["castClassColor"] = true,
				},
			},
			["datatexts"] = {
				["panels"] = {
					["LeftChatDataPanel"] = {
						["right"] = "Attack Power",
						["left"] = "DPS",
					},
				},
			},
			["actionbar"] = {
				["bar3"] = {
					["enabled"] = false,
				},
				["bar5"] = {
					["enabled"] = false,
				},
				["bar1"] = {
					["enabled"] = false,
				},
				["stanceBar"] = {
					["enabled"] = false,
				},
				["barPet"] = {
					["enabled"] = false,
				},
				["bar4"] = {
					["enabled"] = false,
				},
			},
			["layoutSet"] = "tank",
			["chat"] = {
				["emotionIcons"] = false,
			},
		},
		["Nathreizm - Cho'gall"] = {
			["currentTutorial"] = 10,
			["general"] = {
				["valuecolor"] = {
					["b"] = 0.41,
					["g"] = 0.96,
					["r"] = 1,
				},
				["bordercolor"] = {
					["b"] = 0.31,
					["g"] = 0.31,
					["r"] = 0.31,
				},
			},
			["movers"] = {
				["BNETMover"] = "TOPRIGHTElvUIParentTOPRIGHT0-262",
				["ElvUF_FocusMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT0302",
				["ElvAB_2"] = "BOTTOMElvUIParentBOTTOM038",
				["BossHeaderMover"] = "TOPRIGHTElvUIParentTOPRIGHT-373-168",
				["ElvUF_PlayerMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT0361",
				["LeftChatMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT00",
				["ArenaHeaderMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-99251",
				["LootFrameMover"] = "TOPLEFTElvUIParentTOPLEFT447-356",
				["DebuffsMover"] = "TOPLEFTElvUIParentTOPLEFT0-427",
				["ElvUF_TargetMover"] = "BOTTOMElvUIParentBOTTOM239207",
			},
			["auras"] = {
				["buffs"] = {
					["size"] = 28,
					["wrapAfter"] = 10,
				},
				["debuffs"] = {
					["size"] = 30,
					["wrapAfter"] = 8,
				},
			},
			["unitframe"] = {
				["colors"] = {
					["auraBarBuff"] = {
						["b"] = 0.43,
						["g"] = 0.61,
						["r"] = 0.78,
					},
					["castClassColor"] = true,
					["healthclass"] = true,
				},
				["units"] = {
					["tank"] = {
						["enable"] = false,
					},
					["raid10"] = {
						["enable"] = false,
					},
					["targettarget"] = {
						["enable"] = false,
					},
					["boss"] = {
						["enable"] = false,
					},
					["raid40"] = {
						["enable"] = false,
					},
					["target"] = {
						["aurabar"] = {
							["enable"] = false,
						},
						["debuffs"] = {
							["yOffset"] = -35,
						},
					},
					["raid25"] = {
						["enable"] = false,
					},
					["party"] = {
						["enable"] = false,
					},
					["player"] = {
						["aurabar"] = {
							["enable"] = false,
						},
					},
				},
			},
			["datatexts"] = {
				["panels"] = {
					["LeftChatDataPanel"] = {
						["left"] = "DPS",
						["right"] = "Attack Power",
					},
				},
			},
			["actionbar"] = {
				["bar3"] = {
					["enabled"] = false,
				},
				["microbar"] = {
					["enabled"] = true,
				},
				["bar5"] = {
					["enabled"] = false,
				},
				["bar1"] = {
					["enabled"] = false,
				},
				["stanceBar"] = {
					["enabled"] = false,
				},
				["barPet"] = {
					["enabled"] = false,
				},
				["bar4"] = {
					["enabled"] = false,
				},
			},
			["layoutSet"] = "tank",
			["chat"] = {
				["emotionIcons"] = false,
			},
		},
		["Default"] = {
		},
		["Littleboytoy - Cho'gall"] = {
			["currentTutorial"] = 6,
		},
		["Nathreizm - Azralon"] = {
			["currentTutorial"] = 1,
			["bagsOffsetFixed"] = true,
			["movers"] = {
				["ElvUF_PartyMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT4195",
				["ElvUF_RaidMover"] = "TOPLEFTElvUIParentBOTTOMLEFT4427",
				["ElvUF_Raid40Mover"] = "TOPLEFTElvUIParentBOTTOMLEFT4424",
				["ElvUF_RaidpetMover"] = "TOPLEFTElvUIParentBOTTOMLEFT4736",
			},
		},
		["Cho'gall"] = {
		},
		["Ahrian - Arthas"] = {
			["currentTutorial"] = 7,
			["bagsOffsetFixed"] = true,
			["movers"] = {
				["ElvUF_RaidpetMover"] = "TOPLEFTElvUIParentBOTTOMLEFT4736",
				["MinimapMover"] = "TOPRIGHTElvUIParentTOPRIGHT0-15",
				["ElvUF_RaidMover"] = "TOPLEFTElvUIParentBOTTOMLEFT4427",
				["ElvUF_FocusMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT0302",
				["ElvAB_2"] = "BOTTOMElvUIParentBOTTOM038",
				["AlertFrameMover"] = "TOPRIGHTElvUIParentTOPRIGHT-387-181",
				["BNETMover"] = "TOPRIGHTElvUIParentTOPRIGHT0-262",
				["BossHeaderMover"] = "TOPRIGHTElvUIParentTOPRIGHT-373-168",
				["ElvUF_PlayerMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT0361",
				["LeftChatMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT00",
				["ArenaHeaderMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-99251",
				["LootFrameMover"] = "TOPLEFTElvUIParentTOPLEFT447-356",
				["DebuffsMover"] = "TOPLEFTElvUIParentTOPLEFT0-427",
				["ElvUF_TargetMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-367278",
			},
			["auras"] = {
				["debuffs"] = {
					["size"] = 30,
					["wrapAfter"] = 8,
				},
				["buffs"] = {
					["size"] = 28,
					["wrapAfter"] = 10,
				},
			},
			["unitframe"] = {
				["colors"] = {
					["auraBarBuff"] = {
						["b"] = 0.43,
						["g"] = 0.61,
						["r"] = 0.78,
					},
					["castClassColor"] = true,
					["healthclass"] = true,
				},
				["units"] = {
					["party"] = {
						["enable"] = false,
					},
					["boss"] = {
						["enable"] = false,
					},
					["raid40"] = {
						["enable"] = false,
					},
					["player"] = {
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["target"] = {
						["debuffs"] = {
							["anchorPoint"] = "BOTTOMRIGHT",
							["attachTo"] = "FRAME",
							["yOffset"] = -35,
						},
						["buffs"] = {
							["anchorPoint"] = "BOTTOMRIGHT",
						},
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["raid"] = {
						["enable"] = false,
					},
					["targettarget"] = {
						["enable"] = false,
					},
					["tank"] = {
						["enable"] = false,
					},
				},
			},
			["datatexts"] = {
				["panels"] = {
					["LeftChatDataPanel"] = {
						["left"] = "DPS",
						["right"] = "Attack Power",
					},
				},
			},
			["actionbar"] = {
				["bar3"] = {
					["enabled"] = false,
				},
				["bar5"] = {
					["enabled"] = false,
				},
				["bar1"] = {
					["enabled"] = false,
				},
				["stanceBar"] = {
					["enabled"] = false,
				},
				["barPet"] = {
					["enabled"] = false,
				},
				["bar4"] = {
					["enabled"] = false,
				},
			},
			["layoutSet"] = "tank",
			["chat"] = {
				["emotionIcons"] = false,
			},
			["general"] = {
				["valuecolor"] = {
					["b"] = 0.87,
					["g"] = 0.44,
					["r"] = 0,
				},
				["bordercolor"] = {
					["b"] = 0.31,
					["g"] = 0.31,
					["r"] = 0.31,
				},
			},
		},
		["Nathreizm - Thrall"] = {
			["currentTutorial"] = 2,
			["bagsOffsetFixed"] = true,
			["movers"] = {
				["ElvUF_PartyMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT4195",
				["ElvUF_RaidMover"] = "TOPLEFTElvUIParentBOTTOMLEFT4427",
				["ElvUF_Raid40Mover"] = "TOPLEFTElvUIParentBOTTOMLEFT4424",
				["ElvUF_RaidpetMover"] = "TOPLEFTElvUIParentBOTTOMLEFT4736",
			},
		},
	},
}
ElvPrivateDB = {
	["profileKeys"] = {
		["Boomflower - Rexxar"] = "Boomflower - Rexxar",
		["Nathreizm - Drenden"] = "Nathreizm - Drenden",
		["Ahrian - Arthas"] = "Ahrian - Arthas",
		["Mithrios - Rexxar"] = "Mithrios - Rexxar",
		["Nathreizm - Stormreaver"] = "Nathreizm - Stormreaver",
		["Nathreizm - Cho'gall"] = "Nathreizm - Cho'gall",
		["Littleboytoy - Cho'gall"] = "Littleboytoy - Cho'gall",
		["Nathreizm - Azralon"] = "Nathreizm - Azralon",
		["Nathreizm - Arthas"] = "Nathreizm - Arthas",
		["Prettypretty - Rexxar"] = "Prettypretty - Rexxar",
		["Nathreizm - Thrall"] = "Nathreizm - Thrall",
	},
	["profiles"] = {
		["Boomflower - Rexxar"] = {
		},
		["Nathreizm - Drenden"] = {
			["install_complete"] = "7.69",
		},
		["Ahrian - Arthas"] = {
			["actionbar"] = {
				["enable"] = false,
			},
			["bags"] = {
				["enable"] = false,
			},
			["general"] = {
				["minimap"] = {
					["hideGarrison"] = false,
				},
			},
			["install_complete"] = "6.94",
		},
		["Mithrios - Rexxar"] = {
			["general"] = {
				["minimap"] = {
					["hideGarrison"] = false,
				},
			},
			["actionbar"] = {
				["enable"] = false,
			},
			["bags"] = {
				["enable"] = false,
			},
			["theme"] = "class",
			["install_complete"] = "6.94",
		},
		["Nathreizm - Stormreaver"] = {
		},
		["Nathreizm - Cho'gall"] = {
			["install_complete"] = "6.94",
			["theme"] = "class",
			["actionbar"] = {
				["enable"] = false,
			},
		},
		["Littleboytoy - Cho'gall"] = {
			["install_complete"] = "6.94",
		},
		["Nathreizm - Azralon"] = {
			["install_complete"] = "7.69",
		},
		["Nathreizm - Arthas"] = {
			["general"] = {
				["minimap"] = {
					["hideGarrison"] = false,
				},
			},
			["bags"] = {
				["enable"] = false,
			},
			["auras"] = {
				["enable"] = false,
				["disableBlizzard"] = false,
			},
			["actionbar"] = {
				["enable"] = false,
			},
			["install_complete"] = "6.94",
		},
		["Prettypretty - Rexxar"] = {
			["bags"] = {
				["enable"] = false,
			},
			["install_complete"] = "6.94",
			["actionbar"] = {
				["enable"] = false,
			},
		},
		["Nathreizm - Thrall"] = {
			["install_complete"] = "7.69",
		},
	},
}
