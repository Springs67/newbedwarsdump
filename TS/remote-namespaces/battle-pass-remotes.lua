local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return {
    ["BattlePassRemotesNamespace"] = v1.Definitions.Namespace({
        ["GetBattlePass"] = v1.Definitions.ServerFunction(),
        ["MatchExperienceEarned"] = v1.Definitions.ServerToClientEvent()
    })
}