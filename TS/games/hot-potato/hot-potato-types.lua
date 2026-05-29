local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.MELEE = 0
v1[0] = "MELEE"
v2.PROJECTILE = 1
v1[1] = "PROJECTILE"
return {
    ["HotPotatoMode"] = v2
}