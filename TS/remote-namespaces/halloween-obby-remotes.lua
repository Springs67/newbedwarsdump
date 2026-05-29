local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return v1.Definitions.Namespace({
    ["AttemptEscapeObby"] = v1.Definitions.ServerAsyncFunction(),
    ["EvaluateBridgeTest"] = v1.Definitions.ServerAsyncFunction(),
    ["ActivateObbyScene"] = v1.Definitions.ClientToServerEvent(),
    ["EscapeObby"] = v1.Definitions.ServerToClientEvent(),
    ["BridgeTestSuccess"] = v1.Definitions.ServerToClientEvent(),
    ["ObbyActivatedScene"] = v1.Definitions.ServerToClientEvent()
})