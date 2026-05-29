local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return v1.Definitions.Namespace({
    ["OpenVendingMachine"] = v1.Definitions.ServerFunction(),
    ["VendingMachineOpened"] = v1.Definitions.ServerToClientEvent(),
    ["VendingMachineSelfDestruct"] = v1.Definitions.ServerToClientEvent()
})