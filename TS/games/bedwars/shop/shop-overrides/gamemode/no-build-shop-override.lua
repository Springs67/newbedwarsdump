local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride
local u7 = {
    v5.BEEHIVE,
    v5.SNAP_TRAP,
    v5.PINATA,
    v5.SMOKE_BLOCK,
    v5.HEAL_BANNER,
    v5.DAMAGE_BANNER,
    v5.DEFENSE_BANNER,
    v5.ALCHEMIST_FLASK
}
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "NoBuildShopOverride"
    end,
    ["__index"] = u6
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11, ...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p11, ...)
end
function u8.shouldApply(_, _) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local v12 = u2:GetAttribute("QueueType")
    if v12 then
        v12 = v12 == u3.BEDWARS_NB4
    end
    return v12
end
function u8.getOverride(_, _, p13) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
    --]]
    local v14 = {}
    for v15, _ in p13 do
        if u4(v15).block and table.find(u7, v15) == nil then
            table.insert(v14, {
                ["disabled"] = true,
                ["itemType"] = v15
            })
        end
    end
    return v14
end
return {
    ["default"] = u8.new()
}