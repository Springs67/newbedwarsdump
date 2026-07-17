-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local RandomUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local PirateSceneTimestamps = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local u1 = Random.new();

return {
    SpawnFireworks = {
        name = "Spawn fireworks",
        event = "Heartbeat",

        func = function(p2, p3, p4) -- Line: 11, Name: func
            -- upvalues: PirateSceneTimestamps (copy), u1 (copy), RandomUtil (copy), FireworkType (copy), KnitClient (copy)
            if p2.elapsedEventTime > PirateSceneTimestamps.CelebrationStarts and p2.elapsedEventTime < PirateSceneTimestamps.CelebrationEnds then
                local v5 = p3:get("nextFireworkLaunch");

                if v5 == nil then
                    p3:set("nextFireworkLaunch", os.clock() + 0.1);

                    return nil;
                end;

                if v5 < os.clock() then
                    p3:set("nextFireworkLaunch", os.clock() + 0.15);
                    local v6 = u1:NextNumber(-200, 200);
                    local v7 = 30 + u1:NextNumber(-10, 10);
                    local v8 = Vector3.new(38, 293.05, 302) + Vector3.new(v6, v7, u1:NextNumber(-200, 200));
                    local v9 = RandomUtil.fromList(FireworkType.HEART, FireworkType.NORMAL, FireworkType.SPARKS);
                    KnitClient.Controllers.FireworkController:playFireworkEffect(v8, v9);
                end;
            end;
        end
    }
};