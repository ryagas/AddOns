local _, T = ...
if T.Mark ~= 23 then return end

local lhc = {} do
	local ht, hp = UnitFactionGroup("player") ~= "Horde" and [[�����#�T�^)v�������I�S���4���d#�8|�9>w|�?�z5��)?��#����g����'�/����z��'�;����K����������&G~�c>߬������t�Cџ��2_9�?�ߟ���g��&9���C��'��i?����\���A���d�Ns��<�r}�w�O��9?��Xv�_9߷�g���Nw�����zO�cY�3�a��O��	�ͬ��&����|�#>ȟ$���b?��g$��#�O�H��/�������w�C��t�C��#[�9��?I���1��v|�;>s��o���l��4�'�BL���?��]] or [[/�q0F!��m��4��}�����o����+�a�����&)J��(JҴ�)�(��+���>+������'����D=B���t'JH;hE����z`�������������������������������?�����ze�B_�D�rZW=tJ`��0B�"(���|c�1�Ȕ�o�ָ�q�������>1ZW=oZֵ��zҕ�)����>�K���?�"P�|���)脥��#Ӧ|iG�Z��q���������������_��������������������>���\P�Q�z�"�JP�>(D^�FE���H=�]], [[(((h((inq(pjgkosr(lm]]
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