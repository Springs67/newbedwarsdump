local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return v1.Definitions.Namespace({
    ["SetPosition1"] = v1.Definitions.ServerFunction(),
    ["SetPosition2"] = v1.Definitions.ServerFunction(),
    ["CreateRegion"] = v1.Definitions.ServerFunction(),
    ["RequestDeleteRegion"] = v1.Definitions.ServerFunction(),
    ["RequestAddPlayer"] = v1.Definitions.ServerFunction(),
    ["RequestRemovePlayer"] = v1.Definitions.ServerFunction(),
    ["RequestRenameRegion"] = v1.Definitions.ServerFunction(),
    ["BulkUpdateRegions"] = v1.Definitions.ServerToClientEvent(),
    ["PlayerAdded"] = v1.Definitions.ServerToClientEvent(),
    ["PlayerRemoved"] = v1.Definitions.ServerToClientEvent(),
    ["RegionUpdate"] = v1.Definitions.ServerToClientEvent(),
    ["RegionDeleted"] = v1.Definitions.ServerToClientEvent()
})