local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps
return {
    ["getPirateShipTargetHealth"] = function(p2) --[[ Name: getPirateShipTargetHealth, Line 4 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local v3 = (u1.ShipGetShotDown - p2) / (u1.ShipGetShotDown - u1.PreparationEnds)
        return math.clamp(v3, 0, 1) * 1000
    end
}