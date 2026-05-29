local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local v2 = {}
local v3 = {}
local v4 = setmetatable({}, {
    ["__index"] = v3
})
v4.Straight = 0
v3[0] = "Straight"
v4.LeftTurn = 1
v3[1] = "LeftTurn"
v4.RightTurn = 2
v3[2] = "RightTurn"
v2.LevelPieceType = v4
local v5 = {
    [v4.Straight] = {
        ["modelAsset"] = v1.Assets.Misc.SnowboardingLevelPiece_Straight
    },
    [v4.LeftTurn] = {
        ["modelAsset"] = v1.Assets.Misc.SnowboardingLevelPiece_LeftTurn
    },
    [v4.RightTurn] = {
        ["modelAsset"] = v1.Assets.Misc.SnowboardingLevelPiece_RightTurn
    }
}
v2.LevelPieceMeta = v5
local v6 = {}
local v7 = setmetatable({}, {
    ["__index"] = v6
})
v7.Log = 0
v6[0] = "Log"
v7.Rock = 1
v6[1] = "Rock"
v7.Tree = 2
v6[2] = "Tree"
v2.ObstacleType = v7
return {
    ["SnowboardingMinigameUtil"] = v2
}