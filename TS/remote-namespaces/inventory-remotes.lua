local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return v1.Definitions.Namespace({
    ["SetObservedChest"] = v1.Definitions.ClientToServerEvent(),
    ["ChestGetItem"] = v1.Definitions.ServerFunction(),
    ["ChestGiveItem"] = v1.Definitions.ServerFunction()
})