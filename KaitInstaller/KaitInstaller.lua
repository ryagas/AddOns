-- Just a tiny addon to get a slash command to load a set of profiles for different addons

SLASH_KaitInstaller1 = "/kaitinstall";
function SlashCmdList.KaitInstaller(msg) -- the function that runs when you type /kaitinstall

local kui = LibStub('AceAddon-3.0'):GetAddon('KuiNameplates')
local xp = LibStub('AceAddon-3.0'):GetAddon('XPBarNone')
-- Setting all the profiles
Grid.db:SetProfile("DPS 5/10man") DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffKaitUI:|cffffffff Grid profile set to |cffffcc66DPS 5/10man")
Raven.db:SetProfile("Default") DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffKaitUI:|cffffffff Raven profile set to |cffffcc66Default")
SLDataText.db:SetProfile("Default") DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffKaitUI:|cffffffff SLDataText profile set to |cffffcc66Default")
Bartender4.db:SetProfile("KaitUI") DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffKaitUI:|cffffffff Bartender profile set to |cffffcc66KaitUI")
kui.db:SetProfile("KaitUI") DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffKaitUI:|cffffffff KuiNameplates profile set to |cffffcc66KaitUI")
xp.db:SetProfile("Default") DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffKaitUI:|cffffffff XPBarNone profile set to |cffffcc66Default")

SexyMap2DB[(UnitName("player").."-"..GetRealmName())] = "global"
DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffKaitUI:|cffffffff SexyMap 'profile' set to |cffffcc66Global")

-- changing to UIscale. Don't need this with UIscaler addon istalled
-- SetCVar("uiScale", 768/string.match(({GetScreenResolutions()})[GetCurrentResolution()], "%d+x(%d+)"))

-- switch off default Blizzard raid frames
CompactRaidFrameManager:UnregisterAllEvents()
CompactRaidFrameManager:Hide()
CompactRaidFrameContainer:UnregisterAllEvents()
CompactRaidFrameContainer:Hide()

-- Confirmation and prompt to /reload the UI
 DEFAULT_CHAT_FRAME:AddMessage("|cff66ffff Success! Profiles installed. You now need to type /reload")

end







