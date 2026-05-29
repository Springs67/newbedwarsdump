local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local v4 = {
    ["SPELL_TIER_1_DATA"] = {
        ["castTime"] = 0.7,
        ["damage"] = 30,
        ["hitsToLevelUp"] = 1,
        ["maxRadius"] = 5 * v3
    },
    ["SPELL_TIER_2_DATA"] = {
        ["castTime"] = 0.8,
        ["damage"] = 44,
        ["hitsToLevelUp"] = 2,
        ["maxRadius"] = 7 * v3
    },
    ["SPELL_TIER_3_DATA"] = {
        ["castTime"] = 1,
        ["damage"] = 54,
        ["hitsToLevelUp"] = 3,
        ["maxRadius"] = 9 * v3
    },
    ["SPELL_TIER_4_DATA"] = {
        ["castTime"] = 1.2,
        ["damage"] = 72,
        ["hitsToLevelUp"] = nil,
        ["maxRadius"] = 12 * v3
    },
    ["SPELL_COOLDOWN"] = v2:IsStudio() and 10 or 22,
    ["CIRCLE_MIN_RADIUS"] = 1 * v3,
    ["CIRCLE_HEIGHT"] = 5 * v3,
    ["SPELL_DAMAGE_REDUCTION_MULTIPLIER"] = 0.9,
    ["SPELL_MINIMUM_CAST_TIME"] = 0.5,
    ["CASTING_MOVE_SPEED_MULTIPLIER"] = 0.85,
    ["CLAW_TIER_1_DATA"] = {
        ["level"] = 1,
        ["damage"] = 23
    },
    ["CLAW_TIER_2_DATA"] = {
        ["level"] = 2,
        ["damage"] = 29
    },
    ["CLAW_TIER_3_DATA"] = {
        ["level"] = 3,
        ["damage"] = 43
    },
    ["CLAW_TIER_4_DATA"] = {
        ["level"] = 4,
        ["damage"] = 56
    }
}
local v5 = 4.5 * v3
local v6 = 2 * v3
local v7 = 6.5 * v3
v4.CLAW_HITBOX_DIMENSIONS = Vector3.new(v5, v6, v7)
v4.CLAW_COOLDOWN = 0.55
v4.CLAW_CAN_HIT_THROUGH_BLOCKS = false
v4.SUMMON_CAN_HIT_THROUGH_BLOCKS = false
return {
    ["SummonerKitBalance"] = v4
}