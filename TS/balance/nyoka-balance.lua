local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local v4 = {
    ["MIN_HEAL_RADIUS"] = v3 * 2.5,
    ["MAX_HEAL_RADIUS"] = v3 * 3.5,
    ["HEAL_TICK_RATE"] = 0.3,
    ["DEFAULT_HEAL_AMOUNT_PER_TICK"] = 7,
    ["MENDING_CANOPY_STAFF_DEFAULT_MANA"] = 100,
    ["MANA_COST_PER_TICK"] = 2,
    ["MENDING_CANOPY_STAFF_MANA_REGEN_AMOUNT_PER_TICK"] = 1.5
}
v2:IsStudio()
local v5 = 0.25
v4.STAFF_CHARGE_TICK_RATE = v5
v4.STAFF_MAX_CHARGE = 100
v4.STAFF_CHARGE_PER_TICK = 3
v4.STAFF_CHARGE_DECAY_TICK_RATE = 1
v4.STAFF_CHARGE_DECAY_AMOUNT_PER_TICK = 4
v4.STAFF_KNOCKBACK_TICK_RATE = 0.3
v4.STAFF_KNOCKBACK_CHARGE_REQUIRED = 20
v4.STAFF_GLIDE_CHARGE_REQUIRED = 20
v4.STAFF_GLIDE_GRAVITY_MULTIPLIER = 0.7
return {
    ["NyokaBalance"] = v4
}