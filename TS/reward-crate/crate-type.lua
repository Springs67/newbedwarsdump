local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.LEVEL_UP_CRATE = "level_up_crate"
v1.level_up_crate = "LEVEL_UP_CRATE"
v2.DIAMOND_LUCKY_CRATE = "diamond_lucky_crate"
v1.diamond_lucky_crate = "DIAMOND_LUCKY_CRATE"
v2.AFK_CRATE = "afk_crate"
v1.afk_crate = "AFK_CRATE"
v2.MURDER_CRATE = "murder_crate"
v1.murder_crate = "MURDER_CRATE"
v2.KITSKIN_CRATE = "kitskin_crate"
v1.kitskin_crate = "KITSKIN_CRATE"
return {
    ["CrateType"] = v2
}