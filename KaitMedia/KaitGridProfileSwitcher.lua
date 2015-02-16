-- This is for getting Grid to change to 40man Grid layouts before the layout gets disrupted by having
-- too many large Grid frames to fit on the screen (i.e. when enterring large groups with a small group Grid profile)

-- Profiles referred to in the script are "DPS 5/10man", "DPS 40man", "Healer 40man", "Healer 5/10/25man"
-- so if you change the name of those profiles or create others in-game, this script won't work

-- This script also puts Grid into a lower Strata to keep it under the Talent frame effects
-- (without having to edit Grid itself and cause updating problems)
-- And it moves the Grid frames according to whether the minimap is hidden or not

-- Thanks to Treeston from the mmo-champion forums for this code





local f = CreateFrame("Frame")
local m = Minimap

if IsAddOnLoaded("Grid") then
	
local g = GridLayoutFrame
local gp = Grid.db:GetCurrentProfile()



local function set(p)
    if Grid.db:GetCurrentProfile() ~= p then Grid.db:SetProfile(p) end
end

f:SetScript("OnEvent",function(s,e)
	if GetNumGroupMembers() > 25 and Grid.db:GetCurrentProfile() == "Healer 5/10/25man" then set("Healer 40man")
		elseif ( m:IsShown() and GetNumGroupMembers() > 25 and gp == "DPS 5/10man" ) then g:SetPoint("TOPRIGHT", "UIParent", "TOPRIGHT", -11, -122) set("DPS 40man")
		elseif ( GetNumGroupMembers() > 25 and gp == "DPS 5/10man" ) then g:SetPoint("TOPRIGHT", "UIParent", "TOPRIGHT", -11, -276) set("DPS 40man")
	end
	GridLayoutFrame:SetFrameStrata("LOW")
end)

else end

f:RegisterEvent("GROUP_ROSTER_UPDATE")
f:RegisterEvent("PLAYER_ENTERING_WORLD")

