local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return {
    ["OrbitalSatelliteRemotes"] = v1.Definitions.Namespace({
        ["AimSatellite"] = v1.Definitions.ClientToServerEvent(),
        ["ExitSatellite"] = v1.Definitions.ClientToServerEvent()
    })
}