-------------------------------------------------------------------------------
-- Module Declaration
--

local plugin = BigWigs:NewPlugin("Super Emphasize")
if not plugin then return end

-------------------------------------------------------------------------------
-- Locals
--

local media = LibStub("LibSharedMedia-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("Big Wigs: Plugins")
plugin.displayName = L.superEmphasize

local temporaryEmphasizes = {}
local voices = {
	["English: Amy"] = {
		"Interface\\AddOns\\BigWigs\\Sounds\\Amy\\1.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Amy\\2.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Amy\\3.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Amy\\4.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Amy\\5.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Amy\\6.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Amy\\7.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Amy\\8.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Amy\\9.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Amy\\10.ogg",
	},
	["English: David"] = {
		"Interface\\AddOns\\BigWigs\\Sounds\\David\\1.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\David\\2.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\David\\3.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\David\\4.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\David\\5.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\David\\6.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\David\\7.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\David\\8.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\David\\9.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\David\\10.ogg",
	},
	["English: Jim"] = {
		"Interface\\AddOns\\BigWigs\\Sounds\\Jim\\1.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Jim\\2.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Jim\\3.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Jim\\4.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Jim\\5.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Jim\\6.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Jim\\7.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Jim\\8.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Jim\\9.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Jim\\10.ogg",
	},
	["English: Heroes of the Storm"] = {
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\enUS\\1.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\enUS\\2.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\enUS\\3.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\enUS\\4.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\enUS\\5.ogg",
	},
	["Deutsch: Heroes of the Storm"] = {
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\deDE\\1.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\deDE\\2.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\deDE\\3.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\deDE\\4.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\deDE\\5.ogg",
	},
	["Español: Heroes of the Storm"] = {
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\esES\\1.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\esES\\2.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\esES\\3.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\esES\\4.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\esES\\5.ogg",
	},
	["Français: Heroes of the Storm"] = {
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\frFR\\1.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\frFR\\2.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\frFR\\3.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\frFR\\4.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\frFR\\5.ogg",
	},
	["Русский: Heroes of the Storm"] = {
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\ruRU\\1.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\ruRU\\2.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\ruRU\\3.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\ruRU\\4.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\ruRU\\5.ogg",
	},
	["한국어: Heroes of the Storm"] = {
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\koKR\\1.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\koKR\\2.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\koKR\\3.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\koKR\\4.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\koKR\\5.ogg",
	},
	["Italiano: Heroes of the Storm"] = {
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\itIT\\1.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\itIT\\2.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\itIT\\3.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\itIT\\4.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\itIT\\5.ogg",
	},
	["Português: Heroes of the Storm"] = {
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\ptBR\\1.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\ptBR\\2.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\ptBR\\3.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\ptBR\\4.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\ptBR\\5.ogg",
	},
	["简体中文: Heroes of the Storm"] = {
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\zhCN\\1.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\zhCN\\2.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\zhCN\\3.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\zhCN\\4.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\zhCN\\5.ogg",
	},
	["繁體中文: Heroes of the Storm"] = {
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\zhTW\\1.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\zhTW\\2.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\zhTW\\3.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\zhTW\\4.ogg",
		"Interface\\AddOns\\BigWigs\\Sounds\\Heroes\\zhTW\\5.ogg",
	},
}
local voiceList = {}
for k in next, voices do voiceList[k] = k end

-------------------------------------------------------------------------------
-- Options
--

local voiceMap = {
	deDE = "Deutsch: Heroes of the Storm",
	esES = "Español: Heroes of the Storm",
	esMX = "Español: Heroes of the Storm",
	frFR = "Français: Heroes of the Storm",
	ruRU = "Русский: Heroes of the Storm",
	koKR = "한국어: Heroes of the Storm",
	itIT = "Italiano: Heroes of the Storm",
	ptBR = "Português: Heroes of the Storm",
	zhCN = "简体中文: Heroes of the Storm",
	zhTW = "繁體中文: Heroes of the Storm",
}

plugin.defaultDB = {
	upper = true,
	countdown = true,
	font = nil,
	outline = "THICKOUTLINE",
	fontSize = 32,
	fontColor = { r = 1, g = 0, b = 0 },
	disabled = false,
	voice = voiceMap[GetLocale()] or "English: Amy",
	countdownTime = 5,
	Countdown = {},
}

local function createOptions()
	local disabled = function() return plugin.db.profile.disabled end
	local get = function(info) return plugin.db.profile[info[#info]] end
	local set = function(info, value)
		plugin.db.profile[info[#info]] = value
		if plugin.anchorEmphasizedCountdownText then
			plugin.anchorEmphasizedCountdownText:SetFont(media:Fetch("font", plugin.db.profile.font), plugin.db.profile.fontSize, plugin.db.profile.outline ~= "NONE" and plugin.db.profile.outline)
		end
	end

	local mModule = BigWigs:GetPlugin("Messages", true)
	if mModule then
		mModule.pluginOptions.args.emphasize = {
			type = "group",
			name = L.emphasizedMessages,
			order = 1.5,
			get = get,
			set = set,
			args = {
				--[[
				disabled = {
					type = "toggle",
					name = L.disabled,
					desc = L.superEmphasizeDisableDesc,
					order = 0.1,
				},
				separator1 = {
					name = "",
					type = "description",
					order = 0.2,
				},
				--]]
				countdownTime = {
					name = L.countdownAt,
					type = "range", min = 5, max = 10, step = 1,
					order = 0.5,
					disabled = disabled,
				},
				countdown = {
					type = "toggle",
					name = L.textCountdown,
					desc = L.textCountdownDesc,
					order = 0.6,
					disabled = disabled,
				},
				fontColor = {
					type = "color",
					name = L.countdownColor,
					get = function(info)
						return plugin.db.profile[info[#info]].r, plugin.db.profile[info[#info]].g, plugin.db.profile[info[#info]].b
					end,
					set = function(info, r, g, b)
						plugin.db.profile[info[#info]].r, plugin.db.profile[info[#info]].g, plugin.db.profile[info[#info]].b = r, g, b
						if plugin.anchorEmphasizedCountdownText then
							plugin.anchorEmphasizedCountdownText:SetTextColor(r, g, b)
						end
					end,
					order = 0.7,
					disabled = function() return plugin.db.profile.disabled or not plugin.db.profile.countdown end,
				},
				font = {
					type = "select",
					name = L.font,
					order = 1,
					values = media:List("font"),
					itemControl = "DDI-Font",
					get = function()
						for i, v in next, media:List("font") do
							if v == plugin.db.profile.font then return i end
						end
					end,
					set = function(info, value)
						local list = media:List("font")
						plugin.db.profile.font = list[value]
						if plugin.anchorEmphasizedCountdownText then
							plugin.anchorEmphasizedCountdownText:SetFont(media:Fetch("font", plugin.db.profile.font), plugin.db.profile.fontSize, plugin.db.profile.outline ~= "NONE" and plugin.db.profile.outline)
						end
					end,
					disabled = disabled,
				},
				outline = {
					type = "select",
					name = L.outline,
					order = 2,
					values = {
						NONE = L.none,
						OUTLINE = L.thin,
						THICKOUTLINE = L.thick,
					},
					disabled = disabled,
				},
				fontSize = {
					type = "range",
					name = L.fontSize,
					order = 3,
					max = 40, min = 8, step = 1,
					disabled = disabled,
				},
				upper = {
					type = "toggle",
					name = L.uppercase,
					desc = L.uppercaseDesc,
					order = 4,
					disabled = disabled,
				},
				monochrome = {
					type = "toggle",
					name = L.monochrome,
					desc = L.monochromeDesc,
					order = 5,
					disabled = disabled,
				},
			},
		}
	end

	local sModule = BigWigs:GetPlugin("Sounds", true)
	if sModule then
		-- main options
		sModule.pluginOptions.args.separator1 = {
			name = "",
			type = "description",
			order = 4,
		}
		sModule.pluginOptions.args.voice = {
			name = L.countdownVoice,
			type = "select",
			values = voiceList,
			get = get,
			set = set,
			order = 5,
			width = "full",
			disabled = disabled,
		}
		sModule.pluginOptions.args.voiceTest = {
			name = L.countdownTest,
			type = "execute",
			handler = plugin,
			func = "TestEmphasize",
			order = 6,
			disabled = disabled,
		}

		-- ability options
		sModule.soundOptions.args.separator1 = {
			name = "",
			type = "description",
			order = 3,
		}
		sModule.soundOptions.args.countdown = {
			name = "Countdown",
			type = "select",
			values = voiceList,
			get = function(info)
				local name, key = unpack(info.arg)
				return plugin.db.profile.Countdown[name] and plugin.db.profile.Countdown[name][key] or plugin.db.profile.voice
			end,
			set = function(info, value)
				local name, key = unpack(info.arg)
				if value ~= plugin.db.profile.voice then
					if not plugin.db.profile.Countdown[name] then plugin.db.profile.Countdown[name] = {} end
					plugin.db.profile.Countdown[name][key] = value
				else -- clean up
					if plugin.db.profile.Countdown[name] then
						plugin.db.profile.Countdown[name][key] = nil
					end
					if not next(plugin.db.profile.Countdown[name]) then
						plugin.db.profile.Countdown[name] = nil
					end
				end
			end,
			order = 4,
			width = "full",
		}
	end
end

local function updateProfile()
	if not plugin.db.profile.font then
		plugin.db.profile.font = media:GetDefault("font")
	end
	-- Reset invalid voice selections
	if not voices[plugin.db.profile.voice] then
		plugin.db.profile.voice = voiceMap[GetLocale()] or "English: Amy"
	end
	for boss, tbl in next, plugin.db.profile.Countdown do
		for ability, chosenVoice in next, tbl do
			if not voices[chosenVoice] then
				plugin.db.profile.Countdown[boss][ability] = nil
			end
		end
	end
end

-------------------------------------------------------------------------------
-- Initialization
--

function plugin:OnPluginEnable()
	self:RegisterMessage("BigWigs_StartEmphasize")
	self:RegisterMessage("BigWigs_StopEmphasize")
	self:RegisterMessage("BigWigs_TempSuperEmphasize")
	self:RegisterMessage("BigWigs_PlayCountdownNumber")
	self:RegisterMessage("BigWigs_ProfileUpdate", updateProfile)
	updateProfile()
	createOptions()
end

do
	local errorBadName = ":RegisterVoice name must be a string."
	local errorBadTable = ":RegisterVoice data must be a table with 5-10 voice entries."
	local errorAlreadyExist = "Trying to register %q as a voice, but it already exists."
	function plugin:RegisterVoice(name, data)
		if type(name) ~= "string" then error(errorBadName) end
		if type(data) ~= "table" or #data < 5 or #data > 10 then error(errorBadTable) end
		if voices[name] then error(errorAlreadyExist:format(name)) end
		voices[name] = {}
		for i = 1, #data do voices[name][i] = data[i] end
		voiceList[name] = name
	end
end

do
	local timers = {}
	local function printEmph(num, name, key, text)
		local voice = plugin.db.profile.Countdown[name] and plugin.db.profile.Countdown[name][key] or plugin.db.profile.voice
		local sound = voices[voice] and voices[voice][num]
		if sound then
			PlaySoundFile(sound, "Master")
		end
		if not plugin.db.profile.disabled and plugin.db.profile.countdown then
			plugin:SendMessage("BigWigs_EmphasizedCountdownMessage", num)
		end
		if text and timers[text] then wipe(timers[text]) end
	end
	function plugin:BigWigs_StartEmphasize(_, module, key, text, time)
		if module and key and module:CheckOption(key, "COUNTDOWN") then
			self:BigWigs_StopEmphasize(nil, module, text)
			if time > 1.3 then
				if not timers[text] then timers[text] = {} end
				local name = module.name
				timers[text][1] = module:ScheduleTimer(printEmph, time-1.3, 1, name, key, text)
				for i = 2, self.db.profile.countdownTime do
					local t = i + 0.3
					if time <= t then break end
					timers[text][i] = module:ScheduleTimer(printEmph, time-t, i, name, key)
				end
			end
		end
	end
	function plugin:BigWigs_StopEmphasize(_, module, text)
		if text and timers[text] and #timers[text] > 0 then
			for i = 1, #timers[text] do
				module:CancelTimer(timers[text][i])
			end
			wipe(timers[text])
		end
	end
	function plugin:TestEmphasize()
		local text = "test"
		self:BigWigs_StopEmphasize(nil, self, text)
		if not timers[text] then timers[text] = {} end
		local num = self.db.profile.countdownTime
		for i = 1, num do
			timers[text][i] = self:ScheduleTimer(printEmph, num-i, i, nil, nil, i == 1 and text)
		end
	end
end

function plugin:IsSuperEmphasized(module, key)
	if not module or not key or self.db.profile.disabled then return end
	if temporaryEmphasizes[key] and temporaryEmphasizes[key] > GetTime() then return true else temporaryEmphasizes[key] = nil end
	if module == BigWigs then -- test bars
		return math.random(1,2) == 2
	end
	return module:CheckOption(key, "EMPHASIZE")
end

function plugin:BigWigs_TempSuperEmphasize(_, module, key, text, time)
	if not module or not key or text == "" then return end
	temporaryEmphasizes[key] = GetTime() + time
	self:BigWigs_StartEmphasize(nil, module, key, text, time)
end

function plugin:BigWigs_PlayCountdownNumber(_, module, num)
	local voice = self.db.profile.voice
	local sound = voices[voice] and voices[voice][num]
	if sound then
		PlaySoundFile(sound, "Master")
	end
end

