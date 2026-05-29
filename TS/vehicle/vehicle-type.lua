local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.MINICOPTER = "Minicopter"
v1.Minicopter = "MINICOPTER"
v2.ATTACK_HELI = "AttackMinicopter"
v1.AttackMinicopter = "ATTACK_HELI"
v2.UFO = "UFO"
v1.UFO = "UFO"
v2.FLYING_CLOUD = "FlyingCloud"
v1.FlyingCloud = "FLYING_CLOUD"
v2.HOT_AIR_BALLOON = "HotAirBalloon"
v1.HotAirBalloon = "HOT_AIR_BALLOON"
v2.FLYING_BROOM = "FlyingBroom"
v1.FlyingBroom = "FLYING_BROOM"
v2.JELLYFISH_MOUNT = "JellyfishMount"
v1.JellyfishMount = "JELLYFISH_MOUNT"
v2.SLEIGH = "Sleigh"
v1.Sleigh = "SLEIGH"
v2.FLYING_CARPET = "FlyingCarpet"
v1.FlyingCarpet = "FLYING_CARPET"
return {
    ["VehicleType"] = v2
}