--[[
--LootAppraiser.lua

--Known Bugs:
--				
--]]

LootAppraiser = LibStub("AceAddon-3.0"):NewAddon("LootAppraiser", "AceConsole-3.0", "AceEvent-3.0")

-- Setting Default Global Vars --
	c1=0									-- loot counter
	newCurrentTotal=0						-- gold counter
	runningTotal = 0						-- gold counter
	OpenLootAppraiser = 0
	LootPromptAnswered = 0
	noteworthitems = 0
	grayCounter = 0
	isRunning = 0
	--CustomPrice = 0
	totalCurrencyLooted = 0
	priceSourceValue="DBGlobalMarketAvg"	-- Set default pricing source
	qualityFilterAbove=1 					-- show quality items of poor and above by default
	oldText=""								--text used for multi-edit box listing of looted items
	
-- Attaching TSMAPI --
local TSM = select(2, ...)
TSM = LibStub("AceAddon-3.0"):NewAddon(TSM, "TSM_LootAppraiser", "AceConsole-3.0")

function LootAppraiser:OnEnable()
    -- Called when the addon is enabled
	LootAppraiser:Print("LootAppraiser ENABLED.")
	isRunning = 0	-- var to hold if /la has been used
	isLiteRunning = 0	-- var to hold if /lal has been used
	isGoldAlertRunning = 0	-- var to hold if /laa alert has been used
	isThresholdRunning = 0	-- var to hold if Right UI window is used
	self:RegisterChatCommand("la", "Enable")
	self:RegisterChatCommand("lal", "EnableLite")
	self:RegisterChatCommand("laa","EnableGoldAlert")
	self:RegisterChatCommand("lah", "HelpText")
	self:RegisterChatCommand("lac", "ClearSession")
	self:RegisterEvent("LOOT_OPENED", HandleEvent)
	self:RegisterEvent("BAG_OPEN", HandleEvent)
	self:RegisterEvent("BAG_UPDATE_DELAYED", HandleEvent)
	--self:RegisterEvent("BAG_UPDATE_DELAYED", HandleEvent)
	--self:RegisterEvent("MAIL_INBOX_UPDATE", HandleEvent)
end
	
function LootAppraiser:OnDisable()
    -- Called when the addon is disabled
	LootAppraiser:Print("LootAppraiser DISABLED.")
end

-- Slash Commands --
function LootAppraiser:Enable()
  -- Process the slash command ('input' contains whatever follows the slash command)
	if isRunning == 1 then
		LootAppraiser:Print("LootAppraiser is already running!")
	else
		createUI()
	end
end

function LootAppraiser:EnableLite()
  -- Process the slash command ('input' contains whatever follows the slash command)
	if isLiteRunning == 1 then
		LootAppraiser:Print("LootAppraiser Lite is already running!")
	else
		createUILite()
	end
end

function LootAppraiser:HelpText()
	LootAppraiser:Print("LootAppraiser has the following commands:")
	LootAppraiser:Print("/la - loads main user interface.")
	LootAppraiser:Print("/laa - loads the Gold Alert Threshold monitor.")
	LootAppraiser:Print("/lah - loads the help text information available.")
	LootAppraiser:Print("/lal - loads Lite version which only tracks gold item value.")
	
end

function LootAppraiser:EnableGoldAlert()
	if isGoldAlertRunning == 1 then
		LootAppraiser:Print("LootAppraiser Gold Alert is already running!")
	else
		createGoldAlertUI()
	end
end
--[[
function createCustomPriceSourceUI()
	local AceGUI = LibStub("AceGUI-3.0")
	
	fps = AceGUI:Create("Frame")
	fps:SetCallback("OnClose",function(widget) AceGUI:Release(widget) isRunning=0 end)
	fps:SetPoint("TOP",0,-200)
	fps:SetTitle("Custom Price Source")
	fps:SetStatusText("")
	fps:SetLayout("List")
	fps:SetWidth(290)	
	fps:SetHeight(250)

		-- Custom Price Source Editbox --
	ebcps = AceGUI:Create("EditBox")
	ebcps:SetText("")
	ebcps:SetWidth(280)
	ebcps:SetCallback("OnEnterPressed",function(widget,event,value) ChangePriceSource(value) end)
	
	fps:AddChild(ebcps)
end
--]]


--[[  START OF GUI CONFIGURATION --]]
---------------------------------------------------------------------------------	
function createUI()
	isRunning=1	-- sets flag to state the app is already running
	Stopwatch_Toggle()
	local AceGUI = LibStub("AceGUI-3.0")
	
---------------------------------------------------------------------------------		
	-- Create main full GUI frame --
---------------------------------------------------------------------------------	
	f = AceGUI:Create("Frame")
	f:SetCallback("OnClose",function(widget) AceGUI:Release(widget) CloseAllUIs() isRunning=0 end)
	f:SetCallback("OnClick",function(widget,event,value) DockFrame() end)
	f:SetPoint("TOPLEFT",50,-50)
	f:SetTitle("LOOT APPRAISER v0.76 BETA RC2: MAKING FARMING SEXY!")
	f:SetStatusText("")
	f:SetLayout("Flow")
	f:SetWidth(420)	
	f:SetHeight(520)

	-- Create Filter Options for Rarity of Loot --
	sld	= AceGUI:Create("Slider")
	sld:SetLabel("FILTER: [1=POOR, 2=COMMON, 3=UNCOMMON, 4=RARE, 5=EPIC]")
	sld:SetValue(1)
	sld:SetSliderValues(1,5,1)
	sld:SetPoint("CENTER",20,0)
	sld:SetWidth(350)
	sld:SetCallback("OnValueChanged",function(widget,event,value) ChangeQualityFilter(value) end)

	-- Create Label for Currency --
	lb = AceGUI:Create("Label")
	lb:SetText("LOOTED ITEM VALUE: "..0)
	lb:SetWidth(350)
	lb:SetFont("Fonts\\FRIZQT__.TTF", 12)
	
	-- Create Label for Total Items Looted --
	til = AceGUI:Create("Label")
	til:SetText("ITEMS LOOTED: "..0)
	til:SetFont("Fonts\\FRIZQT__.TTF", 12)
	
	-- Create Label for Total Currency Looted --
	tcl = AceGUI:Create("Label")
	tcl:SetText("CURRENCY LOOTED: "..0)
	tcl:SetWidth(350)
	tcl:SetFont("Fonts\\FRIZQT__.TTF", 12)
	
	-- Create Bag Slot Counter Label --
	bsc = AceGUI:Create("Label")
	bsc:SetFont("Fonts\\FRIZQT__.TTF", 12)
	bsc:SetWidth(350)
	-- Calculate Bag Space available --
		local numSlotsCounter=0
		for i = 0, 4, 1 do	--start, end, step
			local FreeBagSlots = GetContainerNumFreeSlots(i)
			numSlotsCounter = numSlotsCounter+FreeBagSlots
		end
		
	bsc:SetText("BAG SPACE: ["..numSlotsCounter.."]")

	-- Create Noteworty items looted based upon gold alert threshold Counter Label --
	nilc = AceGUI:Create("Label")
	nilc:SetText("NOTEWORTHY: "..0)
	nilc:SetWidth(350)
	nilc:SetFont("Fonts\\FRIZQT__.TTF", 12)
	
	-- Create Clear Button --
	cb = AceGUI:Create("Button")
	cb:SetWidth(70)
	cb:SetText("CLEAR")
	cb:SetCallback("OnClick", function()
		ClearSession()
	end)
	
	-- Create Relayout Button --
	refreshlayoutbutton = AceGUI:Create("Button")
	refreshlayoutbutton:SetWidth(70)
	refreshlayoutbutton:SetText("LAYOUT")
	refreshlayoutbutton:SetCallback("OnClick", function() RefreshLayout() end)		
		
	-- Create Dock/Undock Button --
	dockbutton = AceGUI:Create("Button")
	dockbutton:SetWidth(70)
	dockbutton:SetPoint("RIGHT")
	--dockbutton:SetFont("DEFAULT",8)
	dockbutton:SetText("DOCK")
	dockbutton:SetCallback("OnClick",function(widget,event,value) DockFrame(value) end)	
	
	-- Create Vendor Grays Button --
	sellgraysbtn = AceGUI:Create("Button")
	sellgraysbtn:SetWidth(70)
	sellgraysbtn:SetText("GRAYS")
	sellgraysbtn:SetCallback("OnClick", function()
		VendorGrayItems()
	end)

	-- Create Destroy Grays Button --
	destroygraysbtn = AceGUI:Create("Button")
	destroygraysbtn:SetWidth(70)
	destroygraysbtn:SetText("TRASH")
	destroygraysbtn:SetCallback("OnClick", function()
		DestroyGrayItems()
	end)	
				
	-- Create ML Edit Box --
	tf = AceGUI:Create("MultiLineEditBox")
	tf:SetText("Session Started")
	tf:SetPoint("CENTER")
	tf:SetLabel("LOOT COLLECTED")
	tf:SetWidth(350)
	tf:SetNumLines(15)
	tf:SetMaxLetters(0)
	tf:SetPoint("TOPLEFT")
	tf:DisableButton(true)
	
	-- Create Dropdown --
	dd = AceGUI:Create("Dropdown")
    dd:SetText("AuctionDB: Global Market Value Avg")
    dd:SetLabel("PRICE SOURCE")
    dd:SetList({["DBGlobalHistorical"] = "AuctionDB: Global Historical Price",
				["DBGlobalMarketAvg"] = "AuctionDB: Global Market Value Avg",
				["DBGlobalMinBuyoutAvg"] = "AuctionDB: Global Min Buyout Avg",
				["DBGlobalSaleAvg"] = "AuctionDB: Global Sale Average",
				["DBHistorical"] = "AuctionDB: Historical Price",
				["DBMarket"] = "AuctionDB: Market Value",
				["DBMinBuyout"] = "AuctionDB: Min Buyout",
				--["TUJMarket"] = "TheUndermineJournal: Realm Value",
				["VendorSell"] = "VendorSell: Sell to Vendor cost",
				["wowuctionMarket"] = "wowuction: Realm Market Value",
				["wowuctionMedian"] = "wowuction: Realm Median Price",
				["wowuctionRegionMarket"] = "wowuction: Region Market Value",
				["wowuctionRegionMedian"] = "wowuction: Region Median Price"})
    dd:SetCallback("OnValueChanged",function(widget,event,value) ChangePriceSource(value) end)
	
	-- Create Editbox --
	eb = AceGUI:Create("EditBox")
	eb:SetText("300")
	eb:SetLabel("Gold Alert Threshold")
	eb:SetMaxLetters(6)
	eb:SetWidth(100)
	eb:SetCallback("OnEnterPressed",function(widget,event,value) ChangeGoldAlertThreshold(value) end)
	eb:SetCallback("OnLeave",function(widget,event,value) ChangeGoldAlertThresholdLeave(value) end)

	-- Adding widgets to container
	--This determines the order of placement within the frame
	f:AddChild(dd)	--price source drop down
	f:AddChild(dockbutton)	--Frame undock/dock button
	f:AddChild(refreshlayoutbutton)	--Refresh layout if resized
	f:AddChild(tf)	--text field
	f:AddChild(sld)	--quality slider
	f:AddChild(lb)	--label
	f:AddChild(tcl) --total currency looted
	f:AddChild(til)	--total items looted
	f:AddChild(bsc)	--total bag space left
	f:AddChild(nilc)	--Noteworthy items counter
	f:AddChild(cb)	--clear button
	f:AddChild(sellgraysbtn)	--Vendor gray button
	f:AddChild(destroygraysbtn)	--Destroy gray items button
	f:AddChild(eb)	--gold alert threshold edit box	

end

function DestroyGrayItems()
	grayCounter = 0
	for bag=0,4 do
		for slot=1, GetContainerNumSlots(bag) do
			local n=GetContainerItemLink(bag,slot)
			if n and strfind(n,"ff9d9d9d") then			--Poor = ff9d9d9d
				PickupContainerItem(bag,slot)
				DeleteCursorItem()
				grayCounter = grayCounter + 1
			end
		end
	end
	if grayCounter == 0 then
		LootAppraiser:Print("There are currently no gray items to trash.")
	end
	if grayCounter >=1 then
		LootAppraiser:Print("Destroyed "..grayCounter.." gray item(s).")
	end
end


function CloseAllUIs()
	LootAppraiser:Print("Closing LootAppraiser UIs")

	if isLiteRunning == 1 then
		fc:Release()
		isLiteRunning=0
	end
	
	if isGoldAlertRunning == 1 then
		falert:Release()
		isGoldAlertRunning=0
	end
	
	isRunning=0
	OpenLootAppraiser=0
	LootPromptAnswered=0
	isLootPromptUIRunning=0
	newCurrentTotal=0
	runningTotal=0
	noteworthitems=0
	c1=0
	
	Stopwatch_Pause()
	Stopwatch_Clear()
	Stopwatch_Toggle()
	
end

function RefreshLayout()
	LootAppraiser:Print("Refreshing layout.")
	f:DoLayout()
	f:SetWidth(420)		--Reset width if adjusted
	f:SetHeight(520)	--Reset height if adjusted
	f:SetPoint("TOPLEFT",50,-50)	--Reset location

end
function DockFrame()
	f:DoLayout()
	f:SetWidth(420)		--Reset width if adjusted
	f:SetHeight(520)	--Reset height if adjusted
	f:SetPoint("TOPLEFT",50,-50)	--Reset location
	f:SetPoint("TOPLEFT",-1500,-50)	--moves Main UI off screen at -500 x coord
	DockFrameBar()
end

function RepositionCreateUI()
	dockframebar:Release()
	f:SetPoint("TOPLEFT",50,-50)	--resets positioning of Main UI
	isDockFrameBarRunning = 0
end

function createUILite()
	local AceGUI = LibStub("AceGUI-3.0")
	isLiteRunning=1	-- sets flag to state the app is already running
---------------------------------------------------------------------------------	
	-- Currency smaller total asset value looted frame only --
---------------------------------------------------------------------------------		
	fc = AceGUI:Create("Frame")
	fc:SetLayout("List")
	fc:SetCallback("OnClose",function(widget) AceGUI:Release(widget) isLiteRunning=0 end)
	fc:SetPoint("TOP",0,-50)
	fc:SetTitle("0")
	fc:SetWidth(150)
	fc:SetHeight(15)

end
---------------------------------------------------------------------------------	

function DockFrameBar()
	local AceGUI = LibStub("AceGUI-3.0")
	isDockFrameBarRunning=1	-- sets flag to state the bar is already running
	LootAppraiser:Print("LootAppraiser docked. Press the CLOSE Button in the upper left corner to open UI again.")
	dockframebar = AceGUI:Create("Frame")
	dockframebar:SetLayout("Flow")
	dockframebar:SetTitle("Dock/Undock")
	dockframebar:SetPoint("TOPLEFT",25,-20)
	dockframebar:SetWidth(100)
	dockframebar:SetHeight(20)
	dockframebar:SetCallback("OnClose",function(widget) RepositionCreateUI() isDockFrameBarRunning=0  end)
end

function LootPromptUI()
	local AceGUI = LibStub("AceGUI-3.0")
	isLootPromptUIRunning=1	-- sets flag to state the bar is already running
	lootpromptframe = AceGUI:Create("Frame")
	lootpromptframe:SetLayout("Flow")
	lootpromptframe:SetTitle("Would you like to open LootAppraiser?")
	lootpromptframe:SetPoint("CENTER")
	lootpromptframe:SetWidth(200)
	lootpromptframe:SetHeight(115)
	lootpromptframe:SetCallback("OnClose",function(widget) AceGUI:Release(widget) isLootPromptUIRunning=0 LootPromptAnswered=0 end)
	
	-- Yes Button --
	yesLootPromptButton = AceGUI:Create("Button")
	yesLootPromptButton:SetWidth(50)
	yesLootPromptButton:SetPoint("CENTER")
	yesLootPromptButton:SetText("Yes")
	yesLootPromptButton:SetCallback("OnClick", function()
		LootPromptYes()
	end)
	
	-- No Button --
	noLootPromptButton = AceGUI:Create("Button")
	noLootPromptButton:SetWidth(50)
	noLootPromptButton:SetPoint("CENTER")
	noLootPromptButton:SetText("No")
	noLootPromptButton:SetCallback("OnClick", function()
		LootPromptNo()
	end)
	
	lootpromptframe:AddChild(yesLootPromptButton)
	lootpromptframe:AddChild(noLootPromptButton)	
end

function LootPromptYes()
	OpenLootAppraiser = 1
	LootPromptAnswered = 1
	lootpromptframe:Release()
	if isRunning == 1 then
		LootAppraiser:Print("LootAppraiser is already running!")
	else
		createUI()
		createGoldAlertUI()
		createUILite()
	end
end

function LootPromptNo()
	LootAppraiser:Print("Disabling LootAppraiser.")
	OpenLootAppraiser = 0
	LootPromptAnswered = 1
	lootpromptframe:Release()
end

function createGoldAlertUI()
	local AceGUI = LibStub("AceGUI-3.0")
	isGoldAlertRunning=1	-- sets flag to state the app is already running
	
	falert = AceGUI:Create("Frame")
	falert:SetLayout("List")
	falert:SetCallback("OnClose",function(widget) AceGUI:Release(widget) isGoldAlertRunning=0 end)
	falert:SetPoint("TOP",4,-68)
	--falert:SetTitle("Gold Alert Threshold")
	falert:SetWidth(400)
	falert:SetHeight(20)
	falert:SetTitle("Gold Alert Threshold")	
	
end

-- New UI for multi-alert drop listings
function createThresholdUI()

	isThresholdRunning = 1
	
	local AceGUI = LibStub("AceGUI-3.0")
	
	thresholdFrame = AceGUI:Create("Frame")
	thresholdFrame:SetCallback("OnClose",function(widget) AceGUI:Release(widget) isThresholdRunning=0 end)
	thresholdFrame:SetPoint("CENTER",50,260)
	thresholdFrame:SetTitle("LOOTAPPRAISER - MAKING FARMING SEXY!")
	thresholdFrame:SetStatusText("")
	thresholdFrame:SetLayout("Fill")
	thresholdFrame:SetWidth(500)	
	thresholdFrame:SetHeight(350)
	
			-- Create ML Edit Box --
	gaeditbox = AceGUI:Create("MultiLineEditBox")
	gaeditbox:SetText("Thank you for downloading and installing LootAppraiser!\n\nUsage:  Left-Click on the mini-map icon to load the Main user interface.  If you want to load them manually type: /lah for help details.\n\nFAQ:\nWhy is pricing reporting incorrectly or only reporting vendor pricing?\nLootAppraiser leverages pricing through TradeSkillMaster's API. Ensure you have ALL the TradeSkillMaster modules installed by going to TradeSkillMaster.com.  This includes installing the TSM Desktop Application which will keep your pricing current. LootAppraiser does nothing with pricing algoritms and only reports pricing that it is aware of so if your pricing is incorrect, check your addon configurations for pricing.\n\nDoes LootAppraiser work with Auctioneer or Auctionator?\nNo. LootAppraiser specifically leverages TSM API functions for pricing.\n\nWhat do I do if I have a suggestion or want to report a bug?\nAny bug, defect, or enhancement requests can be sent directly to: WowProfitz@gmail.com\n\nWhen do you stream?\nI currently stream at Twitch.tv/ProfitzTV Monday-Friday's from 5PM-10PM EST/US.\n\nHappy gaming and Happy earning!")
	gaeditbox:SetPoint("CENTER")
	gaeditbox:SetLabel("HELP INFORMATION")
	gaeditbox:SetWidth(350)
	gaeditbox:SetNumLines(15)
	gaeditbox:SetMaxLetters(0)
	gaeditbox:SetPoint("TOPLEFT")
	gaeditbox:DisableButton(true)	
	
	thresholdFrame:AddChild(gaeditbox)

end

---------------------------------------------------------------------------------	
--[[  END OF GUI CONFIGURATION --]]


--[[ MINI-MAP CONTROLS ]]--
function LootAppraiser_MinimapButton_Reposition()
	LootAppraiser_MinimapButton:SetPoint("TOPLEFT","Minimap","TOPLEFT",52-(80*cos(LootAppraiserDB.MinimapPos)),(80*sin(LootAppraiserDB.MinimapPos))-52)
end

-- Only while the button is dragged this is called every frame
function LootAppraiser_MinimapButton_DraggingFrame_OnUpdate()

	local xpos,ypos = GetCursorPosition()
	local xmin,ymin = Minimap:GetLeft(), Minimap:GetBottom()

	xpos = xmin-xpos/UIParent:GetScale()+70 -- get coordinates as differences from the center of the minimap
	ypos = ypos/UIParent:GetScale()-ymin-70

	LootAppraiserDB.MinimapPos = math.deg(math.atan2(ypos,xpos)) -- save the degrees we are relative to the minimap center
	LootAppraiser_MinimapButton_Reposition() -- move the button
end

function LootAppraiser_MinimapButton_OnClick()
	local button = GetMouseButtonClicked()
	
	if isRunning == 1 then
		DEFAULT_CHAT_FRAME:AddMessage("LootAppraiser already loaded.")
	else
		if button == "LeftButton" then
			DEFAULT_CHAT_FRAME:AddMessage("Loading LootAppraiser UIs.")
			OpenLootAppraiser=1
			LootPromptAnswered=1
			createUI()
			if isGoldAlertRunning == 0 then
				createGoldAlertUI()
			end
			if isLiteRunning == 0 then
				createUILite()
			end
		end
	end

	if isThresholdRunning == 1 then --isGoldAlertRunning == 1 or isLiteRunning == 1 then
		DEFAULT_CHAT_FRAME:AddMessage("LootAppraiser already loaded.")	
	else
		if button == "RightButton" then
			createThresholdUI()
		end
	
	end

end

	-- Called when PriceSource dropdown channged --
	function ChangePriceSource(value)
		LootAppraiser:Print("Price source changed to: "..value)
			priceSourceValue = value
	end
	
	function ChangeGoldAlertThreshold(value)
		GoldAlertThreshold = eb:GetText()
		LootAppraiser:Print("Gold alert threshold set: "..GoldAlertThreshold.." gold or higher.")
		if isGoldAlertRunning == 0 then	--automoatically load gold alert UI if not loaded
				--createThresholdUI()
				createGoldAlertUI()
		end
	end
	
	function ChangeGoldAlertThresholdLeave(value)
		eb:GetText()
	end
	
	-- Change Quality Filter --
	function ChangeQualityFilter(value)
		qualityName = ""
		qualityFilterAbove = value
		if value == 1 then qualityName = "Poor" end
		if value == 2 then qualityName = "Common" end
		if value == 3 then qualityName = "Uncommon" end
		if value == 4 then qualityName = "Rare" end
		if value == 5 then qualityName = "Epic" end
		LootAppraiser:Print("Quality Filter set to: "..qualityName.." and above.")
	
	end
	
function LootAppraiser:ClearSession()
	ClearSession()
end
	-- Called when Clear button clicked --
	function ClearSession()
		
		-- Clear all totals --
		c1=0					--reset loot counter
		newCurrentTotal=0		--reset gold counter
		qualityFilterAbove=1	--reset quality filter to common and above
		totalCurrencyLooted = 0	--reset currency looted
		noteworthitems = 0		--reset noteworthy items looted
		sld:SetValue(1)			--reset slider
		grayCounter = 0			--reset gray counter
		nilc:SetText("NOTEWORTHY: "..0)
		til:SetText("ITEMS LOOTED: "..0)		-- total items looted counter
		lb:SetText("LOOTED ITEM VALUE: "..0)	-- total asset value counter
		eb:SetText("300") -- gold alert threshold reset
		tcl:SetText("CURRENCY LOOTED: "..0)
		Stopwatch_Pause()
		Stopwatch_Clear()
		if isGoldAlertRunning == 1 then
			falert:SetTitle("Gold Alert Threshold")
		end
		CustomPrice = 0
		dd:SetText("AuctionDB: Global Market Value Avg")
		priceSourceValue = "DBGlobalMarketAvg"
		
		if isLiteRunning == 1 then
			fc:SetTitle("0")
		end
		tf:SetText("Session Cleared")
		LootAppraiser:Print("Session cleared.")
		
	end
	
function VendorGrayItems()

	--Validate whether there is an NPC open and how many items sold
	local itemCounter = 0
	for n = 1, GetMerchantNumItems() do	
		local merchantItemName = select(1, GetMerchantItemInfo(n))
		itemCounter = itemCounter + 1
	end
	
	--If not vendor open (unable to count vendor items) alert to go to merchant
	if itemCounter == 0 then
		LootAppraiser:Print("Travel to a vendor first to sell your items.")
	
	else
	
	for bag=0,4 do
		for slot=1, GetContainerNumSlots(bag) do
		local n=GetContainerItemLink(bag,slot)
			if n and strfind(n,"ff9d9d9d") then			--Poor = ff9d9d9d
				UseContainerItem(bag,slot)
			end
		end
	end
end
end


function HandleEvent(event, ...)

--[[
---------------------------------------------------------------------------
--START BAG UPDATE DELAYED EVENT
---------------------------------------------------------------------------	

if event == "BAG_UPDATE_DELAYED" then
	
	local openable_ids = {
	[118473] = true, -- Small Sack of Salvaged Goods
	[114116] = true, -- Bag of Salvaged Goods
	[114119] = true, -- Crate of Salvage
	[114120] = true, -- Big Crate of Salvage
	}

	end
---------------------------------------------------------------------------
--END BAG UPDATE DELAYED EVENT
---------------------------------------------------------------------------	
--]]	
	
---------------------------------------------------------------------------
--START LOOT AND BAG OPEN EVENT
---------------------------------------------------------------------------	

if event == "BAG_UPDATE_DELAYED" then
	--LootAppraiser:Print("BAG_UPDATE_DELAYED")
--[[
	for j = 1, ATTACHMENTS_MAX_RECEIVE do
	local itemString = TSMAPI:GetItemString(GetInboxItemLink(index, j))
	local quantity = select(3, GetInboxItem(index, j))
	local space = 0
	if itemString then
	for bag = 0, NUM_BAG_SLOTS do
		if TSMAPI:ItemWillGoInBag(itemString, bag) then
			for slot = 1, GetContainerNumSlots(bag) do
				local iString = TSMAPI:GetItemString(GetContainerItemLink(bag, slot))
				if iString == itemString then
					local stackSize = select(2, GetContainerItemInfo(bag, slot))
					LootAppraiser:Print(iString)
					--local maxStackSize = select(8, TSMAPI:GetSafeItemInfo(itemString))
					--if (maxStackSize - stackSize) >= quantity then
					--	return true
					--end
				elseif not iString then
					return true
				end
			end
		end
	end
	end
	end
--]]
end
	
if event == "LOOT_OPENED" or event == "BAG_OPEN" then	--add message if not == 1 for enabling auto-loot
--auto loot message?
	if LootPromptAnswered == 0 and isLootPromptUIRunning ~= 1 then
		LootPromptUI()
	else
--	Restart timer
		if Stopwatch_IsPlaying() == true then
			--Stopwatch_Play()
		else
			Stopwatch_Play()
		end
	end

if OpenLootAppraiser == 1 and LootPromptAnswered == 1 then
	
	if isRunning == 1 then
		if isRunning == 1 then 	--Update inventory bag slots if UI is running
		-- Calculate Bag Space available --
		local numSlotsCounter=0
		for i = 0, 5, 1 do	--start, end, step
			local FreeBagSlots = GetContainerNumFreeSlots(i)
			numSlotsCounter = numSlotsCounter+FreeBagSlots
		end
		bsc:SetText("BAG SPACE: ["..numSlotsCounter.."]")
	end
	
	-- Cycle through each looted item --
for i = 1, GetNumLootItems() do
local pName = UnitName("player")

---------------------------------------------------------------------------
--Currency Loot Type
---------------------------------------------------------------------------	
	if GetLootSlotType(i) == 2 then		-- currency type looted
		if isRunning == 1 then		
			oldText = tf:GetText()
			--runningTotal
			local lootedCoin = select(2, GetLootSlotInfo(i))
			local lootedCopper = string.gsub(lootedCoin, "[^0-9]","")
			local lootedCopperParsed = tonumber(lootedCopper)	--converted money value in copper
			totalCurrencyLooted = totalCurrencyLooted + lootedCopperParsed
			local MakeCoinValue = TSMAPI:FormatTextMoney(totalCurrencyLooted, nil, true, true, disabled) or 0
			
		--totalCurrencyLooted = totalCurrencyLooted + lootedCopperParsed
			runningTotal = lootedCopperParsed
			
			local LastMakeCoin = TSMAPI:FormatTextMoney(lootedCopper, nil, true, true, disabled) or 0
			--tf:SetText("[Currency]: "..LastMakeCoin.."\n"..oldText)
			tcl:SetText("CURRENCY LOOTED: "..MakeCoinValue)
		end
		
		if isLiteRunning == 1 then
			--runningTotal
			local lootedCoin = select(2, GetLootSlotInfo(i))
			local lootedCopper = string.gsub(lootedCoin, "[^0-9]","")
			local lootedCopperParsed = tonumber(lootedCopper)	--converted money value in copper
			runningTotal = lootedCopperParsed
		end
		
	end
---------------------------------------------------------------------------	
--Item Loot Type
---------------------------------------------------------------------------

	if GetLootSlotType(i) == 1 then		-- item type looted
	
		-- Get Information about Item Looted --
		local ItemID = TSMAPI:GetItemID(GetLootSlotLink(i), true) -- get item id
		local ItemQty = select(3, GetLootSlotInfo(i))
		local ItemName = GetItemInfo(ItemID)
		local sLink = GetLootSlotLink(i)
		local ItemQuality = select(3, GetItemInfo(ItemID))
		
		-- Write to Text Frame --
		if isRunning == 1 then
			oldText = tf:GetText()
		end
		
		local MarketValue = TSMAPI:GetItemValue(ItemID, priceSourceValue) or 0
		local MVGold = string.format(MarketValue/10000) or 0

---------------------------------------------------------------------------	
--START BLACKLISTED ITEMS - Report ZERO Value and No Logging
---------------------------------------------------------------------------

	--These items are from AQ20.  All of the Idols and Scarabs are Blacklisted.
	if ItemID == 20858 or ItemID == 20859 or ItemID == 20860 or ItemID == 20861 or ItemID == 20862 or ItemID == 20863 or ItemID == 20864 or ItemID == 20865 or ItemID == 20874 or ItemID == 20866 or ItemID == 20868 or ItemID == 20869 or ItemID == 20870 or ItemID == 20871 or ItemID == 20872 or ItemID == 20873 or ItemID == 20867 or ItemID == 20875 or ItemID == 20876 or ItemID == 20877 or ItemID == 20878 or ItemID == 20879 or ItemID == 20881 or ItemID == 20882 or ItemID == 19183 or ItemID == 18640 then
	--ItemID 19183 - Hourglass Sand from BWL
	--ItemID 18640 - Happyrock from Diremaul
	LootAppraiser:Print("BlackListed Item looted: "..ItemName)
	
		if isRunning == 1 then
		-- Update Loot Counter --
			til:SetText("ITEMS LOOTED: ["..c1.."]")

			newCurrentTotal=newCurrentTotal+runningTotal

			local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			lb:SetText("LOOTED ITEM VALUE: "..LastMakeCoin)
		end
		if isLiteRunning == 1 then
		local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			fc:SetTitle(LastMakeCoin)
		end	
	
	
	
	
---------------------------------------------------------------------------	
--END BLACKLISTED ITEMS
---------------------------------------------------------------------------	

	else
	-- Start quality filter checking --
		if MarketValue == 0 and ItemQty >= 1 then		-- For Soulbound items
		local iNoValue = 0
			c1=c1+ItemQty
			
			MarketValue = TSMAPI:GetItemValue(ItemID, "VendorSell") or 0		
			
			-- Current Conversion --
			MarketValue = MarketValue * ItemQty		-- support for >1 quantity
			runningTotal=MarketValue
			MakeCoin = TSMAPI:FormatTextMoney(runningTotal, nil, true, true, disabled) or 0

			if isRunning == 1 then
			-- Update Loot Counter --
			til:SetText("ITEMS LOOTED: ["..c1.."]")

			newCurrentTotal=newCurrentTotal+runningTotal

			local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			lb:SetText("LOOTED ITEM VALUE: "..LastMakeCoin)
			end
			if isLiteRunning == 1 then
			local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			fc:SetTitle(LastMakeCoin)
			end


			
		if qualityFilterAbove > 1 and ItemQuality >=1 and MarketValue >= 1 then

		--Do not report just list price calculations
			iNoValue = iNoValue * ItemQty		-- support for >1 quantity
			tf:SetText(sLink.."x"..ItemQty..": "..MakeCoin.."\n"..oldText)
			LootAppraiser:Print(sLink.."x"..ItemQty..": "..MakeCoin)
		
			MVGold = floor(MarketValue/10000)
			GAT = tonumber(eb:GetText())

				if MVGold >= GAT then
					if isGoldAlertRunning == 1 then
						GoldAlertMessage = (sLink..": "..MakeCoin.."!")
						noteworthitems = noteworthitems + 1
						nilc:SetText("NOTEWORTHY: "..noteworthitems)
						falert:SetTitle(GoldAlertMessage)
						PlaySound("AuctionWindowOpen", "master");
					end
				end
				
		if isRunning == 1 then
		-- Update Loot Counter --
			til:SetText("ITEMS LOOTED: ["..c1.."]")

			newCurrentTotal=newCurrentTotal+runningTotal

			local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			lb:SetText("LOOTED ITEM VALUE: "..LastMakeCoin)
		end
		if isLiteRunning == 1 then
		local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			fc:SetTitle(LastMakeCoin)
		end				
				
				
				
				
			else

			end	
			
		---------------------------------------------------------------------------
		--POOR QUALITY
		---------------------------------------------------------------------------				
		elseif qualityFilterAbove == 1 and ItemQuality >= 0 then
		
		-- If Poor item quality, use VendorSell price instead of Selected Pricing Source
			if ItemQuality == 0 and ItemQty >=1 then	-- poor quality only

				c1=c1+ItemQty
				MarketValue = TSMAPI:GetItemValue(ItemID, "VendorSell") or 0
				MarketValue = MarketValue * ItemQty		-- support for >1 quantity	

			-- Current Conversion --
				runningTotal=MarketValue
				MakeCoin = TSMAPI:FormatTextMoney(runningTotal, nil, true, true, disabled) or 0
				
				tf:SetText(sLink.."x"..ItemQty..": "..MakeCoin.."\n"..oldText)
				LootAppraiser:Print(sLink.."x"..ItemQty..": "..MakeCoin)
			

		if isRunning == 1 then
		-- Update Loot Counter --
			til:SetText("ITEMS LOOTED: ["..c1.."]")

			newCurrentTotal=newCurrentTotal+runningTotal

			local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			lb:SetText("LOOTED ITEM VALUE: "..LastMakeCoin)
		end
		if isLiteRunning == 1 then
		local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			fc:SetTitle(LastMakeCoin)
		end




			
			else
				---------------------------------------------------------------------------
				--DEFAULT ITEM IDs BELOW TO VENDORSELL PRICING
				---------------------------------------------------------------------------	
				if ItemID == 1205 or ItemID == 3770 or ItemID == 104314 or ItemID == 11444 
					or ItemID == 104314 or ItemID == 11444 or ItemID == 117437 or ItemID == 117439
					or ItemID == 117442 or ItemID == 117453 or ItemID == 117568 or ItemID == 1179
					or ItemID == 117 or ItemID == 159 or ItemID == 1645 or ItemID == 1707
					or ItemID == 1708 or ItemID == 17344 or ItemID == 17404 or ItemID == 17406
					or ItemID == 17407 or ItemID == 19221 or ItemID == 19222 or ItemID == 19223
					or ItemID == 19224 or ItemID == 19225 or ItemID == 19299 or ItemID == 19300
					or ItemID == 19304 or ItemID == 19305 or ItemID == 19306 or ItemID == 2070
					or ItemID == 20857 or ItemID == 21151 or ItemID == 21215 or ItemID == 2287
					or ItemID == 2593 or ItemID == 2594 or ItemID == 2595 or ItemID == 2596
					or ItemID == 2723 or ItemID == 27854 or ItemID == 27855 or ItemID == 27856
					or ItemID == 27857 or ItemID == 27858 or ItemID == 27859 or ItemID == 27860
					or ItemID == 28284 or ItemID == 28399 or ItemID == 29453 or ItemID == 29454
					or ItemID == 33443 or ItemID == 33444 or ItemID == 33445 or ItemID == 33449
					or ItemID == 33451 or ItemID == 33452 or ItemID == 33454 or ItemID == 35947
					or ItemID == 35948 or ItemID == 35951 or ItemID == 3703 or ItemID == 37252
					or ItemID == 3771 or ItemID == 3927 or ItemID == 40042 or ItemID == 414
					or ItemID == 41731 or ItemID == 422 or ItemID == 44570 or ItemID == 44940
					or ItemID == 44941 or ItemID == 4536 or ItemID == 4537 or ItemID == 4538
					or ItemID == 4539 or ItemID == 4540 or ItemID == 4541 or ItemID == 4542
					or ItemID == 4544 or ItemID == 4592 or ItemID == 4593 or ItemID == 4594
					or ItemID == 4595 or ItemID == 4599 or ItemID == 4600 or ItemID == 4601
					or ItemID == 4602 or ItemID == 4604 or ItemID == 4605 or ItemID == 4606
					or ItemID == 4607 or ItemID == 4608 or ItemID == 58256 or ItemID == 58257
					or ItemID == 58258 or ItemID == 58259 or ItemID == 58260 or ItemID == 58261
					or ItemID == 58262 or ItemID == 58263 or ItemID == 58264 or ItemID == 58265
					or ItemID == 58266 or ItemID == 58268 or ItemID == 58269 or ItemID == 59029
					or ItemID == 59230 or ItemID == 61982 or ItemID == 61985 or ItemID == 61986
					or ItemID == 73260 or ItemID == 74822 or ItemID == 787 or ItemID == 81400
					or ItemID == 81401 or ItemID == 81402 or ItemID == 81403 or ItemID == 81404
					or ItemID == 81405 or ItemID == 81406 or ItemID == 81407 or ItemID == 81408
					or ItemID == 81409 or ItemID == 81410 or ItemID == 81411 or ItemID == 81412
					or ItemID == 81413 or ItemID == 81414 or ItemID == 81415 or ItemID == 8766
					or ItemID == 8932 or ItemID == 8948 or ItemID == 8950 or ItemID == 8952
					or ItemID == 8953 or ItemID == 9260 
					or ItemID == 20404 -- Encrypted Twilight Text
					then
					MarketValue = TSMAPI:GetItemValue(ItemID, "VendorSell") or 0
				
									if isRunning == 1 then
		-- Update Loot Counter --
			til:SetText("ITEMS LOOTED: ["..c1.."]")

			newCurrentTotal=newCurrentTotal+runningTotal

			local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			lb:SetText("LOOTED ITEM VALUE: "..LastMakeCoin)
		end
		if isLiteRunning == 1 then
		local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			fc:SetTitle(LastMakeCoin)
		end
			
				
				
				
				
				
				else
					MarketValue = TSMAPI:GetItemValue(ItemID, priceSourceValue) or 0
			
				end
				c1=c1+ItemQty
			-- Current Conversion --
				MarketValue = MarketValue * ItemQty		-- support for >1 quantity
				
				runningTotal=MarketValue
				MakeCoin = TSMAPI:FormatTextMoney(runningTotal, nil, true, true, disabled) or 0

				MVGold = floor(MarketValue/10000)
				if isGoldAlertRunning == 1 then
					GAT = tonumber(eb:GetText())

					if MVGold >= GAT then
						if isGoldAlertRunning == 1 then
							GoldAlertMessage = (sLink..": "..MakeCoin.."!")
							noteworthitems = noteworthitems + 1
							nilc:SetText("NOTEWORTHY: "..noteworthitems)
							falert:SetTitle(GoldAlertMessage)
							PlaySound("AuctionWindowOpen", "master");
						end
					end
				end
				
				
		if isRunning == 1 then
		-- Update Loot Counter --
			til:SetText("ITEMS LOOTED: ["..c1.."]")

			newCurrentTotal=newCurrentTotal+runningTotal

			local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			lb:SetText("LOOTED ITEM VALUE: "..LastMakeCoin)
		end
		if isLiteRunning == 1 then
		local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			fc:SetTitle(LastMakeCoin)
		end				
				
				
				
				
				
				if isRunning == 1 then
					tf:SetText(sLink.."x"..ItemQty..": "..MakeCoin.."\n"..oldText)
					LootAppraiser:Print(sLink.."x"..ItemQty..": "..MakeCoin)
				end
			end

			runningTotal=MarketValue
			
		---------------------------------------------------------------------------
		--COMMON QUALITY
		---------------------------------------------------------------------------	
		elseif qualityFilterAbove == 2 and ItemQuality >=1 then
		-- Current Conversion --
			MarketValue = MarketValue * ItemQty		-- support for >1 quantity
			runningTotal=MarketValue
			MakeCoin = TSMAPI:FormatTextMoney(runningTotal, nil, true, true, disabled) or 0
			
			MVGold = floor(MarketValue/10000)
			GAT = tonumber(eb:GetText())

			if MVGold >= GAT then
				if isGoldAlertRunning == 1 then
					GoldAlertMessage = (sLink..": "..MakeCoin.."!")
					noteworthitems = noteworthitems + 1
					nilc:SetText("NOTEWORTHY: "..noteworthitems)
					falert:SetTitle(GoldAlertMessage)
					PlaySound("AuctionWindowOpen", "master");
				end
			end
			
			
					if isRunning == 1 then
		-- Update Loot Counter --
			til:SetText("ITEMS LOOTED: ["..c1.."]")

			newCurrentTotal=newCurrentTotal+runningTotal

			local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			lb:SetText("LOOTED ITEM VALUE: "..LastMakeCoin)
		end
		if isLiteRunning == 1 then
		local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			fc:SetTitle(LastMakeCoin)
		end
			
			
			
			
				
			if ItemQty > 1 then
				c1=c1+ItemQty
				tf:SetText(sLink.."x"..ItemQty..": "..MakeCoin.."\n"..oldText)
				LootAppraiser:Print(sLink.."x"..ItemQty..": "..MakeCoin)
			else
				c1=c1+ItemQty
				tf:SetText(sLink.."x"..ItemQty..": "..MakeCoin.."\n"..oldText)
				LootAppraiser:Print(sLink.."x"..ItemQty..": "..MakeCoin)
			end						

		---------------------------------------------------------------------------
		--UNCOMMON QUALITY
		---------------------------------------------------------------------------	
		elseif qualityFilterAbove == 3 and ItemQuality >= 2 then
		-- Current Conversion --
			MarketValue = MarketValue * ItemQty		-- support for >1 quantity
			
			runningTotal=MarketValue
			MakeCoin = TSMAPI:FormatTextMoney(runningTotal, nil, true, true, disabled) or 0
	
			MVGold = floor(MarketValue/10000)
			GAT = tonumber(eb:GetText())

			if MVGold >= GAT then
				if isGoldAlertRunning == 1 then
					GoldAlertMessage = (sLink..": "..MakeCoin.."!")
					noteworthitems = noteworthitems + 1
					nilc:SetText("NOTEWORTHY: "..noteworthitems)
					falert:SetTitle(GoldAlertMessage)
					PlaySound("AuctionWindowOpen", "master");
				end
			end
	
--COMMENTED OUT
	--MakeCoin = TSMAPI:FormatTextMoney(runningTotal, nil, true, true, disabled) or 0

	
			if isRunning == 1 then
		-- Update Loot Counter --
			til:SetText("ITEMS LOOTED: ["..c1.."]")

			newCurrentTotal=newCurrentTotal+runningTotal

			local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			lb:SetText("LOOTED ITEM VALUE: "..LastMakeCoin)
		end
		if isLiteRunning == 1 then
		local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			fc:SetTitle(LastMakeCoin)
		end
	
	
	
	
	
	
	
	
	
			-- Write to Text Frame --
			if ItemQty > 1 then
				c1=c1+ItemQty
				tf:SetText(sLink.."x"..ItemQty..": "..MakeCoin.."\n"..oldText)
				LootAppraiser:Print(sLink.."x"..ItemQty..": "..MakeCoin)
			else
				c1=c1+ItemQty
				tf:SetText(sLink.."x"..ItemQty..": "..MakeCoin.."\n"..oldText)
				LootAppraiser:Print(sLink.."x"..ItemQty..": "..MakeCoin)
			end

		---------------------------------------------------------------------------
		--RARE QUALITY
		---------------------------------------------------------------------------	
		elseif qualityFilterAbove == 4 and ItemQuality >= 3 then
		-- Current Conversion --
			MarketValue = MarketValue * ItemQty		-- support for >1 quantity
			runningTotal=MarketValue
			MakeCoin = TSMAPI:FormatTextMoney(runningTotal, nil, true, true, disabled) or 0
				
			MVGold = floor(MarketValue/10000)
			GAT = tonumber(eb:GetText())

			if MVGold >= GAT then
				if isGoldAlertRunning == 1 then
					GoldAlertMessage = (sLink..": "..MakeCoin.."!")
					noteworthitems = noteworthitems + 1
					nilc:SetText("NOTEWORTHY: "..noteworthitems)					
					falert:SetTitle(GoldAlertMessage)
					PlaySound("AuctionWindowOpen", "master");
				end
			end
		
		
				if isRunning == 1 then
		-- Update Loot Counter --
			til:SetText("ITEMS LOOTED: ["..c1.."]")

			newCurrentTotal=newCurrentTotal+runningTotal

			local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			lb:SetText("LOOTED ITEM VALUE: "..LastMakeCoin)
		end
		if isLiteRunning == 1 then
		local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			fc:SetTitle(LastMakeCoin)
		end
		
		
		
		
			-- Write to Text Frame --
			if ItemQty > 1 then
				c1=c1+ItemQty
				tf:SetText(sLink.."x"..ItemQty..": "..MakeCoin.."\n"..oldText)
				LootAppraiser:Print(sLink.."x"..ItemQty..": "..MakeCoin)
			else
				c1=c1+ItemQty
				tf:SetText(sLink.."x"..ItemQty..": "..MakeCoin.."\n"..oldText)
				LootAppraiser:Print(sLink.."x"..ItemQty..": "..MakeCoin)
			end

		---------------------------------------------------------------------------
		--EPIC QUALITY
		---------------------------------------------------------------------------	
		elseif qualityFilterAbove == 5 and ItemQuality >= 4 then
		-- Current Conversion --
			MarketValue = MarketValue * ItemQty		-- support for >1 quantity
			runningTotal=MarketValue
			MakeCoin = TSMAPI:FormatTextMoney(runningTotal, nil, true, true, disabled) or 0

			MVGold = floor(MarketValue/10000)
			GAT = tonumber(eb:GetText())

			if MVGold >= GAT then
				if isGoldAlertRunning == 1 then
					GoldAlertMessage = (sLink..": "..MakeCoin.."!")
					noteworthitems = noteworthitems + 1
					nilc:SetText("NOTEWORTHY: "..noteworthitems)
					falert:SetTitle(GoldAlertMessage)
					PlaySound("AuctionWindowOpen", "master");
				end
			end
			
		if isRunning == 1 then
		-- Update Loot Counter --
			til:SetText("ITEMS LOOTED: ["..c1.."]")

			newCurrentTotal=newCurrentTotal+runningTotal

			local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			lb:SetText("LOOTED ITEM VALUE: "..LastMakeCoin)
		end
		if isLiteRunning == 1 then
		local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			fc:SetTitle(LastMakeCoin)
		end



			
			-- Write to Text Frame --
			if ItemQty > 1 then
				c1=c1+ItemQty
				tf:SetText(sLink.."x"..ItemQty..": "..MakeCoin.."\n"..oldText)
				LootAppraiser:Print(sLink.."x"..ItemQty..": "..MakeCoin)
			else
				c1=c1+ItemQty			
				tf:SetText(sLink.."x"..ItemQty..": "..MakeCoin.."\n"..oldText)
				LootAppraiser:Print(sLink.."x"..ItemQty..": "..MakeCoin)
			end

	else
			
	end
end
--[[
		if isRunning == 1 then
		-- Update Loot Counter --
			til:SetText("ITEMS LOOTED: ["..c1.."]")

			newCurrentTotal=newCurrentTotal+runningTotal

			local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			lb:SetText("LOOTED ITEM VALUE: "..LastMakeCoin)
		end
		if isLiteRunning == 1 then
		local LastMakeCoin = TSMAPI:FormatTextMoney(newCurrentTotal, nil, true, true, disabled) or 0
			fc:SetTitle(LastMakeCoin)
		end
--]]
	end
	end
---------------------------------------------------------------------------
--END LOOT AND BAG OPEN EVENT
---------------------------------------------------------------------------		
end
end
end
end