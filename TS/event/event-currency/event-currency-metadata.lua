local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventCurrencyType
local v4 = {
    [v3.CANDY] = {
        ["name"] = "Candy",
        ["icon"] = "rbxassetid://11175136630"
    },
    [v3.DOUBLOONS] = {
        ["name"] = "Doubloons",
        ["icon"] = "rbxassetid://10730119876"
    },
    [v3.XMAS_TOKEN] = {
        ["name"] = "Winter Coins",
        ["icon"] = "rbxassetid://11830878997"
    },
    [v3.TWO_YEAR_COIN] = {
        ["name"] = "2 Year Anniversary Cakes",
        ["icon"] = "rbxassetid://13556699420"
    },
    [v3.CANDY_2023] = {
        ["name"] = "Candy",
        ["icon"] = "rbxassetid://11175136630"
    },
    [v3.CANDY_2024] = {
        ["name"] = "Candy",
        ["icon"] = "rbxassetid://11175136630"
    },
    [v3.XMAS_TOKEN_2023] = {
        ["name"] = "Holiday Coin",
        ["icon"] = "rbxassetid://11830878997"
    },
    [v3.XMAS_RED_TOKEN_2023] = {
        ["name"] = "Holiday Red Coin",
        ["icon"] = "rbxassetid://15636936423"
    },
    [v3.RED_ENVELOPE_2024] = {
        ["name"] = "Red Envelope",
        ["icon"] = "rbxassetid://16213995446"
    },
    [v3.THREE_YEAR_COIN] = {
        ["name"] = "3 Year Anniversary Cakes",
        ["icon"] = "rbxassetid://17600972397"
    },
    [v3.SUMMER_2024_CURRENCY] = {
        ["name"] = "Sand Dollar",
        ["icon"] = v2.SAND_DOLLAR
    },
    [v3.LNY_2025_CURRENCY] = {
        ["name"] = "Snake Coin",
        ["icon"] = "rbxassetid://95586055807603"
    },
    [v3.SUMMER_2025_CURRENCY] = {
        ["name"] = "Doubloon",
        ["icon"] = "rbxassetid://10730119876"
    },
    [v3.SKULLS] = {
        ["name"] = "Souls",
        ["icon"] = v2.GRIM_REAPER_KIT_SHOULDER_BUDDY_UGC_RENDER
    },
    [v3.CANDY_2025] = {
        ["name"] = "Candy",
        ["icon"] = "rbxassetid://11175136630"
    },
    [v3.RARE_CANDY_2025] = {
        ["name"] = "Rare Candy",
        ["icon"] = "rbxassetid://103852100709168"
    },
    [v3.METEOR_SHARD] = {
        ["name"] = "Meteor Shard",
        ["icon"] = v2.METEOR_SHARD
    },
    [v3.PENGUIN_COIN] = {
        ["name"] = "Penguin Coin",
        ["icon"] = v2.COIN
    },
    [v3.LNY_2026_CURRENCY] = {
        ["name"] = "Fire Horse Coin",
        ["icon"] = v2.LNY2026_FIRE_HORSE_COIN
    }
}
return {
    ["EventCurrencyMeta"] = v4
}