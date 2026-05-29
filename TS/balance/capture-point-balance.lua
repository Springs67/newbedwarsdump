local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
return {
    ["CapturePointBalance"] = {
        ["CAPTURE_POINT_GOAL"] = 12,
        ["CAPTURED_POINT_DROP_COOLDOWN"] = v1:IsStudio() and 5 or 45,
        ["CAPTURE_POINT_RANGE"] = 14,
        ["PROGRESS_RESET_COOLDOWN"] = 5,
        ["CAPTURE_POINT_COOLDOWN_DURATION"] = v1:IsStudio() and 10 or 90
    }
}