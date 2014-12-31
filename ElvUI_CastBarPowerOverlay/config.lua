local E, L, V, P, G, _ = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local CBPO = E:NewModule('CastBarPowerOverlay', 'AceTimer-3.0', 'AceEvent-3.0')
local UF = E:GetModule('UnitFrames');

-- Defaults
V['CBPO'] = {
	['warned'] = false,
}

P['CBPO'] = {
	['player'] = {
		['overlay'] = true,
		['hidetext'] = false,
		['xOffsetText'] = 4,
		['yOffsetText'] = 0,
		['xOffsetTime'] = -4,
		['yOffsetTime'] = 0,
	},
	['target'] = {
		['overlay'] = true,
		['hidetext'] = false,
		['xOffsetText'] = 4,
		['yOffsetText'] = 0,
		['xOffsetTime'] = -4,
		['yOffsetTime'] = 0,
	},
	['focus'] = {
		['overlay'] = true,
		['hidetext'] = false,
		['xOffsetText'] = 4,
		['yOffsetText'] = 0,
		['xOffsetTime'] = -4,
		['yOffsetTime'] = 0,
	},
	['boss'] = {
		['overlay'] = true,
		['hidetext'] = false,
		['xOffsetText'] = 4,
		['yOffsetText'] = 0,
		['xOffsetTime'] = -4,
		['yOffsetTime'] = 0,
	},
	['arena'] = {
		['overlay'] = true,
		['hidetext'] = false,
		['xOffsetText'] = 4,
		['yOffsetText'] = 0,
		['xOffsetTime'] = -4,
		['yOffsetTime'] = 0,
	},
}

function CBPO:InsertOptions()
	if not E.Options.args.blazeplugins then
		E.Options.args.blazeplugins = {
			order = -2,
			type = 'group',
			name = 'Plugins (by Blazeflack)',
			args = {},
		}
	end
	E.Options.args.blazeplugins.args.CBPO = {
		order = 10,
		type = 'group',
		name = 'CastBarPowerOverlay',
		childGroups = 'tab',
		disabled = function() return not E.private.unitframe.enable end,
		args = {
			player = {
				order = 1,
				type = 'group',
				name = L['Player'],
				disabled = function() return IsAddOnLoaded('ElvUI_CastBarSnap') end,
				args = {
					info = {
						order = 1,
						type = 'header',
						name = L['Player'],
					},
					overlay = {
						order = 2,
						type = 'toggle',
						name = L['Overlay on Power Bar'],
						desc = L['Overlay the castbar on the power bar.'],
						get = function(info) return E.db.CBPO.player.overlay end,
						set = function(info, value) E.db.CBPO.player.overlay = value; CBPO:UpdatePlayer(); UF:CreateAndUpdateUF('player') end,
						disabled = function() return not E.db.unitframe.units.player.power.enable end,
					},
					hidetext = {
						order = 3,
						type = 'toggle',
						name = L['Hide Text'],
						desc = L['Hide Castbar text. Useful if your power height is very low or if you use power offset.'],
						get = function(info) return E.db.CBPO.player.hidetext end,
						set = function(info, value) E.db.CBPO.player.hidetext = value; CBPO:UpdatePlayer(); end,
						disabled = function() return not E.db.CBPO.player.overlay end,
					},
					spacer1 = {
						order = 4,
						type = 'description',
						name ='',
					},
					xOffsetText = {
						order = 5,
						type = 'range',
						name = L['Text xOffset'],
						desc = L['Move castbar text to the left or to the right. Default is 4'],
						get = function(info) return E.db.CBPO.player.xOffsetText end,
						set = function(info, value) E.db.CBPO.player.xOffsetText = value; CBPO:UpdatePlayer(); end,
						min = -100, max = 100, step = 1,
						disabled = function() return (not E.db.CBPO.player.overlay or E.db.CBPO.player.hidetext) end,
					},
					yOffsetText = {
						order = 6,
						type = 'range',
						name = L['Text yOffset'],
						desc = L['Move castbar text up or down. Default is 0'],
						get = function(info) return E.db.CBPO.player.yOffsetText end,
						set = function(info, value) E.db.CBPO.player.yOffsetText = value; CBPO:UpdatePlayer(); end,
						min = -50, max = 50, step = 1,
						disabled = function() return (not E.db.CBPO.player.overlay or E.db.CBPO.player.hidetext) end,
					},
					spacer2 = {
						order = 7,
						type = 'description',
						name ='',
					},
					xOffsetTime = {
						order = 8,
						type = 'range',
						name = L['Time xOffset'],
						desc = L['Move castbar time to the left or to the right. Default is -4'],
						get = function(info) return E.db.CBPO.player.xOffsetTime end,
						set = function(info, value) E.db.CBPO.player.xOffsetTime = value; CBPO:UpdatePlayer(); end,
						min = -100, max = 100, step = 1,
						disabled = function() return (not E.db.CBPO.player.overlay or E.db.CBPO.player.hidetext) end,
					},
					yOffsetTime = {
						order = 9,
						type = 'range',
						name = L['Time yOffset'],
						desc = L['Move castbar time up or down. Default is 0'],
						get = function(info) return E.db.CBPO.player.yOffsetTime end,
						set = function(info, value) E.db.CBPO.player.yOffsetTime = value; CBPO:UpdatePlayer(); end,
						min = -50, max = 50, step = 1,
						disabled = function() return (not E.db.CBPO.player.overlay or E.db.CBPO.player.hidetext) end,
					},
				},
			},
			target = {
				order = 2,
				type = 'group',
				name = L['Target'],
				args = {
					info = {
						order = 1,
						type = 'header',
						name = L['Target'],
					},
					overlay = {
						order = 2,
						type = 'toggle',
						name = L['Overlay on Power Bar'],
						desc = L['Overlay the castbar on the power bar.'],
						get = function(info) return E.db.CBPO.target.overlay end,
						set = function(info, value) E.db.CBPO.target.overlay = value; CBPO:UpdateTarget(); UF:CreateAndUpdateUF('target') end,
						disabled = function() return not E.db.unitframe.units.target.power.enable end,
					},
					hidetext = {
						order = 3,
						type = 'toggle',
						name = L['Hide Text'],
						desc = L['Hide Castbar text. Useful if your power height is very low or if you use power offset.'],
						get = function(info) return E.db.CBPO.target.hidetext end,
						set = function(info, value) E.db.CBPO.target.hidetext = value; CBPO:UpdateTarget(); end,
						disabled = function() return not E.db.CBPO.target.overlay end,
					},
					spacer1 = {
						order = 4,
						type = 'description',
						name ='',
					},
					xOffsetText = {
						order = 5,
						type = 'range',
						name = L['Text xOffset'],
						desc = L['Move castbar text to the left or to the right. Default is 4'],
						get = function(info) return E.db.CBPO.target.xOffsetText end,
						set = function(info, value) E.db.CBPO.target.xOffsetText = value; CBPO:UpdateTarget(); end,
						min = -100, max = 100, step = 1,
						disabled = function() return (not E.db.CBPO.target.overlay or E.db.CBPO.target.hidetext) end,
					},
					yOffsetText = {
						order = 6,
						type = 'range',
						name = L['Text yOffset'],
						desc = L['Move castbar text up or down. Default is 0'],
						get = function(info) return E.db.CBPO.target.yOffsetText end,
						set = function(info, value) E.db.CBPO.target.yOffsetText = value; CBPO:UpdateTarget(); end,
						min = -50, max = 50, step = 1,
						disabled = function() return (not E.db.CBPO.target.overlay or E.db.CBPO.target.hidetext) end,
					},
					spacer2 = {
						order = 7,
						type = 'description',
						name ='',
					},
					xOffsetTime = {
						order = 8,
						type = 'range',
						name = L['Time xOffset'],
						desc = L['Move castbar time to the left or to the right. Default is -4'],
						get = function(info) return E.db.CBPO.target.xOffsetTime end,
						set = function(info, value) E.db.CBPO.target.xOffsetTime = value; CBPO:UpdateTarget(); end,
						min = -100, max = 100, step = 1,
						disabled = function() return (not E.db.CBPO.target.overlay or E.db.CBPO.target.hidetext) end,
					},
					yOffsetTime = {
						order = 9,
						type = 'range',
						name = L['Time yOffset'],
						desc = L['Move castbar time up or down. Default is 0'],
						get = function(info) return E.db.CBPO.target.yOffsetTime end,
						set = function(info, value) E.db.CBPO.target.yOffsetTime = value; CBPO:UpdateTarget(); end,
						min = -50, max = 50, step = 1,
						disabled = function() return (not E.db.CBPO.target.overlay or E.db.CBPO.target.hidetext) end,
					},
				},
			},
			focus = {
				order = 3,
				type = 'group',
				name = L['Focus'],
				args = {
					info = {
						order = 1,
						type = 'header',
						name = L['Focus'],
					},
					overlay = {
						order = 2,
						type = 'toggle',
						name = L['Overlay on Power Bar'],
						desc = L['Overlay the castbar on the power bar.'],
						get = function(info) return E.db.CBPO.focus.overlay end,
						set = function(info, value) E.db.CBPO.focus.overlay = value; CBPO:UpdateFocus(); UF:CreateAndUpdateUF('focus') end,
						disabled = function() return not E.db.unitframe.units.focus.power.enable end,
					},
					hidetext = {
						order = 3,
						type = 'toggle',
						name = L['Hide Text'],
						desc = L['Hide Castbar text. Useful if your power height is very low or if you use power offset.'],
						get = function(info) return E.db.CBPO.focus.hidetext end,
						set = function(info, value) E.db.CBPO.focus.hidetext = value; CBPO:UpdateFocus(); end,
						disabled = function() return not E.db.CBPO.focus.overlay end,
					},
					spacer1 = {
						order = 4,
						type = 'description',
						name ='',
					},
					xOffsetText = {
						order = 5,
						type = 'range',
						name = L['Text xOffset'],
						desc = L['Move castbar text to the left or to the right. Default is 4'],
						get = function(info) return E.db.CBPO.focus.xOffsetText end,
						set = function(info, value) E.db.CBPO.focus.xOffsetText = value; CBPO:UpdateFocus(); end,
						min = -100, max = 100, step = 1,
						disabled = function() return (not E.db.CBPO.focus.overlay or E.db.CBPO.focus.hidetext) end,
					},
					yOffsetText = {
						order = 6,
						type = 'range',
						name = L['Text yOffset'],
						desc = L['Move castbar text up or down. Default is 0'],
						get = function(info) return E.db.CBPO.focus.yOffsetText end,
						set = function(info, value) E.db.CBPO.focus.yOffsetText = value; CBPO:UpdateFocus(); end,
						min = -50, max = 50, step = 1,
						disabled = function() return (not E.db.CBPO.focus.overlay or E.db.CBPO.focus.hidetext) end,
					},
					spacer2 = {
						order = 7,
						type = 'description',
						name ='',
					},
					xOffsetTime = {
						order = 8,
						type = 'range',
						name = L['Time xOffset'],
						desc = L['Move castbar time to the left or to the right. Default is -4'],
						get = function(info) return E.db.CBPO.focus.xOffsetTime end,
						set = function(info, value) E.db.CBPO.focus.xOffsetTime = value; CBPO:UpdateFocus(); end,
						min = -100, max = 100, step = 1,
						disabled = function() return (not E.db.CBPO.focus.overlay or E.db.CBPO.focus.hidetext) end,
					},
					yOffsetTime = {
						order = 9,
						type = 'range',
						name = L['Time yOffset'],
						desc = L['Move castbar time up or down. Default is 0'],
						get = function(info) return E.db.CBPO.focus.yOffsetTime end,
						set = function(info, value) E.db.CBPO.focus.yOffsetTime = value; CBPO:UpdateFocus(); end,
						min = -50, max = 50, step = 1,
						disabled = function() return (not E.db.CBPO.focus.overlay or E.db.CBPO.focus.hidetext) end,
					},
				},
			},
			boss = {
				order = 4,
				type = 'group',
				name = L['Boss'],
				args = {
					info = {
						order = 1,
						type = 'header',
						name = L['Boss'],
					},
					overlay = {
						order = 2,
						type = 'toggle',
						name = L['Overlay on Power Bar'],
						desc = L['Overlay the castbar on the power bar.'],
						get = function(info) return E.db.CBPO.boss.overlay end,
						set = function(info, value) E.db.CBPO.boss.overlay = value; CBPO:UpdateBoss(); UF:CreateAndUpdateUFGroup('boss', MAX_BOSS_FRAMES) end,
						disabled = function() return not E.db.unitframe.units.boss.power.enable end,
					},
					hidetext = {
						order = 3,
						type = 'toggle',
						name = L['Hide Text'],
						desc = L['Hide Castbar text. Useful if your power height is very low or if you use power offset.'],
						get = function(info) return E.db.CBPO.boss.hidetext end,
						set = function(info, value) E.db.CBPO.boss.hidetext = value; CBPO:UpdateBoss(); end,
						disabled = function() return not E.db.CBPO.boss.overlay end,
					},
					spacer1 = {
						order = 4,
						type = 'description',
						name ='',
					},
					xOffsetText = {
						order = 5,
						type = 'range',
						name = L['Text xOffset'],
						desc = L['Move castbar text to the left or to the right. Default is 4'],
						get = function(info) return E.db.CBPO.boss.xOffsetText end,
						set = function(info, value) E.db.CBPO.boss.xOffsetText = value; CBPO:UpdateBoss(); end,
						min = -100, max = 100, step = 1,
						disabled = function() return (not E.db.CBPO.boss.overlay or E.db.CBPO.boss.hidetext) end,
					},
					yOffsetText = {
						order = 6,
						type = 'range',
						name = L['Text yOffset'],
						desc = L['Move castbar text up or down. Default is 0'],
						get = function(info) return E.db.CBPO.boss.yOffsetText end,
						set = function(info, value) E.db.CBPO.boss.yOffsetText = value; CBPO:UpdateBoss(); end,
						min = -50, max = 50, step = 1,
						disabled = function() return (not E.db.CBPO.boss.overlay or E.db.CBPO.boss.hidetext) end,
					},
					spacer2 = {
						order = 7,
						type = 'description',
						name ='',
					},
					xOffsetTime = {
						order = 8,
						type = 'range',
						name = L['Time xOffset'],
						desc = L['Move castbar time to the left or to the right. Default is -4'],
						get = function(info) return E.db.CBPO.boss.xOffsetTime end,
						set = function(info, value) E.db.CBPO.boss.xOffsetTime = value; CBPO:UpdateBoss(); end,
						min = -100, max = 100, step = 1,
						disabled = function() return (not E.db.CBPO.boss.overlay or E.db.CBPO.boss.hidetext) end,
					},
					yOffsetTime = {
						order = 9,
						type = 'range',
						name = L['Time yOffset'],
						desc = L['Move castbar time up or down. Default is 0'],
						get = function(info) return E.db.CBPO.boss.yOffsetTime end,
						set = function(info, value) E.db.CBPO.boss.yOffsetTime = value; CBPO:UpdateBoss(); end,
						min = -50, max = 50, step = 1,
						disabled = function() return (not E.db.CBPO.boss.overlay or E.db.CBPO.boss.hidetext) end,
					},
				},
			},
			arena = {
				order = 5,
				type = 'group',
				name = L['Arena'],
				args = {
					info = {
						order = 1,
						type = 'header',
						name = L['Arena'],
					},
					overlay = {
						order = 2,
						type = 'toggle',
						name = L['Overlay on Power Bar'],
						desc = L['Overlay the castbar on the power bar.'],
						get = function(info) return E.db.CBPO.arena.overlay end,
						set = function(info, value) E.db.CBPO.arena.overlay = value; CBPO:UpdateArena(); UF:CreateAndUpdateUFGroup('arena', 5) end,
						disabled = function() return not E.db.unitframe.units.arena.power.enable end,
					},
					hidetext = {
						order = 3,
						type = 'toggle',
						name = L['Hide Text'],
						desc = L['Hide Castbar text. Useful if your power height is very low or if you use power offset.'],
						get = function(info) return E.db.CBPO.arena.hidetext end,
						set = function(info, value) E.db.CBPO.arena.hidetext = value; CBPO:UpdateArena(); end,
						disabled = function() return not E.db.CBPO.arena.overlay end,
					},
					spacer1 = {
						order = 4,
						type = 'description',
						name ='',
					},
					xOffsetText = {
						order = 5,
						type = 'range',
						name = L['Text xOffset'],
						desc = L['Move castbar text to the left or to the right. Default is 4'],
						get = function(info) return E.db.CBPO.arena.xOffsetText end,
						set = function(info, value) E.db.CBPO.arena.xOffsetText = value; CBPO:UpdateArena(); end,
						min = -100, max = 100, step = 1,
						disabled = function() return (not E.db.CBPO.arena.overlay or E.db.CBPO.arena.hidetext) end,
					},
					yOffsetText = {
						order = 6,
						type = 'range',
						name = L['Text yOffset'],
						desc = L['Move castbar text up or down. Default is 0'],
						get = function(info) return E.db.CBPO.arena.yOffsetText end,
						set = function(info, value) E.db.CBPO.arena.yOffsetText = value; CBPO:UpdateArena(); end,
						min = -50, max = 50, step = 1,
						disabled = function() return (not E.db.CBPO.arena.overlay or E.db.CBPO.arena.hidetext) end,
					},
					spacer2 = {
						order = 7,
						type = 'description',
						name ='',
					},
					xOffsetTime = {
						order = 8,
						type = 'range',
						name = L['Time xOffset'],
						desc = L['Move castbar time to the left or to the right. Default is -4'],
						get = function(info) return E.db.CBPO.arena.xOffsetTime end,
						set = function(info, value) E.db.CBPO.arena.xOffsetTime = value; CBPO:UpdateArena(); end,
						min = -100, max = 100, step = 1,
						disabled = function() return (not E.db.CBPO.arena.overlay or E.db.CBPO.arena.hidetext) end,
					},
					yOffsetTime = {
						order = 9,
						type = 'range',
						name = L['Time yOffset'],
						desc = L['Move castbar time up or down. Default is 0'],
						get = function(info) return E.db.CBPO.arena.yOffsetTime end,
						set = function(info, value) E.db.CBPO.arena.yOffsetTime = value; CBPO:UpdateArena(); end,
						min = -50, max = 50, step = 1,
						disabled = function() return (not E.db.CBPO.arena.overlay or E.db.CBPO.arena.hidetext) end,
					},
				},
			},
		},
	}

	-- Modify castbar 'Match Frame Width' buttons
	E.Options.args.unitframe.args.player.args.castbar.args.matchsize = {
		order = 2,
		type = 'execute',
		name = L['Match Frame Width'],
		func = function() 
			if E.db.CBPO.player.overlay then
				E.db.unitframe.units['player']['castbar']['height'] = ElvUF_Player.Power:GetHeight()
				E.db.unitframe.units['player']['castbar']['width'] = ElvUF_Player.Power.backdrop:GetWidth()
			else
				E.db.unitframe.units['player']['castbar']['height'] = P.unitframe.units.player.castbar.height;
				E.db.unitframe.units['player']['castbar']['width'] = E.db.unitframe.units['player']['width'];
			end
			UF:CreateAndUpdateUF('player')
		end,
	}
	E.Options.args.unitframe.args.target.args.castbar.args.matchsize = {
		order = 2,
		type = 'execute',
		name = L['Match Frame Width'],
		func = function() 
			if E.db.unitframe.units.target.castbar.poweroverlay then
				E.db.unitframe.units['target']['castbar']['height'] = ElvUF_Target.Power:GetHeight()
				E.db.unitframe.units['target']['castbar']['width'] = ElvUF_Target.Power.backdrop:GetWidth()
			else
				E.db.unitframe.units['target']['castbar']['height'] = P.unitframe.units.target.castbar.height;
				E.db.unitframe.units['target']['castbar']['width'] = E.db.unitframe.units['target']['width'];
			end
			UF:CreateAndUpdateUF('target')
		end,
	}
	E.Options.args.unitframe.args.focus.args.castbar.args.matchsize = {
		order = 2,
		type = 'execute',
		name = L['Match Frame Width'],
		func = function() 
			if E.db.unitframe.units.focus.castbar.poweroverlay then
				E.db.unitframe.units['focus']['castbar']['height'] = ElvUF_Focus.Power:GetHeight()
				E.db.unitframe.units['focus']['castbar']['width'] = ElvUF_Focus.Power.backdrop:GetWidth()
			else
				E.db.unitframe.units['focus']['castbar']['height'] = P.unitframe.units.focus.castbar.height;
				E.db.unitframe.units['focus']['castbar']['width'] = E.db.unitframe.units['focus']['width'];
			end
			UF:CreateAndUpdateUF('focus')
		end,
	}
	E.Options.args.unitframe.args.boss.args.castbar.args.matchsize = {
		order = 2,
		type = 'execute',
		name = L['Match Frame Width'],
		func = function() 
			if E.db.unitframe.units.boss.castbar.poweroverlay then
				E.db.unitframe.units['boss']['castbar']['height'] = ElvUF_Boss1.Power:GetHeight()
				E.db.unitframe.units['boss']['castbar']['width'] = ElvUF_Boss1.Power.backdrop:GetWidth()
			else
				E.db.unitframe.units['boss']['castbar']['height'] = P.unitframe.units.boss.castbar.height;
				E.db.unitframe.units['boss']['castbar']['width'] = E.db.unitframe.units['boss']['width'];
			end
			UF:CreateAndUpdateUFGroup('boss', MAX_BOSS_FRAMES)
		end,
	}
	E.Options.args.unitframe.args.arena.args.castbar.args.matchsize = {
		order = 2,
		type = 'execute',
		name = L['Match Frame Width'],
		func = function() 
			if E.db.unitframe.units.arena.castbar.poweroverlay then
				E.db.unitframe.units['arena']['castbar']['height'] = ElvUF_Arena1.Power:GetHeight()
				E.db.unitframe.units['arena']['castbar']['width'] = ElvUF_Arena1.Power.backdrop:GetWidth()
			else
				E.db.unitframe.units['arena']['castbar']['height'] = P.unitframe.units.arena.castbar.height;
				E.db.unitframe.units['arena']['castbar']['width'] = E.db.unitframe.units['arena']['width'];
			end
			UF:CreateAndUpdateUFGroup('arena', 5)
		end,
	}
	
	if not IsAddOnLoaded('ElvUI_CastBarSnap') then
		--Disable player castbar width and height option.
		E.Options.args.unitframe.args.player.args.castbar.args.width.disabled = function() return E.db.CBPO.player.overlay end
		E.Options.args.unitframe.args.player.args.castbar.args.height.disabled = function() return E.db.CBPO.player.overlay end
	end

	--Disable target castbar width and height option.
	E.Options.args.unitframe.args.target.args.castbar.args.width.disabled = function() return E.db.CBPO.target.overlay end
	E.Options.args.unitframe.args.target.args.castbar.args.height.disabled = function() return E.db.CBPO.target.overlay end

	--Disable focus castbar width and height option.
	E.Options.args.unitframe.args.focus.args.castbar.args.width.disabled = function() return E.db.CBPO.focus.overlay end
	E.Options.args.unitframe.args.focus.args.castbar.args.height.disabled = function() return E.db.CBPO.focus.overlay end

	--Disable boss castbar width and height option.
	E.Options.args.unitframe.args.boss.args.castbar.args.width.disabled = function() return E.db.CBPO.boss.overlay end
	E.Options.args.unitframe.args.boss.args.castbar.args.height.disabled = function() return E.db.CBPO.boss.overlay end

	--Disable arena castbar width and height option.
	E.Options.args.unitframe.args.arena.args.castbar.args.width.disabled = function() return E.db.CBPO.arena.overlay end
	E.Options.args.unitframe.args.arena.args.castbar.args.height.disabled = function() return E.db.CBPO.arena.overlay end
end

E:RegisterModule(CBPO:GetName())