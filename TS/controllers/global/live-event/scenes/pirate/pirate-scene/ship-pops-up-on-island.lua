-- Decompiled with Potassium's decompiler.

local PirateSceneTimestamps = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;

return {
    ShipPopsUpOnIsland = {
        name = "Ship pops up on island",
        event = "Heartbeat",
        priority = -30,

        func = function(p1, p2, p3) -- Line: 8, Name: func
            -- upvalues: PirateSceneTimestamps (copy)
            if p1.elapsedEventTime > PirateSceneTimestamps.BigExplosionHit + 3 then
                local v4 = p2:get("ships");

                if v4 == nil then
                    return nil;
                end;

                local bigShip1 = v4.bigShip1;
                local bigShip2 = v4.bigShip2;
                local bigShip3 = v4.bigShip3;

                if bigShip1 then
                    bigShip1.cframe = CFrame.new(58.445, 395.882, 456.943) * CFrame.Angles(0, -1.3089969389957472, 0);
                end;

                if bigShip2 then
                    bigShip2.cframe = CFrame.new(97.652, 388.882, 206.858) * CFrame.Angles(0, 0.7853981633974483, 0);
                end;

                if bigShip3 then
                    bigShip3.cframe = CFrame.new(-141.835, 430.882, 293.584) * CFrame.Angles(0, -2.6179938779914944, 0);
                end;

                p2:set("ships", v4);
            end;
        end
    }
};