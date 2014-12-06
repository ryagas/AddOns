﻿local E, L, V, P, G = unpack(ElvUI);
local BG = E:GetModule('SLE_BackGrounds');

local BGb, BGl, BGr, BGa, Fr

--Frames setup
local function CreateFrames()
	BGb = CreateFrame('Frame', "BottomBG", E.UIParent);
	BGl = CreateFrame('Frame', "LeftBG", E.UIParent);
	BGr = CreateFrame('Frame', "RightBG", E.UIParent);
	BGa = CreateFrame('Frame', "ActionBG", E.UIParent);

	Fr = {
		BottomBG = {BGb,"bottom"},
		LeftBG = {BGl,"left"},
		RightBG = {BGr,"right"},
		ActionBG = {BGa,"action"},
	}

	for _,v in pairs(Fr) do
		v[1]:SetFrameLevel(v[1]:GetFrameLevel() - 1)
		v[1]:SetScript("OnShow", function() v[1]:SetFrameStrata('BACKGROUND') end)
		v[1].tex = v[1]:CreateTexture(nil, 'OVERLAY')
		v[1]:Hide()
	end

	--Make EnableMouse and option b/c of drunk russian
	BGb:EnableMouse(true) --Maybe add an option to actually allow change this click catching?
	BGa:EnableMouse(true)
	BGb.tex:SetAlpha(0.5) 

	--Also the problem. As long as bottom bg can be transparent it's no good in keeping fixed transparency for the texture.
	--Maybe add an option to change this from using Elv's trnsparency to additional user-set one?
	BGl.tex:SetAlpha(E.db.general.backdropfadecolor.a - 0.7 > 0 and E.db.general.backdropfadecolor.a - 0.7 or 0.5)
	BGr.tex:SetAlpha(E.db.general.backdropfadecolor.a - 0.7 > 0 and E.db.general.backdropfadecolor.a - 0.7 or 0.5)	
	BGa.tex:SetAlpha(E.db.general.backdropfadecolor.a - 0.7 > 0 and E.db.general.backdropfadecolor.a - 0.7 or 0.5)
end

--Frames Size
local function FramesSize()
	if not BGb then return end
	local db = E.db.sle.backgrounds
	for _,v in pairs(Fr) do
		v[1]:SetSize(db[v[2]].width, db[v[2]].height)
	end
end

--Frames points
local function FramesPositions()
	if not BGb then return end
	BGb:Point("BOTTOM", E.UIParent, "BOTTOM", 0, 21); 
	BGl:Point("BOTTOMRIGHT", E.UIParent, "BOTTOM", -(E.screenwidth/4 + 32)/2 - 1, 21); 
	BGr:Point("BOTTOMLEFT", E.UIParent, "BOTTOM", (E.screenwidth/4 + 32)/2 + 1, 21); 
	BGa:Point("BOTTOM", E.UIParent, "BOTTOM", 0, E.screenheight/6 + 9);
end

--Updating textures
local function UpdateTex()
	if not BGb then return end
	local db = E.db.sle.backgrounds
	for _,v in pairs(Fr) do
		v[1].tex:Point('TOPLEFT', v[1], 'TOPLEFT', 2, -2)
		v[1].tex:Point('BOTTOMRIGHT', v[1], 'BOTTOMRIGHT', -2, 2)
		v[1].tex:SetTexture(db[v[2]].texture)
	end
end

--Visibility / Enable check
function BG:FramesVisibility()
	if not BGb then return end
	local db = E.db.sle.backgrounds
	for _,v in pairs(Fr) do
		if db[v[2]].enabled then
			v[1]:Show()
		else
			v[1]:Hide()
		end
	end
end

function BG:UpdateFrames()
	if not BGb then return end
	local db = E.db.sle.backgrounds
	for _,v in pairs(Fr) do
		v[1]:SetTemplate(db[v[2]].template, true)
		v[1]:SetAlpha(db[v[2]].alpha)
	end
	FramesSize()
	BG:FramesVisibility()
    UpdateTex()
end

function BG:RegisterHide()
	if not BGb then return end
	local db = E.db.sle.backgrounds
	for k,v in pairs(Fr) do
		if db[v[2]].pethide then
			E.FrameLocks[k] = true
		else
			E.FrameLocks[k] = nil
		end
	end
end

function BG:Initialize()
	if not E.private.sle.backgrounds then return end
	CreateFrames()
	FramesPositions()
	BG:UpdateFrames()
	BG:RegisterHide()

	E:CreateMover(BottomBG, "BottomBG_Mover", L["Bottom BG"], nil, nil, nil, "S&L,S&L BG")
	E:CreateMover(LeftBG, "LeftBG_Mover", L["Left BG"], nil, nil, nil, "S&L,S&L BG")
	E:CreateMover(RightBG, "RightBG_Mover", L["Right BG"], nil, nil, nil, "S&L,S&L BG")
	E:CreateMover(ActionBG, "ActionBG_Mover", L["Actionbar BG"], nil, nil, nil, "S&L,S&L BG")
end