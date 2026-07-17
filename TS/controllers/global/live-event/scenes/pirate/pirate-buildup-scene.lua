-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local pirateBuildupSceneConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-buildup-scene-config").pirateBuildupSceneConfig;
local Scene = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system").Scene;
local CreateShipsBehavior = RuntimeLib.import(script, script.Parent, "shared-behaviors", "create-ships").CreateShipsBehavior;
local ManageAtmosphereBehavior = RuntimeLib.import(script, script.Parent, "shared-behaviors", "manage-atmosphere").ManageAtmosphereBehavior;
local ManageShipsBehavior = RuntimeLib.import(script, script.Parent, "shared-behaviors", "manage-ships").ManageShipsBehavior;
local ShipsFireTntBehavior = RuntimeLib.import(script, script, "behaviors", "ships-fire-tnt").ShipsFireTntBehavior;
local MoveShipsBehavior = RuntimeLib.import(script, script, "move-ships").MoveShipsBehavior;
local v1 = Scene.new(pirateBuildupSceneConfig);
v1:registerBehaviorTable(ManageShipsBehavior);
v1:registerBehaviorTable(MoveShipsBehavior);
v1:registerBehaviorTable(CreateShipsBehavior);
v1:registerBehaviorTable(ManageAtmosphereBehavior);
v1:registerBehaviorTable(ShipsFireTntBehavior);

return {
    pirateBuildupScene = v1
};