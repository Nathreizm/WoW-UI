local aName, aObj = ...
if not aObj:isAddonEnabled("Bagnon") then return end
local _G = _G

--This Skin is for the Original Bagnon/Banknon Addon found here: http://wowui.incgamers.com/ui.php?id=4060
-- and here http://wow.curse.com/downloads/details/2090/
-- and also for the Bagnon Addon formerly known as vBagnon, found here: http://wow-en.curse-gaming.com/files/details/2090/vbagnon/ or here http://wowui.incgamers.com/ui.php?id=3197

-- Updated 26.06.09
-- vBagnon no longer is supported
-- Now supports the newest version found on Curse - http://www.curse.com/addons/wow/bagnon

function aObj:Bagnon(LoD) -- 5.4.15
	if not self.db.profile.ContainerFrames or self.initialized.Bagnon then return end
	self.initialized.Bagnon = true

	--	if Addon is LoD then it's the original one
	if LoD then
		self:applySkin(_G.Bagnon)
		_G.Bagnon.SetBackdropColor = function() end
		_G.Bagnon.SetBackdropBorderColor = function() end

	-- it's the newest version from Curse
	else
		local Bagnon = _G.Bagnon
		-- hide empty slot background
		Bagnon.SavedSettings:GetDB().showEmptyItemSlotTexture = false
		-- skin the bag frames
		local function skinFrame(frame)
			aObj:addSkinFrame{obj=frame}
			frame.SetBackdropColor = function() end
			frame.SetBackdropBorderColor = function() end
			if not aObj:IsHooked(frame, "OnShow") then
				aObj:SecureHookScript(frame, "OnShow", function(this)
					if aObj.modBtnBs then
						for i = 1, #this.menuButtons do
							aObj:addButtonBorder{obj=this.menuButtons[i], ofs=3}
						end
						-- bag/tab buttons
						if this.bagFrame then
							for i = 1, #this.bagFrame.bags do
								aObj:addButtonBorder{obj=this.bagFrame.bags[i], ofs=3}
							end
						end
						if this:HasOptionsToggle() then
							aObj:addButtonBorder{obj=this.optionsToggle, ofs=3}
						end
						if this:HasBrokerDisplay() then
							aObj:addButtonBorder{obj=this.brokerDisplay, relTo=this.brokerDisplay.icon, ofs=3}
						end
						-- VoidStorage Transfer button
						if this:HasMoneyFrame()
						and this.moneyFrame.icon
						then
							aObj:addButtonBorder{obj=this.moneyFrame.icon:GetParent(), relTo=this.moneyFrame.icon, ofs=3}
						end
					end
					if this.closeButton then aObj:skinButton{obj=this.closeButton, cb=true} end
					aObj:Unhook(frame, "OnShow")
				end)
			end
		end
		-- prevent gradient whiteout
		self:RawHook(Bagnon["Frame"], "FadeInFrame", function(this, frame, alpha)
			frame:Show()
		end)
		-- skin the Search EditBox
		self:RawHook(Bagnon["SearchFrame"], "New", function(this, ...)
			local eb = self.hooks[Bagnon["SearchFrame"]].New(this, ...)
			self:skinEditBox{obj=eb, regs={9}}
			return eb
		end)
		-- skin frames
		skinFrame(Bagnon.frames["inventory"])
		self:RawHook(Bagnon["Frame"], "New", function(this, id)
			local frame = self.hooks[Bagnon["Frame"]].New(this, id)
			skinFrame(frame)
			return frame
		end)
	end

end

function aObj:Banknon()
	if not self.db.profile.ContainerFrames then return end

	self:applySkin(_G.Banknon)
	_G.Bagnon.SetBackdropColor = function() end
	_G.Bagnon.SetBackdropBorderColor = function() end

end

function aObj:Bagnon_Options()

	self:applySkin(_G.BagnonRightClickMenu)
	self:skinDropDown(_G.BagnonRightClickMenuPanelSelector)

end

function aObj:Bagnon_GuildBank()
	if not self.db.profile.GuildBankUI then return end

	local Bagnon = _G.LibStub("AceAddon-3.0"):GetAddon("Bagnon")
	-- skin the LogFrame
	self:RawHook(Bagnon["LogFrame"], "New", function(this, ...)
		local frame = self.hooks[Bagnon["LogFrame"]].New(this, ...)
		self:skinSlider{obj=frame.ScrollBar, size=3}
		return frame
	end)
	self:RawHook(Bagnon["EditFrame"], "New", function(this, ...)
		local frame = self.hooks[Bagnon["EditFrame"]].New(this, ...)
		self:skinSlider{obj=frame.ScrollBar, size=3}
		return frame
	end)

end
