local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return {
    ["Halloween2025Remotes"] = v1.Definitions.Namespace({
        ["PlayerSelectKit"] = v1.Definitions.ClientToServerEvent(),
        ["PlayerLevelUp"] = v1.Definitions.ServerToClientEvent(),
        ["ExperienceProgress"] = v1.Definitions.ServerToClientEvent(),
        ["RequestSkillUpgrade"] = v1.Definitions.ClientToServerEvent(),
        ["GiveSkillUpgrade"] = v1.Definitions.ServerToClientEvent(),
        ["SpeedRegistered"] = v1.Definitions.ServerToClientEvent(),
        ["ShowInitialKitSelection"] = v1.Definitions.ServerToClientEvent(),
        ["EnteredBossFight"] = v1.Definitions.ServerToClientEvent(),
        ["Stage1StartExitCutscene"] = v1.Definitions.ServerToClientEvent(),
        ["HalloweenEntitySpawned"] = v1.Definitions.ServerToClientEvent(),
        ["NazarEntityPunched"] = v1.Definitions.ServerToClientEvent(),
        ["SilasEnemyHexed"] = v1.Definitions.ServerToClientEvent(),
        ["SilasAllyBuffed"] = v1.Definitions.ServerToClientEvent(),
        ["SilasHexActivate"] = v1.Definitions.ServerToClientEvent(),
        ["SilasBuffActivate"] = v1.Definitions.ServerToClientEvent(),
        ["CrystalBroken"] = v1.Definitions.ServerToClientEvent(),
        ["CrystalTurnedIn"] = v1.Definitions.ServerToClientEvent(),
        ["SkeletonBossGasCloudCurse"] = v1.Definitions.ServerToClientEvent(),
        ["SkeletonBossAction"] = v1.Definitions.ServerToClientEvent(),
        ["HitBoneObstacle"] = v1.Definitions.ClientToServerEvent()
    })
}