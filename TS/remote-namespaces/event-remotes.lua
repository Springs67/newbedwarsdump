local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return {
    ["EventRemotes"] = v1.Definitions.Namespace({
        ["PurchaseShopItem"] = v1.Definitions.ServerFunction(),
        ["ClaimMission"] = v1.Definitions.ServerFunction(),
        ["SendAllEventData"] = v1.Definitions.ServerToClientEvent(),
        ["SendEventDataUpdate"] = v1.Definitions.ServerToClientEvent(),
        ["SendEventCurrencyUpdate"] = v1.Definitions.ServerToClientEvent(),
        ["ActiveEventMissionsUpdate"] = v1.Definitions.ServerToClientEvent(),
        ["MissionClaimed"] = v1.Definitions.ServerToClientEvent()
    })
}