function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 686
	self.config.hastedSpellID = {6201,3} -- Create Healthstone
	
	--  ***  Affliction *** --
	-- [Seed of] Corruption
	self:newSpell({
		debuff = {{172,2},{27243,2}},
		icon = 172,
		cast = 27243,
		refreshable = true,
		requiredLevel = 3,
		requiredTree = {1,2},
	})
	
	-- Agony
	self:newSpell({
		debuff = {980,2},
		refreshable = true,
		requiredTree = 1,
		requiredLevel = 36,
	})

	-- Unstable Affliction
	self:newSpell({
		cast = 30108,
		debuff = {30108,2},
		refreshable = true,
		requiredTree = 1,
	})
	
	-- Haunt
	self:newSpell({
		cast = 48181,
		debuff = 48181,
		requiredTree = 1,
		requiredLevel = 62,
	})
	
	-- Drain Soul / drain life
	self:newSpell({
		channel = {{103103, 4}, {689,4}},
		requiredTree = 1,
		requiredLevel = 42,
	})

	
	-- Demonology
	-- Doom
	self:newSpell({
		debuff = {603,15},
		refreshable = true,
		hasted = false,
		requiredTree = 2,
	})


	-- Hand of Guldan and Shadowflame
	self:newSpell({
		cooldown = 105174,
		debuff = {47960,1},
		requiredLevel = 10,
		requiredTree = 2,
	})

	-- Molten Core Buff and Decimation
	self:newSpell({
		playerbuff = {{122355,0},{108869,0}},
		requiredTree = 2,
	})
	
	-- Shadow Bolt, Soulfire and HellFire/Harvest Life
	self:newSpell({
		cast = {686,6353},
		channeled = {{1949,0},{108371,0}},
		requiredLevel = 10,
		requiredTree = 2,
	})	
    
    
	-- *** Destruction *** --
	
	--Immolate
	self:newSpell({
		cast = 348,
		debuff = {348,3},
		recast = true,
		requiredTree = 3,
	})
	
	--Conflag/backdraft/incinerate
	self:newSpell({
		playerbuff = 117828,
		cooldown = 17962, 
		cast = 29722, 
		requiredTree = 3,
	})
	
	--Dark Soul/chaos bolt
	self:newSpell({
		spellID = 113858,
		cast = 116858,
		cooldown = 113858,
		playerbuff = 113858,
		requiredTree = 3,
		icon = 113858,
	})
	
	--Havoc
	self:newSpell({
		playerbuff = {80240,0},
		cooldown = 80240,
		requiredTree = 3,
	})
	
	--Rain of Fire
	self:newSpell({
		playerbuff = 5740,
		requiredTree = 3,
		icon = 5740,
	})	
    
    -- Level 100 Talents
    
        -- Haunting Spirits (Improved Soul Fire anyone?)
        self:newSpell({
            playerbuff = 157698,
            requiredTree = 1,
            requiredTalent = 19,
        })
        
        -- Demonbolt
        self:newSpell({
            cast = 157695,
            auraunit = "PLAYER",
            debuff = 157695,
            requiredTree = 2,
            requiredTalent = 19
        })
        
        -- Cataclysm
        self:newSpell({
            cooldown = 152108,
            cast = 152108,
            requiredTalent = 20,
        })
        
    
    
	
    
end






