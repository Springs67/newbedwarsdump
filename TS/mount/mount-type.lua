local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.MOUNT = 0
v1[0] = "MOUNT"
v2.DISMOUNT = 1
v1[1] = "DISMOUNT"
local v3 = {}
local v4 = setmetatable({}, {
    ["__index"] = v3
})
v4.DODO_BIRD = "dodo_bird"
v3.dodo_bird = "DODO_BIRD"
v4.DINO = "dino"
v3.dino = "DINO"
v4.ELK = "elk"
v3.elk = "ELK"
v4.TINKER = "tinker"
v3.tinker = "TINKER"
v4.IRON_TINKER = "iron_tinker"
v3.iron_tinker = "IRON_TINKER"
v4.EMERALD_TINKER = "emerald_tinker"
v3.emerald_tinker = "EMERALD_TINKER"
v4.DIAMOND_TINKER = "diamond_tinker"
v3.diamond_tinker = "DIAMOND_TINKER"
v4.VOID_TINKER = "void_tinker"
v3.void_tinker = "VOID_TINKER"
v4.FISH_TANK_TINKER = "fish_tank_tinker"
v3.fish_tank_tinker = "FISH_TANK_TINKER"
v4.FISH_TANK_IRON_TINKER = "fish_tank_iron_tinker"
v3.fish_tank_iron_tinker = "FISH_TANK_IRON_TINKER"
v4.FISH_TANK_EMERALD_TINKER = "fish_tank_emerald_tinker"
v3.fish_tank_emerald_tinker = "FISH_TANK_EMERALD_TINKER"
v4.FISH_TANK_DIAMOND_TINKER = "fish_tank_diamond_tinker"
v3.fish_tank_diamond_tinker = "FISH_TANK_DIAMOND_TINKER"
v4.FISH_TANK_VOID_TINKER = "fish_tank_void_tinker"
v3.fish_tank_void_tinker = "FISH_TANK_VOID_TINKER"
v4.CHAMELEON = "chameleon"
v3.chameleon = "CHAMELEON"
return {
    ["MountUsedActionType"] = v2,
    ["MountType"] = v4
}