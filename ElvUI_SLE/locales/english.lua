﻿-- English localization file for enUS and enGB.
local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("ElvUI", "enUS", true);

if not L then return; end

--Export/Import--
L["SLE_IMPORTS"] = "|cffFF0000Note:|r Use the filter imports with caution as these will overwrite any custom ones made!\nImporting a class filter will overwrite any modifications you have made to that class filter."
-- L["SLE_EXPORT_HELP"] = [[|cffFFFFFFExporting:
-- Click the Export button and the settings that are different from defaults in selected options tables' will be dumped to the export box.
 -- - Profile will copy profile based settings;
 -- - Private will copy character specific settings;
 -- - Global will copy global settings.|r
-- |cffFF0000Warning: exporting may cause your game to freeze for some time.|r

-- |cffFFFFFFImporting:
-- To import the settings you need to paste the setting table
-- or line to the import editbox and click import button.
-- You can use next formats for settings:
-- 1) E.db.chat.panelHeight = 185
-- 2) E.db['chat']['panelHeight'] = 185
-- 3) E.db['chat'] = {
-- ...
-- }
-- In case of the third format you should put at least 2 values.|r

-- |cffFF0000Know issue: coloring options will be exported anyway no matter the values and exporting options set.|r]]

--Media--
L["SLE_MEDIA"] = "Options to change the look of several UI elements."
L["SLE_TIPS"] = {
	"Don't stand in the fire!",
}

--General--
L["SLE_LOGIN_MSG"] = [=[You are using |cff1784d1Shadow & Light|r version |cff1784d1%s%s|r for ElvUI.
If you wish to use the original ElvUI addon, disable this edit's plugin in your Addons manager.
Have a nice day.]=]
L["SLE_DESC"] = [=[This is an edit of ElvUI that adds some functionality to the original addon and changes some previously existed options.
The edit doesn't change original files in any respect so you can freely disable it any time from your addon manager without any risk.]=]
L['MSG_OUTDATED'] = "Your version of ElvUI is older than recommended to use with Shadow & Light. Your version is |cff1784d1%.2f|r (recommended is |cff1784d1%.2f|r). Please update your ElvUI."

--Install--
L["SLE_Install_Text2"] = [=[This step is optional and only to be used if you are wanting to use one of our configurations. In some cases settings may differ depending on layout options you chose in ElvUI installation. 

A |cff1784d1"%s"|r role was chosen.

|cffFF0000Warning:|r Please note that the authors' may or may not use any of the layouts/themes you have selected as they may have changed their setup more recently. Also switching between layouts in here may cause some unpredictable and weird results.]=]
L["SLE_ARMORY_INSTALL"] = "Enable S&L Armory\n(Detailed Character & Inspect frames)\n|cffFF0000Note:|r This is currently a beta option."

--Backgroungds--
L["BG_DESC"] = "Module for creating additional frames that can be used as backgrounds for anything."
L["Sets width of the frame"] = "Wähle die breite dieses Fensters"
L["Sets height of the frame"] = "Wähle die höhe dieses Fensters"
L["Sets X offset of the frame"] = "Wähle den X Versatz für dieses Fenster"
L["Sets Y offset of the frame"] = "Wähle den Y Versatz für dieses Fenster"
L["Texture"] = "Textur"
L["Set the texture to use in this frame.  Requirements are the same as the chat textures."] = "Wähle die Textur die für dieses Fenster benutzt wird. Empfohlen wird die selbe wie die Chat Textur."
L["Backdrop Template"] = "Hintergrund Template"
L["Change the template used for this backdrop."] = "Wähle das Template das für den Hintergrund benutzt wird."
L["Default"] = "Standart"

--Character Frame Options
L["CFO_DESC"] = "This section will added different options/features to the character sheet.  Here you can show item level and durability of your items for a quick glance."
L['IFO_DESC'] = "This section will disable default inspect frame and use a custom one that S&L provides.  Please note that this is in a very early beta and we know there may be issues.  We will be adding customization in later releases, please make sure to check for updates for new features and fixes."

--Datatexts--
L["SLE_AUTHOR_INFO"] = "Shadow & Light by Darth Predator & Repooc"
L["SLE_CONTACTS"] = [=[If you have suggestions or a bug report,
please submit ticket at http://git.tukui.org/repooc/elvui-shadowandlight]=]
L["DP_1"] = "DT Panel 1"
L["DP_2"] = "DT Panel 2"
L["DP_3"] = "DT Panel 3"
L["DP_4"] = "DT Panel 4"
L["DP_5"] = "DT Panel 5"
L["DP_6"] = "DT Panel 6"
L["Bottom_Panel"] = "Bottom Panel"
L["Top_Center"] = "Top Panel"
L["DP_DESC"] = [=[Additional Datatext Panels.
8 panels with 20 datatext points total and a dashboard with 4 status bars.
You can't disable chat panels.]=]

--Equip Manager--
L["EM_DESC"] = "This module provides different options to automatically change your equipment sets on spec change or entering certain locations."


--Farm--
L["FARM_DESC"] = [[Additional actionbars for the Sunsong Ranch containing seeds, tools and portals.
They will appear only if you are on the Ranch or The Halfhill Market.]]

--Loot--
L["AUTOANNOUNCE_DESC"] = "When enabled, will automatically announce the loot when the loot window opens.\n\n|cffFF0000Note:|r Raid Lead, Assist, & Master Looter Only."
L["LOOTH_DESC"] = "These are options for tweaking the Loot Roll History window."
L["LOOT_AUTO_DESC"] = "Automatically selects an apropriate roll on dropped loot."

--Minimap--
L['MINIMAP_DESC'] = "These options effect various aspects of the minimap.  Some options may not work if you disable minimap in the General section of ElvUI config."

--Tooltip--
L["TTOFFSET_DESC"] = "This adds the ability to have the tooltip offset from the cursor.  Make sure to have the \"Cursor Anchor\" option enabled in ElvUI's Tooltip section to use this feature."

--UI buttons--
L["UB_DESC"] = "This adds a small bar with some useful buttons which acts as a small menu for common things."

--About/help--
L["LINK_DESC"] = [[Following links will direct you to the Shadow & Light's pages on various sites.]]

--Credits--
L["ELVUI_SLE_CREDITS"] = "We would like to point out the following people for helping us create this addon with testing, coding, and other stuff."
L["ELVUI_SLE_CODERS"] = [=[Elv
Tukz
Affinitii
Arstraea
Azilroka
Benik
Blazeflack
Boradan
Camealion
Omega1970
Pvtschlag
Simpy, The Heretic
Sinaris
Sortokk
Swordyy
]=]
L["ELVUI_SLE_MISC"] = [=[BuG - for being french lol
TheSamaKutra
The rest of TukUI community
]=]
