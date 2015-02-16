-- Kait's hacky solution to getting 1-pixel borders on buffs
-- mostly copied from the Blizzard skin bundled with Masque
-- It doesn't really work, but it looks better than it did before I put this code in, so...


local Masque = LibStub("Masque", true)
if not Masque then return end

Masque:AddSkin(
	"Kait pixel imperfect", {
		Author 			= "Kaitain",
		Version			= "1.0",
		Shape			= "Square",
		Masque_Version 	= 60000,
		Backdrop = {
		Width = 32,
		Height = 32,
		TexCoords = {0.2, 0.8, 0.2, 0.8},
		Texture = [[Interface\Buttons\UI-EmptySlot]],
	},
	Icon = {
		Width = 32,
		Height = 32,
	},
	Flash = {
		Width = 30,
		Height = 30,
		TexCoords = {0.2, 0.8, 0.2, 0.8},
		Texture = [[Interface\Buttons\UI-QuickslotRed]],
	},
	Cooldown = {
		Width = 32,
		Height = 32,
	},
	Pushed = {
		Width = 34,
		Height = 34,
		Texture = [[Interface\Buttons\UI-Quickslot-Depress]],
	},
	Normal = {
		Width = 56,
		Height = 56,
		OffsetX = 0.5,
		OffsetY = -0.5,
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 31,
		Height = 31,
		BlendMode = "ADD",
		Texture = [[Interface\Buttons\CheckButtonHilight]],
	},
	Border = {
		Width = 60,
		Height = 60,
		OffsetX = 0.5,
		OffsetY = 0.5,
	},
	Gloss = {
		Hide = true,
	},
	AutoCastable = {
		Width = 56,
		Height = 56,
		OffsetX = 0.5,
		OffsetY = -0.5,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 30,
		Height = 30,
		BlendMode = "ADD",
		Texture = [[Interface\Buttons\ButtonHilight-Square]],
	},
	Name = {
		Width = 32,
		Height = 10,
		OffsetY = 4,
	},
	Count = {
		Width = 32,
		Height = 10,
		OffsetX = -1,
		OffsetY = 5,
	},
	HotKey = {
		Width = 32,
		Height = 10,
		OffsetX = 3,
		OffsetY = -4,
	},
	Duration = {
		Width = 36,
		Height = 10,
		OffsetY = -2,
	},
	AutoCast = {
		Width = 32,
		Height = 32,
		OffsetX = 0.5,
		OffsetY = -0.5
	},
})
