local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
return {
    ["FrankensteinCurseBalance"] = {
        ["LIGHTNING_DISCHARGE_INTERVAL_SEC"] = 5,
        ["COIL_LIGHTNING_DISCHARGE_INTERVAL_SEC"] = 5,
        ["LIGHTNING_DISCHARGE_RADIUS"] = 7 * v1,
        ["COIL_LIGHTNING_DISCHARGE_RADIUS"] = 13 * v1,
        ["LIGHTNING_DAMAGE"] = 20,
        ["COIL_LIGHTNING_DAMAGE"] = 20,
        ["LIGHTNING_COIL_HEALTH"] = 60,
        ["BECOME_MONSTER_REQ_INTERVAL_SEC"] = 10,
        ["BECOME_MONSTER_REQ_CHARGES"] = 4,
        ["FRANKENSTEIN_MONSTER_DURATION_SEC"] = 45,
        ["FRANKENSTEIN_CHARGE_LEAD_TIME_SEC"] = 2
    }
}