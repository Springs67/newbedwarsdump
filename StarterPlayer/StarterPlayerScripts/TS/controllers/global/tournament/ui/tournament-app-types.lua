local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.INFO = "Info"
v1.Info = "INFO"
v2.TEAM = "Team"
v1.Team = "TEAM"
v2.BRACKET = "Bracket"
v1.Bracket = "BRACKET"
v2.INVITES = "Invites"
v1.Invites = "INVITES"
v2.OUTBOUND_INVITES = "Outbound Invites"
v1["Outbound Invites"] = "OUTBOUND_INVITES"
return {
    ["TournamentAppTab"] = v2
}