local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").ARMOR_SCALE
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v5 = {
    ["ProgressPerIron"] = 1,
    ["IronPerConsume"] = 10,
    ["ProgressPerEmerald"] = 1,
    ["EmeraldPerConsume"] = 1,
    ["ProgressPerMeleeDamage"] = 0.005,
    ["ProgressPerProjectileDamage"] = 0.002,
    ["ProgressPerKill"] = 1,
    ["ResourceProgressBarColor"] = Color3.fromRGB(167, 102, 208),
    ["KillProgressBarColor"] = Color3.fromRGB(220, 100, 100),
    ["GoldenChosenColor"] = Color3.fromRGB(218, 133, 65),
    ["AscendedDamageBoost"] = 1.2,
    ["AscendedHealthBoost"] = 1.3,
    ["AscendedDuration"] = 15
}
local v6 = {}
local v7 = setmetatable({}, {
    ["__index"] = v6
})
v7.BASE = 0
v6[0] = "BASE"
v7.ENHANCED = 1
v6[1] = "ENHANCED"
v7.EMPOWERED = 2
v6[2] = "EMPOWERED"
v7.CORRUPTED = 3
v6[3] = "CORRUPTED"
v7.CHOSEN = 4
v6[4] = "CHOSEN"
v5.ProgressTiers = v7
v5.SwordItems = {
    v4.NOCTIUM_BLADE,
    v4.NOCTIUM_BLADE_2,
    v4.NOCTIUM_BLADE_3,
    v4.NOCTIUM_BLADE_4
}
v5.TierAttribute = "VoidKnightTier"
v5.ProgressAttribute = "VoidKnightProgress"
v5.KillsAttribute = "VoidKnightKills"
v5.HaltedProgressAttribute = "VoidKnightHaltedProgress"
local u8 = {}
local v9 = v5.ProgressTiers.BASE
local v10 = {
    ["name"] = "Base Form",
    ["description"] = "",
    ["icon"] = v2.VOID_KNIGHT_TIER_1,
    ["progressionRequirements"] = {
        ["resourceCount"] = 90,
        ["killsAssists"] = 1,
        ["resourceType"] = v4.IRON
    },
    ["swordItem"] = v4.NOCTIUM_BLADE,
    ["armorValues"] = { v3 * 1.5, v3 * 2, v3 * 1 }
}
u8[v9] = v10
local v11 = v5.ProgressTiers.ENHANCED
local v12 = {
    ["name"] = "Enhanced Form",
    ["description"] = "You have grown stronger, the Void enhances your abilities.",
    ["icon"] = v2.VOID_KNIGHT_TIER_2,
    ["progressionRequirements"] = {
        ["resourceCount"] = 160,
        ["killsAssists"] = 2,
        ["resourceType"] = v4.IRON
    },
    ["swordItem"] = v4.NOCTIUM_BLADE_2,
    ["armorValues"] = { v3 * 3, v3 * 4, v3 * 2 }
}
u8[v11] = v12
local v13 = v5.ProgressTiers.EMPOWERED
local v14 = {
    ["name"] = "Empowered Form",
    ["description"] = "You have grown stronger, the Void empowers your abilities with decay.",
    ["unlocksDecay"] = true,
    ["icon"] = v2.VOID_KNIGHT_TIER_3,
    ["progressionRequirements"] = {
        ["resourceCount"] = 12,
        ["killsAssists"] = 4,
        ["resourceType"] = v4.EMERALD
    },
    ["swordItem"] = v4.NOCTIUM_BLADE_3,
    ["armorValues"] = { v3 * 6, v3 * 6, v3 * 3 }
}
u8[v13] = v14
local v15 = v5.ProgressTiers.CORRUPTED
local v16 = {
    ["name"] = "Corrupted Form",
    ["description"] = "You have become corrupted, the Void shields you from harm.",
    ["unlocksDecay"] = true,
    ["unlocksShield"] = true,
    ["icon"] = v2.VOID_KNIGHT_TIER_4,
    ["progressionRequirements"] = {
        ["resourceCount"] = 48,
        ["killsAssists"] = 6,
        ["resourceType"] = v4.EMERALD
    },
    ["swordItem"] = v4.NOCTIUM_BLADE_4,
    ["armorValues"] = { v3 * 6, v3 * 8, v3 * 5 }
}
u8[v15] = v16
u8[v5.ProgressTiers.CHOSEN] = {
    ["name"] = "Chosen Form",
    ["description"] = "You have been chosen, the Void grants you its full power.",
    ["unlocksDecay"] = true,
    ["unlocksShield"] = true,
    ["unlocksAscendancy"] = true,
    ["icon"] = v2.VOID_KNIGHT_TIER_5,
    ["swordItem"] = v4.NOCTIUM_BLADE_4,
    ["armorValues"] = { v3 * 6, v3 * 10, v3 * 5 }
}
return {
    ["getVoidKnightDefinitionForTier"] = function(p17) --[[ Name: getVoidKnightDefinitionForTier, Line 129 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        return u8[p17]
    end,
    ["VoidKnightBalance"] = v5,
    ["VoidKnightTierDefinitions"] = u8
}