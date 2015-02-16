local GridLayout = Grid:GetModule("GridLayout")

GridLayout:AddLayout("Kait Single Column", {
	[1] = {
		groupFilter = "1,2,3,4,5,6,7,8",
		groupBy = "CLASS",
		groupingOrder = "HUNTER,WARRIOR,DEATHKNIGHT,ROGUE,MONK,PALADIN,DRUID,SHAMAN,PRIEST,MAGE,WARLOCK",
		unitsPerColumn = 40,
		maxColumns = 1,
	},
})