-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local ReplicatedStorage = v2.ReplicatedStorage;
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local ScreenShakeUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "screen-shake", "screen-shake-util").ScreenShakeUtil;
local PirateSceneTimestamps = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local createCannonball = RuntimeLib.import(script, script.Parent, "modules", "create-cannonball").createCannonball;
local getPirateShipTargetHealth = RuntimeLib.import(script, script.Parent, "modules", "target-health").getPirateShipTargetHealth;

return {
    CannonsShootAtShip = {
        name = "cannons shoot at ship",
        event = "Heartbeat",

        func = function(u3, u4, p5) -- Line: 21, Name: func
            -- upvalues: PirateSceneTimestamps (copy), CollectionService (copy), TweenService (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), ScreenShakeUtil (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), createCannonball (copy), getPirateShipTargetHealth (copy), KnitClient (copy)
            if u3.elapsedEventTime < PirateSceneTimestamps.PreparationEnds then
                return nil;
            end;

            if u3.elapsedEventTime > PirateSceneTimestamps.ShipGetShotDown then
                return nil;
            end;

            local v6 = u4:get("ships");

            if v6 ~= nil then
                v6 = v6.ship1;
            end;

            if v6 == nil then
                return nil;
            end;

            local v7 = u4:get("nextCannonFire");

            if v7 == nil then
                v7 = {};
                u4:set("nextCannonFire", v7);
            end;

            for _, v in CollectionService:GetTagged("LobbyCannon") do
                if v:IsA("Model") and v.PrimaryPart then
                    local v8 = v7[v];

                    if v8 == nil then
                        v8 = os.clock() + math.random(1, 3);
                        v7[v] = v8;
                    end;

                    if v8 < os.clock() then
                        local CFrame2 = v.PrimaryPart.CFrame;
                        local PrimaryPart = v.PrimaryPart;
                        local v9 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                        local v10 = {};
                        local Position = CFrame2.Position;
                        local Position2 = v6.cframe.Position;
                        local v11 = Vector3.new(0, CFrame2.Position.Y, 0);
                        v10.CFrame = CFrame.new(Position, Position2 * Vector3.new(1, 0, 1) + v11) * CFrame.Angles(0, -1.5707963267948966, 0);
                        TweenService:Create(PrimaryPart, v9, v10):Play();
                        v7[v] = os.clock() + math.random(1, 3);
                        local Position3 = (v:GetPrimaryPartCFrame() * CFrame.new(-4, 3.5, 0)).Position;
                        local u12 = ReplicatedStorage.Assets.Effects.CannonShoot.Attachment:Clone();
                        u12.WorldPosition = Position3;
                        u12.Parent = Workspace.Terrain;
                        EffectUtil:playEffects(u12:GetDescendants(), nil, {
                            destroyAfterSec = 3
                        });
                        task.delay(1, function() -- Line: 78
                            -- upvalues: u12 (copy)
                            return u12:Destroy();
                        end);

                        if (Workspace.CurrentCamera.CFrame.Position - Position3).Magnitude < 20 then
                            local Position4 = v6.instance:GetPrimaryPartCFrame().Position;
                            ScreenShakeUtil.shake(Position3, (Position3 - Position4).Unit, {
                                magnitude = 1.2,
                                cycles = 5,
                                duration = 0.2
                            });
                        end;

                        SoundManager:playSound(RandomUtil.fromList(GameSound.PIRATE_CANNON_1, GameSound.PIRATE_CANNON_2, GameSound.PIRATE_CANNON_3), {
                            rollOffMaxDistance = 150,
                            position = u12.Position,
                            parent = u12
                        });
                        local v13 = select(2, v6.instance:GetBoundingBox());
                        local v14 = math.random() - 0.5;
                        local v15 = math.random() - 0.5;
                        local v16 = math.random() - 0.5;
                        local v17 = v13 * (Vector3.new(v14, v15, v16) * 0.5);
                        local v18 = RaycastParams.new();
                        v18.FilterDescendantsInstances = { v6.instance };
                        v18.FilterType = Enum.RaycastFilterType.Whitelist;
                        local v19 = Workspace:Raycast(Position3, (v6.cframe.Position + v17 - Position3) * 1.5, v18);
                        local v20 = {
                            duration = 1,
                            origin = Position3
                        };
                        local v21;

                        if v19 then
                            v21 = v19.Position;
                        else
                            v21 = v6.cframe.Position + v17;
                        end;

                        v20.goal = v21;
                        createCannonball(v20);
                        task.delay(1, function() -- Line: 109
                            -- upvalues: u4 (copy), getPirateShipTargetHealth (ref), u3 (copy), KnitClient (ref)
                            local v22 = u4:get("shipHealth");
                            local v23 = v22 == nil and 1000 or v22;
                            local v24 = getPirateShipTargetHealth(u3.elapsedEventTime);

                            if v23 < v24 then
                                return nil;
                            end;

                            local v25 = v23 - (v23 - v24) / 3;
                            u4:set("shipHealth", v25);
                            KnitClient.Controllers.BossBarController:updateHealth(v25);
                        end);
                    end;
                end;
            end;

            u4:set("nextCannonFire", v7);
        end
    }
};