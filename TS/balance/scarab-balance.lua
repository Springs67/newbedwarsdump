return {
    ["ScarabBalance"] = {
        ["scarabHealthDecay"] = 10,
        ["scarabHealthDecayInterval"] = 0.5,
        ["movementSpeed"] = {
            15,
            17,
            20,
            22
        },
        ["damage"] = {
            2,
            4,
            6,
            8
        },
        ["health"] = {
            140,
            165,
            190,
            220
        },
        ["maxDistanceFromSpawner"] = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE * 24,
        ["hiveDuration"] = {
            10,
            13,
            16,
            16
        },
        ["cooldown"] = 20,
        ["spawnCooldown"] = 4.5,
        ["blockDamage"] = {
            10,
            15,
            23,
            30
        },
        ["hiveHealth"] = {
            25,
            30,
            35,
            40
        }
    }
}