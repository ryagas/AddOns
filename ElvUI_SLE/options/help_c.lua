﻿local E, L, V, P, G = unpack(ElvUI);
local SLE = E:GetModule('SLE')

local function configTable()
	--Main options group
	E.Options.args.sle.args.help = {
		type = 'group',
		name = L['About/Help'],
		order = -5,
		childGroups = 'tab',
		args = {
			about = {
				type = 'group',
				name = L['About'],
				order = 1,
				args = {
					content = {
						order = 1,
						type = 'description',
						fontSize = 'medium',
						name = L["SLE_DESC"],
					},
				},
			},
			-- faq = {
				-- type = 'group',
				-- name = 'FAQ',
				-- order = 5,
				-- args = {
					-- desc = {
						-- order = 1,
						-- type = 'description',
						-- fontSize = 'medium',
						-- name = 'Da FAQz!!!!',
					-- },
					-- q1 = {
						-- type = 'group',
						-- name = '',
						-- order = 2,
						-- guiInline = true,
						-- args = {
							-- q = {
								-- order = 1,
								-- type = 'description',
								-- fontSize = 'medium',
								-- name = [[|cff30ee30Q: Imma be da first question!|r
-- A: Imma be da first answerz]],
							-- },
						-- },
					-- },
					-- q2 = {
						-- type = 'group',
						-- name = '',
						-- order = 3,
						-- guiInline = true,
						-- args = {
							-- q = {
								-- order = 2,
								-- type = 'description',
								-- fontSize = 'medium',
								-- name = [[|cff30ee30Q: Imma be da second question!|r
-- A: Imma be da second answerz]],
							-- },
						-- },
					-- },
				-- },
			-- },
			links = {
				type = 'group',
				name = L['Links'],
				order = 10,
				args = {
					desc = {
						order = 1,
						type = 'description',
						fontSize = 'medium',
						name = L["LINK_DESC"],
					},
					tukuilink = {
						type = 'input',
						width = 'full',
						name = 'TukUI.org',
						get = function(info) return 'http://www.tukui.org/addons/index.php?act=view&id=42' end,
						order = 2,
					},
					wowilink = {
						type = 'input',
						width = 'full',
						name = 'WoWInterface',
						get = function(info) return 'http://www.wowinterface.com/downloads/info20927-ElvUIShadowLight.html' end,
						order = 3,
					},
					curselink= {
						type = 'input',
						width = 'full',
						name = 'Curse.com',
						get = function(info) return 'http://www.curse.com/addons/wow/shadow-and-light-edit' end,
						order = 4,
					},
					gitlablink = {
						type = 'input',
						width = 'full',
						name = L['GitLab Link / Report Errors'],
						get = function(info) return 'http://git.tukui.org/repooc/elvui-shadowandlight' end,
						order = 5,
					},
				},
			},
		},
	}
end

table.insert(E.SLEConfigs, configTable)