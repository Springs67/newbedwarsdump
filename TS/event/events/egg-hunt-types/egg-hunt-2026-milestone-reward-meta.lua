local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").Consumable
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "badge").Badges
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "egg-hunt-types", "egg-hunt-milestone-types").EggHuntMilestoneReward
local v11 = {}
local v12 = v10.EGG_HUNT_LUCKY_CRATE
local v13 = {
    ["name"] = "Lucky Crate",
    ["display"] = {
        ["rewardTypeText"] = "Lucky Crate",
        ["image"] = v4.LUCKY_CRATE_RENDER
    }
}
local v14 = {
    ["consumable"] = {
        ["amount"] = 1,
        ["consumableType"] = v3.LEVEL_UP_CRATE
    }
}
v13.reward = v14
v11[v12] = v13
local v15 = v10.EGG_HUNT_EMOTE_2
local v16 = {
    ["name"] = v5[v6.EASTER_GRIM_LAUGHING].name,
    ["display"] = {
        ["rewardTypeText"] = "Emote",
        ["image"] = v5[v6.EASTER_GRIM_LAUGHING].image
    },
    ["reward"] = {
        ["emote"] = v6.EASTER_GRIM_LAUGHING
    }
}
v11[v15] = v16
local v17 = v10.EGG_HUNT_BP_XP_MULTIPLIER1
local v18 = {
    ["name"] = v2(v3.BATTLE_PASS_1_5X).displayName,
    ["display"] = {
        ["rewardTypeText"] = "Battle Pass XP Multiplier",
        ["image"] = v2(v3.BATTLE_PASS_1_5X).image
    }
}
local v19 = {
    ["consumable"] = {
        ["consumableType"] = v3.BATTLE_PASS_1_5X
    }
}
v18.reward = v19
v11[v17] = v18
local v20 = v10.EGG_HUNT_BP_XP_MULTIPLIER2
local v21 = {
    ["name"] = v2(v3.BATTLE_PASS_2X).displayName,
    ["display"] = {
        ["rewardTypeText"] = "Battle Pass XP Multiplier",
        ["image"] = v2(v3.BATTLE_PASS_2X).image
    }
}
local v22 = {
    ["consumable"] = {
        ["consumableType"] = v3.BATTLE_PASS_2X
    }
}
v21.reward = v22
v11[v20] = v21
local v23 = v10.EGG_HUNT_TITLE_1
local v24 = {}
local v25 = v7[v8.EGG_HUNT_2026].name
if v25 == nil then
    v25 = v7[v8.EGG_HUNT_2026].text
end
v24.name = v25
v24.display = {
    ["rewardTypeText"] = "Title",
    ["text"] = v7[v8.EGG_HUNT_2026].text
}
v24.reward = {
    ["title"] = v8.EGG_HUNT_2026
}
v11[v23] = v24
local v26 = v10.EGG_HUNT_DIAMOND_LUCKY_CRATE
local v27 = {
    ["name"] = v2(v3.DIAMOND_LUCKY_CRATE).displayName,
    ["display"] = {
        ["rewardTypeText"] = "Diamond Lucky Crate",
        ["image"] = v2(v3.DIAMOND_LUCKY_CRATE).image
    }
}
local v28 = {
    ["consumable"] = {
        ["consumableType"] = v3.DIAMOND_LUCKY_CRATE
    }
}
v27.reward = v28
v11[v26] = v27
local v29 = v10.BEDWARS_EGG_HUNT_BADGE
local v30 = {
    ["name"] = "Egg Hunt 2026 Badge",
    ["display"] = {
        ["image"] = "rbxassetid://74155466487599",
        ["rewardTypeText"] = "Badge"
    },
    ["reward"] = {
        ["robloxBadge"] = v9.EGG_HUNT_2026
    }
}
v11[v29] = v30
local v31 = v10.EGG_HUNT_TITLE_2
local v32 = {}
local v33 = v7[v8.EGGCEPTIONAL].name
if v33 == nil then
    v33 = v7[v8.EGGCEPTIONAL].text
end
v32.name = v33
v32.display = {
    ["rewardTypeText"] = "Title",
    ["text"] = v7[v8.EGGCEPTIONAL].text
}
v32.reward = {
    ["title"] = v8.EGGCEPTIONAL
}
v11[v31] = v32
return {
    ["Easter2026MilestoneRewardMeta"] = v11
}