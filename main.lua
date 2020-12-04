-- Add to in-game tooltips at mouse over (Like atlas loot)
GameTooltip:HookScript("OnTooltipSetItem", function(tooltip, ...)
    addToolTip(tooltip)
end)

-- Add to in-game tooltips on click (Like chat links)
ItemRefTooltip:HookScript("OnTooltipSetItem", function(tooltip, ...)
    addToolTip(tooltip)
end)

function addToolTip(tooltip)
    local itemName, itemLink = tooltip:GetItem()
    
    if itemLink then
      priority, note = searchForItemPrioAndNote(itemLink:match("item:(%d+):")) -- Using the in-game item link find the Item ID in the string and search through the table to find a match.
    end
  
    if priority then
        if priority ~= "" then
            priority = string.format("%s", priority)
            priority = classColour(priority)
            tooltip:AddLine("|cFFE6007EPriority|r: "..priority, 1, 1, 1) -- "Priority:" = Pink, anything else is default white
    
            if note ~= "" then
                note = string.format("%s", note)
                note = classColour(note)
                tooltip:AddLine("|cFFE6007ENote|r: "..note, 1, 1, 1) -- "Note:" = Pink, anything else is default white
            end

        elseif priority = "NoteOnly" then
            if note ~= "" then
                note = string.format("%s", note)
                note = classColour(note)
                tooltip:AddLine("|cFFE6007ENote|r: "..note, 1, 1, 1) -- "Note:" = Pink, anything else is default white
            end
        end
    end
end

-- Add class colours to each string returned from the loot tables
function classColour(class)

    -- Default Wow Classic class colours
    class = class:gsub("Druid", "|cFFFF7C0ADruid|r")
    class = class:gsub("Hunter", "|cFFAAD372Hunter|r")
    class = class:gsub("Mage", "|cFF3FC7EBMage|r")
    class = class:gsub("Paladin", "|cFFF48CBAPaladin|r")
    class = class:gsub("Priest", "|cFFFFFFFFPriest|r")
    class = class:gsub("Rogue", "|cFFFFF468Rogue|r")
    class = class:gsub("Shaman", "|cFF0070DDShaman|r")
    class = class:gsub("Warlock", "|cFF8788EEWarlock|r")
    class = class:gsub("Warrior", "|cFFC69B6DWarrior|r")

    -- Custom Names / Strings
    class = class:gsub("Alopias", "|cFF3FC7EBAlopias|r") -- Mage
    class = class:gsub("Kelthiz", "|cFFFFFFFFKelthiz|r") -- Priest
    class = class:gsub("Zynnea", "|cFF8788EEZynnea|r") -- Warlock

    return class
end

-- look for class priority & note from the relevant loot table
function searchForItemPrioAndNote(itemId)
    for index, value in next, moltenCore do
        if value["itemId"] == itemId then
            return value["classPriority"], value["note"]
        end
    end

    for index, value in next, blackWingLair do
        if value["itemId"] == itemId then
            return value["classPriority"], value["note"]
        end
    end

    for index, value in next, zulGurub do
        if value["itemId"] == itemId then
            return value["classPriority"], value["note"]
        end
    end

    for index, value in next, ahnQirajRuins do
        if value["itemId"] == itemId then
            return value["classPriority"], value["note"]
        end
    end

    for index, value in next, ahnQirajTemple do
        if value["itemId"] == itemId then
            return value["classPriority"], value["note"]
        end
    end

    for index, value in next, naxxramas do
        if value["itemId"] == itemId then
            return value["classPriority"], value["note"]
        end
    end

    for index, value in next, miscItems do
        if value["itemId"] == itemId then
            return value["classPriority"], value["note"]
        end
    end
end