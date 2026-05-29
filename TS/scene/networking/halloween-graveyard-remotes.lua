local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return v1.Definitions.Namespace({
    ["GateOpenRequest"] = v1.Definitions.ClientToServerEvent(),
    ["GraveDigRequest"] = v1.Definitions.ClientToServerEvent(),
    ["FoundClue"] = v1.Definitions.ClientToServerEvent(),
    ["GateOpenSuccess"] = v1.Definitions.ServerToClientEvent(),
    ["GraveDigResult"] = v1.Definitions.ServerToClientEvent(),
    ["ClueDiscovered"] = v1.Definitions.ServerToClientEvent()
})