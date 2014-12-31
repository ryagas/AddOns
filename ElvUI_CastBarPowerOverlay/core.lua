local E, L, V, P, G, _ = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local CBPO = E:GetModule('CastBarPowerOverlay')
local UF = E:GetModule('UnitFrames');
local EP = LibStub('LibElvUIPlugin-1.0')
local addon, ns = ...

-- Create compatibility warning popup
E.PopupDialogs['CBPOCompatibility'] = {
	text = L['CONFLICT_WARNING'],
	button1 = L['I understand'],
	OnAccept = function() E.private.CBPO.warned = true end,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
}

local CBPOUnits = {
	['player'] = {ElvUF_Player, ElvUF_PlayerCastbarMover},
	['target'] = {ElvUF_Target, ElvUF_TargetCastbarMover},
	['focus'] = {ElvUF_Focus, ElvUF_FocusCastbarMover},
}

-- Function to set the size of the castbar depending on various options
function CBPO:CastbarSetSize(unit)
	local cdb = E.db.unitframe.units[unit].castbar;

	if unit == 'player' or unit == 'target' or unit == 'focus' then
		local UnitUF = CBPOUnits[unit][1];
		local Mover = CBPOUnits[unit][2];
		local pw = UnitUF.Power.backdrop:GetWidth();
		local ph = UnitUF.Power:GetHeight();
		local origWidth, origHeight = UnitUF:GetWidth(), 18
		
		if E.db.CBPO[unit].overlay == true then
			-- Set castbar height and width according to power bar
			cdb.width, cdb.height = pw, ph

			if cdb.icon == true then
				UnitUF.Castbar.ButtonIcon.bg:Width(cdb.height + (E.PixelMode and E:Scale(2) or E:Scale(4)))
				UnitUF.Castbar.ButtonIcon.bg:Height(cdb.height + (E.PixelMode and E:Scale(2) or E:Scale(4)))
				UnitUF.Castbar.ButtonIcon.bg:Show()
				UnitUF.Castbar:Width(cdb.width - UnitUF.Castbar.ButtonIcon.bg:GetWidth() - (E.PixelMode and E:Scale(1) or E:Scale(5)))
			else
				UnitUF.Castbar:Width(cdb.width - (E.PixelMode and E:Scale(2) or E:Scale(4)))
				UnitUF.Castbar.ButtonIcon.bg:Hide()
			end
		else
			--Reset size back to default
			cdb.width, cdb.height = origWidth, origHeight
			
			if cdb.icon == true then
				UnitUF.Castbar.ButtonIcon.bg:Width(cdb.height + (E.PixelMode and E:Scale(2) or E:Scale(4)))
				UnitUF.Castbar.ButtonIcon.bg:Height(cdb.height + (E.PixelMode and E:Scale(2) or E:Scale(4)))
				UnitUF.Castbar.ButtonIcon.bg:Show()
				UnitUF.Castbar:Width(cdb.width - UnitUF.Castbar.ButtonIcon.bg:GetWidth() - (E.PixelMode and E:Scale(1) or E:Scale(5)))
				Mover:Width(cdb.width)
			else
				UnitUF.Castbar:Width(cdb.width - (E.PixelMode and E:Scale(2) or E:Scale(4)))
				UnitUF.Castbar.ButtonIcon.bg:Hide()
				Mover:Width(cdb.width)
			end
		end
	elseif unit == 'arena' then
		local pw = ElvUF_Arena1.Power.backdrop:GetWidth()
		local ph = ElvUF_Arena1.Power:GetHeight()
		local origWidth, origHeight = ElvUF_Arena1:GetWidth(), 18
		
		for i = 1, 5 do
			local ArenaFrames = _G["ElvUF_Arena"..i]
			if E.db.CBPO.arena.overlay == true then
				-- Set castbar height and width according to power bar
				cdb.width, cdb.height = pw, ph

				if cdb.icon == true then
					ArenaFrames.Castbar.ButtonIcon.bg:Width(cdb.height + (E.PixelMode and E:Scale(2) or E:Scale(4)))
					ArenaFrames.Castbar.ButtonIcon.bg:Height(cdb.height + (E.PixelMode and E:Scale(2) or E:Scale(4)))
					ArenaFrames.Castbar.ButtonIcon.bg:Show()
					ArenaFrames.Castbar:Width(cdb.width - ArenaFrames.Castbar.ButtonIcon.bg:GetWidth() - (E.PixelMode and E:Scale(1) or E:Scale(5)))
				else
					ArenaFrames.Castbar:Width(cdb.width - (E.PixelMode and E:Scale(2) or E:Scale(4)))
					ArenaFrames.Castbar.ButtonIcon.bg:Hide()
				end
			else
				--Reset size back to default
				cdb.width, cdb.height = origWidth, origHeight
				
				if cdb.icon == true then
					ArenaFrames.Castbar.ButtonIcon.bg:Width(cdb.height + (E.PixelMode and E:Scale(2) or E:Scale(4)))
					ArenaFrames.Castbar.ButtonIcon.bg:Height(cdb.height + (E.PixelMode and E:Scale(2) or E:Scale(4)))
					ArenaFrames.Castbar.ButtonIcon.bg:Show()
					ArenaFrames.Castbar:Width(cdb.width - ArenaFrames.Castbar.ButtonIcon.bg:GetWidth() - (E.PixelMode and E:Scale(1) or E:Scale(5)))
				else
					ArenaFrames.Castbar:Width(cdb.width - (E.PixelMode and E:Scale(2) or E:Scale(4)))
					ArenaFrames.Castbar.ButtonIcon.bg:Hide()
				end
			end
		end
	elseif unit == 'boss' then
		local pw = ElvUF_Boss1.Power.backdrop:GetWidth()
		local ph = ElvUF_Boss1.Power:GetHeight()
		local origWidth, origHeight = ElvUF_Boss1:GetWidth(), 18
		
		for i = 1, MAX_BOSS_FRAMES do
			local BossFrames = _G["ElvUF_Boss"..i]
			if E.db.CBPO.boss.overlay == true then
				-- Set castbar height and width according to power bar
				cdb.width, cdb.height = pw, ph

				if cdb.icon == true then
					BossFrames.Castbar.ButtonIcon.bg:Width(cdb.height + (E.PixelMode and E:Scale(2) or E:Scale(4)))
					BossFrames.Castbar.ButtonIcon.bg:Height(cdb.height + (E.PixelMode and E:Scale(2) or E:Scale(4)))
					BossFrames.Castbar.ButtonIcon.bg:Show()
					BossFrames.Castbar:Width(cdb.width - BossFrames.Castbar.ButtonIcon.bg:GetWidth() - (E.PixelMode and E:Scale(1) or E:Scale(5)))
				else
					BossFrames.Castbar:Width(cdb.width - (E.PixelMode and E:Scale(2) or E:Scale(4)))
					BossFrames.Castbar.ButtonIcon.bg:Hide()
				end
			else
				--Reset size back to default
				cdb.width, cdb.height = origWidth, origHeight
				
				if cdb.icon == true then
					BossFrames.Castbar.ButtonIcon.bg:Width(cdb.height + (E.PixelMode and E:Scale(2) or E:Scale(4)))
					BossFrames.Castbar.ButtonIcon.bg:Height(cdb.height + (E.PixelMode and E:Scale(2) or E:Scale(4)))
					BossFrames.Castbar.ButtonIcon.bg:Show()
					BossFrames.Castbar:Width(cdb.width - BossFrames.Castbar.ButtonIcon.bg:GetWidth() - (E.PixelMode and E:Scale(1) or E:Scale(5)))
				else
					BossFrames.Castbar:Width(cdb.width - (E.PixelMode and E:Scale(2) or E:Scale(4)))
					BossFrames.Castbar.ButtonIcon.bg:Hide()
				end
			end
		end
	end
end

-- Function to position castbar and position and hide text
function CBPO:CastbarSetPosition(unit)
	local db = E.db.CBPO[unit];
	local pdb = E.db.unitframe.units[unit].power;
	local cdb = E.db.unitframe.units[unit].castbar;

	if unit == 'player' or unit == 'target' or unit == 'focus' then
		local UnitUF = CBPOUnits[unit][1];
		local Mover = CBPOUnits[unit][2];
		
		if db.overlay == true then
			if db.hidetext then -- Hide
				UnitUF.Castbar.Text:SetAlpha(0)
				UnitUF.Castbar.Time:SetAlpha(0)
			else -- Show
				UnitUF.Castbar.Text:SetAlpha(1)
				UnitUF.Castbar.Time:SetAlpha(1)
			end
			
			-- Set position of castbar text according to chosen offsets
			UnitUF.Castbar.Text:ClearAllPoints()
			UnitUF.Castbar.Text:SetPoint("LEFT", UnitUF.Castbar, "LEFT", db.xOffsetText, db.yOffsetText)
			UnitUF.Castbar.Time:ClearAllPoints()
			UnitUF.Castbar.Time:SetPoint("RIGHT", UnitUF.Castbar, "RIGHT", db.xOffsetTime, db.yOffsetTime)

			-- Raise FrameStrata and FrameLevel so castbar stays on top of power bar
			-- If offset is used, the castbar will still stay on top of power bar while staying below health bar.
			UnitUF.Castbar:SetFrameStrata(UnitUF.Power:GetFrameStrata())
			UnitUF.Castbar:SetFrameLevel(UnitUF.Power:GetFrameLevel()+2)

			-- Position the castbar on top of the power bar
			Mover:ClearAllPoints()
			Mover:SetPoint("TOPLEFT", UnitUF.Power.backdrop, "TOPLEFT", 0, 0)
			Mover:SetPoint("BOTTOMRIGHT", UnitUF.Power.backdrop, "BOTTOMRIGHT", 0, 0)
		else
			-- Reset text
			UnitUF.Castbar.Text:ClearAllPoints()
			UnitUF.Castbar.Text:SetPoint("LEFT", UnitUF.Castbar, "LEFT", 4, 0)
			UnitUF.Castbar.Time:ClearAllPoints()
			UnitUF.Castbar.Time:SetPoint("RIGHT", UnitUF.Castbar, "RIGHT", -4, 0)
			UnitUF.Castbar.Text:SetAlpha(1)
			UnitUF.Castbar.Time:SetAlpha(1)

			-- Revert castbar position to default
			Mover:ClearAllPoints()
			Mover:SetPoint("TOPRIGHT", UnitUF, "BOTTOMRIGHT", 0, -(E.PixelMode and E:Scale(3) or E:Scale(6)))
		end
	elseif unit == 'arena' then
		for i = 1, 5 do
			local ArenaFrames = _G["ElvUF_Arena"..i]
			
			if db.overlay == true then
				if db.hidetext then -- Hide
					ArenaFrames.Castbar.Text:SetAlpha(0)
					ArenaFrames.Castbar.Time:SetAlpha(0)
				else -- Show
					ArenaFrames.Castbar.Text:SetAlpha(1)
					ArenaFrames.Castbar.Time:SetAlpha(1)
				end
				
				-- Set position of castbar text according to chosen offsets
				ArenaFrames.Castbar.Text:ClearAllPoints()
				ArenaFrames.Castbar.Text:SetPoint("LEFT", ArenaFrames.Castbar, "LEFT", db.xOffsetText, db.yOffsetText)
				ArenaFrames.Castbar.Time:ClearAllPoints()
				ArenaFrames.Castbar.Time:SetPoint("RIGHT", ArenaFrames.Castbar, "RIGHT", db.xOffsetTime, db.yOffsetTime)

				-- Raise FrameStrata and FrameLevel so castbar stays on top of power bar
				-- If offset is used, the castbar will still stay on top of power bar while staying below health bar.
				ArenaFrames.Castbar:SetFrameStrata(ArenaFrames.Power:GetFrameStrata())
				ArenaFrames.Castbar:SetFrameLevel(ArenaFrames.Power:GetFrameLevel()+2)

				-- Position the castbar on top of the power bar
				ArenaFrames.Castbar:ClearAllPoints()
				ArenaFrames.Castbar:SetPoint("BOTTOMLEFT", ArenaFrames.Power)
			else
				-- Reset text
				ArenaFrames.Castbar.Text:SetAlpha(1)
				ArenaFrames.Castbar.Text:ClearAllPoints()
				ArenaFrames.Castbar.Text:SetPoint("LEFT", ArenaFrames.Castbar, "LEFT", 4, 0)
				ArenaFrames.Castbar.Time:SetAlpha(1)
				ArenaFrames.Castbar.Time:ClearAllPoints()
				ArenaFrames.Castbar.Time:SetPoint("RIGHT", ArenaFrames.Castbar, "RIGHT", -4, 0)

				-- Position the castbar below arena frame
				ArenaFrames.Castbar:ClearAllPoints()
				ArenaFrames.Castbar:Point("TOPLEFT", ArenaFrames, "BOTTOMLEFT", (E.PixelMode and E:Scale(1) or E:Scale(2)), -(E.PixelMode and E:Scale(3) or E:Scale(6)))
			end
		end
	elseif unit == 'boss' then
		for i = 1, MAX_BOSS_FRAMES do
			local BossFrames = _G["ElvUF_Boss"..i]
			
			if db.overlay == true then
				if db.hidetext then -- Hide
					BossFrames.Castbar.Text:SetAlpha(0)
					BossFrames.Castbar.Time:SetAlpha(0)
				else -- Show
					BossFrames.Castbar.Text:SetAlpha(1)
					BossFrames.Castbar.Time:SetAlpha(1)
				end
				
				-- Set position of castbar text according to chosen offsets
				BossFrames.Castbar.Text:ClearAllPoints()
				BossFrames.Castbar.Text:SetPoint("LEFT", BossFrames.Castbar, "LEFT", db.xOffsetText, db.yOffsetText)
				BossFrames.Castbar.Time:ClearAllPoints()
				BossFrames.Castbar.Time:SetPoint("RIGHT", BossFrames.Castbar, "RIGHT", db.xOffsetTime, db.yOffsetTime)

				-- Raise FrameStrata and FrameLevel so castbar stays on top of power bar
				-- If offset is used, the castbar will still stay on top of power bar while staying below health bar.
				BossFrames.Castbar:SetFrameStrata(BossFrames.Power:GetFrameStrata())
				BossFrames.Castbar:SetFrameLevel(BossFrames.Power:GetFrameLevel()+2)

				-- Position the castbar on top of the power bar
				BossFrames.Castbar:ClearAllPoints()
				BossFrames.Castbar:SetPoint("BOTTOMLEFT", BossFrames.Power)
			else
				-- Reset text
				BossFrames.Castbar.Text:SetAlpha(1)
				BossFrames.Castbar.Text:ClearAllPoints()
				BossFrames.Castbar.Text:SetPoint("LEFT", BossFrames.Castbar, "LEFT", 4, 0)
				BossFrames.Castbar.Time:SetAlpha(1)
				BossFrames.Castbar.Time:ClearAllPoints()
				BossFrames.Castbar.Time:SetPoint("RIGHT", BossFrames.Castbar, "RIGHT", -4, 0)
				
				-- Revert castbar position to default
				BossFrames.Castbar:ClearAllPoints()
				BossFrames.Castbar:Point("TOPLEFT", BossFrames, "BOTTOMLEFT", (E.PixelMode and E:Scale(1) or E:Scale(2)), -(E.PixelMode and E:Scale(3) or E:Scale(6)))
			end
		end
	end
end

-- Function to be called when registered events fire
function CBPO:SetSizeAndPosition()
	if IsAddOnLoaded('ElvUI_CastBarSnap') then
		if E.private.CBPO.warned ~= true then
			-- Warn user about CastBarPowerOverlay being disabled for Player CastBar
			E:StaticPopup_Show('CBPOCompatibility')
		end
		E.db.CBPO.player.overlay = false
	else --Only call player castbar functions if ElvUI_CastBarSnap is not loaded
		if E.db.CBPO.player.overlay then
			self:UpdatePlayer()
		end
		E.private.CBPO.warned = false		
	end
	
	if E.db.CBPO.target.overlay then
		self:UpdateTarget()
	end
	
	if E.db.CBPO.focus.overlay then
		self:UpdateFocus()
	end
	
	if E.db.CBPO.boss.overlay then
		self:UpdateBoss()
	end
	
	if E.db.CBPO.arena.overlay then
		self:UpdateArena()
	end
end

function CBPO:PLAYER_ENTERING_WORLD()
	self:ScheduleTimer('SetSizeAndPosition', 10)
end

function CBPO:ACTIVE_TALENT_GROUP_CHANGED()
	self:ScheduleTimer('SetSizeAndPosition', 3)
end

function CBPO:UpdatePlayer()
	self:CastbarSetSize('player')
	self:CastbarSetPosition('player')
end

function CBPO:UpdateTarget()
	self:CastbarSetSize('target')
	self:CastbarSetPosition('target')
end

function CBPO:UpdateFocus()
	self:CastbarSetSize('focus')
	self:CastbarSetPosition('focus')
end

function CBPO:UpdateArena()
	self:CastbarSetSize('arena')
	self:CastbarSetPosition('arena')
end

function CBPO:UpdateBoss()
	self:CastbarSetSize('boss')
	self:CastbarSetPosition('boss')
end

function CBPO:OnInitialize()
	-- Register callback with LibElvUIPlugin
	EP:RegisterPlugin(addon, CBPO.InsertOptions)

	--ElvUI UnitFrames are not enabled, stop right here!
	if E.private.unitframe.enable ~= true then return end
	
	-- Only create hook if ElvUI_CastBarSnap is not loaded
	if not IsAddOnLoaded('ElvUI_CastBarSnap') then
		-- Hook UF:Update_PlayerFrame to also call CBPO:UpdatePlayer() on updates
		hooksecurefunc(UF,'Update_PlayerFrame',function(self)
			if E.db.CBPO.player.overlay then
				CBPO:ScheduleTimer('UpdatePlayer', 0.5)
			end
		end)
	end
	
	-- Hook UF:Update_TargetFrame to also call CBPO:UpdateTarget() on updates
	hooksecurefunc(UF,'Update_TargetFrame',function(self)
		if E.db.CBPO.target.overlay then
			CBPO:ScheduleTimer('UpdateTarget', 0.5)
		end
	end)
	
	-- Hook UF:Update_FocusFrame to also call CBPO:UpdateFocus() on updates
	hooksecurefunc(UF,'Update_FocusFrame',function(self)
		if E.db.CBPO.focus.overlay then
			CBPO:ScheduleTimer('UpdateFocus', 0.5)
		end
	end)
	
	-- Hook UF:Update_BossFrames to also call CBPO:UpdateBoss() on updates
	hooksecurefunc(UF,'Update_BossFrames',function(self)
		if E.db.CBPO.boss.overlay then
			CBPO:ScheduleTimer('UpdateBoss', 0.5)
		end
	end)
	
	-- Hook UF:Update_ArenaFrames to also call CBPO:UpdateArena() on updates
	hooksecurefunc(UF,'Update_ArenaFrames',function(self)
		if E.db.CBPO.arena.overlay then
			CBPO:ScheduleTimer('UpdateArena', 0.5)
		end
	end)
	
	--Register a few events we need
	self:RegisterEvent('PLAYER_ENTERING_WORLD')
	self:RegisterEvent('ACTIVE_TALENT_GROUP_CHANGED')
end