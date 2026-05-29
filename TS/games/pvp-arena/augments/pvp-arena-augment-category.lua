local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.SILVER = 0
v1[0] = "SILVER"
v2.GOLD = 1
v1[1] = "GOLD"
v2.PRISMATIC = 2
v1[2] = "PRISMATIC"
return {
    ["PvPArenaAugmentCategory"] = v2
}