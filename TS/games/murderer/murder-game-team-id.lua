local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.INNOCENT = "1"
v1["1"] = "INNOCENT"
v2.MURDERER = "2"
v1["2"] = "MURDERER"
return {
    ["MurderGameTeamId"] = v2
}