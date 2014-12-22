function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 1752
	-- General

	-- Slice and Dice
	self:newSpell({
		playerbuff = {5171,0},
		requiredLevel = 22,
        requiredTree = {0, 2, 3},
	})

	-- Rupture
	self:newSpell({
		debuff = {1943,2},
		requiredTree = {1,3},
		requiredLevel = 46,
	})

	-- Assassination

	-- Envenom
	self:newSpell({
		playerbuff = {32645,0},
		requiredTree = 1,
		requiredLevel = 20,
	})

	-- Vendetta
	self:newSpell({
		debuff = {79140,0},
		cooldown = 79140,
		requiredTree = 1,
		requiredLevel = 80,
	})

	-- Combat

	-- Revealing Strike
	self:newSpell({
		debuff = {84617,0},
		requiredTree = 2,
		requiredLevel = 29,
	})

	-- Killing Spree
	self:newSpell({
		playerbuff = {51690,0},
		cooldown = 51690,
		requiredTree = 2,
		requiredLevel = 69,
	})

	-- Adrenaline Rush
	self:newSpell({
		playerbuff = {13750,0},
		cooldown = 13750,
		requiredTree = 2,
		requiredLevel = 49,
	})

	-- Subtlety

	-- Hemo
	self:newSpell({
		debuff = {16511,0},
		requiredTree = 3,
		requiredLevel = 29,
	})

	-- Find Weakness
	self:newSpell({
		debuff = {91021,0},
		requiredTree = 3,
		requiredLevel = 1,
	})

	-- Shadow Dance
	self:newSpell({
		playerbuff = {51713,0},
		cooldown = 51713,
		requiredTree = 3,
		requiredLevel = 69,
	})

	-- Vanish
	self:newSpell({
		playerbuff = {1856,0},
		cooldown = 1856,
		requiredTree = 3, -- comment out to enable for all specs
		requiredLevel = 34,
	})
           
	-- Common

	-- 90 Talents
	self:newSpell({ -- Marked for Death
		debuff = {137619,0},
		cooldown = 137619,
		requiredTalent = 17,
	})
    
    -- Shadow Reflection
    self:newSpell({
        cooldown = 152151,
        playerbuff = 152151,
        requiredTalent = 20,
    })
	
    -- Death from Above
    self:newSpell({
        cooldown = 152150,
        requiredTalent = 21,
    })
	
end
