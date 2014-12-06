local unpack = unpack

local predefined_points = {
	right = {
		details = { "TOPLEFT",  QuestMapFrame.DetailsFrame:GetParent(), "TOPRIGHT", 5,   -1 },
		NPC     = { "TOPLEFT",  QuestMapFrame.DetailsFrame, "TOPRIGHT", 28, 0 },
		back    = { --[[ QuestMapFrame.DetailsFrame.BackButton <Anchor point="TOPLEFT" x="10" y="30"/> ]] }
	},
	left = {
		details = { "TOPRIGHT", QuestMapFrame.DetailsFrame:GetParent(), "TOPLEFT",  -26, -1 },
		NPC     = { "TOPRIGHT", QuestMapFrame.DetailsFrame, "TOPLEFT", -1,  0 }
	},
}

local points = predefined_points.right

local function PositionDetailsFrame()
	QuestMapFrame.DetailsFrame:ClearAllPoints()
	QuestMapFrame.DetailsFrame:SetPoint(unpack(points.details))
end

hooksecurefunc("QuestMapFrame_ShowQuestDetails", function()
	QuestMapFrame.QuestsFrame:Show()
	if QuestNPCModel:IsVisible() then
		QuestNPCModel:ClearAllPoints()
		QuestNPCModel:SetPoint(unpack(points.NPC))
	end
end)

local event_frame = CreateFrame("Frame")
event_frame:RegisterEvent("ADDON_LOADED")
event_frame:SetScript("OnEvent", function(self, event, arg1)
	if event == "PLAYER_LOGIN" then
		PositionDetailsFrame()
		self:UnregisterEvent("PLAYER_LOGIN")
	elseif event == "ADDON_LOADED" and arg1 == "QuestMapWithDetails" then
		PositionDetailsFrame()

		if Aurora or FreeUI then
			local F, C = unpack(Aurora or FreeUI)
			F.CreateBD(QuestMapFrame.DetailsFrame)
			QuestMapFrame.DetailsFrame:SetWidth(288)
			local scrollbar = QuestMapFrame.DetailsFrame.ScrollFrame.ScrollBar
			scrollbar:SetPoint("TOPLEFT", scrollbar:GetParent(), "TOPRIGHT", 0, -15)
		end

		self:UnregisterEvent("ADDON_LOADED")
	end
end)