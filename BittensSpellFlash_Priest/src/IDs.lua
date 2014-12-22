local addonName, a = ...
local c = BittensGlobalTables.GetTable("BittensSpellFlashLibrary")

a.AddonName = addonName
c.Init(a)

a.SpellIDs = {
   ["Archangel"] = 81700,
   ["Binding Heal"] = 32546,
   ["Borrowed Time"] = 52798,
   ["Cascade"] = 121135,
   ["Chakra"] = 83,
   ["Chakra: Chastise"] = 81209,
   ["Chakra: Sanctuary"] = 81206,
   ["Chakra: Serenity"] = 81208,
   ["Desperate Prayer"] = 19236,
   ["Devouring Plague"] = 2944,
   ["Dispel Magic"] = 528,
   ["Dispersion"] = 47585,
   ["Divine Insight"] = 123266,
   ["Divine Star"] = 110744,
   ["Enhanced Shadow Orbs"] = 157217,
   ["Enhanced Shadow Word: Death"] = 157218,
   ["Evangelism"] = 81662,
   ["Flash Heal"] = 2061,
   ["Heal"] = 2060,
   ["Halo"] = 120517,
   ["Holy Fire"] = 14914,
   ["Insanity"] = 129197,
   ["Lightwell"] = 724,
   ["Mind Blast"] = 8092,
   ["Mind Flay"] = 15407,
   ["Mind Sear"] = 48045,
   ["Mind Spike"] = 73510,
   ["Mindbender"] = 123040,
   ["Penance"] = 47540,
   ["Power Infusion"] = 10060,
   ["Power Word: Fortitude"] = 21562,
   ["Power Word: Shield w/ Insight"] = 123258,
   ["Power Word: Shield"] = 17,
   ["Prayer of Healing"] = 596,
   ["Prayer of Mending Buff"] = 41635,
   ["Prayer of Mending"] = 33076,
   ["Serendipity"] = 63735,
   ["Shadow Word: Death"] = 32379,
   ["Shadow Word: Insanity"] = 132573,
   ["Shadow Word: Pain"] = 589,
   ["Shadowfiend"] = 34433,
   ["Shadowform"] = 15473,
   ["Shadowy Insight"] = 124430, -- buff, not talent
   ["Silence"] = 15487,
   ["Smite"] = 585,
   ["Surge of Darkness"] = 87160,
   ["Surge of Light"] = 114255,
   ["Vampiric Embrace"] = 15286,
   ["Vampiric Touch"] = 34914,
   ["Void Entropy"] = 155361,
   ["Weakened Soul"] = 6788,
--      ["Dark Archangel"] = 87151,
--      ["Dark Evangelism"] = 87118,
--      ["Empowered Shadow"] = 95799,
--      ["Holy Word: Chastise"] = 88625,
--      ["Holy Word: Sanctuary"] = 88685,
--      ["Holy Word: Serenity"] = 88684,

   ["Mental Instincts"] = 167254, -- T17 4PC Shadow Buff
}

a.TalentIDs = {
   ["Auspicious Spirits"] = 155271,
   ["Clarity of Power"] = 155246,
   ["Divine Insight"] = 109175,
   ["Insanity"] = 139139,
   ["Void Entropy"] = 155361,
}

a.GlyphIDs = {
   ["Lightspring"] = 126133,
   ["Mind Harvest"] = 162532,
}

a.EquipmentSets = {
   T17 = {
      ChestSlot    = { 115560 },
      ShoulderSlot = { 115561 },
      HandsSlot    = { 115562 },
      HeadSlot     = { 115563 },
      LegsSlot     = { 115564 },
   },
}
