local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.STAT = 0
v1[0] = "STAT"
v2.ABILITY = 1
v1[1] = "ABILITY"
v2.ENCHANT = 2
v1[2] = "ENCHANT"
v2.PASSIVE = 3
v1[3] = "PASSIVE"
v2.ITEM = 4
v1[4] = "ITEM"
return {
    ["PvPArenaAugmentClass"] = v2
}