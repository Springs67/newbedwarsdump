local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.DIAMOND_GUARDIAN = "DiamondGuardian"
v1.DiamondGuardian = "DIAMOND_GUARDIAN"
v2.GOLEM_BOSS = "GolemBoss"
v1.GolemBoss = "GOLEM_BOSS"
v2.FLYING_LUCKY_BLOCK = "FlyingLuckyBlock"
v1.FlyingLuckyBlock = "FLYING_LUCKY_BLOCK"
v2.GOOSE_BOSS = "GooseBoss"
v1.GooseBoss = "GOOSE_BOSS"
v2.TARGET_DUMMY = "TargetDummy"
v1.TargetDummy = "TARGET_DUMMY"
v2.VOID_CRATE = "VoidCrate"
v1.VoidCrate = "VOID_CRATE"
v2.FALCON = "Falcon"
v1.Falcon = "FALCON"
v2.PENGUIN_PIRATE_SHIP = "PenguinPirateShip"
v1.PenguinPirateShip = "PENGUIN_PIRATE_SHIP"
v2.BHAA = "Bhaa"
v1.Bhaa = "BHAA"
return {
    ["StatefulEntityTag"] = v2
}