local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v6 = {
    ["WaterVeilDuration"] = 5,
    ["BoostedRegenPercent"] = 0.24,
    ["BoostedRegenRate"] = 0.8,
    ["ImmediateMissingHealthPercent"] = 0.15,
    ["WaterVeilRange"] = 13 * v3,
    ["WaterVeilMaxPlayers"] = 3,
    ["SelfHealReduction"] = 0.8,
    ["ProjectileRange"] = 14 * v3,
    ["ProjectileTravelTime"] = 0.35,
    ["ProjectileInterval"] = 0.1,
    ["ProjectileCooldown"] = 0.5,
    ["HealingColor"] = Color3.fromRGB(82, 207, 217),
    ["StackPerProjectile"] = 0.01,
    ["BuffDuration"] = 15,
    ["MaxBuffStacks"] = 20,
    ["DamageBuffColor"] = Color3.fromRGB(64, 74, 240),
    ["VesselItems"] = { v5.OASIS_VESSEL, v5.OASIS_VESSEL_2, v5.OASIS_VESSEL_3 }
}
local v7 = {}
local v8 = setmetatable({}, {
    ["__index"] = v7
})
v8.HEAL = 0
v7[0] = "HEAL"
v8.BUFF = 1
v7[1] = "BUFF"
local v9 = {
    [v8.HEAL] = {
        ["ImageSize"] = UDim2.fromScale(1, 1),
        ["TextLabelSize"] = UDim2.fromScale(0, 1),
        ["Icon"] = v4.OASIS_HEAL,
        ["Color"] = v6.HealingColor
    },
    [v8.BUFF] = {
        ["ImageSize"] = UDim2.fromScale(0.5, 1),
        ["TextLabelSize"] = UDim2.fromScale(0.5, 1),
        ["Icon"] = v4.OASIS_DAMAGE_BUFF,
        ["Color"] = v6.DamageBuffColor
    }
}
local v10 = {}
local v11 = setmetatable({}, {
    ["__index"] = v10
})
v11.TIER_1 = 1
v10[1] = "TIER_1"
v11.TIER_2 = 2
v10[2] = "TIER_2"
v11.TIER_3 = 3
v10[3] = "TIER_3"
local u12 = {
    [v11.TIER_1] = {
        ["healValuePerOrb"] = 1,
        ["buffValuePerOrb"] = 1,
        ["numberOrbs"] = 3,
        ["itemType"] = v5.OASIS_VESSEL
    },
    [v11.TIER_2] = {
        ["healValuePerOrb"] = 1,
        ["buffValuePerOrb"] = 1,
        ["numberOrbs"] = 4,
        ["itemType"] = v5.OASIS_VESSEL_2
    },
    [v11.TIER_3] = {
        ["healValuePerOrb"] = 1,
        ["buffValuePerOrb"] = 1,
        ["numberOrbs"] = 5,
        ["itemType"] = v5.OASIS_VESSEL_3
    }
}
return {
    ["getOasisVesselTierFromItem"] = function(p13) --[[ Name: getOasisVesselTierFromItem, Line 120 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u12
        --]]
        local v14 = nil
        for v15, v16 in u2.keys(u12) do
            local _ = v15 - 1
            if u12[v16].itemType == p13 == true then
                return v16
            end
        end
        return v14
    end,
    ["OasisBalance"] = v6,
    ["OasisVesselMode"] = v8,
    ["OasisTargetIndicator"] = v9,
    ["OasisVesselTier"] = v11,
    ["OasisVesselScaling"] = u12
}