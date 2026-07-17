-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local PirateSceneTimestamps = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local createCannonball = RuntimeLib.import(script, script.Parent, "modules", "create-cannonball").createCannonball;
local u1 = Random.new();

return {
    ShipsShootAtIsland = {
        name = "Ships shoot at island",
        event = "Heartbeat",

        func = function(p2, p3, p4) -- Line: 9, Name: func
            -- upvalues: PirateSceneTimestamps (copy), u1 (copy), createCannonball (copy)
            if p2.elapsedEventTime < PirateSceneTimestamps.PreparationEnds or p2.elapsedEventTime > PirateSceneTimestamps.ShipGetShotDown then
                return nil;
            end;

            local v5 = p3:get("ships");

            if v5 ~= nil then
                v5 = v5.ship1;
            end;

            if v5 == nil then
                return nil;
            end;

            if p3:get("nextFireShot") == nil then
                p3:set("nextFireShot", os.clock() + 5);

                return nil;
            end;

            if p3:get("nextFireShot") > os.clock() then
                return nil;
            end;

            p3:set("nextFireShot", os.clock() + u1:NextNumber(0, 3));
            local v6 = u1:NextNumber(-200, 200);
            local v7 = Vector3.new(38, 293.05, 302) + Vector3.new(v6, 0, u1:NextNumber(-200, 200));
            createCannonball({
                origin = v5.cframe.Position,
                goal = v7
            });
        end
    }
};