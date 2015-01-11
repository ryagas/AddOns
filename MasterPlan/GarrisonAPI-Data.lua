local _, T = ...
if T.Mark ~= 23 then return end

local lhc = {} do
	local ht, hp = UnitFactionGroup("player") ~= "Horde" and [[îàÅÝÍ#âT³^)våùÓóÿíûIó¶SÿÐÖ4ò‘Óþd#¿8|ñ9>w|“?þz5Ÿý)?¹Ì#‰ÿ“ÿgÈèüç'Ï/±“ÿÎzäû'÷;äû¿öKîüÉÿ­ŒÿàÆè…&G~Ÿc>ß¬’£¾ïýŽt¾CÑŸûÝ2_9ç?‘ßŸÙÿþgÿÝ&9ÌÿâCÏç¥'÷äi?ùÿÿû\Ÿ¼ŒAåóÎdûNsüò<þr}ÈwþOþ”9?òúXv¶_9ß·ÿgÏõ’NwÝÿä—ÎzOçcYò3íaÉöOÿù	ÿÍ¬û&ìüØæ|ÿ#>ÈŸ$¾ýb?öÒg$éÎ#˜OžHŸÝ/Ÿÿÿéÿ²„wþC³ît¦Cÿì#[ö9ßû?IÓùö1Çùv|ÿ;>süŸoþÇìl¿ø4Œ'þBLÿùç?Ÿé]] or [[/ºq0F!‰®möÐ4†¶}´ÁŠã½oÿÿõ®+ŠaÿÿÿŠô&)J…Å(JÒ´¥)Š(ô­+—þ„>+“¢˜ëü¿'ÿÿ—þD=Bÿÿÿt'JH;hE±Š¾Ÿz`ô¥ñÿÿÿýÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÑõ§ÿÿÿÿþ?ÿÿÿÿÿzeôB_•D¥rZW=tJ`÷Æ0BÓ"(ƒÓ¥|c¡1ŠÈ”ÅoúÖ¸­qÿÿÿÿÿ¢ˆ>1ZW=oZÖµ­ôzÒ•¥)ü´®ú>ùKò—ÿò?î"P„|ÿÿ)è„¥ùÿ#Ó¦|iG´Zß¥qÿþˆ¡éÿÿÿÿÿÿÿÿÿÿ_ÿÿÿÿŠÿÿÿòÿÒïÿèÿÿÿÿÿú>ÿÿÿ\PúQízèŠ"ˆJPô>(D^„FE”ÂúH=é]], [[(((h((inq(pjgkosr(lm]]
	local p, G, V, Vp, by, ak = {}, 7, 487, 17, ht.byte
	for i=1,#hp do p[i] = by(hp, i) - 40 end
	ak = by(ht, 1) + by(ht, 2)*256
	setmetatable(lhc, {__index=function(t, k)
		local k, c, a, v, r, b, d, e = k or false, k, type(k)
		if a == "string" then
			a, c = "number", tonumber(k:match("^0x0*(%x*)$") or "z", 16) or false
		end
		if a == "number" and c then
			a = 2*(((c * ak) % 2147483629) % G)
			a, b = by(ht, a+3, a+4)
			v = ((c * (a*256+b) + ak) % 2147483629) % V
			v, r = Vp + (v - v % 8)*5/8, v % 8
			a, b, c, d, e = by(ht, v, v + 4)
			v = a * 4294967296 + b * 16777216 + c * 65536 + d * 256 + e
			v = ((v - v % 32^r) / 32^r % 32)
		end
		t[k] = p[v] or 0
		return t[k]
	end})
end
T.Affinities = lhc

T.EnvironmentCounters = {[11]=4, [12]=38, [13]=42, [14]=43, [15]=37, [16]=36, [17]=40, [18]=41, [19]=42, [20]=39, [21]=7, [22]=9, [23]=8, [24]=45, [25]=46, [26]=44, [27]=47, [28]=48, [29]=49,}