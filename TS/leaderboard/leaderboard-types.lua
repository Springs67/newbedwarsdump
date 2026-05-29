local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "roblox-leaderboards").RobloxLeaderboardEnum
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.OverallWins = "OverallWins"
v2.OverallWins = "OverallWins"
v3.WinsMonthly = "Wins"
v2.Wins = "WinsMonthly"
v3.RankPoints = "RankPoints"
v2.RankPoints = "RankPoints"
v3.RankPoints_S5 = "RankPoints_S5"
v2.RankPoints_S5 = "RankPoints_S5"
v3.RankPoints_S6 = "RankPoints_S6"
v2.RankPoints_S6 = "RankPoints_S6"
v3.RankPoints_S6_2 = "RankPoints_S6_2"
v2.RankPoints_S6_2 = "RankPoints_S6_2"
v3.RankPoints_S7 = "RankPoints_S7"
v2.RankPoints_S7 = "RankPoints_S7"
v3.RankPoints_S8 = "RankPoints_S8"
v2.RankPoints_S8 = "RankPoints_S8"
v3.RankPoints_S9 = "RankPoints_S9"
v2.RankPoints_S9 = "RankPoints_S9"
v3.RankPoints_S10 = "RankPoints_S10"
v2.RankPoints_S10 = "RankPoints_S10"
v3.RankPoints_S11 = "RankPoints_S11"
v2.RankPoints_S11 = "RankPoints_S11"
v3.RankPoints_S12 = "RankPoints_S12"
v2.RankPoints_S12 = "RankPoints_S12"
v3.RankPoints_S13 = "RankPoints_S13"
v2.RankPoints_S13 = "RankPoints_S13"
v3.RankPoints_S14 = "RankPoints_S14"
v2.RankPoints_S14 = "RankPoints_S14"
v3.RankPoints_S15 = "RankPoints_S15"
v2.RankPoints_S15 = "RankPoints_S15"
v3.RankPoints_S16 = "RankPoints_S16"
v2.RankPoints_S16 = "RankPoints_S16"
local v4 = {}
for v5, v6 in v3 do
    v4[v5] = v6
end
for v7, v8 in v1 do
    v4[v7] = v8
end
local v9 = {}
local v10 = setmetatable({}, {
    ["__index"] = v9
})
v10.ROBLOX_DATASTORE = "roblox_datastore"
v9.roblox_datastore = "ROBLOX_DATASTORE"
v10.PLAYFAB = "playfab"
v9.playfab = "PLAYFAB"
return {
    ["PlayfabLeaderboard"] = v3,
    ["Leaderboard"] = v4,
    ["LeaderboardDatabaseContext"] = v10
}