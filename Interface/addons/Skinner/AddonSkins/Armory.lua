local aName, aObj = ...
if not aObj:isAddonEnabled("Armory") then return end
local _G = _G

function aObj:Armory()

-->>-- Static Popup
	self:addSkinFrame{obj=_G.ArmoryStaticPopup, kfs=true}

-->>-- Armory frame
	self:moveObject{obj=_G.ArmoryBuffFrame, y=-2} -- buff buttons, top of frame
	self:moveObject{obj=_G.ArmoryFramePortrait, x=6, y=-10}
	self:moveObject{obj=_G.ArmoryFramePortraitButton, x=6, y=-10}
	self:moveObject{obj=self:getRegion(_G.ArmoryFramePortraitButton, 1), x=-5, y=8}
	-- move character selection buttons to top of portrait
	self:moveObject{obj=_G.ArmoryFrameLeftButton, x=-2, y=64}
	self:moveObject{obj=_G.ArmoryFrameRightButton, x=-2, y=64}
	self:addSkinFrame{obj=_G.ArmoryFrame, kfs=true, nb=true, ri=true, y1=2, x2=1, y2=-5}
	self:skinButton{obj=_G.ArmoryFrameCloseButton, cb=true}
	self:addButtonBorder{obj=_G.ArmorySelectCharacter, ofs=0, y1=-1, x2=-1}
	_G.ArmoryFramePortrait:SetAlpha(1) -- used to delete characters
	-- Tabs (bottom)
	self:skinTabs{obj=_G.ArmoryFrame, lod=true}
	-- Tabs (RHS)
	for i = 1, _G.ARMORY_MAX_LINE_TABS do
		local tabName = _G["ArmoryFrameLineTab" .. i]
		self:removeRegions(tabName, {1}) -- N.B. region 2 is the icon, 3 is the text
		-- Move the first entry as all the others are positioned from it
		if i == 1 then self:moveObject{obj=tabName, x=-2} end
	end
	-- DropDown Menus
	for i = 1, 2 do
		local ddM = "ArmoryDropDownList" .. i
		_G[ddM .. "Backdrop"]:SetAlpha(0)
		_G[ddM .. "MenuBackdrop"]:SetAlpha(0)
		self:addSkinFrame{obj=_G[ddM], kfs=true}
	end

-->>-- Character Tab
	self:keepFontStrings(_G.ArmoryPaperDollFrame)
	self:addButtonBorder{obj=_G.ArmoryGearSetToggleButton, x1=0, x2=0}
	for i = 1, _G.MAX_EQUIPMENT_SETS_PER_PLAYER do
		local btn = _G["ArmoryGearSetButton" .. i]
		btn:DisableDrawLayer("BACKGROUND")
		self:addButtonBorder{obj=btn, relTo=btn.icon, reParent={btn.text}}
	end
	self:addSkinFrame{obj=_G.ArmoryGearSetFrame, kfs=true}
	self:keepFontStrings(_G.ArmoryPaperDollTalent)
	for i = 1, 2 do
		local sBar = "ArmoryPaperDollTradeSkillFrame" .. i
		self:glazeStatusBar(_G[sBar .. "Bar"])
		self:glazeStatusBar(_G[sBar .. "BackgroundBar"])
		_G[sBar .. "BackgroundBar"]:SetStatusBarColor(_G.unpack(self.sbColour))
	end
	self:keepFontStrings(_G.ArmoryPaperDollTradeSkill)
	self:skinDropDown{obj=_G.ArmoryAttributesFramePlayerStatDropDown}
	_G.ArmoryAttributesFrame:DisableDrawLayer("BACKGROUND")
	-- slots
	for _, child in _G.ipairs{_G.ArmoryPaperDollItemsFrame:GetChildren()} do
		child:DisableDrawLayer("BACKGROUND")
		self:addButtonBorder{obj=child}
	end
	self:keepFontStrings(_G.ArmoryPaperDollTalentOverlay)
	for i = 1, 2 do
		local sBar = "ArmoryPaperDollTradeSkillOverlayFrame" .. i
		self:glazeStatusBar(_G[sBar .. "Bar"])
		self:glazeStatusBar(_G[sBar .. "BackgroundBar"])
		_G[sBar .. "BackgroundBar"]:SetStatusBarColor(_G.unpack(self.sbColour))
	end
	self:keepFontStrings(_G.ArmoryPaperDollTradeSkillOverlay)
	self:skinDropDown{obj=_G.ArmoryAttributesOverlayTopFramePlayerStatDropDown}
	_G.ArmoryAttributesOverlayTopFrame:DisableDrawLayer("BACKGROUND")
	self:skinDropDown{obj=_G.ArmoryAttributesOverlayBottomFramePlayerStatDropDown}
	_G.ArmoryAttributesOverlayBottomFrame:DisableDrawLayer("BACKGROUND")

-->>-- Pet Tab
	self:addButtonBorder{obj=_G.ArmoryPetFramePetInfo, relTo=_G.ArmoryPetFrameSelectedPetIcon}
	_G.ArmoryPetSpecFrame.ring:SetAlpha(0)
	-- Specs
	for i = 1, 6 do
		_G["ArmoryPetAbility" .. i].ring:SetAlpha(0)
	end
	-- Stats
	for i = 1, 7 do
		local frame = _G["ArmoryPetStatsPaneCategory" .. i]
		frame.BgTop:SetAlpha(0)
		frame.BgBottom:SetAlpha(0)
		frame.BgMiddle:SetAlpha(0)
		frame.BgMinimized:SetAlpha(0)
	end
	-- Pets buttons
	for i = 1, 5 do
		_G["ArmoryPetFramePet" .. i .. "Background"]:SetAlpha(0)
		self:addButtonBorder{obj=_G["ArmoryPetFramePet" .. i]}
	end
	self:addButtonBorder{obj=_G.ArmoryPetFrameNextPageButton, ofs=0}
	self:addButtonBorder{obj=_G.ArmoryPetFramePrevPageButton, ofs=0}

-->>-- Talents Tab
	self:removeRegions(_G.ArmoryTalentFrame, {2}) -- horizontal line
	_G.ArmoryTalentFrame.Spec.ring:SetAlpha(0)
	for i = 1, 6 do
		_G.ArmoryTalentFrame.Glyphs["Glyph" .. i].ring:SetAlpha(0)
	end

-->>-- PVP Tab
	self:keepFontStrings(_G.ArmoryPVPFrame)
	self:skinButton{obj=_G.ArmoryConquestFrame.Arena2v2}
	self:skinButton{obj=_G.ArmoryConquestFrame.Arena3v3}
	self:skinButton{obj=_G.ArmoryConquestFrame.Arena5v5}
	self:skinButton{obj=_G.ArmoryConquestFrame.RatedBG}
	-- ArmoryConquest Tooltip
	self:addSkinFrame{obj=_G.ArmoryConquestTooltip}

-->>-- Other Tab (parent for the Reputation, RaidInfo & Currency Frames)
	self:keepFontStrings(_G.ArmoryOtherFrame)
	-- Tabs (top of frame)
	for i = 1, 4 do
		local tab = _G["ArmoryOtherFrameTab" .. i]
		tab:DisableDrawLayer("BACKGROUND")
		self:addSkinFrame{obj=tab, x1=3, x2=-3}
	end
	-- Reputation SubFrame
	self:keepFontStrings(_G.ArmoryReputationFrame)
	self:skinScrollBar{obj=_G.ArmoryReputationListScrollFrame}
	for i = 1, _G.ARMORY_NUM_FACTIONS_DISPLAYED do
		local bar = "ArmoryReputationBar" .. i
		self:skinButton{obj=_G[bar .. "ExpandOrCollapseButton"], mp=true, ty=0} -- treat as just a texture
		_G[bar .. "ReputationBarLeftTexture"]:SetAlpha(0)
		_G[bar .. "ReputationBarRightTexture"]:SetAlpha(0)
		 _G[bar .. "Background"]:SetAlpha(0)
		self:glazeStatusBar(_G[bar .. "ReputationBar"], 0)
	end
	if self.modBtns then
		-- hook to manage changes to button textures
		self:SecureHook("ArmoryReputationFrame_Update", function()
			for i = 1, _G._G.ARMORY_NUM_FACTIONS_DISPLAYED do
				self:checkTex(_G["ArmoryReputationBar" .. i .. "ExpandOrCollapseButton"])
			end
		end)
	end
	--	RaidInfo SubFrame
	self:keepFontStrings(_G.ArmoryRaidInfoFrame)
	self:skinScrollBar{obj=_G.ArmoryRaidInfoScrollFrame}
	-- Currency SubFrame
	self:keepFontStrings(_G.ArmoryTokenFrame)
	self:skinSlider(_G.ArmoryTokenFrameContainerScrollBar)
	-- remove header textures
	for i = 1, #_G.ArmoryTokenFrameContainer.buttons do
		_G.ArmoryTokenFrameContainer.buttons[i].categoryLeft:SetAlpha(0)
		_G.ArmoryTokenFrameContainer.buttons[i].categoryRight:SetAlpha(0)
		_G.ArmoryTokenFrameContainer.buttons[i].categoryMiddle:SetAlpha(0)
	end

-->>-- Inventory Tab
	self:keepFontStrings(_G.ArmoryInventoryMoneyBackgroundFrame)
	self:skinEditBox(_G.ArmoryInventoryFrameEditBox, {9})
	self:keepFontStrings(_G.ArmoryInventoryExpandButtonFrame)
	self:skinButton{obj=_G.ArmoryInventoryCollapseAllButton, mp=true}
	self:addSkinFrame{obj=_G.ArmoryInventoryFrame, kfs=true, x1=10, y1=-11, x2=-32, y2=71}
	-- Tabs
	self:skinTabs{obj=_G.ArmoryInventoryFrame}
	-- Icon View Tab
	self:skinScrollBar{obj=_G.ArmoryInventoryIconViewFrame}
	-- m/p buttons
	for i = 1, 19 do
		self:skinButton{obj=_G["ArmoryInventoryContainer" .. i .. "Label"], mp=true}
	end
	if self.modBtns then
		-- hook to manage changes to button textures
		self:SecureHook("ArmoryInventoryIconViewFrame_Update", function()
			for i = 1, 19 do
				self:checkTex(_G["ArmoryInventoryContainer" .. i .. "Label"])
			end
			self:checkTex(_G.ArmoryInventoryCollapseAllButton)
		end)
	end
	-- List View Tab
	self:skinScrollBar{obj=_G.ArmoryInventoryListViewScrollFrame}
	-- m/p buttons
	for i = 1, _G.ARMORY_INVENTORY_LINES_DISPLAYED do
		self:skinButton{obj=_G["ArmoryInventoryLine" .. i], mp=true}
	end
	if self.modBtns then
		-- hook to manage changes to button textures
		self:SecureHook("ArmoryInventoryListViewFrame_Update", function()
			for i = 1, _G.ARMORY_INVENTORY_LINES_DISPLAYED do
				local btn = _G["ArmoryInventoryLine" .. i]
				self:checkTex(btn)
				if not self.sBtn[btn]:IsShown() then -- not a header line
					btn:GetNormalTexture():SetAlpha(1) -- show item icon
				end
			end
			self:checkTex(_G.ArmoryInventoryCollapseAllButton)
		end)
	end
	-- Guild Bank Tab
	if _G.IsAddOnLoaded("ArmoryGuildBank") then
		self:skinScrollBar{obj=_G.ArmoryInventoryGuildBankScrollFrame}
		-- m/p buttons
		for i = 1, _G.ARMORY_INVENTORY_LINES_DISPLAYED do
			self:skinButton{obj=_G["ArmoryInventoryGuildBankLine" .. i], mp=true}
		end
		if self.modBtns then
			-- hook to manage changes to button textures
			self:SecureHook("ArmoryInventoryGuildBankFrame_Update", function()
				for i = 1, _G.ARMORY_INVENTORY_LINES_DISPLAYED do
					local btn = _G["ArmoryInventoryGuildBankLine" .. i]
					self:checkTex(btn)
					if not self.sBtn[btn]:IsShown() then -- not a header line
						btn:GetNormalTexture():SetAlpha(1) -- show item icon
					end
				end
				self:checkTex(_G.ArmoryInventoryCollapseAllButton)
			end)
		end
	end

-->>-- Quest Log Tab
	self:SecureHook("ArmoryQuestInfo_Display", function(...)
		-- headers
		_G.ArmoryQuestInfoTitleHeader:SetTextColor(self.HTr, self.HTg, self.HTb)
		_G.ArmoryQuestInfoDescriptionHeader:SetTextColor(self.HTr, self.HTg, self.HTb)
		_G.ArmoryQuestInfoObjectivesHeader:SetTextColor(self.HTr, self.HTg, self.HTb)
		_G.ArmoryQuestInfoRewardsHeader:SetTextColor(self.HTr, self.HTg, self.HTb)
		-- other text
		_G.ArmoryQuestInfoDescriptionText:SetTextColor(self.BTr, self.BTg, self.BTb)
		_G.ArmoryQuestInfoObjectivesText:SetTextColor(self.BTr, self.BTg, self.BTb)
		_G.ArmoryQuestInfoGroupSize:SetTextColor(self.BTr, self.BTg, self.BTb)
		_G.ArmoryQuestInfoRewardText:SetTextColor(self.BTr, self.BTg, self.BTb)
		-- reward frame text
		_G.ArmoryQuestInfoItemChooseText:SetTextColor(self.BTr, self.BTg, self.BTb)
        _G.ArmoryQuestInfoItemReceiveText:SetTextColor(self.BTr, self.BTg, self.BTb)
        _G.ArmoryQuestInfoSpellLearnText:SetTextColor(self.BTr, self.BTg, self.BTb)
        _G.ArmoryQuestInfoXPFrameReceiveText:SetTextColor(self.BTr, self.BTg, self.BTb)
		local r, g, b = _G.ArmoryQuestInfoRequiredMoneyText:GetTextColor()
		_G.ArmoryQuestInfoRequiredMoneyText:SetTextColor(self.BTr - r, self.BTg - g, self.BTb - b)
		-- objectives
		for i = 1, _G.ARMORY_MAX_OBJECTIVES do
			local r, g, b = _G["ArmoryQuestInfoObjective" .. i]:GetTextColor()
			_G["ArmoryQuestInfoObjective" .. i]:SetTextColor(self.BTr - r, self.BTg - g, self.BTb - b)
		end
	end)
	_G.ArmoryQuestInfoTimerText:SetTextColor(self.BTr, self.BTg, self.BTb)
	_G.ArmoryQuestInfoAnchor:SetTextColor(self.BTr, self.BTg, self.BTb)
	self:skinEditBox{obj=_G.ArmoryQuestFrameEditBox}
	-- QuestLog frame
	self:removeRegions(_G.ArmoryQuestLogCollapseAllButton, {5, 6, 7})
	self:skinButton{obj=_G.ArmoryQuestLogCollapseAllButton, mp=true}
	self:keepFontStrings(_G.ArmoryQuestLogFrame)
	self:keepFontStrings(_G.ArmoryEmptyQuestLogFrame)
	-- m/p buttons
	for i = 1, _G.ARMORY_QUESTS_DISPLAYED do
		self:skinButton{obj=_G["ArmoryQuestLogTitle" .. i], mp=true}
	end
	if self.modBtns then
		-- hook to manage changes to button textures
		self:SecureHook("ArmoryQuestLog_Update", function()
			for i = 1, _G.ARMORY_QUESTS_DISPLAYED do
				self:checkTex(_G["ArmoryQuestLogTitle" .. i])
			end
			self:checkTex(_G.ArmoryQuestLogCollapseAllButton)
		end)
	end
	self:skinScrollBar{obj=_G.ArmoryQuestLogListScrollFrame}
	self:skinScrollBar{obj=_G.ArmoryQuestLogDetailScrollFrame}
	self:addSkinFrame{obj=_G.ArmoryQuestFrame, kfs=true, x1=10, y1=-11, x2=-33, y2=52}
	for i = 1, _G.ARMORY_MAX_NUM_ITEMS do
		_G["ArmoryQuestInfoItem" .. i .. "NameFrame"]:SetTexture(nil)
	end

-->>-- Spellbook Tab
	self:addSkinFrame{obj=_G.ArmorySpellBookFrame, kfs=true, x1=10, y1=-12, x2=-31, y2=71}
	-- Tabs (bottom)
	_G.PanelTemplates_SetNumTabs(_G.ArmorySpellBookFrame, 3)
	self:skinTabs{obj=_G.ArmorySpellBookFrame, suffix="Button", lod=true, regs={1}, x1=14, y1=-16, x2=-10, y2=18}
	if self.isTT then
		-- hook to handle tabs
		self:SecureHook("ArmoryToggleSpellBook", function(bookType)
			for i = 1, 3 do
				local tabName = _G["ArmorySpellBookFrameTabButton" .. i]
				local tabSF = tabName.sf
				if tabName.bookType == bookType then
					self:setActiveTab(tabSF)
				else
					self:setInactiveTab(tabSF)
				end
			end
		end)
	end
	-- hook this to manage Inscription Title
	self:SecureHook("ArmorySpellBookFrame_Update", function(showing)
		if _G.ArmorySpellBookFrame.bookType ~= _G.INSCRIPTION then
			_G.ArmorySpellBookTitleText:Show()
		else
			_G.ArmorySpellBookTitleText:Hide() -- hide Inscriptions title
		end
	end)
	-- Spellbook Tab
	for i = 1, _G.SPELLS_PER_PAGE do
		local btn = _G["ArmorySpellButton" .. i]
		btn:DisableDrawLayer("BACKGROUND")
		btn.SpellSubName:SetTextColor(self.BTr, self.BTg, self.BTb)
		btn.RequiredLevelString:SetTextColor(self.BTr, self.BTg, self.BTb)
		self:addButtonBorder{obj=btn}
	end
	self:SecureHook("ArmorySpellButton_UpdateButton", function(this)
		this.SpellName:SetTextColor(self.HTr, self.HTg, self.HTb)
		this.RequiredLevelString:SetTextColor(self.BTr, self.BTg, self.BTb)
	end)
	-- Tabs (side)
	for i = 1, _G.MAX_SKILLLINE_TABS do
		self:removeRegions(_G["ArmorySpellBookSkillLineTab" .. i], {1}) -- N.B. other regions are icon and highlight
	end
	-- Core Abilities Tab
	self:SecureHook("ArmorySpellBook_UpdateCoreAbilitiesTab", function()
		for i = 1, #_G.ArmorySpellBookCoreAbilitiesFrame.Abilities do
			local btn = _G.ArmorySpellBookCoreAbilitiesFrame.Abilities[i]
			btn:DisableDrawLayer("BACKGROUND")
			btn.InfoText:SetTextColor(self.BTr, self.BTg, self.BTb)
			btn.RequiredLevel:SetTextColor(self.BTr, self.BTg, self.BTb)
			if not btn.sbb then self:addButtonBorder{obj=btn} end
		end
	end)
	-- Tabs (side)
	self:SecureHook("ArmorySpellBookCoreAbilities_UpdateTabs", function()
		for i = 1, #_G.ArmorySpellBookCoreAbilitiesFrame.SpecTabs do
			local tab = _G.ArmorySpellBookCoreAbilitiesFrame.SpecTabs[i]
			self:removeRegions(tab, {1})
		end
	end)

-->>-- Achievements Tab
	-- TODO skin in a similar manner to quest frame/other rep frame, tabs as per spellbook
	self:skinEditBox{obj=_G.ArmoryAchievementFrameEditBox, regs={9}}
	self:skinButton{obj=_G.ArmoryAchievementCollapseAllButton, mp=true}
	_G.ArmoryAchievementCollapseAllButton:DisableDrawLayer("BACKGROUND")
	self:skinScrollBar{obj=_G.ArmoryAchievementListScrollFrame}
	self:skinButton{obj=_G.ArmoryAchievementFrameCloseButton, cb=true}
	self:addSkinFrame{obj=_G.ArmoryAchievementFrame, kfs=true, nb=true, x1=10, y1=-11, x2=-33, y2=71}
	-- Tabs
	self:skinTabs{obj=_G.ArmoryAchievementFrame, lod=true}
	-- m/p buttons
	for i = 1, _G.ARMORY_NUM_ACHIEVEMENTS_DISPLAYED do
		self:skinButton{obj=_G["ArmoryAchievementBar" .. i .. "ExpandOrCollapseButton"], mp=true}
		self:glazeStatusBar(_G["ArmoryAchievementBar" .. i .. "AchievementBar"], 0,  _G["ArmoryAchievementBar" .. i .. "Background"])
		self:removeRegions(_G["ArmoryAchievementBar" .. i .. "AchievementBar"], {1, 2}) -- textures
	end
	if self.modBtns then
		-- hook to manage changes to button textures
		self:SecureHook("ArmoryAchievementFrame_Update", function()
			for i = 1, _G.ARMORY_NUM_ACHIEVEMENTS_DISPLAYED do
				self:checkTex(_G["ArmoryAchievementBar" .. i .. "ExpandOrCollapseButton"])
			end
			self:checkTex(_G.ArmoryAchievementCollapseAllButton)
		end)
	end

-->>-- Social Tab
	self:skinFFToggleTabs("ArmorySocialFrameTab", 3, true)
	self:addSkinFrame{obj=_G.ArmorySocialFrame, kfs=true, x1=10, y1=-11, x2=-33, y2=71}
	-- Friends ToggleTab
	self:skinScrollBar{obj=_G.ArmoryFriendsListScrollFrame}
	-- Ignore ToggleTab
	self:skinScrollBar{obj=_G.ArmoryIgnoreListScrollFrame}
	-- Events ToggleTab
	self:skinScrollBar{obj=_G.ArmoryEventsListScrollFrame}

-->>-- Tradeskill Tabs
	self:removeRegions(_G.ArmoryTradeSkillRankFrameBorder, {1}) -- N.B. region 2 is bar texture
	self:glazeStatusBar(_G.ArmoryTradeSkillRankFrame, 0)
	self:skinEditBox(_G.ArmoryTradeSkillFrameEditBox, {9})
	self:moveObject{obj=_G.ArmoryTradeSkillFrameEditBox, y=2}
	self:removeRegions(_G.ArmoryTradeSkillExpandButtonFrame)
	self:skinDropDown{obj=_G.ArmoryTradeSkillSubClassDropDown}
	self:skinDropDown{obj=_G.ArmoryTradeSkillInvSlotDropDown}
	self:moveObject{obj=_G.ArmoryTradeSkillInvSlotDropDown, y=-2} -- shift for editbox visibility
	self:skinScrollBar{obj=_G.ArmoryTradeSkillListScrollFrame}
	self:skinScrollBar{obj=_G.ArmoryTradeSkillDetailScrollFrame}
	self:keepFontStrings(_G.ArmoryTradeSkillDetailScrollChildFrame)
	self:addButtonBorder{obj=_G.ArmoryTradeSkillSkillIcon}
	for i = 1, 8 do
		self:addButtonBorder{obj=_G["ArmoryTradeSkillReagent" .. i], libt=true}
	end
	self:addSkinFrame{obj=_G.ArmoryTradeSkillFrame, kfs=true, nb=true, x1=10, y1=-11, x2=-32, y2=71} -- don't skin buttons, otherwise the CollapseAllbutton is skinned incorrectly
	self:skinButton{obj=_G.ArmoryTradeSkillFrameCloseButton, cb=true}
	for i = 1, _G.ARMORY_TRADE_SKILLS_DISPLAYED do
		self:skinButton{obj=_G["ArmoryTradeSkillSkill" .. i], mp=true}
	end
	-- collapse all button
	self:skinButton{obj=_G.ArmoryTradeSkillCollapseAllButton, mp=true} -- treat as just a texture
	if self.modBtns then
		-- hook to manage changes to button textures
		self:SecureHook("ArmoryTradeSkillFrame_Update", function()
			for i = 1, _G.ARMORY_TRADE_SKILLS_DISPLAYED do
				self:checkTex(_G["ArmoryTradeSkillSkill" .. i])
			end
			self:checkTex(_G.ArmoryTradeSkillCollapseAllButton)
		end)
	end
	for i = 1, _G.ARMORY_MAX_TRADE_SKILL_REAGENTS do
		_G["ArmoryTradeSkillReagent" .. i .. "NameFrame"]:SetTexture(nil)
	end

end

function aObj:ArmoryGuildBank()

	-- ArmoryGuildBankFrame
	self:skinEditBox{obj=_G.ArmoryGuildBankFrameEditBox, regs={9}}
	self:skinDropDown{obj=_G.ArmoryGuildBankNameDropDown}
	self:removeRegions(_G.ArmoryGuildBankFrame, {10, 11, 12, 13}) -- remove frame textures
	self:addSkinFrame{obj=_G.ArmoryGuildBankFrame, bg=true, x1=6, y1=-11, x2=-32, y2=71}
	self:moveObject{obj=_G.ArmoryGuildBankFrameDeleteButton, x=3, y=-10}
	-- ArmoryListGuildBankFrame
	_G.ArmoryListGuildBankFrameMoneyBackgroundFrame:DisableDrawLayer("BACKGROUND")
	self:skinScrollBar{obj=_G.ArmoryListGuildBankScrollFrame}
	self:addSkinFrame{obj=_G.ArmoryListGuildBankFrame, kfs=true, x1=10, y1=-11, x2=-32, y2=71}
	self:skinTabs{obj=_G.ArmoryListGuildBankFrame, lod=true}
	-- ArmoryIconGuildBankFrame
	self:keepFontStrings(_G.ArmoryIconGuildBankFrameEmblemFrame)
	-- columns
	for i = 1, _G.ARMORY_NUM_GUILDBANK_COLUMNS do
		_G["ArmoryIconGuildBankColumn" .. i]:DisableDrawLayer("BACKGROUND")
	end
	self:addSkinFrame{obj=_G.ArmoryIconGuildBankFrame, kfs=true, y1=-10, y2=2}
	self:skinTabs{obj=_G.ArmoryIconGuildBankFrame, lod=true}
	-- Tabs (side)
	for i = 1, _G.MAX_GUILDBANK_TABS do
		_G["ArmoryIconGuildBankTab" .. i]:DisableDrawLayer("BACKGROUND")
	end

end
