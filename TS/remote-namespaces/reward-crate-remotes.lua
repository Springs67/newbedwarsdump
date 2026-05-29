local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return {
    ["RewardCrateRemotes"] = v1.Definitions.Namespace({
        ["SpawnRewardCrate"] = v1.Definitions.ClientToServerEvent(),
        ["OpenRewardCrate"] = v1.Definitions.ClientToServerEvent(),
        ["CrateOpened"] = v1.Definitions.ServerToClientEvent(),
        ["CrateAltarDeactivated"] = v1.Definitions.ServerToClientEvent()
    })
}