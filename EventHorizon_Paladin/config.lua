local usemouseover = true	-- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.

function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 20217 -- Holy Light
	self.config.hastedSpellID = {7328,10} -- Redemption, probably not needed at all
	
	-- General - Judgement
	self:newSpell({
		cooldown = 20271,
		requiredLevel = 3,
		requiredTree = {0,1,3},
	})
	
	-- Crusader Strike
	self:newSpell({
		cooldown = 35395,
		requiredTree = {0,2,3},	-- Everyone but Holy
		keepIcon = true,
	})
	
	-- Holy
        -- Holy Shock
        self:newSpell({
            cooldown = 20473,
            requiredTree = 1,
        })
        
        -- Casts
        self:newSpell({
            cast = {19750,82326,879, 85222, 82327},
            requiredTree = 1,
            requiredLevel = 14,
        })
        

	-- Prot
        -- Avenger's Shield + Holy Shield
        self:newSpell({
            cooldown = 31935,
            requiredTree = 2,
            keepIcon = true,
        })
        
        -- Judgement
        self:newSpell({
            cooldown = 20271,
            requiredTree = 2,
            keepIcon = true,
        })
        

        -- Consecration
        self:newSpell({
            cooldown = 26573,
            playerbuff = 26573,
            requiredTree = 2,
            requiredLevel = 34,
        })

    -- Holy/Prot Talents
        -- Eternal Flame
        self:newSpell({
            cast = 114163,
            playerbuff = {114163, 2},
            requiredTalent = 8,
            requiredTree = {1, 2},
            requiredLevel = 45,
        })
        
        -- Sacred Shield
        self:newSpell({
            playerbuff = {148039, 6},
            requiredTalent = 9,
            requiredTree = {1, 2},
            requiredLevel = 45,
        })
	
	--Ret
        --Inquisition/Exorcism
        self:newSpell({
            cooldown = 879, 
            requiredTree = 3,
            requiredLevel = 81,
        })
        
        --Avenging Wrath/Hammer of Wrath
        self:newSpell({
            playerbuff = 31884,
            cooldown = 24275,
            requiredTree = 3,
            keepIcon = true,
        })
    -- Talents
            
        -- Holy Avenger
        self:newSpell({
            playerbuff = 105809,
            cooldown = 105809,
            requiredTalent = 13,
        })
        
        -- Level 90 Talents
        self:newSpell({
            cooldown = {114165, 114158, 114157},
            playerbuff = {{114165,0}, {114157,0}},
            debuff = 114158,		
            requiredLevel = 90,
        })
        
        -- Beacon of Insight
        self:newSpell({
            cooldown = 157007,
            playerbuff = 157007,
            requiredTree = 1,
            requiredTalent = 20,
        })
        
        -- Seraphim
        self:newSpell({
            cooldown = 152262,
            playerbuff = 152262,
            requiredTree = {2, 3},
            requiredTalent = 20,
        })
end