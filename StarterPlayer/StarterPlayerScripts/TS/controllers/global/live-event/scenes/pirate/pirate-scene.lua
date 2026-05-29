local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-config").pirateSceneConfig
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system").Scene
local v4 = v1.import(script, script.Parent, "shared-behaviors", "create-ships").CreateShipsBehavior
local v5 = v1.import(script, script.Parent, "shared-behaviors", "manage-atmosphere").ManageAtmosphereBehavior
local v6 = v1.import(script, script.Parent, "shared-behaviors", "manage-ships").ManageShipsBehavior
local v7 = v1.import(script, script, "big-explosion").BigExplosion
local v8 = v1.import(script, script, "big-ships-show-up").BigShipsShowUp
local v9 = v1.import(script, script, "cannons-shoot-at-ship").CannonsShootAtShip
local v10 = v1.import(script, script, "house-explodes").HouseExplodes
local v11 = v1.import(script, script, "make-ships-red-on-hit").MakeShipsRedOnHit
local v12 = v1.import(script, script, "pickup-cannonballs").PickupCannonballs
local v13 = v1.import(script, script, "pirate-ending-cutscene").PirateEndingCutscene
local v14 = v1.import(script, script, "pirate-music").PirateMusic
local v15 = v1.import(script, script, "pirate-ship-fire-effect").PirateShipFireEffect
local v16 = v1.import(script, script, "pirates-pop-down").PiratesPopDown
local v17 = v1.import(script, script, "receive-server-state").ReceiveServerStateBehavior
local v18 = v1.import(script, script, "ship-pops-up-on-island").ShipPopsUpOnIsland
local v19 = v1.import(script, script, "ships-fly-away").ShipsFlyAwayBehavior
local v20 = v1.import(script, script, "ships-reappear-at-front").ShipsReappearAtFrontBehavior
local v21 = v1.import(script, script, "ships-shoot-at-island").ShipsShootAtIsland
local v22 = v1.import(script, script, "spawn-fireworks").SpawnFireworks
local v23 = v1.import(script, script, "tie-up-players").TieUpPlayers
local v24 = v3.new(v2)
v24:registerBehaviorTable(v6)
v24:registerBehaviorTable(v19)
v24:registerBehaviorTable(v4)
v24:registerBehaviorTable(v5)
v24:registerBehaviorTable(v20)
v24:registerBehaviorTable(v21)
v24:registerBehaviorTable(v10)
v24:registerBehaviorTable(v12)
v24:registerBehaviorTable(v9)
v24:registerBehaviorTable(v11)
v24:registerBehaviorTable(v22)
v24:registerBehaviorTable(v7)
v24:registerBehaviorTable(v8)
v24:registerBehaviorTable(v23)
v24:registerBehaviorTable(v17)
v24:registerBehaviorTable(v16)
v24:registerBehaviorTable(v18)
v24:registerBehaviorTable(v13)
v24:registerBehaviorTable(v14)
v24:registerBehaviorTable(v15)
return {
    ["pirateScene"] = v24
}