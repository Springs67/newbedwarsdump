local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-missions", "event-missions-util").EventMissionsUtil
local v8 = {}
local v9 = {
    ["metaId"] = "minigame_mountain",
    ["name"] = "Beat Minigame Mountain",
    ["rewardAmount"] = 1,
    ["layoutOrder"] = 1,
    ["stages"] = {
        {
            ["type"] = "GameWin",
            ["progress"] = 1,
            ["queueType"] = v2.WINTER_EVENT
        }
    }
}
local v10 = {
    ["name"] = "Rewards",
    ["rewards"] = {
        {
            ["paid"] = false,
            ["kit"] = v3.FROSTY_HAMMER
        },
        {
            ["paid"] = false,
            ["title"] = v6.MOUNTAIN_CONQUEROR
        },
        {
            ["paid"] = false,
            ["emote"] = v4.MOUNTAIN_COOL
        },
        {
            ["lobbyGadget"] = v5.SNOWBOARD_SPECIAL
        }
    }
}
v9.reward = v10
local v11 = {
    ["metaId"] = "minigame_mountain2",
    ["name"] = "Beat Minigame Mountain",
    ["rewardAmount"] = 1,
    ["layoutOrder"] = 1,
    ["stages"] = {
        {
            ["type"] = "GameWin",
            ["progress"] = 5,
            ["queueType"] = v2.WINTER_EVENT
        }
    },
    ["reward"] = {
        ["name"] = "Rewards",
        ["rewards"] = {
            {
                ["bedCoins"] = 1000
            }
        }
    }
}
local v12 = {
    ["metaId"] = "minigame_mountain3",
    ["name"] = "Play Minigame Mountain",
    ["rewardAmount"] = 1,
    ["layoutOrder"] = 1,
    ["stages"] = {
        {
            ["type"] = "GamePlayTime",
            ["progress"] = 1800,
            ["queueType"] = v2.WINTER_EVENT
        }
    },
    ["reward"] = {
        ["name"] = "Rewards",
        ["rewards"] = {
            {
                ["bedCoins"] = 1000
            }
        }
    }
}
__set_list(v8, 1, {v9, v11, v12})
local v13 = {}
local v14 = #v13
table.move(v8, 1, #v8, v14 + 1, v13)
return {
    ["XMAS_2025_Special_Missions"] = v7.generateMissions(v13)
}