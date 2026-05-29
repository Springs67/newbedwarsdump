local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return {
    ["CustomMapBrowserRemotes"] = v1.Definitions.Namespace({
        ["MapBrowserGetFeaturedList"] = v1.Definitions.ServerAsyncFunction(),
        ["MapBrowserGetPublishedCount"] = v1.Definitions.ServerAsyncFunction(),
        ["MapBrowserPublishMap"] = v1.Definitions.ServerAsyncFunction(),
        ["MapBrowserSearchMap"] = v1.Definitions.ServerAsyncFunction(),
        ["MapBrowserUpdateMap"] = v1.Definitions.ClientToServerEvent(),
        ["MapBrowserDeleteMap"] = v1.Definitions.ClientToServerEvent(),
        ["MapBrowserRateMap"] = v1.Definitions.ClientToServerEvent(),
        ["GetMyMapBrowserData"] = v1.Definitions.ServerFunction(),
        ["ClearBatchData"] = v1.Definitions.ServerToClientEvent(),
        ["DisplayRateMapPopup"] = v1.Definitions.ServerToClientEvent(),
        ["SendMapBrowserProfileDataUpdate"] = v1.Definitions.ServerToClientEvent()
    })
}