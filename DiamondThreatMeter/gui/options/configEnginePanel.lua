local activeModule = "GUI configuration engine panel";

-- --------------------------------------------------------------------
-- ////////////////////////////////////////////////////////////////////
-- --                            GUI PART                            --
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- --------------------------------------------------------------------

local MAX_EMULATION_ROWS = 0;

local saveSchema = {
    [1] = {
        part = "engine",
        key = "aggroValidationDelay",
        method = "NUMERIC_CONTROL",
        value = "DTM_ConfigurationFrame_EnginePanel_AggroDelaySlider",
    },

    [2] = {
        part = "engine",
        key = "checkZoneWideCombat",
        method = "NUMERIC_CONTROL",
        value = "DTM_ConfigurationFrame_EnginePanel_ZoneWideCheckRateSlider",
    },

    [3] = {
        part = "engine",
        key = "tpsUpdateRate",
        method = "NUMERIC_CONTROL",
        value = "DTM_ConfigurationFrame_EnginePanel_TPSUpdateRateSlider",
    },

    [4] = {
        part = "engine",
        key = "detectUnitReset",
        method = "BOOLEAN_CONTROL",
        value = "DTM_ConfigurationFrame_EnginePanel_DetectResetCheckButton",
    },

    [5] = {
        part = "engine",
        key = "workMethod",
        method = "DROPLIST_CONTROL",
        value = "DTM_ConfigurationFrame_EnginePanel_WorkMethodDropDown",
        list = {
            [1] = "PARSE",
            [2] = "HYBRID",
            [3] = "NATIVE",
        },
    },
};

local defaultSchema = saveSchema; -- Indeed, one schema only is enough.
local updateSchema = saveSchema; -- It's simply the reverse way.

-----------------------------------------------------------------------------
-- DTM_ConfigurationFrame_EnginePanel_OnLoad()
--
-- Called when the engine config panel is loaded.
-----------------------------------------------------------------------------

function DTM_ConfigurationFrame_EnginePanel_OnLoad(self)
    -- Registers itself as a custom tab of Blizzard Interface options.

    self.name = DTM_Localise("configEngineCategory");
    self.parent = "DiamondThreatMeter";

    self.okay = function(self)
                    DTM_ConfigurationFramePanel_Save(self, saveSchema);
                end;
    self.cancel = function(self) DTM_ConfigurationFrame_EnginePanel_Refresh(self); end;
    self.default = function(self)
                       DTM_ConfigurationFramePanel_Default(self, defaultSchema);
                       DTM_ConfigurationFrame_EnginePanel_Refresh(self);
                   end;

    InterfaceOptions_AddCategory(self);

    -- Configure regular widgets.

    DTM_ConfigurationFramePanel_SetSlider(DTM_ConfigurationFrame_EnginePanel_AggroDelaySlider,
                                          0.000, 3.000, 0.100,
                                          "%.1f s", "0 s", "3 s",
                                          DTM_Localise("configAggroDelaySlider"), DTM_Localise("configTooltipAggroDelayExplain"));

    DTM_ConfigurationFramePanel_SetSlider(DTM_ConfigurationFrame_EnginePanel_ZoneWideCheckRateSlider,
                                          0.000, 10.000, 1.000,
                                          function(value) if ( value <= 0 ) then return "OFF"; else return string.format("%.0f s", value); end end, "OFF", "10 s",
                                          DTM_Localise("configZoneWideCheckRateSlider"), DTM_Localise("configTooltipZoneWideCheckRateExplain"));

    DTM_ConfigurationFramePanel_SetSlider(DTM_ConfigurationFrame_EnginePanel_TPSUpdateRateSlider,
                                          0.000, 5.000, 0.500,
                                          function(value) if ( value <= 0 ) then return "OFF"; else return string.format("%.1f s", value); end end, "OFF", "5 s",
                                          DTM_Localise("configTPSUpdateRateSlider"), DTM_Localise("configTooltipTPSUpdateRateExplain"));

    DTM_ConfigurationFramePanel_SetDropDown(DTM_ConfigurationFrame_EnginePanel_WorkMethodDropDown, 128,
                                            {DTM_Localise("configWorkMethodAnalyze"),        DTM_Localise("configWorkMethodHybrid"),        DTM_Localise("configWorkMethodNative")},
                                            {DTM_Localise("configTooltipWorkMethodAnalyze"), DTM_Localise("configTooltipWorkMethodHybrid"), DTM_Localise("configTooltipWorkMethodNative")},
                                            {nil, nil, nil});

    -- Then we do the translation of stuff we need to only do once.

    DTM_ConfigurationFramePanel_SetTextAndTooltip(DTM_ConfigurationFrame_EnginePanel_DetectResetCheckButton, "configDetectReset", "configTooltipDetectResetExplain");
    DTM_ConfigurationFrame_EnginePanel_WorkMethodDropDownCaption:SetText( DTM_Localise("configWorkMethod") );

    -- Okay, update its display.

    DTM_ConfigurationFrame_EnginePanel_Refresh(self);
end

-----------------------------------------------------------------------------
-- DTM_ConfigurationFrame_EnginePanel_OnUpdate(self, elapsed)
--
-- Called when the engine config panel is updated.
-----------------------------------------------------------------------------

function DTM_ConfigurationFrame_EnginePanel_OnUpdate(self, elapsed)
    -- Update here infos etc. that can vary through time.

    -- We first update the toggle button text and caption.
    local status = DTM_IsEngineRunning();
    if ( status ) then -- Non-nil states will show up a disable command.
        DTM_ConfigurationFrame_EnginePanel_ToggleButton:SetText( DTM_Localise("configEngineDisable") );
        if ( status == 1 ) then
            DTM_ConfigurationFrame_EnginePanel_ToggleButtonCaption:SetText( DTM_Localise("configEngineDisableCaption") );
      elseif ( status == 2 ) then
            DTM_ConfigurationFrame_EnginePanel_ToggleButtonCaption:SetText( DTM_Localise("configEnginePaused") );
      elseif ( status == 3 ) then
            DTM_ConfigurationFrame_EnginePanel_ToggleButtonCaption:SetText( DTM_Localise("configEngineEmergencyStop") );
        end
  else
        DTM_ConfigurationFrame_EnginePanel_ToggleButton:SetText( DTM_Localise("configEngineEnable") );
        DTM_ConfigurationFrame_EnginePanel_ToggleButtonCaption:SetText( DTM_Localise("configEngineEnableCaption") );
    end
end

-----------------------------------------------------------------------------
-- DTM_ConfigurationFrame_EnginePanel_Refresh(self)
--
-- Called when the engine config panel has to refresh its controls.
-----------------------------------------------------------------------------

function DTM_ConfigurationFrame_EnginePanel_Refresh(self)
    -- In this function we first do tasks common to all config panels.

    DTM_ConfigurationFramePanel_Update(self, updateSchema);

    -- Fire the OnUpdate handler.

    DTM_ConfigurationFrame_EnginePanel_OnUpdate(self, 0);
end

-----------------------------------------------------------------------------
-- DTM_ConfigurationFrame_EnginePanel_Open()
--
-- This function allows you to open the engine panel from an external way.
-----------------------------------------------------------------------------

function DTM_ConfigurationFrame_EnginePanel_Open()
    InterfaceOptionsFrame_OpenToCategory(DTM_ConfigurationFrame_EnginePanel);
end