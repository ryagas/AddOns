if not ElvUI then return end
local _, E, L, V, P, G = nil, unpack(ElvUI)
local ElvUF = ElvUI.oUF

PriorO = E:NewModule('PriorityOptions', 'AceHook-3.0')
ElvUIPlugin = LibStub('LibElvUIPlugin-1.0')
ElvUIPriority = select(1, ...)

PriorO.Version = '1.2.0'
PriorO.Title = GetAddOnMetadata("ElvUI_MyPriority", "Title")
PriorO.Released = '07/12/2014' .. ' (Aus Format)'
PriorO.Updated = '26/12/2014' .. ' (Aus Format)'

MPModule = E:GetModule('PriorityOptions')

ReplaceStats = {
	Stamina = 'Stamina',
	Armor = 'Armor',
	BonusArmor = 'Bonus Armor',
	Multistrike = 'Multistrike',
	Versatility = 'Versatility',
	Strength = 'Strength',
	Intellect = 'Intellect',
	Agility = 'Agility',
	HasteRating = 'Haste',
	MasteryRating = 'Mastery',
	CritRating = 'Critical Strike',
	Spirit = 'Spirit',
	PvpPower = 'PVP Power'
}

PvpPveReplace = {
	PVE = 'PVE',
	PVP = 'PVP'
}

function hex2rgb(hex)
    hex = hex:gsub("#","")
    arr = {
		Red = tonumber("0x"..hex:sub(1,2)),
		Green = tonumber("0x"..hex:sub(3,4)),
		Blue = tonumber("0x"..hex:sub(5,6))
	}
	
	return arr
end

function buildHex(col)
	-- print("source: r:" .. col['r'] .. " b:" .. col['b'] .. " g:" .. col['g'])
	
	local r, g, b = dec2hex(col['r'] * 255), dec2hex(col['g'] * 255), dec2hex(col['b'] * 255)
	-- print("result: r:" .. r .. " b:" .. b .. " g:" .. g)
	return r .. g .. b
end

function dec2hex(num)
    local hexstr = '0123456789abcdef'
    local s = ''
    while num > 0 do
        local mod = math.fmod(num, 16)
        s = string.sub(hexstr, mod + 1, mod + 1) .. s
        num = math.floor(num / 16)
    end
    if s == '' then s = '0' end
    return s
end

function tContains(table, item)
	local index = 1;
		while table[index] do
			if ( item == table[index] ) then
		  	 return 1;
			end
			index = index + 1;
		end
	return nil;
end

function getKeysSortedByValue(tbl, sortFunction)
  local keys = {}
  for key in pairs(tbl) do
    table.insert(keys, key)
  end

  table.sort(keys, function(a, b)
    return sortFunction(tbl[a], tbl[b])
  end)

  return keys
end

function round(number, decimals)
    return (("%%.%df"):format(decimals)):format(number)
end

Priorities = {
	PVE = {
		DeathKnight = {
			Blood = {
				Stamina = 23.44,
				Armor = 14.18,
				BonusArmor = 13.48,
				Multistrike = 6.27,
				Strength = 5.66,
				HasteRating=5.90,
				Versatility = 5.68,
				MasteryRating = 3.32,			
				CritRating = 2.85
			},
			
			Frost = {
				Strength = 4.73,
				MasteryRating = 1.97,
				Multistrike = 1.64,
				Versatility = 1.46,
				CritRating = 1.26,
				HasteRating = 1.18
			},
			
			Unholy = {
				Strength = 5.15,
				MasteryRating = 2.24,
				Multistrike = 2.30,
				CritRating = 1.75,
				Versatility = 1.58,
				HasteRating = 1.26
			}	
		},
		
		Druid = {
			Balance = {
				Intellect = 4.48,
				HasteRating = 1.72,
				CritRating = 1.71,
				MasteryRating = 1.71,
				Multistrike = 1.70,
				Versatility = 1.45			
			},
			
			Feral = {
				Agility = 4.84,
				CritRating = 1.75,
				Multistrike = 1.67,			
				Versatility = 1.49,
				HasteRating = 1.48,
				MasteryRating = 1.39
			},
			
			Guardian = {
				Agility=4.80,
				Armor=23.62,
				Stamina=16.46,
				MasteryRating=6.23,
				HasteRating=2.65,
				Multistrike=12.21,
				CritRating=1.59,
				Versatility=5.81,
				BonusArmor=10.17
			},
			
			Restoration = {
				MasteryRating=0.75,
				Versatility=0.37,
				HasteRating=0.82,
				Spirit=0.29,
				CritRating=0.45,
				Intellect=1.57,
				Multistrike=0.67
			}
		},
		
		Hunter = {
			BeastMastery = {
				Agility=4.88,
				MasteryRating=1.61,
				HasteRating=1.42,
				CritRating=1.56,
				Versatility=1.53,
				Multistrike=1.66
			},
			
			Marksmanship = {
				Agility=4.80,
				MasteryRating=1.22,
				HasteRating=1.24,
				CritRating=1.64,
				Versatility=1.54,
				Multistrike=1.86
			},
			
			Survival = {
				Agility=4.98,
				MasteryRating=0.85,
				HasteRating=1.02,
				CritRating=1.47,
				Versatility=1.46,
				Multistrike=1.87
			}
		},
		
		Mage = {
			Arcane = {
				MasteryRating=1.85,
				Intellect=4.00,
				HasteRating=1.43,
				CritRating=1.45,
				Versatility=1.29,
				Multistrike=1.55
			},
			
			Fire = {
				MasteryRating=1.38,
				Intellect=3.44,
				HasteRating=1.31,
				CritRating=1.73,
				Versatility=1.11,
				Multistrike=1.39
			},
			
			Frost = {
				MasteryRating=1.21,
				Intellect=4.40,
				HasteRating=1.34,
				CritRating=1.70,
				Versatility=1.57,
				Multistrike=2.17
			}
		},
		
		Monk = {
			Brewmaster = {
				Agility=6.24,
				Armor=23.89,
				Stamina=34.68,
				MasteryRating=9.40,
				HasteRating=6.09,
				Multistrike=4.39,
				CritRating=3.82,
				Versatility=6.75,
				BonusArmor=19.65
			},
			
			Mistweaver = {
				MasteryRating=0.39,
				Versatility=0.69,
				HasteRating=0.53,
				Spirit=0.23,
				CritRating=0.99,
				Intellect=1.51,
				Multistrike=1.14
			},
			
			Windwalker = {
				Agility=4.51,
				MasteryRating=0.55,
				HasteRating=1.42,
				CritRating=1.65,
				Versatility=1.60,
				Multistrike=1.80
			}		
		},	
		
		Paladin = {
			Holy = {		
				Intellect = 1.54,
				CritRating = 1.17,
				Multistrike = 0.87,
				MasteryRating = 0.72,
				Versatility = 0.56,
				HasteRating = 0.41,
				Spirit = 0.26
			},
			
			Retribution = {
				Strength = 4.55,
				Multistrike = 1.76,
				MasteryRating = 1.66,
				CritRating = 1.60,
				Versatility = 1.50,
				HasteRating = 1.22
			},
			
			Protection = {
				Stamina = 31.89,
				BonusArmor = 17.73,
				Armor = 13.0,
				Strength = 8.75,
				Versatility = 7.47,		
				MasteryRating = 6.87,
				HasteRating = 5.38,
				CritRating = 4.56,
				Multistrike = 3.44
			}
		},
		
		Priest = {
			Discipline = {
				MasteryRating=0.97,
				Versatility=0.59,
				HasteRating=0.45,
				Spirit=0.29,
				CritRating=1.05,
				Intellect=1.57,
				Multistrike=0.75
			},
			
			Holy = {
				MasteryRating=0.90,
				Versatility=0.59,
				HasteRating=0.45,
				Spirit=0.29,
				CritRating=0.75,
				Intellect=1.57,
				Multistrike=1.05
			},
			
			Shadow = {
				MasteryRating=1.86,
				Intellect=4.39,
				HasteRating=1.76,
				CritRating=1.57,
				Versatility=1.41,
				Multistrike=1.59
			}
		},
		
		Rogue = {
			Assassination = {
				Agility=4.08,
				MasteryRating=1.36,
				HasteRating=1.12,
				CritRating=1.37,
				Versatility=1.23,
				Multistrike=1.43
			},
			
			Combat = {
				Agility=4.31,
				MasteryRating=1.43,
				HasteRating=1.61,
				CritRating=1.35,
				Versatility=1.33,
				Multistrike=1.51
			},
			
			Subtlety = {
				Agility=4.98,
				MasteryRating=1.85,
				HasteRating=1.37,
				CritRating=1.45,
				Versatility=1.42,
				Multistrike=1.93
			}
		},
		
		Shaman = {
			Elemental = {
				MasteryRating=1.56,
				Intellect=4.08,
				HasteRating=1.52,
				CritRating=1.54,
				Versatility=1.36,
				Multistrike=1.77
			},
			
			Enhancement = {
				Agility=4.61,
				MasteryRating=1.55,
				HasteRating=1.47,
				CritRating=1.41,
				Versatility=1.38,
				Multistrike=1.59
			},
			
			Restoration = {
				MasteryRating=0.89,
				Versatility=0.58,
				HasteRating=0.43,
				Spirit=0.28,
				CritRating=1.04,
				Intellect=1.56,
				Multistrike=0.74
			}
		},
		
		Warlock = {
			Afflication = {
				MasteryRating=1.62,
				Intellect=3.75,
				HasteRating=1.19,
				CritRating=1.41,
				Versatility=1.23,
				Multistrike=1.39
			},
			
			Demonology = {
				MasteryRating=1.39,
				Intellect=3.79,
				HasteRating=1.56,
				CritRating=1.34,
				Versatility=1.24,
				Multistrike=1.43
			},
			
			Destruction = {
				MasteryRating=1.32,
				Intellect=4.24,
				HasteRating=1.03,
				CritRating=1.68,
				Versatility=1.38,
				Multistrike=1.53
			}
		},
		
		Warrior = {
			Arms = {
				Strength=4.27,
				MasteryRating=1.47,
				HasteRating=1.42,
				CritRating=2.1,
				Versatility=1.43,
				Multistrike=1.55
			},
			
			Fury = {
				Strength=3.72,
				MasteryRating=1.63,
				HasteRating=1.62,
				CritRating=1.96,
				Versatility=1.36,
				Multistrike=1.76
			},
			
			Protection = {
				Strength=5.29,
				Armor=11.35,
				Stamina=27.93,
				MasteryRating=4.02,
				HasteRating=1.56,
				Multistrike=2.55,
				CritRating=4.26,
				Versatility=5.89,
				BonusArmor=13.75
			},
			
			Gladiator = {
				Strength=4.6,
				MasteryRating=1.44,
				HasteRating=1.92,
				Multistrike=1.71,
				CritRating=1.97,
				Versatility=1.5,
				BonusArmor=4.39
			}		
		},
	},
	PVP = {
		DeathKnight = {
			Blood = {
				Stamina = 23.44,
				Armor = 14.18,
				BonusArmor = 13.48,
				Multistrike = 6.27,
				Strength = 5.66,
				PvpPower = 5.66,
				HasteRating=5.90,
				Versatility = 5.68,
				MasteryRating = 3.32,			
				CritRating = 2.85
			},
			
			Frost = {
				Strength = 4.73,
				PvpPower = 4.73,
				MasteryRating = 1.97,
				Multistrike = 1.64,
				Versatility = 1.46,
				CritRating = 1.26,
				HasteRating = 1.18
			},
			
			Unholy = {
				Strength = 5.15,
				PvpPower = 5.15,
				MasteryRating = 2.24,
				Multistrike = 2.30,
				CritRating = 1.75,
				Versatility = 1.58,
				HasteRating = 1.26
			}	
		},
		
		Druid = {
			Balance = {
				Intellect = 4.48,
				PvpPower = 4.48,
				HasteRating = 1.72,
				CritRating = 1.71,
				MasteryRating = 1.71,
				Multistrike = 1.70,
				Versatility = 1.45			
			},
			
			Feral = {
				Agility = 4.84,
				PvpPower = 4.84,
				CritRating = 1.75,
				Multistrike = 1.67,			
				Versatility = 1.49,
				HasteRating = 1.48,
				MasteryRating = 1.39
			},
			
			Guardian = {
				Agility=4.80,
				PvpPower=4.80,
				Armor=23.62,
				Stamina=16.46,
				MasteryRating=6.23,
				HasteRating=2.65,
				Multistrike=12.21,
				CritRating=1.59,
				Versatility=5.81,
				BonusArmor=10.17
			},
			
			Restoration = {
				MasteryRating=0.75,
				Versatility=0.37,
				HasteRating=0.82,
				Spirit=0.29,
				CritRating=0.45,
				Intellect=1.57,
				PvpPower=1.57,
				Multistrike=0.67
			}
		},
		
		Hunter = {
			BeastMastery = {
				Agility=4.88,
				PvpPower=4.88,
				MasteryRating=1.61,
				HasteRating=1.42,
				CritRating=1.56,
				Versatility=1.53,
				Multistrike=1.66
			},
			
			Marksmanship = {
				Agility=4.80,
				PvpPower=4.80,
				MasteryRating=1.22,
				HasteRating=1.24,
				CritRating=1.64,
				Versatility=1.54,
				Multistrike=1.86
			},
			
			Survival = {
				Agility=4.98,
				PvpPower=4.98,
				MasteryRating=0.85,
				HasteRating=1.02,
				CritRating=1.47,
				Versatility=1.46,
				Multistrike=1.87
			}
		},
		
		Mage = {
			Arcane = {
				MasteryRating=1.85,
				Intellect=4.00,
				PvpPower=4.00,
				HasteRating=1.43,
				CritRating=1.45,
				Versatility=1.29,
				Multistrike=1.55
			},
			
			Fire = {
				MasteryRating=1.38,
				Intellect=3.44,
				PvpPower=3.44,
				HasteRating=1.31,
				CritRating=1.73,
				Versatility=1.11,
				Multistrike=1.39
			},
			
			Frost = {
				MasteryRating=1.21,
				Intellect=4.40,
				PvpPower=4.40,
				HasteRating=1.34,
				CritRating=1.70,
				Versatility=1.57,
				Multistrike=2.17
			}
		},
		
		Monk = {
			Brewmaster = {
				Agility=6.24,
				PvpPower=6.24,
				Armor=23.89,
				Stamina=34.68,
				MasteryRating=9.40,
				HasteRating=6.09,
				Multistrike=4.39,
				CritRating=3.82,
				Versatility=6.75,
				BonusArmor=19.65
			},
			
			Mistweaver = {
				MasteryRating=0.39,
				Versatility=0.69,
				HasteRating=0.53,
				Spirit=0.23,
				CritRating=0.99,
				Intellect=1.51,
				PvpPower=1.51,
				Multistrike=1.14
			},
			
			Windwalker = {
				Agility=4.51,
				PvpPower=4.51,
				MasteryRating=0.55,
				HasteRating=1.42,
				CritRating=1.65,
				Versatility=1.60,
				Multistrike=1.80
			}		
		},	
		
		Paladin = {
			Holy = {		
				Intellect = 1.54,
				PvpPower = 1.54,
				CritRating = 1.17,
				Multistrike = 0.87,
				MasteryRating = 0.72,
				Versatility = 0.56,
				HasteRating = 0.41,
				Spirit = 0.26
			},
			
			Retribution = {
				Strength = 4.55,
				PvpPower = 4.55,
				Multistrike = 1.76,
				MasteryRating = 1.66,
				CritRating = 1.60,
				Versatility = 1.50,
				HasteRating = 1.22
			},
			
			Protection = {
				Stamina = 31.89,
				BonusArmor = 17.73,
				Armor = 13.0,
				Strength = 8.75,
				PvpPower = 8.75,
				Versatility = 7.47,		
				MasteryRating = 6.87,
				HasteRating = 5.38,
				CritRating = 4.56,
				Multistrike = 3.44
			}
		},
		
		Priest = {
			Discipline = {
				MasteryRating=0.97,
				Versatility=0.59,
				HasteRating=0.45,
				Spirit=0.29,
				CritRating=1.05,
				Intellect=1.57,
				PvpPower=1.57,
				Multistrike=0.75
			},
			
			Holy = {
				MasteryRating=0.90,
				Versatility=0.59,
				HasteRating=0.45,
				Spirit=0.29,
				CritRating=0.75,
				Intellect=1.57,
				PvpPower=1.57,
				Multistrike=1.05
			},
			
			Shadow = {
				MasteryRating=1.86,
				Intellect=4.39,
				PvpPower=4.39,
				HasteRating=1.76,
				CritRating=1.57,
				Versatility=1.41,
				Multistrike=1.59
			}
		},
		
		Rogue = {
			Assassination = {
				Agility=4.08,
				PvpPower=4.08,
				MasteryRating=1.36,
				HasteRating=1.12,
				CritRating=1.37,
				Versatility=1.23,
				Multistrike=1.43
			},
			
			Combat = {
				Agility=4.31,
				PvpPower=4.31,
				MasteryRating=1.43,
				HasteRating=1.61,
				CritRating=1.35,
				Versatility=1.33,
				Multistrike=1.51
			},
			
			Subtlety = {
				Agility=4.98,
				PvpPower=4.98,
				MasteryRating=1.85,
				HasteRating=1.37,
				CritRating=1.45,
				Versatility=1.42,
				Multistrike=1.93
			}
		},
		
		Shaman = {
			Elemental = {
				MasteryRating=1.56,
				Intellect=4.08,
				PvpPower=4.08,
				HasteRating=1.52,
				CritRating=1.54,
				Versatility=1.36,
				Multistrike=1.77
			},
			
			Enhancement = {
				Agility=4.61,
				PvpPower=4.61,
				MasteryRating=1.55,
				HasteRating=1.47,
				CritRating=1.41,
				Versatility=1.38,
				Multistrike=1.59
			},
			
			Restoration = {
				MasteryRating=0.89,
				Versatility=0.58,
				HasteRating=0.43,
				Spirit=0.28,
				CritRating=1.04,
				Intellect=1.56,
				PvpPower=1.56,
				Multistrike=0.74
			}
		},
		
		Warlock = {
			Afflication = {
				MasteryRating=1.62,
				Intellect=3.75,
				PvpPower=3.75,
				HasteRating=1.19,
				CritRating=1.41,
				Versatility=1.23,
				Multistrike=1.39
			},
			
			Demonology = {
				MasteryRating=1.39,
				Intellect=3.79,
				PvpPower=3.79,
				HasteRating=1.56,
				CritRating=1.34,
				Versatility=1.24,
				Multistrike=1.43
			},
			
			Destruction = {
				MasteryRating=1.32,
				Intellect=4.24,
				PvpPower=4.24,
				HasteRating=1.03,
				CritRating=1.68,
				Versatility=1.38,
				Multistrike=1.53
			}
		},
		
		Warrior = {
			Arms = {
				Strength=4.27,
				PvpPower=4.27,
				MasteryRating=1.47,
				HasteRating=1.42,
				CritRating=2.1,
				Versatility=1.43,
				Multistrike=1.55
			},
			
			Fury = {
				Strength=3.72,
				PvpPower=3.72,
				MasteryRating=1.63,
				HasteRating=1.62,
				CritRating=1.96,
				Versatility=1.36,
				Multistrike=1.76
			},
			
			Protection = {
				Strength=5.29,
				PvpPower=5.29,
				Armor=11.35,
				Stamina=27.93,
				MasteryRating=4.02,
				HasteRating=1.56,
				Multistrike=2.55,
				CritRating=4.26,
				Versatility=5.89,
				BonusArmor=13.75
			},
			
			Gladiator = {
				Strength=4.6,
				PvpPower=4.6,
				MasteryRating=1.44,
				HasteRating=1.92,
				Multistrike=1.71,
				CritRating=1.97,
				Versatility=1.5,
				BonusArmor=4.39
			}		
		}
	}
}

function PriorO:UpdatePanelWidth()
	MPP:SetWidth(E.db.PriorityOptions.panel.panelWidth)
end

function PriorO:UpdatePanelHeight()
	MPP:SetHeight(E.db.PriorityOptions.panel.panelHeight)
end

function PriorO:UpdateAnchor()
	MPP:SetPoint(E.db.PriorityOptions.panel.panelAnchor, E.db.PriorityOptions.panel.panelX, E.db.PriorityOptions.panel.panelY)
	
	MPP:SetWidth(E.db.PriorityOptions.panel.panelWidth)
	MPP:SetHeight(E.db.PriorityOptions.panel.panelHeight)	
end

function PriorO:UpdatePanelMouseOver()	
	if tostring(E.db.PriorityOptions.mouse.mouseOver) == "true" then
		MPP:SetAlpha(0)	
		MPP:SetScript('OnEnter', showPriority)
		MPP:SetScript('OnLeave', hidePriority)
	else 
		MPP:SetAlpha(E.db.PriorityOptions.panel.panelOpacity / 100)
		MPP:SetScript('OnEnter', empty)
		MPP:SetScript('OnLeave', empty)
	end
end

function PriorO:UpdatePanelOpacity()
	MPP:SetAlpha(E.db.PriorityOptions.panel.panelOpacity / 100)
	if E.db.PriorityOptions.mouse.mouseOver then
		UIFrameFadeIn(MPP, E.db.PriorityOptions.mouse.fadeTime / 1000, E.db.PriorityOptions.panel.panelOpacity / 100, 0)
	end
end

function PriorO:UpdatePanelFade()
	MPP:SetAlpha(E.db.PriorityOptions.panel.panelOpacity / 100)
	if E.db.PriorityOptions.mouse.mouseOver then
		UIFrameFadeIn(MPP, E.db.PriorityOptions.mouse.fadeTime / 1000, E.db.PriorityOptions.panel.panelOpacity / 100, 0)
	end
end

function PriorO:UpdateColours()
	updatePriority()
end

function PriorO:UpdateStatType()
	updatePriority()
end

function PriorO:UpdateFont() 
	MPP.text:SetFont([[Interface\AddOns\ElvUI\media\fonts\PT_Sans_Narrow.ttf]], E.db.PriorityOptions.fonts.fontSize, 'OUTLINE')
end

function showPriority()
	UIFrameFadeIn(MPP, E.db.PriorityOptions.mouse.fadeTime / 1000, 0, E.db.PriorityOptions.panel.panelOpacity / 100)
end

function hidePriority()
	UIFrameFadeIn(MPP, E.db.PriorityOptions.mouse.fadeTime / 1000, E.db.PriorityOptions.panel.panelOpacity / 100, 0)
end

function empty()
	return true
end

if (E.db.PriorityOptions ~= nil) then
	-- print("nil Profile Structure")
	
	E.db.PriorityOptions = {
		['mouse'] = {
			['mouseOver'] = false,
			['fadeTime'] = 750,
		},
		['panel'] = {
			['panelWidth'] = 800,
			['panelHeight'] = 32,
			['panelOpacity'] = 75,
			['panelAnchor'] = 'TOP',
			['panelX'] = 0,
			['panelY'] = 1,
		},
		['fonts'] = {
			['mainColour'] = {
				r = 1,
				g = 1,
				b = 1,
				a = 1
			},
			['titleColour'] = {
				r = 0.75,
				g = 0.75,
				b = 0.25,
				a = 1
			},
			['statisticColour'] = {
				r = 0.25,
				g = 1,
				b = 0.25,
				a = 1
			},
			['pawnColour'] = {
				r = 0.2,
				g = 0.2,
				b = 1,
				a = 1
			},
			['fontSize'] = 12,
		},
		['stats'] = {
			modeType = 'PVE'
		}
	}
	
	-- print("E.db.PriorityOptions structure rebuilt")
end

P['PriorityOptions'] = {
	['mouse'] = {
		['mouseOver'] = false,
		['fadeTime'] = 750,
	},
	['panel'] = {
		['panelWidth'] = 800,
		['panelHeight'] = 32,
		['panelOpacity'] = 75,
		['panelAnchor'] = 'TOP',
		['panelX'] = 0,
		['panelY'] = 1,
	},
	['fonts'] = {
		['mainColour'] = {
			r = 1,
			g = 1,
			b = 1,
			a = 1
		},
		['titleColour'] = {
			r = 0.75,
			g = 0.75,
			b = 0.25,
			a = 1
		},
		['statisticColour'] = {
			r = 0.25,
			g = 1,
			b = 0.25,
			a = 1
		},
		['pawnColour'] = {
			r = 0.2,
			g = 0.2,
			b = 1,
			a = 1
		},
		['fontSize'] = 12,
	},
	['stats'] = {
		['modeType'] = 'PVE'
	}
}

V['PriorityOptions'] = P['PriorityOptions']

function PriorO:PriorityOptions()
	local Prior = E:GetModule('PriorityOptions')

	E.Options.args.PriorityOptions = {
		type = 'group',
		name = "|cFF1784D1" .. "Priorities",
		desc = L["Allows multiple options for displaying the Stat Priority panel."],
		get = function(info) return E.db.MyPriority[ info[#info] ] end,
		set = function(info, value) E.db.MyPriority[ info[#info] ] = value end,
		args = {
			intro = {
				order = 1,
				type = 'description',
				name = 'Settings for the Stat Priority panel.',
			},
			mouse = {
				type = 'group',
				name = L["Mouse Functions"],
				guiInline = true,
				order = 10,
				disabled = false,
				args = {
					mouseOver = {
						order = 11,
						type = 'toggle',
						name = L["Mouse Over"],
						desc = L["Toggles the Stat Priorities panel to be hidden until moused over or always visible."],
						set = function(info, value) E.db.PriorityOptions.mouse.mouseOver = value PriorO:UpdatePanelMouseOver() end,
						get = function(info) return E.db.PriorityOptions.mouse.mouseOver end
					},
					fadeTime = {
						type = "range",
						order = 12,
						isPercent = false,
						name = L["Fade Time"],
						desc = L["Changes the length of time fading in and out when mouseover is enabled for the Stat Priorities panel."],
						min = 100,
						max = 2500,
						step = 1,
						set = function(info, value) E.db.PriorityOptions.mouse.fadeTime = value PriorO:UpdatePanelFade() end,
						get = function(info) return E.db.PriorityOptions.mouse.fadeTime end
					}
				}
			},
			panel = {
				type = 'group',
				name = L["Panel Settings"],
				guiInline = true,
				order = 20,
				disabled = false,
				args = {
					panelWidth = {
						type = "range",
						order = 21,
						isPercent = false,
						name = L["Width"],
						desc = L["Changes the width of the Stat Priorities panel."],
						min = 200,
						max = 1200,
						step = 1,
						set = function(info, value) E.db.PriorityOptions.panel.panelWidth = value PriorO:UpdatePanelWidth() end,
						get = function(info) return E.db.PriorityOptions.panel.panelWidth end
					},
					panelHeight = {
						type = "range",
						order = 22,
						isPercent = false,
						name = L["Height"],
						desc = L["Changes the height of the Stat Priorities panel."],
						min = 18,
						max = 60,
						step = 1,
						set = function(info, value) E.db.PriorityOptions.panel.panelHeight = value PriorO:UpdatePanelHeight() end,
						get = function(info) return E.db.PriorityOptions.panel.panelHeight end
					},
					panelOpacity = {
						type = "range",
						order = 23,
						isPercent = yes,
						name = L["Panel Opacity"],
						desc = L["Changes the background opacity of the Stat Priorities panel."],
						min = 0,
						max = 100,
						step = 1,
						set = function(info, value) E.db.PriorityOptions.panel.panelOpacity = value PriorO:UpdatePanelOpacity() end,
						get = function(info) return E.db.PriorityOptions.panel.panelOpacity end
					},
					panelX = {
						type = "range",
						order = 24,
						isPercent = false,
						name = L["X Offset"],
						desc = L["Changes the x-offset of the Stat Priorities panel."],
						min = -800,
						max = 800,
						step = 1,
						set = function(info, value) E.db.PriorityOptions.panel.panelX = value PriorO:UpdateAnchor() end,
						get = function(info) return E.db.PriorityOptions.panel.panelX end
					},
					panelY = {
						type = "range",
						order = 25,
						isPercent = false,
						name = L["Y Offset"],
						desc = L["Changes the y-offset of the Stat Priorities panel."],
						min = -800,
						max = 800,
						step = 1,
						set = function(info, value) E.db.PriorityOptions.panel.panelY = value PriorO:UpdateAnchor() end,
						get = function(info) return E.db.PriorityOptions.panel.panelY end
					},
					panelAnchor = {
						type = "select",
						order = 26,
						name = L["Panel Anchor"],
						desc = L["Changes the anchor point of the Stat Priorities panel."],
						set = function(info, value) E.db.PriorityOptions.panel.panelAnchor = value PriorO:UpdateAnchor() end,
						get = function(info) return E.db.PriorityOptions.panel.panelAnchor end,
						values = {
							['TOP'] = L['Top']
						}
					}
				}
			},
			fonts = {
				type = 'group',
				name = L["Font Settings"],
				guiInline = true,
				order = 30,
				disabled = false,
				args = {
					mainColour = {
						type = 'color',
						name = L["Symbol Colour"],
						hasAlpha = true,
						order = 43,
						get = function(info)
							local temp = E.db.PriorityOptions.fonts.mainColour
							return temp.r, temp.g, temp.b, temp.a
						end,
						set = function(info, r, g, b)
							E.db.PriorityOptions.fonts.mainColour.r, E.db.PriorityOptions.fonts.mainColour.g, E.db.PriorityOptions.fonts.mainColour.b = r, g, b
							
							PriorO:UpdateColours()
						end
					},
					titleColour = {
						type = 'color',
						name = L["Title Colour"],
						hasAlpha = true,
						order = 41,
						get = function(info)
							local temp = E.db.PriorityOptions.fonts.titleColour
							return temp.r, temp.g, temp.b, temp.a
						end,
						set = function(info, r, g, b)
							E.db.PriorityOptions.fonts.titleColour.r, E.db.PriorityOptions.fonts.titleColour.g, E.db.PriorityOptions.fonts.titleColour.b = r, g, b
							
							PriorO:UpdateColours()
						end
					},
					statisticColour = {
						type = 'color',
						name = L["Statistic Colour"],
						hasAlpha = true,
						order = 42,
						get = function(info)
							local temp = E.db.PriorityOptions.fonts.statisticColour
							return temp.r, temp.g, temp.b, temp.a
						end,
						set = function(info, r, g, b)
							E.db.PriorityOptions.fonts.statisticColour.r, E.db.PriorityOptions.fonts.statisticColour.g, E.db.PriorityOptions.fonts.statisticColour.b = r, g, b
							
							PriorO:UpdateColours()
						end
					},
					pawnColour = {
						type = 'color',
						name = L["Pawn Value Colour"],
						hasAlpha = true,
						order = 44,
						get = function(info)
							local temp = E.db.PriorityOptions.fonts.pawnColour
							return temp.r, temp.g, temp.b, temp.a
						end,
						set = function(info, r, g, b)
							E.db.PriorityOptions.fonts.pawnColour.r, E.db.PriorityOptions.fonts.pawnColour.g, E.db.PriorityOptions.fonts.pawnColour.b = r, g, b
							
							PriorO:UpdateColours()
						end
					},
					fontSize = {
						type = "range",
						order = 45,
						isPercent = false,
						name = L["Font Size"],
						desc = L["Changes the font size of the text within the Stat Priorities panel."],
						min = 10,
						max = 24,
						step = 1,
						set = function(info, value) E.db.PriorityOptions.fonts.fontSize = value PriorO:UpdateFont() end,
						get = function(info) return E.db.PriorityOptions.fonts.fontSize end
					}
				}
			},
			stats = {
				type = 'group',
				name = L["Stats"],
				guiInline = true,
				order = 50,
				desc = "",
				args = {
					modeType = {
						type = "select",
						order = 51,
						name = L["Stat Mode"],
						desc = L["Switches between PVP and PVE Stats."],
						set = function(info, value) E.db.PriorityOptions.stats.modeType = value PriorO:UpdateStatType() end,
						get = function(info) return E.db.PriorityOptions.stats.modeType end,
						values = {
							['PVE'] = L['PVE'],
							['PVP'] = L['PVP']
						}
					},
					text = {
						order = 52,
						type = "description",
						name = L["Noxxic has not yet released stat weights for PVP."]
					}
				}
			},
			details = {
				type = 'group',
				name = L["Details"],
				guiInline = true,
				order = 60,
				desc = "",
				args = {
					text = {
						order = 1,
						type = "description",
						name = "Version: " .. PriorO.Version .. "\n\nReleased: " .. PriorO.Released .. "\n\nUpdated: " .. PriorO.Updated
					}
				}
			},
			credits = {
				type = 'group',
				name = "|cFF1784D1" .. "Credits",
				guiInline = true,
				order = 100,
				desc = "",
				args = {
					text = {
						order = 1,
						type = "description",
						name = L["Created by |cFFDDDDDDKrypt (Ectorkrypt-Barthilas)|r.\n\nSpecial thanks to |cFFDDDDDDBlazeflack|r from the forums for the assistance.\n\n\n\nAdditional thanks to Darknelix-Barthilas for the moral support with addon development (thanks mate)."]
					}
				}
			}
		}
	}
end

function PriorO:GetOptions()
	PriorO:PriorityOptions()
end

function PriorO:Initialize()
  ElvUIPlugin:RegisterPlugin(ElvUIPriority, PriorO.GetOptions)
end

E:RegisterModule(PriorO:GetName())



function updatePriority()			
	local unitLevel = UnitLevel("player")
	local playerClass, _ = UnitClass("player")
	local currentSpec = GetSpecialization()
	local currentSpecName = currentSpec and select(2, GetSpecializationInfo(currentSpec)) or "None"
	
	local playerClassSafe = gsub(playerClass, ' ', '')
	local currentSpecNameSafe = gsub(currentSpecName, ' ', '')
	
	local specString = ""
	
	if currentSpecName == "None" then
		specString = "Level " .. unitLevel .. " " .. playerClass .. " (" .. PvpPveReplace[E.db.PriorityOptions.stats.modeType] .. ")"
	else 		
		specString = "Level " .. unitLevel .. " " .. currentSpecName .. " " .. playerClass .. " (" .. PvpPveReplace[E.db.PriorityOptions.stats.modeType] .. ")"
	end
	
	local outputString = "|cFF" .. buildHex(E.db.PriorityOptions.fonts.titleColour) .. specString .. "\n"	

	if currentSpecNameSafe ~= "None" then		
		local myPriority = Priorities[E.db.PriorityOptions.stats.modeType][playerClassSafe][currentSpecNameSafe]		
		local sortedPriority = getKeysSortedByValue(myPriority, function(a, b) return a > b end)
		
		local lowestStat = 100
		local statsLength = 0
		
		for _, key in ipairs(sortedPriority) do
			statsLength = statsLength + 1
			lowestStat = myPriority[key]
		end
		
		local index = 0
		local lastVal = 0
		
		for _, key in ipairs(sortedPriority) do
			index = index + 1
			thisVal = round(myPriority[key] / lowestStat, 2)			
			
			if index > 1 then
				if lastVal == thisVal then
					outputString = outputString .. "|cFF" .. buildHex(E.db.PriorityOptions.fonts.mainColour) .. " = "
				else 
					outputString = outputString .. "|cFF" .. buildHex(E.db.PriorityOptions.fonts.mainColour) .. " > "
				end
			end
			
			outputString = outputString .. "|cFF" .. buildHex(E.db.PriorityOptions.fonts.statisticColour) .. ReplaceStats[key] .. " |cFF" .. buildHex(E.db.PriorityOptions.fonts.pawnColour) .. thisVal .. "|cFF" .. buildHex(E.db.PriorityOptions.fonts.statisticColour)
			lastVal = thisVal
		end
	else
		outputString = outputString .. "|cFF" .. buildHex(E.db.PriorityOptions.fonts.statisticColour) .. "Stat priorities not avaliable until you have an active Talent Specialization."
	end
	
	MPP.text:SetText(outputString)
end

MPP = CreateFrame("Frame", "MyPriorityPanel", E.UIParent)

function createPriority()
	MPP:SetWidth(E.db.PriorityOptions.panel.panelWidth)
	MPP:SetHeight(E.db.PriorityOptions.panel.panelHeight)
	
	MPP:SetPoint(E.db.PriorityOptions.panel.panelAnchor, E.db.PriorityOptions.panel.panelX, E.db.PriorityOptions.panel.panelY)
	MPP:SetFrameStrata("BACKGROUND")
	MPP:SetTemplate('Default', true)
	
	MPP.text = MPP:CreateFontString(nil, 'OVERLAY')
	MPP.text:SetFont([[Interface\AddOns\ElvUI\media\fonts\PT_Sans_Narrow.ttf]], E.db.PriorityOptions.fonts.fontSize, 'OUTLINE')
	MPP.text:SetAllPoints(true)
	MPP.text:SetJustifyH("CENTER")
	MPP.text:SetJustifyV("MIDDLE")
	MPP.text:SetTextColor(1, 1, 1, 1)
	
	MPP:EnableMouse(true)
	
	if tostring(E.db.PriorityOptions.mouse.mouseOver) == "true" then
		MPP:SetAlpha(0)	
		MPP:SetScript('OnEnter', showPriority)
		MPP:SetScript('OnLeave', hidePriority)
	else 
		MPP:SetAlpha(E.db.PriorityOptions.panel.panelOpacity / 100)
		MPP:SetScript('OnEnter', empty)
		MPP:SetScript('OnLeave', empty)
	end
	
	MPP:RegisterEvent('ACTIVE_TALENT_GROUP_CHANGED')
	MPP:SetScript("OnEvent", updatePriority)
	
	updatePriority()
end

MPP:RegisterEvent('PLAYER_ENTERING_WORLD')
MPP:SetScript("OnEvent", createPriority)

