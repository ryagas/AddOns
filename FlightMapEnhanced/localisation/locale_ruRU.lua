if ( GetLocale() ~= "ruRU" ) then
	return;
end
local ns = select( 2, ... );
ns.L = {
	ALT_KEY = "Alt", -- Needs review
	ALWAYS_COLLAPSE = "Всегда сворачивать при открытии", -- Needs review
	CONFIG_BASIC = "Основные параметры", -- Needs review
	CONFIG_CONFIRM_FLIGHT_AUTO = "Спрашивать перед тем, как автоматически начать полет", -- Needs review
	CONFIG_CONFIRM_FLIGHT_MANUAL = "Спрашивать перед тем, как начать полет вручную", -- Needs review
	CONFIG_MODULES = "Модули", -- Needs review
	CONFIG_MODULES_HELP_CAPTION = "Настройка модулей", -- Needs review
	CONFIG_MODULES_HELP_TEXT = "Если вы включили или выключили модуль, вам необходимо перезагрузить интерфейс, чтобы настройки вступили в силу", -- Needs review
	CONFIG_MODULES_WMC_EXPLAIN = "Вы можете кликнуть по карте, и следующая направление полета будет автоматически установлено в ближайшую точку посадки при посещении распорядителя полетов", -- Needs review
	CONFIG_MODULES_WMC_EXPLAIN2 = "Чтобы сбросить выбранное направление полета, кликните иконку на мини-карте и выбирите \"Нет\"", -- Needs review
	CONFIG_MOUDLES_MFM_EXPLAIN = "Этот модуль показывает все неизвестные вам точки назначения", -- Needs review
	CONFIRM_FLIGHT = "Вы действительно хотите отправиться в ", -- Needs review
	CTRL_KEY = "Ctrl", -- Needs review
	DETACH_ADDON_FRAME = "Откреплять окно аддона", -- Needs review
	FLIGHT_FRAME_LOCK = "Зафиксировать окно карты полетов", -- Needs review
	FT_ACCURATE = "Точный", -- Needs review
	FT_CALCULATED = "Вычеляемый", -- Needs review
	FT_CANNOT_FIND_ID = "Не удалось найти следующий id", -- Needs review
	FT_CANNOT_FIND_ID2 = "Пожалуйста, сообщите об этом id", -- Needs review
	FT_CANNOT_FIND_ID_NEW = "Cannot find %s , old id is %s and new id is %s, please report this.", -- Requires localization
	FT_INFO = "Если вы включите обе опции, то по возможности будет показано точное время, иначе оно будет рассчитано примерно", -- Needs review
	FT_MINUTE_SHORT = "м", -- Needs review
	FT_MISSING_HOPS = "Неизвестные точки", -- Needs review
	FT_MODUS = "Режим", -- Needs review
	FT_MOVE = "Shift+Левая кнопка - двигать окно", -- Needs review
	FT_SECOND_SHORT = "с", -- Needs review
	FT_SHOW_ACCURATE_MAP = "Показывать точное время полета для известных точек", -- Needs review
	FT_TIME_LEFT = "Осталось времени", -- Needs review
	FT_USE_ACCURATE_TRACK = "Точный расчет", -- Needs review
	FT_USE_ACCURATE_TRACK_EXPLAIN = "Использование всех возможных комбинаций путей, дающее точное время полета, но приводящее к большому количеству записей обо всех комбинациях, потому что даже полеты по одному и тому же маршруту туда и обратно могут отличаться.", -- Needs review
	FT_USE_FAST_TRACK = "Быстрый расчет", -- Needs review
	FT_USE_FAST_TRACK_EXPLAIN = "Позволяет быстро, но приблизительно рассчитывать время полета на основе данных о самом долгом полете между точками. Это будет не слишком точный расчет из-за того, что время полета по одному и тому же маршруту туда и обратно может отличаться", -- Needs review
	FT_USE_FAST_TRACK_NO_UNUSUAL_SPEED = "Не учитывать быстрое/медленное такси", -- Needs review
	FT_USE_FAST_TRACK_NO_UNUSUAL_SPEED_EXPLAIN = "Если включен режим быстрого расчета, с этой опцией будет учитываться время полета на обычном такси, выдавая приемлемую точность. В большинстве случаем этого вполне достаточно, т.к. быстрые и медленные такси встречаются очень редко.", -- Needs review
	LEFT_BUTTON = "Левая кнопка", -- Needs review
	LOCK_ADDON_FRAME = "Зафиксировать окно аддона", -- Needs review
	MFM_THE_ALDOR = "Алдоры", -- Needs review
	MFM_THE_SCRYERS = "Провидцы", -- Needs review
	MIDDLE_BUTTON = "Средняя кнопка", -- Needs review
	MODIFIER_KEY = "Модификатор", -- Needs review
	MOUSEBUTTON = "Кнопка мыши", -- Needs review
	NEED_VISIT_FLIGHT_MASTER = "Сначала вы должны посетить распорядителя полетов в этой зоне", -- Needs review
	NEED_VISIT_FLIGHT_MASTER_MINIMAP = "Чтобы использовать эту возможность, вы должны открыть карту полетов в этой зоне", -- Needs review
	NEW_FLIGHT_PATH_DISCOVERED_HELP = "Вам известны направления полетов, которых еще нет в базе данных аддона, помогите его улучшить и загрузите данные на сайте http://flightmap.wowuse.com/", -- Needs review
	NEXT_FLIGHT_GOTO = "Следующее направление полета", -- Needs review
	NO = "Нет", -- Needs review
	NO_FLIGHT_LOCATIONS_KNOWN = "Не открыто направление полета на карте", -- Needs review
	NONE = "Нет", -- Needs review
	RIGHT_BUTTON = "Правая кнопка", -- Needs review
	SHIFT_KEY = "Shift", -- Needs review
	SHOW_MINIMAP_BUTTON = "Показывать кнопку на мини-карте", -- Needs review
	TOOLTIP_FLIGHTMAP_COLLAPSE = "Поставьте галочку для сворачивания всех зон при открытии карты полетов", -- Needs review
	TOOLTIP_LINE1_MINIMAP = "Правая кнопка - двигать иконку", -- Needs review
	TOOLTIP_LINE2_MINIMAP = "Левая кнопка - выбрать следующее направление полета", -- Needs review
	WMC_MODIFIER_SETTINGS = "Установите комбинацию клавиши и кнопки мыши, для выбора ближайшей точки назанчения", -- Needs review
	WMC_SHOW_ON_MINIMAP = "Показывать ближайшего к вашему местоположению распорядителя полетов на мини-карте при клике на карте мира", -- Needs review
	YES = "Да", -- Needs review
}


--[===[@debug@ 
{}
--@end-debug@]===]