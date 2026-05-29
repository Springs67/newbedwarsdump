local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventCurrencyType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-missions", "event-missions-util").EventMissionsUtil
local v6 = {}
local v7 = {
    ["metaId"] = "crypt_coven",
    ["name"] = "Beat Marrow\'s Madness",
    ["rewardAmount"] = 1,
    ["layoutOrder"] = 1,
    ["stages"] = {
        {
            ["type"] = "GameWin",
            ["progress"] = 1,
            ["queueType"] = v3.HALLOWEEN_EVENT
        }
    },
    ["currencyReward"] = v2.RARE_CANDY_2025
}
local v8 = {
    ["name"] = "Skeleton Slayer Title",
    ["rewards"] = {
        {
            ["title"] = v4.SKELETON_SLAYER
        }
    }
}
v7.reward = v8
local v9 = {
    ["metaId"] = "arachne_lair",
    ["name"] = "Beat Arachne\'s Lair",
    ["rewardAmount"] = 1,
    ["layoutOrder"] = 1,
    ["stages"] = {
        {
            ["type"] = "GameWin",
            ["progress"] = 1,
            ["queueType"] = v3.HALLOWEEN_2025_EVENT_PVE
        }
    },
    ["currencyReward"] = v2.RARE_CANDY_2025
}
__set_list(v6, 1, {v7, v9})
local v10 = {}
local v11 = #v10
table.move(v6, 1, #v6, v11 + 1, v10)
return {
    ["Halloween_2025_Special_Missions"] = v5.generateMissions(v10, v2.RARE_CANDY_2025)
}