local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return {
    ["WarlockBossRemotes"] = v1.Definitions.Namespace({
        ["WarlockMagicCircle"] = v1.Definitions.ServerToClientEvent(),
        ["WarlockCurseAll"] = v1.Definitions.ServerToClientEvent(),
        ["WarlockCurseOfUnity"] = v1.Definitions.ServerToClientEvent(),
        ["WarlockSummonVoidMobs"] = v1.Definitions.ServerToClientEvent(),
        ["WarlockDarkFlurry"] = v1.Definitions.ServerToClientEvent()
    })
}