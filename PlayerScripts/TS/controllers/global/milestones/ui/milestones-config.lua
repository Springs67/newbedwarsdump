-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local MilestoneRewards = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "milestones", "milestones").MilestoneRewards;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    milestonesLayout = {
        distanceX = #MilestoneRewards < 3 and 400 or 250,
        progressBarColor = Color3.fromRGB(33, 158, 255),
        progressBarBackgroundColor = ColorUtil.hexColor(3026508),
        rewardBannerColor = { Theme.backgroundTertiary, Color3.fromRGB(21, 155, 131), Color3.fromRGB(188, 81, 164) }
    }
};