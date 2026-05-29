local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "milestones", "milestones").MilestoneRewards
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["milestonesLayout"] = {
        ["distanceX"] = #v3 < 3 and 400 or 250,
        ["progressBarColor"] = Color3.fromRGB(33, 158, 255),
        ["progressBarBackgroundColor"] = v2.hexColor(3026508),
        ["rewardBannerColor"] = { v4.backgroundTertiary, Color3.fromRGB(21, 155, 131), Color3.fromRGB(188, 81, 164) }
    }
}