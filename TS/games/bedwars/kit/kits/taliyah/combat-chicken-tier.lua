local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.LEATHER = 0
v1[0] = "LEATHER"
v2.IRON = 1
v1[1] = "IRON"
v2.DIAMOND = 2
v1[2] = "DIAMOND"
v2.EMERALD = 3
v1[3] = "EMERALD"
v2.VOID = 4
v1[4] = "VOID"
return {
    ["CombatChickenTier"] = v2
}