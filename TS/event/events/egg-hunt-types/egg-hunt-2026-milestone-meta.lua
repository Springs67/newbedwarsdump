local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "egg-hunt-types", "egg-hunt-milestone-types").EggHuntMilestoneReward
local v2 = {
    ["milestone1"] = {
        ["numRequired"] = 3,
        ["requiredText"] = {
            ["postText"] = " EGGS"
        },
        ["rewards"] = { v1.EGG_HUNT_TITLE_1 },
        ["milestoneColor"] = Color3.fromRGB(59, 227, 94)
    },
    ["milestone2"] = {
        ["numRequired"] = 8,
        ["requiredText"] = {
            ["postText"] = " EGGS"
        },
        ["rewards"] = { v1.EGG_HUNT_LUCKY_CRATE, v1.EGG_HUNT_BP_XP_MULTIPLIER1 },
        ["milestoneColor"] = Color3.fromRGB(95, 169, 255)
    },
    ["milestone3"] = {
        ["numRequired"] = 12,
        ["requiredText"] = {
            ["postText"] = " EGGS"
        },
        ["rewards"] = { v1.EGG_HUNT_EMOTE_2, v1.EGG_HUNT_BP_XP_MULTIPLIER2 },
        ["milestoneColor"] = Color3.fromRGB(102, 36, 224)
    },
    ["milestone4"] = {
        ["numRequired"] = 16,
        ["requiredText"] = {
            ["postText"] = " EGGS"
        },
        ["rewards"] = { v1.BEDWARS_EGG_HUNT_BADGE, v1.EGG_HUNT_DIAMOND_LUCKY_CRATE },
        ["milestoneColor"] = Color3.fromRGB(245, 191, 87)
    },
    ["milestone5"] = {
        ["numRequired"] = 18,
        ["requiredText"] = {
            ["postText"] = " EGGS"
        },
        ["rewards"] = { v1.EGG_HUNT_TITLE_2 },
        ["milestoneColor"] = Color3.fromRGB(255, 59, 59)
    }
}
return {
    ["EggHunt2026MilestoneMeta"] = v2
}