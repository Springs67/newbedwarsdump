local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "net-middleware", "ratelimit")
local v4 = v2.Definitions.Namespace
local v5 = {
    ["RequestLeaderboardData"] = v2.Definitions.ServerAsyncFunction({ v2.Middleware.RateLimit({
            ["MaxRequestsPerMinute"] = 1,
            ["ErrorHandler"] = v3
        }) }),
    ["OnLeaderboardsUpdate"] = v2.Definitions.ServerToClientEvent(),
    ["UpdateLeaderboard"] = v2.Definitions.ServerToClientEvent()
}
return v4(v5)