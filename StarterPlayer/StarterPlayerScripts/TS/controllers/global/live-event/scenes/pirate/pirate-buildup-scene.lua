local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-buildup-scene-config").pirateBuildupSceneConfig
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system").Scene
local v4 = v1.import(script, script.Parent, "shared-behaviors", "create-ships").CreateShipsBehavior
local v5 = v1.import(script, script.Parent, "shared-behaviors", "manage-atmosphere").ManageAtmosphereBehavior
local v6 = v1.import(script, script.Parent, "shared-behaviors", "manage-ships").ManageShipsBehavior
local v7 = v1.import(script, script, "behaviors", "ships-fire-tnt").ShipsFireTntBehavior
local v8 = v1.import(script, script, "move-ships").MoveShipsBehavior
local v9 = v3.new(v2)
v9:registerBehaviorTable(v6)
v9:registerBehaviorTable(v8)
v9:registerBehaviorTable(v4)
v9:registerBehaviorTable(v5)
v9:registerBehaviorTable(v7)
return {
    ["pirateBuildupScene"] = v9
}