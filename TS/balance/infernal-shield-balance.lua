return {
    ["InfernalShieldBalance"] = {
        ["SHIELDER_PROTECTION_RADIUS"] = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE * 6.5,
        ["SHIELDER_PASSIVE_DAMAGE_REDUCTION"] = 10,
        ["SHIELDER_SHIELD_RAISED_DAMAGE_REDUCTION"] = 30,
        ["SHIELDER_ULT_DAMAGE_REDUCTION"] = 20,
        ["SHIELD_ULT_CHARGE_REQ"] = 150,
        ["SHIELD_ULT_DAMAGE"] = 30,
        ["SHIELD_ULT_BURN_DURATION"] = 3,
        ["SHIELD_ULT_RADIUS"] = 15,
        ["SHIELD_ULT_RANGE"] = 150,
        ["SHIELD_ULT_CHARGE_PER_REFLECTED_PROJECTILE"] = 5,
        ["SHIELD_ULT_CHARGE_PER_SECOND"] = 0.5,
        ["SHIELD_MAX_ENERGY"] = 120,
        ["SHIELD_ENERGY_DRAIN_PER_SECOND"] = 3,
        ["SHIELD_ENERGY_RECOVERY_PER_SECOND"] = 8,
        ["SHIELD_ENERGY_RECOVERY_PER_REFLECTED_PROJECTILE"] = 5,
        ["SHIELD_ENERGY_RECOVERY_PER_DAMAGE_REDUCTION"] = 4
    }
}