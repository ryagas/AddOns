﻿-- Translation for zhTW by Indra from Eastern.Stories an old old old TW mud. 06/20/2007
-- 在下只翻譯了FishingBuddy 的部份.
-- Outfitter 的部份留待能人接續, 個人習慣使用Itemrack
-- Translation for zhTW , WOW version 2.3.0	Fish Buddy EBA0.9.3i by Indra	 
-- Special thanks translating advice from "Whocare" on "bahamut" a gamer forum of influence in Taiwan 11/24/2007

-- Update translation for 0.9.7 beta3 05/03/2009
-- Translations added from CurseForge, machihchung and "zhTW"

FishingTranslations["zhTW"] = {
	CONFIG_FISHINGCHARM_INFO = "\229\166\130\230\158\156\229\149\159\231\148\168\239\188\140\228\189\191\231\148\168\230\189\152\233\129\148\229\136\169\228\186\158\229\190\151\229\136\176\231\154\132\233\135\163\233\173\154\232\173\183\231\172\166",
	CONFIG_FISHINGFLUFF_INFO = "\233\150\139\229\149\159\229\144\132\231\168\174\233\135\163\233\173\154\230\153\130\231\154\132\228\188\145\233\150\146\229\138\159\232\131\189",
	CONFIG_FISHINGFLUFF_ONOFF = "\233\135\163\233\173\154\230\168\130\232\182\163",
	CONFIG_FISHINGRAFT_INFO = "\229\166\130\230\158\156\229\149\159\231\148\168\239\188\140\229\176\135\230\150\189\230\148\190\233\135\163\233\173\154\231\171\185\231\173\143",
	CONFIG_FISHWATCH_INFO = "\229\156\168\231\149\182\229\137\141\233\135\163\233\173\154\229\141\128\229\159\159\233\135\163\229\136\176\231\154\132\233\173\154\228\184\138\233\161\175\231\164\186\228\184\128\229\128\139\230\150\135\229\173\151",
	CONFIG_FISHWATCHONLY_INFO = "\229\131\133\229\156\168\233\135\163\233\173\154\230\153\130\230\137\141\233\161\175\231\164\186\233\135\163\233\173\154\232\167\128\229\175\159\232\128\133",
	CONFIG_FISHWATCHONLY_ONOFF = "\229\131\133\229\156\168\233\135\163\233\173\154\230\153\130",
	CONFIG_FISHWATCH_ONOFF = "\233\135\163\233\173\154\232\167\128\229\175\159\232\128\133",
	CONFIG_FISHWATCHPAGLE_INFO = "\233\161\175\231\164\186\228\187\138\229\164\169\228\189\160\229\183\178\231\182\147\232\170\191\229\136\176\231\154\132\231\180\141\231\137\185\226\128\167\229\184\149\230\160\188\232\129\178\230\156\155\231\148\168\233\173\154",
	CONFIG_FISHWATCHPAGLE_ONOFF = "\230\143\144\233\134\146\229\184\149\230\160\188\232\129\178\230\156\155\233\156\128\232\166\129\231\154\132\233\173\154",
	CONFIG_FISHWATCHPERCENT_INFO = "\229\156\168\232\167\128\229\175\159\233\161\175\231\164\186\228\184\138\233\161\175\231\164\186\230\175\143\231\168\174\233\173\154\233\161\158\231\154\132\231\153\190\229\136\134\230\175\148",
	CONFIG_FISHWATCHPERCENT_ONOFF = "\233\161\175\231\164\186\231\153\190\229\136\134\230\175\148",
	CONFIG_FISHWATCHSKILL_INFO = "\229\156\168\233\135\163\233\173\154\232\167\128\229\175\159\229\141\128\229\159\159\233\161\175\231\164\186\231\149\182\229\137\141\233\135\163\233\173\154\230\138\128\232\131\189",
	CONFIG_FISHWATCHSKILL_ONOFF = "\231\149\182\229\137\141\230\138\128\232\131\189",
	CONFIG_FISHWATCHTIME_INFO = "\233\161\175\231\164\186\228\189\160\230\156\128\229\190\140\228\184\128\230\172\161\232\163\157\229\130\153\233\173\154\231\171\191\231\154\132\231\184\189\232\168\136\230\153\130\233\150\147",
	CONFIG_FISHWATCHTIME_ONOFF = "\233\161\175\231\164\186\231\182\147\233\129\142\231\154\132\230\153\130\233\150\147",
	CONFIG_FISHWATCHZONE_INFO = "\229\156\168\232\167\128\229\175\159\229\141\128\229\159\159\233\161\175\231\164\186\231\149\182\229\137\141\229\141\128\229\159\159",
	CONFIG_FISHWATCHZONE_ONOFF = "\231\149\182\229\137\141\229\141\128\229\159\159",
	CONFIG_LASTRESORT_INFO = "\229\166\130\230\158\156\229\149\159\231\148\168\239\188\140\229\138\160\228\184\138\230\156\128\229\164\167\231\154\132\233\164\140\239\188\140\229\141\179\228\189\191\233\128\153\229\128\139\233\164\140\231\132\161\230\179\149\232\174\147\228\184\138\233\137\164\231\142\135\233\129\148\229\136\176100%\227\128\130",
	CONFIG_LASTRESORT_ONOFF = "\230\156\128\229\164\167\231\154\132\233\164\140",
	-- CONFIG_MAINTAINBERG_INFO = "If enabled, do not use the bobbing berg item, only maintain it if it is already being used.",
	CONFIG_MAINTAINRAFTBERG_ONOFF = "\229\143\170\231\182\173\230\140\129\229\142\159\230\149\136\230\158\156",
	CONFIG_MAINTAINRAFT_INFO = "\229\166\130\230\158\156\229\149\159\231\148\168\239\188\140\229\176\135\228\184\141\228\189\191\231\148\168\231\171\185\231\173\143\233\129\147\229\133\183\239\188\140\229\131\133\228\191\157\230\140\129\229\183\178\229\149\159\231\148\168\231\171\185\231\173\143\231\154\132\228\189\191\231\148\168\231\139\128\230\133\139",
	CONFIG_MAXSOUND_INFO = "\229\166\130\230\158\156\229\149\159\231\148\168\239\188\140\230\150\188\233\135\163\233\173\154\230\153\130\229\176\135\233\159\179\230\149\136\233\159\179\233\135\143\233\150\139\229\136\176\230\156\128\229\164\167\227\128\130",
	CONFIG_MAXSOUND_ONOFF = "\230\156\128\229\164\167\233\159\179\233\135\143",
	CONFIG_MINIMAPBUTTON_INFO = "\229\156\168\229\176\143\229\156\176\229\156\150\233\161\175\231\164\186\228\184\128\229\128\139 #\229\144\141\231\168\177# \231\154\132\229\156\150\231\164\186",
	CONFIG_MINIMAPBUTTON_ONOFF = "\233\161\175\231\164\186\229\176\143\229\156\176\229\156\150\229\156\150\231\164\186",
	CONFIG_MINIMAPMOVE_INFO = "\229\166\130\230\158\156\229\149\159\229\139\149\239\188\140\229\176\143\229\156\176\229\156\150\229\156\150\231\164\186\229\143\175\228\187\165\230\139\150\230\155\179\231\167\187\229\139\149",
	CONFIG_MINIMAPMOVE_ONOFF = "\229\143\175\230\139\150\230\155\179",
	CONFIG_MOUNTEDCAST_INFO = "\229\166\130\230\158\156\229\149\159\231\148\168\239\188\140\229\133\129\232\168\177\229\156\168\229\157\144\233\168\142\228\184\138\230\150\189\230\179\149",
	CONFIG_MOUNTEDCAST_ONOFF = "\229\156\168\229\157\144\233\168\142\228\184\138",
	CONFIG_MOUSEEVENT_INFO = "\233\187\158\230\147\138\230\187\145\233\188\160\230\140\137\233\136\149\230\139\139\231\171\191",
	CONFIG_MOUSEEVENT_ONOFF = "\228\189\191\231\148\168\233\135\163\233\173\154\230\138\128\232\131\189\230\140\137\233\136\149",
	CONFIG_ONLYMINE_INFO = "\229\166\130\230\158\156\229\149\159\231\148\168\239\188\140\229\191\171\233\128\159\233\135\163\233\173\154\229\131\133\230\156\131\230\170\162\230\159\165\228\189\160\232\163\157\229\130\153\231\154\132\233\173\154\231\171\191",
	CONFIG_ONLYMINE_ONOFF = "\229\131\133\232\163\157\229\130\153\233\173\154\231\171\191",
	CONFIG_OUTFITTER_TEXT = "\232\163\157\229\130\153\230\138\128\232\131\189\231\141\142\229\139\181: %s#BR#Draznar\231\154\132\233\162\168\230\160\188\232\169\149\229\136\134: %d\194\160",
	CONFIG_PARTIALGEAR_INFO = "\229\166\130\230\158\156\229\149\159\231\148\168\239\188\140\229\141\179\228\189\191\230\178\146\230\156\137\232\163\157\229\130\153\233\173\154\231\171\191\239\188\140\229\143\170\232\166\129\232\186\171\228\184\138\231\169\191\232\145\151\228\187\187\228\184\128\229\144\171\233\135\163\233\173\154\229\138\160\230\136\144\231\154\132\232\163\157\229\130\153\229\141\179\230\156\131\228\189\191\231\148\168\233\135\163\233\173\154\230\138\128\232\131\189",
	CONFIG_PARTIALGEAR_ONOFF = "\228\184\141\229\174\140\229\133\168\232\145\151\232\163\157",
	CONFIG_PREVENTRECAST_INFO = "\233\135\163\233\173\154\228\184\173\232\170\191\231\148\168\229\183\168\233\155\134\229\176\135\228\184\141\230\156\131\233\135\141\232\164\135\230\150\189\230\148\190\233\135\163\233\173\154\230\138\128\232\131\189.\232\139\165\233\156\128\232\166\129\230\156\131\233\135\141\228\184\138\233\173\154\233\164\140.",
	CONFIG_PREVENTRECAST_ONOFF = "\233\129\191\229\133\141\233\135\141\232\164\135\228\189\191\231\148\168\233\135\163\233\173\154\230\138\128\232\131\189",
	CONFIG_SHOWLOCATIONZONES_INFO = "\233\161\175\231\164\186\229\141\128\229\159\159\229\146\140\229\137\175\229\141\128\229\159\159\227\128\130",
	CONFIG_SHOWLOCATIONZONES_ONOFF = "\233\161\175\231\164\186\229\141\128\229\159\159",
	CONFIG_SHOWNEWFISHIES_INFO = "\229\156\168\231\149\182\229\137\141\229\156\176\229\141\128\233\135\163\229\136\176\230\150\176\231\154\132\233\173\154\230\153\130\229\156\168\232\129\138\229\164\169\229\141\128\229\159\159\231\153\188\228\184\128\230\162\157\232\168\138\230\129\175",
	CONFIG_SHOWNEWFISHIES_ONOFF = "\233\161\175\231\164\186\230\150\176\231\154\132\233\173\154",
	CONFIG_SHOWPOOLS_INFO = "\229\166\130\230\158\156\229\149\159\231\148\168\239\188\140\229\183\178\231\159\165\233\173\154\233\187\158\229\176\135\233\161\175\231\164\186\230\150\188\229\176\143\229\156\176\229\156\150\227\128\130",
	CONFIG_SHOWPOOLS_ONOFF = "\233\161\175\231\164\186\233\173\154\233\187\158",
	CONFIG_SORTBYPERCENT_INFO = "\228\190\157\231\133\167\233\135\163\229\136\176\231\154\132\233\173\154\231\154\132\230\149\184\233\135\143\230\142\146\229\186\143\233\161\175\231\164\186\230\155\191\228\187\163\229\144\141\231\168\177\230\142\146\229\186\143\227\128\130",
	CONFIG_SORTBYPERCENT_ONOFF = "\228\190\157\231\133\167\230\149\184\233\135\143\229\136\134\233\161\158",
	CONFIG_SPARKLIES_INFO = "\229\166\130\230\158\156\229\149\159\231\148\168\239\188\140\229\156\168\233\135\163\233\173\154\230\153\130\233\173\154\233\187\158\231\154\132\233\150\131\229\133\137\230\143\144\231\164\186\229\176\135\230\156\131\230\155\180\233\161\175\231\156\188",
	CONFIG_SPARKLIES_ONOFF = "\229\162\158\229\188\183\233\173\154\233\187\158\233\161\175\231\164\186",
	CONFIG_STVPOOLSONLY_INFO = "\229\129\135\229\166\130\229\149\159\231\148\168,\232\135\170\229\139\149\230\139\139\231\171\191\229\143\170\230\156\131\229\156\168\230\184\184\230\168\153\229\156\168\233\173\154\231\190\164\231\154\132\230\153\130\229\128\153\229\149\159\231\148\168",
	CONFIG_STVPOOLSONLY_ONOFF = "\229\131\133\229\156\168\233\173\154\231\190\164\232\135\170\229\139\149\230\139\139\231\171\191",
	CONFIG_STVTIMER_INFO = "\229\129\135\229\166\130\229\149\159\231\148\168,\233\161\175\231\164\186\228\184\128\229\128\139\233\135\163\233\173\154\229\164\167\232\179\189\232\168\136\230\153\130\229\153\168\228\184\166\228\184\148\229\128\146\230\149\184\229\137\169\228\184\139\230\153\130\233\150\147",
	CONFIG_STVTIMER_ONOFF = "\233\135\163\233\173\154\229\164\167\232\179\189\232\168\136\230\153\130\229\153\168",
	CONFIG_TOOLTIPS_INFO = "\229\129\135\229\166\130\229\149\159\231\148\168,\230\188\129\231\141\178\232\168\138\230\129\175\232\179\135\232\168\138\230\156\131\233\161\175\231\164\186\229\156\168\231\137\169\229\147\129\230\143\144\231\164\186\228\184\173",
	CONFIG_TOOLTIPS_ONOFF = "\229\156\168\230\143\144\231\164\186\232\163\161\233\161\175\231\164\186\230\188\129\231\141\178\232\168\138\230\129\175",
	CONFIG_TOONMACRO_INFO = "\231\130\186\232\167\146\232\137\178\229\187\186\231\171\139\233\135\163\233\173\154\229\183\168\233\155\134",
	CONFIG_TOONMACRO_ONOFF = "\230\175\143\229\128\139\232\167\146\232\137\178",
	CONFIG_TURNOFFPVP_INFO = "\229\129\135\229\166\130\229\149\159\231\148\168,\231\149\182\228\189\160\232\163\157\229\130\153\233\173\154\231\171\191\230\153\130\230\156\131\229\129\156\231\148\168PVP",
	CONFIG_TURNOFFPVP_ONOFF = "\229\129\156\231\148\168PVP",
	CONFIG_TURNONSOUND_INFO = "\229\166\130\230\158\156\229\149\159\231\148\168\239\188\140\233\135\163\233\173\154\230\153\130\233\159\179\230\149\136\230\176\184\233\129\160\233\150\139\229\149\159\227\128\130",
	CONFIG_TURNONSOUND_ONOFF = "\229\188\183\229\136\182\233\159\179\230\149\136",
	-- CONFIG_TUSKAARSPEAR_INFO = "If enabled, do the complicated dance to use the Tuskaar Spear.",
	CONFIG_USEACTION_INFO = "\229\129\135\229\166\130\229\149\159\231\148\168, #NAME# \230\156\131\230\144\156\229\176\139\229\139\149\228\189\156\229\136\151\228\184\138\231\154\132\230\140\137\233\136\149\228\190\134\230\139\139\231\171\191",
	CONFIG_USEACTION_ONOFF = "\228\189\191\231\148\168\229\139\149\228\189\156\229\136\151",
	CONFIG_WATCHBOBBER_INFO = "\229\166\130\230\158\156\229\149\159\231\148\168\239\188\140\231\149\182\230\187\145\233\188\160\230\184\184\230\168\153\228\189\141\230\150\188\233\135\163\233\173\154\230\181\174\230\168\153\228\184\138\230\153\130 #NAME# \229\176\135\228\184\141\230\156\131\230\150\189\230\148\190\227\128\130",
	CONFIG_WATCHBOBBER_ONOFF = "\229\176\136\230\179\168\233\135\163\233\173\154",
	COPPER_COIN = "\233\138\133\229\185\163",
	CURRENT_HELP = "|c#GREEN#/fb #CURRENT# #RESET#|r#BRSPCS#\233\135\141\231\189\174\233\128\153\230\172\161\233\135\163\233\173\154\230\156\159\233\150\147\231\154\132\231\155\163\232\166\150\229\153\168\232\168\152\233\140\132",
	DERBY = "\230\175\148\232\179\189",
	DESCRIPTION1 = "\231\185\188\231\186\140\232\191\189\232\185\164\228\189\160\233\135\163\233\129\142\231\154\132\233\173\154",
	DESCRIPTION2 = "\229\146\140\231\174\161\231\144\134\228\189\160\231\154\132\233\135\163\233\173\154\232\163\157\229\130\153",
	ELAPSED = "\231\182\147\233\129\142",
	ELDER_CLEARWATER = "\230\184\133\230\176\180\233\149\183\232\128\133\229\164\167\229\150\138: (%a)+ \232\180\143\229\190\151\228\186\134\229\141\161\233\173\175\232\128\182\229\133\139\233\135\163\233\173\154\229\164\167\232\179\189",
	ELEM_WATER = "\229\133\131\231\180\160\228\185\139\230\176\180",
	EXTRAVAGANZA = "\233\135\163\233\173\154\229\164\167\232\179\189",
	FAILEDINIT = "\229\136\157\229\167\139\229\140\150\228\184\141\230\173\163\229\184\184",
	FATLADYSINGS = "|c#RED#%s \233\135\163\233\173\154\229\164\167\232\179\189\229\183\178\231\182\147\233\129\142|r (\229\137\169\233\164\152\230\153\130\233\150\147 %d:%02d)",
	FISH = "Fish",
	FISHINGMODE_HELP = "|c#GREEN#/fb #FISHINGMODE# [\233\150\139\229\167\139|\229\129\156\230\173\162]|r#BRSPCS#Run #NAME# \233\135\163\233\173\154.#BRSPCS#\229\156\168\229\183\168\233\155\134\230\175\148\228\189\191\231\148\168'/cast Fishing'\230\150\185\228\190\191.",
	FISHTYPES = "\233\173\154\231\168\174\239\188\154 %d",
	FLOATING_DEBRIS = "\230\188\130\230\181\174\231\154\132\230\174\152\233\170\184",
	FLOATING_WRECKAGE = "\230\188\130\230\181\174\231\154\132\229\158\131\229\156\190\229\160\134",
	GOLD_COIN = "\233\135\145\229\185\163",
	HIDEINWATCHER = "\229\156\168\231\155\163\231\156\139\228\184\173\233\161\175\231\164\186\230\173\164\233\173\154",
	KEYS_ALT_TEXT = "Alt",
	KEYS_CTRL_TEXT = "Control",
	KEYS_LABEL_TEXT = "\232\188\148\229\138\169\233\141\181\239\188\154",
	KEYS_NONE_TEXT = "\231\132\161",
	KEYS_SHIFT_TEXT = "Shift",
	LAGER = "\232\152\173\229\167\134\232\165\191\232\136\185\233\149\183\231\154\132\230\183\161\229\149\164\233\133\146",
	LEFTCLICKTODRAG = "\229\183\166\233\141\181\233\187\158\233\129\184\230\139\150\230\155\179",
	LOCATIONS_INFO = "\230\160\185\230\147\154\229\141\128\229\159\159\230\136\150\230\152\175\233\173\154\231\168\174\233\161\175\231\164\186\228\189\160\230\155\190\231\182\147\233\135\163\233\129\142\231\154\132\233\173\154",
	LOCATIONS_TAB = "\228\189\141\231\189\174",
	MACRONAME = "\233\135\163\233\173\154\229\138\169\230\137\139",
	MINIMAPBUTTONPLACEMENT = "\230\148\190\231\189\174",
	MINIMAPBUTTONPLACEMENTTOOLTIP = "\229\133\129\232\168\177\228\189\160\229\156\168\229\176\143\229\156\176\229\156\150\230\151\129\231\167\187\229\139\149 #NAME# \229\156\150\231\164\186",
	MINIMAPBUTTONRADIUS = "\232\183\157\233\155\162",
	MINIMAPBUTTONRADIUSTOOLTIP = "\230\177\186\229\174\154 #NAME#\229\176\143\229\156\176\229\156\150\229\156\150\231\164\186\232\183\157\233\155\162\228\184\173\229\191\131\231\154\132\232\183\157\233\155\162",
	MINIMUMSKILL = "\230\156\128\228\189\142\230\137\128\233\156\128\230\138\128\232\131\189\239\188\154 %d",
	NAME = "\233\135\163\233\173\154\229\164\165\228\188\180",
	NOCREATEMACROGLOB = "\231\132\161\230\179\149\230\150\176\229\162\158\233\128\154\231\148\168\231\154\132\229\183\168\233\155\134",
	NOCREATEMACROPER = "\231\132\161\230\179\149\231\130\186\230\175\143\229\128\139\232\167\146\232\137\178\230\150\176\229\162\158\229\183\168\233\155\134",
	NODATAMSG = "\230\178\146\230\156\137\229\143\175\231\148\168\231\154\132\230\188\129\231\141\178\232\179\135\230\150\153",
	NONEAVAILABLE_MSG = "\230\178\146\230\156\137\229\143\175\231\148\168\231\154\132",
	NOREALM = "\230\156\170\231\159\165\228\188\186\230\156\141\229\153\168",
	NOTLINKABLE = "<\231\137\169\229\147\129\231\132\161\230\179\149\233\128\163\231\181\144>",
	OFFSET_LABEL_TEXT = "\229\129\143\231\167\187\239\188\154",
	OIL_SPILL = "\230\178\185\228\186\149",
	OPTIONS_INFO = "\232\168\173\229\174\154 #NAME# \233\129\184\233\160\133",
	OPTIONS_TAB = "\233\129\184\233\160\133",
	OUTFITS = "\232\163\157\229\130\153",
	POINT = "\233\187\158",
	POINTS = "\233\187\158",
	POST_HELP = "\228\189\160\229\143\175\228\187\165\229\156\168\\\"\233\129\184\233\160\133\\\"\231\154\132\\\"\230\140\137\233\141\181\232\168\173\229\174\154\\\"\232\163\161\233\157\162\232\168\173\229\174\154\233\150\139\229\149\159#NAME#\232\166\150\231\170\151\229\143\138\229\136\135\230\143\155\233\135\163\233\173\154\232\163\157\231\154\132\230\140\137\233\141\181",
	PRE_HELP = "\228\189\160\229\143\175\228\187\165\228\189\191\231\148\168 |c#GREEN#/fishingbuddy|r \230\136\150 |c#GREEN#/fb|r \228\190\134\229\159\183\232\161\140\230\137\128\230\156\137\229\145\189\228\187\164#BR#|c#GREEN#/fb|r: \229\159\183\232\161\140\233\135\163\233\173\154\229\138\169\230\137\139,\233\150\139\229\149\159\233\135\163\233\173\154\229\138\169\230\137\139\232\166\150\231\170\151#BR#|c#GREEN#/fb #HELP#|r: \233\161\175\231\164\186\230\156\172\232\168\138\230\129\175",
	RANDOM = "\233\154\168\230\169\159",
	RAW = "Raw",
	RIGGLE_BASSBAIT = "^\230\158\151\230\160\188\194\183\229\183\180\230\150\175\232\178\157\231\137\185 .*: .*! (.*) .*!$",
	RIGHTCLICKFORMENU = "\229\143\179\233\141\181\233\187\158\233\129\184\233\150\139\229\149\159\233\129\184\229\150\174",
	ROLE_ADDON_AUTHORS = "\230\143\146\228\187\182\228\189\156\232\128\133\232\168\187\230\152\142",
	ROLE_HELP_BUGS = "\232\135\173\232\159\178\228\191\174\230\173\163\232\136\135\231\168\139\229\188\143\231\162\188\229\141\148\229\138\169",
	ROLE_HELP_SUGGESTIONS = "\231\137\185\232\137\178\229\138\159\232\131\189\229\187\186\232\173\176",
	ROLE_TRANSLATE_DEDE = "\229\190\183\230\150\135\231\191\187\232\173\175",
	ROLE_TRANSLATE_ESES = "\232\165\191\231\143\173\231\137\153\230\150\135\231\191\187\232\173\175",
	ROLE_TRANSLATE_FRFR = "\230\179\149\230\150\135\231\191\187\232\173\175",
	ROLE_TRANSLATE_ITIT = "\231\190\169\229\164\167\229\136\169\230\150\135\231\191\187\232\173\175",
	ROLE_TRANSLATE_KOKR = "\233\159\147\230\150\135\231\191\187\232\173\175",
	ROLE_TRANSLATE_PTBR = "\229\183\180\232\165\191\232\145\161\230\150\135\231\191\187\232\173\175",
	ROLE_TRANSLATE_RURU = "\228\191\132\230\150\135\231\191\187\232\173\175",
	ROLE_TRANSLATE_ZHCN = "\231\176\161\233\171\148\228\184\173\230\150\135\231\191\187\232\173\175",
	ROLE_TRANSLATE_ZHTW = "\230\173\163\233\171\148\228\184\173\230\150\135\231\191\187\232\173\175",
	SCHOOL = "\233\173\154\231\190\164",
	SHOWFISHIES = "\233\161\175\231\164\186\233\173\154",
	SHOWFISHIES_INFO = "\230\160\185\230\147\154\233\173\154\231\168\174\233\161\175\231\164\186\230\188\129\231\141\178\230\173\183\229\143\178\232\179\135\232\168\138",
	SHOWLOCATIONS = "\228\189\141\231\189\174",
	SHOWLOCATIONS_INFO = "\230\160\185\230\147\154\229\141\128\229\159\159\233\161\175\231\164\186\230\188\129\231\141\178\230\173\183\229\143\178\232\179\135\232\168\138",
	SILVER_COIN = "\233\138\128\229\185\163",
	STVZONENAME = "\232\141\138\230\163\152\232\176\183",
	SWITCH_HELP = "|c#GREEN#/fb #SWITCH#|r#BRSPCS#\231\169\191/\232\132\171\230\188\129\229\133\183 (\229\166\130\230\158\156\230\156\137\229\174\137\232\163\157OutfitDisplayFrame \230\136\150Outfitter\231\154\132\232\169\177)",
	THANKS = "\232\172\157\232\172\157\229\164\167\229\174\182!",
	TIMELEFT = "%s\231\181\144\230\157\159\230\150\188 %d:%02d",
	TIMERRESET_HELP = "|c#GREEN#/fb #TIMER# #RESET#|r#BRSPCS# \233\135\141\231\189\174\233\135\163\233\173\154\229\164\167\232\179\189\232\168\136\230\153\130\229\153\168\239\188\140\229\176\135\229\133\182\231\167\187\232\135\179 #BRSPCS# \232\166\150\231\170\151\228\184\173\229\164\174",
	TIMETOGO = "%s\233\150\139\229\167\139\230\150\188 %d:%02d",
	TOOLTIP_HINT = "\230\143\144\231\164\186\239\188\154",
	TOOLTIP_HINTSWITCH = "\233\187\158\233\129\184\228\190\134\232\174\138\230\143\155\232\163\157\229\130\153",
	TOOLTIP_HINTTOGGLE = "\233\187\158\233\129\184\228\190\134\233\161\175\231\164\186 #NAME# \232\166\150\231\170\151",
	TOOMANYFISHERMEN = "\228\189\160\229\174\137\232\163\157\228\186\134\228\184\141\229\143\170\228\184\128\229\128\139\232\135\170\229\139\149\230\139\139\231\171\191\230\168\161\231\181\132",
	TOTAL = "\231\184\189\230\149\184",
	TOTALS = "\231\184\189\230\149\184",
	UPDATEDB_HELP = "|c#GREEN#/fb #UPDATEDB# [#FORCE#]|r#BRSPCS#\229\152\151\232\169\166\229\176\139\230\137\190\230\137\128\230\156\137\230\136\145\228\184\141\231\159\165\233\129\147\231\154\132\233\173\154\233\161\158\229\144\141\231\168\177#BRSPCS#\229\152\151\232\169\166\232\183\179\233\129\142 '\231\168\128\230\156\137' \233\173\154\233\161\158\229\143\175\232\131\189\230\156\131\228\189\191\228\189\160\230\150\183\231\183\154#BRSPCS#-- '#FORCE#' \233\129\184\233\160\133\229\143\175\228\187\165\232\183\179\233\129\142\230\170\162\230\184\172",
	UPDATEDB_MSG = "\230\155\180\230\150\176 %d \231\168\174\233\173\154\229\144\141\231\168\177",
	WATCHER_HELP = "|c#GREEN#/fb #WATCHER#|r [|c#GREEN##WATCHER_LOCK#|r or |c#GREEN##WATCHER_UNLOCK#|r or |c#GREEN##RESET#|r]#BRSPCS#\232\167\163\233\142\150/\233\142\150\229\174\154/\233\135\141\231\189\174\233\135\163\233\173\154\231\155\163\232\166\150\229\153\168\231\154\132\228\189\141\231\189\174",
	WATCHER_TAB = "\231\155\163\232\166\150\229\153\168",
}