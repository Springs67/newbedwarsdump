local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return v1.Definitions.Namespace({
    ["GetSocialConnections"] = v1.Definitions.ServerFunction(),
    ["VerifyJoinedGroup"] = v1.Definitions.ServerFunction(),
    ["UnverifyUser"] = v1.Definitions.ServerFunction(),
    ["VerifyUser"] = v1.Definitions.ServerFunction(),
    ["RegisterUser"] = v1.Definitions.ClientToServerEvent(),
    ["SocialConnectionsUpdate"] = v1.Definitions.ServerToClientEvent(),
    ["VerificationStatusResolved"] = v1.Definitions.ServerToClientEvent()
})