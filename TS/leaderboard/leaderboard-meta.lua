local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-types")
local v5 = v4.Leaderboard
local v6 = v4.LeaderboardDatabaseContext
local v7 = v3.activeRankMeta.leaderboard
local u8 = {
    [v5.OverallWins] = {
        ["displayName"] = "Overall Wins",
        ["description"] = "Players with the highest number of overall wins",
        ["maxUsersDisplayed"] = 100,
        ["metric"] = "wins",
        ["statName"] = "wins",
        ["aggregationType"] = "last",
        ["displayTopEntityInLobby"] = true,
        ["displayInLobby"] = true,
        ["databaseContext"] = v6.PLAYFAB
    },
    [v5.WinsMonthly] = {
        ["displayName"] = "Monthly Wins",
        ["description"] = "Players with the highest number of wins this month",
        ["maxUsersDisplayed"] = 100,
        ["metric"] = "wins",
        ["statName"] = "wins",
        ["aggregationType"] = "sum",
        ["displayTopEntityInLobby"] = true,
        ["displayInLobby"] = true,
        ["databaseContext"] = v6.PLAYFAB
    },
    [v5.RankPoints_S16] = {
        ["description"] = "Players with the highest Rank Points",
        ["maxUsersDisplayed"] = 200,
        ["metric"] = "RP",
        ["statName"] = "rank",
        ["aggregationType"] = "last",
        ["displayTopEntityInLobby"] = true,
        ["displayInLobby"] = true,
        ["displayName"] = "Ranked Season " .. string.split(v3.activeRankCategory, "RANKED_S")[2],
        ["databaseContext"] = v6.PLAYFAB
    },
    [v5.GIFT_LEADERBOARD] = {
        ["displayName"] = "Top Gifters",
        ["description"] = "The most generous players (100 Gifts = Patron Rank)",
        ["maxUsersDisplayed"] = 100,
        ["metric"] = "gifts",
        ["statName"] = "gifts",
        ["displayInLobby"] = true,
        ["databaseContext"] = v6.ROBLOX_DATASTORE
    },
    [v5.ClanWarAllTime] = {
        ["displayName"] = "Clan Wars (All Time)",
        ["description"] = "The top clans in Clan Wars",
        ["maxUsersDisplayed"] = 10,
        ["metric"] = "MS",
        ["statName"] = "ms",
        ["displayInLobby"] = false,
        ["databaseContext"] = v6.ROBLOX_DATASTORE
    },
    [v5.WeeklySkulls] = {
        ["displayName"] = "Souls",
        ["description"] = "The Top Harvesters",
        ["maxUsersDisplayed"] = 100,
        ["metric"] = "Soul",
        ["statName"] = "Souls",
        ["displayInLobby"] = false,
        ["displayTopEntityInLobby"] = false,
        ["databaseContext"] = v6.ROBLOX_DATASTORE
    },
    [v5.MARROWS_MADNESS] = {
        ["displayName"] = "Marrow\'s Madness",
        ["description"] = "The Top Speed Runners",
        ["maxUsersDisplayed"] = 100,
        ["metric"] = "Time",
        ["statName"] = "Time",
        ["displayInLobby"] = false,
        ["displayTopEntityInLobby"] = false,
        ["asc"] = true,
        ["statsType"] = "time",
        ["databaseContext"] = v6.ROBLOX_DATASTORE
    }
}
return {
    ["LEADERBOARD_REFRESH_INTERVAL"] = 300,
    ["LEADERBOARD_DISABLED"] = false,
    ["getLeaderboardMeta"] = function(p9) --[[ Name: getLeaderboardMeta, Line 95 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        if u8[p9] ~= nil then
            return u8[p9]
        end
    end,
    ["getLeaderboardsToDisplay"] = function() --[[ Name: getLeaderboardsToDisplay, Line 100 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
        --]]
        local v10 = 0
        local v11 = {}
        for v12, v13 in u2.entries(u8) do
            local _ = v12 - 1
            if v13[2].displayInLobby == true then
                v10 = v10 + 1
                v11[v10] = v13
            end
        end
        local v14 = table.create(#v11)
        for v15, v16 in v11 do
            local _ = v15 - 1
            v14[v15] = v16[1]
        end
        return v14
    end,
    ["DEFAULT_LEADERBOARD_TO_DISPLAY"] = v7,
    ["LeaderboardMeta"] = u8
}