local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return {
    ["LiveCreativeServersRemotes"] = v1.Definitions.Namespace({
        ["LiveServersSeach"] = v1.Definitions.ServerAsyncFunction(),
        ["LiveServersRequestJoin"] = v1.Definitions.ServerAsyncFunction(),
        ["SetServerPublishedState"] = v1.Definitions.ServerAsyncFunction(),
        ["SetGameName"] = v1.Definitions.ServerAsyncFunction(),
        ["RequestLiveServerDisplayUpdate"] = v1.Definitions.ClientToServerEvent(),
        ["LiveServerDisplayUpdate"] = v1.Definitions.ServerToClientEvent()
    })
}