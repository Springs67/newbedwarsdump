-- Decompiled with Potassium's decompiler.

local PirateSceneTimestamps = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;

return {
    getPirateShipTargetHealth = function(p1) -- Line: 4, Name: getPirateShipTargetHealth
        -- upvalues: PirateSceneTimestamps (copy)
        return math.clamp((PirateSceneTimestamps.ShipGetShotDown - p1) / (PirateSceneTimestamps.ShipGetShotDown - PirateSceneTimestamps.PreparationEnds), 0, 1) * 1000;
    end
};