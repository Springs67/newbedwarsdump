local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "device-util").DeviceUtil
local v2 = {
    ["CURRENCY_EARNED_DISPLAY_PROPS"] = {
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["Position"] = UDim2.fromScale(0.5, v1.isSmallScreen() and 0.2 or 0.12)
    },
    ["BATTLE_PASS_PROGRESS_DISPLAY_PROPS"] = {
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.855)
    },
    ["PLAYER_LEVEL_PROGRESS_DISPLAY_PROPS"] = {
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.7200000000000001)
    },
    ["POST_GAME_RANKED_PROGRESS_DISPLAY_PROPS"] = {
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.45)
    },
    ["PROVISIONAL_GAMES_DISPLAY_PROPS"] = {
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.4)
    }
}
return {
    ["MatchEndUtil"] = v2
}