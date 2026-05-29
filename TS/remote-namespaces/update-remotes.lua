local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return {
    ["default"] = v1.Definitions.Namespace({
        ["FetchGameUpdates"] = v1.Definitions.ServerFunction()
    })
}