-- -------------------------------------------------------------------------- --
-- BattlegroundTargets - transliteration                                      --
-- Please make sure to save this file as UTF-8. ¶                             --
-- -------------------------------------------------------------------------- --

local TSL, _, prg = {}, ...
prg.TSL = TSL

-- Cyrillic-to-Latin Transliteration
-- Rules used: Passport (2013) ICAO system (Order No. 320, 15 October 2012) Федеральная миграционная служба (Federal Migration Service)
-- Machine Readable Travel Documents, Doc 9303, Part 1, Volume 1 (Sixth ed.). ICAO. 2006. Pages IV-50 - IV-52.
-- http://www.icao.int/publications/Documents/9303_p1_v1_cons_en.pdf
-- https://en.wikipedia.org/wiki/Romanization_of_Russian

TSL["А"] = "a"
TSL["а"] = "a"
TSL["Б"] = "b"
TSL["б"] = "b"
TSL["В"] = "v"
TSL["в"] = "v"
TSL["Г"] = "g"
TSL["г"] = "g"
TSL["Д"] = "d"
TSL["д"] = "d"
TSL["Е"] = "e"
TSL["е"] = "e"
TSL["Ё"] = "e"
TSL["ё"] = "e"
TSL["Ж"] = "zh"
TSL["ж"] = "zh"
TSL["З"] = "z"
TSL["з"] = "z"
TSL["И"] = "i"
TSL["и"] = "i"
TSL["Й"] = "i"
TSL["й"] = "i"
TSL["К"] = "k"
TSL["к"] = "k"
TSL["Л"] = "l"
TSL["л"] = "l"
TSL["М"] = "m"
TSL["м"] = "m"
TSL["Н"] = "n"
TSL["н"] = "n"
TSL["О"] = "o"
TSL["о"] = "o"
TSL["П"] = "p"
TSL["п"] = "p"
TSL["Р"] = "r"
TSL["р"] = "r"
TSL["С"] = "s"
TSL["с"] = "s"
TSL["Т"] = "t"
TSL["т"] = "t"
TSL["У"] = "u"
TSL["у"] = "u"
TSL["Ф"] = "f"
TSL["ф"] = "f"
TSL["Х"] = "kh"
TSL["х"] = "kh"
TSL["Ц"] = "ts"
TSL["ц"] = "ts"
TSL["Ч"] = "ch"
TSL["ч"] = "ch"
TSL["Ш"] = "sh"
TSL["ш"] = "sh"
TSL["Щ"] = "shch"
TSL["щ"] = "shch"
TSL["Ъ"] = "ie"
TSL["ъ"] = "ie"
TSL["Ы"] = "y"
TSL["ы"] = "y"
TSL["Ь"] = ""
TSL["ь"] = ""
TSL["Э"] = "e"
TSL["э"] = "e"
TSL["Ю"] = "iu"
TSL["ю"] = "iu"
TSL["Я"] = "ia"
TSL["я"] = "ia"