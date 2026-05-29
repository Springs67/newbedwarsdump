local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.HEAD_BOUNCE = 0
v2[0] = "HEAD_BOUNCE"
v3.RANDOM_WALK = 1
v2[1] = "RANDOM_WALK"
v3.GAS_CLOUD_CURSE = 2
v2[2] = "GAS_CLOUD_CURSE"
v3.BONE_THROW = 3
v2[3] = "BONE_THROW"
v3.BONE_OBSTACLE = 4
v2[4] = "BONE_OBSTACLE"
local v4 = {
    ["RandomWalkAction"] = {
        ["SPEED"] = 20
    },
    ["HeadBounceAction"] = {
        ["LAUNCH_HEIGHT"] = 100,
        ["DISSASSEMBLE_DURATION"] = 0.5,
        ["LAUNCH_DURATION"] = 3.25,
        ["REASSEMBLE_DELAY"] = 2,
        ["REASSEMBLE_DURATION"] = 2,
        ["LANDING_DAMAGE"] = 50,
        ["LANDING_KNOCKBACK_VERTICAL"] = {
            ["vertical"] = 2,
            ["horizontal"] = 3
        },
        ["LANDING_DAMAGE_RADIUS"] = v1 * 20
    },
    ["HeadBounceAllAction"] = {
        ["LAUNCH_HEIGHT"] = 70,
        ["DISSASSEMBLE_DURATION"] = 0.5,
        ["LAUNCH_DURATION"] = 2,
        ["REASSEMBLE_DELAY"] = 2,
        ["REASSEMBLE_DURATION"] = 2,
        ["LANDING_DAMAGE"] = 35,
        ["LANDING_KNOCKBACK_VERTICAL"] = {
            ["vertical"] = 2,
            ["horizontal"] = 3
        },
        ["LANDING_DAMAGE_RADIUS"] = v1 * 10
    }
}
return {
    ["SkeletonBossAction"] = v3,
    ["SkeletonBossConfigs"] = v4
}