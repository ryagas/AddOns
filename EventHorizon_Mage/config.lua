function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 118 -- Polymorph
	self.config.hastedSpellID = {118,1.7}
  
    
	-- Arcane
        
        -- Nether Tempest
        self:newSpell({
            debuff = {114923, 1},
            requiredTalent = 13,
            requiredTree = 1,
        })
    
        -- Arcane Blast/Arcane Charges
        self:newSpell({
            cast = 30451,
            auraunit = "player",
            debuff = 36032,
            requiredTree = 1,
        })
        
        
        -- Arcane Barrage/Arcane Missles/Arcane Missiles!
        self:newSpell({
            cooldown = 44425,
            playerbuff = 79683,
            channel = {5143, 5},
            requiredTree = 1,
        })
        
        -- Arcane Orb
        self:newSpell({
            cooldown = 153626,
            requiredTalent = 21,
            requiredTree = 1,
        })
        
        -- Supernova
        self:newSpell({
            cooldown = 157980,
            requiredTalent = 15,
            requiredTree = 1,
        })
        
        -- Presence of Mind
        self:newSpell({
            cooldown = 12043,
            playerbuff = 12043,
            requiredTree = 1,
        })
        
        --Arcane Power
        self:newSpell({
            cooldown = 12042,
            playerbuff = 12042,
            requiredTree = 1,
        })
        
        -- Evocate
        self:newSpell({
            channel = {12051, 3},
            cooldown = 12051,
            requiredTree = 1,
        })
            
	
	--Fire
	
        --[[
        48107 -- Heating Up
        108853 -- Inferno Blast
        11129 -- Combustion
        11366 -- Pyroblast (3 secs)
        48108 -- Pyroblast! (proc)
        12564 -- ignite
        --]]
        
        -- Living Bomb
        self:newSpell({
            debuff = {44457, 4},
            requiredTalent = 13,
            requiredTree = 2,
        })
        
        -- Pyroblast! and Heating Up
        self:newSpell({
            playerbuff = {{48107,0},{48108,0}},
            requiredTree = 2,
        })
    
        -- casts/Inferno Blast/ignite
        self:newSpell({
            cast = {133, 11366, 2948},
            debuff = {12654,2},
            cooldown = 108853,
            icon = 108853,
            requiredTree = 2,
        })
        
        -- Pyroblast!/Pyroblast DoT/Mirror Images
        self:newSpell({
            debuff = {11366,3},
            requiredTree = 2,
        })
        
        -- Blast Wave
        self:newSpell({
            cooldown = 157981,
            requiredTalent = 15,
            requiredTree = 2,
        })
        
        -- Meteor
        self:newSpell({
            cooldown = 153561,
            requiredTalent = 21,
            requiredTree = 2,
        })
        
        -- Combustion
        self:newSpell({
            cooldown = 11129,
            debuff = {83853, 1},
            requiredTree = 2,
        })
        
    -- Frost --
        -- Frost Bomb
        self:newSpell({
            cast = 112948,
            debuff = {112948, 0},
            requiredTalent = 13,
            requiredTree = 3
        })
    
        --Pet Freeze/Water Jet/frost bolt
        self:newSpell({
            cast = 116,
            cooldown = 135029,
            channel = {135029, 1},
            requiredTree = 3,
        })

        --Finger of Frost/Ice Orb
        self:newSpell({
            playerbuff = 44544,
            cooldown = 84714,
            requiredTree = 3,
        })
        
        --Brain Freeze/icy Veins
        self:newSpell({
            cooldown = 12472,
            playerbuff = 57761,
            requiredTree = 3,
        })
	
	
    -- Mage Talents
        -- Ice Nova
        self:newSpell({
            cooldown = 157997,
            requiredTalent = 15,
            requiredTree = 3,
        })

        -- Comet Storm
        self:newSpell({
            cooldown = 153595,
            requiredTalent = 21,
            requiredTree = 3,
        })

        -- Mirror Image
        self:newSpell({
            cooldown = 55342,
            requiredTalent = 16,
        })
        
        -- Prismatic Crystal
        self:newSpell({
            cooldown = 152087,
            requiredTalent = 20,
        })	
end
