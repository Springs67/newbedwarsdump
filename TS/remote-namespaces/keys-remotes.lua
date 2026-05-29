local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return {
    ["KeysRemotes"] = v1.Definitions.Namespace({
        ["KeysDataUpdate"] = v1.Definitions.ServerToClientEvent(),
        ["NotifyMissingQueueKeys"] = v1.Definitions.ServerToClientEvent()
    })
}