local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return {
    ["AfkPlaceRemotes"] = v1.Definitions.Namespace({
        ["GetAfkTimes"] = v1.Definitions.ServerFunction(),
        ["PurchaseShopItem"] = v1.Definitions.ServerFunction(),
        ["AfkDataUpdate"] = v1.Definitions.ServerToClientEvent()
    })
}