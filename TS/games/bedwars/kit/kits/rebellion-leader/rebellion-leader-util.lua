local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.HEALING = "healing"
v1.healing = "HEALING"
v2.DAMAGE = "damage"
v1.damage = "DAMAGE"
return {
    ["AuraType"] = v2
}