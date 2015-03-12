if ( GetLocale() ~= "deDE" ) then
	return;
end
local ns = select( 2, ... );
ns.L = {
	ALT_KEY = "Alt",
	ALWAYS_COLLAPSE = "Immer einklappen beim Anzeigen",
	CONFIG_BASIC = "Basis Optionen",
	CONFIG_CONFIRM_FLIGHT_AUTO = "Automatische Flüge vorher bestätigten",
	CONFIG_CONFIRM_FLIGHT_MANUAL = "Manuelle Flüge vorher bestätigen",
	CONFIG_MODULES = "Module",
	CONFIG_MODULES_HELP_CAPTION = "Modul Konfiguration",
	CONFIG_MODULES_HELP_TEXT = "Wenn du ein Modul aktivierst/deaktivierst musst du die UI neu laden damit die Änderungen aktiv werden.",
	CONFIG_MODULES_WMC_EXPLAIN = "Du kannst auf die Weltkarte klicken und dein nächstes Flugziel ist der naheste Flugpunkt und wird automatisch angeflogen beim nächsten Besuch eines Flugmeisters.",
	CONFIG_MODULES_WMC_EXPLAIN2 = "Um den ausgewählten Flugpunkt zurückzusetzen, klicke auf dem Minimap Button und wähle Keinen.",
	CONFIG_MOUDLES_MFM_EXPLAIN = "Dieses Modul zeigt auf der Weltkarte alle Flugmeister die dir noch fehlen",
	CONFIRM_FLIGHT = "Willst du wirklich nach %s fliegen?",
	CTRL_KEY = "Strg",
	DETACH_ADDON_FRAME = "Addon Fenster lösen",
	FLIGHT_FRAME_LOCK = "Flugkarten Fenster sperren",
	FT_ACCURATE = "Akkurat",
	FT_CALCULATED = "Berechnet",
	FT_CANNOT_FIND_ID = "Kann die folgende ID nicht finden",
	FT_CANNOT_FIND_ID2 = "Bitte melde diese ID",
	FT_CANNOT_FIND_ID_NEW = "Cannot find %s , old id is %s and new id is %s, please report this.", -- Requires localization
	FT_INFO = "Wenn du beide Optionen nutzt wird wenn möglich die akkurate Zeit angegeben, wenn nicht wird Zeit vom schnellen Tracking genutzt.",
	FT_MINUTE_SHORT = "m",
	FT_MISSING_HOPS = "Missing hops", -- Requires localization
	FT_MODUS = "Modus",
	FT_MOVE = "Shift+Linksklick um das Fenster zu bewegen",
	FT_SECOND_SHORT = "s",
	FT_SHOW_ACCURATE_MAP = "Zeige akkurate Flugzeiten, wenn bekannt, auf der Flugkarte an", -- Needs review
	FT_TIME_LEFT = "Zeit übrig",
	FT_USE_ACCURATE_TRACK = "Akkurates Tracking",
	FT_USE_ACCURATE_TRACK_EXPLAIN = "With this enabled every possible flight combination will be tracked, resulting in accurate times, but will take long to record all possible combination. This is due even flying the same flight path forth and back can be different and there are just alot of combinations.", -- Requires localization
	FT_USE_FAST_TRACK = "Schnelles Tracking",
	FT_USE_FAST_TRACK_EXPLAIN = "This allows to track flight times fast, with the withdraw of not being accurate, this is done by tracking on longer flight every hop, that it wont be accurate is due the fact that the flight usually is different if you just pass a flight point or end the flight there", -- Requires localization
	FT_USE_FAST_TRACK_NO_UNUSUAL_SPEED = "Schnelle/langsame Taxis nicht tracken",
	FT_USE_FAST_TRACK_NO_UNUSUAL_SPEED_EXPLAIN = "If fast tracking is activated with this option on it will only track times with normal taxi speed resulting in more accurate times in most cases, the slow/fast taxis are very rare.", -- Requires localization
	LEFT_BUTTON = "Links",
	LOCK_ADDON_FRAME = "Addon Fenster sperren",
	MFM_THE_ALDOR = "Die Aldor",
	MFM_THE_SCRYERS = "Die Seher",
	MIDDLE_BUTTON = "Mittlere",
	MODIFIER_KEY = "Modifizierer Taste",
	MOUSEBUTTON = "Maustaste",
	NEED_VISIT_FLIGHT_MASTER = "Du musst erst einen Flugmeister auf diesem Kontinent besuchen",
	NEED_VISIT_FLIGHT_MASTER_MINIMAP = "Du musst erst einmal die Flugkarte öffnen auf diesem Kontinent bevor du die Funktion nutzen kannst",
	NEW_FLIGHT_PATH_DISCOVERED_HELP = "Du hast gerade einen Flugpunkt entdeckt der noch nicht in der Addon Datenbank vorhanden ist, helf die bekannten Flugpunkt Koordinaten zu vervollständigen und lade deine Daten auf http://flightmap.wowuse.com/ hoch.",
	NEXT_FLIGHT_GOTO = "Nächster Flug geht nach",
	NO = "Nein",
	NO_FLIGHT_LOCATIONS_KNOWN = "Keine bekannten Flugpunkte für diese Karte",
	NONE = "Keinen",
	RIGHT_BUTTON = "Rechts",
	SHIFT_KEY = "Shift",
	SHOW_MINIMAP_BUTTON = "Zeige Minikarten Button",
	TOOLTIP_FLIGHTMAP_COLLAPSE = "Wenn ausgewählt werden alle Zonen eingeklappt beim öffnen der Flugkarte",
	TOOLTIP_LINE1_MINIMAP = "Rechtsklick um den Minikarten Button zu bewegen",
	TOOLTIP_LINE2_MINIMAP = "Linksklick zum auswählen des nächsten Flugziels",
	WMC_MODIFIER_SETTINGS = "Wähle die Tasten und Maus Kombination aus um den nahesten Flugpunkt zu wählen",
	WMC_SHOW_ON_MINIMAP = "Zeige den nächsten Flugmeister auf der Minikarte an, von der Position aus an an der du bist beim klicken auf der Weltkarte",
	YES = "Ja",
}


--[===[@debug@ 
{}
--@end-debug@]===]
