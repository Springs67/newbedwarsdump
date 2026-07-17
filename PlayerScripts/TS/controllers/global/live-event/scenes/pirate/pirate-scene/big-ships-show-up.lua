-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local PirateSceneTimestamps = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local setupShipAnim = RuntimeLib.import(script, script.Parent, "modules", "setup-ship-anim").setupShipAnim;
local u2 = { "bigShip1", "bigShip2", "bigShip3" };

return {
    BigShipsShowUp = {
        name = "Big ships show up",
        event = "Heartbeat",
        priority = -20,

        func = function(p3, p4, p5) -- Line: 16, Name: func
            -- upvalues: PirateSceneTimestamps (copy), u2 (copy), ReplicatedStorage (copy), Workspace (copy), setupShipAnim (copy), Linear (copy), SoundManager (copy), GameSound (copy)
            local v6 = p4:get("ships");

            if v6 == nil then
                return nil;
            end;

            if p3.elapsedEventTime > PirateSceneTimestamps.CelebrationEnds then
                local v7 = false;

                for i, v in pairs(u2) do
                    local v8 = v6[v];

                    if v8 then
                        local v9 = Linear(p3.elapsedEventTime - PirateSceneTimestamps.CelebrationEnds, 0, 1, PirateSceneTimestamps.BigShipsArrive - PirateSceneTimestamps.CelebrationEnds);
                        local v10 = Linear(math.clamp(v9, 0, 1), -1200, 400, 1);
                        v8.cframe = CFrame.new((Vector3.new(-600 + 300 * i, 500, v10))) * CFrame.Angles(0, 3.141592653589793, 0);
                    else
                        v7 = true;
                        local v11;

                        if i == 2 then
                            v11 = ReplicatedStorage.Assets.Misc.RoyalPirateShip:Clone();
                        else
                            v11 = ReplicatedStorage.Assets.Misc.PirateShip:Clone();
                        end;

                        v11.Parent = Workspace;
                        v6[v] = {
                            timeOffset = 980,
                            seed = 948074,
                            heightOffset = 0,
                            radiusX = 900,
                            radiusY = 900,
                            instance = v11,
                            cframe = CFrame.new()
                        };
                        setupShipAnim(v11);
                    end;
                end;

                if v7 then
                    SoundManager:playSound(GameSound.PIRATE_EVENT_MOTHERSHIP, {
                        volumeMultiplier = 3,
                        position = Vector3.new(17, 700, -1200),
                        rollOffMaxDistance = 1000000,
                        rollOffMinDistance = 1000
                    });
                end;
            else
                for _, v in u2 do
                    v6[v] = nil;
                end;
            end;

            p4:set("ships", v6);
        end
    }
};