local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopFilter
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "PenguinSurvivalShopFilter"
    end,
    ["__index"] = u6
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10, ...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p10, ...)
end
function u7.apply(p11, p12, p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local v14 = u2:GetAttribute("GameType")
    if not v14 or v14 ~= u3.SURVIVAL then
        return p13
    end
    local v15 = p11:getInvalidItems(p12, p13)
    local v16 = 0
    local v17 = {}
    for v18, v19 in p13 do
        local _ = v18 - 1
        local v20 = v19.itemType
        if table.find(v15, v20) == nil == true then
            v16 = v16 + 1
            v17[v16] = v19
        end
    end
    return v17
end
function u7.getInvalidItems(_, _, _) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    local v21 = {
        u4.TELEPEARL,
        u4.TNT,
        u4.SIEGE_TNT,
        u4.GLUE_PROJECTILE,
        u4.SHEARS
    }
    local v22 = #v21
    local v23 = u5.Pickaxes
    local v24 = #v23
    table.move(v23, 1, v24, v22 + 1, v21)
    local v25 = v22 + v24
    local v26 = u5.Axes
    table.move(v26, 1, #v26, v25 + 1, v21)
    return v21
end
return {
    ["PenguinSurvivalShopFilter"] = u7,
    ["default"] = u7.new()
}