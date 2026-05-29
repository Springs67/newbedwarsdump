local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "event", "weekly-event", "weekly-timed-event").WeeklyTimedEvent
return {
    ["WeeklyEventMeta"] = {
        [v1.SKULL_DROP] = {
            ["name"] = "Skull Drop",
            ["setUpLobby"] = true,
            ["setUpGameServer"] = true
        },
        [v1.ARMOR_TRIM_BOOST] = {
            ["name"] = "Armor Trim Boost",
            ["setUpLobby"] = false,
            ["setUpGameServer"] = false,
            ["startTime"] = 1760133600,
            ["endTime"] = 1760392800
        },
        [v1.AFK_WEEKEND] = {
            ["name"] = "AFK Boost",
            ["setUpLobby"] = false,
            ["setUpGameServer"] = false
        },
        [v1.RANDOM_LOBBY_EVENT_WEEKEND] = {
            ["name"] = "Random Event Lobby",
            ["setUpLobby"] = true
        },
        [v1.LOGIN_REWARD_WEEKEND] = {
            ["name"] = "Login Reward",
            ["setUpLobby"] = true
        }
    }
}