local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return {
    ["KitStatRemotes"] = v1.Definitions.Namespace({
        ["GetActiveKitStats"] = v1.Definitions.ServerFunction(),
        ["GetKitStats"] = v1.Definitions.ServerAsyncFunction(),
        ["GetKitsStats"] = v1.Definitions.ServerAsyncFunction(),
        ["GetKitContractProfile"] = v1.Definitions.ServerAsyncFunction(),
        ["UpdateKitStats"] = v1.Definitions.ServerToClientEvent()
    })
}