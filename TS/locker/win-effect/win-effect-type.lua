local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.NONE = "none"
v1.none = "NONE"
v2.JUGGERNAUT_BARBARIAN = "juggernaut_barbarian"
v1.juggernaut_barbarian = "JUGGERNAUT_BARBARIAN"
v2.TRAIN = "train"
v1.train = "TRAIN"
v2.SPIRIT_ASSASSIN = "spirit_assassin"
v1.spirit_assassin = "SPIRIT_ASSASSIN"
v2.GRIM_REAPER = "grim_reaper"
v1.grim_reaper = "GRIM_REAPER"
v2.STATUE_OF_TRIUMPH = "statue_of_triumph"
v1.statue_of_triumph = "STATUE_OF_TRIUMPH"
v2.SPIRIT_BLOSSOM = "spirit_blossom"
v1.spirit_blossom = "SPIRIT_BLOSSOM"
v2.DRAGON_RIDER = "dragon_rider"
v1.dragon_rider = "DRAGON_RIDER"
v2.DUST_DEVIL = "dust_devil"
v1.dust_devil = "DUST_DEVIL"
v2.ANGEL_WINGS = "angel_wings"
v1.angel_wings = "ANGEL_WINGS"
v2.OWL = "owl"
v1.owl = "OWL"
v2.MEGA_BLOCK = "big_block"
v1.big_block = "MEGA_BLOCK"
v2.SNOWBOARDER = "snowboarder"
v1.snowboarder = "SNOWBOARDER"
v2.SNOW_BALL_RIDER = "snow_ball_rider"
v1.snow_ball_rider = "SNOW_BALL_RIDER"
return {
    ["WinEffectType"] = v2
}