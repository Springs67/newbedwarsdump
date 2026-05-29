local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.SPEED = "speed"
v1.speed = "SPEED"
v2.RANGE = "range"
v1.range = "RANGE"
v2.COOLDOWN = "cooldown"
v1.cooldown = "COOLDOWN"
v2.DAMAGE = "damage"
v1.damage = "DAMAGE"
v2.LASSO_ARMOR = "lasso_armor"
v1.lasso_armor = "LASSO_ARMOR"
v2.HEAVY = "heavy"
v1.heavy = "HEAVY"
local v3 = {}
local v4 = setmetatable({}, {
    ["__index"] = v3
})
v4.OFFENSIVE = "Offensive"
v3.Offensive = "OFFENSIVE"
v4.DEFENSIVE = "Defensive"
v3.Defensive = "DEFENSIVE"
v4.MISC = "Misc"
v3.Misc = "MISC"
return {
    ["LassoUpgradeType"] = v2,
    ["LassoCategory"] = v4
}