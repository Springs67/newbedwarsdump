local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.WEEKLY = "weekly"
v1.weekly = "WEEKLY"
v2.ALLTIME = "all_time"
v1.all_time = "ALLTIME"
return {
    ["ClanWarLeaderboardType"] = v2
}