local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.DEFAULT = 0
v1[0] = "DEFAULT"
v2.MYTHIC_WEAPON = 1
v1[1] = "MYTHIC_WEAPON"
v2.HALLOWEEN_LUCKY_BLOCK = 2
v1[2] = "HALLOWEEN_LUCKY_BLOCK"
v2.MAGICAL_HERO_LUCKY_BLOCK = 3
v1[3] = "MAGICAL_HERO_LUCKY_BLOCK"
return {
    ["ItemCatalogCollection"] = v2
}