﻿if GetLocale() == "ruRU" then
	Outfitter.cTitle = "Outfitter"
	Outfitter.cTitleVersion = Outfitter.cTitle.." "..Outfitter.cVersion

	Outfitter.cSingleItemFormat = "%s"
	Outfitter.cTwoItemFormat = "%s и %s"
	Outfitter.cMultiItemFormat = "%s{{, %s}} и %s"

	Outfitter.cNameLabel = "Название:"
	Outfitter.cCreateUsingTitle = "Сделать под:"
	Outfitter.cUseCurrentOutfit = "Использвать текущий комплект"
	Outfitter.cUseEmptyOutfit = "Создать пустой комплект"
	Outfitter.cAutomationLabel = "Авто:"

	Outfitter.cOutfitterTabTitle = "Комплекты"
	Outfitter.cOptionsTabTitle = "Настройки"
	Outfitter.cAboutTabTitle = "О моде"

	Outfitter.cNewOutfit = "Новый комплект"
	Outfitter.cRenameOutfit = "Переименовать комплект"

	Outfitter.cCompleteOutfits = "Полные комплекты"
	Outfitter.cAccessoryOutfits = "Аксессуары"
	Outfitter.cOddsNEndsOutfits = "Всякая всячина"

	Outfitter.cGlobalCategory = "Специальные комплекты"
	Outfitter.cNormalOutfit = "Обычный"
	Outfitter.cNakedOutfit = "Парадный комплект"

	Outfitter.cScriptCategoryName = {}
	Outfitter.cScriptCategoryName.PVP = "Игрок против игрока"
	Outfitter.cScriptCategoryName.TRADE = "Активные"
	Outfitter.cScriptCategoryName.GENERAL = "Основные"
	Outfitter.cScriptCategoryName.QUEST = "Под задания"
	Outfitter.cScriptCategoryName.ENTERTAIN = "Развлечение"

	Outfitter.cArgentDawnOutfit = "Серебрянный Рассвет"
	Outfitter.cCityOutfit = "Недалеко от города"
	Outfitter.cBattlegroundOutfit = "Поля боёв"
	Outfitter.cAVOutfit = "Поле боя: Альтеракская долина"
	Outfitter.cABOutfit = "Поле боя: Низина Арати"
	Outfitter.cArenaOutfit = "Поле боя: Арена"
	Outfitter.cEotSOutfit = "Поле боя: Око Бури"
	Outfitter.cWSGOutfit = "Поле боя: Ущелье Песни Войны"
	Outfitter.cSotAOutfit = "Поле боя: Берег Древних"
	Outfitter.cIoCOutfit = "Поле боя: Остров Завоеваний"
	Outfitter.cWintergraspOutfit = "Поле боя: Wintergrasp"
	Outfitter.cSewersOutfit = "Поле боя: Dalaran Sewers"
	Outfitter.cGilneasOutfit = "Поле боя: Battle for Gilneas"
	Outfitter.cTwinPeaksOutfit = "Поле боя: Twin Peaks"
	Outfitter.cDiningOutfit = "Еда"
	Outfitter.cFishingOutfit = "Рыбная ловля"
	Outfitter.cHerbalismOutfit = "Травничество"
	Outfitter.cMiningOutfit = "Горное дело"
	Outfitter.cFireResistOutfit = "Сопротивление: Огонь"
	Outfitter.cNatureResistOutfit = "Сопротивление: Силы природы"
	Outfitter.cShadowResistOutfit = "Сопротивление: Темная магия"
	Outfitter.cArcaneResistOutfit = "Сопротивление: Тайная магия"
	Outfitter.cFrostResistOutfit = "Сопротивление: Магия льда"
	Outfitter.cRidingOutfit = "Верховая езда"
	Outfitter.cSkinningOutfit = "Снятие шкур"
	Outfitter.cSwimmingOutfit = "Плавание"
	Outfitter.cLowHealthOutfit = "Мало здоровья или маны"
	Outfitter.cHasBuffOutfit = "Игрок имеет бафф"
	Outfitter.cHasDebuffOutfit = "Игрок имеет дебафф"
	Outfitter.cInZonesOutfit = "В зонах"
	Outfitter.cSoloOutfit = "Соло/Группа/Рейд"
	Outfitter.cFallingOutfit = "Падение"
	Outfitter.cPvPFlaggedOutfit = "В ПвП"
	Outfitter.cInDungeonOutfit = "В подземельях"
	Outfitter.cArgentTournamentOutfit = "Серебряный Турнир"
	Outfitter.cMultiphaseSurveyOutfit = "Мультифазовый подход"
	Outfitter.cSpellcastOutfit = "Заклинатель"
	Outfitter.cRestingOutfit = "Отдыхая"
	Outfitter.cFlameLeviathanOutfit = "Огненный Левиафан"

	Outfitter.cArgentDawnOutfitDescription = "Одевает комплект, когда вы находитесь в Чумных землях"
	Outfitter.cRidingOutfitDescription = "Одевает комплект для верховой езды"
	Outfitter.cDiningOutfitDescription = "Одевает комплект, когда вы едите или пьете, а ваши здоровье/жизнь ниже 90%"
	Outfitter.cBattlegroundOutfitDescription = "Одевает комплект, когда вы находитесь на боевых площадках"
	Outfitter.cArathiBasinOutfitDescription = "Одевает комплект, когда вы находитесь на боевой площадке Низина Арати"
	Outfitter.cAlteracValleyOutfitDescription = "Одевает комплект, когда вы находитесь на боевой площадке Альтеракская долина"
	Outfitter.cWarsongGulchOutfitDescription = "Одевает комплект, когда вы находитесь на боевой площадке Ущелье Песни Войны"
	Outfitter.cEotSOutfitDescription = "Одевает комплект, когда вы находитесь на Око Бури"
	Outfitter.cSotAOutfitDescription = "Одевает комплект, когда вы находитесь на Береге Древних"
	Outfitter.cIoCOutfitDescription = "Одевает комплект, когда вы находитесь на Острове Завоеваний"
	Outfitter.cArenaOutfitDescription = "Одевает комплект, когда вы находитеть на арене"
	Outfitter.cCityOutfitDescription = "Одевает комплект, когда вы находитесь в одном из дружественных главных городов"
	Outfitter.cSwimmingOutfitDescription = "Одевает комплект для плавания"
	Outfitter.cFishingOutfitDescription = "Снимает комплект при входе в бой и одевает, когда бой заканчивается"
	Outfitter.cSpiritOutfitDescription = "Одевает комплект, когда вы регенереруете ману (правило пяти секунд)"
	Outfitter.cHerbalismDescription = "Одевает комплект, когда курсор наведен на траву для добычи , и умений недостаточно"
	Outfitter.cMiningDescription = "Одевает комплект, когда курсор наведен на жилу для добычи , и умений недостаточно"
	Outfitter.cLockpickingDescription = "Одевает комплект, когда курсор наведен на замок для вскрытия, и умений недостаточно"
	Outfitter.cSkinningDescription = "Одевает комплект, когда курсор наведен на животное, предназначенное для освежевания, и умений недостаточно"
	Outfitter.cLowHealthDescription = "Одевает комплект, когда ваше здоровье или мана на определенном уровне"
	Outfitter.cHasBuffDescription = "Одевает комплект, в зависимости от баффа с заданным название"
	Outfitter.cHasDebuffDescription = "Одевает комплект, в зависимости от дебаффа с заданным название"
	Outfitter.SpiritRegenOutfitDescription = "Одевает комплект, когда вы регенереруете ману (правило пяти секунд)"
	Outfitter.cDruidCasterFormDescription = "Одевает комплект, когда вы ни в одной из форм друида"
	Outfitter.cPriestShadowformDescription = "Одевает комплект, когда вы находитесь в Теневом облике"
	Outfitter.cShamanGhostWolfDescription = "Одевает комплект, когда вы находитесь в облике Призрачного волка"
	Outfitter.cHunterMonkeyDescription = "Одевает комплект, когда вы обращаетесь к Духу обезьяны"
	Outfitter.cHunterHawkDescription = "Одевает комплект, когда вы обращаетесь к Духу ястреба"
	Outfitter.cHunterCheetahDescription = "Одевает комплект, когда вы обращаетесь к Духу гепарда"
	Outfitter.cHunterPackDescription = "Одевает комплект, когда вы обращаетесь к Дух стаи"
	Outfitter.cHunterBeastDescription = "Одевает комплект, когда вы обращаетесь к Духу зверя"
	Outfitter.cHunterWildDescription = "Одевает комплект, когда вы обращаетесь к Духу дикой природы"
	Outfitter.cHunterViperDescription = "Одевает комплект, когда вы обращаетесь к Духу гадюки"
	Outfitter.cHunterDragonhawkDescription = "Equips the outfit when you are in Духе дракондора"
	Outfitter.cHunterFeignDeathDescription = "Одевает комплект, когда вы притворяетесь мёртвым"
	Outfitter.cMageEvocateDescription = "Одевает комплект, когда вы применяете Прилив сил"
	Outfitter.cWarriorBerserkerStanceDescription = "Одевает комплект, когда вы находитесь в стойке берсерка"
	Outfitter.cWarriorDefensiveStanceDescription = "Одевает комплект, когда вы находитесь в оборонительной стойке"
	Outfitter.cWarriorBattleStanceDescription = "Одевает комплект, когда вы находитесь в боевой стойке"
	Outfitter.cInZonesOutfitDescription = "Одевает комплект, когда вы находитесь в одной из зон на мини-карте, представленных ниже"
	Outfitter.cSoloOutfitDescription = "Одевает комплект для соло, группы или рейда, в зависимости от настроек"
	Outfitter.cFallingOutfitDescription = "Одевает комплект, когда вы падаете"
	Outfitter.cPvPFlaggedDescription = "Одевает комплект, когда вы доступны для ПвП"
	Outfitter.cInDungeonDescription = "Одевает комплект, когда вы находитесь в подземелье, рейде, или поле сражений, пологаясь на установки"
	Outfitter.cArgentTournamentOutfitDescription = "Одевает комплект, когда наводите мышь на верховое животное Серебряного Турнира, снимает когда спешиваетесь с верхового животного"
	Outfitter.cRestingOutfitDescription = "Одевает комплект, когда вы находитесь в таверне"
	Outfitter.cFlameLeviathanOutfitDescription = "Одевает комплект, когда вы садитесь в транспорт на Огненный Левиафан, снимает когда вы выходите и заканчивается бой"

	Outfitter.cMountSpeedFormat = "Увеличение скорости ездового животного на (%d+)%%%."; -- For detecting when mounted
	Outfitter.cFlyingMountSpeedFormat = "Скорость полета увеличена на (%d+)%%%."; -- For detecting when mounted

	Outfitter.cBagsFullError = "Не могу снять %s, так как сумки заполнены"
	Outfitter.cDepositBagsFullError = "Не могу поместить %s в банк, так как в банке нет места"
	Outfitter.cWithdrawBagsFullError = "Не могу взять %s, так как сумки заполнены"
	Outfitter.cItemNotFoundError = "Не могу найти %s"
	Outfitter.cItemAlreadyUsedError = "Не могу поместить %s в ячейку %s, потому что предмет уже используется в другой ячейке"
	Outfitter.cAddingItem = "Предмет %s добавлен к комплекту %s"
	Outfitter.cNameAlreadyUsedError = "Ошибка: Имя уже используется"
	Outfitter.cNoItemsWithStatError = "Предупрежение: Ни одна из ваших вещей не имеет этих атрибутов"
	Outfitter.cCantUnequipCompleteError = "Не могу снять %s потому что полные комплекты не могут быть сняты целиком (вы должны одеть другой полный комплект)"

	Outfitter.cEnableAll = "Включить все"
	Outfitter.cEnableNone = "Отключить все"

	Outfitter.cConfirmDeleteMsg = "Вы правда хотите удалить комплект %s?"
	Outfitter.cConfirmRebuildMsg = "Вы правда хотите перестроить комплект %s?"
	Outfitter.cRebuild = "Перестроить"

	Outfitter.cSilverwingHold = "Крепость Среброкрылых"
	Outfitter.cWarsongLumberMill = "Лесопилка Песни Войны"

	Outfitter.cTotalStatsName = "Общие показатели"
	Outfitter.cItemLevelName = "Уровень предмета"

	Outfitter.cCombatManaRegenStatName = "Мана в 5 (бой)"
	Outfitter.cCombatHealthRegenStatName = "Здоровье в 5 (бой)"

	Outfitter.cOptionsTitle = "Настройки"
	Outfitter.cShowMinimapButton = "Иконка на мини-карте"
	Outfitter.cShowMinimapButtonOnDescription = "Отлючичите, если не хотите видеть иконку Outfitter на мини-карте"
	Outfitter.cShowMinimapButtonOffDescription = "Включие, если хотите видеть иконку Outfitter на мини-карте"
	Outfitter.cAutoSwitch = "Отключить авто-смены"
	Outfitter.cAutoSwitchOnDescription = "Включите, если не хотите автоматической смены комплектов"
	Outfitter.cAutoSwitchOffDescription = "Отключите, если хотите автоматическую смену комплектов"
	Outfitter.cTooltipInfo = "'Используется:' в описании вещи"
	Outfitter.cTooltipInfoOnDescription = "Выключите, если не хотите видеть 'Используется:' в описании вещи или у вас проблемы с просмотром вещей"
	Outfitter.cTooltipInfoOffDescription = "Включите, если хотите видеть 'Используется:' в описании вещи"
	Outfitter.cItemComparisons = "Сравнение предметов"
	Outfitter.cItemComparisonsOnDescription = "Turn this off to only include your equipped items in item comparisons"
	Outfitter.cItemComparisonsOffDescription = "Turn this on to include items from your outfits in tooltip item comparisons"
	Outfitter.cOutfitDisplay = "Outfit display"
	Outfitter.cShowHotkeyMessages = "Сообщения о смене комплекта"
	Outfitter.cShowHotkeyMessagesOnDescription = "Отключите, если не хотите Показывать сообщения о смене комплекта по клавиатурным привязкам"
	Outfitter.cShowHotkeyMessagesOffDescription = "Включите, если хотите показывать сообщения о смене комплекта по клавиатурным привязкам"
	Outfitter.cShowOutfitBar = "Показывать комплект-панель"
	Outfitter.cShowOutfitBarDescription = "Показывает комплект-панель Outfitter с клавишами всех комплектов"
	Outfitter.cEquipOutfitMessageFormat = "Outfitter: %s одет"
	Outfitter.cUnequipOutfitMessageFormat = "Outfitter: %s снят"

	Outfitter.cAboutTitle = "Об Outfitter"
	Outfitter.cAuthor = "Designed and written by John Stephen with contributions by %s"
	Outfitter.cTestersTitle = "Outfitter тестеры"
	Outfitter.cTestersNames = "%s"
	Outfitter.cSpecialThanksTitle = "Специальное спасибо"
	Outfitter.cSpecialThanksNames = "%s"
	Outfitter.cTranslationCredit = "Переводы %s"
	Outfitter.cURL = "wobbleworks.com"

	Outfitter.cOpenOutfitter = "Открыть Outfitter"

	Outfitter.cKeyBinding = "Клавиатурные привзяки"

	BINDING_HEADER_OUTFITTER_TITLE = Outfitter.cTitle
	BINDING_NAME_OUTFITTER_OUTFIT = "Открыть Outfitter"

	BINDING_NAME_OUTFITTER_OUTFIT1  = "Комплект 1"
	BINDING_NAME_OUTFITTER_OUTFIT2  = "Комплект 2"
	BINDING_NAME_OUTFITTER_OUTFIT3  = "Комплект 3"
	BINDING_NAME_OUTFITTER_OUTFIT4  = "Комплект 4"
	BINDING_NAME_OUTFITTER_OUTFIT5  = "Комплект 5"
	BINDING_NAME_OUTFITTER_OUTFIT6  = "Комплект 6"
	BINDING_NAME_OUTFITTER_OUTFIT7  = "Комплект 7"
	BINDING_NAME_OUTFITTER_OUTFIT8  = "Комплект 8"
	BINDING_NAME_OUTFITTER_OUTFIT9  = "Комплект 9"
	BINDING_NAME_OUTFITTER_OUTFIT10 = "Комплект 10"

	BINDING_NAME_OUTFITTER_ENABLEAUTOMATION = "Вкл авто смену"
	BINDING_NAME_OUTFITTER_DISABLEAUTOMATION = "Выкл авто смену"

	Outfitter.cShow = "Показать"
	Outfitter.cHide = "Скрыть"
	Outfitter.cDontChange = "Не менять"

	Outfitter.cHelm = "Головной убор"
	Outfitter.cCloak = "Плащ"
	Outfitter.cPlayerTitle = "Титул"

	Outfitter.cMore = "Еще"

	Outfitter.cAutomation = "Авто"

	Outfitter.cDisableOutfit = "Отключить"
	Outfitter.cDisableAlways = "Всегда"
	Outfitter.cDisableOutfitInBG = "На боевых площадках"
	Outfitter.cDisableOutfitInCombat = "Отключено пока в бою"
	Outfitter.cDisableOutfitInAQ40 = "В храме Ан'Кираж"
	Outfitter.cDisableOutfitInNaxx = "В Наксрамасе"
	Outfitter.cDisabledOutfitName = "%s (Отключено)"

	Outfitter.cOutfitBar = "Комплект-панель"
	Outfitter.cShowInOutfitBar = "Показывать в комплект-панели"
	Outfitter.cChangeIcon = "Выбрать иконку..."

	Outfitter.cMinimapButtonTitle = "Значек Outfitter на мини-карте"
	Outfitter.cMinimapButtonDescription = "Щелкните для выбора различных комплектов или тяните для перестаскивания иконки."

	Outfitter.cClassName = {}
	Outfitter.cClassName.DRUID = "Друид"
	Outfitter.cClassName.HUNTER = "Охотник"
	Outfitter.cClassName.MAGE = "Маг"
	Outfitter.cClassName.PALADIN = "Паладин"
	Outfitter.cClassName.PRIEST = "Жрец"
	Outfitter.cClassName.ROGUE = "Разбойник"
	Outfitter.cClassName.SHAMAN = "Шаман"
	Outfitter.cClassName.WARLOCK = "Чернокнижник"
	Outfitter.cClassName.WARRIOR = "Воин"

	Outfitter.cBattleStance = "Боевая стойка"
	Outfitter.cDefensiveStance = "Оборонительная стойка"
	Outfitter.cBerserkerStance = "Стойка берсерка"

	Outfitter.cWarriorBattleStance = "Воин: Боевая стойка"
	Outfitter.cWarriorDefensiveStance = "Воин: Оборонительная стойка"
	Outfitter.cWarriorBerserkerStance = "Воин: Стойка берсерка"

	Outfitter.cDruidCasterForm = "Друид: форма гуманоида"
	Outfitter.cDruidBearForm = "Друид: Облик медведя"
	Outfitter.cDruidCatForm = "Друид: Облик кошки"
	Outfitter.cDruidAquaticForm = "Друид: Водный облик"
	Outfitter.cDruidTravelForm = "Друид: Походный облик"
	Outfitter.cDruidMoonkinForm = "Друид: Облик лунного совуха"
	Outfitter.cDruidFlightForm = "Друид: Облик птицы"
	Outfitter.cDruidSwiftFlightForm = "Друид: Быстрый воздушный облик"
	Outfitter.cDruidTreeOfLifeForm = "Друид: Древо Жизни"
	Outfitter.cDruidProwl = "Друид: Крадущийся зверь"
	Outfitter.cProwl = "Крадущийся зверь"

	Outfitter.cPriestShadowform = "Жрец: Облик Тьмы"

	Outfitter.cRogueStealth = "Разбойник: Незаметность"
	Outfitter.cLockpickingOutfit = "Разбойник: Взлом замка"

	Outfitter.cShamanGhostWolf = "Шаман: Призрачный волк"

	Outfitter.cHunterMonkey = "Охотник: Дух обезьяны"
	Outfitter.cHunterHawk =  "Охотник: Дух ястреба"
	Outfitter.cHunterCheetah =  "Охотник: Дух гепарда"
	Outfitter.cHunterPack =  "Охотник: Дух стаи"
	Outfitter.cHunterBeast =  "Охотник: Дух зверя"
	Outfitter.cHunterWild =  "Охотник: Дух дикой природы"
	Outfitter.cHunterViper = "Охотник: Дух гадюки"
	Outfitter.cHunterDragonhawk = "Охотник: Дух дракондора"
	Outfitter.cHunterFeignDeath = "Охотник: Притвориться мертвым"

	Outfitter.cMageEvocate = "Маг: Прилив сил"

	Outfitter.cDeathknightBlood = "Рыцарь смерти: Власть крови"
	Outfitter.cDeathknightFrost = "Рыцарь смерти: Власть льда"
	Outfitter.cDeathknightUnholy = "Рыцарь смерти: Власть нечестивости"

	Outfitter.cMonkTiger = "Monk: Tiger stance"
	Outfitter.cMonkSerpent = "Monk: Serpent stance"
	Outfitter.cMonkOx = "Monk: Ox stance"

	Outfitter.cCompleteCategoryDescription = "Полные комплекты занимают все ячейки на персонаже. При смене любого комплекта на этот - все вещи переодеваются."
	Outfitter.cAccessoryCategoryDescription = "Аксессуары - это неполные комплекты. Вы можете одевать сразу несколько комплектов акксесуаров"
	Outfitter.cOddsNEndsCategoryDescription = "Всякая всячина - это предметы, которых нет ни в одном комплекте."

	Outfitter.cRebuildOutfitFormat = "Перестроить для %s"
	Outfitter.cRebuildFor = "Перестроить для..."

	Outfitter.cSlotEnableTitle = "Использовать ячейку"
	Outfitter.cSlotEnableDescription = "Выберите, если хотите включить данный предмет в текущий комплект. Если предмет не выбран, комплект не изменится при смене."

	Outfitter.cFinger0SlotName = "Первый палец"
	Outfitter.cFinger1SlotName = "Второй палец"

	Outfitter.cTrinket0SlotName = "Первый аксессуар"
	Outfitter.cTrinket1SlotName = "Второй аксессуар"

	Outfitter.cOutfitCategoryTitle = "Категория"
	Outfitter.cBankCategoryTitle = "Банк"
	Outfitter.cDepositToBank = "Положить все предметы в банк"
	Outfitter.cDepositUniqueToBank = "Положить предметы в банк по одному"
	Outfitter.cDepositOthersToBank = "Положить другое снарежение в банк"
	Outfitter.cWithdrawFromBank = "Забрать предметы из банка"
	Outfitter.cWithdrawOthersFromBank = "Забрать другое снарежение из банка"

	Outfitter.cMissingItemsLabel = "Отстутствующие предметы: "
	Outfitter.cBankedItemsLabel = "Предметы из банка: "

	Outfitter.cResistCategory = "Сопротивления"
	Outfitter.cTradeCategory = "Умения"

	Outfitter.cTankPoints = "ОчкиТанка"
	Outfitter.cCustom = "Настройка"

	Outfitter.cScriptFormat = "Скрипт (%s)"
	Outfitter.cScriptSettings = "Настройки..."
	Outfitter.cNoScript = "Пусто"
	Outfitter.cDisableScript = "Отключено"
	Outfitter.cDisableIn = "Отключено"
	Outfitter.cEditScriptTitle = "Скрипт для комплекта %s"
	Outfitter.cEditScriptEllide = "Свой..."
	Outfitter.cEventsLabel = "События:"
	Outfitter.cScriptLabel = "Скрипт:"
	Outfitter.cSetCurrentItems = "Обновить на текущие предметы"
	Outfitter.cConfirmSetCurrentMsg = "Вы правда хотите обновить комплект %s, используюя текущие предметы? Примечание: только включенные ячейки будут обновлены"
	Outfitter.cSetCurrent = "Обновить"
	Outfitter.cTyping = "Идет набор текста..."
	Outfitter.cScriptErrorFormat = "Ошибка на строке %d: %s"
	Outfitter.cExtractErrorFormat = "%[string \"Outfit Script\"%]:(%d+):(.*)"
	Outfitter.cPresetScript = "Скрипт по умолчанию:"
	Outfitter.cCustomScript = "Свой"
	Outfitter.cSettings = "Настройки"
	Outfitter.cSource = "Источник"
	Outfitter.cInsertFormat = "<- %s"

	Outfitter.cNone = "Пусто"
	Outfitter.cTooltipMultibuffSeparator1 = " и "
	Outfitter.cTooltipMultibuffSeparator2 = " / "
	Outfitter.cNoScriptSettings = "Нет настроек для этого скрипта."
	Outfitter.cMissingItemsSeparator = ", "
	Outfitter.cUnequipOthers = "При смене снимать другие комплекты Акссесуаров"

	Outfitter.cConfirmResetMsg = "Вы правда хотите обнулить настройки Outfitter для этого персонажа?  Все комплекты будут удалены и созданы по умолчанию."
	Outfitter.cReset = "Сбросить"

	Outfitter.cIconFilterLabel = "Поиск:"
	Outfitter.cIconSetLabel = "Иконки:"

	Outfitter.cCantReloadUI = "Вам необходимо перезапустить WoW для обновления Outfitter"
	Outfitter.cChooseIconTitle = "Выберите иконку для комплекта %s"
	Outfitter.cOutfitterDecides = "Outfitter выбрал иконку за Вас"

	Outfitter.cSuggestedIcons = "Предложенные иконки"
	Outfitter.cSpellbookIcons = "Ваши заклинания"
	Outfitter.cYourItemIcons = "Ваши сумки"
	Outfitter.cEveryIcon = "Все иконки"
	Outfitter.cItemIcons = "Все иконки (предметы)"
	Outfitter.cAbilityIcons = "Все иконки (заклинания)"

	Outfitter.cRequiresLockpicking = "Требуется Взлом замка"
	Outfitter.cUseTooltipLineFormat = "^Использование:.*"
	Outfitter.cUseDurationTooltipLineFormat = "^Использование:.*на (%d+) сек."
	Outfitter.cUseDurationTooltipLineFormat2 = "^Использование:.*Время действия (%d+) сек."

	Outfitter.cOutfitBarSizeLabel = "Размер"
	Outfitter.cOutfitBarSmallSizeLabel = "Мал"
	Outfitter.cOutfitBarLargeSizeLabel = "Бол"
	Outfitter.cOutfitBarAlphaLabel = "Прозрачность"
	Outfitter.cOutfitBarCombatAlphaLabel = "Прозрачность в бою"
	Outfitter.cOutfitBarVerticalLabel = "Вертикально"
	Outfitter.cOutfitBarLockPositionLabel = "Заблокировать"
	Outfitter.cOutfitBarHideBackgroundLabel = "Убрать фон"

	Outfitter.cPositionLockedError = "Комплект-панель заблокирована и не может быть перемещена"

	Outfitter.cMustBeAtBankError = "Вы должны открыть свой банк для отчета по пропавшим предметам"
	Outfitter.cMissingItemReportIntro = "Пропавшие предметы (если один и тотже предмет использовался в разных комплектах,то он будет показан в отчете несколько раз):"
	Outfitter.cNoMissingItems = "Все предметы на месте"

	Outfitter.cAutoChangesDisabled = "Автоматическая смена отключена"
	Outfitter.cAutoChangesEnabled = "Автоматическая смена включена"

	-- OutfitterFu strings

	Outfitter.cFuHint = "[Левый-клик] - открывает/закрывает окно Outfitterа."
	Outfitter.cFuHideMissing = "Скрыть отстутствующие"
	Outfitter.cFuHideMissingDesc = "Скрывает комплекты с отстутствующими предметами."
	Outfitter.cFuRemovePrefixes = "Удалить префикс"
	Outfitter.cFuRemovePrefixesDesc = "Удаляет префик названий комплектов для сокращать отображаемого текста в FuBarе."
	Outfitter.cFuMaxTextLength = "Max длина текста"
	Outfitter.cFuMaxTextLengthDesc = "Максимальная длина текста отображающегося в FuBar."
	Outfitter.cFuHideMinimapButton = "Скрыть иконку у мини-карты"
	Outfitter.cFuHideMinimapButtonDesc = "Скрыть иконку Outfitter'а у мини-карты."
	Outfitter.cFuInitializing = "Инициализирование"

	Outfitter.cStoreOnServer = "Хранить наборы на сервере"
	Outfitter.cStoreOnServerOnDescription = "Отключает хранение наборов на сервере, и удаляет их от туда. теперь они будут храниться локально и не будет доступны с других компьютеров."
	Outfitter.cStoreOnServerOffDescription = "Включает хранение наборов на сервер, тем самым они будут доступны с других крмпьютеров.  Вы можете хранить только 10 наборов на сервере."
	Outfitter.cTooManyServerOutfits = "Вы не можете хранить больше %d наборов на сервере."
	
	Outfitter.cCantSetIcon = "Equipment Manager doesn't have the ability to change an icon without also updating the gear.  You should equip this outfit first before changing its icon.  If you continue anyhow, some of your item selections for this outfit will be changed to your currently equipped gear."
	Outfitter.cChangeIcon = "Сменить иконку"
	
	Outfitter.cNoItemsWithStat = "Couldn't generate an outfit because no items with that stat were found"
end
