local aName, aObj = ...
if not aObj:isAddonEnabled("Outfitter") then return end
local _G = _G

function aObj:Outfitter()

	-- disable Frame Level & Strata being changed
	_G.Outfitter.SetFrameLevel = function() end
	_G.Outfitter.SetFrameStrata = function() end

	 -- wait until Outfitter has been initialized
	if not _G.Outfitter.Initialized then
		self:ScheduleTimer("checkAndRunAddOn", 0.1, "Outfitter")
		return
	end

	-- minimap button texture background
	if self.db.profile.MinimapButtons.skin then
		self:removeRegions(_G.OutfitterMinimapButton, {1})
		_G.OutfitterMinimapButton.CurrentOutfitTexture:SetDrawLayer("ARTWORK")
	end

	local function skinOutfitBars(this, ...)

		-- handle no Bars showing
		if not this.Bars then return end

		for i = 1, #this["Bars"] do
			local oBar = _G["OutfitterOutfitBar" .. i]
			if not oBar.sf then
				aObj:addSkinFrame{obj=oBar, kfs=true, x1=-2, y1=3, x2=0, y2=1}
			end
		end
		for i = 1, 2 do
			local dBar = this["DragBar" .. i]
			if dBar
			and not dBar.sf
			then
				aObj:addSkinFrame{obj=dBar, kfs=true, x1=-2, y1=3, x2=0, y2=1}
				if not dBar.Vertical then
					dBar:SetWidth(20)
				else
					dBar:SetHeight(20)
				end
				-- hook this to handle an Orientation change
				aObj:SecureHook(dBar, "SetVerticalOrientation", function(this, pVertical)
					if not this.Vertical then
						this:SetWidth(20)
					else
						this:SetHeight(20)
					end
				end)
			end
		end

	end

	local function skinDropDown(obj)

		if not aObj.db.profile.TexturedDD then
			aObj:keepFontStrings(obj)
			return
		end
		-- dropdown
		aObj:moveObject{obj=obj.LeftTexture, x=2, y=-22}
		obj.LeftTexture:SetAlpha(0)
		obj.LeftTexture:SetHeight(18)
		obj.LeftTexture:SetWidth(1)
		obj.RightTexture:SetAlpha(0)
		obj.RightTexture:SetHeight(18)
		obj.RightTexture:SetWidth(1)
		obj.MiddleTexture:SetTexture(aObj.itTex)
		if aObj.db.profile.DropDownButtons then
			aObj:addSkinFrame{obj=obj, aso={ng=true}, x1=-2, y1=1, x2=2, y2=-1}
		end

	end

	local function skinMultiStats(obj)

		for i = 1, #obj.ConfigLines do
			if not obj.ConfigLines[i].sknd then
				skinDropDown(obj.ConfigLines[i].StatMenu)
				skinDropDown(obj.ConfigLines[i].OpMenu)
				if obj.ConfigLines[i].DeleteButton then
					aObj:skinButton{obj=obj.ConfigLines[i].DeleteButton}
				end
			end
		end

	end

 	-- hook these to handle the Outfit Bars
	self:SecureHook(_G.Outfitter.OutfitBar, "UpdateBar", function(this, ...)
		skinOutfitBars(this, ...)
	end)
	self:SecureHook(_G.Outfitter.OutfitBar, "DragBar_OnClick", function(this)
		if _G.OutfitBarSettingsDialog then
			self:applySkin(_G.OutfitBarSettingsDialog)
			self:Unhook(_G.Outfitter.OutfitBar, "DragBar_OnClick")
		end
	end)

	-- hook this to skin additional Shopping tooltips
	self:SecureHook(_G.Outfitter._ExtendedCompareTooltip, "AddShoppingLink", function(this, ...)
		for i = 1, #this.Tooltips do
			if self.db.profile.Tooltips.skin then
				if self.db.profile.Tooltips.style == 3
				and not self.skinned[this.Tooltips[i]]
				then
					this.Tooltips[i]:SetBackdrop(self.Backdrop[1])
				end
				self:skinTooltip(this.Tooltips[i])
			end
		end
	end)

-->>--	Outfitter Frame
	self:SecureHook(_G.OutfitterFrame, "Show", function(this, ...)
		self:getChild(_G.OutfitterFrame, 8):SetAlpha(0) -- hide band on the left
		self:addSkinFrame{obj=_G.OutfitterFrame, kfs=true, x1=-2, y1=2, x2=2, y2=-7}
		self:Unhook(_G.OutfitterFrame, "Show")
	end)

-->>--	Main Frame
	self:keepRegions(_G.OutfitterMainFrame, {2, 3}) -- N.B. region 2 is text, 3 is background texture
	self:removeRegions(_G.OutfitterMainFrameScrollbarTrench)
	self:skinScrollBar{obj=_G.OutfitterMainFrameScrollFrame}
	-- m/p buttons
	for i = 0, _G.Outfitter.cMaxDisplayedItems - 1 do
		local iBtn = "OutfitterItem" .. i
		self:skinButton{obj=_G[iBtn .. "CategoryExpand"], mp=true} -- treat as a texture
		self:SecureHook(_G[iBtn .. "CategoryExpand"], "SetNormalTexture", function(this, nTex)
			self:checkTex{obj=this, nTex=nTex}
		end)
	end

-->>--	Outfitter Tabs
	self:skinTabs{obj=_G.OutfitterFrame, lod=true, x1=6, y1=0, x2=-6, y2=2}

-->>--	New Outfit Panel

	self:SecureHook(_G.Outfitter, "CreateNewOutfit", function(this)
		local frame = this.NameOutfitDialog
		self:skinEditBox{obj=frame.Name, regs={9, 15, 16}}
		self:moveObject{obj=frame.Title, y=-6}
		skinDropDown(frame.ScriptMenu)
		self:addSkinFrame{obj=frame.InfoSection}
		self:addSkinFrame{obj=frame.BuildSection}
		self:addSkinFrame{obj=frame.StatsSection}
		local msc = frame.MultiStatConfig
		skinMultiStats(msc)
		self:skinButton{obj=msc.AddStatButton}
		self:SecureHook(msc, "SetNumConfigLines", function(this2, ...)
			skinMultiStats(this2)
		end)
		self:skinButton{obj=frame.CancelButton}
		self:skinButton{obj=frame.DoneButton}
		self:addSkinFrame{obj=frame, kfs=true, nb=true}
		self:Unhook(_G.Outfitter, "CreateNewOutfit")
	end)
	self:SecureHook(_G.Outfitter, "BeginCombiProgress", function(this, ...)
		local cpd = this.CombiProgressDialog
		self:glazeStatusBar(cpd.ProgressBar, 0,  nil)
		self:skinButton{obj=cpd.CancelButton}
		self:addSkinFrame{obj=cpd.ContentFrame}
		self:Unhook(_G.Outfitter, "BeginCombiProgress")
	end)
-->>--	Rebuild Outfit Panel
	self:SecureHook(_G.Outfitter, "OpenRebuildOutfitDialog", function(this, ...)
		local frame = this.RebuildOutfitDialog
		self:moveObject{obj=frame.Title, y=-6}
		self:addSkinFrame{obj=frame.StatsSection}
		local msc = frame.MultiStatConfig
		skinMultiStats(msc)
		self:skinButton{obj=msc.AddStatButton}
		self:SecureHook(msc, "SetNumConfigLines", function(this2, ...)
			skinMultiStats(this2)
		end)
		self:skinButton{obj=frame.CancelButton}
		self:skinButton{obj=frame.DoneButton}
		self:addSkinFrame{obj=frame, kfs=true, nb=true}
		self:Unhook(_G.Outfitter, "OpenRebuildOutfitDialog")
	end)

-->>--	ChooseIcon Dialog
	self:getChild(_G.OutfitterChooseIconDialog, 1):SetBackdrop(nil) -- remove textures from anonymous frame
	self:skinDropDown{obj=_G.OutfitterChooseIconDialogIconSetMenu}
	self:skinEditBox{obj=_G.OutfitterChooseIconDialogFilterEditBox, regs={6}}
	self:skinScrollBar{obj=_G.OutfitterChooseIconDialogScrollFrame}
	self:addSkinFrame{obj=_G.OutfitterChooseIconDialog, x1=12, y1=-12, x2=-16, y2=16}

-->>--	EditScript Dialog
	if _G.OutfitterEditScriptDialog then
		skinDropDown(_G.OutfitterEditScriptDialogPresetScript)
		self:keepFontStrings(_G.OutfitterEditScriptDialogSourceScript)
		self:skinScrollBar{obj=_G.OutfitterEditScriptDialogSourceScript, noRR=true}
		self:addSkinFrame{obj=_G.OutfitterEditScriptDialog, kfs=true, x2=1, y2=-5}
		-- Tabs
		self:skinTabs{obj=_G.OutfitterEditScriptDialog, lod=true, x1=6, y1=0, x2=-6, y2=2}
	end
	-- hook to skin script generated objects
	self:SecureHook(_G.OutfitterEditScriptDialog, "ConstructSettingsFields", function(this, pSettings)
		for k, v in _G.pairs(this.FrameCache) do
			for l, w in _G.pairs(v) do
				if k == "ScrollableEditBox" then
					-- self:skinScrollBar{obj=v}
					-- self:addSkinFrame{obj=self:getChild(v, 1)}
				elseif k == "EditBox" then
					self:skinEditBox{obj=w, regs={15, 16}}
				elseif k == "ZoneListEditBox" then
					self:skinScrollBar{obj=w}
					self:skinButton{obj=_G[w:GetName().."ZoneButton"]}
				end
			end
		end
	end)

-->>-- Outfit Bars
	self:ScheduleTimer(skinOutfitBars, 1, _G.Outfitter.OutfitBar) -- wait for a second before skinning the Outfit Bars

-->>-- Character panel buttons
	self:skinButton{obj=_G.OutfitterEnableAll}
	self:skinButton{obj=_G.OutfitterEnableNone}
	self:addButtonBorder{obj=_G.OutfitterButton, x1=9, y1=-2, x2=-10, y2=2}

end
