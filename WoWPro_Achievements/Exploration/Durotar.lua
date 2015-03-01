
-- WoWPro Guides by "The WoW-Pro Community" are licensed under a Creative Commons Attribution-NonCommercial-NoDerivs 3.0 Unported License.
-- Based on a work at github.com.
-- Permissions beyond the scope of this license may be available at http://www.wow-pro.com/License.

-- URL: http://wow-pro.com/wiki/exploration_achievements_kalimdor
-- Date: 2014-05-28 22:18
-- Who: Ludovicus
-- Log: Uldum moved to Cata

-- URL: http://wow-pro.com/node/3473/revisions/26376/view
-- Date: 2014-05-28 20:32
-- Who: Ludovicus
-- Log: Converted

-- URL: http://wow-pro.com/node/3473/revisions/26310/view
-- Date: 2014-05-26 17:38
-- Who: Ludovicus
-- Log: Added guide type.

-- URL: http://wow-pro.com/node/3473/revisions/24981/view
-- Date: 2012-05-27 17:49
-- Who: Ludovicus

-- URL: http://wow-pro.com/node/3473/revisions/24979/view
-- Date: 2012-05-27 17:19
-- Who: Ludovicus

-- URL: http://wow-pro.com/node/3473/revisions/24978/view
-- Date: 2012-05-27 17:19
-- Who: Ludovicus

local guide = WoWPro:RegisterGuide("LudoExpDur","Achievements","Durotar","Ludovicus", "Neutral")
WoWPro:GuideLevels(guide,20,90)
WoWPro:GuideIcon(guide,"ACH",728)
WoWPro:GuideProximitySort(guide)
WoWPro:GuideSteps(guide, function()
return [[

F Valley of Trials|QID|907280001|M|44.17,64.68|ACH|728;1|
F Northwatch Foothold|QID|907280002|M|49.82,81.50|ACH|728;2|
F Southfury Watershed|QID|907280003|M|43.15,42.55|ACH|728;3|
F Sen'jin Village|QID|907280004|M|55.98,74.36|ACH|728;4|
F Echo Isles|QID|907280005|M|64.14,74.41|ACH|728;5|
F Tiragarde Keep|QID|907280006|M|59.51,58.30|ACH|728;6|
F Razor Hill|QID|907280007|M|52.83,42.81|ACH|728;7|
F Razormane Grounds|QID|907280008|M|49.11,48.81|ACH|728;8|
F Thunder Ridge|QID|907280009|M|40.90,26.51|ACH|728;9|
F Drygulch Ravine|QID|907280010|M|52.60,21.52|ACH|728;10|
F Skull Rock|QID|907280011|M|54.97,09.96|ACH|728;11|
F Orgrimmar|QID|907280012|M|45,11|ACH|728;12|

N Congratulations on exploring Durotar|

]]
end)
