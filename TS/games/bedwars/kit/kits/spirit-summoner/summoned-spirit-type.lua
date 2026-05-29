local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.ATTACK = "attack"
v1.attack = "ATTACK"
v2.HEAL = "heal"
v1.heal = "HEAL"
return {
    ["SummonedSpiritType"] = v2
}