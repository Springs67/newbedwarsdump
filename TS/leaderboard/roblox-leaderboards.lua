local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.ClanWarBeta = "ClanWarBeta"
v1.ClanWarBeta = "ClanWarBeta"
v2.ClanWarAllTime = "ClanWarAllTime"
v1.ClanWarAllTime = "ClanWarAllTime"
v2.GIFT_LEADERBOARD = "gift_leaderboard"
v1.gift_leaderboard = "GIFT_LEADERBOARD"
v2.WeeklySkulls = "weekly_skulls"
v1.weekly_skulls = "WeeklySkulls"
v2.MARROWS_MADNESS = "crypt_trial"
v1.crypt_trial = "MARROWS_MADNESS"
local v3 = {}
for v4, v5 in v2 do
    v3[v4] = v5
end
return {
    ["RobloxLeaderboardEnum"] = v2,
    ["RobloxLeaderboard"] = v3
}