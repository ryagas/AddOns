local activeModule = "Localisation";
local DTM_MISSING_TRANSLATION = "%s"; -- Leave this one in English.

-- Bindings translation

if ( GetLocale() == 'frFR' ) then
    -- French

    BINDING_HEADER_DTM_BINDINGS = "Commandes DiamondThreatMeter";
    BINDING_NAME_DTM_EMERGENCYSTOP = "Arrêt d'urgence";
    BINDING_NAME_DTM_RESETTHREAT = "Réinitialiser listes de menace";
    BINDING_NAME_DTM_TOGGLETARGET = "Basculer liste de menace <cible>";
    BINDING_NAME_DTM_TOGGLEFOCUS = "Basculer liste de menace <focus>";
    BINDING_NAME_DTM_TOGGLEOVERVIEW = "Basculer sa vue d'ensemble";
    BINDING_NAME_DTM_TOGGLEREGAIN = "Basculer sa liste de reprise";

elseif ( GetLocale() == "foo" ) then
    -- Note to translators: just replace "foo" with the language you wish to provide.



elseif ( GetLocale() == "bar" ) then
    -- Note to translators: just replace "bar" with the language you wish to provide.

elseif ( GetLocale() == "ruRU" ) then
    -- Russian (I hope)
    BINDING_HEADER_DTM_BINDINGS = "Diamond угрозы метр команды";
    BINDING_NAME_DTM_EMERGENCYSTOP = "Аварийная остановка";
    BINDING_NAME_DTM_RESETTHREAT = "Сбросить все угрозы списки";
    BINDING_NAME_DTM_TOGGLETARGET = "Переключить <цель> угрозы список";
    BINDING_NAME_DTM_TOGGLEFOCUS = "Переключить <В фокусе> список угроз";
    BINDING_NAME_DTM_TOGGLEOVERVIEW = "Переключить обзор список";
    BINDING_NAME_DTM_TOGGLEREGAIN = "Переключить восстановить список";
    
else
    -- Default

    BINDING_HEADER_DTM_BINDINGS = "DiamondThreatMeter commands";
    BINDING_NAME_DTM_EMERGENCYSTOP = "Emergency stop";
    BINDING_NAME_DTM_RESETTHREAT = "Reset all threat lists";
    BINDING_NAME_DTM_TOGGLETARGET = "Toggle <target> threat list";
    BINDING_NAME_DTM_TOGGLEFOCUS = "Toggle <focus> threat list";
    BINDING_NAME_DTM_TOGGLEOVERVIEW = "Toggle overview list";
    BINDING_NAME_DTM_TOGGLEREGAIN = "Toggle regain list";
end

-- --------------------------------------------------------------------
-- **                     Localisation table                         **
-- --------------------------------------------------------------------

local DTM_Locale = {
    ["default"] = {
         ["Unknown"] = "Unknown",
         ["Invalid"] = "Invalid",
         ["Sec"] = "sec",
         ["AlteracValley"] = "Alterac Valley",
         ["RankCapture"] = "Rank (%d+)",
         ["Foo"] = "Foo",
         ["Bar"] = "Bar",
         ["Enabled"] = "Enabled",
         ["Position"] = "Position",
         ["Justification"] = "Justification",
         ["LeftShort"] = "L",
         ["CenterShort"] = "C",
         ["RightShort"] = "R",
         ["Erase"] = "Erase",
         ["Auto"] = "Auto",
         ["Top"] = "Top",
         ["Center"] = "Center",
         ["Bottom"] = "Bottom",

         ["VersionQueryTimeOut"] = "No answer",
         ["VersionQueryDisconnected"] = "Disconnected",

         -- Console localisation

         ["Boot"] = "DiamondThreatMeter loaded and ready. [v%s]\n/DTM to show a list of commands.",
         ["SavedVariablesBadVersion"] = "Configuration parameters are no longer compatible with this version. Default parameters will be used.",
         ["SkinsBadVersion"] = "Skins system is no longer compatible. Default parameters will be used.",
         ["SkinsVersionUpgrade"] = "Skins system has been upgraded to a newer version. Your previous skins could have been adapted successfully.",
         ["ProfileRegistered"] = "The profile of <%s> has been created.",
         ["NPCAbilitiesUpdated"] = "|cffffff00%d|r NPCs were updated in DTM NPC database.",
         ["NPCAbilitiesReset"] = "NPC database has been reset. Predefined NPCs have been restored.",
         ["CheckSavedVariablesReset"] = "Are you sure you want to completely reset DTM configuration?\n\nYour interface will be reloaded.",
         ["CheckNPCDatabaseReset"] = "Are you sure you want to completely reset DTM NPC database?\n\nDefault NPC database will be restored.",
         ["CheckAllReset"] = "Are you sure you want to ERASE ANY DATA saved by DTM, including config and skins? The Addon will behave as if it was run for the first time.\n\nType in |cffff0000ERASE|r to confirm.\n\nYour interface will be reloaded.",
         ["VersionCheckReminder"] = "We recommand you to run a version check and see if there is a newer version of DTM available.\n\nDo you want DTM to do it for you now?",

         ["FirstRunWelcome"] = "This is the first time |cff00ff00DiamondThreatMeter |cff6060ffv%s|r is run on this WoW client.\n\nYou can access the AddOn slash commands with |cff00ff00/DTM|r and modify its settings in |cffffff00WoW interface and bindings menus.|r",
         ["FunctionalityNotImplementedYet"] = "Sorry! This functionality, |cffffff00%s|r, is not implemented yet! Please wait a future version.",
         ["OpenOptions"] = "Open options",
         ["RoleSelection"] = "Please type in the role you perform currently:\n|cff00ff40Tank |Damage |AoE\nHealer |Solo with pet|r\n\nDTM will be configured automatically to suit this role.",
         ["RoleTank"] = "Tank",
         ["RoleTankMatches"] = "tank|chucknorris|chuck norris|t",
         ["RoleDamageDealer"] = "Damage dealer",
         ["RoleDamageDealerMatches"] = "damage|dd|dps|d",
         ["RoleAoEer"] = "AoEer",
         ["RoleAoEerMatches"] = "aoe|pbaoe|zone|zoner|a",
         ["RoleHealer"] = "Healer",
         ["RoleHealerMatches"] = "healer|heal|h",
         ["RolePet"] = "Solo with pet",
         ["RolePetMatches"] = "pet|solo with pet|s",
         ["RoleSelected"] = "You have selected |cff00ff00%s|r.\n\nIf you change your role in the meantime, remember to change DTM configuration to suit your new role better.\n\nBy default, threat lists only apparear when you are grouped.",

         ["EmergencyStopDisabled"] = "|cff40ff40Emergency stop has been deactivated.|r";
         ["EmergencyStopEnabled"] = "|cffff4040Emergency stop has been activated.|r\nEnter /DTM toggle to rearm the AddOn.";

         ["NotifyEngineDisabled"] = "DTM engine is currently disabled. Go to Interface options to re-enable it.",
         ["NotifyGUIDisabled"] = "DTM GUI is currently disabled. Go to Interface options to re-enable it.",

         ["ConsoleBadSyntax"] = "Bad syntax for this slash command. Try:\n",
         ["ConsoleUnknown"] = "You specified an unknown command. Suggestions:\n",
         ["ConsoleBroken"] = "The command could not run, though it should have. Maybe you don't have the full DTM AddOn running.",

         ["TestNoTalent"] = "No talent has been found for %s. Maybe it isn't a PC.",
         ["TestCannotQueryTalents"] = "Can't get active talents of %s. Try getting closer or it isn't a friendly PC.",
         ["TestQueryTalentsFired"] = "Getting %s talents...",
         ["TestQueryTalentsError"] = "Talents request of %s failed. Maybe some AddOn or Blizzard's inspect frame interfered with DTM system.",
         ["TestTalentDB"] = "%d talents have been found in DTM talents database for %s:",
         ["TestTalentDBRow"] = "%d. %s",
         ["TestTalentRank"] = "|cff8080ff%s|r [%s] Rank |cffffff00%d/%d|r",
         ["TestNoPCAbility"] = "%s is a PC. PCs cannot have innate special abilities.",
         ["TestNoNPCAbility"] = "No threat modifying abilities were found on %s NPC.",
         ["TestNPCAbility"] = "%d threat modifying abilities were found on %s NPC:",
         ["TestNPCAbilityRow"] = "%d. |cffffff00%s|r",
         ["TestNoAssociationErrors"] = "No association error was recorded. Maybe the recording feature is turned OFF in the LUA script file.",
         ["TestAssociationErrors"] = "%d association errors have been recorded:",
         ["TestAssociationErrorsRow"] = "%d. |cffffff00%s|r",
         ["TestGearThreatMultiplier"] = "Threat multiplier from items: |cff00ff00x%.3f|r",
         ["TestSets"] = "The following are the armor sets found for %s:",
         ["TestSetsRow"] = "|cffffff00%s|r %d/%d",
         ["TestListNumber"] = "DTM is aware of %d entities:",
         ["TestListRow"] = "%d. %s (%s)",
         ["TestListThreatListNumber"] = "    %s's threat list contains %d entities:",
         ["TestListThreatListRow"] = "    %d. %s (%s) [%d]",
         ["TestVersionSent"] = "Request sent to get DTM versions used by the group...",
         ["TestVersionErrorUnknown"] = "An error occured while sending the version test.",
         ["TestVersionErrorFlood"] = "Please wait a bit before sending a version test.",
         ["TestVersionErrorNotGrouped"] = "You are not in a group, a version test is useless.",
         ["TestVersionResults"] = "Results of version test:",
         ["TestVersionResultsRow"] = "%d. %s %s |cffffff00[%s]|r",
         ["TestTalentsBufferNumber"] = "The talents buffer is aware of %d entities:",
         ["TestTalentsBufferRow"] = "%d. %s (%d talents registered)",
         ["TestItemsBufferNumber"] = "The items buffer is aware of %d entities:",
         ["TestItemsBufferRow"] = "%d. %s (%d items equipped)",

         ["ResetEntityData"] = "All threat data have been reset.",

         ["ErrorInCombat"] = "An error flagged as %s has occured in DTM. The error log will be displayed once you leave combat mode.",
         ["ErrorPosition"] = "Error %d out of %d",
         ["ErrorHeader"] = "Error %d - Type: %s, module: |cff4040ff%s|r\n|cffffffffError message:|r",
         ["ErrorHeaderNoError"] = "No error has been encountered so far.",
         ["ErrorType:MINOR"] = "|cff00ff00Minor|r",
         ["ErrorType:MAJOR"] = "|cffff8000Major|r",
         ["ErrorType:CRITICAL"] = "|cffff0000Critical|r",

         -- Threat, overview, regain lists localisation

         ["guiHeader"] = "DiamondThreatMeter v%s",

         ["Name"] = "Name",
         ["Threat"] = "Threat",
         ["TPS"] = "TPS",
         ["Relative"] = "Who ?",

         ["unitInfo"] = "%s Level %s %s",
         ["unitInfoLight"] = "%s %s",
         ["noThreatList"] = "|cffffa000This NPC does not use a threat list.|r",

         ["aggroRegain"] = "|cffff4040Aggro regain|r",
         ["aggroRegainClose"] = "|cffff8020Aggro (close)|r",

         ["standbyTarget"] = "No NPC selected.",
         ["standbyTargetWrongReaction"] = "This NPC is not hostile.",
         ["standbyTargetDead"] = "Your target is |cffff4040dead|r.",
         ["standbyTargetOpening"] = "Opening threat list...",
         ["standbyFocus"] = "No NPC set as focus.",
         ["standbyFocusWrongReaction"] = "This NPC is not hostile.",
         ["standbyFocusDead"] = "Your focus is |cffff4040dead|r.",
         ["standbyFocusOpening"] = "Opening threat list...",

         ["overviewNoUnit"] = "Unknown unit.",
         ["overviewOpening"] = "Opening presence list...",
         ["overviewUnitInfo"] = "Overview (%s)",

         ["regainNoUnit"] = "Unknown unit.",
         ["regainOpening"] = "Opening regain list...",
         ["regainUnitInfo"] = "Regain (%s)",

         ["test"] = "Test",
         ["testList"] = "This is a test list.",

         ["tankToggle"] = "Is a tank",
         ["tankToggleTooltip"] = "This button allows you to set whether this unit is a tank or not. Tanks show a special icon instead of their class one.",

         ["anchorSetting"] = "Anchor point",
         ["anchorSettingTooltip"] = "You can choose here how you want this list to be anchored. It will expend on the opposite anchor direction.",

         ["TWGainTemplate"] = "%s |cffff0000AGGRO|r - %s",
         ["TWLoseTemplate"] = "%s |cff0000ffAggro Lost|r - %s",

         -- Configuration frame localisation

         -- 0. Overall

         ["configEngineCategory"] = "Engine",
         ["configGUICategory"] = "GUI",
         ["configSystemCategory"] = "System",
         ["configWarningCategory"] = "Warnings",
         ["configNameplateCategory"] = "Nameplates",
         ["configVersionCategory"] = "Version",

         -- 1. Intro panel

         ["configIntroTitle"] = "Welcome in DTM configuration panel !",
         ["configIntroSubTitle"] = "From this panel you can access the other configuration panels of DTM.",

         ["configIntroSystemPart"] = "System configuration",
         ["configIntroEnginePart"] = "Engine configuration",
         ["configIntroGUIPart"] = "GUI configuration",
         ["configIntroWarningPart"] = "Warnings configuration",
         ["configIntroNameplatePart"] = "Nameplates configuration",
         ["configIntroVersionPart"] = "Version check",

         ["configIntroRingButtonExplain"] = "Below is the DTM ring button. You can drag it anywhere and then click on it to directly open DTM config menu.",
         ["configIntroRingButtonMoving"] = "You are moving the ring button. Release the mouse button once you have found the appropriate spot for it.",
         ["configIntroRingButtonReset"] = "The ring button is now set. If you made a mistake, click on the button below to set its position again.",

         -- 2. Engine panel

         ["configEngineTitle"] = "Engine settings",
         ["configEngineSubTitle"] = "You can set here how you'd like DTM engine to behave.",

         ["configEngineEnable"] = "Enable engine",
         ["configEngineEnableCaption"] = "|cffff2020The engine is currently switched off.|r\nThreat data is not available.",
         ["configEngineDisable"] = "Disable engine",
         ["configEngineDisableCaption"] = "|cff20ff20The engine is currently switched on.|r\nDisabling it will prevent threat data from being computed.",
         ["configEnginePaused"] = "|cffffff20Temporarily halted.|r\nThe engine will re-enable itself automatically.",
         ["configEngineEmergencyStop"] = "|cffff2020Emergency stop is enabled.|r\nDisable it to reactivate the engine.",

         ["configAggroDelaySlider"] = "Aggro change delay",
         ["configZoneWideCheckRateSlider"] = "Zone-wide combat check interval",
         ["configTPSUpdateRateSlider"] = "TPS update rate",
         ["configDetectReset"] = "Clean up the database regularly",

         ["configWorkMethod"] = "Work method",
         ["configWorkMethodAnalyze"] = "Analyze",
         ["configWorkMethodHybrid"] = "Hybrid",
         ["configWorkMethodNative"] = "Native",

         ["configTooltipWorkMethodAnalyze"] = "Determinate threat values by using solely combat log informations. In this setting the threat shown can and will be inaccurate. This was the pre-WotLK way to determinate threat data.",
         ["configTooltipWorkMethodHybrid"] = "Determinate threat values by using both combat log and Blizzard native threat meter. This setting is the most CPU intensive but it yields lots of threat data whose accuracy is quite good. Sudden changes in threat values displayed can occur because native threat meter recalibrates inaccurate results from combat parsing.",
         ["configTooltipWorkMethodNative"] = "Determinate threat values by using solely Blizzard native threat meter. This setting does not give good threat data about units that do not belong to your party or raid, but gives exact threat values and is the fastest.",

         ["configTooltipAggroDelayExplain"] = "This slider sets how much time DTM will wait before considering the NPC has changed its real aggro target when it switches between targets.",
         ["configTooltipZoneWideCheckRateExplain"] = "Sets the interval of time there is before DTM checks if nearby raid members have entered zone-wide combat. Lower values decrease overall performances but make sure the raid members are added at once in enemies' threat lists.",
         ["configTooltipTPSUpdateRateExplain"] = "You can adjust here how often you want TPS to be updated. Updates occuring more often might produce slowdowns in heavy fights.",
         ["configTooltipDetectResetExplain"] = "When enabled, this option allows DTM to erase threat lists' content of out-of-combat creatures that are not tagged nor targetting anyone. It also allows DTM to erase data of creatures we haven't heard anything about for 600 sec.",

         -- 3. GUI panel

         ["configGUITitle"] = "Graphical User Interface settings",
         ["configGUISubTitle"] = "You can set here how DTM should present you threat lists.",

         ["configGUIEnable"] = "Enable GUI",
         ["configGUIEnableCaption"] = "|cffff2020The GUI is currently switched off.|r\nThreat lists' display is disabled.",
         ["configGUIDisable"] = "Disable GUI",
         ["configGUIDisableCaption"] = "|cff20ff20The GUI is currently switched on.|r\nDisabling it will prevent threat lists' display.",
         ["configGUIPaused"] = "|cffffff20Temporarily halted.|r\nThe GUI will re-enable itself automatically.",
         ["configGUIEmergencyStop"] = "|cffff2020Emergency stop is enabled.|r\nDisable it to reactivate the GUI.",

         ["configGUIAutoDisplay"] = "Auto-display condition",
         ["configGUIAutoDisplayTarget"] = "Target threat list",
         ["configGUIAutoDisplayFocus"] = "Focus threat list",
         ["configGUIAutoDisplayOverview"] = "Overview list",
         ["configGUIAutoDisplayRegain"] = "Regain list",
         ["configGUIAutoDisplayAlways"] = "Always",
         ["configGUIAutoDisplayOnChange"] = "On change",
         ["configGUIAutoDisplayOnJoin"] = "On grouping",
         ["configGUIAutoDisplayOnCombat"] = "On combat",
         ["configGUIAutoDisplayNever"] = "Never",

         ["configTooltipAutoDisplayAlways"] = "Allows this threat list to be always displayed by default.",
         ["configTooltipAutoDisplayNever"] = "Prevents this threat list to be displayed by default.",
         ["configTooltipAutoDisplayOnChange"] = "Displays this threat list when you set your focus.",
         ["configTooltipAutoDisplayOnJoin"] = "Displays this threat list when you join a group.",
         ["configTooltipAutoDisplayOnCombat"] = "Displays this threat list when you enter combat.",

         -- 4. System panel

         ["configSystemTitle"] = "System settings",
         ["configSystemSubTitle"] = "You can modify here general DTM options that affect both engine and GUI.",

         ["configSystemEnable"] = "Resume",
         ["configSystemEnableCaption"] = "|cffff2020The emergency stop is currently enabled.|r\nThe engine and the GUI are halted.",
         ["configSystemDisable"] = "STOP",
         ["configSystemDisableCaption"] = "|cff20ff20The emergency stop is currently disabled.|r",

         ["configSystemAlwaysEnabled"] = "Always allows DTM to run",
         ["configSystemQuickConfig"] = "Quick configuration",
         ["configSystemBindings"] = "DTM special bindings",
         ["configSystemErrorLog"] = "Error log",

         ["configSystemManagementHeader"] = "Saved data management",

         ["configSystemModifiedProfile"] = "Profile affected by options modifications:",
         ["configSystemResetSavedVars"] = "Reset DTM configuration",
         ["configSystemResetNPCData"] = "Reset NPC database",
         ["configSystemResetAll"] = "Reset everything",

         ["configTooltipAlwaysEnabledExplain"] = "When ticked, DTM will continue to run even if you're in a battleground or arena, a taxi, an inn, a capital city or a sanctuary.",
         ["configTooltipQuickConfigExplain"] = "This button allows you to quickly configure DTM according to the role you are performing currently.",
         ["configTooltipModifiedProfileExplain"] = "If you select this, character-specific changes made to DTM options will affect |cff20ff20%s (%s)|r profile.\n\n|cffff0000WARNING|r - If you click option panels will be refreshed and unsaved changes will be lost.",
         ["configTooltipResetSavedVarsExplain"] = "Clicking on this button will reset all configuration data. Skins will remain unchanged. Interface will be immediately reloaded.",
         ["configTooltipResetNPCDataExplain"] = "Clicking on this button will reset the NPC database, which contains their special abilities and behaviour. Default data will be restored.",
         ["configTooltipResetAllExplain"] = "Clicking on this button will clear any DTM saved data, including config and skins. This button is the last solution if you experience problems with DTM. Interface will be immediately reloaded.",

         -- 5. Version panel

         ["configVersionTitle"] = "About version",
         ["configVersionSubTitle"] = "You can check here your version number and ask the other party members to send theirs.",

         ["configVersionYours"] = "You are using |cffffffff%s|r version of DiamondThreatMeter.",

         ["configVersionQuery"] = "Request version",
         ["configVersionQueryBusy"] = "|cffffff00The system is currently busy.|r",
         ["configVersionQueryFlood"] = "|cffffff00Please wait a moment.|r",
         ["configVersionQueryNotGrouped"] = "|cffff8000You can only only request version number when you are in a group.|r",
         ["configVersionQueryOK"] = "|cff00ff00Ready to request version number.|r",
         ["configVersionQueryResults"] = "Results of version query:",

         ["configVersionDTMFormat"] = "|cff00ff00DTM|r |cffffffffv%s|r",
         ["configVersionOtherFormat"] = "|cffffa000%s|r |cffffffff%s|r",
         ["configVersionNoneFormat"] = "|cffffffff%s|r",

         -- 6. Warning panel

         ["configWarningTitle"] = "Advanced warnings configuration",
         ["configWarningSubTitle"] = "You can set here when, where and how DTM should warn you when you're about to pull aggro from a dangerous enemy.",

         ["configWarningExplain110"] = "- When going above |cffffff20110%|r of NPC target's threat, you'll regain aggro if you are in melee range.",
         ["configWarningExplain130"] = "- When going above |cffff2020130%|r of NPC target's threat, you'll regain aggro.",
         ["configWarningLimit"] = "Margin before being warned",
         ["configWarningCancelLimit"] = "Margin to cancel",
         ["configWarningPosition"] = "Position setting",
         ["configWarningHorizontal"] = "Horizontal",
         ["configWarningLeft"] = "Left",
         ["configWarningRight"] = "Right",
         ["configWarningVertical"] = "Vertical",
         ["configWarningUp"] = "Up",
         ["configWarningDown"] = "Down",
         ["configWarningEnablePreview"] = "Enable preview",
         ["configWarningDisablePreview"] = "Disable preview",

         ["configWarningToggle"] = "Use warnings",

         ["configWarningThreshold"] = "Warning threshold",
         ["configWarningBossTag"] = "Boss NPC",
         ["configWarningEliteTag"] = "Elite NPC",
         ["configWarningNormalTag"] = "Normal NPC",
         ["configWarningLevelTag"] = "lev.",
         ["configWarningAndMoreTag"] = "and more",
         ["configWarningClassification"] = "Displays warnings against |cffff2020%s|r.",
         ["configWarningClassificationAndLevel"] = "Displays warnings against |cffff2020%s|r that has a level difference with you of |cffff2020%s%s|r and above.",

         ["configWarningSound"] = "Warning sound",
         ["sound:NONE"] = "None",
         ["sound:WEIRD"] = "Weird",
         ["sound:BUZZER"] = "Buzzer",
         ["sound:PEASANT"] = "Peasant (War3)",
         ["sound:ALARM"] = "Alarm",

         ["configTooltipWarningExplain"] = "If enabled, you'll be warned when you're about to pull aggro from a fierce monster (any NPC that matches the warning threshold). Tanks will certainly want to disable this option.\n\nAlso note that there are special rules set in DTM that will force the warning bar to stay hidden or be forcefully shown for some NPCs regardless of your settings.",
         ["configTooltipWarningLimitExplain"] = "This slider allows you to change the margin you have before triggering the warning. For instance, if you set 20% and you are in melee range, this means warning will get triggered above 110 - 20 = 90%.",
         ["configTooltipWarningCancelLimitExplain"] = "This slider allows you to change the margin you have to create before a bar in warning mode stops being in warning mode. For instance, if you set 30% and you are in melee range, this means warning will stop if you get under 110 - 30 = 80%.",
         ["configTooltipPreviewExplain"] = "This button allows you to toggle a special bar which shows where bars in warning mode would go to on your screen. This allows you to precisely position them using sliders above. It also allows you to hear the warning sound you have chosen.",

         -- 7. Nameplates panel

         ["configNameplateTitle"] = "Nameplates configuration",
         ["configNameplateSubTitle"] = "You can set here if you want DTM to also show your threat above enemies' nameplates.",

         ["configNameplateExplain"] = "CAUTION - This functionality is currently experimental and cannot distinguish between enemies holding the same name. If there is an ambiguity, DTM will not display threat data above the nameplate.",
         ["configNameplateToggle"] = "Enable threat display",
         ["configTooltipNameplateExplain"] = "Tick this box in order to display your threat toward nearby enemies above their nameplate.\n\n|cffff0000Please note that when several enemies sharing the same name are engaged in combat, DTM will NOT be able to display their threat above their name.|r",

         -- 8. Skin manager frame

         ["configSkinManagerHeader"] = "Skin Manager",

         ["configSkinManagerTagBase"] = " |cff00ff00(base skin)|r",
         ["configSkinManagerTagUser"] = " |cff2020ff(user-defined skin)|r",

         ["configSkinManagerExplain"] = "Skins are settings that define how DTM should look like. To create your own skin, you must copy an existing skin and modify it.",
         ["configSkinManagerExplainLocked"] = "The manager is currently locked and you have to close the skin editor before you can use it again.",
         ["configSkinManagerExplainBaseSkin"] = "This is a base skin. These skins can be modified, but not deleted or renamed. They can be restored to their original version.",
         ["configSkinManagerExplainUserSkin"] = "This is an user-defined skin. They can be renamed, deleted, modified but not restored.",
         ["configSkinManagerExplainSelectionAppend"] = "\n\nClick to select this skin for the current profile.",

         ["configSkinManagerSelection"] = "Skin selected:",
         ["configSkinManagerRename"] = "Rename",
         ["configSkinManagerRestore"] = "Restore",
         ["configSkinManagerCopy"] = "Copy",
         ["configSkinManagerDelete"] = "Delete",
         ["configSkinManagerToEditor"] = "Send to the skin editor",

         ["configSkinManagerCopyForm"] = "You're about to copy the skin |cff00ff00%s|r.\nWhat name will you give to the copy?",
         ["configSkinManagerRenameForm"] = "You're about to rename the skin |cff00ff00%s|r.\nWhat new name will you give to it?",
         ["configSkinManagerRestoreForm"] = "You're about to restore the base skin |cff00ff00%s|r.\nAre you sure you want to do that?",
         ["configSkinManagerDeleteForm"] = "You're about to delete the skin |cff00ff00%s|r.\nAre you sure you want to do that?",

         -- 9. Skin editor frame

         ["configSkinEditorPreview"] = "Preview",
         ["configSkinEditorFinish"] = "Finish",
         ["configSkinEditorCategory"] = "Category %d /%d",

         -- Skin schema translation

         -- 1. Categories

         ["skinSchema-General"] = "General",
         ["skinSchema-Animation"] = "Animation",
         ["skinSchema-ThreatList"] = "Threat list",
         ["skinSchema-OverviewList"] = "Overview list",
         ["skinSchema-RegainList"] = "Regain list",
         ["skinSchema-Display"] = "Display",
         ["skinSchema-Bars"] = "Bars",
         ["skinSchema-Columns"] = "Columns",
         ["skinSchema-RegainColumns"] = "Columns (regain)",
         ["skinSchema-Text"] = "Text",

         -- 2. Labels

         ["skinSchema-Length"] = "Length",
         ["skinSchema-Alpha"] = "Alpha",
         ["skinSchema-Scale"] = "Scale",
         ["skinSchema-LockFrames"] = "Lock position of lists",

         ["skinSchema-ShortFigures"] = "Shorten figures",
         ["skinSchema-TWMode"] = "Textual warning mode",
         ["skinSchema-TWCondition"] = "Textual warning condition",
         ["skinSchema-TWPositionY"] = "Y position of the textual warning",
         ["skinSchema-TWHoldTime"] = "Display time of the textual warning",
         ["skinSchema-TWCooldownTime"] = "Cooldown time of the textual warning",
         ["skinSchema-TWSoundEffect"] = "Sound effect of the textual warning",

         ["skinSchema-OnlyHostile"] = "Only display hostile NPCs",
         ["skinSchema-AlwaysDisplaySelf"] = "Always show self",
         ["skinSchema-DisplayAggroGain"] = "Add aggro regain tag",
         ["skinSchema-RaiseAggroToTop"] = "Raise to top aggro target",
         ["skinSchema-RaiseAggroToTopOverview"] = "Raise to top aggro'ed enemies",
         ["skinSchema-DisplayLevel"] = "Display level",
         ["skinSchema-DisplayHealth"] = "Display health",
         ["skinSchema-Filter"] = "Filter",
         ["skinSchema-CursorTexture"] = "Cursor texture",
         ["skinSchema-Rows"] = "Max number of rows",

         ["skinSchema-BackdropUseTile"] = "The background uses the tile mode",
         ["skinSchema-TileTexture"] = "Background texture",
         ["skinSchema-EdgeTexture"] = "Edge texture",
         ["skinSchema-WidgetTexture"] = "Widget texture",
         ["skinSchema-WidgetPositionX"] = "Widget X position",
         ["skinSchema-WidgetPositionY"] = "Widget Y offset",

         ["skinSchema-BackgroundTexture"] = "Base texture",
         ["skinSchema-FillTexture"] = "Fill texture",
         ["skinSchema-ShowSpark"] = "Show the spark",
         ["skinSchema-Smooth"] = "Smoothen bars' variations",
         ["skinSchema-FadeCoeff"] = "Fade animation duration coeff",
         ["skinSchema-SortCoeff"] = "Sort animation duration coeff",
         ["skinSchema-AggroGraphicEffect"] = "Graphic effect when one has aggro",

         ["skinSchema-Class"] = "Class",
         ["skinSchema-Name"] = "Name",
         ["skinSchema-Threat"] = "Threat",
         ["skinSchema-TPS"] = "Threat Per Second",
         ["skinSchema-Percentage"] = "Percentage",
         ["skinSchema-Relative"] = "Who ?",

         -- 3. Values

         ["skinSchema-TWMode-Disabled"] = "No warning",
         ["skinSchema-TWMode-Gain"] = "On gain",
         ["skinSchema-TWMode-Lose"] = "On loss",
         ["skinSchema-TWMode-Both"] = "Gain and loss",

         ["skinSchema-TWCondition-Anytime"] = "Anytime",
         ["skinSchema-TWCondition-Instance"] = "Instance",
         ["skinSchema-TWCondition-Party"] = "Party",

         ["skinSchema-Filter-All"] = "All",
         ["skinSchema-Filter-Party"] = "Party",
         ["skinSchema-Filter-PartyPlayer"] = "Party (players)",

         -- 4. Tooltips

         ["skinSchema-Length-Tooltip"] = "Sets the effective width (in pixels) used by the bars in threat, overview and regain lists. If you use a value that's too short, there won't be enough room for some texts.",
         ["skinSchema-Alpha-Tooltip"] = "This slider allows you to change the display alpha of threat lists.",
         ["skinSchema-Scale-Tooltip"] = "This slider allows you to change the display scale of threat lists.",
         ["skinSchema-LockFrames-Tooltip"] = "This options prevents you from moving frames by dragging them with the left mouse button.",

         ["skinSchema-ShortFigures-Tooltip"] = "When enabled, this option will shorten threat value figures. 10455 for instance will become 10.5k.",
         ["skinSchema-TWPositionY-Tooltip"] = "Sets vertical position of the textual warning.",
         ["skinSchema-TWHoldTime-Tooltip"] = "Specifies how long the textual warning will stay displayed.",
         ["skinSchema-TWCooldownTime-Tooltip"] = "The cooldown prevents spamming of the textual warning if the NPC cycles between you and another targets.",
         ["skinSchema-TWSoundEffect-Tooltip"] = "You can set here the sound that will be played when a textual warning apparears. You must put the file in DTM ''sfx'' folder and specify its extension.\n\nErase the content of the edit box to play no sound.",

         ["skinSchema-OnlyHostile-Tooltip"] = "If ticked, only threat lists from hostile NPCs will be displayed.",
         ["skinSchema-AlwaysDisplaySelf-Tooltip"] = "This option allows you to be *always* visible on whatever threat list you are involved in, even if you're too far away in the list.",
         ["skinSchema-DisplayAggroGain-Tooltip"] = "When enabled, this option adds one additionnal threshold row in threat lists. Going above this threshold row means you'll probably pull aggro from the concerned NPC.",
         ["skinSchema-RaiseAggroToTop-Tooltip"] = "Allows you to place on the top of the threat list the aggro target of the NPC. It's better to disable this option for NPCs that switch targets a lot.",
         ["skinSchema-RaiseAggroToTopOverview-Tooltip"] = "Shows in priority the enemies attacking you at the top of the overview list.",
         ["skinSchema-DisplayLevel-Tooltip"] = "Allows you to display the NPC's level on threat lists.",
         ["skinSchema-DisplayHealth-Tooltip"] = "Enable this option to display a little health bar below the NPC infos.",
         ["skinSchema-CursorTexture-Tooltip"] = "This field allows you to change the cursor image. The cursor is what shows your position in threat lists.",
         ["skinSchema-Rows-Tooltip"] = "This slider allows you to choose the max number of rows that can be displayed at once in a threat list. High values will undoubtedly lessen your PC's performances.",

         ["skinSchema-BackdropUseTile-Tooltip"] = "Tick this if the background uses a tile system (squares that repeat themselves as much as necessary to fill in the background).",
         ["skinSchema-TileTexture-Tooltip"] = "You can specify here the image file to use for the background of lists.",
         ["skinSchema-EdgeTexture-Tooltip"] = "You can specify here the image file to use for the edges of lists.",
         ["skinSchema-WidgetTexture-Tooltip"] = "You can provide a little image file here (32x32 dots) which will be displayed on the top border of lists.",
         ["skinSchema-WidgetPositionX-Tooltip"] = "You can adjust the X position of the widget with this slider.",
         ["skinSchema-WidgetPositionY-Tooltip"] = "You can adjust the Y offset of the widget with this slider.",

         ["skinSchema-BackgroundTexture-Tooltip"] = "You can specify here the image file to use as the base texture of bars.",
         ["skinSchema-FillTexture-Tooltip"] = "You can specify here the image file to use as the filling texture of bars.",
         ["skinSchema-ShowSpark-Tooltip"] = "When ticked, this option displays a spark on bars.",
         ["skinSchema-Smooth-Tooltip"] = "A purely aesthetic option. If you want a very responsive and clear display, you should disable this option.",
         ["skinSchema-FadeCoeff-Tooltip"] = "This slider allows to change the rate at which fades effects of threat lists perform. x0.5 for instance doubles the speed.",
         ["skinSchema-SortCoeff-Tooltip"] = "This slider allows yo change the rate at which animations of threat lists' rows occur. x0.5 for instance doubles the speed.",
         ["skinSchema-AggroGraphicEffect-Tooltip"] = "This option allows you to add a graphic effect on the bar that has the aggro of an enemy.",

         ["skinSchema-TWMode-Disabled-Tooltip"] = "No textual alert will be shown if you gain or lose aggro from an enemy.",
         ["skinSchema-TWMode-Gain-Tooltip"] = "An alert will be displayed if you gain aggro from an enemy.",
         ["skinSchema-TWMode-Lose-Tooltip"] = "An alert will be displayed if you lose aggro from an enemy.",
         ["skinSchema-TWMode-Both-Tooltip"] = "An alert will be displayed if you gain or lose aggro from an enemy.",

         ["skinSchema-TWCondition-Anytime-Tooltip"] = "The textual warnings will be displayed anytime.",
         ["skinSchema-TWCondition-Instance-Tooltip"] = "The textual warnings will only be displayed while you are inside of an instance.",
         ["skinSchema-TWCondition-Party-Tooltip"] = "The textual warnings will only be displayed while inside of a raid or party.",

         ["skinSchema-Filter-All-Tooltip"] = "Everything on threat lists will be displayed, including players or NPCs outside your group.",
         ["skinSchema-Filter-Party-Tooltip"] = "Only players or pets that are in your group will be displayed on threat lists.",
         ["skinSchema-Filter-PartyPlayer-Tooltip"] = "Only players (excluding pets) that are in your group will be displayed.",
    },

    ["frFR"] = {
         ["Unknown"] = "Inconnu",
         ["Invalid"] = "Invalide",
         ["Sec"] = "sec",
         ["AlteracValley"] = "Vallée d'Alterac",
         ["RankCapture"] = "Rang (%d+)",
         ["Foo"] = "Machin",
         ["Bar"] = "Truc",
         ["Enabled"] = "Actif",
         ["Position"] = "Position",
         ["Justification"] = "Justification",
         ["LeftShort"] = "G",
         ["CenterShort"] = "C",
         ["RightShort"] = "D",
         ["Erase"] = "Effacer",
         ["Auto"] = "Automatique",
         ["Top"] = "Haut",
         ["Center"] = "Centre",
         ["Bottom"] = "Bas",

         ["VersionQueryTimeOut"] = "Pas de réponse",
         ["VersionQueryDisconnected"] = "Déconnecté(e)",

         -- Console localisation

         ["Boot"] = "DiamondThreatMeter chargé et prêt. [v%s]\n/DTM pour afficher une liste des commandes.",
         ["SavedVariablesBadVersion"] = "Les paramètres de configuration ne sont plus compatibles avec cette version. Les paramètres vont être remis par défaut.",
         ["SkinsBadVersion"] = "Le système de skins n'est plus compatible. Les paramètres vont être remis par défaut.",
         ["SkinsVersionUpgrade"] = "Le système de skins a été amélioré vers une nouvelle version. Vos skins ont pu être adaptés vers cette nouvelle version.",
         ["ProfileRegistered"] = "Le profil de <%s> a été créé.",
         ["NPCAbilitiesUpdated"] = "|cffffff00%d|r PNJ ont été mis à jour dans la base de données de DTM.",
         ["NPCAbilitiesReset"] = "La base de données des PNJ a été réinitialisée. Les PNJ prédéfinis ont été restorés.",
         ["CheckSavedVariablesReset"] = "Êtes-vous sûr(e) de vouloir réinitialiser complétement la configuration de DTM?\n\nVotre interface sera rechargée.",
         ["CheckNPCDatabaseReset"] = "Êtes-vous sûr(e) de vouloir réinitialiser la base de données des PNJ?\n\nLa base de données par défaut sera remise en place.",
         ["CheckAllReset"] = "Êtes-vous sûr(e) de vouloir EFFACER TOUTE DONNEE sauvegardée par DTM, incluant la config et les skins? L'Addon se comportera comme si elle était lancée pour la première fois.\n\nTapez |cffff0000EFFACER|r pour confirmer.\n\nVotre interface sera rechargée.",
         ["VersionCheckReminder"] = "Nous vous recommandons d'effectuer une vérification de version et de regarder si une version plus récente de DTM est disponible.\n\nVoulez-vous que DTM le fasse pour vous maintenant?",

         ["FirstRunWelcome"] = "Ceci est la première fois que |cff00ff00DiamondThreatMeter |cff6060ffv%s|r est lancé sur ce client WoW.\n\nVous pouvez accéder aux commandes slash de l'AddOn avec |cff00ff00/DTM|r et modifier sa configuration dans |cffffff00les menus interface et raccourcis de WoW|r.",
         ["FunctionalityNotImplementedYet"] = "Désolé! Cette fonctionnalité, |cffffff00%s|r, n'est pas encore implementée! Veuillez attendre une future version.",
         ["OpenOptions"] = "Ouvrir options",
         ["RoleSelection"] = "Veuillez taper le rôle que vous remplissez actuellement:\n|cff00ff40Tank |Dégâts |Zoneur\nSoigneur |Solo avec familier|r\n\nAprès avoir fait votre choix, les options appropriées seront automatiquement réglées pour vous.",
         ["RoleTank"] = "Tank",
         ["RoleTankMatches"] = "tank|chucknorris|chuck norris",
         ["RoleDamageDealer"] = "Infligeur de dégâts",
         ["RoleDamageDealerMatches"] = "dégâts|degats|dps",
         ["RoleAoEer"] = "Dégâts de zone",
         ["RoleAoEerMatches"] = "zoneur|zone|aoe|pbaoe",
         ["RoleHealer"] = "Soigneur",
         ["RoleHealerMatches"] = "soigneur|soin|heal|healer",
         ["RolePet"] = "Solo avec familier",
         ["RolePetMatches"] = "familier|solo avec familier",
         ["RoleSelected"] = "Vous avez sélectionné |cff00ff00%s|r.\n\nSi vous changez de rôle entre-temps, pensez à changer la configuration de DTM pour l'adapter à votre nouveau rôle.\n\nLes listes de menace n'apparaissent par défaut que lorsque vous êtes groupé.",

         ["EmergencyStopDisabled"] = "|cff40ff40L'arrêt d'urgence a été désactivé.|r";
         ["EmergencyStopEnabled"] = "|cffff4040L'arrêt d'urgence a été activé.|r\nEntrez /DTM basculer pour réenclencher l'AddOn.";

         ["NotifyEngineDisabled"] = "Le moteur de DTM est pour le moment désactivé. Allez dans les options d'interface pour le réactiver.",
         ["NotifyGUIDisabled"] = "L'interface graphique de DTM est pour le moment désactivée. Allez dans les options d'interface pour la réactiver.",

         ["ConsoleBadSyntax"] = "Mauvaise syntaxe pour cette commande slash. Essayez :\n",
         ["ConsoleUnknown"] = "Vous avez entré une commande inconnue. Suggestions:\n",
         ["ConsoleBroken"] = "La commande n'a pas pu être exécutée, alors qu'elle aurait dû. Peut être que vous n'avez pas l'AddOn DTM complète.",

         ["TestNoTalent"] = "Aucun talent n'a été trouvé pour %s. Peut être que ce n'est pas un PJ.",
         ["TestCannotQueryTalents"] = "Impossible d'obtenir les talents actifs de %s. Vérifiez que ce personnage est bien un joueur, attendez un instant ou essayez de vous rapprocher.",
         ["TestQueryTalentsFired"] = "Obtention en cours des talents de %s...",
         ["TestQueryTalentsError"] = "La réquisition des talents de %s a échoué. Peut être qu'un AddOn ou l'écran d'inspection de Blizzard a interféré avec DTM.",
         ["TestTalentDB"] = "%d talents ont été trouvés dans la base de données de DTM pour %s :",
         ["TestTalentDBRow"] = "%d. %s",
         ["TestTalentRank"] = "|cff8080ff%s|r [%s] Rang |cffffff00%d/%d|r",
         ["TestNoPCAbility"] = "%s est un PJ. Les PJ ne peuvent pas avoir de capacités spéciales innées.",
         ["TestNoNPCAbility"] = "Aucune capacité de modification de la menace n'a été trouvée sur le PNJ %s.",
         ["TestNPCAbility"] = "%d capacités de modification de la menace ont été trouvées sur le PNJ %s:",
         ["TestNPCAbilityRow"] = "%d. |cffffff00%s|r",
         ["TestNoAssociationErrors"] = "Pas d'erreurs d'association ont été enregistrées. Peut-être que la fonctionnalité d'enregistrement est désactivée dans le fichier de script LUA.",
         ["TestAssociationErrors"] = "%d erreurs d'association ont été enregistrées :",
         ["TestAssociationErrorsRow"] = "%d. |cffffff00%s|r",
         ["TestGearThreatMultiplier"] = "Multiplicateur de menace des objets: |cff00ff00x%.3f|r",
         ["TestSets"] = "Voici les ensembles d'armures trouvés pour %s :",
         ["TestSetsRow"] = "|cffffff00%s|r %d/%d",
         ["TestListNumber"] = "DTM a des infos concernant %d entités :",
         ["TestListRow"] = "%d. %s (%s)",
         ["TestListThreatListNumber"] = "    La liste de menace de %s contient %d entités :",
         ["TestListThreatListRow"] = "    %d. %s (%s) [%d]",
         ["TestVersionSent"] = "Requête envoyée pour obtention des versions de DTM utilisées...",
         ["TestVersionErrorUnknown"] = "Une erreur s'est produite en voulant envoyer le test de version.",
         ["TestVersionErrorFlood"] = "Veuillez attendre un instant avant d'envoyer un test de version.",
         ["TestVersionErrorNotGrouped"] = "Vous n'êtes pas dans un groupe, le test de version est inutile.",
         ["TestVersionResults"] = "Résultats du test de version:",
         ["TestVersionResultsRow"] = "%d. %s %s |cffffff00[%s]|r",
         ["TestTalentsBufferNumber"] = "La mémoire tampon des talents a enregistré %d entités :",
         ["TestTalentsBufferRow"] = "%d. %s (%d talents enregistrés)",
         ["TestItemsBufferNumber"] = "La mémoire tampon des objets a enregistré %d entités :",
         ["TestItemsBufferRow"] = "%d. %s (%d objets équippés)",

         ["ResetEntityData"] = "Toutes les données concernant la menace ont été réinitialisées.",

         ["ErrorInCombat"] = "Une erreur classifiée comme %s s'est produite au sein de DTM. Le rapport d'erreur apparaîtra lorsque vous aurez quitté le mode combat.",
         ["ErrorPosition"] = "Erreur %d sur %d",
         ["ErrorHeader"] = "Erreur %d - Type: %s, module: |cff4040ff%s|r\n|cffffffffMessage d'erreur:|r",
         ["ErrorHeaderNoError"] = "Aucune erreur n'a été rencontrée pour le moment.",
         ["ErrorType:MINOR"] = "|cff00ff00Mineure|r",
         ["ErrorType:MAJOR"] = "|cffff8000Majeure|r",
         ["ErrorType:CRITICAL"] = "|cffff0000Critique|r",

         -- Threat, overview, regain lists localisation

         ["guiHeader"] = "DiamondThreatMeter v%s",

         ["Name"] = "Nom",
         ["Threat"] = "Menace",
         ["TPS"] = "MPS",
         ["Relative"] = "Qui ?",

         ["unitInfo"] = "%s Niveau %s %s",
         ["unitInfoLight"] = "%s %s",
         ["noThreatList"] = "|cffffa000Ce PNJ n'utilise pas de liste de menace.|r",

         ["aggroRegain"] = "|cffff4040Reprise|r",
         ["aggroRegainClose"] = "|cffff8020Reprise (CàC)|r",

         ["standbyTarget"] = "Pas de PNJ sélectionné.",
         ["standbyTargetWrongReaction"] = "Ce PNJ n'est pas hostile.",
         ["standbyTargetDead"] = "Votre cible est |cffff4040morte|r.",
         ["standbyTargetOpening"] = "Ouverture de la liste de menace...",
         ["standbyFocus"] = "Pas de PNJ défini en focus.",
         ["standbyFocusWrongReaction"] = "Ce PNJ n'est pas hostile.",
         ["standbyFocusDead"] = "Votre focus est |cffff4040mort|r.",
         ["standbyFocusOpening"] = "Ouverture de la liste de menace...",

         ["overviewNoUnit"] = "Unité inconnue.",
         ["overviewOpening"] = "Ouverture de la liste de présence...",
         ["overviewUnitInfo"] = "Vue d'ensemble (%s)",

         ["regainNoUnit"] = "Unité inconnue.",
         ["regainOpening"] = "Ouverture de la liste de reprise...",
         ["regainUnitInfo"] = "Reprise d'attention (%s)",

         ["test"] = "Test",
         ["testList"] = "Ceci est une liste de test.",

         ["tankToggle"] = "Est un tank",
         ["tankToggleTooltip"] = "Ce bouton permet de spécifier si cette unité est un tank ou non. Les tanks sont indiqués avec une icône spéciale au lieu de l'icône de classe.",

         ["anchorSetting"] = "Point d'attache",
         ["anchorSettingTooltip"] = "Vous pouvez préciser ici comment vous souhaitez que la liste soit attachée à l'interface. La liste s'étendra dans la direction opposée du point d'attache.",

         ["TWGainTemplate"] = "%s |cffff0000REPRISE|r - %s",
         ["TWLoseTemplate"] = "%s |cff0000ffPerte de cible|r - %s",

         -- Configuration frame localisation

         -- 0. Overall

         ["configEngineCategory"] = "Moteur",
         ["configGUICategory"] = "IUG",
         ["configSystemCategory"] = "Système",
         ["configWarningCategory"] = "Avertissements",
         ["configNameplateCategory"] = "Plaques",
         ["configVersionCategory"] = "Version",

         -- 1. Intro panel

         ["configIntroTitle"] = "Bienvenue dans la configuration de DTM !",
         ["configIntroSubTitle"] = "Depuis ce panneau vous pouvez accéder aux autres panneaux de configuration de DTM.",

         ["configIntroSystemPart"] = "Configuration du système",
         ["configIntroEnginePart"] = "Configuration du moteur",
         ["configIntroGUIPart"] = "Configuration de l'IUG",
         ["configIntroWarningPart"] = "Configuration des alertes",
         ["configIntroNameplatePart"] = "Configuration des plaques",
         ["configIntroVersionPart"] = "Vérification de version",

         ["configIntroRingButtonExplain"] = "Voici le bouton raccourci de DTM. Vous pouvez le déplacer n'importe où et par la suite cliquer dessus pour accéder au menu de DTM.",
         ["configIntroRingButtonMoving"] = "Vous êtes en train de déplacer le bouton raccourci. Relâchez le bouton de la souris une fois que vous avez trouvé l'emplacement approprié.",
         ["configIntroRingButtonReset"] = "Le bouton raccourci est maintenant réglé. Si vous avez commis une erreur, cliquez sur le bouton en-dessous pour recommencer le positionnement.",

         -- 2. Engine panel

         ["configEngineTitle"] = "Paramètres du moteur",
         ["configEngineSubTitle"] = "Vous pouvez régler ici comment vous souhaiteriez que le moteur de DTM se comporte.",

         ["configEngineEnable"] = "Activer moteur",
         ["configEngineEnableCaption"] = "|cffff2020Le moteur est pour l'instant coupé.|r\nLes données de menace ne sont pas disponibles.",
         ["configEngineDisable"] = "Couper moteur",
         ["configEngineDisableCaption"] = "|cff20ff20Le moteur est actif.|r\nLe couper empêchera le calcul des données concernant la menace.",
         ["configEnginePaused"] = "|cffffff20Temporairement arrêté.|r\nLe moteur se réactivera de lui-même automatiquement.", 
         ["configEngineEmergencyStop"] = "|cffff2020L'arrêt d'urgence est enclenché.|r\nDésactivez-le pour réactiver le moteur.",

         ["configAggroDelaySlider"] = "Délai de ciblage",
         ["configZoneWideCheckRateSlider"] = "Fréquence de vérif. de combat",
         ["configTPSUpdateRateSlider"] = "Fréquence de recalcul de la MPS",
         ["configDetectReset"] = "Nettoyage régulier de la base de données",

         ["configWorkMethod"] = "Méthode de travail",
         ["configWorkMethodAnalyze"] = "Analyse",
         ["configWorkMethodHybrid"] = "Hybride",
         ["configWorkMethodNative"] = "Native",

         ["configTooltipWorkMethodAnalyze"] = "Détermine la menace en se basant uniquement sur les informations du journal de combat. Dans cette configuration, la menace affichée sera inévitablement imprécise. Il s'agit de la méthode utilisée avant l'extension WotLK pour calculer la menace.",
         ["configTooltipWorkMethodHybrid"] = "Détermine la menace en se basant à la fois sur le journal de combat et le mètre de menace natif de Blizzard. Cette méthode est la plus gourmande en processeur mais elle offre davantage de données relativement précises. Des changements soudains dans les valeurs de menace affichées peuvent se produire car le mètre natif recalibre les résultats imprécis obtenus par analyse du journal de combat.",
         ["configTooltipWorkMethodNative"] = "Détermine la menace en utilisant uniquement le mètre de menace natif de Blizzard. Cette méthode ne donne pas de bonnes informations concernant les unités extérieures à votre groupe. En revanche, les chiffres donnés pour les membres du groupe ou raid sont exacts et cette méthode est la plus rapide.",

         ["configTooltipAggroDelayExplain"] = "Cette option permet de demander à DTM d'attendre un certain délai avant de considérer que la \"vraie\" cible d'un PNJ a changé quand celui-ci change de cible. En effet, les PNJ peuvent utiliser des attaques secondaires ne concernant pas forcément leur \"vraie\" cible.",
         ["configTooltipZoneWideCheckRateExplain"] = "Cette vérification permet de déterminer quand les membres du raid proches ont engagé le combat avec des ennemis. Un délai bas entre chaque vérification diminue les performances mais permet de s'assurer que les membres du raid soient ajoutés immédiatement dans les listes de menace des ennemis.",
         ["configTooltipTPSUpdateRateExplain"] = "Cette glissière vous permet de choisir l'intervalle de temps qui se passe entre chaque mise à jour de la MPS. Des intervalles plus courts peuvent entraîner des ralentissements dans les combats importants.",
         ["configTooltipDetectResetExplain"] = "Quand activée, cette option autorise DTM à effacer le contenu des listes de menaces des créatures hors-combat, n'ayant pas de cible et n'étant pas marquées. Elle permet également à DTM d'effacer les données concernant des créatures pour lesquelles nous n'avons eu aucune information durant 600 secondes.",

         -- 3. GUI panel

         ["configGUITitle"] = "Options de l'Interface Utilisateur Graphique",
         ["configGUISubTitle"] = "Vous pouvez régler ici comment DTM vous présentera les listes de menace.",

         ["configGUIEnable"] = "Activer l'IUG",
         ["configGUIEnableCaption"] = "|cffff2020L'IUG est pour l'instant coupée.|r\nL'affichage des listes de menace est arrêté.",
         ["configGUIDisable"] = "Couper l'IUG",
         ["configGUIDisableCaption"] = "|cff20ff20L'IUG est pour l'instant active.|r\nLa désactiver coupera l'affichage des listes de menace.",
         ["configGUIPaused"] = "|cffffff20Temporairement arrêtée.|r\nL'IUG se réactivera d'elle-même automatiquement.", 
         ["configGUIEmergencyStop"] = "|cffff2020L'arrêt d'urgence est enclenché.|r\nDésactivez-le pour réactiver l'IUG.",

         ["configGUIAutoDisplay"] = "Condition d'affichage auto",
         ["configGUIAutoDisplayTarget"] = "Liste de menace de la cible",
         ["configGUIAutoDisplayFocus"] = "Liste de menace du focus",
         ["configGUIAutoDisplayOverview"] = "Vue d'ensemble",
         ["configGUIAutoDisplayRegain"] = "Reprise d'attention",
         ["configGUIAutoDisplayAlways"] = "Toujours",
         ["configGUIAutoDisplayOnChange"] = "Sur changement",
         ["configGUIAutoDisplayOnJoin"] = "Sur groupage",
         ["configGUIAutoDisplayOnCombat"] = "Sur combat",
         ["configGUIAutoDisplayNever"] = "Jamais",

         ["configTooltipAutoDisplayAlways"] = "Permet à cette liste de menace d'être toujours affichée par défaut.",
         ["configTooltipAutoDisplayNever"] = "Empêche cette liste de menace d'être affichée par défaut.",
         ["configTooltipAutoDisplayOnChange"] = "Affiche cette liste de menace lorsque vous définissez un focus.",
         ["configTooltipAutoDisplayOnJoin"] = "Affiche cette liste de menace quand vous rejoignez un groupe.",
         ["configTooltipAutoDisplayOnCombat"] = "Affiche cette liste de menace quand vous passez en combat.",

         -- 4. System panel

         ["configSystemTitle"] = "Paramètres du système",
         ["configSystemSubTitle"] = "Vous pouvez modifier ici des options générales qui affectent à la fois le moteur et l'IUG.",

         ["configSystemEnable"] = "Reprendre",
         ["configSystemEnableCaption"] = "|cffff2020L'arrêt d'urgence est pour l'instant activé.|r\nLe moteur et l'IUG sont arrêtés.",
         ["configSystemDisable"] = "STOP",
         ["configSystemDisableCaption"] = "|cff20ff20L'arrêt d'urgence est pour l'instant désactivé.|r",

         ["configSystemAlwaysEnabled"] = "Toujours autoriser le fonctionnement",
         ["configSystemQuickConfig"] = "Configuration rapide",
         ["configSystemBindings"] = "Raccourcis spéciaux de DTM",
         ["configSystemErrorLog"] = "Journal des erreurs",

         ["configSystemManagementHeader"] = "Gestion de la sauvegarde des données",

         ["configSystemModifiedProfile"] = "Profil concerné par les modifications d'options:",
         ["configSystemResetSavedVars"] = "Réinitialiser la config de DTM",
         ["configSystemResetNPCData"] = "Réinitialiser les données des PNJ",
         ["configSystemResetAll"] = "Réinitialiser tout",

         ["configTooltipAlwaysEnabledExplain"] = "Quand coché, DTM continuera de fonctionner même lorsque vous êtes en champ de bataille ou arène, sur un taxi, dans une auberge, une capitale ou un sanctuaire.",
         ["configTooltipQuickConfigExplain"] = "Ce bouton vous permet de configurer rapidement DTM d'après le rôle que vous remplissez actuellement.",
         ["configTooltipModifiedProfileExplain"] = "Si vous selectionnez ceci, les changements faits aux options de DTM n'affectant qu'un personnage s'appliqueront pour le profil de |cff20ff20%s (%s)|r.\n\n|cffff0000ATTENTION|r - Si vous cliquez, les panneaux d'options vont être raffraichis et les changements non sauvegardés seront perdus.",
         ["configTooltipResetSavedVarsExplain"] = "Cliquer sur ce bouton réinitialisera toutes les données de configuration. L'interface sera immédiatement rechargée.",
         ["configTooltipResetNPCDataExplain"] = "Cliquer sur ce bouton réinitialisera toutes les données concernant les particularités et capacités spéciales des PNJ. Les données par défaut seront remises en place.",
         ["configTooltipResetAllExplain"] = "Cliquer sur ce bouton supprimera toute donnée sauvegardée par DTM, incluant la config et les skins. Ce bouton est la dernière solution si vous avez des problèmes pour faire marcher DTM. L'interface sera immédiatement rechargée.",

         -- 5. Version panel

         ["configVersionTitle"] = "A propos de la version",
         ["configVersionSubTitle"] = "Vous pouvez vérifier ici votre numéro de version et demander aux autres membres du groupe d'envoyer le leur.",

         ["configVersionYours"] = "Vous utilisez la version |cffffffff%s|r de DiamondThreatMeter.",

         ["configVersionQuery"] = "Demander",
         ["configVersionQueryBusy"] = "|cffffff00Le système est pour l'instant occupé.|r",
         ["configVersionQueryFlood"] = "|cffffff00Veuillez patienter un moment.|r",
         ["configVersionQueryNotGrouped"] = "|cffff8000Vous ne pouvez demander le numéro de version que lorsque vous vous trouvez dans un groupe.|r",
         ["configVersionQueryOK"] = "|cff00ff00Prêt à demander le numéro de version.|r",
         ["configVersionQueryResults"] = "Résultats de la requête:",

         ["configVersionDTMFormat"] = "|cff00ff00DTM|r |cffffffffv%s|r",
         ["configVersionOtherFormat"] = "|cffffa000%s|r |cffffffff%s|r",
         ["configVersionNoneFormat"] = "|cffffffff%s|r",

         -- 6. Warning panel

         ["configWarningTitle"] = "Configuration avancée des avertissements",
         ["configWarningSubTitle"] = "Vous pouvez configurer ici quand, où et comment DTM vous avertira en cas de risque de reprise d'attention d'un ennemi redoutable.",

         ["configWarningExplain110"] = "- Quand on atteint |cffffff20110%|r de la menace de la cible d'un PNJ, on reprend l'attention de ce PNJ si on se trouve à portée de mêlée.",
         ["configWarningExplain130"] = "- Quand on atteint |cffff2020130%|r de la menace de la cible d'un PNJ, on reprend l'attention de ce PNJ.",
         ["configWarningLimit"] = "Marge avant d'être averti",
         ["configWarningCancelLimit"] = "Marge pour désactiver",
         ["configWarningPosition"] = "Positionnement",
         ["configWarningHorizontal"] = "Horizontal",
         ["configWarningLeft"] = "Gauche",
         ["configWarningRight"] = "Droite",
         ["configWarningVertical"] = "Vertical",
         ["configWarningUp"] = "Haut",
         ["configWarningDown"] = "Bas",
         ["configWarningEnablePreview"] = "Prévisualisation",
         ["configWarningDisablePreview"] = "Stopper",

         ["configWarningToggle"] = "Utiliser avertissements",

         ["configWarningThreshold"] = "Conditions d'avertissement",
         ["configWarningBossTag"] = "PNJ Boss",
         ["configWarningEliteTag"] = "PNJ Elite",
         ["configWarningNormalTag"] = "PNJ Normal",
         ["configWarningLevelTag"] = "niv.",
         ["configWarningAndMoreTag"] = "et plus",
         ["configWarningClassification"] = "Affiche les avertissements contre tout |cffff2020%s|r.",
         ["configWarningClassificationAndLevel"] = "Affiche les avertissements contre tout |cffff2020%s|r qui a une différence de niveau avec vous de |cffff2020%s%s|r et plus.",

         ["configWarningSound"] = "Son d'avertissement",
         ["sound:NONE"] = "Aucun",
         ["sound:WEIRD"] = "Etrange",
         ["sound:BUZZER"] = "Buzzer",
         ["sound:PEASANT"] = "Paysan (War3)",
         ["sound:ALARM"] = "Alarme",

         ["configTooltipWarningExplain"] = "Si activés, vous serez averti lorsque vous serez sur le point d'attirer l'attention d'un monstre redoutable (tout PNJ remplissant les conditions d'avertissement). Les tanks préféreront sans doute désactiver cette option.\n\nNotez que des règles spéciales sont définies dans DTM pour certains PNJ qui forcent la barre d'avertissement à rester cachée ou à apparaître quelle que soit la configuration choisie.",
         ["configTooltipWarningLimitExplain"] = "Cette glissière vous permet de changer la marge que vous vous autorisez avant d'être averti. Par exemple, si vous choisissez 20% et que vous êtes à portée de mêlée, cela signifie que l'avertissement sera enclenché à partir de 110 - 20 = 90%.",
         ["configTooltipWarningCancelLimitExplain"] = "Cette glissière vous permet de changer la marge que vous devez créer pour qu'une barre en mode d'avertissement cesse de l'être. Par exemple, si vous choisissez 30% et que vous êtes à portée de mêlée, cela signifie que l'avertissement cessera lorsque vous descendrez en dessous de 110 - 30 = 80%.",
         ["configTooltipPreviewExplain"] = "Ce bouton vous permet d'activer une barre spéciale vous indiquant où les barres en mode d'avertissement se placeront sur votre écran. Cela vous permet de les positionner avec précision en utilisant les glissières au-dessus. Il vous permet également d'entendre le son d'avertissement que vous avez choisi.",

         -- 7. Nameplates panel

         ["configNameplateTitle"] = "Configuration des plaques de nom",
         ["configNameplateSubTitle"] = "Vous pouvez choisir ici si vous voulez que DTM affiche également votre menace au dessus des plaques de nom des ennemis.",

         ["configNameplateExplain"] = "ATTENTION - Cette fonctionnalité est pour l'instant présente à titre expérimental et ne peut faire la distinction entre des ennemis portant le même nom. Si une ambiguïté se présente, DTM ne prendra pas le risque d'afficher des informations erronées, et donc n'affichera rien.",
         ["configNameplateToggle"] = "Activer l'affichage de la menace",
         ["configTooltipNameplateExplain"] = "Cochez pour que votre menace envers les ennemis proches soit affichée au dessus de leur nom.\n\n|cffff0000Notez que lorsque plusieurs ennemis portant le même nom sont engagés, DTM ne pourra PAS afficher la menace au dessus de leur nom.|r",

         -- 8. Skin manager frame

         ["configSkinManagerHeader"] = "Gestionnaire de skins",

         ["configSkinManagerTagBase"] = " |cff00ff00(skin de base)|r",
         ["configSkinManagerTagUser"] = " |cff2020ff(skin de l'utilisateur)|r",

         ["configSkinManagerExplain"] = "Les skins sont des ensembles de paramètres définissant l'apparence de DTM. Pour créer votre propre skin, vous devez copier une skin existante et la modifier.",
         ["configSkinManagerExplainLocked"] = "Le gestionnaire est pour l'instant verrouillé et vous devez fermer l'éditeur de skin avant de pouvoir le réutiliser.",
         ["configSkinManagerExplainBaseSkin"] = "Ceci est une skin de base. Ces skins peuvent être modifiées mais pas supprimées ou renommées. En outre, elles peuvent être restorées dans leur état original.",
         ["configSkinManagerExplainUserSkin"] = "Ceci est une skin définie par l'utilisateur. Ces skins peuvent être renommées, supprimées, modifiées mais pas restorées.",
         ["configSkinManagerExplainSelectionAppend"] = "\n\nCliquez pour sélectionner cette skin pour le profil actif.",

         ["configSkinManagerSelection"] = "Skin sélectionnée:",
         ["configSkinManagerRename"] = "Renommer",
         ["configSkinManagerRestore"] = "Restorer",
         ["configSkinManagerCopy"] = "Copier",
         ["configSkinManagerDelete"] = "Supprimer",
         ["configSkinManagerToEditor"] = "Envoyer à l'éditeur de skin",

         ["configSkinManagerCopyForm"] = "Vous allez faire une copie du skin |cff00ff00%s|r.\nQuel nom voulez-vous lui donner?",
         ["configSkinManagerRenameForm"] = "Vous allez renommer le skin |cff00ff00%s|r.\nQuel nouveau nom voulez-vous lui donner?",
         ["configSkinManagerRestoreForm"] = "Vous allez restorer le skin de base |cff00ff00%s|r.\nConfirmez-vous cette action?",
         ["configSkinManagerDeleteForm"] = "Vous allez supprimer le skin |cff00ff00%s|r.\nConfirmez-vous cette action?",

         -- 9. Skin editor frame

         ["configSkinEditorPreview"] = "Prévisualisation",
         ["configSkinEditorFinish"] = "Terminer",
         ["configSkinEditorCategory"] = "Catégorie %d /%d",

         -- Skin schema translation

         -- 1. Categories

         ["skinSchema-General"] = "Général",
         ["skinSchema-Animation"] = "Animation",
         ["skinSchema-ThreatList"] = "Liste de menace",
         ["skinSchema-OverviewList"] = "Vue d'ensemble",
         ["skinSchema-RegainList"] = "Liste de reprise",
         ["skinSchema-Display"] = "Affichage",
         ["skinSchema-Bars"] = "Barres",
         ["skinSchema-Columns"] = "Colonnes",
         ["skinSchema-RegainColumns"] = "Colonnes (reprise)",
         ["skinSchema-Text"] = "Texte",

         -- 2. Labels

         ["skinSchema-Length"] = "Longueur",
         ["skinSchema-Alpha"] = "Transparence",
         ["skinSchema-Scale"] = "Echelle",
         ["skinSchema-LockFrames"] = "Verrouiller la position des listes",

         ["skinSchema-ShortFigures"] = "Raccourcir les nombres",
         ["skinSchema-TWMode"] = "Mode d'avertissement textuel",
         ["skinSchema-TWCondition"] = "Condition de l'avertissement",
         ["skinSchema-TWPositionY"] = "Position verticale de l'avertissement",
         ["skinSchema-TWHoldTime"] = "Durée d'affichage de l'avertissement",
         ["skinSchema-TWCooldownTime"] = "Temps de rechargement de l'avertissement",
         ["skinSchema-TWSoundEffect"] = "Effet sonore de l'avertissement",

         ["skinSchema-OnlyHostile"] = "Afficher seulement les PNJ hostiles",
         ["skinSchema-AlwaysDisplaySelf"] = "Etre toujours visible soi-même",
         ["skinSchema-DisplayAggroGain"] = "Placer l'indicateur de reprise",
         ["skinSchema-RaiseAggroToTop"] = "Monter en haut de liste la cible du PNJ",
         ["skinSchema-RaiseAggroToTopOverview"] = "Monter les PNJ qui vous attaquent",
         ["skinSchema-DisplayLevel"] = "Afficher le niveau",
         ["skinSchema-DisplayHealth"] = "Afficher la vie",
         ["skinSchema-Filter"] = "Filtre",
         ["skinSchema-CursorTexture"] = "Texture du curseur",
         ["skinSchema-Rows"] = "Nombre max de lignes",

         ["skinSchema-BackdropUseTile"] = "Le fond utilise le mode mosaïque",
         ["skinSchema-TileTexture"] = "Texture du fond",
         ["skinSchema-EdgeTexture"] = "Texture des bords",
         ["skinSchema-WidgetTexture"] = "Texture du gadget",
         ["skinSchema-WidgetPositionX"] = "Position du gadget X",
         ["skinSchema-WidgetPositionY"] = "Décalage du gadget Y",

         ["skinSchema-BackgroundTexture"] = "Texture de base",
         ["skinSchema-FillTexture"] = "Texture de remplissage",
         ["skinSchema-ShowSpark"] = "Montrer le séparateur",
         ["skinSchema-Smooth"] = "Lisser les variations des barres",
         ["skinSchema-FadeCoeff"] = "Coeff de durée d'animation de fondu",
         ["skinSchema-SortCoeff"] = "Coeff de durée d'animation de tri",
         ["skinSchema-AggroGraphicEffect"] = "Effet graphique quand on a l'attention d'un PNJ",

         ["skinSchema-Class"] = "Classe",
         ["skinSchema-Name"] = "Nom",
         ["skinSchema-Threat"] = "Menace",
         ["skinSchema-TPS"] = "Menace Par Seconde",
         ["skinSchema-Percentage"] = "Pourcentage",
         ["skinSchema-Relative"] = "Qui ?",

         -- 3. Values

         ["skinSchema-TWMode-Disabled"] = "Pas d'alerte",
         ["skinSchema-TWMode-Gain"] = "Sur reprise",
         ["skinSchema-TWMode-Lose"] = "Sur perte",
         ["skinSchema-TWMode-Both"] = "Les deux",

         ["skinSchema-TWCondition-Anytime"] = "N'importe quand",
         ["skinSchema-TWCondition-Instance"] = "En instance",
         ["skinSchema-TWCondition-Party"] = "Dans un groupe",

         ["skinSchema-Filter-All"] = "Tous",
         ["skinSchema-Filter-Party"] = "Groupe",
         ["skinSchema-Filter-PartyPlayer"] = "Groupe (joueurs)",

         -- 4. Tooltips

         ["skinSchema-Length-Tooltip"] = "Permet de régler la longueur effective utilisée par les barres dans les listes (en pixels). Si vous utilisez une valeur trop faible, il n'y aura pas assez de place pour certains textes.",
         ["skinSchema-Alpha-Tooltip"] = "Cette glissière permet de changer la transparence des listes de menace.",
         ["skinSchema-Scale-Tooltip"] = "Cette glissière permet de changer l'échelle d'affichage des listes de menace.",
         ["skinSchema-LockFrames-Tooltip"] = "Cette option vous empêche de déplacer les listes en maintenant le bouton gauche de la souris enfoncé et en la bougeant.",

         ["skinSchema-ShortFigures-Tooltip"] = "Quand activée, cette option permet de raccourcir les nombres affichés dans la colonne ''Menace''. 10455 par exemple deviendra 10.5k.",
         ["skinSchema-TWPositionY-Tooltip"] = "Régle la position verticale de l'avertissement textuel.",
         ["skinSchema-TWHoldTime-Tooltip"] = "Régle la durée d'affichage de l'avertissement textuel.",
         ["skinSchema-TWCooldownTime-Tooltip"] = "Le temps de recharge évite que l'avertissement textuel vous spamme si le PNJ change fréquemment de cibles.",
         ["skinSchema-TWSoundEffect-Tooltip"] = "Vous pouvez régler ici le son qui sera joué quand un avertissement textuel apparaît. Vous devez placer le fichier sonore dans le dossier ''sfx'' de DTM et préciser son extension.\n\nEffacez le contenu de cette boîte pour ne jouer aucun son.",

         ["skinSchema-OnlyHostile-Tooltip"] = "Si cochée, cette option ne montrera que le contenu des listes de menace des PNJ hostiles.",
         ["skinSchema-AlwaysDisplaySelf-Tooltip"] = "Cette option vous permet de *toujours* vous voir sur les listes de menace dans lesquelles vous êtes impliqué, même si vous êtes trop bas dans la liste.",
         ["skinSchema-DisplayAggroGain-Tooltip"] = "Quand activée, cette option place un seuil spécial dans les listes de menaces. Dépasser ce seuil implique un très gros risque de reprise d'attention du PNJ concerné.",
         ["skinSchema-RaiseAggroToTop-Tooltip"] = "Vous permet de placer au sommet de la liste de menace la personne qui a l'attention du PNJ. Mieux vaut désactiver cette option pour les PNJ qui changent souvent de cible.",
         ["skinSchema-RaiseAggroToTopOverview-Tooltip"] = "Indique en priorité les ennemis vous attaquant en haut de la vue d'ensemble.",
         ["skinSchema-DisplayLevel-Tooltip"] = "Vous permet d'afficher le niveau du PNJ sur les listes de menace. Néanmoins notez que le texte sera tronqué pour les PNJ ayant un nom trop long.",
         ["skinSchema-DisplayHealth-Tooltip"] = "Activez cette option pour afficher une petite barre de vie sous les infos du PNJ.",
         ["skinSchema-CursorTexture-Tooltip"] = "Vous permet de changer l'apparence du curseur indiquant votre position dans les listes de menace.",
         ["skinSchema-Rows-Tooltip"] = "Cette glissière permet de déterminer le nombre de lignes affichables simultanément dans une liste de menace. Un nombre trop élevé réduirait sans aucun doute les performances de votre PC.",

         ["skinSchema-BackdropUseTile-Tooltip"] = "Cochez cette option si le fond est constitué de carrés qui se répétent autant que nécessaire pour le remplir.",
         ["skinSchema-TileTexture-Tooltip"] = "Vous pouvez spécifier ici le fichier image à utiliser pour le fond des listes.",
         ["skinSchema-EdgeTexture-Tooltip"] = "Vous pouvez spécifier ici le fichier image à utiliser pour les bords des listes.",
         ["skinSchema-WidgetTexture-Tooltip"] = "Vous pouvez spécifier ici un petit fichier image (32x32 pixels) qui sera affiché sur la bordure supérieure des listes.",
         ["skinSchema-WidgetPositionX-Tooltip"] = "Vous pouvez ajuster la position horizontale du gadget avec cette glissière.",
         ["skinSchema-WidgetPositionY-Tooltip"] = "Vous pouvez ajuster le décalage vertical du gadget avec cette glissière.",

         ["skinSchema-BackgroundTexture-Tooltip"] = "Vous pouvez indiquer ici le fichier image à utiliser pour les contours des barres.",
         ["skinSchema-FillTexture-Tooltip"] = "Vous pouvez indiquer ici le fichier image à utiliser pour le contenu des barres.",
         ["skinSchema-ShowSpark-Tooltip"] = "Quand cochée, cette option affiche un séparateur lumineux sur les barres.",
         ["skinSchema-Smooth-Tooltip"] = "Une option d'ordre purement esthétique. Si vous souhaitez un affichage très net et immédiat, mieux vaut désactiver cette option.",
         ["skinSchema-FadeCoeff-Tooltip"] = "Cette glissière permet de faire varier la vitesse de fondu des listes de menace et de leur contenu. x0.5 double par exemple la vitesse.",
         ["skinSchema-SortCoeff-Tooltip"] = "Cette glissière permet de faire varier la vitesse d'animation du contenu des listes de menace. x0.5 double par exemple la vitesse.",
         ["skinSchema-AggroGraphicEffect-Tooltip"] = "Vous permet d'ajouter un effet graphique sur les barres des personnes ayant l'attention d'un PNJ.",

         ["skinSchema-TWMode-Disabled-Tooltip"] = "Aucune alerte textuelle sera affichée si vous reprenez ou perdez l'attention d'un PNJ.",
         ["skinSchema-TWMode-Gain-Tooltip"] = "Une alerte sera affichée si vous reprenez l'attention d'un PNJ.",
         ["skinSchema-TWMode-Lose-Tooltip"] = "Une alerte sera affichée si vous perdez l'attention d'un PNJ.",
         ["skinSchema-TWMode-Both-Tooltip"] = "Une alerte sera affichée si vous reprenez ou si vous perdez l'attention d'un PNJ.",

         ["skinSchema-TWCondition-Anytime-Tooltip"] = "Les avertissements textuels seront affichés n'importe quand.",
         ["skinSchema-TWCondition-Instance-Tooltip"] = "Les avertissements textuels seront affichés tant que vous êtes à l'intérieur d'une instance.",
         ["skinSchema-TWCondition-Party-Tooltip"] = "Les avertissements textuels seront affichés tant que vous êtes dans un groupe ou dans un raid.",

         ["skinSchema-Filter-All-Tooltip"] = "Tout ce qui se trouve dans les listes de menace sera affiché, joueurs et PNJ en dehors de votre groupe inclus.",
         ["skinSchema-Filter-Party-Tooltip"] = "Seuls les joueurs ou familiers au sein de votre groupe seront affichés sur les listes de menace.",
         ["skinSchema-Filter-PartyPlayer-Tooltip"] = "Seuls les joueurs (familiers exclus) au sein de votre groupe seront affichés sur les listes de menace.",
    },
    
    ["ruRU"] = {
         ["Unknown"] = "Неизвестный",
         ["Invalid"] = "Неверная",
         ["Sec"] = "секунд",
         ["AlteracValley"] = "Alterac Valley",
         ["RankCapture"] = "Rank (% D +)",
         ["Foo"] = "Foo",
         ["Bar"] = "Бар",
         ["Enabled"] = "Включено",
         ["Position"] = "Позиция",
         ["Justification"] = "обоснование",
         ["LeftShort"] = "L",
         ["CenterShort"] = "C",
         ["RightShort"] = "R",
         ["Erase"] = "Удалить",
         ["Auto"] = "Авто",
         ["Top"] = "Top",
         ["Center"] = "Центр",
         ["Bottom"] = "дна",

         ["VersionQueryTimeOut"] = "Нет ответа",
         ["VersionQueryDisconnected"] = "Disconnected",

         -- Console localisation

         ["Boot"] = "DiamondThreatMeter загружены и готовы. [V% S] \п /DTM, чтобы показать список команд.",
				 ["SavedVariablesBadVersion"] = "Параметры конфигурации больше не совместимы с этой версией. Параметры по умолчанию будет использоваться.",
         ["SkinsBadVersion"] = "Skins система больше не совместимы. Параметрами по умолчанию будет использоваться.",
         ["SkinsVersionUpgrade"] = "Skins системы был обновлен до новой версии. Ваши предыдущие скины можно было бы успешно адаптировались." ,
         ["ProfileRegistered"] = "Профиль <% S> был создан." ,
         ["NPCAbilitiesUpdated"] = "|cffffff00% D |. Г НПС были обновлены в базе данных DTM НЭК", 
         ["NPCAbilitiesReset"] = "NPC базы данных были сброшены. Предопределенные НПС были восстановлены." ,
         ["CheckSavedVariablesReset"] = "Вы уверены, что хотите полностью сбросить DTM конфигурации? \П \nВаше интерфейс будет обновлен." ,
         ["CheckNPCDatabaseReset"] = "Вы уверены, что хотите полностью сбросить DTM NPC базы данных? \П \nDefault NPC база данных будет восстановлена." ,
         ["CheckAllReset"] = "Вы уверены, что хотите стереть любые данные, сохраненные на DTM, в том числе конфигурации и шкуры Аддон будет вести себя как если бы она была запущена в первый раз \п \nType в |?. Cffff0000ERASE |г, чтобы подтвердить . \п \nВаше интерфейс будет обновлен. " ,
         ["VersionCheckReminder"] = "Мы recommand запускать проверку версии и посмотреть, если есть более новая версия доступна DTM. \П \nХотите DTM, чтобы сделать это для вас сейчас?", 

         ["FirstRunWelcome"] = "Это впервые |cff00ff00DiamondThreatMeter |cff6060ffv% с |г работать на этого клиента WoW \п \nВы можете получить доступ к черту AddOn команды с |. Cff00ff00/DTM |г и изменять его настройки |Интерфейс cffffff00WoW и привязки меню |. г ", 
         ["FunctionalityNotImplementedYet"] = "Извините Эта функция, |! Cffffff00% с |г, пока не реализована Пожалуйста, подождите будущей версии!." ,
         ["OpenOptions"] = "Открыть варианты", 
         ["RoleSelection"] = "Пожалуйста, введите роль вы выполняете в настоящее время: \п |cff00ff40Tank |Ущерб |AoE \nHealer |Индивидуальный с домашним животным |г \п \nDTM будет настроен автоматически, чтобы удовлетворить эту роль." ,
         ["RoleTank"] = "Танк", 
         ["RoleTankMatches"] = "танк |chucknorris |Чак Норрис", 
         ["RoleDamageDealer"] = "дилера ущерб", 
         ["RoleDamageDealerMatches"] = "ущерб |дд |ДПС", 
         ["RoleAoEer"] = "AoEer", 
         ["RoleAoEerMatches"] = "AoE |pbaoe |зона |Zoner", 
         ["RoleHealer"] = "Целитель", 
         ["RoleHealerMatches"] = "целитель |исцелить", 
         ["RolePet"] = "Solo с домашним животным", 
         ["RolePetMatches"] = "домашним животным |Индивидуальный с домашним животным", 
         ["RoleSelected"] = "Вы выбрали |cff00ff00% S |. Р. \п \nЕсли вы изменить свою роль в то же время, не забудьте изменить DTM конфигурацию в соответствии с вашей новой роли лучше \п \nBy умолчанию, угрозы списки только apparear когда вы сгруппированы. " ,

         ["EmergencyStopDisabled"] = "|cff40ff40Emergency остановка была отключена |R."; 
         ["EmergencyStopEnabled"] = "|cffff4040Emergency остановка была активирована |г \nВведите /DTM переключения перевооружить аддон.."; 

         ["NotifyEngineDisabled"] = "DTM двигатель в настоящее время отключена. Перейти к опциям интерфейса повторно включить его." ,
         ["NotifyGUIDisabled"] = "DTM GUI в настоящее время отключена. Перейти к опциям интерфейса повторно включить его." ,

         ["ConsoleBadSyntax"] = "Неверный синтаксис для этой чертой команды Попробуйте:. \П", 
         ["ConsoleUnknown"] = "Вы указали неизвестная команда Предложения:. \П", 
         ["ConsoleBroken"] = "команда не может запустить, хотя он должен иметь. Может быть, у вас нет полной DTM AddOn работает." ,

         ["TestNoTalent"] = "Нет таланта не найдено для% s. Возможно, это не компьютер." ,
         ["TestCannotQueryTalents"] = "Невозможно получить активную талантов% s. Попробуйте все ближе и это не дружественный ПК." ,
         ["TestQueryTalentsFired"] = "Получение% S талантов ...", 
         ["TestQueryTalentsError"] = "Таланты просьбе% S не удалось. Может быть, некоторые AddOn или компании Blizzard проверить рамки мешали системы DTM." ,
         ["TestTalentDB"] = "% D таланты были найдены в базе данных DTM талантов% S:", 
         ["TestTalentDBRow"] = "% d.% S", 
         ["TestTalentRank"] = "|S cff8080ff% |г [% S] ранг |cffffff00% D /% D |г", 
         ["TestNoPCAbility"] = "% S является ПК. ПК не может быть врожденной специальных способностей." ,
         ["TestNoNPCAbility"] = "Нет угрозы изменения способности были обнаружены% с NPC." ,
         ["TestNPCAbility"] = "% D угрозы изменения способности были обнаружены% с NPC:", 
         ["TestNPCAbilityRow"] = "% d. |cffffff00% с |г", 
         ["TestNoAssociationErrors"] = "Нет ассоциации ошибке был записан. Может быть, записи функция отключена в файле сценария LUA." ,
         ["TestAssociationErrors"] = "% D ассоциации ошибки были записаны:", 
         ["TestAssociationErrorsRow"] = "% d. |cffffff00% с |г", 
         ["TestGearThreatMultiplier"] = "Угроза мультипликатор из пунктов: |cff00ff00x% .3 F |R", 
         ["TestSets"] = "Следующие брони для% s:", 
         ["TestSetsRow"] = "|cffffff00% с |г% г /г%", 
         ["TestListNumber"] = "DTM осознает% D лиц:", 
         ["TestListRow"] = "% d.% S (S%)", 
         ["TestListThreatListNumber"] = "список угрозы% S содержит% D лиц:", 
         ["TestListThreatListRow"] = "% d.% S (S%) [% D]", 
         ["TestVersionSent"] = "Запрос отправлен, чтобы получить DTM версии используется группы ...", 
         ["TestVersionErrorUnknown"] = "Произошла ошибка при отправке тестовой версии." ,
         ["TestVersionErrorFlood"] = "Пожалуйста, подождите немного, прежде чем отправка тестовой версии." ,
         ["TestVersionErrorNotGrouped"] = "Вы не в группе, тестовая версия не имеет смысла." ,
         ["TestVersionResults"] = "Результаты тестовой версии:", 
         ["TestVersionResultsRow"] = "% d.% S S% |cffffff00 [% S] |г", 
         ["TestTalentsBufferNumber"] = "таланты буфера осознает% D лиц:", 
         ["TestTalentsBufferRow"] = "% d.% S (% D таланты зарегистрированных)", 
         ["TestItemsBufferNumber"] = "элементов буфера осознает% D лиц:", 
         ["TestItemsBufferRow"] = "% d.% S (% D пункты оборудованы)", 

         ["ResetEntityData"] = "Все угрозы данные были сброшены." ,

         ["ErrorInCombat"] = "Ошибка помечен как% S произошло в DTM. Журнала ошибок будет отображаться как только вы покидаете боевом режиме." ,
         ["ErrorPosition"] = "Ошибка% D% из D", 
         ["ErrorHeader"] = "Ошибка% D - Тип:% S, модуля: |cff4040ff% с |г \п |cffffffffError сообщение: |г", 
         ["ErrorHeaderNoError"] = "ошибки не возникало до сих пор.",
         ["ErrorType:MINOR"] = "|cff00ff00Первая|r",
         ["ErrorType:MAJOR"] = "|cffff8000ОСНОВНЫЕ|r",
         ["ErrorType:CRITICAL"] = "|cffff0000критическое|r",

         -- Threat, overview, regain lists localisation

         ["guiHeader"] = "DiamondThreatMeter v%s",

         ["Name"] = "Название",
         ["Threat"] = "угроза",
         ["TPS"] = "TPS",
         ["Relative"] = "Кто?",

         ["unitInfo"] = "%s уровня %s %s",
         ["unitInfoLight"] = "%s %s",
         ["noThreatList"] = "|cffffa000This NPC не использует угрозу список|r",

         ["aggroRegain"] = "|cffff4040Aggro восстановить|r",
         ["aggroRegainClose"] = "|cffff8020Aggro (закрытие)|r",

         ["standbyTarget"] = "Нет NPC выбран",
         ["standbyTargetWrongReaction"] = "Этот NPC не враждебное.",
         ["standbyTargetDead"] = "Ваша цель |cffff4040dead |r",
         ["standbyTargetOpening"] = "Открытие ...",
         ["standbyFocus"] = "Нет NPC установить в качестве фокуса.",
         ["standbyFocusWrongReaction"] = "Этот NPC не враждебное.",
         ["standbyFocusDead"] = "Ваше внимание  |cffff4040dead|r.",
         ["standbyFocusOpening"] = "Открытие ...",

         ["overviewNoUnit"] = "Неизвестное устройство.",
         ["overviewOpening"] = "Открытие ...",
         ["overviewUnitInfo"] = "Обзор (%s)",

         ["regainNoUnit"] = "Неизвестное устройство.",
         ["regainOpening"] = "Открытие восстановить список ...",
         ["regainUnitInfo"] = "Восстановление (%s)",

         ["test"] = "Тест",
         ["testList"] = "Это список тестов.",

         ["tankToggle"] = "Есть цистерна",
         ["tankToggleTooltip"] = "Эта кнопка позволяет вам устанавливать ли данное устройство цистерны или нет. Цистерны показать специальный значок, а не их класс один.",

         ["anchorSetting"] = "опорную точку",
         ["AnchorSettingTooltip"] = "Вы можете выбрать здесь, как вы хотите этот список, чтобы быть закреплены. Он будет расходовать на противоположной якорь направлении." ,

         ["TWGainTemplate"] = "% S |cffff0000AGGRO |г -% S", 
         ["TWLoseTemplate"] = "% S |cff0000ffAggro Lost |г -% S", 

         -- Конфигурация рамки локализации 

         -- 0. Целом 

         ["ConfigEngineCategory"] = "Двигатель", 
         ["ConfigGUICategory"] = "GUI", 
         ["ConfigSystemCategory"] = "Система", 
         ["ConfigWarningCategory"] = "Предупреждения", 
         ["ConfigNameplateCategory"] = "Таблички", 
         ["ConfigVersionCategory"] = "Версия", 

         -- 1. Intro панели 

         ["ConfigIntroTitle"] = "Добро пожаловать в панель конфигурации DTM!", 
         ["ConfigIntroSubTitle"] = "С этой панели вы можете получить доступ к другим группам конфигурации DTM." ,

         ["ConfigIntroSystemPart"] = "Конфигурация системы", 
         ["ConfigIntroEnginePart"] = "Двигатель конфигурации", 
         ["ConfigIntroGUIPart"] = "GUI конфигурации", 
         ["ConfigIntroWarningPart"] = "Предупреждения конфигурации", 
         ["ConfigIntroNameplatePart"] = "Таблички конфигурации", 
         ["ConfigIntroVersionPart"] = "Проверка версии", 

         ["ConfigIntroRingButtonExplain"] = "Ниже кнопки DTM кольцо. Вы можете перетащить его в любом месте, а затем нажмите на нее, чтобы непосредственно открыть DTM конфигурации меню." ,
         ["ConfigIntroRingButtonMoving"] = "Вы движетесь кольцо кнопка. Отпустите кнопку мыши, как только вы нашли подходящее место для этого." ,
         ["ConfigIntroRingButtonReset"] = "кольцо кнопки теперь установлена. Если вы сделали ошибку, нажмите на кнопку ниже, чтобы установить свою позицию еще раз." ,

        -- 2. Двигатель панели 

         ["ConfigEngineTitle"] = "Двигатель настройки", 
         ["ConfigEngineSubTitle"] = "Вы можете задать здесь, как вы хотите DTM двигателя себя вести." ,

         ["ConfigEngineEnable"] = "Включить двигатель", 
         ["ConfigEngineEnableCaption"] = "|cffff2020The двигатель в настоящее время выключен |. Г \nThreat данные отсутствуют." ,
         ["ConfigEngineDisable"] = "Отключить двигатель", 
         ["ConfigEngineDisableCaption"] = "|cff20ff20The двигатель в настоящее время включен |. Г \nDisabling это предотвратит угрозу данные от вычисляется." ,
         ["ConfigEnginePaused"] = "|cffffff20Temporarily остановился |. Г \nВ двигатель повторного включения автоматически." ,
         ["ConfigEngineEmergencyStop"] = "|cffff2020Emergency остановка включены |. Г \nDisable для реактивации двигателем." ,

         ["ConfigAggroDelaySlider"] = "Aggro изменения задержки", 
         ["ConfigZoneWideCheckRateSlider"] = "всей зоны борьбе Интервал проверки", 
         ["ConfigTPSUpdateRateSlider"] = "TPS скорость обновления", 
         ["ConfigDetectReset"] = "Очистка базы регулярно", 

         ["ConfigWorkMethod"] = "Метод работы", 
         ["ConfigWorkMethodAnalyze"] = "Анализ", 
         ["ConfigWorkMethodHybrid"] = "Hybrid", 
         ["ConfigWorkMethodNative"] = "Родной", 

         ["ConfigTooltipWorkMethodAnalyze"] = "Наличное значения угрозе, используя исключительно в журнале боя информации. В этих условиях угроза показано может быть и будет неточным. Это было предварительно WotLK способ определенной угрозы данных." ,
         ["ConfigTooltipWorkMethodHybrid"] = "Наличное угрозы значений с помощью обоих журнале боя и Blizzard родной метр угрозой. Этот параметр является наиболее ресурсоемкие, но она дает много угрозы данные, точность которых является достаточно хорошим. Внезапные изменения в угрозе значения отображаются могут возникать из-за метр родной угрозы recalibrates неточные результаты борьбы с разбора. " ,
         ["ConfigTooltipWorkMethodNative"] = "Наличное значения угрозе, используя исключительно Blizzard родной метр угрозой. Этот параметр не дает хороших данных угрозы о единицах, которые не принадлежат к вашей партии или рейда, но дает точные значения угрозе и является самым быстрым." ,

         ["ConfigTooltipAggroDelayExplain"] = "Этот ползунок определяет, как много времени DTM будет ждать, прежде чем рассматривать NPC изменила свое реальное агро цель, когда он переключается между целями." ,
         ["ConfigTooltipZoneWideCheckRateExplain"] = "Устанавливает промежуток времени есть до проверки DTM, если рядом членов рейда вошли всей зоны боевых действий. Меньшие значения уменьшение общего выступления, но убедитесь рейда добавляются сразу в списки врагов угрозы." , 
         ["ConfigTooltipTPSUpdateRateExplain"] = "Вы можете настроить здесь, как часто вы хотите TPS в обновлении. Обновления происходят более часто может привести замедления в тяжелых боях." ,
         ["ConfigTooltipDetectResetExplain"] = "При включении этой опции позволяет DTM, чтобы стереть содержимое угрозы списки из вне борьбы с существами, которые не отметил ни таргетинга никому. Это также позволяет DTM для удаления данных существ мы ничего не слышали о на 600 сек." ,

         -- 3. GUI панели 

         ["ConfigGUITitle"] = "Графический интерфейс пользователя настройки", 
         ["ConfigGUISubTitle"] = "Вы можете задать здесь, как DTM должен представить вам угрозы списков.", 

         ["ConfigGUIEnable"] = "Включить GUI", 
         ["ConfigGUIEnableCaption"] = "|cffff2020The GUI в настоящее время выключен |. Дисплей г \nThreat списки отключена. " ,
         ["ConfigGUIDisable"] = "Отключить GUI", 
         ["ConfigGUIDisableCaption"] = "|cff20ff20The GUI в настоящее время включен |. Г \nDisabling это предотвратит угрозу отображения списков",
         ["ConfigGUIPaused"] = "|cffffff20Temporarily остановился |. Г \nВ GUI будет повторного включения автоматически." ,
         ["ConfigGUIEmergencyStop"] = "|cffff2020Emergency остановка включены |.. Г \nDisable для реактивации GUI", 

         ["ConfigGUIAutoDisplay"] = "Авто-дисплей условия", 
         ["ConfigGUIAutoDisplayTarget"] = "Цель угрозы список", 
         ["ConfigGUIAutoDisplayFocus"] = "Фокус угрозы список", 
         ["ConfigGUIAutoDisplayOverview"] = "Обзор список", 
         ["ConfigGUIAutoDisplayRegain"] = "Восстановление список", 
         ["ConfigGUIAutoDisplayAlways"] = "Всегда", 
         ["ConfigGUIAutoDisplayOnChange"] = "На смену", 
         ["ConfigGUIAutoDisplayOnJoin"] = "О группировке", 
         ["ConfigGUIAutoDisplayOnCombat"] = "О борьбе", 
         ["ConfigGUIAutoDisplayNever"] = "Никогда", 

         ["ConfigTooltipAutoDisplayAlways"] = "Позволяет этой угрозы перечень, который будет всегда отображается по умолчанию." ,
         ["ConfigTooltipAutoDisplayNever"] = "Предотвращение этой угрозы список, который будет отображаться по умолчанию." ,
         ["ConfigTooltipAutoDisplayOnChange"] = "Показывать эту угрозу список, когда вы установите фокус." ,
         ["ConfigTooltipAutoDisplayOnJoin"] = "Показывать эту угрозу список, когда вы присоединиться к группе." ,
         ["ConfigTooltipAutoDisplayOnCombat"] = "Показывать эту угрозу списка при вводе бою." ,

         -- 4. Система панели 

         ["ConfigSystemTitle"] = "Системные настройки", 
         ["ConfigSystemSubTitle"] = "Вы можете изменить здесь общие параметры DTM, которые затрагивают как двигатель и графического интерфейса." ,

         ["ConfigSystemEnable"] = "Возобновить", 
         ["ConfigSystemEnableCaption"] = "|cffff2020The аварийной остановки в настоящее время включены |. Г \nВ двигателя и GUI приостановлены." ,
         ["ConfigSystemDisable"] = "STOP", 
         ["ConfigSystemDisableCaption"] = "|cff20ff20The аварийной остановки в настоящее время отключена |. Г", 

         ["ConfigSystemAlwaysEnabled"] = "Всегда позволяет DTM для запуска", 
         ["ConfigSystemQuickConfig"] = "Быстрые настройки", 
         ["ConfigSystemBindings"] = "DTM специальные привязки", 
         ["ConfigSystemErrorLog"] = "Ошибка журнала", 

         ["ConfigSystemManagementHeader"] = "Сохраненные данные управления", 

         ["ConfigSystemModifiedProfile"] = "профиль, пострадавших от вариантов модификаций:", 
         ["ConfigSystemResetSavedVars"] = "Сбросить DTM конфигурации", 
         ["ConfigSystemResetNPCData"] = "Reset NPC базы данных", 
         ["ConfigSystemResetAll"] = "Сбросить все", 

         ["ConfigTooltipAlwaysEnabledExplain"] = "Когда галочкой, DTM будет продолжать работать, даже если вы находитесь в поле битвы или арену, такси, гостиница, столица или святилище." ,
         ["ConfigTooltipQuickConfigExplain"] = "Эта кнопка позволяет быстро настроить DTM по роли, которую вы выполняете в настоящее время." ,
         ["ConfigTooltipModifiedProfileExplain"] = "Если вы выберете этот, характер конкретных изменений, внесенных в DTM вариантов повлияет |cff20ff20% S (% S) |г профиля \п \п |cffff0000WARNING |. Г - Если вы выберите опцию панелей будет обновилась и несохраненные изменения будут потеряны. " ,
         ["ConfigTooltipResetSavedVarsExplain"] = "При нажатии на эту кнопку сброса всех данных конфигурации. Skins останется неизменным. Интерфейс будет немедленно перезагружена." ,
         ["ConfigTooltipResetNPCDataExplain"] = "При нажатии на эту кнопку сброса базы данных NPC, который содержит их особые способности и поведение. Умолчанию данные будут восстановлены." ,
         ["ConfigTooltipResetAllExplain"] = "При нажатии на эту кнопку будут удалены все DTM сохраненных данных, в том числе конфигурации и шкур. Эта кнопка Последнее решение, если у вас возникли проблемы с DTM. Интерфейс будет немедленно перезагружена." ,

         -- 5. Версия панели 

         ["ConfigVersionTitle"] = "о версии", 
         ["ConfigVersionSubTitle"] = "Вы можете посмотреть здесь номер версии и просить других членов партии, чтобы отправить их." ,

         ["ConfigVersionYours"] = "Вы используете |cffffffff% S |. Г версия DiamondThreatMeter", 

         ["ConfigVersionQuery"] = "Запрос версия", 
         ["ConfigVersionQueryBusy"] = "|cffffff00The системы в настоящее время занят |. Г", 
         ["ConfigVersionQueryFlood"] = "|cffffff00Please ждать момента |. Г", 
         ["ConfigVersionQueryNotGrouped"] = "|cffff8000You может запросить только номер версии, когда вы находитесь в группе |. Г", 
         ["ConfigVersionQueryOK"] = "|cff00ff00Ready просить номер версии |. Г", 
         ["ConfigVersionQueryResults"] = "Результаты версия запроса:", 

         ["ConfigVersionDTMFormat"] = "|cff00ff00DTM |г |cffffffffv% с |г", 
         ["ConfigVersionOtherFormat"] = "|cffffa000% с |г |cffffffff% с |г", 
         ["ConfigVersionNoneFormat"] = "|cffffffff% с |г", 

         -- 6. Предупреждение панели 

         ["ConfigWarningTitle"] = "Расширенный предупреждения конфигурации", 
         ["ConfigWarningSubTitle"] = "Вы можете задать здесь, когда, где и как DTM должен предупредить вас, когда вы собираетесь получить агро от опасного врага." ,

         ["ConfigWarningExplain110"] = "- При переходе выше |cffffff20110% |г угрозы NPC цели, вы будете вернуть агро если вы находитесь в ближнем бою." ,
         ["ConfigWarningExplain130"] = "- При переходе выше |cffff2020130% |г угрозы NPC цели, вы будете вернуть агро." ,
         ["ConfigWarningLimit"] = "маржи, прежде чем предупреждал",
         ["ConfigWarningCancelLimit"] = "Маржа для отмены",
         ["ConfigWarningPosition"] = "Позиция установки", 
         ["ConfigWarningHorizontal"] = "горизонтальный", 
         ["ConfigWarningLeft"] = "левых", 
         ["ConfigWarningRight"] = "Право", 
         ["ConfigWarningVertical"] = "Вертикаль", 
         ["ConfigWarningUp"] = "Вверх", 
         ["ConfigWarningDown"] = "Вниз", 
         ["ConfigWarningEnablePreview"] = "Включить превью", 
         ["ConfigWarningDisablePreview"] = "Отключить Предварительный просмотр", 

         ["ConfigWarningToggle"] = "Использование предупреждений", 

         ["ConfigWarningThreshold"] = "Порог предупреждения" ,
         ["ConfigWarningBossTag"] = "Босс НЭК", 
         ["ConfigWarningEliteTag"] = "Elite НЭК", 
         ["ConfigWarningNormalTag"] = "Нормальный НЭК", 
         ["ConfigWarningLevelTag"] = "Лев." ,
         ["ConfigWarningAndMoreTag"] = "и больше", 
         ["ConfigWarningClassification"] = "Отображение предупреждений в отношении |cffff2020% с |р", 
         ["ConfigWarningClassificationAndLevel"] = "Отображение предупреждений в отношении |cffff2020% с |г, имеет перепад высот вместе с Вами |cffff2020% S% S |. Г и выше", 

         ["ConfigWarningSound"] = "Предупреждение звука", 
         ["sound:NONE"] = "Нет",
         ["sound:WEIRD"] = "Weird",
         ["sound:BUZZER"] = "Звонок",
         ["sound:PEASANT"] = "Крестьянские (War3)",
         ["sound:ALARM"] = "Тревога",

         ["ConfigTooltipWarningExplain"] = "Если включено, вы будете предупредил, когда вы собираетесь получить агро от ожесточенной монстра (любого NPC, который соответствует порог предупреждения). Танки, конечно, хотим, чтобы отключить эту опцию. \П \nAlso Отметим, что Существуют специальные правила, установленные в DTM, что заставит предупреждение бар оставаться скрытыми или принудительно показано для некоторых NPC, независимо от настройки. " ,
         ["ConfigTooltipWarningLimitExplain"] = "Этот ползунок позволяет менять маржа у вас есть перед запуском предупреждение Например, если вы установите 20% и вы находитесь в ближнем бою, это означает, что предупреждение будет получить срабатывает выше 110 - 20. = 90% . " ,
         ["ConfigTooltipWarningCancelLimitExplain"] = "Этот ползунок позволяет менять поле вы должны создать до бара в режиме предупреждения перестает быть в режиме предупреждения. Например, если вы установите 30% и вы находитесь в ближнем бою, это означает предупреждение остановиться, если вы получаете по 110 -. 30 = 80% ", 
         ["ConfigTooltipPreviewExplain"] = "Эта кнопка позволяет включать специальный бар, который показывает, где в барах предупреждение режим пойдет на вашем экране. Это позволяет точно позиционировать их, используя ползунки выше. Она также позволяет вам услышать предупреждающий звук Вы выбрали. " ,

         -- 7. Таблички панели 

         ["ConfigNameplateTitle"] = "Таблички конфигурации", 
         ["ConfigNameplateSubTitle"] = "Вы можете задать здесь, если вы хотите DTM также показать свою угрозу выше таблички врагов." ,

         ["ConfigNameplateExplain"] = "ВНИМАНИЕ - Эта функция в настоящее время экспериментальные и не может различать врагов проведения одноименного Если есть неопределенность, DTM не будет отображать данные угрозы выше табличке..", 
         ["ConfigNameplateToggle"] = "Включить отображение угрозы", 
         ["ConfigTooltipNameplateExplain"] = "поставьте галочку для отображения вашего угрозы по отношению к ближайшим врагам выше с табличками названий \п \п |. Cffff0000Please отметить, что, когда несколько врагов общее название занимаются в бою, DTM НЕ будут в состоянии отображать их угроза над их названию |. г ", 

         -- 8. Кожа менеджер рамки 

         ["ConfigSkinManagerHeader"] = "Skin Manager", 

         ["ConfigSkinManagerTagBase"] = "|cff00ff00 (базовый кожи) |г", 
         ["ConfigSkinManagerTagUser"] = "|cff2020ff (определяемый пользователем кожи) |г", 

         ["ConfigSkinManagerExplain"] = "Skins параметры, которые определяют, как DTM должна выглядеть. Чтобы создать свой собственный скин, вы должны скопировать существующие кожи и изменить его." ,
         ["ConfigSkinManagerExplainLocked"] = "менеджер в данный момент заблокирован, и вы должны закрыть кожи редактор прежде чем вы сможете использовать его снова." ,
         ["ConfigSkinManagerExplainBaseSkin"] = "Это база кожи. Эти шкуры могут быть изменены, но не удалить или переименовать. Они могут быть восстановлены в первоначальном варианте." ,
         ["ConfigSkinManagerExplainUserSkin"] = "Это определяемых пользователем кожи. Они могут быть переименованы, удалены, изменены, но не восстанавливаются." ,
         ["ConfigSkinManagerExplainSelectionAppend"] = "\п \nНажмите, чтобы выбрать эту кожу для текущего профиля." ,

         ["ConfigSkinManagerSelection"] = "Кожа выбран:", 
         ["ConfigSkinManagerRename"] = "Переименовать", 
         ["ConfigSkinManagerRestore"] = "Восстановление", 
         ["ConfigSkinManagerCopy"] = "Копировать", 
         ["ConfigSkinManagerDelete"] = "Удалить", 
         ["ConfigSkinManagerToEditor"] = "Отправить в кожу редактора", 

         ["ConfigSkinManagerCopyForm"] = "Вы собираетесь копировать кожи |cff00ff00% с |? Р. \nЧто имя вы даете копию", 
         ["ConfigSkinManagerRenameForm"] = "Вы собираетесь переименовать кожи |cff00ff00% с |? Р. \nЧто новое имя вы дадите на это", 
         ["ConfigSkinManagerRestoreForm"] = "Вы собираетесь восстанавливать базы кожи |cff00ff00% с |? Р. \nВы уверены, что хотите это сделать", 
         ["ConfigSkinManagerDeleteForm"] = "Вы собираетесь удалить кожу |cff00ff00% с |? Р. \nВы уверены, что хотите это сделать", 

         -- 9. Кожа рамку редактора 

         ["ConfigSkinEditorPreview"] = "Предварительный просмотр", 
         ["ConfigSkinEditorFinish"] = "Готово", 
         ["ConfigSkinEditorCategory"] = "Категория% г /г%", 

         -- Кожа схемы перевода 

         -- 1. Категории 


         ["skinSchema-General"] = "Общие",
         ["skinSchema-Animation"] = "Анимация",
         ["skinSchema-ThreatList"] = "Угроза список",
         ["skinSchema-OverviewList"] = "Обзор список",
         ["skinSchema-RegainList"] = "Восстановление список",
         ["skinSchema-Display"] = "Показать",
         ["skinSchema-Bars"] = "Барс",
         ["skinSchema-Columns"] = "Столбцы",
         ["skinSchema-RegainColumns"] = "Столбцы (восстановить)",
         ["skinSchema-Text"] = "Текст",

         -- 2. Labels

         ["skinSchema-Length"] = "Длина",
         ["skinSchema-Alpha"] = "Альфа",
         ["skinSchema-Scale"] = "Масштаб",
         ["SkinSchema-LockFrames"] = "Закрепить позиции списков", 

         ["SkinSchema-ShortFigures"] = "Сокращать цифрах", 
         ["SkinSchema-TWMode"] = "Текстовые предупреждения режиме", 
         ["SkinSchema-TWCondition"] = "Текстовые предупреждения условия", 
         ["SkinSchema-TWPositionY"] = "Y положение текстовые предупреждения" ,
         ["SkinSchema-TWHoldTime"] = "Показывать время текстовое предупреждение", 
         ["SkinSchema-TWCooldownTime"] = "Перезарядка время текстовое предупреждение", 
         ["SkinSchema-TWSoundEffect"] = "Звуковой эффект от текстовой предупреждения" ,

         ["SkinSchema-OnlyHostile"] = "Отображать только враждебные НПС", 
         ["SkinSchema-AlwaysDisplaySelf"] = "Всегда показывать себя", 
         ["SkinSchema-DisplayAggroGain"] = "Добавить агро восстановить тег", 
         ["SkinSchema-RaiseAggroToTop"] = "Поднимите вверх агро цель", 
         ["SkinSchema-RaiseAggroToTopOverview"] = "Поднимите вверх aggro'ed врагов", 
         ["SkinSchema-DisplayLevel"] = "Показать уровень", 
         ["SkinSchema-DisplayHealth"] = "Показать здоровья", 
         ["skinSchema-Filter"] = "Фильтр",
         ["SkinSchema-CursorTexture"] = "Курсор текстура", 
         ["skinSchema-Rows"] = "Максимальное число строк",

         ["SkinSchema-BackdropUseTile"] = "фона используется плитка режиме", 
         ["SkinSchema-TileTexture"] = "текстуру фона", 
         ["SkinSchema-EdgeTexture"] = "Edge текстура", 
         ["SkinSchema-WidgetTexture"] = "Виджет текстура", 
         ["SkinSchema-WidgetPositionX"] = "Виджет X позиция", 
         ["SkinSchema-WidgetPositionY"] = "Виджет Y смещение", 

         ["SkinSchema-BackgroundTexture"] = "База текстура", 
         ["SkinSchema-FillTexture"] = "Заполните текстура", 
         ["SkinSchema-ShowSpark"] = "Показать искра", 
         ["SkinSchema-Smooth"] = "сгладить баров вариациями", 
         ["SkinSchema-FadeCoeff"] = "Fade анимации продолжительность коэф", 
         ["SkinSchema-SortCoeff"] = "Сортировать анимации продолжительность коэф", 
         ["SkinSchema-AggroGraphicEffect"] = "Графический эффект, когда есть агро", 

         ["skinSchema-Class"] = "Класс",
         ["skinSchema-Name"] = "Название",
         ["skinSchema-Threat"] = "угроза",
         ["skinSchema-TPS"] = "угрозы в секунду",
         ["skinSchema-Percentage"] = "Процент",
         ["skinSchema-Relative"] = "Кто ?",

         -- 3. Values

         ["skinSchema-TWMode-Disabled"] = "Нет предупреждения",
         ["skinSchema-TWMode-Gain"] = "на прибыль",
         ["skinSchema-TWMode-Lose"] = "На потери",
         ["skinSchema-TWMode-Both"] = "Прибыль и убытки",

         ["skinSchema-TWCondition-Anytime"] = "всегда",
         ["skinSchema-TWCondition-Instance"] = "инстанции",
         ["skinSchema-TWCondition-Party"] = "Сторона",

         ["skinSchema-Filter-All"] = "Все",
         ["skinSchema-Filter-Party"] = "Сторона",
         ["skinSchema-Filter-PartyPlayer"] = "партия (игроки)",

         -- 4. Tooltips

         ["skinSchema-Length-Tooltip"] = "Устанавливает эффективная ширина (в пикселях), используемых в барах угрозы, обзор и восстановить списки. Если вы используете значение, слишком короткий, не будет достаточно места для некоторых текстов . ",
         ["skinSchema-Alpha-Tooltip"] = "Этот ползунок позволяет менять дисплей альфа угрозы списков.",
         ["SkinSchema-Scale Tooltip"] = "Этот ползунок позволяет изменять масштаб отображения списков угрозы." ,
         ["SkinSchema-LockFrames-Tooltip"] = "Эта опция предотвращает Вас от движущихся системах отсчета, перетаскивая их левой кнопкой мыши." ,

         ["SkinSchema-ShortFigures-Tooltip"] = "При включении этой опции позволит сократить цифры угрозы значение. 10455 например станет 10.5k." ,
         ["SkinSchema-TWPositionY-Tooltip"] = "Устанавливает вертикальное положение текстовые предупреждения." ,
         ["SkinSchema-TWHoldTime-Tooltip"] = "Определяет, как долго текстовое предупреждение будет оставаться отображается." ,
         ["SkinSchema-TWCooldownTime-Tooltip"] = "Восстановление предотвращает спам-рассылки текстовых предупреждение, если NPC циклов между вами и другим целям." ,
         ["SkinSchema-TWSoundEffect-Tooltip"] = "Вы можете задать здесь звук, который будет воспроизводиться при текстовых apparears предупреждения. Вы должны поместить файл в DTM''''SFX папку и указать его расширение. \П \nУдалить Содержание окно редактирования, чтобы играть без звука. " ,

         ["SkinSchema-OnlyHostile-Tooltip"] = "Если галочка, только угрозы списки от враждебных NPC, будет отображаться." ,
         ["SkinSchema-AlwaysDisplaySelf-Tooltip"] = "Эта опция позволяет вам быть всегда * * видимых на любые угрозы списке вы участвуете в, даже если вы слишком далеко в списке." ,
         ["SkinSchema-DisplayAggroGain-Tooltip"] = "При включении этой опции добавляет одну строку additionnal порога угрозы списков. Going выше этого порога строка означает, что вы, наверное, вытащить агро от соответствующих NPC." ,
         ["SkinSchema-RaiseAggroToTop-Tooltip"] = "Позволяет место на вершине списка угроз агро цель NPC. Лучше отключить эту опцию для НПС, что переключаться между целями много." ,
         ["SkinSchema-RaiseAggroToTopOverview-Tooltip"] = "Показывает в приоритетных врагов атаковать вас в верхней части обзор списка." ,
         ["SkinSchema-DisplayLevel-Tooltip"] = "Позволяет отображать уровень NPC на угрозу списков." ,
         ["SkinSchema-DisplayHealth-Tooltip"] = "Включите этот параметр, чтобы отобразить небольшой бар здоровья ниже Infos NPC." ,
         ["SkinSchema-CursorTexture-Tooltip"] = "Это поле позволяет изменить изображение курсора. Курсор показывает, что ваша позиция в списки угрозы.",
         ["skinSchema-Rows-Tooltip"] = "Этот ползунок позволяет выбрать максимальное количество строк, которые могут отображаться сразу в списке угроз. Высокие значения, несомненно, уменьшит выступления вашего компьютера.",

         ["SkinSchema-BackdropUseTile-Tooltip"] = "Тик это, если фона используется плитка системы (квадраты, которые повторяются столько, сколько необходимо для заполнения в фоновом режиме)." ,
         ["SkinSchema-TileTexture-Tooltip"] = "Вы можете задать здесь файла использовать для фона списков." ,
         ["SkinSchema-EdgeTexture-Tooltip"] = "Вы можете задать здесь файл изображения для использования края списков." ,
         ["SkinSchema-WidgetTexture-Tooltip"] = "Вы можете предоставить небольшой файл изображения здесь (32x32 точек), который будет отображаться на верхней границе списков." ,
         ["SkinSchema-WidgetPositionX-Tooltip"] = "Вы можете отрегулировать положение Х виджет с помощью этого ползунка." ,
         ["SkinSchema-WidgetPositionY-Tooltip"] = "Вы можете настроить Y смещение виджет с помощью этого ползунка." ,

         ["SkinSchema-BackgroundTexture-Tooltip"] = "Вы можете задать здесь файл изображения для использования в качестве базы текстуру баров." ,
         ["SkinSchema-FillTexture-Tooltip"] = "Вы можете задать здесь файл изображения для использования в качестве заполнения текстур баров." ,
         ["SkinSchema-ShowSpark-Tooltip"] = "Если галочка, эта опция отображает искры на брусьях." ,
         ["SkinSchema-Smooth-Tooltip"] = "чисто эстетических вариант. Если вы хотите очень отзывчивы и четкий дисплей, вы должны отключить эту опцию." ,
         ["SkinSchema-FadeCoeff-Tooltip"] = "Этот ползунок позволяет менять скорость, с которой исчезает эффект угрозы списки выполнять. X0.5 например удваивает скорость." ,
         ["SkinSchema-SortCoeff-Tooltip"] = "Этот ползунок позволяет лет изменения скорости, с которой анимации строк угрозы списки происходят. X0.5 например удваивает скорость. " ,
         ["SkinSchema-AggroGraphicEffect-Tooltip"] = "Эта опция позволяет добавлять графические влияние на бар, который имеет агро от врага." ,
         
         ["skinSchema-TWMode-Disabled-Tooltip"] = "Нет текстовое предупреждение будет отображаться, если получить или потерять агро от врага.",
         ["SkinSchema-TWMode-Gain-Tooltip"] = "будет показано, если вы получаете агро от врага." ,
         ["skinSchema-TWMode-Lose-Tooltip"] = "будет показано, если вы потеряете агро от врага.",
         ["skinSchema-TWMode-Both-Tooltip"] = "будет показано, если у вас получить или потерять агро от врага.",

         ["SkinSchema-TWCondition-Anytime-Tooltip"] = "текстовые предупреждения будут отображаться в любое время." ,
         ["skinSchema-TWCondition-Instance-Tooltip"] = "текстовые предупреждения будут отображаться только когда вы внутри экземпляра." ,
         ["skinSchema-TWCondition-Party-Tooltip"] = "текстовые предупреждения будут отображаться только в то время как внутри рейда или партии.",

         ["skinSchema-Filter-All-Tooltip"] = "Все на угрозу списки будут отображаться, в том числе игроков или NPC, за пределами вашей группы.",
         ["skinSchema-Filter-Party-Tooltip"] = "Только игроки или домашних животных, которые находятся в вашей группе будет отображаться на угрозу списков.",
         ["skinSchema-Filter-PartyPlayer-Tooltip"] = "Только игроки (за исключением домашних животных), которые находятся в вашей группе будет отображаться.",
    },
};

-- --------------------------------------------------------------------
-- **                    Localisation functions                      **
-- --------------------------------------------------------------------

-- ********************************************************************
-- * DTM_Localise(key, noError)                                       *
-- ********************************************************************
-- * Arguments:                                                       *
-- * >> key: what to localise. If not found on the correct locale,    *
-- * will use default value. If there is no default value, this       *
-- * function will return formatted DTM_MISSING_TRANSLATION.          *
-- * >> noError: if set and the localisation is not available, this   *
-- * function will return nil instead of missing translation.         *
-- ********************************************************************

function DTM_Localise(key, noError)
    local locale = DTM_Locale[GetLocale()];
    local defaultlocale = DTM_Locale["default"];

    if ( locale ) and ( locale[key] ) then
        return locale[key];
  else
        if ( defaultlocale ) and ( defaultlocale[key] ) then
            return defaultlocale[key];
        end
    end

    if ( noError ) then return nil; end

    DTM_ThrowError("MINOR", activeModule, string.format('Translation for "%s" is missing (%s language).', key, GetLocale()));
    return string.format(DTM_MISSING_TRANSLATION, key);
end

-- ********************************************************************
-- * DTM_Unlocalise(translation)                                      *
-- ********************************************************************
-- * Arguments:                                                       *
-- * >> translation: translation thing to unlocalise.                 *
-- * If there is an error, <translation> value will be returned.      *
-- ********************************************************************

function DTM_Unlocalise(translation)
    local locale = DTM_Locale[GetLocale()];
    local defaultlocale = DTM_Locale["default"];
    local k, t;

    if ( locale ) then
        for k, t in pairs(locale) do
            if ( t == translation ) then
                return k;
            end
        end
    end

    if ( defaultlocale ) then
        for k, t in pairs(defaultlocale) do
            if ( t == translation ) then
                return k;
            end
        end
    end

    DTM_ThrowError("MINOR", activeModule, string.format('Couldn\'t unlocalise "%s" translation (%s language).', translation, GetLocale()));
    return translation;
end