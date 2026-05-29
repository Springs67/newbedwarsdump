local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return {
    ["VehicleRemotes"] = v1.Definitions.Namespace({
        ["SetEnginePower"] = v1.Definitions.ClientToServerEvent()
    })
}