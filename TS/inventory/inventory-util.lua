local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot
local u5 = {}
local function u25(p6) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u3
    --]]
    local v7 = u2.values(u4)
    local v8 = table.create(#v7)
    local v9 = {
        ["hand"] = nil,
        ["items"] = {}
    }
    for v10, _ in v7 do
        local _ = v10 - 1
        v8[v10] = "empty"
    end
    v9.armor = v8
    v9.backpack = nil
    if p6.UserId ~= nil then
        p6 = u3:getEntity(p6)
    end
    if not p6 then
        return v9
    end
    local v11 = p6:getInventoryFolder()
    if v11 then
        for _, v12 in v11:GetChildren() do
            local v13 = v9.items
            local v14 = {
                ["tool"] = v12,
                ["itemType"] = v12.Name,
                ["amount"] = v12:GetAttribute("Amount"),
                ["addedToBackpackTime"] = v12:GetAttribute("AddedToBackpackTime"),
                ["itemSkin"] = v12:GetAttribute("ItemSkin")
            }
            table.insert(v13, v14)
        end
    end
    local v15 = false
    local v16 = 0
    while true do
        if v15 then
            v16 = v16 + 1
        else
            v15 = true
        end
        if v16 >= #u2.keys(u4) then
            local v17 = p6:getInstance():FindFirstChild("BedWarsBackpackSlot")
            local v18
            if v17 then
                if v17 == nil then
                    v18 = v17
                else
                    v18 = v17.Value
                end
            else
                v18 = v17
            end
            if v18 then
                local v19 = v17.Value
                v9.backpack = {
                    ["tool"] = v19,
                    ["itemType"] = v19.Name,
                    ["amount"] = v19:GetAttribute("Amount"),
                    ["addedToBackpackTime"] = v19:GetAttribute("AddedToBackpackTime"),
                    ["itemSkin"] = v19:GetAttribute("ItemSkin")
                }
            end
            local v20 = p6:getItemInHand()
            if v20 then
                v9.hand = {
                    ["tool"] = v20,
                    ["itemType"] = v20.Name,
                    ["amount"] = v20:GetAttribute("Amount"),
                    ["addedToBackpackTime"] = v20:GetAttribute("AddedToBackpackTime"),
                    ["itemSkin"] = v20:GetAttribute("ItemSkin")
                }
            end
            return v9
        end
        local v21 = p6:getInstance():FindFirstChild("ArmorInvItem_" .. tostring(v16))
        if v21 and v21.Value then
            local v22 = v21.Value
            local v23 = v9.armor
            local v24 = {
                ["tool"] = v22,
                ["itemType"] = v22.Name,
                ["amount"] = v22:GetAttribute("Amount"),
                ["addedToBackpackTime"] = v22:GetAttribute("AddedToBackpackTime"),
                ["itemSkin"] = v22:GetAttribute("ItemSkin")
            }
            table.insert(v23, v24)
        end
    end
end
u5.getInventory = u25
function u5.getToolFromInventory(p26, p27) --[[ Line: 108 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v28 = nil
    for v29, v30 in u25(p26).items do
        local _ = v29 - 1
        if v30.itemType == p27 == true then
            return v30
        end
    end
    return v28
end
function u5.hasEnough(p31, p32, p33) --[[ Line: 125 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    if p33 < 0 then
        return false
    end
    if p33 ~= p33 then
        return false
    end
    if type(p33) ~= "number" then
        return false
    end
    local v34 = u5.getInventory(p31)
    local v35 = 0
    local v36 = v35
    local v37 = {}
    for v38, v39 in v34.items do
        local _ = v38 - 1
        if v37[v39.tool] == nil then
            v37[v39.tool] = true
            if v39.itemType == p32 then
                v35 = v36 + v39.amount
                v36 = v35
            end
        end
    end
    return p33 <= v36
end
function u5.getAmount(p40, p41) --[[ Line: 158 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v42 = u5.getInventory(p40)
    local v43 = 0
    local v44 = v43
    local v45 = {}
    for v46, v47 in v42.items do
        local _ = v46 - 1
        if v45[v47.tool] == nil then
            v45[v47.tool] = true
            if v47.itemType == p41 then
                v43 = v44 + v47.amount
                v44 = v43
            end
        end
    end
    return v44
end
return {
    ["InventoryUtil"] = u5
}