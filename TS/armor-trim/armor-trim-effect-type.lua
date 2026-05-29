local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.DEFAULT = "default"
v1.default = "DEFAULT"
v2.FIRE_WARM = "fire_warm"
v1.fire_warm = "FIRE_WARM"
v2.FIRE_COOL = "fire_cold"
v1.fire_cold = "FIRE_COOL"
v2.FIRE_BLACK = "fire_black"
v1.fire_black = "FIRE_BLACK"
v2.FIRE_PURPLE = "fire_purple"
v1.fire_purple = "FIRE_PURPLE"
v2.FIRE_RED = "fire_red"
v1.fire_red = "FIRE_RED"
v2.FROSTY = "frosty"
v1.frosty = "FROSTY"
v2.VOID = "void"
v1.void = "VOID"
v2.SPIRIT = "spirit"
v1.spirit = "SPIRIT"
v2.BAT = "bat"
v1.bat = "BAT"
v2.PHOENIX = "phoenix"
v1.phoenix = "PHOENIX"
v2.ANNIVERSARY = "anniversary"
v1.anniversary = "ANNIVERSARY"
return {
    ["ArmorTrimEffectType"] = v2
}