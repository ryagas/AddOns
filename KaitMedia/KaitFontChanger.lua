-- The fonts used are
-- BigNoodleTitling (by Sentinel Type http://www.dafont.com/bignoodle-titling.font)
-- Roboto (the default Android OS font)
-- both are Freeware + distributed

KaitFontChanger = CreateFrame("Frame", "KaitFontChanger");

local font1 = "Interface\\AddOns\\KaitMedia\\Fonts\\big_noodle_titling.ttf"
local font2 = "Interface\\AddOns\\KaitMedia\\Fonts\\Roboto-Black.ttf"
local font3 = "Interface\\AddOns\\KaitMedia\\Fonts\\Roboto-Bold.ttf"
local font4 = "Interface\\AddOns\\KaitMedia\\Fonts\\Roboto-BoldCondensed.ttf"
local shadowoffset = true

function KaitFontChanger:ApplySystemFonts()

DAMAGE_TEXT_FONT = font1
UNIT_NAME_FONT   = font4
-- NAMEPLATE_FONT     = font4
-- STANDARD_TEXT_FONT = font3

ZoneTextString:SetFont(font1, 60, "NONE")
ZoneTextString:SetShadowColor(0, 0, 0)
ZoneTextString:SetShadowOffset(1, -1)

SubZoneTextString:SetFont(font1, 60, "NONE")
SubZoneTextString:SetShadowColor(0, 0, 0)
SubZoneTextString:SetShadowOffset(1, -1)

PVPInfoTextString:SetFont(font4, 16, "NONE")
PVPInfoTextString:SetShadowColor(0, 0, 0)
PVPInfoTextString:SetShadowOffset(1, -1)

PVPArenaTextString:SetFont(font4, 16, "NONE")
PVPArenaTextString:SetShadowColor(0, 0, 0)
PVPArenaTextString:SetShadowOffset(1, -1)


end

KaitFontChanger:RegisterEvent("ADDON_LOADED");

KaitFontChanger:ApplySystemFonts()



------------------------------------------------------
------------------------------------------------------

-- REFERRENCE

-- If you want to add a colour value to the font string you have to add 3 more numbers at the end representing rgb values
-- Like this:
-- QuestTitleFontBlackShadow:SetFont(font1, 16, "THINOUTLINE", 0, 0, 0, 1, -1, 1.0, 0.82, 0)
-- However, I'm fairly sure many font colours are set globally and will overule this (such as reaction, difficulty or rep colours)
-- ALSO - Addons like Aurora are changing many of the fonts too and might overule these changes

-- Names of some font strings taken from the old AfterFonts addon:
-- (these may be depreciated for all I know, but a few definitely work)

-- AchievementFont_Small              
-- NumberFont_OutlineThick_Mono_Small 
-- NumberFont_Outline_Huge            
-- NumberFont_Outline_Large           
-- NumberFont_Outline_Med             
-- NumberFont_Shadow_Med              
-- NumberFont_Shadow_Small            
-- SystemFont_InverseShadow_Small     
-- SystemFont_Large                   
-- SystemFont_Med1                    
-- SystemFont_Med2                    
-- SystemFont_Med3                    
-- SystemFont_OutlineThick_Huge2      
-- SystemFont_OutlineThick_Huge4      
-- SystemFont_OutlineThick_WTF        
-- SystemFont_Outline_Small           
-- SystemFont_Shadow_Huge1            
-- SystemFont_Shadow_Huge3            
-- SystemFont_Shadow_Large            
-- SystemFont_Shadow_Med1             
-- SystemFont_Shadow_Med3             
-- SystemFont_Shadow_Outline_Huge2    
-- SystemFont_Shadow_Small            
-- SystemFont_Small                   
-- SystemFont_Tiny                    
-- ReputationDetailFont               
-- ItemTextFontNormal                 
-- DialogButtonNormalText             
-- InvoiceTextFontNormal              
-- InvoiceTextFontSmall               
-- MailTextFontNormal                 
-- GameFontHighlightSmall             
-- GameFontNormalSmall                
-- GameFontDisableSmall               
-- GameFontNormalHuge                 
-- GameFontNormalLarge                
-- GameFontHighlight                  
-- GameFontDisable                    
-- GameFontNormal                     
-- GameFontBlackMedium                
-- GameFontHighlightMedium            
-- SubSpellFont                       
-- NumberFontNormalSmall              
-- NumberFontNormal                   
-- NumberFontNormalLarge              
-- NumberFontNormalHuge               
-- WorldMapTextFont                   
-- MovieSubtitleFont                  
-- AchievementPointsFont              
-- AchievementPointsFontSmall         
-- AchievementDateFont                
-- AchievementCriteriaFont            
-- AchievementDescriptionFont         
-- FriendsFont_Large                  
-- FriendsFont_Normal                 
-- FriendsFont_Small                  
-- FriendsFont_UserText               
-- GameTooltipHeaderText              
-- GameTooltipText                    
-- GameTooltipTextSmall               
-- ZoneTextString                     
-- SubZoneTextString                  
-- PVPInfoTextString                  
-- PVPArenaTextString                 
-- CombatTextFont                     
-- BackpackTokenFrameToken1Count      
-- BackpackTokenFrameToken2Count      
-- BackpackTokenFrameToken3Count      
-- QuestFontHighlight                 
-- QuestFontNormalSmall               
-- QuestLogTitleText                  
-- QuestTitleFont                     
-- QuestFont                          
-- QuestFont_Large
-- QuestTitleFontBlackShadow          
-- QuestFont_Super_Huge               
-- HelpFrameKnowledgebaseNavBarHomeButtonText
-- GameFont_Gigantic