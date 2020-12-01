-- Add to in-game tooltips at mouse over (Like atlas loot)
GameTooltip:HookScript("OnTooltipSetItem", function(tooltip, ...)
    addToolTip(tooltip)
end)

-- Add to in-game tooltips on click (Like chat links)
ItemRefTooltip:HookScript("OnTooltipSetItem", function(tooltip, ...)
    addToolTip(tooltip)
end)

function addToolTip(tooltip)
    local itemname, itemlink = tooltip:GetItem()
    
    if itemlink then
      priority = searchForItemPrio(itemlink:match("item:(%d+):"))
    end
  
    if priority then
        priority = string.format("%s", priority)
        priority = classColour(priority)
        tooltip:AddLine("|cFFE6007EPriority|r: "..priority, 1, 1, 1)

        note = searchForItemNote(itemlink:match("item:(%d+):"))
        if note ~= "" then
            note = string.format("%s", note)
            tooltip:AddLine("|cFFE6007ENote|r: "..note, 1, 1, 1)
        end
    end
end

-- Add class colours to each string returned from the loot tables
function classColour(priority) 
    priority = priority:gsub("Druid", "|cFFFF7C0ADruid|r")
    priority = priority:gsub("Hunter", "|cFFAAD372Hunter|r")
    priority = priority:gsub("Mage", "|cFF3FC7EBMage|r")
    priority = priority:gsub("Priest", "|cFFFFFFFFPriest|r")
    priority = priority:gsub("Rogue", "|cFFFFF468Rogue|r")
    priority = priority:gsub("Shaman", "|cFF0070DDShaman|r")
    priority = priority:gsub("Warlock", "|cFF8788EEWarlock|r")
    priority = priority:gsub("Warrior", "|cFFC69B6DWarrior|r")
    return priority
end

-- look for a item priority from the relevant loot table
function searchForItemPrio(itemname)
    for index, value in next, Naxxramas_Loot do
        if value["itemid"] == itemname then
            return value["classPriority"]
        end
    end
end

-- look for a item note from the relevant loot table
function searchForItemNote(itemname)
    for index, value in next, Naxxramas_Loot do
        if value["itemid"] == itemname then
            return value["note"]
        end
    end
end