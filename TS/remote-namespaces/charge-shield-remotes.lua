local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return v1.Definitions.Namespace({
    ["ChargeShieldUse"] = v1.Definitions.ClientToServerEvent(),
    ["ChargeShieldActivated"] = v1.Definitions.ServerToClientEvent(),
    ["ChargeShieldHit"] = v1.Definitions.ServerToClientEvent()
})