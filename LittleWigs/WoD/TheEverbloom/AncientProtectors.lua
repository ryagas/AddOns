
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Ancient Protectors", 1008, 1207)
if not mod then return end
mod:RegisterEnableMob(83894, 83892, 83893) -- Dulhu, Life Warden Gola, Earthshaper Telu

--------------------------------------------------------------------------------
-- Locals
--

local deathCount = 0
local golaHasDied = false

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then
	L[83892] = "|cFF00CCFFGola|r"
	L[83893] = "|cFF00CC00Telu|r"

	L.custom_on_automark = "Auto-Mark Bosses"
	L.custom_on_automark_desc = "Automatically mark Gola with a {rt8} and Telu with a {rt7}, requires promoted or leader."
	L.custom_on_automark_icon = 8
end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		168082, -- Revitalizing Waters
		168105, -- Rapid Tides
		168041, -- Briarskin
		167977, -- Bramble Patch
		168383, -- Slash
		168520, -- Shaper's Fortitude
		"custom_on_automark",
		"bosskill",
	}
end

function mod:OnBossEnable()
	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT")

	self:Log("SPELL_CAST_START", "RevitalizingWaters", 168082)
	self:Log("SPELL_AURA_APPLIED", "RapidTides", 168105)

	self:Log("SPELL_CAST_START", "Briarskin", 168041)
	self:Log("SPELL_AURA_APPLIED", "BramblePatch", 167977)

	self:Log("SPELL_CAST_START", "Slash", 168383)

	self:Log("SPELL_AURA_APPLIED", "ShapersFortitude", 168520)

	self:Death("Deaths", 83894, 83892, 83893) -- Dulhu, Life Warden Gola, Earthshaper Telu
end

function mod:OnEngage()
	deathCount = 0
	golaHasDied = false
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:INSTANCE_ENCOUNTER_ENGAGE_UNIT()
	self:CheckBossStatus()
	if self.db.profile.custom_on_automark then
		for i = 1, 3 do
			local unit = ("boss%d"):format(i)
			local id = self:MobId(UnitGUID(unit))
			if id == 83892 and not golaHasDied then
				SetRaidTarget(unit, 8)
			elseif id == 83893 then
				SetRaidTarget(unit, golaHasDied and 8 or 7)
			end
		end
	end
end

-- Life Warden Gola
function mod:RevitalizingWaters(args)
	local raidIcon = CombatLog_String_GetIcon(args.sourceRaidFlags)
	self:Message(args.spellId, "Urgent", "Warning", CL.other:format(raidIcon.. L[83892], CL.casting:format(self:SpellName(31730)))) -- 31730 = "Heal"
end

function mod:RapidTides(args)
	local raidIcon = CombatLog_String_GetIcon(args.destRaidFlags)
	local name = L[self:MobId(args.destGUID)] or args.destName
	self:Message(args.spellId, "Important", self:Dispeller("magic", true) and "Alarm", CL.other:format(args.spellName, raidIcon..name))
end

-- Earthshaper Telu
function mod:Briarskin(args)
	local raidIcon = CombatLog_String_GetIcon(args.sourceRaidFlags)
	self:Message(args.spellId, "Attention", "Alert", CL.other:format(raidIcon.. L[83893], CL.casting:format(args.spellName)))
end

function mod:BramblePatch(args)
	if self:Me(args.destGUID) then
		self:Message(args.spellId, "Personal", nil, CL.underyou:format(args.spellName))
	end
end

-- Dulhu
function mod:Slash(args)
	self:Message(args.spellId, "Attention")
end

-- General
function mod:ShapersFortitude(args)
	local raidIcon = CombatLog_String_GetIcon(args.destRaidFlags)
	local name = L[self:MobId(args.destGUID)] or args.destName
	self:Message(args.spellId, "Attention", nil, CL.other:format(args.spellName, raidIcon..name))
	self:Bar(args.spellId, 8, CL.other:format(self:SpellName(111923), raidIcon..name)) -- 111923 = "Fortitude"
end

function mod:Deaths(args)
	deathCount = deathCount + 1
	if deathCount > 2 then
		self:Win()
	elseif args.mobId == 83892 then
		golaHasDied = true
		self:INSTANCE_ENCOUNTER_ENGAGE_UNIT()
	end
end

