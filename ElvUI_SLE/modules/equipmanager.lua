﻿local E, L, V, P, G = unpack(ElvUI);
local EM = E:GetModule('SLE_EquipManager')

local GetEquipmentSetInfo, GetSpecialization, GetActiveSpecGroup, UseEquipmentSet = GetEquipmentSetInfo, GetSpecialization, GetActiveSpecGroup, UseEquipmentSet
local IsInInstance, GetNumWorldPVPAreas, GetWorldPVPAreaInfo = IsInInstance, GetNumWorldPVPAreas, GetWorldPVPAreaInfo
local gsub, strfind = string.gsub, string.find, string.sub

local function Equip(event)
	local primary = GetSpecialization()

	if primary ~= nil then
		local inInstance, instanceType = IsInInstance()

		if (event == "ACTIVE_TALENT_GROUP_CHANGED") then
			if GetActiveSpecGroup() == 1 then
				UseEquipmentSet(E.private.sle.equip.primary)
			else
				UseEquipmentSet(E.private.sle.equip.secondary)
			end
		end

		if (instanceType == "party" or instanceType == "raid") then
			UseEquipmentSet(E.private.sle.equip.instance)
		end

		if (instanceType == "pvp" or instanceType == "arena") then
			UseEquipmentSet(E.private.sle.equip.pvp)
		end

		if E.private.sle.equip.pvp ~= "NONE" then
			for i = 1, GetNumWorldPVPAreas() do
				local _, localizedName, isActive = GetWorldPVPAreaInfo(i)

				if (GetRealZoneText() == localizedName and isActive) then
					UseEquipmentSet(E.private.sle.equip.pvp)
				end
			end
		end
	end
end

function EM:EquipSpamFilter(event, msg, ...)
	if strfind(msg, string.gsub(ERR_LEARN_ABILITY_S:gsub('%.', '%.'), '%%s', '(.*)')) then
		return true
	elseif strfind(msg, string.gsub(ERR_LEARN_SPELL_S:gsub('%.', '%.'), '%%s', '(.*)')) then
		return true
	elseif strfind(msg, string.gsub(ERR_SPELL_UNLEARNED_S:gsub('%.', '%.'), '%%s', '(.*)')) then
		return true
	elseif strfind(msg, string.gsub(ERR_LEARN_PASSIVE_S:gsub('%.', '%.'), '%%s', '(.*)')) then
		return true
	end

	return false, msg, ...
end

local function EnableSpamFilter()
	ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", EM.EquipSpamFilter)
end

local function DisableSpamFilter()
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_SYSTEM", EM.EquipSpamFilter)
end

function EM:SpamThrottle()
	if E.private.sle.equip.spam then
		EnableSpamFilter()
	else
		DisableSpamFilter()
	end
end

function EM:Initialize()
	EM:SpamThrottle()
	if not E.private.sle.equip.enable then return end
	self:RegisterEvent("PLAYER_ENTERING_WORLD", Equip)
	self:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED", Equip)
	self:RegisterEvent("PLAYER_TALENT_UPDATE", Equip)
	self:RegisterEvent("ZONE_CHANGED", Equip)
end