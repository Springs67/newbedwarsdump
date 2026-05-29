local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.HOT = "1"
v1["1"] = "HOT"
v2.COLD = "2"
v1["2"] = "COLD"
return {
    ["HotPotatoTeamId"] = v2
}