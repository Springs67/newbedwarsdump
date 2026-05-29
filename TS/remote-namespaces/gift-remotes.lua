local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return v1.Definitions.Namespace({
    ["SendGift"] = v1.Definitions.ServerFunction(),
    ["GiftSent"] = v1.Definitions.ServerToClientEvent(),
    ["GiftReceived"] = v1.Definitions.ServerToClientEvent()
})