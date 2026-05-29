local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return v1.Definitions.Namespace({
    ["GamemodeUpdate"] = v1.Definitions.ServerToClientEvent(),
    ["RegionUpdate"] = v1.Definitions.ServerToClientEvent(),
    ["RequestCreativeItem"] = v1.Definitions.ServerFunction(),
    ["SetPosition1"] = v1.Definitions.ServerFunction(),
    ["SetPosition2"] = v1.Definitions.ServerFunction(),
    ["SetOperation"] = v1.Definitions.ClientToServerEvent(),
    ["ReplaceOperation"] = v1.Definitions.ClientToServerEvent(),
    ["CopyOperation"] = v1.Definitions.ClientToServerEvent(),
    ["PasteOperation"] = v1.Definitions.ClientToServerEvent(),
    ["RotateOperation"] = v1.Definitions.ClientToServerEvent(),
    ["CutOperation"] = v1.Definitions.ClientToServerEvent(),
    ["DeleteOperation"] = v1.Definitions.ClientToServerEvent(),
    ["UndoOperation"] = v1.Definitions.ClientToServerEvent(),
    ["RedoOperation"] = v1.Definitions.ClientToServerEvent()
})