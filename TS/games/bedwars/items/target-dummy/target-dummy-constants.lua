local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local v4 = 10 * v3
local v5 = 5 * v3
local v6 = 4 * v3
local v7 = v2:IsStudio() and 15 or 30
local v8 = {}
local v9 = setmetatable({}, {
    ["__index"] = v8
})
v9.SPAWNING = 0
v8[0] = "SPAWNING"
v9.IDLE = 1
v8[1] = "IDLE"
v9.ROTATING = 2
v8[2] = "ROTATING"
v9.AGGRO = 3
v8[3] = "AGGRO"
local v10 = {}
local v11 = setmetatable({}, {
    ["__index"] = v10
})
v11.ALERT = "alert"
v10.alert = "ALERT"
v11.SOLO_ATTACK = "solo_attack"
v10.solo_attack = "SOLO_ATTACK"
v11.SPIN_ATTACK = "spin_attack"
v10.spin_attack = "SPIN_ATTACK"
v11.RANGED_ATTACK = "ranged_attack"
v10.ranged_attack = "RANGED_ATTACK"
v11.REMOVE_TARGET = "remove_target"
v10.remove_target = "REMOVE_TARGET"
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 84 ]]
        return "TargetDummyConstants"
    end
})
u12.__index = u12
function u12.new(...) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(_) --[[ Line: 93 ]] end
return {
    ["TARGET_DUMMY_DEFAULT_HITPOINTS"] = 500,
    ["TARGET_DUMMY_DIAMOND_HITPOINTS"] = 750,
    ["TARGET_DUMMY_EMERALD_HITPOINTS"] = 1000,
    ["TARGET_DUMMY_ENLIGHTENED_HITPOINTS"] = 1500,
    ["TARGET_DUMMY_INITIAL_IDLE_TIME"] = 1,
    ["TARGET_DUMMY_MAX_PLACED"] = 1,
    ["TARGET_DUMMY_SOLO_ATTACK_DAMAGE"] = 40,
    ["TARGET_DUMMY_SPIN_ATTACK_DAMAGE"] = 50,
    ["TARGET_DUMMY_RANGE_ATTACK_DAMAGE"] = 60,
    ["TARGET_DUMMY_ATTACK_COOLDOWN"] = 1,
    ["TARGET_DUMMY_SOLO_ATTACK_COOLDOWN"] = 1,
    ["TARGET_DUMMY_SPIN_ATTACK_COOLDOWN"] = 2,
    ["TARGET_DUMMY_RANGED_ATTACK_COOLDOWN"] = 6,
    ["TARGET_DUMMY_DAMAGE_DELAY"] = 0.5,
    ["TARGET_DUMMY_RANGED_DAMAGE_DELAY"] = 1.5,
    ["TARGET_DUMMY_IDLE_TIME_RANGE"] = { 1, 2 },
    ["TARGET_DUMMY_MAXIMUM_RANGE"] = v4,
    ["TARGET_DUMMY_SOLO_ATTACK_RANGE"] = v5,
    ["TARGET_DUMMY_SPIN_ATTACK_RANGE"] = v6,
    ["TARGET_DUMMY_ALERT_COOLDOWN"] = v7,
    ["TargetDummyState"] = v9,
    ["TargetDummyAction"] = v11,
    ["TargetDummyConstants"] = u12
}