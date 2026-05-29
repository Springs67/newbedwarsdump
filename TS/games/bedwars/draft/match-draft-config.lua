return {
    ["MatchDraftConfig"] = {
        ["MAX_LOADING_TIME_SECONDS"] = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService:IsStudio() and 5 or 30,
        ["MIN_CONNECTED_PLAYERS_RATIO"] = 0.9,
        ["MAX_BANNING_TIME_SECONDS"] = 30,
        ["BANNING_TRANSITION_TIME_SECONDS"] = 5,
        ["BANNING_ROUNDS"] = 2,
        ["MAX_KIT_SELECTION_TIME_SECONDS"] = 30,
        ["KIT_SELECTION_POST_TIME_SECONDS"] = 5
    }
}