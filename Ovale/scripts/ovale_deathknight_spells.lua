local OVALE, Ovale = ...
local OvaleScripts = Ovale.OvaleScripts

do
	local name = "ovale_deathknight_spells"
	local desc = "[6.1] Ovale: Death Knight spells"
	local code = [[
# Death Knight spells and functions.

# Learned spells.
Define(blood_shield 77513)
	SpellInfo(blood_shield learn=1 level=80 specialization=blood)
Define(ebon_plaguebringer 51160)
	SpellInfo(ebon_plaguebringer learn=1 specialization=unholy)
Define(improved_frost_presence 50385)
	SpellInfo(improved_frost_presence learn=1 level=65 specialization=frost)
Define(rime 59057)
	SpellInfo(rime learn=1 specialization=frost)
Define(scent_of_blood 49509)
	SpellInfo(scent_of_blood learn=1 specialization=blood)

Define(antimagic_shell 48707)
	SpellInfo(antimagic_shell cd=45 gcd=0 offgcd=1)
	SpellInfo(antimagic_shell buff_cdr=cooldown_reduction_strength_buff specialization=frost)
	SpellInfo(antimagic_shell buff_cdr=cooldown_reduction_strength_buff specialization=unholy)
	SpellInfo(antimagic_shell buff_cdr=cooldown_reduction_tank_buff specialization=blood)
Define(antimagic_shell_buff 48707)
	SpellInfo(antimagic_shell_buff duration=5)
Define(army_of_the_dead 42650)
	SpellInfo(army_of_the_dead blood=1 frost=1 unholy=1 cd=600)
	SpellInfo(army_of_the_dead buff_cdr=cooldown_reduction_strength_buff specialization=frost)
	SpellInfo(army_of_the_dead buff_cdr=cooldown_reduction_strength_buff specialization=unholy)
	SpellAddBuff(army_of_the_dead army_of_the_dead_buff=1)
Define(army_of_the_dead_buff 42650) # XXX
	SpellInfo(army_of_the_dead_buff duration=40)
Define(asphyxiate 108194)
	SpellInfo(asphyxiate cd=30 interrupt=1)
Define(blood_boil 50842)
	SpellInfo(blood_boil blood=1)
	SpellRequire(blood_boil blood 0=buff,crimson_scourge_buff if_spell=crimson_scourge)
	SpellAddBuff(blood_boil scent_of_blood_buff=1 if_spell=scent_of_blood)
	SpellAddTargetDebuff(blood_boil blood_plague_debuff=refresh frost_fever_debuff=refresh if_spell=!necrotic_plague if_spell=scent_of_blood)
	SpellAddTargetDebuff(blood_boil necrotic_plague_debuff=1 if_spell=necrotic_plague if_spell=scent_of_blood)
Define(blood_charge_buff 114851)
	SpellInfo(blood_charge_buff duration=25 max_stacks=12)
Define(blood_plague_debuff 55078)
	SpellInfo(blood_plague_debuff duration=30 tick=3)
Define(blood_presence 48263)
	SpellInfo(blood_presence to_stance=deathknight_blood_presence)
	SpellInfo(blood_presence unusable=1 if_stance=deathknight_blood_presence)
Define(blood_shield_buff 77535)
	SpellInfo(blood_shield_buff duration=10)
Define(blood_tap 45529)
	SpellInfo(blood_tap gcd=0 offgcd=1)
	SpellRequire(blood_tap unusable 1=buff,!blood_charge_buff,5)
	SpellAddBuff(blood_tap blood_charge_buff=-5)
Define(blood_tap_talent 10)
Define(bone_shield 49222)
	SpellInfo(bone_shield cd=60 gcd=0 offgcd=1)
	SpellInfo(bone_shield buff_cdr=cooldown_reduction_tank_buff specialization=blood)
	SpellAddBuff(bone_shield bone_shield_buff=1)
Define(bone_shield_buff 49222)
	SpellInfo(bone_shield_buff duration=300)
Define(breath_of_sindragosa 152279)
	SpellInfo(breath_of_sindragosa runicpower=15 cd=120 gcd=0)
	SpellAddBuff(breath_of_sindragosa breath_of_sindragosa_buff=1)
	SpellAddBuff(breath_of_sindragosa blood_charge_buff=1 if_spell=blood_tap)
Define(breath_of_sindragosa_buff 152279)
Define(breath_of_sindragosa_talent 21)
Define(conversion 119975)
	SpellAddBuff(conversion conversion_buff=toggle)
Define(conversion_buff 119975)
Define(crimson_scourge 81136)
Define(crimson_scourge_buff 81141)
	SpellInfo(crimson_scourge_buff duration=15)
Define(dancing_rune_weapon 49028)
	SpellInfo(dancing_rune_weapon cd=90 gcd=0)
	SpellInfo(dancing_rune_weapon buff_cdr=cooldown_reduction_tank_buff specialization=blood)
	SpellAddBuff(dancing_rune_weapon dancing_rune_weapon_buff=1)
Define(dancing_rune_weapon_buff 81256)
	SpellInfo(dancing_rune_weapon_buff duration=8)
Define(dark_simulacrum 77606)
	SpellInfo(dark_simulacrum cd=60)
	SpellInfo(dark_simulacrum addcd=-30 glyph=glyph_of_dark_simulacrum)
	SpellAddTargetDebuff(dark_simulacrum dark_simulacrum_debuff=1)
Define(dark_simulacrum_debuff 77606)
	SpellInfo(dark_simulacrum_debuff duration=8)
	SpellInfo(dark_simulacrum_debuff addduration=4 glyph=glyph_of_dark_simulacrum)
Define(dark_succor 178819)
Define(dark_succor_buff 101568)
	SpellInfo(dark_succor_buff duration=15)
Define(dark_transformation 63560)
	SpellInfo(dark_transformation unholy=1 if_spell=!enhanced_dark_transformation)
	SpellRequire(dark_transformation unusable 1=buff,!shadow_infusion_buff,5)
	SpellAddBuff(dark_transformation shadow_infusion_buff=-5)
	#SpellAddPetBuff(dark_transformation dark_transformation_buff=1)
Define(dark_transformation_buff 63560)
	SpellInfo(dark_transformation_buff duration=30)
Define(death_and_decay 43265)
	SpellInfo(death_and_decay unholy=1 cd=30)
	SpellRequire(death_and_decay unholy 0=buff,crimson_scourge_buff if_spell=crimson_scourge)
Define(death_coil 47541)
	SpellInfo(death_coil runicpower=30 travel_time=1)
	SpellRequire(death_coil runicpower 0=buff,sudden_doom_buff if_spell=sudden_doom)
	SpellAddBuff(death_coil blood_charge_buff=2 if_spell=blood_tap)
	SpellAddTargetDebuff(death_coil blood_plague_debuff=extend,4 frost_fever_debuff=extend,4 if_spell=!necrotic_plague if_spell=plaguebearer)
	SpellAddTargetDebuff(death_coil necrotic_plague_debuff=1 if_spell=necrotic_plague if_spell=plaguebearer)
Define(death_grip 49576)
	SpellInfo(death_grip cd=25)
	SpellInfo(death_grip addcd=-5 if_spell=enhanced_death_grip)
Define(death_pact 48743)
	SpellInfo(death_pact cd=120 gcd=0 offgcd=1)
Define(death_siphon 108196)
	SpellInfo(death_siphon death=1)
Define(death_strike 49998)
	SpellInfo(death_strike frost=1 unholy=1)
	SpellRequire(death_strike frost 0=buff,dark_succor_buff if_spell=dark_succor if_stance=deathknight_frost_presence)
	SpellRequire(death_strike unholy 0=buff,dark_succor_buff if_spell=dark_succor if_stance=deathknight_frost_presence)
	SpellRequire(death_strike frost 0=buff,dark_succor_buff if_spell=dark_succor if_stance=deathknight_unholy_presence)
	SpellRequire(death_strike unholy 0=buff,dark_succor_buff if_spell=dark_succor if_stance=deathknight_unholy_presence)
	SpellAddBuff(death_strike blood_shield_buff=1 if_spell=blood_shield)
	SpellAddBuff(death_strike dark_succor_buff=0 if_spell=dark_succor if_stance=deathknight_frost_presence)
	SpellAddBuff(death_strike dark_succor_buff=0 if_spell=dark_succor if_stance=deathknight_unholy_presence)
	SpellAddBuff(death_strike scent_of_blood_buff=0 if_spell=scent_of_blood)
Define(deaths_advance 96268)
	SpellInfo(deaths_advance cd=30 gcd=0 offgcd=1)
Define(defile 152280)
	SpellInfo(defile unholy=1 cd=30)
	SpellRequire(defile unholy 0=buff,crimson_scourge_buff if_spell=crimson_scourge)
Define(defile_talent 20)
Define(empower_rune_weapon 47568)
	SpellInfo(empower_rune_weapon cd=300 runicpower=-25)
	SpellInfo(empower_rune_weapon buff_cdr=cooldown_reduction_strength_buff specialization=frost)
Define(empowered_pillar_of_frost 157389)
Define(enhanced_dark_transformation 157412)
Define(enhanced_death_grip 157337)
Define(festering_strike 85948)
	SpellInfo(festering_strike blood=1 frost=1)
	SpellAddTargetDebuff(festering_strike blood_plague_debuff=extend,6 frost_fever_debuff=extend,6)
Define(frost_fever_debuff 55095)
	SpellInfo(frost_fever_debuff duration=30 tick=3)
Define(frost_presence 48266)
	SpellInfo(frost_presence to_stance=deathknight_frost_presence)
	SpellInfo(frost_presence unusable=1 if_stance=deathknight_frost_presence)
Define(frost_strike 49143)
	SpellInfo(frost_strike runicpower=40)
	SpellInfo(frost_strike runicpower=25 if_spell=improved_frost_presence)
	SpellAddBuff(frost_strike killing_machine_buff=0 if_spell=killing_machine)
	SpellAddBuff(frost_strike blood_charge_buff=2 if_spell=blood_tap if_spell=!improved_frost_presence)
	SpellAddBuff(frost_strike blood_charge_buff=1 if_spell=blood_tap if_spell=improved_frost_presence)
	SpellAddTargetDebuff(frost_strike blood_plague_debuff=extend,4 frost_fever_debuff=extend,4 if_spell=!necrotic_plague if_spell=plaguebearer)
	SpellAddTargetDebuff(frost_strike necrotic_plague_debuff=1 if_spell=necrotic_plague if_spell=plaguebearer)
Define(glyph_of_dark_simulacrum 63331)
Define(glyph_of_icebound_fortitude 58673)
Define(glyph_of_mind_freeze 58686)
Define(glyph_of_outbreak 59332)
Define(horn_of_winter 57330)
	SpellAddBuff(horn_of_winter horn_of_winter_buff=1)
Define(horn_of_winter_buff 57330)
	SpellInfo(horn_of_winter_buff duration=3600)
Define(howling_blast 49184)
	SpellInfo(howling_blast frost=1)
	SpellRequire(howling_blast frost 0=buff,rime_buff if_spell=rime)
	SpellAddBuff(howling_blast rime_buff=0 if_spell=rime)
	SpellAddTargetDebuff(howling_blast frost_fever_debuff=1 if_spell=!necrotic_plague)
	SpellAddTargetDebuff(howling_blast necrotic_plague_debuff=1 if_spell=necrotic_plague)
Define(icebound_fortitude 48792)
	SpellInfo(icebound_fortitude cd=180 gcd=0 offgcd=1)
	SpellInfo(icebound_fortitude cd=90 glyph=glyph_of_icebound_fortitude)
	SpellInfo(icebound_fortitude buff_cdr=cooldown_reduction_strength_buff specialization=frost)
	SpellInfo(icebound_fortitude buff_cdr=cooldown_reduction_strength_buff specialization=unholy)
	SpellInfo(icebound_fortitude buff_cdr=cooldown_reduction_tank_buff specialization=blood)
	SpellAddBuff(icebound_fortitude icebound_fortitude_buff=1)
Define(icebound_fortitude_buff 48792)
	SpellInfo(icebound_fortitude_buff duration=8)
	SpellInfo(icebound_fortitude_buff duration=2 glyph=glyph_of_icebound_fortitude)
Define(icy_touch 45477)
	SpellInfo(icy_touch frost=1)
	SpellRequire(icy_touch frost 0=buff,rime_buff if_spell=rime)
	SpellAddBuff(icy_touch rime_buff=0 if_spell=rime)
	SpellAddTargetDebuff(icy_touch frost_fever_debuff=1 if_spell=!necrotic_plague)
	SpellAddTargetDebuff(icy_touch necrotic_plague_debuff=1 if_spell=necrotic_plague)
Define(killing_machine 51128)
Define(killing_machine_buff 51124)
	SpellInfo(killing_machine_buff duration=10)
Define(lichborne 49039)
	SpellInfo(lichborne cd=120 gcd=0)
Define(mind_freeze 47528)
	SpellInfo(mind_freeze cd=15 gcd=0 interrupt=1 offgcd=1)
	SpellInfo(mind_freeze addcd=-1 runicpower=10 glyph=glyph_of_mind_freeze)
Define(necrotic_plague 152281)
Define(necrotic_plague_debuff 155159)
	SpellInfo(necrotic_plague_debuff duration=30 tick=2)
Define(necrotic_plague_talent 19)
Define(obliterate 49020)
	SpellInfo(obliterate frost=1 unholy=1)
	SpellAddBuff(obliterate killing_machine_buff=0 if_spell=killing_machine)
Define(outbreak 77575)
	SpellInfo(outbreak cd=60 glyph=!glyph_of_outbreak)
	SpellInfo(outbreak runicpower=30 glyph=glyph_of_outbreak)
	SpellInfo(outbreak buff_cdr=cooldown_reduction_strength_buff specialization=frost)
	SpellInfo(outbreak buff_cdr=cooldown_reduction_strength_buff specialization=unholy)
	SpellInfo(outbreak buff_cdr=cooldown_reduction_tank_buff specialization=blood)
	SpellAddBuff(outbreak blood_charge_buff=2 glyph=glyph_of_outbreak if_spell=blood_tap)
	SpellAddTargetDebuff(outbreak blood_plague_debuff=1 frost_fever_debuff=1 if_spell=!necrotic_plague)
	SpellAddTargetDebuff(outbreak necrotic_plague_debuff=1 if_spell=necrotic_plague)
Define(pillar_of_frost 51271)
	SpellInfo(pillar_of_frost cd=60 gcd=0)
	SpellInfo(pillar_of_frost frost=1 if_spell=!empowered_pillar_of_frost)
	SpellInfo(pillar_of_frost buff_cdr=cooldown_reduction_strength_buff specialization=frost)
	SpellInfo(pillar_of_frost runicpower=-30 itemset=T17 itemcount=2 specialization=frost)
	SpellAddBuff(pillar_of_frost pillar_of_frost_buff=1)
Define(pillar_of_frost_buff 51271)
	SpellInfo(pillar_of_frost duration=20)
Define(plague_leech 123693)
	SpellInfo(plague_leech cd=25)
	SpellAddTargetDebuff(plague_leech blood_plague_debuff=0 frost_fever_debuff=0 if_spell=!necrotic_plague)
	SpellAddTargetDebuff(plague_leech necrotic_plague_debuff=0 if_spell=necrotic_plague)
Define(plague_leech_talent 2)
Define(plague_strike 45462)
	SpellInfo(plague_strike unholy=1)
	SpellAddTargetDebuff(plague_strike blood_plague_debuff=1 if_spell=!necrotic_plague)
	SpellAddTargetDebuff(plague_strike frost_fever_debuff=1 if_spell=ebon_plaguebringer if_spell=!necrotic_plague)
	SpellAddTargetDebuff(plague_strike necrotic_plague_debuff=1 if_spell=necrotic_plague)
Define(plaguebearer 161497)
Define(raise_dead 46584)
	SpellInfo(raise_dead cd=60)
Define(rime_buff 59052)
	SpellInfo(rime_buff duration=15)
Define(rune_tap 48982)
	SpellInfo(rune_tap blood=1 gcd=0 offgcd=1)
	SpellInfo(rune_tap blood=0 itemset=T15_tank itemcount=2)
Define(rune_tap_buff 171049)
	SpellInfo(rune_tap_buff duration=3)
Define(rune_tap_will_of_the_necropolis 171049)
	SpellInfo(rune_tap_will_of_the_necropolis gcd=0 offgcd=1)
Define(runic_corruption_buff 51460)
	SpellInfo(runic_corruption_buff duration=3)
Define(runic_corruption_talent 12)
Define(runic_empowerment_talent 11)
Define(scent_of_blood_buff 50421)
	SpellInfo(scent_of_blood_buff duration=20 max_stacks=5)
Define(scourge_strike 55090)
	SpellInfo(scourge_strike unholy=1)
Define(shadow_infusion_buff 91342)
	SpellInfo(shadow_infusion_buff duration=30 max_stacks=5)
Define(soul_reaper_blood 114866)
	SpellInfo(soul_reaper_blood blood=1 cd=6)
	SpellAddBuff(soul_reaper_blood scent_of_blood_buff=1 if_spell=scent_of_blood)
	SpellAddTargetDebuff(soul_reaper_blood soul_reaper_blood_debuff=1)
Define(soul_reaper_blood_debuff 114866)
	SpellInfo(soul_reaper_blood_debuff duration=5)
Define(soul_reaper_frost 130735)
	SpellInfo(soul_reaper_frost frost=1 cd=6)
	SpellAddBuff(soul_reaper_frost killing_machine_buff=0 if_spell=killing_machine itemset=T15_melee itemcount=4)
	SpellAddTargetDebuff(soul_reaper_frost soul_reaper_frost_debuff=1)
Define(soul_reaper_frost_debuff 130735)
	SpellInfo(soul_reaper_frost_debuff duration=5)
Define(soul_reaper_unholy 130736)
	SpellInfo(soul_reaper_unholy unholy=1 cd=6)
	SpellAddTargetDebuff(soul_reaper_unholy soul_reaper_unholy_debuff=1)
Define(soul_reaper_unholy_debuff 130736)
	SpellInfo(soul_reaper_unholy_debuff duration=5)
Define(strangulate 47476)
	SpellInfo(strangulate blood=1 cd=60 interrupt=1)
Define(sudden_doom 49530)
Define(sudden_doom_buff 81340)
	SpellInfo(sudden_doom_buff duration=10)
Define(summon_gargoyle 49206)
	SpellInfo(summon_gargoyle cd=180)
	SpellInfo(summon_gargoyle buff_cdr=cooldown_reduction_strength_buff specialization=unholy)
Define(unholy_blight 115989)
	SpellInfo(unholy_blight cd=90)
Define(unholy_blight_talent 3)
Define(unholy_presence 48265)
	SpellInfo(unholy_presence to_stance=deathknight_unholy_presence)
	SpellInfo(unholy_presence unusable=1 if_stance=deathknight_unholy_presence)
Define(vampiric_blood 55233)
	SpellInfo(vampiric_blood cd=60 gcd=0 offgcd=1)
	SpellInfo(vampiric_blood addcd=-20 itemset=T14_tank itemcount=2)
	SpellInfo(vampiric_blood buff_cdr=cooldown_reduction_tank_buff specialization=blood)
	SpellAddBuff(vampiric_blood vampiric_blood_buff=1)
Define(vampiric_blood_buff 55233)
	SpellInfo(vampiric_blood_buff duration=10)

# Non-default tags for OvaleSimulationCraft.
	SpellInfo(blood_tap tag=main specialization=blood)
	SpellInfo(outbreak tag=main)
]]
	OvaleScripts:RegisterScript("DEATHKNIGHT", nil, name, desc, code, "include")
end
