-- English localization file for enUS and enGB.
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "enUS", true);

if not L then return end
L["CONFLICT_WARNING"] = "It would appear you have ElvUI_CastBarSnap loaded. CastBarPowerOverlay has been disabled for the Player CastBar."
L["I understand"] = true
L['Hide Text'] = true
L['Hide Castbar text. Useful if your power height is very low or if you use power offset.'] = true
L['Move castbar text to the left or to the right. Default is 4'] = true
L['Move castbar text up or down. Default is 0'] = true
L['Move castbar time to the left or to the right. Default is -4'] = true
L['Move castbar time up or down. Default is 0'] = true
L["Overlay on Power Bar"] = true
L["Overlay the castbar on the power bar."] = true
L['Arena'] = true
L['Boss'] = true
L['Focus'] = true
L['Player'] = true
L['Target'] = true
L['Text xOffset'] = true
L['Text yOffset'] = true
L['Time xOffset'] = true
L['Time yOffset'] = true

--We don't need the rest if we're on enUS or enGB locale, so stop here.
if GetLocale() == "enUS" then return end

--German Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "deDE")
if L then
	--Add translations here, eg.
	-- L[' Alert'] = ' Alert',
end

--Spanish (Spain) Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "esES")
if L then
	--Add translations here, eg.
	-- L[' Alert'] = ' Alert',
end

--Spanish (Mexico) Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "esMX")
if L then
	--Add translations here, eg.
	-- L[' Alert'] = ' Alert',
end

--French Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "frFR")
if L then
	--Add translations here, eg.
	-- L[' Alert'] = ' Alert',
end

--Italian Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "itIT")
if L then
	--Add translations here, eg.
	-- L[' Alert'] = ' Alert',
end

--Korean Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "koKR")
if L then
	--Add translations here, eg.
	-- L[' Alert'] = ' Alert',
end

--Portuguese Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "ptBR")
if L then
	--Add translations here, eg.
	-- L[' Alert'] = ' Alert',
end

--Russian Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "ruRU")
if L then
	--Add translations here, eg.
	-- L[' Alert'] = ' Alert',
end

--Chinese (China, simplified) Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "zhCN")
if L then
	--Add translations here, eg.
	-- L[' Alert'] = ' Alert',
end

--Chinese (Taiwan, traditional) Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "zhTW")
if L then
	--Add translations here, eg.
	-- L[' Alert'] = ' Alert',
end