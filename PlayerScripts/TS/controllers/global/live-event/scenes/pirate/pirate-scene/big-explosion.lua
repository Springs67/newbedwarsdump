-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InQuad = v1.InQuad;
local OutQuart = v1.OutQuart;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src");
local useEffect = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src", "Runtime").useEffect;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v4.Lighting;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local PirateSceneTimestamps = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local createCannonball = RuntimeLib.import(script, script.Parent, "modules", "create-cannonball").createCannonball;

return {
    BigExplosion = {
        name = "Big explosion",
        event = "Heartbeat",

        func = function(p5, p6, p7) -- Line: 21, Name: func
            -- upvalues: PirateSceneTimestamps (copy), useEffect (copy), createCannonball (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), OutQuart (copy), InQuad (copy), u3 (copy), Lighting (copy), u2 (copy)
            if p5.elapsedEventTime > PirateSceneTimestamps.BigExplosionShoot then
                useEffect(function() -- Line: 23
                    -- upvalues: PirateSceneTimestamps (ref), createCannonball (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
                    local v8 = PirateSceneTimestamps.BigExplosionHit - PirateSceneTimestamps.BigExplosionShoot;
                    local v9 = createCannonball({
                        origin = Vector3.new(17, 700, -1200),
                        goal = Vector3.new(38, 293.05, 302),
                        bezierControlPoint = (Vector3.new(17, 700, -1200)):Lerp(Vector3.new(38, 293.05, 302), 0.5) + Vector3.new(0, 600, 0),
                        duration = PirateSceneTimestamps.BigExplosionHit - PirateSceneTimestamps.BigExplosionShoot,
                        size = 30,
                        shakeMagnitude = 8,
                        shakeDuration = 0.6,
                        shakeInTravel = true,
                        playHitEffect = false
                    });
                    SoundManager:playSound(GameSound.PIRATE_EVENT_MOTHERSHIP_FIRE, {
                        position = Vector3.new(17, 700, -1200),
                        rollOffMaxDistance = 1000000,
                        rollOffMinDistance = 1000,
                        volumeMultiplier = 2,
                        parent = v9
                    });
                    task.delay(v8, function() -- Line: 49
                        -- upvalues: ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
                        local u10 = ReplicatedStorage.Assets.Effects.BigCannonballLand:Clone();
                        u10.Anchored = true;
                        u10.Position = Vector3.new(38, 293.05, 302);
                        u10.Parent = Workspace;
                        EffectUtil:playEffects(u10:GetDescendants(), nil);
                        SoundManager:playSound(GameSound.PIRATE_EVENT_MOTHERSHIP_IMPACT, {
                            position = Vector3.new(38, 293.05, 302),
                            rollOffMaxDistance = 600,
                            volumeMultiplier = 2
                        });
                        task.delay(3, function() -- Line: 60
                            -- upvalues: u10 (copy)
                            u10:Destroy();
                        end);
                    end);
                end);

                if p5.elapsedEventTime > PirateSceneTimestamps.BigExplosionHit then
                    local u11;

                    if p5.elapsedEventTime < PirateSceneTimestamps.BigExplosionHit + 1 then
                        u11 = OutQuart(math.min(p5.elapsedEventTime - PirateSceneTimestamps.BigExplosionHit, 1), 0, 1, 1);
                    else
                        u11 = p5.elapsedEventTime <= PirateSceneTimestamps.BigExplosionHit + 3 and 1 or InQuad(math.min(p5.elapsedEventTime - (PirateSceneTimestamps.BigExplosionHit + 3), 1), 1, -1, 1);
                    end;

                    u3.portal(Lighting, function() -- Line: 75
                        -- upvalues: u3 (ref), u2 (ref), u11 (ref)
                        u3.useInstance(function(p12) -- Line: 76
                            -- upvalues: u2 (ref)
                            local v13 = u2("ColorCorrectionEffect", {
                                TintColor = Color3.fromRGB()
                            });
                            p12.colorCorrectionEffect = v13;

                            return v13;
                        end).colorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(0, 0, 0), u11);
                    end);
                    u3.portal(Lighting, function() -- Line: 85
                        -- upvalues: u3 (ref), u2 (ref), u11 (ref)
                        u3.useInstance(function(p14) -- Line: 86
                            -- upvalues: u2 (ref)
                            local v15 = u2("BlurEffect", {});
                            p14.blurEffect = v15;

                            return v15;
                        end).blurEffect.Size = u11 * 24;
                    end);
                end;
            end;
        end
    }
};