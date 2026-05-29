local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return v1.Definitions.Namespace({
    ["DisasterBegan"] = v1.Definitions.ServerToClientEvent(),
    ["VoidRise"] = v1.Definitions.ServerToClientEvent(),
    ["SpawnMeteor"] = v1.Definitions.ServerToClientEvent(),
    ["TornadoSucked"] = v1.Definitions.ServerToClientEvent()
})