local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.DIAMOND_GUARDIAN = "DiamondGuardian"
v1.DiamondGuardian = "DIAMOND_GUARDIAN"
v2.GOLEM_BOSS = "GolemBoss"
v1.GolemBoss = "GOLEM_BOSS"
v2.SPIRIT_GOLEM_BOSS = "SpiritGolemBoss"
v1.SpiritGolemBoss = "SPIRIT_GOLEM_BOSS"
v2.VOID_GOLEM_BOSS = "VoidGolemBoss"
v1.VoidGolemBoss = "VOID_GOLEM_BOSS"
return {
    ["StatefulEntityType"] = v2
}