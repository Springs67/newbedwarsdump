local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return v1.Definitions.Namespace({
    ["GateOpenRequest"] = v1.Definitions.ClientToServerEvent(),
    ["GateOpenSuccess"] = v1.Definitions.ServerToClientEvent(),
    ["CandleColorCheck"] = v1.Definitions.ServerToClientEvent(),
    ["PuzzleSolved"] = v1.Definitions.ServerToClientEvent(),
    ["CandleDiscovered"] = v1.Definitions.ServerToClientEvent()
})