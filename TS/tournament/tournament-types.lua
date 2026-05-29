local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").RegionValues
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local v4 = {}
local v5 = setmetatable({}, {
    ["__index"] = v4
})
v5.Division_III = 3
v4[3] = "Division_III"
v5.Division_II = 2
v4[2] = "Division_II"
v5.Division_I = 1
v4[1] = "Division_I"
return {
    ["TournamentDivision"] = v5,
    ["DefaultTournamentTeamData"] = {
        ["leaderUserId"] = 0,
        ["name"] = "Tournament Team",
        ["weekId"] = "",
        ["version"] = 1,
        ["members"] = {},
        ["icon"] = v3.BED_BREAK,
        ["matches"] = {},
        ["division"] = v5.Division_III,
        ["region"] = v2.NA,
        ["invitations"] = {}
    }
}