local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.GHOST = "ghost"
v1.ghost = "GHOST"
v2.ALCHEMIST_INGREDIENTS = "alchemist_ingedients"
v1.alchemist_ingedients = "ALCHEMIST_INGREDIENTS"
v2.HIDDEN_METAL = "hidden_metal"
v1.hidden_metal = "HIDDEN_METAL"
v2.STARS = "stars"
v1.stars = "STARS"
v2.FLAG = "flag"
v1.flag = "FLAG"
v2.JAILOR_SOUL = "jailor_soul"
v1.jailor_soul = "JAILOR_SOUL"
v2.MURDER_COIN = "murder_coin"
v1.murder_coin = "MURDER_COIN"
v2.SHADOW_COIN = "shadow_coin"
v1.shadow_coin = "SHADOW_COIN"
v2.ALCHEMY_CRYSTAL = "alchemy_crystal"
v1.alchemy_crystal = "ALCHEMY_CRYSTAL"
v2.SPIRIT_GARDENER_SEEDS = "spirit_gardener_seeds"
v1.spirit_gardener_seeds = "SPIRIT_GARDENER_SEEDS"
v2.TEARBLOOM_SEED = "tearbloom_seed"
v1.tearbloom_seed = "TEARBLOOM_SEED"
v2.SOULVINE_SEED = "soulvine_seed"
v1.soulvine_seed = "SOULVINE_SEED"
v2.CRYSTALHEART_SEED = "crystalheart_seed"
v1.crystalheart_seed = "CRYSTALHEART_SEED"
v2.SPIRIT_GARDENER_ENERGY = "spirit_gardener_energy"
v1.spirit_gardener_energy = "SPIRIT_GARDENER_ENERGY"
v2.FOREST_ENVIRONMENT_PLANT = "forest_environment_plant"
v1.forest_environment_plant = "FOREST_ENVIRONMENT_PLANT"
local v3 = {}
for v4, v5 in v2 do
    v3[v4] = v5
end
return {
    ["CollectableEntityType"] = v3
}