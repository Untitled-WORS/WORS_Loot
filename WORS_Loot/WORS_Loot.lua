-- Create the main frame
-- TO add new module ensure Data file is in this format "WORS_Loot_*ModuleName*_Data"
-- See Functions bellow to add new modules
--local function UpdateLootTable(subCat, subSubCat)
    --***local modulesData = {WORS_Loot_Slayer_Data, WORS_Loot_Skill_Data, WORS_Loot_Meme_Data, WORS_Loot_Boss_Data}
--local function UpdateSubcategoryDropdown(selectedModule)
	--***local modulesData = {WORS_Loot_Slayer_Data, WORS_Loot_Skill_Data, WORS_Loot_Meme_Data, WORS_Loot_Boss_Data}
--UIDropDownMenu_Initialize(moduleDropdown, function(self, level)
	--***local modules = {"Bosses", "Slayer", "Skills", "Memes"}
WORS_LootData = WORS_LootData or {}  -- Ensure the saved variable table exists

-- Set default values for debugMode 
WORS_LootData.debugMode = WORS_LootData.debugMode or false -- debug prints
WORS_LootData.transparency = WORS_LootData.transparency or 1.0 


function debugPrint(message)
    if WORS_LootData.debugMode then  -- Corrected the condition
        print("Debug: " .. message)
    end
end


local WORS_Loot = CreateFrame("Frame", "WORS_Loot", UIParent)
WORS_Loot:SetSize(750, 450)
WORS_Loot:SetPoint("CENTER")

WORS_Loot:SetBackdrop({	
	bgFile = "Interface\\WORS\\OldSchoolBackground2",
    edgeFile = "Interface\\WORS\\OldSchool-Dialog-Border",
    tile = false, tileSize = 32, edgeSize = 32,
    insets = { left = 5, right = 6, top = 6, bottom = 5 }
})
--WORS_Loot:SetBackdropColor(0, 0, 0, 1)

-- Enable mouse interactions
WORS_Loot:EnableMouse(true)
WORS_Loot:SetMovable(true)
WORS_Loot:RegisterForDrag("LeftButton")

-- Set up dragging behavior
WORS_Loot:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
        self:StartMoving()
    end
end)

WORS_Loot:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" then
        self:StopMovingOrSizing()
    end
end)

-- Optional: keep the frame within screen bounds
WORS_Loot:SetClampedToScreen(true)

WORS_Loot:Hide()
debugPrint("WORS Loot main frame created.")


-- Title
local title = WORS_Loot:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
title:SetPoint("TOP", 0, -10)
title:SetText("Loot Tables")

-- Dropdowns
local function SetDropdownTextStyle(dropdown)
    -- Set the normal style for the selected item text
    _G[dropdown:GetName().."Text"]:SetFont("Fonts\\runescape.ttf", 20, "NORMAL")  -- Set font size and style for selected item
    _G[dropdown:GetName().."Text"]:SetJustifyH("RIGHT")  -- Keep text centered
end

local moduleDropdown = CreateFrame("Frame", "WORS_Loot_ModuleDropdown", WORS_Loot, "UIDropDownMenuTemplate")
moduleDropdown:SetPoint("TOPLEFT", WORS_Loot, "TOPLEFT", 50, -30)
UIDropDownMenu_SetWidth(moduleDropdown, 150)

-- Set default text to "Select Module" before an option is selected
UIDropDownMenu_SetText(moduleDropdown, "Select Module")

-- Hide the background of the dropdown menu
_G[moduleDropdown:GetName().."Middle"]:Hide()  -- Hides the background middle section
_G[moduleDropdown:GetName().."Left"]:Hide()    -- Hides the left part of the background
_G[moduleDropdown:GetName().."Right"]:Hide()   -- Hides the right part of the background

-- Apply text styling
SetDropdownTextStyle(moduleDropdown)

debugPrint("Module dropdown created.")

local subcategoryDropdown = CreateFrame("Frame", "WORS_Loot_SubcategoryDropdown", WORS_Loot, "UIDropDownMenuTemplate")
subcategoryDropdown:SetPoint("TOPLEFT", moduleDropdown, "TOPLEFT", 210, 0)
UIDropDownMenu_SetWidth(subcategoryDropdown, 150)

-- Set default text to "Select Subcategory" before an option is selected
UIDropDownMenu_SetText(subcategoryDropdown, "")

-- Hide the background of the dropdown menu
_G[subcategoryDropdown:GetName().."Middle"]:Hide()  -- Hides the background middle section
_G[subcategoryDropdown:GetName().."Left"]:Hide()    -- Hides the left part of the background
_G[subcategoryDropdown:GetName().."Right"]:Hide()   -- Hides the right part of the background

-- Apply text styling
SetDropdownTextStyle(subcategoryDropdown)

debugPrint("Subcategory dropdown created.")

local thirdDropdown = CreateFrame("Frame", "WORS_Loot_ThirdDropdown", WORS_Loot, "UIDropDownMenuTemplate")
thirdDropdown:SetPoint("TOPLEFT", subcategoryDropdown, "TOPLEFT", 210, 0)
UIDropDownMenu_SetWidth(thirdDropdown, 150)

-- Set default text to "Select Option" before an option is selected
UIDropDownMenu_SetText(thirdDropdown, "")

-- Hide the background of the dropdown menu
_G[thirdDropdown:GetName().."Middle"]:Hide()  -- Hides the background middle section
_G[thirdDropdown:GetName().."Left"]:Hide()    -- Hides the left part of the background
_G[thirdDropdown:GetName().."Right"]:Hide()   -- Hides the right part of the background

-- Apply text styling
SetDropdownTextStyle(thirdDropdown)

debugPrint("Third dropdown created.")




-- Loot Table Frame
local lootTableFrame = CreateFrame("ScrollFrame", "WORS_Loot_LootTable", WORS_Loot, "UIPanelScrollFrameTemplate")
lootTableFrame:SetSize(650, 350)
lootTableFrame:SetPoint("TOPLEFT", moduleDropdown, "BOTTOMLEFT", 20, -20)
lootTableFrame:SetBackdrop({
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
lootTableFrame:SetBackdropColor(0, 0, 0, 0)
lootTableFrame:SetBackdropBorderColor(0, 0, 0, 0)
local lootContent = CreateFrame("Frame", nil, lootTableFrame)
lootContent:SetSize(225, 1)
lootTableFrame:SetScrollChild(lootContent)
local lootItems = {}
local buttonHeight = 40
local buttonSpacing = 5

-- Create clickable item link with icon using item ID

-- Create a font string for displaying information
local infoText = lootTableFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
infoText:SetPoint("TOP", lootTableFrame, "TOP", -10, -60)  -- Adjust position as necessary
infoText:SetText("")  -- Initial text
infoText:SetTextColor(1, 1, 1)  -- White text color
infoText:SetJustifyH("CENTER")  -- Center the text horizontally
local subInfoText = lootTableFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
subInfoText:SetPoint("TOP", lootTableFrame, "TOP", -10, -60)  -- Adjust position as necessary
subInfoText:SetText("")  -- Initial text
subInfoText:SetTextColor(1, 1, 1)  -- White text color
subInfoText:SetJustifyH("CENTER")  -- Center the text horizontally

local scrollBar = _G["WORS_Loot_LootTableScrollBar"] -- Default scrollbar name from "UIPanelScrollFrameTemplate"
local scrollUpButton = _G["WORS_Loot_LootTableScrollBarScrollUpButton"]
local scrollDownButton = _G["WORS_Loot_LootTableScrollBarScrollDownButton"]
scrollBar:GetThumbTexture():SetAlpha(0) 
scrollUpButton:GetNormalTexture():SetAlpha(0)
scrollUpButton:GetPushedTexture():SetAlpha(0)
scrollUpButton:GetDisabledTexture():SetAlpha(0)
scrollDownButton:GetNormalTexture():SetAlpha(0)
scrollDownButton:GetPushedTexture():SetAlpha(0)
scrollDownButton:GetDisabledTexture():SetAlpha(0)

-- Function to create the loot frame
local function CreateLootFrame()
    local lootFrame = CreateFrame("Frame", "WORS_Loot", UIParent)
    lootFrame:SetSize(610, 300)  -- Set the desired size
    lootFrame:SetPoint("CENTER")  -- Position it in the center of the screen

    -- Set the backdrop for the loot frame
    lootFrame:SetBackdrop({
        bgFile = "Interface\\WORS\\OldSchoolBackground2",
        edgeFile = "Interface\\WORS\\OldSchool-Dialog-Border",
        tile = false,
        tileSize = 32,
        edgeSize = 32,
        insets = { left = 5, right = 6, top = 6, bottom = 5 }
    })

    lootFrame:SetBackdropColor(0, 0, 0, 1)  -- Black background
    lootFrame:SetBackdropBorderColor(1, 1, 1, 1)  -- White border

    lootFrame:Show()  -- Show the loot frame
    return lootFrame
end
-- Used to cache items before creating loot buttons
local function ShowItemTooltipById(itemId, parentFrame)
    -- Create an item link based on the itemId
    local itemLink = format("|cffffffff|Hitem:%d:0:0:0:0:0:0:0|h[%d]|h|r", itemId, itemId)

    -- Show the tooltip
    GameTooltip:SetOwner(parentFrame, "ANCHOR_RIGHT")  -- Set the owner of the tooltip (parentFrame could be a button or frame)
    GameTooltip:SetHyperlink(itemLink)  -- Set the item link for the tooltip
    GameTooltip:Show()  -- Display the tooltip
    GameTooltip:Hide()
end

-- Constants for button layout
local BUTTON_WIDTH = 300
local BUTTON_HEIGHT = 40
local PADDING = 0  -- Distance from edges and between buttons
local BUTTON_SPACING = 10  -- Space between buttons in a row or column

-- Function to create a loot button
local function CreateLootButton(itemId, index, isRareDrop)
    debugPrint("Creating loot button for item ID:", itemId)
    if not itemId then
        debugPrint("Error: Missing item ID.")
        return nil
    end

    ShowItemTooltipById(itemId, WORS_Loot)

    local lootButton = CreateFrame("Button", nil, lootContent)
    lootButton:SetSize(BUTTON_WIDTH, BUTTON_HEIGHT)

    -- Calculate column and row positions
    local column = (index - 1) % 2
    local row = math.floor((index - 1) / 2)

    -- Calculate x and y offsets based on row and column
    local xOffset = PADDING + column * (BUTTON_WIDTH + BUTTON_SPACING)
    local yOffset = -PADDING - row * (BUTTON_HEIGHT + BUTTON_SPACING)

    lootButton:SetPoint("TOPLEFT", lootContent, "TOPLEFT", xOffset, yOffset)

    -- Set the button background color based on rarity
    -- Set the button background color based on the rarity
    lootButton:SetBackdrop({
        bgFile = "Interface\\WORS\\OldSchoolBackground2",
        edgeFile = "Interface\\WORS\\OldSchool-Dialog-Border",
        tile = false,
        tileSize = 32,
        edgeSize = 32,
        insets = { left = 5, right = 5, top = 5, bottom = 5 }
    })
    lootButton:SetBackdropColor(isRareDrop and 0.647 or 0, 0, isRareDrop and 1 or 0, 1)  -- Purple for rare, black otherwise
    
	-- Create item icon
    local itemIcon = lootButton:CreateTexture(nil, "ARTWORK")
    itemIcon:SetSize(40, 40)
    itemIcon:SetPoint("LEFT", lootButton, "LEFT", 5, 0)
    itemIcon:SetTexture(GetItemIcon(itemId) or "Interface/Icons/INV_Misc_QuestionMark")

    -- Tooltip on hover
    lootButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        local itemLink = GetItemLink(itemId)
        if itemLink then
            GameTooltip:SetHyperlink(itemLink)
            GameTooltip:Show()
        else
            debugPrint("Error: Item link not found for item ID " .. itemId)
        end
    end)

    lootButton:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- Item name display
    local itemName = lootButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    itemName:SetPoint("LEFT", itemIcon, "RIGHT", 5, 0)
    itemName:SetFont("Fonts\\runescape.ttf", 20)  -- Set custom font and size
    itemName:SetTextColor(0, 0, 1)

    -- Try to fetch the item info using GetItemInfo
    local itemNameText, _, _, _, _, _, _, _, itemIcon = GetItemInfo(itemId)

    -- Check if we successfully fetched the item info
    if itemNameText then
        itemName:SetText(itemNameText)  -- Set item name if found
        itemName:SetTextColor(1, 1, 0)  -- Yellow color if found
        itemIcon = itemIcon or "Interface/Icons/INV_Misc_QuestionMark"  -- Use the icon if available
    else
        -- If the item info is still not available, display the item ID in orange
        local itemLink = format("|cffff8000|Hitem:%d:0:0:0:0:0:0:0|h[%d]|h|r", itemId, itemId)
        itemName:SetText(itemLink)  -- Display the raw hyperlink format
        itemName:SetTextColor(1, 0.647, 0)  -- Orange color for unknown items

        -- Start an OnUpdate function to check if the item info becomes available
        local loadingStartTime = GetTime()
        lootButton:SetScript("OnUpdate", function(self)
            -- Limit the update duration to avoid infinite loop
            if (GetTime() - loadingStartTime) > 120 then
                lootButton:SetScript("OnUpdate", nil)  -- Stop the update script after 5 seconds
            else
                -- Try to fetch the item info again
                local updatedItemNameText = GetItemInfo(itemId)
                if updatedItemNameText then
                    itemName:SetText(updatedItemNameText)  -- Update the name once it's found
                    itemName:SetTextColor(1, 1, 0)  -- Reset color to yellow when found
                    lootButton:SetScript("OnUpdate", nil)  -- Stop the update script once done
                end
            end
        end)
    end

    lootButton:SetHighlightTexture("Interface/Buttons/UI-Common-MouseHilight", "ADD")
    lootButton:SetPushedTextOffset(0, -1)

    lootButton:SetScript("OnClick", function(self, button)
        local itemLink = GetItemLink(itemId)
        local fallbackItemLink = format("|cffff8000|Hitem:%d:0:0:0:0:0:0:0|h[%d]|h|r", itemId, itemId)
        local finalItemLink = itemLink or fallbackItemLink

        if button == "LeftButton" then
            if IsShiftKeyDown() then
                -- Shift + Left Click: Link item in chat preserving typed message
                if ChatFrame1.editBox:IsVisible() then
                    -- Chat is already open, append the link
                    local currentChatText = ChatFrame1.editBox:GetText()
                    ChatFrame1.editBox:SetText(currentChatText .. " " .. finalItemLink)
                    ChatFrame1.editBox:SetCursorPosition(#currentChatText + #finalItemLink + 1)
                    ChatFrame1.editBox:SetFocus()
                else
                    -- Open chat and insert the item link
                    ChatFrame_OpenChat(finalItemLink, ChatFrame1)
                end
            elseif IsControlKeyDown() then
                -- Ctrl + Left Click: Open item in dressing room
                DressUpItemLink(finalItemLink)
            else
                -- Regular Left Click: Show ItemRefTooltip
                ItemRefTooltip:SetOwner(self, "ANCHOR_RIGHT")
                ItemRefTooltip:SetHyperlink(finalItemLink)
                ItemRefTooltip:Show()
            end
        end
    end)


    lootButton:Show()
    return lootButton
end

local function DisplayDefaultInfo()
    -- Create a text frame to display information about the add-on
    --local infoText = LootFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	infoText:SetText("Select a category to view item tables for Bosses, \nSlayer Tasks, Crafting and More.")
	--subInfoText:SetText("")
    -- Example button for normal drops
    local normalDropButton = CreateLootButton(90066, 1, false)  -- Replace 12345 with an example item ID
    normalDropButton:SetPoint("TOP", infoText, "BOTTOM", 0, -20)
        -- Example button for rare drops
    local rareDropButton = CreateLootButton(91119, 2, true)  -- Replace 67890 with an example rare item ID
    rareDropButton:SetPoint("TOP", normalDropButton, "BOTTOM", 0, -10)

    --Ensure all elements are visible
    normalDropButton:Show()
    rareDropButton:Show()

    --Store these in lootItems for cleanup
    table.insert(lootItems, normalDropButton)
    table.insert(lootItems, rareDropButton)
    table.insert(lootItems, infoText)
end
DisplayDefaultInfo()

-- Clear Loot Content
-- Clear Loot Content
local function ClearLootContent()
    debugPrint("Clearing loot content...")

    -- Check if lootItems is nil or empty
    if not lootItems or #lootItems == 0 then
        debugPrint("No loot items to clear.")
        subInfoText:SetText("Choose Next Dropdown")  -- Clear any existing text
        --subInfoText:Show()  -- Show the info text if needed
        return
    else
        debugPrint("Loot items before clearing: ", #lootItems)
    end

    for _, button in ipairs(lootItems) do
        if button and button.Hide then
            button:Hide()  -- Hide the button
            button:ClearAllPoints()  -- Clear positioning
            debugPrint("Hiding item button with ID:", button.itemID) -- Log the action
        elseif not button then
            debugPrint("Button is nil")
        else
            debugPrint("Button does not have a Hide method")
        end
    end

    subInfoText:SetText("")  -- Clear the error message or info text
    subInfoText:Show()  -- Optionally hide the text if there's no message to show
    wipe(lootItems)  -- Clear the lootItems table
    debugPrint("Loot content cleared. Total items now:", #lootItems)
    if not subCat or not subSubCat then
        -- Display default message and example buttons
        subInfoText:SetText("Choose Next Dropdown")  -- Clear any existing text
        --subInfoText:Show()  -- Show the info text if needed
		--DisplayDefaultInfo()
        return
    end

end




-- Update Loot Table based on selection
-- ********************************
-- *****HERE TO ADD NEW MODULE*****
-- ********************************
local function UpdateLootTable(subCat, subSubCat)
    debugPrint("Updating loot table for SubCat:", subCat, "SubSubCat:", subSubCat)
    ClearLootContent()
    -- Check if no valid selection was made
    if not subCat or not subSubCat then
        -- Display default message and example buttons
        DisplayDefaultInfo()
        return
    end
    local lootEntries = {}

    -- Create a mapping of all loot datasets
    local lootDataSources = {WORS_Loot_Boss_Data, WORS_Loot_RDT_Data, WORS_Loot_Weapons_Data, WORS_Loot_Armour_Data, WORS_Loot_Slayer_Data, WORS_Loot_Skill_Data, WORS_Loot_Meme_Data}
    if subCat and subSubCat then
        subInfoText:SetText("")  -- Clear the error message or info text
		--subInfoText:Show()  -- Optionally hide the text if there's no message to show
		local foundData = false
        for _, dataSource in ipairs(lootDataSources) do
            if dataSource[subCat] then
                local categoryData = dataSource[subCat][subSubCat]
                if categoryData then
                    foundData = true
                    for _, itemID in ipairs(categoryData.normalDrops) do
                        table.insert(lootEntries, { itemID = itemID, rareDrop = false })
                    end
                    for _, itemID in ipairs(categoryData.rareDropTable) do
                        table.insert(lootEntries, { itemID = itemID, rareDrop = true })
                    end
                end
            end
        end
        if not foundData then
            debugPrint("Error: No data found for subCat:", subCat, "subSubCat:", subSubCat)
        end
    else
        debugPrint("Error: Missing subCat or subSubCat.")
        return
    end

    if #lootEntries > 0 then
        for index, lootItem in ipairs(lootEntries) do
            debugPrint("Loot entry:", lootItem.itemID, "Rare:", lootItem.rareDrop)
            local lootButton = CreateLootButton(lootItem.itemID, index, lootItem.rareDrop)  -- Create the button
            table.insert(lootItems, lootButton)  -- Store the button reference instead of the lootItem
        end
    else
        debugPrint("No loot entries available for the selected category.")
		subInfoText:SetText("No loot in this catogry maybe bug or maybe itemID is\n unknown or not in WORS yet check OSRS Wiki before reporting")
		
	end
end






-- Update Subcategory for Skills / ModularTemplate
local function UpdateThirdSubCategory(selectedMod, selectedCat)
	ClearLootContent()
    debugPrint("UpdateSubCategory: Updating thirdDropdown for selected subSubCat:", selectedCat)
    UIDropDownMenu_ClearAll(thirdDropdown)
    UIDropDownMenu_SetText(thirdDropdown, selectedMod.subcategoryTwoText)

    -- Get the thirdSubCatList for the selected category
    local thirdDropdownValues = nil
    if selectedMod[selectedCat] then
        thirdDropdownValues = selectedMod[selectedCat].thirdSubCatList
    end

    debugPrint("Retrieved third dropdown values for category:", selectedCat)
    if thirdDropdownValues then
        for _, value in ipairs(thirdDropdownValues) do
            debugPrint(" - " .. value)
        end
    else
        debugPrint("No third dropdown values found for category:", selectedCat)
        return  -- Exit early if no values found
    end
    -- Initialize the dropdown menu
    UIDropDownMenu_Initialize(thirdDropdown, function(self, level)
        for _, value in ipairs(thirdDropdownValues) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = value  -- Set the text for the dropdown option
            info.func = function()
                UIDropDownMenu_SetText(thirdDropdown, value)
                UpdateLootTable(selectedCat, value)  -- Assuming value is used here
            end
            UIDropDownMenu_AddButton(info)
        end
    end)
end


-- Update Subcategory Dropdown
-- ********************************
-- *****HERE TO ADD NEW MODULE*****
-- ********************************
local function UpdateSubcategoryDropdown(selectedModule)
    debugPrint("Updating subcategory dropdown for module:", selectedModule)
    -- Clear dropdowns and loot content
    UIDropDownMenu_ClearAll(subcategoryDropdown)
    UIDropDownMenu_ClearAll(thirdDropdown)
    UIDropDownMenu_SetText(thirdDropdown, "")    
	ClearLootContent() 
    -- Add new modules here if needed
    local modules = {RareDropTable = WORS_Loot_RDT_Data, Weapons = WORS_Loot_Weapons_Data, Armour = WORS_Loot_Armour_Data, Slayer = WORS_Loot_Slayer_Data, Skills = WORS_Loot_Skill_Data, Memes = WORS_Loot_Meme_Data, Bosses = WORS_Loot_Boss_Data,}

    local moduleData = modules[selectedModule]
    if moduleData then
        -- Set the first level dropdown text from the module data
        UIDropDownMenu_SetText(subcategoryDropdown, moduleData.subcategoryOneText)
        -- Retrieve subTwoCat from the module data file
        local subTwoCat = moduleData.subTwoCat or {}
        debugPrint("subTwoCat: ", subTwoCat)  -- Check if this is populated correctly        
        -- Initialize the subcategory dropdown
        UIDropDownMenu_Initialize(subcategoryDropdown, function(self, level)
            for _, cat in ipairs(subTwoCat) do
                local info = UIDropDownMenu_CreateInfo()
                info.text = cat
                info.func = function()
                    UIDropDownMenu_SetText(subcategoryDropdown, cat)
                    UpdateThirdSubCategory(moduleData, cat)
                end
                UIDropDownMenu_AddButton(info)
            end
        end)
        thirdDropdown:Show()
    else
        debugPrint("Selected module not found in modules table:", selectedModule)
    end
end


-- Module Dropdown Logic
-- ********************************
-- *****HERE TO ADD NEW MODULE*****
-- ********************************
UIDropDownMenu_Initialize(moduleDropdown, function(self, level)
	-- Add Module name bellow to add to first dropdown menu
    local modules = {"Armour", "Weapons", "Bosses", "RareDropTable", "Slayer", "Skills", "Memes"}
    for _, module in ipairs(modules) do
        local info = UIDropDownMenu_CreateInfo()
        info.text = module
        info.func = function()
            UIDropDownMenu_SetText(moduleDropdown, module)
            UpdateSubcategoryDropdown(module)
        end
        UIDropDownMenu_AddButton(info)
    end
end)

function loadLootTransparency()
    -- Check if the transparency value exists in WORS_LootData
    if WORS_LootData.transparency then
        -- Apply the saved transparency value to the WORS_Loot frame
        debugPrint("WORS Loot: Transparency set to " .. (WORS_LootData.transparency * 100) .. "%.")
        WORS_Loot:SetAlpha(WORS_LootData.transparency)
    else
        -- Default behavior if no saved transparency value is found
        WORS_LootData.transparency = 1.0  -- Default to 100% transparency
        debugPrint("WORS Loot: Transparency set to 100%.")
        WORS_Loot:SetAlpha(1.0)
    end
end


function toggleLootTransparency()
    -- Toggle transparency between 50% (0.5) and 100% (1.0)
    if WORS_LootData.transparency == 1.0 then
        WORS_LootData.transparency = 0.5
        debugPrint("WORS Loot: Transparency set to 50%.")
    else
        WORS_LootData.transparency = 1.0
        debugPrint("WORS Loot: Transparency set to 100%.")
    end
    WORS_Loot:SetAlpha(WORS_LootData.transparency)
end


-- Toggle Command for Frame Visibility
SLASH_WORS_LOOT1 = "/worsloot"
SlashCmdList["WORS_LOOT"] = function()
    if WORS_Loot:IsVisible() then
        WORS_Loot:Hide()
    else
        WORS_Loot:Show()
    end
end

-- Define the slash command for debugging
SLASH_LOOT_DEBUG1 = "/lootdebug"
--SlashCmdList["LOOT_DEBUG"] = toggleDebugMode
SlashCmdList["LOOT_DEBUG"] = function()
    WORS_LootData.debugMode = not WORS_LootData.debugMode  -- Toggle the boolean value
    if WORS_LootData.debugMode then
        print("Debug mode is now ON.")
    else
        print("Debug mode is now OFF.")
    end
end



-- Minimap Icon for WORS_Loot using LibDBIcon and Ace3
local addon = LibStub("AceAddon-3.0"):NewAddon("WORS_Loot")
WORSLootMinimapButton = LibStub("LibDBIcon-1.0", true)
local miniButton = LibStub("LibDataBroker-1.1"):NewDataObject("WORS_Loot", {
	type = "data source",
	text = "Loot Tables",
	icon = "Interface\\Icons\\INV_Misc_Bag_CoreFelclothBag",
	OnClick = function(self, btn)
        if btn == "LeftButton" then
            if WORS_Loot:IsShown() then
                WORS_Loot:Hide()
            else
                WORS_Loot:Show()
            end
        elseif btn == "RightButton" then
			if WORS_Loot:IsShown() then
                toggleLootTransparency()
            else
                WORS_Loot:Show()
				toggleLootTransparency()
            end
        end
	end,
	OnTooltipShow = function(tooltip)
		if not tooltip or not tooltip.AddLine then
			return
		end
		tooltip:AddLine("Loot Tables\nLeft-click: Toggle Loot Tables Window", nil, nil, nil, nil)
		tooltip:AddLine("Right-click: Toggle Transparency 50% or 100%", nil, nil, nil, nil)
	end,
})
function addon:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("WORSLootMinimapDB", {
		profile = {
			minimap = {
				hide = false,
					minimapPos = 145, -- This is the hardcoded position (in degrees)
			},
		},
	})
	WORSLootMinimapButton:Register("WORS_Loot", miniButton, self.db.profile.minimap)
end