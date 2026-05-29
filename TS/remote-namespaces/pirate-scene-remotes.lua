local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return v1.Definitions.Namespace({
    ["PickupCannonball"] = v1.Definitions.ClientToServerEvent(),
    ["InsertCannonball"] = v1.Definitions.ClientToServerEvent(),
    ["RequestPirateSceneServerState"] = v1.Definitions.ServerFunction(),
    ["PirateSceneServerStateChange"] = v1.Definitions.ServerToClientEvent()
})