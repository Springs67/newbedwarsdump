local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventCurrencyType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-missions", "event-missions-util").EventMissionsUtil
local v4 = {
    {
        ["metaId"] = "daily_collection",
        ["name"] = "Give / Receive Honor 1 time",
        ["rewardAmount"] = 3,
        ["layoutOrder"] = 1,
        ["guaranteedSelection"] = true,
        ["stages"] = {
            {
                ["type"] = "GiveOrReceiveHonor",
                ["progress"] = 1
            }
        },
        ["currencyReward"] = v2.LNY_2026_CURRENCY
    },
    {
        ["metaId"] = "daily_collection_2",
        ["name"] = "Give / Receive Honor 5 times",
        ["rewardAmount"] = 5,
        ["layoutOrder"] = 2,
        ["guaranteedSelection"] = true,
        ["stages"] = {
            {
                ["type"] = "GiveOrReceiveHonor",
                ["progress"] = 5
            }
        },
        ["currencyReward"] = v2.LNY_2026_CURRENCY
    },
    {
        ["metaId"] = "daily_collection_3",
        ["name"] = "Give / Receive Honor 10 times",
        ["rewardAmount"] = 10,
        ["layoutOrder"] = 3,
        ["guaranteedSelection"] = true,
        ["stages"] = {
            {
                ["type"] = "GiveOrReceiveHonor",
                ["progress"] = 10
            }
        },
        ["currencyReward"] = v2.LNY_2026_CURRENCY
    }
}
local v5 = {}
local v6 = #v5
table.move(v4, 1, #v4, v6 + 1, v5)
return {
    ["LNY_2026_Missions"] = v3.generateMissions(v5)
}