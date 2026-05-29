local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.LEVEL_0 = 0
v1[0] = "LEVEL_0"
v2.LEVEL_1 = 1
v1[1] = "LEVEL_1"
v2.LEVEL_2 = 2
v1[2] = "LEVEL_2"
v2.LEVEL_3 = 3
v1[3] = "LEVEL_3"
return {
    ["SeahorseLevel"] = v2
}