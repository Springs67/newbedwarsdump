local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.SUMMER_2024 = "summer_2024"
v1.summer_2024 = "SUMMER_2024"
v2.SUMMER_2025 = "summer_2025"
v1.summer_2025 = "SUMMER_2025"
local v3 = {}
local v4 = setmetatable({}, {
    ["__index"] = v3
})
v4.SUMMER_2024_CRAB = "summer_2024_crab"
v3.summer_2024_crab = "SUMMER_2024_CRAB"
v4.SUMMER_2024_TURTLE = "summer_2024_turtle"
v3.summer_2024_turtle = "SUMMER_2024_TURTLE"
v4.SUMMER_2025_TEAM = "summer_2025_team"
v3.summer_2025_team = "SUMMER_2025_TEAM"
local v5 = {}
local v6 = setmetatable({}, {
    ["__index"] = v5
})
v6.KILLS = "kills"
v5.kills = "KILLS"
v6.MATCHES_PLAYED = "matches_played"
v5.matches_played = "MATCHES_PLAYED"
v6.MATCH_WINS = "match_wins"
v5.match_wins = "MATCH_WINS"
v6.TIME_PLAYED = "time_played"
v5.time_played = "TIME_PLAYED"
v6.SUMMER_2025_TREASURE_CHESTS = "summer_2025_treasure_chests"
v5.summer_2025_treasure_chests = "SUMMER_2025_TREASURE_CHESTS"
v6.PENGUINS_KILLED = "penguins_killed"
v5.penguins_killed = "PENGUINS_KILLED"
return {
    ["GlobalTeamEventKey"] = v2,
    ["GlobalTeamKey"] = v4,
    ["GlobalTeamTimedGoalType"] = v6
}