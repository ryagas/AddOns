﻿local addonName = ...
local addon = _G[addonName]

--[[
The methods below are slightly modified versions of Blizzard's own code to manage scrollframes.
I wanted to clean my own code, to reduce the amount of named frames, which often make the code too specific and less flexible.
By using parentKeys, it becomes easier to manage some bits in a generic way, for this I had to modify Blizzard's own UI templates (see .xml)
Blizzard is using parentKeys in their newer UI elements (ex: Garrison stuff), but older elements like scrollframes have not been updated,
most likely for compatibility reasons.
I thus had to redo the xml templates and their supporting code.
--]]

addon.ScrollFrames = {}

local ns = addon.ScrollFrames		-- ns = namespace

function ns:OnLoad(frame)
	local scrollBar = frame.ScrollBar
	
	scrollBar.ScrollDownButton:Disable()
	scrollBar.ScrollUpButton:Disable()
	scrollBar:SetMinMaxValues(0, 0)
	scrollBar:SetValue(0)
	
	frame.offset = 0;
	
	if frame.scrollBarHideable then
		scrollBar:Hide()
		scrollBar.ScrollDownButton:Hide()
		scrollBar.ScrollUpButton:Hide()
	else
		scrollBar.ScrollDownButton:Disable()
		scrollBar.ScrollUpButton:Disable()
		scrollBar.ScrollDownButton:Show()
		scrollBar.ScrollUpButton:Show()
	end
	
	if frame.noScrollThumb then
		scrollBar.ThumbTexture:Hide()
	end
end

function ns:GetOffset(frame)
	return frame.offset
end

function ns:SetOffset(frame, offset)
	frame.offset = offset
end

function ns:OnScrollRangeChanged(frame, offset, rowHeight, updateFunction)
	local scrollBar = frame.ScrollBar
	
	if ( not yrange ) then
		yrange = frame:GetVerticalScrollRange()
	end
	
	local value = scrollBar:GetValue()
	if ( value > yrange ) then
		value = yrange
	end
	
	scrollBar:SetMinMaxValues(0, yrange)
	scrollBar:SetValue(value)
	
	if ( floor(yrange) == 0 ) then
		if ( frame.scrollBarHideable ) then
			scrollBar:Hide()
			scrollBar.ScrollDownButton:Hide()
			scrollBar.ScrollUpButton:Hide()
			scrollBar.ThumbTexture:Hide()
		else
			scrollBar.ScrollDownButton:Disable()
			scrollBar.ScrollUpButton:Disable()
			scrollBar.ScrollDownButton:Show()
			scrollBar.ScrollUpButton:Show()
			
			if ( not frame.noScrollThumb ) then
				scrollBar.ThumbTexture:Show()
			end
		end
	else
		scrollBar.ScrollDownButton:Show()
		scrollBar.ScrollUpButton:Show()
		scrollBar:Show()
		
		if ( not frame.noScrollThumb ) then
			scrollBar.ThumbTexture:Show()
		end
		
		-- The 0.005 is to account for precision errors
		if ( yrange - value > 0.005 ) then
			scrollBar.ScrollDownButton:Enable()
		else
			scrollBar.ScrollDownButton:Disable()
		end
	end
	
	-- Hide/show scrollframe borders
	local top = frame.Top
	local bottom = frame.Bottom
	local middle = frame.Middle
	
	if top and bottom and frame.scrollBarHideable then
		if ( frame:GetVerticalScrollRange() == 0 ) then
			top:Hide()
			bottom:Hide()
		else
			top:Show()
			bottom:Show()
		end
	end
	
	if middle and frame.scrollBarHideable then
		if ( frame:GetVerticalScrollRange() == 0 ) then
			middle:Hide()
		else
			middle:Show()
		end
	end
end

function ns:OnMouseWheel(frame, delta)
	local scrollBar = frame.ScrollBar
	local scrollStep = scrollBar.scrollStep or scrollBar:GetHeight() / 2
	
	if (delta > 0) then
		scrollBar:SetValue(scrollBar:GetValue() - scrollStep)
	else
		scrollBar:SetValue(scrollBar:GetValue() + scrollStep)
	end
end

function ns:OnVerticalScroll(frame, offset, rowHeight, updateFunction)
	local scrollBar = frame.ScrollBar
	scrollBar:SetValue(offset)
	
	frame.offset = floor((offset / rowHeight) + 0.5)

	if updateFunction then
		updateFunction(frame)
	end
end

function ns:Update(frame, numItems, numToDisplay, buttonHeight)
	-- My own FauxScrollFrame_Update() from SharedUIPanelTemplates.lua
	-- If more than one screen full of skills then show the scrollbar
	local scrollBar = frame.ScrollBar

	if numItems > numToDisplay then
		frame:Show()
	else
		scrollBar:SetValue(0)
		frame:Hide()
	end
	
	if not frame:IsShown() then return end
	
	local scrollChildFrame = frame.ScrollChildFrame
	local scrollFrameHeight = 0
	local scrollChildHeight = 0

	if ( numItems > 0 ) then
		scrollFrameHeight = (numItems - numToDisplay) * buttonHeight
		scrollChildHeight = numItems * buttonHeight
		if ( scrollFrameHeight < 0 ) then
			scrollFrameHeight = 0
		end
		scrollChildFrame:Show()
	else
		scrollChildFrame:Hide()
	end
	
	local maxRange = (numItems - numToDisplay) * buttonHeight
	if (maxRange < 0) then
		maxRange = 0
	end
	
	scrollBar:SetMinMaxValues(0, maxRange)
	scrollBar:SetValueStep(buttonHeight)
	scrollBar:SetStepsPerPage(numToDisplay-1)
	scrollChildFrame:SetHeight(scrollChildHeight)

	local scrollUpButton = scrollBar.ScrollUpButton
	local scrollDownButton = scrollBar.ScrollDownButton
	
	-- Arrow button handling
	if ( scrollBar:GetValue() == 0 ) then
		scrollUpButton:Disable()
	else
		scrollUpButton:Enable()
	end
	
	if ((scrollBar:GetValue() - scrollFrameHeight) == 0) then
		scrollDownButton:Disable()
	else
		scrollDownButton:Enable()
	end
end
