local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.HUNTERS = "1"
v1["1"] = "HUNTERS"
v2.HIDERS = "2"
v1["2"] = "HIDERS"
return {
    ["BlockHuntTeamId"] = v2
}