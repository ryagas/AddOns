local usemouseover = true	-- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.

function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 3599 -- Searing Totem
	self.config.hastedSpellID = {2008,10} -- Ancestral Spirit
	
	-- General
	
	-- Elemental
	
	-- Flame Shock
	self:newSpell({
		debuff = {8050,3},
		cooldown = 8050,
		requiredTree = {0,1},
		requiredLevel = 5,
	})

	-- Lava Burst
	self:newSpell({
		cast = 51505,
		cooldown = 51505,
		requiredTree = 1,
		requiredLevel = 34,
	})

	-- Lightning Bolt + Chain Lightning + Earthquake + Lightning Shield Charges (minstacks 2)
	self:newSpell({
		cast = {403,421,61882},
		cooldown = 61882,
		requiredTree = 1,
		playerbuff = 324,  
		icon = 324,
	})

	-- Unleash Flame
	self:newSpell({
		cooldown = 165462,
		requiredTree = 1,
		requiredLevel = 81,
		talent = 16
	})
    
    -- Ascendance (Elemental)
    self:newSpell({
        cooldown = 165339,
        playerbuff = 114050,
        requiredTree = 1,
        requiredLevel = 87,
    })
	
	-- Enhancement --
	
	--8050 -- Flame shock
	
	-- Flame Shock
	self:newSpell({
		debuff = {8050, 3},
		cooldown = 8050,
		requiredTree = 2,
	})
	
	-- Stormstrike / Maelstrom Weapon
	self:newSpell({
		cooldown = 17364,
		requiredTree = 2,
	})
	
	-- Lavalash / Searing Flames
	self:newSpell({
		cooldown = 60103,
		requiredTree = 2,
	})
	
	-- Unleash Elements
	self:newSpell({
		cooldown = 73680,
		requiredTree = 2,
	})
	
	-- Wolves
	self:newSpell({
		cooldown = 51533,
		requiredTree = 2,
	})
    
    -- Ascendance (Enhancement)
    self:newSpell({
        cooldown = 165339,
        playerbuff = 114051,
        requiredTree = 2,
        requiredLevel = 87,
    })
	
	
	-- Restoration --
	
	--Riptide
	self:newSpell({
		playerbuff = {61295,3},
		cooldown = 61295,
		requiredTree = 3,
		auraunit = "target", 
	})
	
	-- Unleash Life
	self:newSpell({
		playerbuff = 73685,
		cooldown = 73685,	
		requiredTree = 3,
	})
	
	--Casts/Chainheal CD if glyphed
	self:newSpell({
		cooldown = 1064,
		cast = {1064, 8004, 77472},
		requiredTree = 3,		
	})
	
	-- Tidal Waves/Healing Rain
	self:newSpell({
		cast = 73920,
		cooldown = 73920,
		playerbuff = 53390,
		requiredTree = 3,
	})
	
	-- Earth Shield
	self:newSpell({
		playerbuff = 974,
		auraunit = "target", 
		requiredTree = 3,
	})
    
    -- Ascendance
    self:newSpell({
        cooldown = 165339,
        playerbuff = 114052,
        requiredTree = 3,
        requiredLevel = 87,
    })
	
    -- TALENTS
    
        -- 60 Talents
        self:newSpell({ -- Elemental Mastery
            cooldown = 16166,
            playerbuff = 16166,
            requiredLevel = 60,
            requiredTalent = 10
        })
        
        self:newSpell({ -- Ancestral Swiftness
            cooldown = 16188,
            playerbuff = 16188,
            requiredLevel = 60,
            requiredTalent = 11
        })
        
        -- 90 Talents
        
        -- Elemental Blast
        self:newSpell({
            cast = 117014,
            cooldown = 117014,
            playerbuff = 117014,
            requiredLevel = 90,
            requiredTalent = 18
        })
        
        -- Elemental Fusion
        self:newSpell({
            playerbuff = 157174,
            requiredTalent = 19,
            requiredTree = {1, 2},
        })
        
        -- Liquid Magma
        self:newSpell({
            cooldown = 152255,
            requiredTalent = 21,
            requiredTree = {1, 2},
        })
        
        -- Cloudburst Totem
        self:newSpell({
            cooldown = 157153,
            requiredTalent = 19,
            requiredTree = 3,
        })
        

        
end


