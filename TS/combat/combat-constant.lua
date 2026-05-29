local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ConstantManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
return {
    ["CombatConstant"] = {
        ["RAYCAST_SWORD_CHARACTER_DISTANCE"] = 4.8 * v3,
        ["REGION_SWORD_CHARACTER_DISTANCE"] = 4.2 * v3
    },
    ["SwordsConstants"] = v2.registerConstants(script, {
        ["swordSwingBufferMultiplier"] = 0.4
    })
}