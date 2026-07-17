-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local pirateSceneConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-config").pirateSceneConfig;
local Scene = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system").Scene;
local CreateShipsBehavior = RuntimeLib.import(script, script.Parent, "shared-behaviors", "create-ships").CreateShipsBehavior;
local ManageAtmosphereBehavior = RuntimeLib.import(script, script.Parent, "shared-behaviors", "manage-atmosphere").ManageAtmosphereBehavior;
local ManageShipsBehavior = RuntimeLib.import(script, script.Parent, "shared-behaviors", "manage-ships").ManageShipsBehavior;
local BigExplosion = RuntimeLib.import(script, script, "big-explosion").BigExplosion;
local BigShipsShowUp = RuntimeLib.import(script, script, "big-ships-show-up").BigShipsShowUp;
local CannonsShootAtShip = RuntimeLib.import(script, script, "cannons-shoot-at-ship").CannonsShootAtShip;
local HouseExplodes = RuntimeLib.import(script, script, "house-explodes").HouseExplodes;
local MakeShipsRedOnHit = RuntimeLib.import(script, script, "make-ships-red-on-hit").MakeShipsRedOnHit;
local PickupCannonballs = RuntimeLib.import(script, script, "pickup-cannonballs").PickupCannonballs;
local PirateEndingCutscene = RuntimeLib.import(script, script, "pirate-ending-cutscene").PirateEndingCutscene;
local PirateMusic = RuntimeLib.import(script, script, "pirate-music").PirateMusic;
local PirateShipFireEffect = RuntimeLib.import(script, script, "pirate-ship-fire-effect").PirateShipFireEffect;
local PiratesPopDown = RuntimeLib.import(script, script, "pirates-pop-down").PiratesPopDown;
local ReceiveServerStateBehavior = RuntimeLib.import(script, script, "receive-server-state").ReceiveServerStateBehavior;
local ShipPopsUpOnIsland = RuntimeLib.import(script, script, "ship-pops-up-on-island").ShipPopsUpOnIsland;
local ShipsFlyAwayBehavior = RuntimeLib.import(script, script, "ships-fly-away").ShipsFlyAwayBehavior;
local ShipsReappearAtFrontBehavior = RuntimeLib.import(script, script, "ships-reappear-at-front").ShipsReappearAtFrontBehavior;
local ShipsShootAtIsland = RuntimeLib.import(script, script, "ships-shoot-at-island").ShipsShootAtIsland;
local SpawnFireworks = RuntimeLib.import(script, script, "spawn-fireworks").SpawnFireworks;
local TieUpPlayers = RuntimeLib.import(script, script, "tie-up-players").TieUpPlayers;
local v1 = Scene.new(pirateSceneConfig);
v1:registerBehaviorTable(ManageShipsBehavior);
v1:registerBehaviorTable(ShipsFlyAwayBehavior);
v1:registerBehaviorTable(CreateShipsBehavior);
v1:registerBehaviorTable(ManageAtmosphereBehavior);
v1:registerBehaviorTable(ShipsReappearAtFrontBehavior);
v1:registerBehaviorTable(ShipsShootAtIsland);
v1:registerBehaviorTable(HouseExplodes);
v1:registerBehaviorTable(PickupCannonballs);
v1:registerBehaviorTable(CannonsShootAtShip);
v1:registerBehaviorTable(MakeShipsRedOnHit);
v1:registerBehaviorTable(SpawnFireworks);
v1:registerBehaviorTable(BigExplosion);
v1:registerBehaviorTable(BigShipsShowUp);
v1:registerBehaviorTable(TieUpPlayers);
v1:registerBehaviorTable(ReceiveServerStateBehavior);
v1:registerBehaviorTable(PiratesPopDown);
v1:registerBehaviorTable(ShipPopsUpOnIsland);
v1:registerBehaviorTable(PirateEndingCutscene);
v1:registerBehaviorTable(PirateMusic);
v1:registerBehaviorTable(PirateShipFireEffect);

return {
    pirateScene = v1
};