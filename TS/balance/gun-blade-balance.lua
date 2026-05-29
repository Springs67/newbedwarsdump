local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u5 = {
    u4.WOOD_GUN_BLADE,
    u4.STONE_GUN_BLADE,
    u4.IRON_GUN_BLADE,
    u4.DIAMOND_GUN_BLADE,
    u4.EMERALD_GUN_BLADE
}
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "GunBladeUtil"
    end
})
u6.__index = u6
function u6.new(...) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(_) --[[ Line: 19 ]] end
function u6.isGunBlade(_, p9) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return table.find(u5, p9) ~= nil
end
function u6.createClone(_, p10) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
    --]]
    if p10 == u4.WOOD_GUN_BLADE then
        return u2.Assets.Effects.WoodCutlass:Clone()
    end
    if p10 == u4.STONE_GUN_BLADE then
        return u2.Assets.Effects.StoneCutlass:Clone()
    end
    if p10 == u4.IRON_GUN_BLADE then
        return u2.Assets.Effects.IronCutlass:Clone()
    end
    if p10 == u4.DIAMOND_GUN_BLADE then
        return u2.Assets.Effects.DiamondCutlass:Clone()
    end
    if p10 == u4.EMERALD_GUN_BLADE then
        return u2.Assets.Effects.EmeraldCutlass:Clone()
    end
end
return {
    ["GunBladeUtil"] = u6,
    ["GunBladeBalance"] = {
        ["MARK_DURATION"] = 8,
        ["MARK_SPEED_MULTIPLIER"] = 1.2,
        ["BLEED_ARMOR_MULTIPLIER"] = 0.7,
        ["GUN_RANGE"] = 8 * v3,
        ["GUN_COOLDOWN"] = 8
    }
}