local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.DIAMOND_GUARDIAN = "diamond_guardian"
v1.diamond_guardian = "DIAMOND_GUARDIAN"
v2.GOLEM_BOSS = "golem_boss"
v1.golem_boss = "GOLEM_BOSS"
v2.SPIRIT_GOLEM_BOSS = "spirit_golem_boss"
v1.spirit_golem_boss = "SPIRIT_GOLEM_BOSS"
v2.VOID_GOLEM_BOSS = "void_golem_boss"
v1.void_golem_boss = "VOID_GOLEM_BOSS"
v2.CHRISTMAS_DIAMOND_GUARDIAN = "christmas_diamond_guardian"
v1.christmas_diamond_guardian = "CHRISTMAS_DIAMOND_GUARDIAN"
v2.CHRISTMAS_GOLEM_BOSS = "christmas_golem_boss"
v1.christmas_golem_boss = "CHRISTMAS_GOLEM_BOSS"
return {
    ["StatefulEntitySkin"] = v2
}