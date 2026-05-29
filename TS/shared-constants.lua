return {
    ["IS_DEV"] = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService:IsStudio(),
    ["PingConstants"] = {
        ["PING_COOLDOWN"] = 2,
        ["PING_LIFETIME"] = 6
    },
    ["CpsConstants"] = {
        ["BLOCK_PLACE_CPS"] = 12
    }
}