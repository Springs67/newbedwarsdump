local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").SetUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shop", "shop-item-lock-cause").ShopItemLockCause
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "ShopUtil"
    end
})
u7.__index = u7
function u7.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(_) --[[ Line: 21 ]] end
function u7.getMaxStackForPlayer(_, _, p10) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v11 = u5(p10).maxStackSize
    if v11 ~= nil then
        v11 = v11.amount
    end
    return v11
end
function u7.isItemLocked(p12, p13, p14) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    if p14.locked then
        return p14.locked
    elseif p12:ownsSuperiorItem(p13, p14) then
        return u6.DOWNGRADE
    else
        return nil
    end
end
function u7.ownsSuperiorItem(p15, p16, p17) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    for _, v18 in p15:getAllSuperiorItems(p16, p17) do
        if u4.hasEnough(p16, v18, 1) then
            return true
        end
    end
    return false
end
function u7.getAllSuperiorItems(_, p19, p20) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    local v21
    if p20 == nil then
        v21 = p20
    else
        v21 = p20.superiorItems
    end
    if not v21 then
        return {}
    end
    local v22 = {}
    local v23 = #v22
    local v24 = p20.superiorItems
    table.move(v24, 1, #v24, v23 + 1, v22)
    local v25 = {}
    local v26 = nil
    while true do
        local v27 = #v22
        local v28 = v22[v27]
        v22[v27] = nil
        if v28 == nil then
            break
        end
        v25[v28] = true
        if not v26 then
            v26 = {}
            for _, v29 in u3.getShop(p19) do
                v26[v29.itemType] = v29
            end
        end
        local v30 = v26[v28]
        local v31
        if v30 == nil then
            v31 = v30
        else
            v31 = v30.superiorItems
        end
        if v31 then
            for v32, v33 in v30.superiorItems do
                local _ = v32 - 1
                if v25[v33] == nil then
                    table.insert(v22, v33)
                end
            end
        end
    end
    return u2.values(v25)
end
function u7.getAllPreviousTieredItems(_, p34, p35) --[[ Line: 108 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    local v36
    if p35 == nil then
        v36 = p35
    else
        v36 = p35.prevTier
    end
    if not v36 then
        return {}
    end
    local v37 = {}
    while p35.prevTier do
        v37[p35.prevTier] = true
        p35 = u3.getShopItem(p35.prevTier, p34)
        if not p35 then
            break
        end
    end
    return u2.values(v37)
end
function u7.getAllSuperiorItemsByItemType(p38, p39, p40) --[[ Line: 129 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v41 = u3.getShopItem(p40, p39)
    return not v41 and {} or p38:getAllSuperiorItems(p39, v41)
end
return {
    ["ShopUtil"] = u7
}