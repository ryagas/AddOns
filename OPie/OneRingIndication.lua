local ORI_ConfigCache, max, min, abs, sin, cos, atan2 = {}, math.max, math.min, math.abs, sin, cos, atan2

local function cc(m, f, ...)
	f[m](f, ...)
	return f
end
local darken do
	local CSL = CreateFrame("ColorSelect")
	function darken(r,g,b, vf, sf)
		CSL:SetColorRGB(r,g,b)
		local h,s,v = CSL:GetColorHSV()
		CSL:SetColorHSV(h, s*(sf or 1), v*(vf or 1))
		return CSL:GetColorRGB()
	end
end
local function shortBindName(bind)
	local a, s, c, k = bind:match("ALT%-"), bind:match("SHIFT%-"), bind:match("CTRL%-"), bind:match("[^-]*.$"):gsub("^(.).-(%d+)$","%1%2");
	return (a and "A" or "") .. (s and "S" or "") .. (c and "C" or "") .. k;
end
local function cooldownFormat(cd)
	if cd == 0 or not cd then return "" end
	local f, n, unit = cd > 10 and "%d%s" or "%.1f", cd, ""
	if n > 86400 then n, unit = ceil(n/86400), "d"
	elseif n > 3600 then n, unit = ceil(n/3600), "h"
	elseif n > 60 then n, unit = ceil(n/60), "m"
	elseif n > 10 then n = ceil(n) end
	return f, n, unit
end

local ORI_Frame = cc("SetFrameStrata", cc("SetSize", CreateFrame("Frame", nil, UIParent), 128, 128), "FULLSCREEN")
ORI_Frame.anchor = cc("SetPoint", cc("SetSize", CreateFrame("Frame", nil, UIParent), 1, 1), "CENTER")
ORI_Frame:SetPoint("CENTER", ORI_Frame.anchor)
local ORI_SetRotationPeriod, CreateQuadTexture do
	local function qf(f)
		return function (self, ...)
			for i=1,4 do
				local v = self[i];
				v[f](v, ...);
			end
		end
	end
	local quad, animations, quadPoints, quadTemplate = {}, {}, {"BOTTOMRIGHT", "BOTTOMLEFT", "TOPLEFT", "TOPRIGHT"}, {__index={SetVertexColor=qf("SetVertexColor"), SetAlpha=qf("SetAlpha"), SetShown=qf("SetShown")}}
	for i=1,4 do
		quad[i] = cc("SetPoint", cc("SetSize", CreateFrame("Frame", nil, ORI_Frame), 32, 32), quadPoints[i], ORI_Frame, "CENTER");
		local g = cc("SetLooping", cc("SetIgnoreFramerateThrottle", quad[i]:CreateAnimationGroup(), 1), "REPEAT");
		animations[i] = cc("SetOrigin", cc("SetDegrees", cc("SetDuration", g:CreateAnimation("Rotation"), 4), -360), quadPoints[i], 0, 0);
		g:Play();
	end
	function CreateQuadTexture(parent, layer, size, file)
		local group, size = setmetatable({}, quadTemplate), size/2
		for i=1,4 do
			local tex, d, l = cc("SetSize", cc("SetTexture", (parent or quad[i]):CreateTexture(nil, layer), file), size, size), i > 2, 2 > i or i > 3
			tex:SetTexCoord(l and 0 or 1, l and 1 or 0, d and 1 or 0, d and 0 or 1)
			group[i] = cc("SetPoint", tex, quadPoints[i], parent or quad[i], parent and "CENTER" or quadPoints[i])
		end
		return group
	end
	function ORI_SetRotationPeriod(p)
		local p = max(0.1, p)
		for i=1,4 do animations[i]:SetDuration(p) end
	end
end
local ORI_Circle = CreateQuadTexture(nil, "ARTWORK", 64, [[Interface\AddOns\OPie\gfx\circle]])
local ORI_Glow = CreateQuadTexture(nil, "BACKGROUND", 128, [[Interface\AddOns\OPie\gfx\glow]])
local ORI_Pointer = cc("SetTexture", cc("SetPoint", cc("SetSize", ORI_Frame:CreateTexture(nil, "ARTWORK"), 192, 192), "CENTER"), [[Interface\AddOns\OPie\gfx\pointer]])
local ORI_CenterCaption = cc("SetPoint", ORI_Frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall"), "TOP", ORI_Frame, "CENTER", 0, -52)
local ORI_CenterCooldownText = cc("SetPoint", ORI_Frame:CreateFontString(nil, "OVERLAY", "NumberFontNormalHuge"), "CENTER")

local ORI_CreateIndicator, ORI_CreateDefaultIndicator, ORI_IndicatorAPI do
	ORI_IndicatorAPI = {SetPoint=0, SetScale=0, GetScale=0, SetShown=0, SetParent=0}
	for k,v in pairs(ORI_IndicatorAPI) do
		ORI_IndicatorAPI[k] = function(self, ...)
			local w = self[v]
			return w[k](w, ...)
		end
	end
	function ORI_IndicatorAPI:SetIcon(texture)
		self.icon:SetTexture(texture)
		local ofs = (texture:match("^[Ii][Nn][Tt][Ee][Rr][Ff][Aa][Cc][Ee][\\/][Ii][Cc][Oo][Nn][Ss][\\/]") or texture == [[Interface\AddOns\OPie\gfx\opie_ring_icon]]) and (2.5/64) or (-2/64)
		self.icon:SetTexCoord(ofs, 1-ofs, ofs, 1-ofs)
	end
	function ORI_IndicatorAPI:SetIconTexCoord(a,b,c,d, e,f,g,h)
		if a and b and c and d then
			if e and f and g and h then
				self.icon:SetTexCoord(a,b,c,d, e,f,g,h)
			else
				self.icon:SetTexCoord(a,b,c,d)
			end
		end
	end
	function ORI_IndicatorAPI:SetIconVertexColor(r,g,b)
		self.icon:SetVertexColor(r,g,b)
	end
	function ORI_IndicatorAPI:SetUsable(usable, usableCharge, cd, nomana, norange)
		local state = usable and 0 or (norange and 1 or (nomana and 2 or 3))
		if self.ustate == state then return end
		self.ustate = state
		if not usable and (nomana or norange) then
			self.ribbon:Show()
			if norange then
				self.ribbon:SetVertexColor(1, 0.20, 0.15)
			else
				self.ribbon:SetVertexColor(0.15, 0.75, 1)
			end
			self.veil:SetAlpha(0)
		else
			self.ribbon:Hide()
			self.veil:SetAlpha(usable and 0 or 0.40)
		end
	end
	function ORI_IndicatorAPI:SetDominantColor(r,g,b)
		r, g, b = r or 1, g or 1, b or 0.6
		local cd, r2, g2, b2 = self.cd, darken(r,g,b, 0.20)
		local r3, g3, b3 = darken(r,g,b, 0.10, 0.50)
		self.hiEdge:SetVertexColor(r, g, b)
		self.iglow:SetVertexColor(r, g, b)
		self.oglow:SetVertexColor(r, g, b)
		self.edge:SetVertexColor(darken(r,g,b, 0.80))
		self.cdText:SetTextColor(r, g, b)		
		cd.spark:SetVertexColor(r, g, b)
		for i=1,4 do
			cd[i]:SetVertexColor(r2, g2, b2)
			cd[i+4]:SetVertexColor(r3, g3, b3)
		end
		cd[9]:SetVertexColor(r3, g3, b3)
	end
	function ORI_IndicatorAPI:SetOverlayIcon(texture, w, h, ...)
		if not texture then
			self.overIcon:Hide()
		else
			self.overIcon:Show()
			self.overIcon:SetTexture(texture)
			self.overIcon:SetSize(w, h)
			if ... then
				self.overIcon:SetTexCoord(...)
			end
		end
	end
	function ORI_IndicatorAPI:SetCount(count)
		self.count:SetText(count or "")
	end
	function ORI_IndicatorAPI:SetBindingText(text)
		self.key:SetText(text or "")
	end
	function ORI_IndicatorAPI:SetCooldown(remain, duration, usable)
		if (duration or 0) <= 0 or (remain or 0) <= 0 then
			self.cd:Hide()
		else
			local expire, usable, cd = GetTime() + remain, not not usable, self.cd
			local d = expire - (cd.expire or 0)
			if d < -0.05 or d > 0.05 then
				cd.duration, cd.expire, cd.updateCooldownStep, cd.updateCooldown = duration, expire, duration/1536/self[0]:GetEffectiveScale()
				cd:Show()
			end
			if cd.usable ~= usable then
				cd.usable = usable
				for i=1,4 do cd[i]:SetAlpha(usable and 0.45 or 1) end
				for i=5,9 do cd[i]:SetAlpha(usable and 0.25 or 0.85) end
				cd.spark:SetShown(usable)
			end
		end
	end
	function ORI_IndicatorAPI:SetCooldownFormattedText(format, ...)
		self.cdText:SetFormattedText(format, ...)
	end
	function ORI_IndicatorAPI:SetHighlighted(highlight)
		self.hiEdge:SetShown(highlight)
	end
	function ORI_IndicatorAPI:SetActive(active)
		self.iglow:SetShown(active)
	end
	function ORI_IndicatorAPI:SetOuterGlow(shown)
		self.oglow:SetShown(shown)
	end
	local createCooldown do
		local function onUpdate(self, elapsed)
			local ucd, expire, time = self.updateCooldown or 0, self.expire or 0, GetTime()
			if ucd > elapsed and time < expire then
				self.updateCooldown = ucd - elapsed
				return
			end
			self.updateCooldown = self.updateCooldownStep
			local duration = self.duration or 0
			local progress = 1 - (expire - time)/duration
			if progress > 1 or duration == 0 then
				self:Hide()
			else
				progress = progress < 0 and 0 or progress
				local tri, pos, sp, pp, scale = self[9], 1+4*(progress - progress % 0.25), progress % 0.25 >= 0.125, (progress % 0.125) * 8, self.scale
				if self.pos ~= pos then
					for i=1,4 do
						self[i]:SetShown(i >= pos)
						self[4+i]:SetShown(i > pos or (i == pos and not sp))
						if i > pos then
							self[i]:SetSize(24, 24)
							local L, T = i > 2, i == 1 or i == 4
							self[i]:SetTexCoord(L and 0 or 0.5, L and 0.5 or 1, T and 0 or 0.5, T and 0.5 or 1)
							self[4+i]:SetSize(21*scale, 21*scale)
						end
					end
					tri:ClearAllPoints()
					tri:SetPoint((pos % 4 < 2 and "BOTTOM" or "TOP") .. (pos < 3 and "LEFT" or "RIGHT") , self, "CENTER")
					local iH, iV = pos == 2 or pos == 3, pos > 2
					tri:SetTexCoord(iH and 1 or 0, iH and 0 or 1, iV and 1 or 0, iV and 0 or 1)
					self.pos = pos
				end

				local l, r, inv = sp and 21 or (pp * 21), 21 - (sp and pp * 21 or 0), pos == 2 or pos == 4
				l, r = l > 0 and l or 0.00000001, r > 0 and r or 0.00000001
				tri:SetSize((inv and r or l)*scale, (inv and l or r)*scale)

				local chunk, shrunk = self[4+pos], 21 - 21*pp
				chunk:SetSize((inv and 21 or shrunk)*scale, (inv and shrunk or 21)*scale)
				chunk:SetShown(not sp or pp >= 0.9999)

				local p1, p2, e, p1a, p2a = sp and 1 or pp, sp and pp or 0, self[pos]
				if p1 > 0.9 and p2 < 0.1 then
					p1a = 0.9 + (p1 + p2 - 0.9)/2
					p2a = 1-(1.81 - p1a*p1a)^0.5
				else
					p1a, p2a = p1, p2
				end
				if p2 > 0.5 then
				elseif p2 > 0.06 then
					p2 = 0.20 + (p2 - 0.06)*30/44
				elseif p1 > 0.96 then
					p1, p2 = 1, (p2 + p1 - 0.96) * 2
				elseif p1 > 0.56 then
					p1 = p1 + (p1 - 0.56)*0.1
				end
				local p1c, p2c = 24 - 21*p1, 24 - 24*p2
				e:SetSize(inv and p2c or p1c, inv and p1c or p2c)
				if pos == 1 then
					e:SetTexCoord(0.5 + 28/64*p1, 1, 0.5*p2, 0.5)
					self.spark:SetPoint("CENTER", self, "TOP", 22.5 * p1a, -22.5*p2a-1.5)
				elseif pos == 2 then
					e:SetTexCoord(0.5, 1-0.5*p2, 0.5 + 28/64*p1, 1)
					self.spark:SetPoint("CENTER", self, "RIGHT", -22.5*p2a-1.5, -22.5*p1a)
				elseif pos == 3 then
					e:SetTexCoord(0, 0.5 - 28/64*p1, 0.5, 1 - 0.5*p2)
					self.spark:SetPoint("CENTER", self, "BOTTOM", -22.5 * p1a, 1.5+22.5*p2a)
				else
					e:SetTexCoord(0.5*p2, 0.5, 0, 0.5 - 28/64*p1)
					self.spark:SetPoint("CENTER", self, "LEFT", 1.5+22.5*p2a, 22.5*p1a)
				end
				if p2 >= 0.9999 then e:Hide() end
			end
		end
		local function onHide(self)
			local toExpire = GetTime() - (self.expire or 0)
			self.expire, self.pos = nil
			for i=5,9 do self[i]:Hide() end
			if -0.1 < toExpire and toExpire < 0.25 then
				self.flashAG:Play()
			end
			self:Hide()
		end
		local function onShow(self)
			self[9]:Show()
		end
		function createCooldown(parent, size)
			local cd, scale = cc("SetScale", cc("SetAllPoints", CreateFrame("FRAME", nil, parent)), size/48), size * 87/4032
			cc("SetScript", cc("SetScript", cc("SetScript", cd, "OnShow", onShow), "OnHide", onHide), "OnUpdate", onUpdate)
			
			cd.scale, cd.spark = scale, cc("SetSize", cc("SetTexture", cc("SetDrawLayer", cd:CreateTexture(), "OVERLAY", 2), [[Interface\AddOns\OPie\gfx\spark]]), 24, 24)
			local sparkAG = cc("SetIgnoreFramerateThrottle", cc("SetLooping", cd.spark:CreateAnimationGroup(), "REPEAT"), true)
			cc("SetDuration", cc("SetDegrees", sparkAG:CreateAnimation("Rotation"), 90), 1/3)
			sparkAG:Play()
			
			cd.flash = cc("SetPoint", cc("SetBlendMode", cc("SetTexture", parent:CreateTexture(nil, "OVERLAY"), [[Interface\cooldown\star4]]), "ADD"), "CENTER")
			cc("SetAlpha", cc("SetSize", cd.flash, 60*size/64, 60*size/64), 0)
			cd.flashAG = cc("SetIgnoreFramerateThrottle", cd.flash:CreateAnimationGroup(), true)
			cc("SetDuration", cc("SetDegrees", cd.flashAG:CreateAnimation("ROTATION"), -90), 1/2)
			cc("SetDuration", cc("SetChange", cd.flashAG:CreateAnimation("ALPHA"), 0.7), 1/8)
			cc("SetDuration", cc("SetStartDelay", cc("SetChange", cd.flashAG:CreateAnimation("ALPHA"), -0.7), 1/8), 3/8)
			
			cd[1] = cc("SetPoint", cc("SetTexture", cd:CreateTexture(nil, "ARTWORK"), [[Interface\AddOns\OPie\gfx\borderlo]]), "BOTTOMRIGHT", cd, "RIGHT")
			cd[2] = cc("SetPoint", cc("SetTexture", cd:CreateTexture(nil, "ARTWORK"), [[Interface\AddOns\OPie\gfx\borderlo]]), "BOTTOMLEFT", cd, "BOTTOM")
			cd[3] = cc("SetPoint", cc("SetTexture", cd:CreateTexture(nil, "ARTWORK"), [[Interface\AddOns\OPie\gfx\borderlo]]), "TOPLEFT", cd, "LEFT")
			cd[4] = cc("SetPoint", cc("SetTexture", cd:CreateTexture(nil, "ARTWORK"), [[Interface\AddOns\OPie\gfx\borderlo]]), "TOPRIGHT", cd, "TOP")
			for i=1,4 do
				cd[4+i] = cc("SetPoint", cc("SetTexture", cc("SetDrawLayer", parent:CreateTexture(), "ARTWORK", 3), 1,1,1),
					(i % 4 < 2 and "TOP" or "BOTTOM") .. (i < 3 and "RIGHT" or "LEFT"), cd, "CENTER", (i < 3 and 21 or -21)*scale, (i % 4 < 2 and 21 or -21)*scale)
			end
			cd[9] = cc("SetTexture", cc("SetDrawLayer", parent:CreateTexture(), "ARTWORK", 3), [[Interface\AddOns\OPie\gfx\tri]])
			
			return cd
		end
	end
	
	local apimeta = {__index=ORI_IndicatorAPI}
	function ORI_CreateDefaultIndicator(name, parent, size, nested)
		local e = cc("SetSize", CreateFrame("Frame", name, parent), size, size)
		return setmetatable({[0]=e,
			edge = cc("SetAllPoints", cc("SetTexture", e:CreateTexture(nil, "OVERLAY"), [[Interface\AddOns\OPie\gfx\borderlo]])),
			hiEdge = cc("SetAllPoints", cc("SetTexture", cc("SetDrawLayer", e:CreateTexture(), "OVERLAY", 1), [[Interface\AddOns\OPie\gfx\borderhi]])),
			oglow = cc("SetShown", CreateQuadTexture(e, "BACKGROUND", size*2, [[Interface\AddOns\OPie\gfx\oglow]]), false),
			iglow = cc("SetAllPoints", cc("SetAlpha", cc("SetTexture", cc("SetDrawLayer", e:CreateTexture(nil), "ARTWORK", 1), [[Interface\AddOns\OPie\gfx\iglow]]), nested and 0.60 or 1)),
			icon = cc("SetPoint", cc("SetSize", e:CreateTexture(nil, "ARTWORK"), 60*size/64, 60*size/64), "CENTER"),
			veil = cc("SetTexture", cc("SetPoint", cc("SetSize", cc("SetDrawLayer", e:CreateTexture(), "ARTWORK", 2), 60*size/64, 60*size/64), "CENTER"), 0, 0, 0),
			ribbon = cc("SetShown", cc("SetTexture", cc("SetAllPoints", cc("SetDrawLayer", e:CreateTexture(), "ARTWORK", 2)), [[Interface\AddOns\OPie\gfx\ribbon]]), false),
			overIcon = cc("SetPoint", cc("SetDrawLayer", e:CreateTexture(), "ARTWORK", 3), "BOTTOMLEFT", e, "BOTTOMLEFT", 4, 4),
			count = cc("SetPoint", cc("SetJustifyH", e:CreateFontString(nil, "OVERLAY", "NumberFontNormalLarge"), "RIGHT"), "BOTTOMRIGHT", -4, 4),
			key = cc("SetPoint", cc("SetJustifyH", e:CreateFontString(nil, "OVERLAY", "NumberFontNormalSmallGray"), "RIGHT"), "TOPRIGHT", -1, -4),
			cdText = cc("SetPoint", e:CreateFontString(nil, "OVERLAY", "NumberFontNormalHuge"), "CENTER"),
			cd = createCooldown(e, size),
		}, apimeta)
	end
end

local function SetAngle(self, angle, radius)
	self:SetPoint("CENTER", radius*cos(90+angle), radius*cos(angle))
end
local function SetScaleSmoothed(self, scale, speed)
	local old, limit = self:GetScale(), speed/GetFramerate();
	self:SetScale(old + min(limit, max(-limit, scale-old)));
end
local function CalculateRingRadius(n, fLength, aLength, min, baseAngle)
	if n < 2 then return min end
	local radius, mLength, astep = max(min, (fLength + aLength * (n-1))/6.2831853071796), (fLength+aLength)/2, 360 / n
	repeat
		local ox, oy, clear, angle, i = radius*cos(baseAngle), radius*sin(baseAngle), true, baseAngle + astep, 1
		while clear and i <= n do
			local nx, ny, sideLength = radius*cos(angle), radius*sin(angle), (i == 1 or i == n) and mLength or aLength
			if abs(ox - nx) < sideLength and abs(oy - ny) < sideLength then
				radius, clear = radius + 5
			end
			ox, oy, angle, i = nx, ny, angle + astep, i + 1
		end
	until clear
	return radius
end

local ORI_Slices = setmetatable({}, {__index=function(t, k)
	local v = ORI_CreateIndicator(nil, ORI_Frame, 48)
	t[k] = v
	return v
end})
local GhostIndication = {} do
	local spareGroups, spareSlices, currentGroups, activeGroup = {}, {}, {};
	local function freeGroup(g)
		g:Hide()
		for i=2,g.count or 0 do
			g[i]:SetShown(false)
			spareSlices[g[i]], g[i] = g[i]
		end
		spareGroups[g], g.incident, g.count = g
	end
	local function createGroup()
		return cc("SetScale", cc("SetSize", CreateFrame("Frame", nil, ORI_Frame), 1, 1), 0.80)
	end
	local function AnimateHide(self, elapsed)
		local total = ORI_ConfigCache.XTZoomTime;
		self.expire = (self.expire or total) - elapsed;
		if self.expire < 0 then
			self.expire = nil; self:SetScript("OnUpdate", nil); self:Hide();
		else
			self:SetAlpha(self.expire/total);
		end
	end
	local function AnimateShow(self, elapsed)
		local total = ORI_ConfigCache.XTZoomTime/2;
		self.expire = (self.expire or total) - elapsed;
		if self.expire < 0 then
			self.expire = nil; self:SetScript("OnUpdate", nil); self:SetAlpha(1);
		else
			self:SetAlpha(1-self.expire/total);
		end
	end
	function GhostIndication:ActivateGroup(index, count, incidentAngle, mainRadius, mainScale)
		local ret, config = currentGroups[index] or next(spareGroups) or createGroup(), ORI_ConfigCache;
		currentGroups[index], spareGroups[ret] = ret;
		if not ret:IsShown() then ret:SetScript("OnUpdate", AnimateShow); ret:Show(); end
		if activeGroup ~= ret then GhostIndication:Deactivate(); end
		if ret.incident ~= incidentAngle or ret.count ~= count then
			local radius, angleStep = CalculateRingRadius(count, 48*mainScale, 48*0.80, 30, incidentAngle-180)/0.80, 360/count;
			local angle = 90 + incidentAngle + angleStep;
			for i=2,count do
				local cell = ret[i] or next(spareSlices) or ORI_CreateIndicator(nil, ret, 48, true)
				cell:SetParent(ret); SetAngle(cell, angle, radius); cell:SetShown(true);
				ret[i], angle, spareSlices[cell] = cell, angle + angleStep;
			end
			ret.incident, ret.count = incidentAngle, count;
			ret:SetPoint("CENTER", (mainRadius/0.80+radius)*cos(incidentAngle), (mainRadius/0.80+radius)*sin(incidentAngle));
			ret:Show();
		end
		activeGroup = ret;
		return ret;
	end
	function GhostIndication:Deactivate()
		if activeGroup then
			activeGroup:SetScript("OnUpdate", AnimateHide);
			activeGroup = nil;
		end
	end
	function GhostIndication:Reset()
		for k, v in pairs(currentGroups) do
			freeGroup(v)
			currentGroups[k] = nil
		end
		activeGroup = nil
	end
	function GhostIndication:Wipe()
		GhostIndication:Reset()
		wipe(spareSlices)
	end
end

local lhc, lhcPal do
	local ht = [[d��d��d����&d��d����M��Bd����M��MLW�M��L����Ly�L���L�M���������L��L���&�������L�­���lc	.UtA" 	s>E������JC��b� �w篜����!$r>��+w}���JG������!�g">K�d "�œ���1�Y�5�9�RB�\ȗ�A��a� �~�f?��H��|�t�rr8�����A޿��$B>Ñ��<�m�Ig��%�9�M�ZB�<�]^r$��H�!���!�#�w��z$�y��B#}�St�����S7���?��#���+LO��r�΋��%���|\�}q��D��"���*z��?�$���?�e�9��Ȍ�Bgܙ.��>B%� Mk1MD�''�K]'Yв3�{"�DYE�� %&zƋ��t��EQ� �s����Ed~�-�!4�(0������	#�{<�zC��:75�]�ׄ!���J�'���L�跟��ß��M�>I���X�a�b�8�)G�tL��C�$ �k��_�s��O�B"'�Ι2)&��d-ȲH�-Q���~c�G���V��r0����ҟ�::�� ^������ozk,�BD��%J:���L?nC��쉔Wxń+��7~Rb~���;1�'wE���� ZG���5t=��ִ?�E��z���?Ⱥ�?A�ܑ$������Ԍ�>E�(.I>�2l��|?�T��-A,���C����~�/$�?��C���hwؚ�G���� I6w'��U�Hs����v����"��GK�xA���0���ȑd~s���?"�@��]D��D�dI���?���N�d����E�w�����1�{��9;�D)K���� �����0�������/�I�O���.E<X����7��W#��vs��6��8��D��IJ��8����|�\_$���	�ҫ G�w�."	���Կ���ۦ�-�g�ʮ|��BIvW��/r>u�H+<���\ND�n :ⷜ�Z?/�����|����+;�w�k��&�@*9��(����� w����'΅����:u����h]e��N�Y�F>n4g�t$�HD��?g����q����}?� �H��Yro�Cֆ�"��X!#G��	��zl�܂~__܄���N�N�K�y����Jc�Z?���˥#�� "�d!�&4��q����?	��K��.)�~y1oYt�Ļ���r��&$��vN� z#���?�Ó�~��I����$;�����bQI��t{�]k!f���v4\�	�(G}��~x��F	�;9v-�:~�wk�Q�Vl!M�B|�aޟ� b>�Rk�I��I���?�C��;�������#�"󏠑#��� �И�/�'�\��1���ؓ ����{�7!~,��i!,������Ø����%�.zP�8�wNBF� 9�~�?�$�"?���;�8�P�؉Mw!��,� ��#�y�H��"�G{�"�-+aO�"a1�r��fI�j���Y��K����(I�=i ~O��"�,�!/脹�$�{��,�ZQC���ï�ȕ��r��}q"���.�~�tN���V��:(f贽�B�9�;,���>)����7���F7�&��H�#�K"h�h'�|D� A�x�l"\�_�'�å��P��J�ʢ�#GE�W��4|���� �(��{�d��E�&��	��I�<V�&_��H�� :Ε�)�?�!���C�������	{����#��96{$����9;c���Z��Q�>������)B�|�Lk���B����"Y�I	3�� !���+�yc��d�w �Y�D�kw�D���?��tVs��s��ч$�G�tb~I#r��r=��r��#�B��d#��� rf�)�ޏ��?�D��rPw��y�vvx>�O�8"?#���w��ϲ�����]>s�� K�c��J���f�%�QA>���G����tֈȔB=��ё]�ʳ�Ѕ�$;$rP�zϾr�E*�I� &ND�Q'��o]��Ƒ���.&^ȥx"N�}d�D3�Y.��������C�C���޳�䣾���!.O��Zu��$���A�ȟ ��t����պ��� �z���_�����Q�E~��yu\�3>H���"�8� $���(���v��-'�� <��,�&f���K�t�(;'�_{�H"�r���В-�N??�/����[�o��B����Ok��?�tZdO�B;�|P��?�u��E����\B�d\wI�K����H;��9�$o8�� �^vHw����N���["�|��Ȅ�n>E��B[؛hB>���GE���� ��ݯ�?q'��'�)��.a���I��i[���+��L����3���/�!Ǿ�>��w� 侇v�����I��?JT��#��T��?� b��I	�+��w;�Dw���:Rx�R{��|�C2����ϳ�����)�G2� C���i~���K�?t��[����Y�J"?9��%r�9�rQ+��I��tq"�-	���3	!��A�}� &N�O؄U�|V�$?�̺Q6Y�D.3 	�Nr22a���s�$�c���CC�"c�%� #	'�=b��Jc�L��I����E��-�F't�˓��/��<zN���C*ǭ�K����#'y1�8���M' B"����v!�_�å����x[��������A"��sd_H�� �o�?�t �bI� ����_�ǐ���O�Dw�xE	g��0!п��	:O���֊Y���C�Id�����֗e��?��� B?�!	��������r"��v	�����?F3 O���싦H������\c�~H�H�����1�@��G��I'Dt���VC���D��/��#�ϡ$�#�#���"*ԑMߊ�s�����ȓ�|����i!r�L�#�Qs B�v��W���'����:��� ������~�l��u]�l9#�}�'��)$N�dBi���*�֖ ��� �e��(;����z��N���8�IE�i:��� ��h�{�BVdB~�0�K>r1�zRϞ����� :&B?��	�=�|�F	��7��)�D�D !�Wr�������/�?������� &΂%�<~��'r�,��r"(�޷#�z�ĦdC��������.!�O��[�D-}~Ŭ�+ri���"=�r	��(9��?ָ�z��9?C����h���$� �����H {�E��ҿ�������tq�|��>FEgO��+c��}	<���C�ƒwߗ,�Dm�'7c�5��*�O9-� }ֿ��#������ѢdD�x�N��Hw"(��}�;�JK"W�Gu$���uhu����g.%W����ϱ�[Η�+E��+���� J~��,��s����N͎�>�D?ܿT�K�c���?� � ��d�,?�ϡ�FP�R$Y����B�"��9?GK�~gO��wH�O����YL�*�.��'6^���Ht\~��)9�ڏ:R�Mv^�M���\�@������3��>_\��3 J��8�sE�';���iB���um��� ����I��DJ����� g��H�~	��ZQ���n��_ ��J��O����'�$���QN���FP���-C�{~R ��H�d����H�6��hwЉi���G�� �ȵ��^�OɄ��"����� �����	��Hu��J��"'��[���`"�3���i�ǞO@#�t���@B^�����H�k�%X�':h�����_J#��7\�C�1s�v?�b>�YdQ�Ȍ�,�،X�Y.̇����=��������8�:G��s����:^Ȑ�:�ָ�� \��F�rH���>BQ���$�!� �iN>�E�м��I?U��;��ih	9.�|�L�w���>���A���X���I��1s�ψ�DYȿ�(w��"�;z�t�j!'�^r:? &f��)����{&�}$��������-='#��?� '�t8�"����{�e�):ųD[��?^�'����qZ1,�	"K�!ش��&x��G��)���w�ZH���c??���&\�$��ɉB]��:ç� ÿ�2����)�\��#"����J�Y�!�D���<�r?�������C��Iy⏞; 9���gQ�1�e�s��dQ�����}�&����#����>���9���$�~�'O���2$:O'D	J�RP� q%��n�)��đb#�$�� �4>Nb���"~��zcD~? �j1$ #��"T<���]#>}�~O��	J�H�'�^���П�(��BU�Ӻ�!+'X���,B��N=���Ku��:���v\D}? ���Y6���b��4%,�C���Ї#s A97��\ȏ�g��t}JH�i�������D0�?���=zC�s�t��EC��K�����u��#�����s�1$ y>��g|X���)���� !&x���ޔ�dr��.|��}qc։�q"�b��������Q�E�O�?�����D���3��F2	�(��$|Y���5����8����[4/�zR�94M�F|�"O��K���ȏ��,�D ��*��y����^(�t�����[:| ��/��!�#��HG�:�I�%4����/??��ή�\�}�y���u�ò?�(���}⿝;C�����#.y�O�Q\~�ʌ�IR!��?���H{�� %~�F����1nc�S+{�����0��gf�8���L�'�=sI���g��z��*A��~L�ɫ��c�z�� 9�'�qr�M?D���]���}?���%����!�����E�aJ �aD�?_���yI��DC�Gi޴9o�/3�Mп͈Y�y���$2�C�����u�$ bȖo�a���A҃�������Ĉg>B1�J���bVr-��?�!�&?X��Cȇ��C���s�'!�[�3�R	'���'K�K���K�.G�)�����udv�8�_����?Ҳ� fX���O�L֏]%'�+t^�}�C��a�|��D�?���b1)���D�9'��?�>���2C����D�����	I����{��#�F?�G�I���~D͌ w����aGQ!�D�OE.�!. B��:s��t�?��B"�'�w�O�� C�*�a?ji:)L�Nè��, ��d�~�~��g3,�WT�:����JX�-�J,H��9������E��C�S�g�ޜ��Z��+K.y��&N�,<�x�� �Ȅ��?�,�;�Dk�VC��L_/�G�/����bϞYc"O�8��f�䵿��+�>�!)D����#��k�$�_ރ��׃��%%в9Jh����FP���G��{δ����G�L��!����y"��lG�#��BH�|��u��\D��;���������FL�A腥���$�$}�"��?s����G���_�r}h'���� ���������G��:Rs�ş���Ȓ��vM$|d��������I� #/�d9	3�hBu�ȘKȌ|�A�bJG }&ϑ��O���?o��:PJ������&V�z/��g��?S��"�i����;�Y��u�B2��(��(���-( ̏�'����~���Mnv� ['���$��"�~$Gȏ���܊=iD��Ց�P��#>rMv�m_�� �0�������?E^��,뺟�${�F}{�W����K��E�"�[�B-��������s �	�J�=��R�φ#�u,�}� ZHG!2O�o��9՞,t�H��tک[�7}C����$b�%�\�z�:VzG�	?��NFM����7��)vR�`�$ҋ��B���,r�����ӟ�n���a�b����}>��Y.I!z������$�L���v����� �H���J��3!җ�����%��d� ��1�9�����d�J�;�9����V�����{��K����D=lG��9�Ӳ�'�J�9.�~���nK��G���i���ng���c�tQ�C����ҳ��_�t����O��D~ȟ�'�x��{���_��Ay#��>���c#T��gt=��7� =I%�7&}dG���ٿȓ��N}?	=S^O�7.g a�.�?����I޵��!�t̏��*�J�w��̋�~wD�@I�#����%���x�v r������x�>���!��2?��hI�_�G��F_M�1������I/��~?��A���DN���;�~��� ����?�����>Sy��ܷ��9�/����wo;���G�G�7b~���|�s��g���,J��������i�d _βM,��'���>��d�菼� {ֹ'�>�#�s$G�(a���� t��|�"���C���s��M>��k���� z_U�99ك�?9%�,��f���GX���O�����&$I&��+r>���K����"~�}�qsė��z�������z*�?">��T:ҟ��e��9v���k�O�)˨Bm�~Į���(�?�N� g��P�A�������/�{�'��M�%��q����Jdz�������#�I���T�' ���H��F`���w����D�?�#�G����C���O��:R�Ɏ��O���]��������t�'�8�� �������#9�H��|���������J�R|�[����#�Dm ����Lȏ���ȡO�y�1 }��|�?�3��?�����c���G�����~�Jg��qG?U�}d��'�q�|�� ���?��*./}��|�>�S�1c����!-�P� ���Y��⏾IB���O�7�����%�?ň�?c������@����O�~����K�nh���=)�����@���钻��>��@���ᕛ���*�����d����,<��C������ˈ�3��L�������˜n�ܘ����t�h���6��<�l���5�˔8��혡�5��9�<���n�%�^�D�"�aN�����2)�[�s�v�=�����ߘ�т�����<���	�P�	�`�{����%�n��ϐ�� ��v����&�ċ܅L���՜��&&)%9Q<�<����`�˛6�����D��<燰�k=������	��֝�����J�ʈћ��(��C�T��z�%�՚�����%�щ-���˖�(�z�n���j�i�o-����z�?��`�=�툯��=)��P�Z��甖�O�(=��ǛP���1��6�*��Q��ϝ=)�G�΃i�f�r���[���m�p�	�H�ъa�I���T�ޜ��ل0��-�ՏC�V���2��h�����p��ǃ#�|�|���n=Ν�`���^�|<焨�E�x1�|���;������~���ݗT���D�皃��ܘ��?�Z�s���4�%.�T�Θ�<�@����%q�?������������s�˒Q�n%h��o����L��=�׉p)��X����1$����(醒�5�*�((�ߎ_���5��1*�G�����Ո݌�S����;���ր[�=����p����P���h���ہL�������<�����a�����6�=k���I���g��g�Տ��ӛ�=΃��Α�GAɘ)�����zy��-����ޙ����l��Ǎ�h�Z�z�1�m�����S�p�Q=�ň��&?���;���4�S���(�ӍD=k�=��[�z��Z���2�h���X�Z<爯�f������N��?�$�ǜ�1ϙ�Ȁ�����=)�(��������Ǘ�'W=��=k=k�'���Ղ����f�����r����D���ە��ː�܃#���a>R�ȝ2E�=k�i�D�ލ"?��z���(�	�ő�'d�Z�6���pN�ܝ����z0����m����=�n�L��<�℄�ʘb����V�+�]�������!�=�^>s�&���"����Љ��ǕQ���m�ލ�=k>1���Q�>�����Ǘ:�;��Ӈ��*�ϊ��͛D���ה)d-w��=k�(���1�u�X�������L�"?��<�g�������������N��g�n=Ζ)�'�������<��m��������Ed�(���$�=k��?��ޖ��\��>1��<����N�@��<���<��Q���%+�֐Z�	=Γ1��&K���m�K�|�z�˗T'����󗒉Q��=)���m�����T�ʜ7���,����u����.DQh����ǔ8�1�Ռm����Y���݆J���4����'�ʃ���,�Ɠ|�=���2����!�?I%����1��f�'�N���(����>��h(�����ݝ���S���(�ə=��Ɖ]L�z�d��	��?��;���%՛h=k�r�8=���ք����������G�	�S�������I�,���i?ĕЗs/K�m1'�ˌ��՘��o��`�P����8�4��-�����7�˚k��ƈg�Ӕh�}�G�E�������ǒǎy���򊢈��z����=�އa����`�@����1�͘b���E�k��w:'�͘O��U������!=��/�����H���J�9����4�>���ߝ�L���*=��L|�;���뒄��"�zd���<=)���=k�b��=�Ȝ܏�/=�~���6�w����b�*�-��<痋��S�z����1$���׌a�z��5����=�=�������@�������O$5痿��=�d��?�ܕ|�(<�ؒn��=�E��������Ě@%���3���Ί��;�d��ᘭEl�|�É�U.$�g�͕�˃ӈ�<�яY���ݐ4������:?��V�u����������u���G�P�����-Ǒ����N�|�����;���ܛ��<���0��|�p���Η������d��I��1�H�Ԓ�p���ەi��$��H��锵���u�<,��=��ߘ�������<����U=)���f�����ޚ�1���Q/�+�b������+��g���ǜ����~�p���G>��(������b���߃��,���՗3����y��ݞ�i����˚-��e�v�-�摚����(�D�����Ήp=)���������QI�5	�������ȋ(��Д��-�n�ƅb�8�~���(�ݖ~5����N�=��<��,��O���z��>1��=��>����m���8���ۄx�"����Ŋ��`������n�9�*���8�]�&ǔ����S�������v�˅���.I%(�\�v�ɍ��5��L���9����Ё*���v�ˌ���(��=k��&����I=��5�!�m���ۀ}���ǐZ���ݖ닮�����n>��J�ɇy�5�Ǉ��<��g�\�S�*�v=����b���*���ߗ'^T��������=�O�ޜz�n�H���������H���9t����6���݇����z��Q�*�ܙ����ɍفz�@=Λ���򛴂��.'��>.�����]���\��L�������E,�y�4��C���"�t����D9+��=����)1��D������=��5e'<�ݍ�P��ǒ�N�y��ǀ��Z����;$�\��ȏY�B�U�B�N��@�����0��T���ˀ��=<����+�������7&L��&$����$�D�Ŕh�(�Y)'<�1$��G%����?�����=Κ-�~���*�����md��(��ڊ˚9��*�y�M.k=�=ΜC=�����뒄��۝��p���nI�~JI�-���'<�=�(���g)d���	,���a��I.�y����)���L�ބ��ɍZ%ׅn�a<�q����;�=�������|�m8����������t�(��K�ƎҙZ�d����S�z�����������=M�𗪙������b��3��)(�2��V�뜶�"���+�Ɏk�@�2�/�y9��d�㘡�Бj�7�1���a0醒=)���>�+�������g��E=)�[�]����0����B��4�S�v����N���d�����>����օ�@��錸��0�����=���>��G��=�ēS��=)��=�b�ђ(�Î�(�F=�=k�1/.�o���'��C����=E3��O�)�n��\�ҏY�(�2�(���|�,�剞0�C�I������o����ΕQ�W��GZ�-(%�����ۑ"�d�a��˂N=���),%y��Ëm��	�U�Д ���L�[���O�)u�y,�.G<��Q�喗�����9�.����"�����9���@�<�����Œݍy���d�D���6�����Z��<���)(�>�~9&i��B�(���	���(�T�@���(�'�ǚ�>R=)���-�14���	�E�U�|��� �݊a=΀g����v�����B�;�����ȁ�<�=�.ݝ�V�z��������1,�����f�C��<���'<�%��a��x��`���ň	�Î4���ˊ�����H�G�a�4������=�ݘ�6��=)<��ǖz+<�����a�s�������������zQ�(�n�>��U�E�=)������-'�z&'���Ւ�+)��:�w�����u�`���'��>�ˌ����G=��>����������8��!�����@�|���Җ���=�E��i��������hi���D���[,���g����ܔ�2D�����<��z�扈���u�m�;������ێ�����v��=)���C���������ބ=Κ��'��at��������C�4�������ř�=)�b��<���1� �G�4�Q���=�T$��p�a��B����9�N����щ!���&'�09Ȋa�Uǎ��ˑ�	�ȗ���>1�S�Q����ǎē=�ܛD��=���)	���3�1���*���L���=���	�=��=���|�ʓہz����.��}l�Q��������(��?�������)+�h�g���ƍ�����͘����v�ޙyU�J���y���Q�Ѕ�(�֓���֛����?9���ݚL��`Nn���&�-�4�s��C���(�Z���j���O��{��(�������1?���6�D-�*����~�-W,�C�wd�*�,E6$�/���g�Z��o��������y����X�ܚ�ۆn��L���B�9���������������?��S��1Ȑ��'���g�r�g���Z�;�ǁL�������H�[��?�g�P�݊�톱�ć��C�[����?�,������n>s,�	��=����݆�!�	�_�V�)=����s��]]
	local byte, cr, k2, a3, b3, m3, sp = string.byte, {}
	for i=1,byte(ht,1) do cr[3*i-2], cr[3*i-1], cr[3*i] = byte(ht, 3*i-1, 3*i+1) end
	for i=1,#cr do cr[i] = cr[i] > 1 and (cr[i]/255) or 0 end
	local function r16(p) local a,b = byte(ht, p, p+1) return a*256 + b end	
	k2, m3, a3, b3, sp, lhcPal = r16(#cr+2), r16(#cr+4), r16(#cr+6), r16(#cr+8), #cr + 10, cr

	local function get(s)
		local h, l, a, a2, b, c, d, e, f, o, m = 8388593, #s
		for i=1, l+1, 2 do
			a, b = byte(s, i, i+1)
			h = (h * 4093 + (a or l) * k2 + (b or l) * 65521) % 268435399
		end
		m = -2 * (((h * a3 + b3) % 2147483629) % m3 + 1)
		a, b = byte(ht, m, m + 1)
		if a < 128 then
			return ((h * (a - a % 4) / 4) % 2147483629 % 2 > 0 and (b % 32) or ((a % 4) * 8 + (b - b % 32) / 32)) * 3 - 2
		else
			o = sp + a*256 + b - 32769
			m, a = byte(ht, o, o + 1)
			a = (h * (m * 256 + a) + m) % 2147483629 % m
			a, a2 = (a - a % 8)*5/8, a % 8
			b, c, d, e, f = byte(ht, o+a+2, o+a+6)
			a = b * 4294967296 + c * 16777216 + d * 65536 + e * 256 + f
			return ((a - a % 32^a2) / 32^a2 % 32) * 3 - 2
		end
	end
	lhc = setmetatable({}, {__index=function(t, s)
		local i = type(s) == "string" and get(s:match("[^/\\]*$"):lower():gsub("%.blp$", ""))
		if s then t[s] = cr[i] and i or -3 end
		return i
	end})
end

local ORI, ORI_cR, ORI_cG, ORI_cB, ORI_caption, ORI_icon, ORI_qHint = {}, {}, {}, {}, {}, {}, {}
local function ORI_SliceColor(token, icon)
	if ORI_cR[token] then return ORI_cR[token], ORI_cG[token], ORI_cB[token] end
	local li = lhc[icon] or -3
	return lhcPal[li] or 0.70, lhcPal[li+1] or 1, lhcPal[li+2] or 0.6
end
local function extractAux(ext, v)
	if not ext then
	elseif v == "coord" and type(ext.iconCoords) == "table" then
		return unpack(ext.iconCoords)
	elseif v == "coord" then
		return ext.iconCoords()
	elseif v == "color" and type(ext.iconR) == "number" and type(ext.iconG) == "number" and type(ext.iconB) == "number" then
		return ext.iconR, ext.iconG, ext.iconB
	end
end
local function check(ok, ...)
	if ok then return ... end
end
local function ORI_UpdateCenterIndication(self, si, osi)
	local tok, usable, state, icon, caption, count, cd, cd2, tipFunc, tipArg, ext = OneRingLib:GetOpenRingSliceAction(si);
	caption = ORI_caption[tok] or caption
	ORI_CenterCooldownText:SetFormattedText(cooldownFormat(tok and ORI_ConfigCache[usable and "ShowRecharge" or "ShowCooldowns"] and cd or 0));
	ORI_CenterCaption:SetText(tok and ORI_ConfigCache.ShowCenterCaption and caption or "");
		
	if tok then
		local r,g,b = ORI_SliceColor(tok, ORI_icon[tok] or icon or "INV_Misc_QuestionMark")
		ORI_Pointer:SetVertexColor(r,g,b, 0.9);
		ORI_Circle:SetVertexColor(r,g,b, 0.9);
		ORI_Glow:SetVertexColor(r,g,b);
		ORI_CenterCaption:SetTextColor(r,g,b);
		ORI_CenterCooldownText:SetTextColor(r,g,b);
	elseif si ~= osi then
		ORI_Pointer:SetVertexColor(1,1,1, 0.1);
		ORI_Circle:SetVertexColor(1,1,1, 0.3);
		ORI_Glow:SetVertexColor(0.75,0.75,0.75);
	end

	if ORI_ConfigCache.UseGameTooltip then
		if tipFunc and tipArg then
			GameTooltip_SetDefaultAnchor(GameTooltip, ORI_Frame)
			tipFunc(GameTooltip, tipArg)
			GameTooltip:Show()
		elseif caption and caption ~= "" then
			GameTooltip_SetDefaultAnchor(GameTooltip, ORI_Frame)
			GameTooltip:AddLine(caption)
			GameTooltip:Show()
		elseif GameTooltip:IsOwned(ORI_Frame) then
			GameTooltip:Hide()
		end
	end

	local gAnim, gEnd, oIG, time, usable = self.gAnim, self.gEnd, self.oldIsGlowing, GetTime(), not not usable
	if usable ~= oIG then
		gAnim, gEnd = usable and "in" or "out",  time + 0.3 - (gEnd and gEnd > time and (gEnd-time) or 0);
		self.oldIsGlowing, self.gAnim, self.gEnd = usable, gAnim, gEnd;
		ORI_Glow:SetShown(true);
	end
	if gAnim and gEnd <= time or oIG == nil then
		self.gAnim, self.gEnd = nil, nil;
		ORI_Glow:SetShown(usable);
		ORI_Glow:SetAlpha(0.75);
	elseif gAnim then
		local pg = (gEnd-time)/0.3*0.75;
		ORI_Glow:SetAlpha(usable and (0.75 - pg) or pg);
	end
	self.oldSlice = si
end
local function ORI_UpdateSlice(indic, selected, tok, usable, state, icon, _, count, cd, cd2, tf, ta, ext)
	state, icon, ext = state or 0, ORI_icon[tok] or icon  or "Interface/Icons/INV_Misc_QuestionMark", not ORI_icon[tok] and ext or nil
	local active, overlay, faded, usableCharge, ok, r,g,b = state % 2 > 0, state % 4 > 1, not usable, usable or (state % 128 >= 64)
	indic:SetIcon(icon)
	if ext then
		indic:SetIconTexCoord(check(pcall(extractAux, ext, "coord")))
		ok, r,g,b = pcall(extractAux, ext, "color", c)
	end
	indic:SetUsable(usable, usableCharge, cd and cd > 0, state % 16 > 7, state % 32 > 15)
	indic:SetIconVertexColor(ok and r or 1, g or 1, g or 1)
	indic:SetDominantColor(ORI_SliceColor(tok, icon))
	indic:SetOuterGlow(overlay)
	indic:SetOverlayIcon((ORI_qHint[tok] or ((state or 0) % 64 >= 32)) and "Interface\\MINIMAP\\TRACKING\\OBJECTICONS", 21, 28, 40/256, 64/256, 32/64, 1)
	indic:SetCooldown(cd, cd2, usableCharge)
	indic:SetCooldownFormattedText(cooldownFormat(ORI_ConfigCache[usableCharge and "ShowRecharge" or "ShowCooldowns"] and cd or 0))
	indic:SetCount((count or 0) > 0 and count)
	indic:SetActive(active)
	indic:SetHighlighted(selected and not faded)
end
local function ORI_GhostUpdate(self, slice)
	local count, offset = self.count, self.offset;
	local _, _, _, nestedCount = OneRingLib:GetOpenRingSlice(slice or 0);
	if (nestedCount or 0) == 0 then return GhostIndication:Deactivate(); end
	local scaleM = ORI_ConfigCache.MIScale and 1.10 or 1;
	local group = GhostIndication:ActivateGroup(slice, nestedCount, 90 - 360/count*(slice-1) - offset, self.radius*scaleM, 1.10);
	for i=2,nestedCount do
		ORI_UpdateSlice(group[i], false, OneRingLib:GetOpenRingSliceAction(slice, i));
	end
end
local function ORI_Update(self, elapsed)
	local time, config, count, offset = GetTime(), ORI_ConfigCache, self.count, self.offset

	local scale, l, b, w, h = self:GetEffectiveScale(), self:GetRect();
	local x, y = GetCursorPosition();
	local dx, dy = (x / scale) - (l + w / 2), (y / scale) - (b + h / 2);
	local radius2 = dx*dx+dy*dy;

	local angle, isInFastClick = atan2(dy, dx) % 360, config.CenterAction and radius2 <= 400 and self.fastClickSlice > 0 and self.fastClickSlice <= self.count;
	if isInFastClick then
		angle = (offset + 90 - (self.fastClickSlice-1)*360/count) % 360;
	end

	local oangle = (not isInFastClick) and self.angle or angle;
	local adiff, arate = min((angle-oangle) % 360, (oangle-angle) % 360);
	if adiff > 60 then
		arate = 420 + 120*sin(min(90, adiff-60));
	elseif adiff > 15 then
		arate = 180 + 240*sin(min(90, max((adiff-15)*2, 0)));
	else
		arate = 20 + 160*sin(min(90, adiff*6));
	end
	local abound, arotDirection = arate/GetFramerate(), ((oangle - angle) % 360 < (angle - oangle) % 360) and -1 or 1;
	abound = abound * 2^config.XTPointerSpeed;
	self.angle = (adiff < abound) and angle or (oangle + arotDirection * abound) % 360;
	ORI_Pointer:SetRotation(self.angle/180*3.1415926535898 - 90/180*3.1415926535898);

	local si = isInFastClick and self.fastClickSlice or (count <= 0 and 0) or (radius2 < 1600 and 0) or
		(floor(((atan2(dx, dy) - offset) * count/360 + 0.5) % count) + 1)
	ORI_UpdateCenterIndication(self, si, self.oldSlice);

	if config.MultiIndication and count > 0 then
		local cmState, mut = (IsShiftKeyDown() and 1 or 0) + (IsControlKeyDown() and 2 or 0) + (IsAltKeyDown() and 4 or 0), self.schedMultiUpdate or 0;
		if self.omState ~= cmState or mut >= 0  then
			self.omState, self.schedMultiUpdate = cmState, -0.05;
			for i=1,count do
				ORI_UpdateSlice(ORI_Slices[i], si == i, OneRingLib:GetOpenRingSliceAction(i));
			end
			if config.GhostMIRings then
				ORI_GhostUpdate(self, si);
			end
		else
			self.schedMultiUpdate = mut + elapsed;
		end

		for i=1,config.MIScale and count or 0 do
			SetScaleSmoothed(ORI_Slices[i], i == si and 1.10 or 1, 2^ORI_ConfigCache.XTScaleSpeed)
		end
	end
end
local function ORI_ZoomIn(self, elapsed)
	self.eleft = self.eleft - elapsed;
	local delta, config = max(0, self.eleft/ORI_ConfigCache.XTZoomTime), ORI_ConfigCache;
	if delta == 0 then self:SetScript("OnUpdate", ORI_Update); end
	self:SetScale(config.RingScale/max(0.2,cos(65*delta))); self:SetAlpha(1-delta);
	return ORI_Update(self, elapsed);
end
local function ORI_ZoomOut(self, elapsed)
	self.eleft = self.eleft - elapsed;
	local delta = max(0, self.eleft/ORI_ConfigCache.XTZoomTime);
	if delta == 0 then return self:Hide(), self:SetScript("OnUpdate", nil); end
	if ORI_ConfigCache.MultiIndication and ORI_ConfigCache.MISpinOnHide then
		local count = self.count;
		if count > 0 then
			local baseAngle, angleStep, radius, prog = 45 - self.offset + 45*delta, 360/count, self.radius, (1-delta)*150*max(0.5, min(1, GetFramerate()/60));
			for i=1,count do
				ORI_Slices[i]:SetPoint("CENTER", cos(baseAngle)*radius + cos(baseAngle-90)*prog, sin(baseAngle)*radius + sin(baseAngle-90)*prog);
				baseAngle = baseAngle - angleStep;
			end
		end
		self:SetScale(ORI_ConfigCache.RingScale*(1.75 - .75*delta));
	else
		self:SetScale(ORI_ConfigCache.RingScale*delta);
	end
	self:SetAlpha(delta);
end
ORI_Frame:SetScript("OnHide", function(self)
	if self:IsShown() and self:GetScript("OnUpdate") == ORI_ZoomOut then
		self:SetScript("OnUpdate", nil)
		self:Hide()
	end
end)

function ORI:Show(ringName, fcSlice, fastOpen)
	local frame, config, _ = ORI_Frame, ORI_ConfigCache;
	_, frame.count, frame.offset = OneRingLib:GetOpenRing(config);
	frame.radius = CalculateRingRadius(frame.count or 3, 48, 48, 95, 90-(frame.offset or 0))
	frame:SetScript("OnUpdate", ORI_ZoomIn);
	frame.eleft, frame.fastClickSlice, frame.oldSlice, frame.angle, frame.omState, frame.oldIsGlowing = config.XTZoomTime * (fastOpen and 0.5 or 1), fcSlice or 0, -1;
	ORI_SetRotationPeriod(config.XTRotationPeriod)
	MouselookStop();
	GhostIndication:Reset();

	local astep, radius = frame.count == 0 and 0 or -360/frame.count, frame.radius;
	for i=1,config.MultiIndication and frame.count or 0 do
		local indic, _, _, sliceBind  = ORI_Slices[i], OneRingLib:GetOpenRingSlice(i);
		indic:SetBindingText(config.ShowKeys and sliceBind and shortBindName(sliceBind));
		SetAngle(indic, (i - 1) * astep - frame.offset, radius);
		indic:SetShown(true)
		indic:SetScale(1)
	end
	for i=config.MultiIndication and (frame.count+1) or 1, #ORI_Slices do
		ORI_Slices[i]:SetShown(false)
	end

	config.RingScale = max(0.1, config.RingScale);
	frame:SetScale(config.RingScale); frame.anchor:SetScale(config.RingScale);
	if config.RingAtMouse then
		local es, cx, cy = frame:GetEffectiveScale(), GetCursorPosition()
		frame.anchor:SetPoint("CENTER", nil, "BOTTOMLEFT", (cx + config.IndicationOffsetX)/es, (cy - config.IndicationOffsetY)/es);
	else
		local es = frame:GetEffectiveScale()
		frame.anchor:SetPoint("CENTER", nil, "CENTER", config.IndicationOffsetX/es, -config.IndicationOffsetY/es);
	end
	frame:Show();

	ORI_Update(frame, 0);
end
function ORI:Hide()
	ORI_Frame:SetScript("OnUpdate", ORI_ZoomOut);
	ORI_Frame.eleft = ORI_ConfigCache.XTZoomTime;
	GhostIndication:Deactivate();
	if GameTooltip:IsOwned(ORI_Frame) then
		GameTooltip:Hide()
	end
end
function ORI:SetDisplayOptions(token, icon, caption, r,g,b)
	if type(r) ~= "number" or type(g) ~= "number" or type(b) ~= "number" then r,g,b = nil end
	ORI_cR[token], ORI_cG[token], ORI_cB[token], ORI_caption[token], ORI_icon[token] = r,g,b, caption, icon
end
function ORI:SetQuestHint(sliceToken, hint)
	ORI_qHint[sliceToken] = hint or nil
end
function ORI:GetTexColor(icon)
	return ORI_SliceColor(nil, icon)
end
function ORI:SetIndicatorConstructor(func)
	if func then
		local s = func(nil, ORI_Frame, 48)
		for k,v in pairs(ORI_IndicatorAPI) do
			local tk, te = type(s[k]), type(v)
			if tk ~= te then
				return error(("Expected %s for indicator key %q, got %s."):format(te, k, tk), 2)
			end
		end
	end
	ORI_CreateIndicator = func or ORI_CreateDefaultIndicator
	GhostIndication:Wipe()
	for k,v in pairs(ORI_Slices) do
		ORI_Slices[k] = nil
		v:SetShown(false)
	end
	ORI_Frame:Hide()
end

OneRingLib.ext.OPieUI = ORI
ORI:SetIndicatorConstructor(ORI_CreateDefaultIndicator)
OneRingLib:SetAnimator(ORI)
for k,v in pairs({ShowCenterCaption=false, ShowCooldowns=false, ShowRecharge=false, MultiIndication=true, UseGameTooltip=true, ShowKeys=true,
	MIScale=true, MISpinOnHide=true, GhostMIRings=true, XTPointerSpeed=0, XTScaleSpeed=0, XTZoomTime=0.3, XTRotationPeriod=4}) do
	OneRingLib:RegisterOption(k,v)
end