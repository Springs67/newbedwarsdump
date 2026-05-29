local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.TWO_TEAMS = "TWO_TEAMS"
v1.TWO_TEAMS = "TWO_TEAMS"
v2.MULTI_TEAM = "MULTI_TEAM"
v1.MULTI_TEAM = "MULTI_TEAM"
return {
    ["MatchDraftMode"] = v2
}