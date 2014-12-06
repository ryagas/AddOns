-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

-- Functions
local next = _G.next
local pairs = _G.pairs
local tonumber = _G.tonumber
local type = _G.type

-- Libraries
local math = _G.math
local table = _G.table

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local _Cursor = _Cursor
local L = _CursorLocalization
local NS = CreateFrame("Frame")
_Cursor.Options = NS

local SetsPanel = CreateFrame("Frame", "_CursorOptionsSets", NS, "OptionsBoxTemplate")
NS.SetsPanel = SetsPanel
SetsPanel.Set = CreateFrame("EditBox", "_CursorOptionsSet", SetsPanel, "InputBoxTemplate")
SetsPanel.Set.Button = CreateFrame("Button", nil, SetsPanel.Set)
SetsPanel.SaveButton = CreateFrame("Button", nil, SetsPanel, "UIPanelButtonTemplate")
SetsPanel.LoadButton = CreateFrame("Button", nil, SetsPanel, "UIPanelButtonTemplate")
SetsPanel.DeleteButton = CreateFrame("Button", nil, SetsPanel, "UIPanelButtonGrayTemplate")

local CursorsPanel = CreateFrame("Frame", "_CursorOptionsCursors", NS, "OptionsBoxTemplate")
NS.CursorsPanel = CursorsPanel
CursorsPanel.ApplyButton = CreateFrame("Button", nil, CursorsPanel, "UIPanelButtonGrayTemplate")
CursorsPanel.Enabled = CreateFrame("CheckButton", "_CursorOptionsEnabled", CursorsPanel, "InterfaceOptionsCheckButtonTemplate")
CursorsPanel.Preview = CreateFrame("Frame", nil, CursorsPanel)
CursorsPanel.X = CreateFrame("Slider", "_CursorOptionsX", CursorsPanel.Preview, "OptionsSliderTemplate")
CursorsPanel.Y = CreateFrame("Slider", "_CursorOptionsY", CursorsPanel.Preview, "OptionsSliderTemplate")
CursorsPanel.Scale = CreateFrame("Slider", "_CursorOptionsScale", CursorsPanel.Preview, "OptionsSliderTemplate")
CursorsPanel.Facing = CreateFrame("Slider", "_CursorOptionsFacing", CursorsPanel.Preview, "OptionsSliderTemplate")
CursorsPanel.Type = CreateFrame("Frame", "_CursorOptionsType", CursorsPanel, "UIDropDownMenuTemplate")
CursorsPanel.Value = CreateFrame("Frame", "_CursorOptionsValue", CursorsPanel, "UIDropDownMenuTemplate")
CursorsPanel.Path = CreateFrame("EditBox", "_CursorOptionsPath", CursorsPanel, "InputBoxTemplate")

local TabsUnused = {}
CursorsPanel.TabsUnused = TabsUnused
local TabsUsed = {}
CursorsPanel.TabsUsed = TabsUsed

local Preset = {}
NS.Preset = Preset

function SetsPanel.Set:OnEnterPressed()
	self:ClearFocus()
end

function SetsPanel.Set:OnTextChanged()
	local Name = self:GetText()
	SetsPanel.SaveButton[Name == "" and "Disable" or "Enable"](SetsPanel.SaveButton)

	if _CursorOptions.Sets[Name] then
		SetsPanel.LoadButton:Enable()
		SetsPanel.DeleteButton:Enable()
	else
		SetsPanel.LoadButton:Disable()
		SetsPanel.DeleteButton:Disable()
	end
end

do
	local Sorted = {}

	function SetsPanel.Set:initialize()
		for Name in pairs(_CursorOptions.Sets) do
			Sorted[#Sorted + 1] = Name
		end
		table.sort(Sorted)

		local Info = UIDropDownMenu_CreateInfo()
		Info.notCheckable = true

		for _, Name in ipairs(Sorted) do
			Info.text = Name
			Info.arg1 = Name
			Info.func = self.OnSelect
			UIDropDownMenu_AddButton(Info)
		end

		table.wipe(Sorted)
	end
end

function SetsPanel.Set:OnSelect(Name)
	SetsPanel.Set:OnEnterPressed()
	SetsPanel.Set:SetText(Name)
end

function SetsPanel.Set.Button:OnClick()
	local Parent = self:GetParent()
	Parent:ClearFocus()
	ToggleDropDownMenu(nil, nil, Parent, Parent:GetName(), 0, 0)
	PlaySound("igMainMenuOptionCheckBoxOn")
end

function SetsPanel.Set.Button:OnHide()
	CloseDropDownMenus()
end

function SetsPanel.SaveButton:OnClick()
	local Name = SetsPanel.Set:GetText()
	local NewSet = _CursorOptions.Sets[Name] or {}
	_Cursor.SaveSet(NewSet)
	_CursorOptions.Sets[Name] = NewSet
	SetsPanel.Set:ClearFocus()
	SetsPanel.Set:OnTextChanged()
end

function SetsPanel.LoadButton:OnClick()
	_Cursor.LoadSet(_CursorOptions.Sets[SetsPanel.Set:GetText()])
	SetsPanel.Set:ClearFocus()
end

function SetsPanel.DeleteButton:OnClick()
	_CursorOptions.Sets[SetsPanel.Set:GetText()] = nil
	SetsPanel.Set:SetText("")
	SetsPanel.Set:ClearFocus()
end

--[[****************************************************************************
  * Function: _Cursor.Options.CursorsPanel.GetTab                              *
  * Description: Gets an unused tab frame.                                     *
  ****************************************************************************]]
do
	local TabID = 0 -- Only used to create unique names

	function CursorsPanel.GetTab()
		local Tab = next(TabsUnused)

		if not Tab then
			TabID = TabID + 1
			Tab = CreateFrame("Button", "_CursorOptionsTab" .. TabID, CursorsPanel, "OptionsFrameTabButtonTemplate")
			Tab:Hide()
			Tab:SetScript("OnClick", CursorsPanel.SetTab)
			PanelTemplates_DeselectTab(Tab)
		end

		TabsUnused[Tab] = true
		return Tab
	end
end

--[[****************************************************************************
  * Function: _Cursor.Options.CursorsPanel:TabEnable                           *
  * Description: Ties a tab to a settings table.                               *
  ****************************************************************************]]
function CursorsPanel:TabEnable(Cursor)
	if TabsUsed[self] then
		CursorsPanel.TabDisable(self)
	end

	TabsUnused[self] = nil
	TabsUsed[self] = Cursor

	self:SetText(Cursor.Name)
	self:Show()
end

--[[****************************************************************************
  * Function: _Cursor.Options.CursorsPanel:TabDisable                          *
  * Description: Frees up a tab.                                               *
  ****************************************************************************]]
function CursorsPanel:TabDisable()
	if TabsUsed[self] then
		TabsUsed[self] = nil
		TabsUnused[self] = true

		self:Hide()
	end
end

--[[****************************************************************************
  * Function: _Cursor.Options.CursorsPanel:SetTab                              *
  * Description: Highlights the tab and fills in the data.                     *
  ****************************************************************************]]
do
	local Enabled = CursorsPanel.Enabled
	local Preview = CursorsPanel.Preview

	function CursorsPanel:SetTab()
		if CursorsPanel.Selected then
			PanelTemplates_DeselectTab(CursorsPanel.Selected)
		end
		CursorsPanel.Selected = self

		if self then
			PanelTemplates_SelectTab(self)
			local Cursor = TabsUsed[self]

			CursorsPanel[Cursor.Enabled and "EnableControls" or "DisableControls"]()

			BlizzardOptionsPanel_CheckButton_Enable(Enabled)
			Enabled:SetChecked(Cursor.Enabled)

			CursorsPanel.UpdatePreset(Cursor)
			CursorsPanel.X:SetValue(Cursor.X or 0)
			CursorsPanel.Y:SetValue(Cursor.Y and -Cursor.Y or 0) -- Backwards
			CursorsPanel.Scale:SetValue(Cursor.Scale or 1.0)
			CursorsPanel.Facing:SetValue(Cursor.Facing or 0)

			Preview.Cursor:Show()
			Preview:SetScript("OnUpdate", Preview.OnUpdate)
			Preview.Update()
		else -- Clear and disable everything
			CursorsPanel.DisableControls()
			CursorsPanel.UpdatePreset(nil)

			BlizzardOptionsPanel_CheckButton_Disable(Enabled)
			Enabled:SetChecked(false)

			Preview.Cursor:Hide()
			Preview:SetScript("OnUpdate", nil)
			Preview.Model:ClearModel()
		end
	end
end

--[[****************************************************************************
  * Function: _Cursor.Options.CursorsPanel.EnableControls                      *
  * Description: Enables the model controls, and caches preset data.           *
  ****************************************************************************]]
do
	local function EnableSlider(self)
		BlizzardOptionsPanel_Slider_Enable(self)
		self:EnableMouse(true)
	end

	function CursorsPanel.EnableControls()
		CursorsPanel.Preview:EnableMouse(true)
		CursorsPanel.Preview.Backdrop:SetDesaturated(false)
		EnableSlider(CursorsPanel.X)
		EnableSlider(CursorsPanel.Y)
		EnableSlider(CursorsPanel.Scale)
		EnableSlider(CursorsPanel.Facing)
	end
end

--[[****************************************************************************
  * Function: _Cursor.Options.CursorsPanel.DisableControls                     *
  * Description: Disables the model controls.                                  *
  ****************************************************************************]]
do
	local function DisableSlider(self)
		BlizzardOptionsPanel_Slider_Disable(self)
		self:EnableMouse(false)
	end

	function CursorsPanel.DisableControls()
		CursorsPanel.Preview:EnableMouse(false)
		CursorsPanel.Preview.Backdrop:SetDesaturated(true)
		DisableSlider(CursorsPanel.X)
		DisableSlider(CursorsPanel.Y)
		DisableSlider(CursorsPanel.Scale)
		DisableSlider(CursorsPanel.Facing)
	end
end

--[[****************************************************************************
  * Function: _Cursor.Options.CursorsPanel.UpdatePreset                        *
  * Description: Manages the preset type, value, and path controls.            *
  ****************************************************************************]]
do
	local Type = CursorsPanel.Type
	local Value = CursorsPanel.Value
	local Path = CursorsPanel.Path

	local function EnablePath()
		Path:EnableMouse(true)

		local Color = _G.HIGHLIGHT_FONT_COLOR
		Path:SetTextColor(Color.r, Color.g, Color.b)
		Color = _G.NORMAL_FONT_COLOR
		Path.Text:SetTextColor(Color.r, Color.g, Color.b)
	end

	local function DisablePath()
		Path:EnableMouse(false)
		Path:ClearFocus()

		local Color = _G.GRAY_FONT_COLOR
		Path:SetTextColor(Color.r, Color.g, Color.b)
		Path.Text:SetTextColor(Color.r, Color.g, Color.b)
	end

	local function EnableDropDown(self)
		self:EnableMouse(true)
		UIDropDownMenu_EnableDropDown(self)
		local Color = _G.NORMAL_FONT_COLOR
		self.Text:SetTextColor(Color.r, Color.g, Color.b)
	end

	local function DisableDropDown(self)
		self:EnableMouse(false)
		UIDropDownMenu_DisableDropDown(self)
		local Color = _G.GRAY_FONT_COLOR
		self.Text:SetTextColor(Color.r, Color.g, Color.b)
	end

	function CursorsPanel.UpdatePreset(Cursor)
		CloseDropDownMenus() -- Close dropdown if open

		-- Sync controls
		if Cursor then
			UIDropDownMenu_SetText(Type, Cursor.Type == "" and L.TYPE_CUSTOM or L.TYPES[Cursor.Type])

			if #Cursor.Type == 0 then -- Custom
				UIDropDownMenu_SetText(Value, "")
				Path:SetText(Cursor.Value)
			else
				UIDropDownMenu_SetText(Value, L.VALUES[Cursor.Value])

				Preset.Path, Preset.Scale, Preset.Facing, Preset.X, Preset.Y = ("|"):split(_Cursor.Presets[Cursor.Type][Cursor.Value])
				Preset.Scale = tonumber(Preset.Scale) or 1.0
				Preset.Facing = tonumber(Preset.Facing) or 0
				Preset.X = tonumber(Preset.X) or 0
				Preset.Y = tonumber(Preset.Y) or 0
				Path:SetText(Preset.Path)
			end

			CursorsPanel.Preview.Update()
		else
			UIDropDownMenu_SetText(Type, "")
			UIDropDownMenu_SetText(Value, "")
			Path:SetText("")
		end

		-- Disable/enable controls
		if Cursor and Cursor.Enabled then
			EnableDropDown(Type)

			if #Cursor.Type == 0 then -- Custom
				EnablePath()
				DisableDropDown(Value)
			else
				DisablePath()
				EnableDropDown(Value)
			end
		else
			DisableDropDown(Type)
			DisableDropDown(Value)
			DisablePath()
		end
	end
end

--[[****************************************************************************
  * Function: _Cursor.Options:ControlOnEnter                                   *
  * Description: Shows the control's tooltip.                                  *
  ****************************************************************************]]
function NS:ControlOnEnter()
	GameTooltip:ClearAllPoints()
	GameTooltip:SetPoint("TOPLEFT", self, "BOTTOMLEFT")
	GameTooltip:SetOwner(self, "ANCHOR_PRESERVE")
	GameTooltip:SetText(self.tooltipText, nil, nil, nil, nil, 1)
end

--[[****************************************************************************
  * Function: _Cursor.Options.CursorsPanel.Enabled.OnClick                     *
  * Description: Toggles whether the model is enabled or not.                  *
  ****************************************************************************]]
function CursorsPanel.Enabled:OnClick()
	local Checked = not not self:GetChecked()
	local Cursor = TabsUsed[CursorsPanel.Selected]

	Cursor.Enabled = Checked
	CursorsPanel[Checked and "EnableControls" or "DisableControls"]()
	CursorsPanel.UpdatePreset(Cursor)

	PlaySound(Checked and "igMainMenuOptionCheckBoxOn" or "igMainMenuOptionCheckBoxOff")
end

--[[****************************************************************************
  * Function: _Cursor.Options.CursorsPanel.Preview.OnMouseUp                   *
  * Description: Cycles animation speeds for the model preview.                *
  ****************************************************************************]]
function CursorsPanel.Preview:OnMouseUp()
	self.Rate = (self.Rate + math.pi) % (math.pi * 3)
	PlaySound("igMainMenuOption")
end

--[[****************************************************************************
  * Function: _Cursor.Options.CursorsPanel.Preview.OnUpdate                    *
  * Description: Animates the preview model and maintains its scale.           *
  ****************************************************************************]]
do
	local Hypotenuse = (GetScreenWidth() ^ 2 + GetScreenHeight() ^ 2) ^ 0.5 * UIParent:GetEffectiveScale()
	local Step = 0
	local Model, Dimension, MaxPosition, X, Y
	local Cursor, Scale, Facing, Path, CurrentModel

	function CursorsPanel.Preview:OnUpdate(Elapsed)
		Model = self.Model

		if self.ShouldUpdate then
			self.ShouldUpdate = false

			Cursor = TabsUsed[CursorsPanel.Selected]
			Model.X = Cursor.X or 0
			Model.Y = Cursor.Y or 0
			Scale = (Cursor.Scale or 1.0) * _Cursor.ScaleDefault
			Facing = Cursor.Facing or 0

			if #Cursor.Type == 0 then -- Custom
				Path = Cursor.Value
			else
				Path = Preset.Path
				Model.X = Model.X + Preset.X
				Model.Y = Model.Y + Preset.Y
				Scale = Scale * Preset.Scale
				Facing = Facing + Preset.Facing
			end

			CurrentModel = Model:GetModel()

			if type(CurrentModel) ~= "string" or Path:lower() ~= CurrentModel:sub(1, -4):lower() then -- Compare without *.m2 extension
				Model:SetModel(Path .. ".mdx")
			end
			Model:SetModelScale(Scale)
			Model:SetFacing(Facing)
		end

		Step = Step + Elapsed * self.Rate
		Model:SetScale(1 / self:GetEffectiveScale())

		Dimension = Model:GetRight() - Model:GetLeft()
		MaxPosition = Dimension / Hypotenuse

		X = 0.1 + 0.6 * (math.cos(Step / 2) + 1) / 2
		Y = 0.3 + 0.6 * (math.sin(Step) + 1) / 2

		Model:SetPosition((X + Model.X / Dimension) * MaxPosition, (Y + Model.Y / Dimension) * MaxPosition, 0)
		self.Cursor:SetPoint("TOPLEFT", Model, "BOTTOMLEFT", Dimension * X, Dimension * Y)
	end
end

--[[****************************************************************************
  * Function: _Cursor.Options.CursorsPanel.Preview.Update                      *
  * Description: Requests a refresh of the model preview window.               *
  ****************************************************************************]]
function CursorsPanel.Preview.Update()
	CursorsPanel.Preview.ShouldUpdate = true
end

function CursorsPanel.X:OnValueChanged(Value)
	TabsUsed[CursorsPanel.Selected].X = math.abs(Value) - 0.5 > 0 and Value or nil
	CursorsPanel.Preview.Update()
end

function CursorsPanel.Y:OnValueChanged(Value)
	TabsUsed[CursorsPanel.Selected].Y = math.abs(Value) - 0.5 > 0 and -Value or nil
	CursorsPanel.Preview.Update()
end

function CursorsPanel.Scale:OnValueChanged(Value)
	TabsUsed[CursorsPanel.Selected].Scale = math.abs(Value - 1.0) - 0.1 > 0 and Value or nil
	CursorsPanel.Preview.Update()
end

function CursorsPanel.Facing:OnValueChanged(Value)
	TabsUsed[CursorsPanel.Selected].Facing = math.abs(Value % (math.pi * 2)) - 0.1 > 0 and Value or nil
	CursorsPanel.Preview.Update()
end

--[[****************************************************************************
  * Function: _Cursor.Options.CursorsPanel.Type:initialize                     *
  * Description: Builds the type dropdown menu.                                *
  ****************************************************************************]]
do
	local Sorted = {}
	local function SortFunc(Name1, Name2)
		return L.TYPES[Name1] < L.TYPES[Name2]
	end

	function CursorsPanel.Type:initialize()
		local Selected = TabsUsed[CursorsPanel.Selected].Type

		for Name in pairs(_Cursor.Presets) do
			Sorted[#Sorted + 1] = Name
		end
		table.sort(Sorted, SortFunc)

		local Info = UIDropDownMenu_CreateInfo()
		for _, Name in ipairs(Sorted) do
			Info.text = L.TYPES[Name]
			Info.arg1 = Name
			Info.func = self.OnSelect
			Info.checked = Name == Selected
			UIDropDownMenu_AddButton(Info)
		end

		-- Spacer
		Info = UIDropDownMenu_CreateInfo()
		Info.disabled = true
		Info.notCheckable = true

		UIDropDownMenu_AddButton(Info)

		-- Custom
		Info.disabled = nil
		Info.notCheckable = nil
		Info.text = L.TYPE_CUSTOM
		Info.arg1 = ""
		Info.func = self.OnSelect
		Info.checked = #Selected == 0

		UIDropDownMenu_AddButton(Info)

		table.wipe(Sorted)
	end
end

function CursorsPanel.Type:OnSelect(Type)
	local Cursor = TabsUsed[CursorsPanel.Selected]

	if Type ~= Cursor.Type then
		Cursor.Type = Type

		if #Type == 0 then -- Custom
			Cursor.Value = Preset.Path -- Use last preset
		else -- Select first value
			Cursor.Value = nil

			for Value in pairs(_Cursor.Presets[Cursor.Type]) do
				if not Cursor.Value or Value < Cursor.Value then
					Cursor.Value = Value
				end
			end
		end

		CursorsPanel.UpdatePreset(Cursor)
	end
end

--[[****************************************************************************
  * Function: _Cursor.Options.CursorsPanel.Value:initialize                    *
  * Description: Builds the value dropdown menu.                               *
  ****************************************************************************]]
do
	local Sorted = {}

	local function SortFunc(Name1, Name2)
		return L.VALUES[Name1] < L.VALUES[Name2]
	end

	function CursorsPanel.Value:initialize()
		local Cursor = TabsUsed[CursorsPanel.Selected]
		local Selected = Cursor.Value
		local Values = _Cursor.Presets[Cursor.Type]

		for Name in pairs(Values) do
			Sorted[#Sorted + 1] = Name
		end
		table.sort(Sorted, SortFunc)

		local Info = UIDropDownMenu_CreateInfo()

		for _, Name in ipairs(Sorted) do
			Info.text = L.VALUES[Name]
			Info.arg1 = Name
			Info.func = self.OnSelect
			Info.checked = Name == Selected

			UIDropDownMenu_AddButton(Info)
		end

		table.wipe(Sorted)
	end
end

function CursorsPanel.Value:OnSelect(Value)
	local Cursor = TabsUsed[CursorsPanel.Selected]

	if Value ~= Cursor.Value then
		Cursor.Value = Value
		CursorsPanel.UpdatePreset(Cursor)
	end
end

--[[****************************************************************************
  * Function: _Cursor.Options.CursorsPanel.Path:OnEnterPressed                 *
  * Description: Saves custom path value.                                      *
  ****************************************************************************]]
function CursorsPanel.Path:OnEnterPressed()
	local Cursor = TabsUsed[CursorsPanel.Selected]

	-- Remove pipes (they'd break the packed data format), and normalize slashes
	local Value = self:GetText():gsub("|", ""):gsub("[/\\]+", "\\")
	local Extension = Value:match("%.[^.]+$")

	if Extension then
		Extension = Extension:upper()

		if Extension == ".M2" or Extension == ".MDX" then
			Value = Value:sub(1, -#Extension - 1) -- Remove extension
			self:SetText(Value)
		end
	end

	Cursor.Value = Value
	self:ClearFocus()
	CursorsPanel.UpdatePreset(Cursor)
end

--[[****************************************************************************
  * Function: _Cursor.Options.CursorsPanel.Path:OnEscapePressed                *
  * Description: Cancels custom path value.                                    *
  ****************************************************************************]]
function CursorsPanel.Path:OnEscapePressed()
	self:SetText(TabsUsed[CursorsPanel.Selected].Value)
	self:ClearFocus()
end

--[[****************************************************************************
  * Function: _Cursor.Options.ResetAll                                         *
  * Description: Reloads cursor settings and all sets.                         *
  ****************************************************************************]]
function NS.ResetAll()
	_CursorOptions.Sets = CopyTable(_Cursor.DefaultSets)
	NS.ResetCharacter()
end

--[[****************************************************************************
  * Function: _Cursor.Options.ResetCharacter                                   *
  * Description: Reloads cursor settings.                                      *
  ****************************************************************************]]
function NS.ResetCharacter()
	_Cursor.LoadSet(_Cursor.DefaultSets[_Cursor.DefaultModelSet])
end

--[[****************************************************************************
  * Function: _Cursor.Options:default                                          *
  * Description: Prompts the user to reset settings to default.                *
  ****************************************************************************]]
function NS:default()
	StaticPopup_Show("_CURSOR_RESET_CONFIRM")
end

--[[****************************************************************************
  * Function: _Cursor.Options:OnHide                                           *
  * Description: Updates the actual cursor models when settings are closed.    *
  ****************************************************************************]]
function NS:OnHide()
	_Cursor:UpdateModels()
end

--[[****************************************************************************
  * Function: _Cursor.Options.OnApply                                          *
  * Description: Updates the actual cursor models when Apply is pressed.       *
  ****************************************************************************]]
function NS.OnApply()
	_Cursor:UpdateModels()
end

--[[****************************************************************************
  * Function: _Cursor.Options.Update                                           *
  * Description: Full update that syncronizes tabs to actual saved settings.   *
  ****************************************************************************]]
function NS.Update()
	for Tab in pairs(TabsUsed) do
		CursorsPanel.TabDisable(Tab)
	end

	local LastTab

	for _, Cursor in ipairs(_CursorOptionsCharacter.Cursors) do
		local Tab = CursorsPanel.GetTab(Cursor)

		CursorsPanel.TabEnable(Tab, Cursor)

		if LastTab then
			Tab:SetPoint("BOTTOMLEFT", LastTab, "BOTTOMRIGHT", -16, 0)
		else
			Tab:SetPoint("BOTTOMLEFT", CursorsPanel, "TOPLEFT", 6, -2)
			CursorsPanel.SetTab(Tab)
		end

		LastTab = Tab
	end

	if not LastTab then -- Has no models
		CursorsPanel.SetTab(nil)
	end
end

--[[****************************************************************************
  * Function: _Cursor.Options.SlashCommand                                     *
  * Description: Slash command chat handler to open the options pane.          *
  ****************************************************************************]]
function NS.SlashCommand()
	InterfaceOptionsFrame_OpenToCategory(NS)
end

NS.name = L.OPTIONS_TITLE
NS:Hide()
NS:SetScript("OnHide", NS.OnHide)

InterfaceOptions_AddCategory(NS)

-- Pane title
NS.Title = NS:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
NS.Title:SetPoint("TOPLEFT", 16, -16)
NS.Title:SetText(L.OPTIONS_TITLE)

local SubText = NS:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
SubText:SetPoint("TOPLEFT", NS.Title, "BOTTOMLEFT", 0, -8)
SubText:SetPoint("RIGHT", -32, 0)
SubText:SetHeight(32)
SubText:SetJustifyH("LEFT")
SubText:SetJustifyV("TOP")
SubText:SetText(L.OPTIONS_DESC)

NS.SubText = SubText

-- Sets pane
_G[SetsPanel:GetName() .. "Title"]:SetText(L.OPTIONS.SETS)
SetsPanel:SetPoint("TOPLEFT", SubText, "BOTTOMLEFT", -2, -16)
SetsPanel:SetPoint("RIGHT", -14, 0)
SetsPanel:SetHeight(64)

-- Set editbox
local Set = SetsPanel.Set
Set:SetPoint("TOPLEFT", 16, -10)
Set:SetPoint("RIGHT", -16, 0)
Set:SetHeight(20)
Set.SetHeight = function() end
Set:SetAutoFocus(false)
Set:SetScript("OnEnterPressed", Set.OnEnterPressed)
Set:SetScript("OnTextChanged", Set.OnTextChanged)
Set:SetScript("OnEnter", NS.ControlOnEnter)
Set:SetScript("OnLeave", _G.GameTooltip_Hide)
Set.point = "TOPRIGHT"
Set.relativePoint = "BOTTOMRIGHT"
Set.tooltipText = L.OPTIONS["SET_DESC"]

local SetButton = Set.Button
SetButton:SetPoint("RIGHT", Set, 3, 1)
SetButton:SetSize(24, 24)
SetButton:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up")
SetButton:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Down")
SetButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
SetButton:SetScript("OnClick", SetButton.OnClick)
SetButton:SetScript("OnHide", SetButton.OnHide)

local SaveButton = SetsPanel.SaveButton
SaveButton:SetPoint("BOTTOMLEFT", 8, 10)
SaveButton:SetSize(74, 22)
SaveButton:SetText(L.OPTIONS.SAVE)
SaveButton:SetScript("OnClick", SaveButton.OnClick)

local LoadButton = SetsPanel.LoadButton
LoadButton:SetPoint("LEFT", SaveButton, "RIGHT", 4, 0)
LoadButton:SetSize(74, 22)
LoadButton:SetText(L.OPTIONS.LOAD)
LoadButton:SetScript("OnClick", LoadButton.OnClick)

local DeleteButton = SetsPanel.DeleteButton
DeleteButton:SetPoint("BOTTOMRIGHT", -8, 10)
DeleteButton:SetSize(74, 22)
DeleteButton:SetText(L.OPTIONS.DELETE)
DeleteButton:SetScript("OnClick", DeleteButton.OnClick)
DeleteButton:SetScript("OnEnter", NS.ControlOnEnter)
DeleteButton:SetScript("OnLeave", _G.GameTooltip_Hide)
DeleteButton.tooltipText = L.OPTIONS.DELETE_DESC

-- Cursors tabbed pane
CursorsPanel:SetPoint("TOPLEFT", SetsPanel, "BOTTOMLEFT", 0, -64)
CursorsPanel:SetPoint("BOTTOMRIGHT", -14, 16)

local Text = _G[CursorsPanel:GetName() .. "Title"]
Text:SetText(L.OPTIONS.CURSORS)
Text:SetPoint("BOTTOMLEFT", CursorsPanel, "TOPLEFT", 9, 20)

-- Apply button
local ApplyButton = CursorsPanel.ApplyButton
ApplyButton:SetScript("OnClick", NS.OnApply)
ApplyButton:SetPoint("BOTTOMRIGHT", CursorsPanel, "TOPRIGHT", 0, 2)
ApplyButton:SetSize(64, 16)
ApplyButton:SetText(L.OPTIONS.APPLY)

-- Enable button
local Enabled = CursorsPanel.Enabled
Enabled:SetPoint("TOPLEFT", 16, -8)
Enabled:SetScale(0.75)
Enabled:SetScript("OnClick", Enabled.OnClick)
Enabled.tooltipText = L.OPTIONS.ENABLED_DESC
_G[Enabled:GetName() .. "Text"]:SetText(L.OPTIONS.ENABLED)

-- Preview window
local Preview = CursorsPanel.Preview
Preview:SetPoint("TOPRIGHT", -16, -8)
Preview:SetSize(96, 96)
Preview:SetBackdrop({
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	edgeSize = 16
})

Preview:SetScript("OnMouseUp", Preview.OnMouseUp)
Preview:SetScript("OnEnter", NS.ControlOnEnter)
Preview:SetScript("OnLeave", _G.GameTooltip_Hide)
Preview.Rate = math.pi
Preview.tooltipText = L.OPTIONS.PREVIEW_DESC

local Backdrop = Preview:CreateTexture(nil, "BACKGROUND")
Preview.Backdrop = Backdrop
Backdrop:SetPoint("TOPRIGHT", -4, -4)
Backdrop:SetPoint("BOTTOMLEFT", 4, 4)
Backdrop:SetTexture("textures\\ShaneCube.blp")
Backdrop:SetGradient("VERTICAL", 0.5, 0.5, 0.5, 0.25, 0.25, 0.25)

Preview.Model = CreateFrame("Model", nil, Preview)
Preview.Model:SetAllPoints(Backdrop)
Preview.Model:SetLight(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1) -- Allows trails like warriors' intervene to work

local Cursor = Preview.Model:CreateTexture(nil, "OVERLAY")
Preview.Cursor = Cursor
Cursor:SetSize(24, 24)
Cursor:SetTexture("Interface\\Cursor\\Point.blp")
Cursor:SetVertexColor(0.4, 0.4, 0.4)

-- X-axis slider
local X = CursorsPanel.X
X:SetPoint("LEFT", Preview, "BOTTOMLEFT")
X:SetPoint("RIGHT", Preview)
X:SetHeight(14)
X:SetScale(0.8)
X:SetMinMaxValues(-32, 32)
X:SetScript("OnValueChanged", X.OnValueChanged)
X:SetScript("OnEnter", NS.ControlOnEnter)
X:SetScript("OnLeave", _G.GameTooltip_Hide)
X.tooltipText = L.OPTIONS["X_DESC"]

Text = _G[X:GetName() .. "Low"]
Text:SetText(-32)
Text:ClearAllPoints()
Text:SetPoint("LEFT")
Text = _G[X:GetName() .. "High"]
Text:SetText(32)
Text:ClearAllPoints()
Text:SetPoint("RIGHT")

-- Y-axis slider
local Y = CursorsPanel.Y
Y:SetOrientation("VERTICAL")
Y:SetPoint("TOP", Preview, "TOPLEFT")
Y:SetPoint("BOTTOM", Preview)
Y:SetWidth(10)
Y:SetScale(0.8)
Y:SetThumbTexture("Interface\\Buttons\\UI-SliderBar-Button-Vertical")
Y:SetMinMaxValues(-32, 32)
Y:SetScript("OnValueChanged", Y.OnValueChanged)
Y:SetScript("OnEnter", NS.ControlOnEnter)
Y:SetScript("OnLeave", _G.GameTooltip_Hide)
Y.tooltipText = L.OPTIONS["Y_DESC"]

Text = _G[Y:GetName() .. "Low"]
Text:SetText(-32)
Text:ClearAllPoints()
Text:SetPoint("BOTTOM", 0, 6)
Text = _G[Y:GetName() .. "High"]
Text:SetText(32)
Text:ClearAllPoints()
Text:SetPoint("TOP", 0, -2)

-- Scale slider
local Scale = CursorsPanel.Scale
Scale:SetPoint("LEFT", Y)
Scale:SetPoint("RIGHT", Preview)
Scale:SetPoint("TOP", X, "BOTTOM", 0, -8)
Scale:SetMinMaxValues(1 / 2, 4)
Scale:SetScript("OnValueChanged", Scale.OnValueChanged)
Scale:SetScript("OnEnter", NS.ControlOnEnter)
Scale:SetScript("OnLeave", _G.GameTooltip_Hide)
Scale.tooltipText = L.OPTIONS["SCALE_DESC"]

_G[Scale:GetName() .. "Low"]:SetText(0.5)
_G[Scale:GetName() .. "High"]:SetText(4)

Text = _G[Scale:GetName() .. "Text"]
Text:SetText(L.OPTIONS.SCALE)
Text:SetPoint("BOTTOM", Scale, "TOP", 0, -2)

-- Facing slider
local Facing = CursorsPanel.Facing
Facing:SetPoint("TOPLEFT", Scale, "BOTTOMLEFT", 0, -8)
Facing:SetPoint("RIGHT", Scale)
Facing:SetMinMaxValues(0, math.pi * 2)
Facing:SetScript("OnValueChanged", Facing.OnValueChanged)
Facing:SetScript("OnEnter", NS.ControlOnEnter)
Facing:SetScript("OnLeave", GameTooltip_Hide)
Facing.tooltipText = L.OPTIONS["FACING_DESC"]

_G[Facing:GetName() .. "Low"]:SetText(L.OPTIONS.FACING_LOW)
_G[Facing:GetName() .. "High"]:SetText(L.OPTIONS.FACING_HIGH)

Text = _G[Facing:GetName() .. "Text"]
Text:SetText(L.OPTIONS.FACING)
Text:SetPoint("BOTTOM", Facing, "TOP", 0, -2)

-- Type dropdown
local Type = CursorsPanel.Type
Type:SetPoint("LEFT", -6, 0)
Type:SetPoint("TOP", Enabled, "BOTTOM", 0, -12)
Type:SetPoint("RIGHT", Y, "LEFT", -8, 0)
Type:SetScript("OnEnter", NS.ControlOnEnter)
Type:SetScript("OnLeave", _G.GameTooltip_Hide)

UIDropDownMenu_JustifyText(Type, "LEFT")

_G[Type:GetName() .. "Middle"]:SetPoint("RIGHT", -16, 0)
Type.tooltipText = L.OPTIONS.TYPE_DESC
Text = Type:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
Type.Text = Text
Text:SetPoint("BOTTOMLEFT", Type, "TOPLEFT", 16, -2)
Text:SetText(L.OPTIONS.TYPE)

-- Value dropdown
local Value = CursorsPanel.Value
Value:SetPoint("LEFT", Type)
Value:SetPoint("RIGHT", Type)
Value:SetPoint("BOTTOM", Preview)
Value:SetScript("OnEnter", NS.ControlOnEnter)
Value:SetScript("OnLeave", _G.GameTooltip_Hide)

UIDropDownMenu_JustifyText(Value, "LEFT")

_G[Value:GetName() .. "Middle"]:SetPoint("RIGHT", -16, 0)
Value.tooltipText = L.OPTIONS.VALUE_DESC
Text = Value:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
Value.Text = Text
Text:SetPoint("BOTTOMLEFT", Value, "TOPLEFT", 16, -2)
Text:SetText(L.OPTIONS.VALUE)

-- Path editbox
local Path = CursorsPanel.Path
Path:SetPoint("BOTTOMLEFT", 16, 16)
Path:SetPoint("RIGHT", Value, -8, 0)
Path:SetHeight(20)
Path:SetAutoFocus(false)
Path:SetScript("OnEnterPressed", Path.OnEnterPressed)
Path:SetScript("OnEscapePressed", Path.OnEscapePressed)
Path:SetScript("OnEnter", NS.ControlOnEnter)
Path:SetScript("OnLeave", _G.GameTooltip_Hide)
Path.tooltipText = L.OPTIONS["PATH_DESC"]
Text = Path:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
Path.Text = Text
Text:SetPoint("BOTTOMLEFT", Path, "TOPLEFT", -6, 0)
Text:SetText(L.OPTIONS.PATH)

StaticPopupDialogs["_CURSOR_RESET_CONFIRM"] = {
	text = L.RESET_CONFIRM,
	button1 = L.RESET_ALL,
	button3 = L.RESET_CHARACTER,
	button2 = L.RESET_CANCEL,
	OnAccept = NS.ResetAll,
	OnAlt = NS.ResetCharacter,
	timeout = 0,
	exclusive = 1,
	hideOnEscape = 1,
	whileDead = 1,
}

SlashCmdList["_CURSOR_OPTIONS"] = NS.SlashCommand
