local aName, aObj = ...
local _G = _G
local module = aObj:NewModule("UIButtons", "AceEvent-3.0", "AceHook-3.0")

local assert, debugstack, rawget, select, type = _G.assert, _G.debugstack, _G.rawget, _G.select, _G.type

local db
local defaults = {
	profile = {
		UIButtons     = false,
		ButtonBorders = false,
		Quality		  = {file = "None", texture = "Blizzard Tooltip"},
	}
}

do
	-- characters used on buttons
	module.mult = "×"
	module.plus = "+"
	module.minus = "-" -- using Hyphen-minus(-) instead of minus sign(−) for font compatiblity reasons
	-- create font to use for Close Buttons
	module.fontX = CreateFont("fontX")
	module.fontX:SetFont([[Fonts\FRIZQT__.TTF]], 20)
	module.fontX:SetTextColor(1.0, 0.82, 0)
	-- create font for disabled text
	module.fontDX = CreateFont("fontDX")
	module.fontDX:SetFont([[Fonts\FRIZQT__.TTF]], 20)
	module.fontDX:SetTextColor(0.35, 0.35, 0.35)
	-- create font to use for small blue Close Buttons (e.g. BNToastFrame)
	module.fontSBX = CreateFont("fontSBX")
	module.fontSBX:SetFont([[Fonts\FRIZQT__.TTF]], 14)
	module.fontSBX:SetTextColor(0.2, 0.6, 0.8)
	-- create font to use for small Buttons (e.g. MinimalArchaeology)
	module.fontSB = CreateFont("fontSB")
	module.fontSB:SetFont([[Fonts\FRIZQT__.TTF]], 14)
	module.fontSB:SetTextColor(1.0, 0.82, 0)
	-- create font to use for Minus/Plus Buttons
	module.fontP = CreateFont("fontP")
	module.fontP:SetFont([[Fonts\ARIALN.TTF]], 16)
	module.fontP:SetTextColor(1.0, 0.82, 0)
	-- create font for disabled text
	module.fontDP = CreateFont("fontDP")
	module.fontDP:SetFont([[Fonts\ARIALN.TTF]], 16)
	module.fontDP:SetTextColor(0.35, 0.35, 0.35)
end
local btnTexNames = {"Left", "Middle", "Right", "_LeftTexture", "_MiddleTexture", "_RightTexture", "_LeftSeparator", "_RightSeparator"}
local function __checkTex(opts)
--[[
	Calling parameters:
		obj = object (Mandatory)
		nTex = Texture
		mp2 = minus/plus type 2
--]]
--[===[@alpha@
	assert(opts.obj, "Missing object __cT\n" .. debugstack())
--@end-alpha@]===]

	-- hide existing textures if they exist (GupCharacter requires this)
	if opts.obj:GetNormalTexture() then opts.obj:GetNormalTexture():SetAlpha(0) end
	if opts.obj:GetPushedTexture() then opts.obj:GetPushedTexture():SetAlpha(0) end
	if opts.obj:GetDisabledTexture() then opts.obj:GetDisabledTexture():SetAlpha(0) end

	local nTex = opts.nTex or opts.obj:GetNormalTexture() and opts.obj:GetNormalTexture():GetTexture() or nil
	local btn = opts.mp2 and opts.obj or opts.obj.sb
	if not btn then return end -- allow for unskinned buttons

	-- aObj:Debug("__checkTex: [%s, %s, %s, %s, %s]", opts.obj, btn, nTex, opts.mp2, btn.skin)

	if not opts.mp2 then btn:Show() end -- why done here and not within following test stanza ???

	if nTex then
		if btn.skin then btn:Show() end -- Waterfall/tomQuest2
		if nTex:find("MinusButton")
		or nTex:find("ZoomOutButton") -- ARL
		then
			btn:SetText(module.minus)
		elseif nTex:find("PlusButton")
		or nTex:find("ZoomInButton") -- ARL
		then
			btn:SetText(module.plus)
		else -- not a header line
			btn:SetText("")
			if not opts.mp2 then btn:Hide() end
		end
	else -- not a header line
		btn:SetText("")
		if not opts.mp2
		or btn.skin -- Waterfall/tomQuest2
		then
			btn:Hide()
		end
	end

end
function module:checkTex(...)

	local opts = select(1, ...)

--[===[@alpha@
	assert(opts, "Missing object cT\n" .. debugstack())
--@end-alpha@]===]

	-- handle missing object (usually when addon changes)
	if not opts then return end

	if type(rawget(opts, 0)) == "userdata" and type(opts.GetObjectType) == "function" then
		-- old style call
		opts = {}
		opts.obj = select(1, ...) and select(1, ...) or nil
		opts.nTex = select(2, ...) and select(2, ...) or nil
		opts.mp2 = select(3, ...) and select(3, ...) or nil
	end
	__checkTex(opts)

end

function module:skinButton(opts)
--[[
	Calling parameters:
		as = use applySkin rather than addSkinButton, used when text appears behind the gradient
		cb = close button
		cb2 = close button style 2 (based upon OptionsButtonTemplate)
		mp = minus/plus texture on a larger button
		mp2 = minus/plus button
		ob = other button, text supplied
		ob2 = other button style 2, text supplied
		plus = use plus sign
		anim = reparent skinButton to avoid whiteout issues caused by animations
		other options as per addSkinButton
--]]
--[===[@alpha@
	assert(opts.obj, "Missing object skinButton\n" .. debugstack())
--@end-alpha@]===]

	if not opts.obj then return end

	-- check to see if object is already skinned
	if opts.obj.sb
	or opts.obj.sf
	or opts.obj.tfade
	then
		return
	end

	-- remove textures
	if opts.obj.Left -- UIPanelButtonTemplate and derivatives (MoP)
	or opts.obj.leftArrow -- UIMenuButtonStretchTemplate (MoP)
	then
		-- aObj:Debug("skinButton ß: [%s]", opts.obj)
		opts.obj:DisableDrawLayer("BACKGROUND")
	elseif opts.obj.left then -- ARL & Collectinator
		opts.obj.left:SetAlpha(0)
		opts.obj.middle:SetAlpha(0)
		opts.obj.right:SetAlpha(0)
	elseif opts.obj.LeftTexture then -- Outfitter
		opts.obj.LeftTexture:SetAlpha(0)
		opts.obj.MiddleTexture:SetAlpha(0)
		opts.obj.RightTexture:SetAlpha(0)
	else -- [UIPanelButtonTemplate2/... and derivatives]
		local objName = opts.obj:GetName()
		if objName then -- handle unnamed objects (e.g. Waterfall MP buttons)
			for _, tName in _G.pairs(btnTexNames) do
				local bTex = _G[objName .. tName]
				if bTex then bTex:SetAlpha(0) end
			end
		end
	end
	-- remove any 'old' type button textures (ArkInventory)
	if opts.obj.GetNormalTexture
	and opts.obj:GetNormalTexture()
	then
		opts.obj:GetNormalTexture():SetAlpha(0)
		if opts.obj:GetPushedTexture() then opts.obj:GetPushedTexture():SetAlpha(0) end
		if opts.obj:GetDisabledTexture() then opts.obj:GetDisabledTexture():SetAlpha(0) end
		if opts.obj.GetCheckedTexture -- CheckButton (Archy)
		and opts.obj:GetCheckedTexture()
		then
			opts.obj:GetCheckedTexture():SetAlpha(0)
		end
	end

	-- setup button frame size adjustments
	local bW, bH = aObj:getInt(opts.obj:GetWidth()), aObj:getInt(opts.obj:GetHeight())
	if bW <= 20 and opts.cb then -- ArkInventory/Recount close buttons
		local adj = bW < 20 and bW + 1 or bW
		opts.cb2 = opts.cb
		opts.cb = nil
		opts.x1, opts.y1, opts.x2, opts.y2 = bW - adj, 0, adj - bW, 0
	end

	-- skin button dependant upon type
	local aso = opts.aso or {} -- allow for additional options having been supplied
	if opts.cb then -- it's a close button
		opts.obj:SetNormalFontObject(module.fontX)
		opts.obj:SetText(module.mult)
		opts.obj:SetPushedTextOffset(-1, -1)
		if opts.sap then
			aObj:addSkinButton{obj=opts.obj, ft=opts.ft, parent=opts.obj, sap=true, aso=aso}
		else
			aso.bd = 5
			local x1 = opts.x1 or bW == 32 and 6 or 4
			local y1 = opts.y1 or bW == 32 and -6 or -4
			local x2 = opts.x2 or bW == 32 and -6 or -4
			local y2 = opts.y2 or bW == 32 and 6 or 4
			aObj:addSkinButton{obj=opts.obj, ft=opts.ft, parent=opts.obj, aso=aso, x1=x1, y1=y1, x2=x2, y2=y2}
		end
	elseif opts.cb2 then -- it's pretending to be a close button (e.g. ArkInventory/Recount/Outfitter)
		aso.bd = 5
		local x1 = opts.x1 or 0
		local y1 = opts.y1 or 0
		local x2 = opts.x2 or 0
		local y2 = opts.y2 or 0
		aObj:addSkinButton{obj=opts.obj, ft=opts.ft, parent=opts.obj, aso=aso, x1=x1, y1=y1, x2=x2, y2=y2}
		opts.obj.sb:SetNormalFontObject(module.fontX)
		opts.obj.sb:SetText(module.mult)
	elseif opts.cb3 then -- it's a small blue close button (e.g. BNToastFrame)
		aso.bd = 5
		aso.bba = 0
		aObj:adjWidth{obj=opts.obj, adj=-4}
		aObj:adjHeight{obj=opts.obj, adj=-4}
		aObj:addSkinButton{obj=opts.obj, ft=opts.ft, parent=opts.obj, aso=aso, x1=2, y1=1, x2=2, y2=1}
		opts.obj.sb:SetNormalFontObject(module.fontSBX)
		opts.obj.sb:SetText(module.mult)
		opts.obj:GetParent().cb = opts.obj.sb -- store button object in parent as well
	elseif opts.mp then -- it's a minus/plus texture on a larger button
		aso.bd = 6
		aObj:addSkinButton{obj=opts.obj, ft=opts.ft, parent=opts.obj, aso=aso}
		opts.obj.sb:SetAllPoints(opts.obj:GetNormalTexture())
		opts.obj.sb:SetNormalFontObject(module.fontP)
		opts.obj.sb:SetText(opts.plus and module.plus or module.minus)
	elseif opts.mp2 then -- it's a minus/plus button (IOF has them on RHS)
		aso.bd = 6
		opts.obj:SetNormalFontObject(module.fontP)
		opts.obj:SetText(opts.plus and module.plus or module.minus)
		opts.obj:SetPushedTextOffset(-1, -1)
		if not opts.as then
			aObj:addSkinButton{obj=opts.obj, ft=opts.ft, parent=opts.obj, sap=true, aso=aso}
			module:SecureHook(opts.obj, "SetNormalTexture", function(this, nTex)
				module:checkTex{obj=this, nTex=nTex, mp2=true}
			end)
		else -- just skin it (used by Waterfall & tomQuest2)
			aso.obj = opts.obj
			aObj:applySkin(aso)
			opts.obj.skin = true
		end
	elseif opts.ob then -- it's another type of button, text supplied (e.g. beql minimize)
		opts.obj:SetNormalFontObject(module.fontP)
		opts.obj:SetText(opts.ob)
		opts.obj:SetPushedTextOffset(-1, -1)
		if opts.sap then
			aObj:addSkinButton{obj=opts.obj, ft=opts.ft, parent=opts.obj, sap=true, aso=aso}
		else
			aso.bd = 5
			local x1 = opts.x1 or bW == 32 and 6 or 4
			local y1 = opts.y1 or bW == 32 and -6 or -4
			local x2 = opts.x2 or bW == 32 and -6 or -4
			local y2 = opts.y2 or bW == 32 and 6 or 4
			aObj:addSkinButton{obj=opts.obj, ft=opts.ft, parent=opts.obj, aso=aso, x1=x1, y1=y1, x2=x2, y2=y2}
		end
	elseif opts.ob2 then -- it's another type of button, text supplied, style 2 (e.g. MinimalArchaeology)
		aso.bd = 5
		opts.obj:SetNormalFontObject(module.fontSB)
		opts.obj:SetText(opts.ob2)
		opts.obj:SetPushedTextOffset(-1, -1)
		opts.obj:SetHighlightTexture([[Interface\Buttons\UI-Panel-MinimizeButton-Highlight]])
		opts.obj:SetWidth(18)
		opts.obj:SetHeight(18)
		aObj:addSkinButton{obj=opts.obj, ft=opts.ft, parent=opts.obj, sap=true, aso=aso}
	else -- standard button (UIPanelButtonTemplate/UIPanelButtonTemplate2 and derivatives)
		-- aObj:Debug("skinButton: [%s, %s, %s]", opts.obj, bW, bH)
		aso.bd = bH > 18 and 5 or 6 -- use narrower backdrop if required
		if not opts.as then
			local x1 = opts.x1 or 1
			local y1 = opts.y1 or -1
			local x2 = opts.x2 or -1
			local y2 = opts.y2 or -1
			aObj:addSkinButton{obj=opts.obj, ft=opts.ft, parent=opts.obj, aso=aso, bg=opts.bg, x1=x1, y1=y1, x2=x2, y2=y2}
		else
			aso.obj = opts.obj
			if bH < 16 then opts.obj:SetHeight(16) end -- set minimum button height (DBM option buttons)
			if bW < 16 then opts.obj:SetWidth(16) end -- set minimum button width (oQueue remove buttons)
			aObj:applySkin(aso)
		end
	end

	-- reparent skinButton to avoid whiteout issues caused by animations
	if opts.anim and opts.obj.sb then
		opts.obj.sb:SetParent(opts.parent or opts.obj:GetParent().sf)
	end

end

local function getTexture(obj)

	if obj
	and obj:IsObjectType("Texture")
	then
		return obj:GetTexture()
	end

end
function module:isButton(obj)
	aObj:Debug2("module:isButton#1: [%s]", obj)

	-- ignore named/AceConfig/XConfig/AceGUI objects
	if aObj:hasAnyTextInName(obj, {"AceConfig", "XConfig", "AceGUI"}) then return end

	local bType

	if (obj.Left or obj.leftArrow or obj.GetNormalTexture) -- is it a true button
	and not obj.GetChecked -- and not a checkbutton
	and not obj.SetSlot -- and not a lootbutton
	then
		local oW, oH, nR = aObj:getInt(obj:GetWidth()), aObj:getInt(obj:GetHeight()), obj:GetNumRegions()
		aObj:Debug2("module:isButton#2: [%s, %s, %s, %s, %s, %s]", obj:GetParent().CloseButton == obj, aObj:hasTextInName(obj, "Close"), aObj:hasTextInTexture(obj:GetNormalTexture(), "UI-Panel-MinimizeButton-Up", true), oW, oH, nR)
		if oH == 18 and oW == 18 and nR == 3 -- BNToast close button
		then
			bType = "toast"
		-- standard close button is 32x32 and has 4 regions
		-- RolePollPopup has 3 regions
		-- Channel Pullout is 24 high
		elseif obj:GetParent().CloseButton == obj
		or oH == oW and (nR >= 3 or nR <= 5) and (oH == 32 or oH == 24)
		and (aObj:hasTextInName(obj, "Close") or aObj:hasTextInTexture(obj:GetNormalTexture(), "UI-Panel-MinimizeButton-Up", true))
		then
			bType = "close"
		elseif (obj.Left and obj.Right and obj.Middle and nR == 5) -- based upon UIPanelButtonTemplate
		or (oH >= 20 and oH <= 25 and nR >= 5 and nR <= 8) -- std button
		or (oH == 30 and oW == 160) -- HelpFrame
		or (oH == 32 and oW == 128 and nR == 4) -- BasicScriptErrors Frame
		or (oH == 22 and oW == 108 and nR == 4) -- Tutorial Frame
		then
			bType = "normal"
		elseif oH == 54 then
			bType = "help"
		end
	end

	aObj:Debug2("module:isButton#5: [%s]", bType)
	return bType

end
local function __skinAllButtons(opts, bgen)
--[[
	Calling parameters:
		obj = object (Mandatory)
		bgen = generations of children to traverse
		other options as per skinButton
--]]
--[===[@alpha@
	assert(opts.obj, "Missing object__sAB\n" .. debugstack())
--@end-alpha@]===]
	if not opts.obj then return end

	-- maximum number of button generations to traverse
	bgen = bgen or opts.bgen or 3

	for _, child in _G.pairs{opts.obj:GetChildren()} do
		if child:IsObjectType("Button") then
			if child:GetNumChildren() > 0 and bgen > 0 then
				opts.obj=child
				__skinAllButtons(opts, bgen - 1)
			end
			local bType = module:isButton(child)
			if bType == "normal" then
				module:skinButton{obj=child, ft=opts.ft, x1=opts.x1, y1=opts.y1, x2=opts.x2, y2=opts.y2, anim=opts.anim, as=opts.as}
			elseif bType == "close" then
				module:skinButton{obj=child, ft=opts.ft, cb=true, sap=opts.sap, anim=opts.anim}
			elseif bType == "toast" then
				module:skinButton{obj=child, ft=opts.ft, cb3=true}
			elseif bType == "help" then
				module:skinButton{obj=child, ft=opts.ft, x1=0, y1=0, x2=-3, y2=3}
			end
		elseif child:IsObjectType("Frame") and bgen > 0 then
			opts.obj=child
			__skinAllButtons(opts, bgen - 1)
		end
	end

end
function module:skinAllButtons(...)

	local opts = select(1, ...)

--[===[@alpha@
	assert(opts, "Missing object sAB\n" .. debugstack())
--@end-alpha@]===]

	-- handle missing object (usually when addon changes)
	if not opts then return end

	if type(rawget(opts, 0)) == "userdata" and type(opts.GetObjectType) == "function" then
		-- old style call
		opts = {}
		opts.obj = select(1, ...) and select(1, ...) or nil
	end
	__skinAllButtons(opts)

end

local function __addButtonBorder(opts)
--[[
	Calling parameters:
		obj = object (Mandatory)
		relTo = object to position relative to
		hide = hook Hide/Show methods of relTo object
		ofs = global offset
		abt = Action Button template
		pabt = Pet Action Button template
		ibt = Item Button template
		tibt = Talent Item Button template
		libt = Large Item Button template
		spbt = Simple Popup Button template
		mb = Main Menu Bar Micro Button
		sec = requires SecureFrameTemplate to inherit from otherwise tainting occurs
		reParent = table of objects to reparent to the border frame
		es = edgeSize, used for small icons
		x1 = X offset for TOPLEFT
		y1 = Y offset for TOPLEFT
		x2 = X offset for BOTTOMRIGHT
		y2 = Y offset for BOTTOMRIGHT
		disable = hook Enable/Disable methods of object
--]]
--[===[@alpha@
	assert(opts.obj, "Missing object__aBB\n" .. debugstack())
--@end-alpha@]===]
	if not opts.obj then return end

	-- remove Normal texture if required (vertex colour changed in blizzard code)
	if opts.ibt
	or opts.abt
	or opts.pabt
	then
		if opts.obj:GetNormalTexture() then
			opts.obj:GetNormalTexture():SetTexture(nil)
		end
	end

	-- create the border frame
	opts.obj.sbb = _G.CreateFrame("Frame", nil, opts.obj, opts.sec and "SecureFrameTemplate" or nil)

	-- DON'T lower the frame level otherwise the border appears below the frame
	-- setup and apply the backdrop
	opts.obj.sbb:SetBackdrop({edgeFile = aObj.Backdrop[1].edgeFile, edgeSize = opts.es or aObj.Backdrop[1].edgeSize})
	opts.obj.sbb:SetBackdropBorderColor(_G.unpack(aObj.bbColour))

	-- position the frame
	opts.ofs = opts.ofs or 2
	local xOfs1 = opts.x1 or opts.ofs * -1
	local yOfs1 = opts.y1 or opts.ofs
	local xOfs2 = opts.x2 or opts.ofs
	local yOfs2 = opts.y2 or opts.ofs * -1

	local btnName = opts.obj:GetName()
	-- Large Item Button templates have an IconTexture to position to
	local relTo = opts.relTo or opts.libt and _G[btnName .. "IconTexture"] or nil
	opts.obj.sbb:SetPoint("TOPLEFT", relTo or opts.obj, "TOPLEFT", xOfs1, yOfs1)
	opts.obj.sbb:SetPoint("BOTTOMRIGHT", relTo or opts.obj, "BOTTOMRIGHT", xOfs2, yOfs2)

	if opts.hide and opts.relTo then
		-- hook Show and Hide methods of the relTo object
		module:SecureHook(opts.relTo, "Show", function(this) opts.obj.sbb:Show() end)
		module:SecureHook(opts.relTo, "Hide", function(this) opts.obj.sbb:Hide() end)
		-- hide border if required
		opts.obj.sbb:SetShown(opts.relTo:IsShown())
	end

	if opts.disable then
		-- hook Enable & Disable methods
		module:SecureHook(opts.obj, "Enable", function(this) this.sbb:SetBackdropBorderColor(_G.unpack(aObj.bbColour)) end)
		module:SecureHook(opts.obj, "Disable", function(this) this.sbb:SetBackdropBorderColor(0.5, 0.5, 0.5) end)
		if not opts.obj:IsEnabled() then opts.obj.sbb:SetBackdropBorderColor(0.5, 0.5, 0.5) end
	end

	-- reparent objects if required
	if opts.reParent then
		for _, obj in _G.pairs(opts.reParent) do
			obj:SetParent(opts.obj.sbb)
		end
	end
	-- reparent these textures so they are displayed above the border
	if opts.ibt then -- Item Buttons
		if btnName then
			_G[btnName .. "Count"]:SetParent(opts.obj.sbb)
			_G[btnName .. "Stock"]:SetParent(opts.obj.sbb)
		else
			opts.obj.Count:SetParent(opts.obj.sbb)
			opts.obj.Stock:SetParent(opts.obj.sbb)
		end
	elseif opts.abt then -- Action Buttons
		_G[btnName .. "HotKey"]:SetParent(opts.obj.sbb)
		-- reparent FlyoutArrow so it is displayed above the border
		opts.obj.FlyoutArrow:SetParent(opts.obj.sbb)
		_G[btnName .. "Name"]:SetParent(opts.obj.sbb)
		_G[btnName .. "Count"]:SetParent(opts.obj.sbb)
	elseif opts.libt then -- Large Item Buttons
		_G[btnName .. "Name"]:SetParent(opts.obj.sbb)
		_G[btnName .. "Count"]:SetParent(opts.obj.sbb)
	elseif opts.mb then -- Micro Buttons
		opts.obj.Flash:SetParent(opts.obj.sbb)
	elseif opts.pabt then -- Pet Action Buttons
		_G[btnName .. "AutoCastable"]:SetParent(opts.obj.sbb)
		_G[btnName .. "Shine"]:SetParent(opts.obj.sbb)
	elseif opts.tibt then -- Talents
		_G[btnName .. "RankBorder"]:SetParent(opts.obj.sbb)
		_G[btnName .. "Rank"]:SetParent(opts.obj.sbb)
		if _G[btnName .. "RankBorderGreen"] then
			_G[btnName .. "RankBorderGreen"]:SetParent(opts.obj.sbb)
		end
	elseif opts.spbt then -- Simple Popup Buttons
		_G[btnName .. "Name"]:SetParent(opts.obj.sbb)
	end

end
function module:addButtonBorder(...)

	local opts = select(1, ...)

	-- handle in combat
	if _G.InCombatLockdown() then
		aObj:add2Table(module.btnTab, opts)
		return
	end

--[===[@alpha@
	assert(opts, "Missing object sAB\n" .. debugstack())
--@end-alpha@]===]

	-- handle missing object (usually when addon changes)
	if not opts then return end

	if type(rawget(opts, 0)) == "userdata" and type(opts.GetObjectType) == "function" then
		-- old style call
		opts = {}
		opts.obj = select(1, ...) and select(1, ...) or nil
	end
	__addButtonBorder(opts)

end

function module:OnInitialize()

	self.db = aObj.db:RegisterNamespace("UIButtons", defaults)
	db = self.db.profile

	-- convert any old settings
	if aObj.db.profile.Buttons then
		db.UIButtons = aObj.db.profile.Buttons
		aObj.db.profile.Buttons = nil
	end

	if not db.UIButtons
	and not db.ButtonBorders
	then
		self:Disable()
	end -- disable ourself

end

function module:OnEnable()

	-- this code will handle button border creation during combat
	if module.db.profile.ButtonBorders then
		module.btnTab = {}
		module:RegisterEvent("PLAYER_REGEN_ENABLED", function()
			for _, v in _G.pairs(module.btnTab) do
				module:addButtonBorder(v)
			end
			_G.wipe(module.btnTab)
		end)
	end

	-- bypass the Item Quality Border Texture changes if the specified addons aren't loaded
	if not _G.IsAddOnLoaded("AdiBags")
	and not _G.IsAddOnLoaded("Fizzle")
	and not _G.IsAddOnLoaded("oGlow")
	and not _G.IsAddOnLoaded("XLoot")
	then
		-- remove options
		aObj.optTables["Modules"].args["Skinner_UIButtons"].args["Quality"] = nil
		aObj.ACR:NotifyChange(aName)
		return
	end

	if db.Quality.file and db.Quality.file ~= "None" then
		aObj.LSM:Register("border", aName .. " Quality Border", db.Quality.file)
	end
	-- setup default backdrop values (AdiBags, Fizzle, oGlow, XLoot)
	self.bDrop = {
		edgeFile = aObj.Backdrop[1].edgeFile,
		edgeSize = aObj.Backdrop[1].edgeSize
	}
	self.iqbDrop = {
		edgeSize = aObj.Backdrop[1].edgeSize
	}
	local bdbTex
	if db.Quality.file and db.Quality.file ~= "None" then
		bdbTex = aName .. " Quality Border"
	else
		bdbTex = db.Quality.texture
	end
	self.iqbDrop.edgeFile = aObj.LSM:Fetch("border", bdbTex)

end

function module:GetOptions()

	local options = {
		type = "group",
		name = aObj.L["Button Settings"],
		order = 1,
		get = function(info) return db[info[#info]] end,
		set = function(info, value)
			if info[#info] == "ButtonBorders" and not module:IsEnabled() then module:Enable() end
			db[info[#info]] = value
		end,
		args = {
			UIButtons = {
				type = "toggle",
				order = 1,
				name = aObj.L["UI Buttons"],
				desc = aObj.L["Toggle the skinning of the UI Buttons, reload required"],
			},
			ButtonBorders = {
				type = "toggle",
				order = 2,
				name = aObj.L["Button Borders"],
				desc = aObj.L["Toggle the skinning of the Button Borders, reload required"],
			},
			Quality = {
				type = "group",
				order = 3,
				inline = true,
				name = aObj.L["Item Quality Border"],
				get = function(info) return db.Quality[info[#info]] end,
				set = function(info, value) db.Quality[info[#info]] = value end,
				args = {
					file = {
						type = "input",
						order = 1,
						width = "full",
						name = aObj.L["Border Texture File"],
						desc = aObj.L["Set Border Texture Filename"],
					},
					texture = _G.AceGUIWidgetLSMlists and {
						type = "select",
						order = 2,
						width = "double",
						name = aObj.L["Border Texture"],
						desc = aObj.L["Choose the Texture for the Border"],
						dialogControl = 'LSM30_Border',
						values = _G.AceGUIWidgetLSMlists.border,
					} or nil,
				},
			},
		},
	}
	return options

end
