-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local ScreenShakeUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "screen-shake", "screen-shake-util").ScreenShakeUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local PirateSceneTimestamps = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local u3 = Random.new();

return {
    HouseExplodes = {
        name = "house explodes",
        event = "Heartbeat",

        func = function(p4, p5, p6) -- Line: 18, Name: func
            -- upvalues: PirateSceneTimestamps (copy), CollectionService (copy), Workspace (copy), u1 (copy), ReplicatedStorage (copy), SoundManager (copy), GameSound (copy), Players (copy), EffectUtil (copy), ScreenShakeUtil (copy), u3 (copy)
            local u7 = p5:get("ships");

            if u7 == nil then
                return nil;
            end;

            if p4.elapsedEventTime < PirateSceneTimestamps.HouseExplodes then
                return nil;
            end;

            local ship1 = u7.ship1;
            local v8;

            if ship1 then
                v8 = ship1.animationTrack;

                if v8 ~= nil then
                    v8 = v8.IsPlaying;
                end;
            else
                v8 = ship1;
            end;

            if v8 then
                local animationTrack = ship1.animationTrack;

                if animationTrack ~= nil then
                    animationTrack:Stop();
                end;
            end;

            for _, v in CollectionService:GetTagged("delete-upon-ship-impact") do
                if v:IsDescendantOf(Workspace) then
                    v:Destroy();
                end;
            end;

            u1.portal(Workspace, function() -- Line: 46
                -- upvalues: u1 (ref), ReplicatedStorage (ref), u7 (copy), SoundManager (ref), GameSound (ref), Players (ref), Workspace (ref), EffectUtil (ref), ScreenShakeUtil (ref), u3 (ref)
                local u11 = u1.useInstance(function(p9) -- Line: 47
                    -- upvalues: ReplicatedStorage (ref)
                    local v10 = ReplicatedStorage.Assets.Effects.FracturedHouse:Clone();
                    v10:PivotTo(CFrame.new(183.959, 345.427, 323.018) * CFrame.Angles(0, 3.141592653589793, 0));
                    p9.model = v10;

                    return v10;
                end);
                u1.useEffect(function() -- Line: 56
                    -- upvalues: u7 (ref), SoundManager (ref), GameSound (ref), Players (ref), Workspace (ref), ReplicatedStorage (ref), EffectUtil (ref), ScreenShakeUtil (ref), u11 (copy), u3 (ref)
                    local ship12 = u7.ship1;

                    if ship12 ~= nil then
                        ship12 = ship12.cframe;
                    end;

                    local PIRATE_EVENT_SHIP_CRASH = GameSound.PIRATE_EVENT_SHIP_CRASH;
                    local v12 = {};
                    local v13;

                    if ship12 == nil then
                        v13 = ship12;
                    else
                        v13 = ship12.Position;
                    end;

                    v12.position = v13;
                    v12.rollOffMaxDistance = 500;
                    v12.rollOffMinDistance = 300;
                    SoundManager:playSound(PIRATE_EVENT_SHIP_CRASH, v12);
                    local LocalPlayer = Players.LocalPlayer;

                    if LocalPlayer ~= nil then
                        LocalPlayer = LocalPlayer.Character;

                        if LocalPlayer ~= nil then
                            LocalPlayer = LocalPlayer:GetPrimaryPartCFrame();
                        end;
                    end;

                    if LocalPlayer == nil then
                        LocalPlayer = Workspace.CurrentCamera.CFrame;
                    end;

                    local v14 = ReplicatedStorage.Assets.Effects.PirateShipCrash:Clone();
                    local v15;

                    if ship12 == nil then
                        v15 = ship12;
                    else
                        v15 = ship12.Position;
                    end;

                    if v15 == nil then
                        v15 = Vector3.new();
                    end;

                    v14.Position = v15;
                    v14.Parent = Workspace;
                    EffectUtil:playEffects({ v14 }, nil, {
                        destroyAfterSec = 5
                    });
                    local Position = u11.model:GetPrimaryPartCFrame().Position;
                    local Position2 = u11.model:GetPrimaryPartCFrame().Position;
                    ScreenShakeUtil.shake(Position, (Position2 - LocalPlayer.Position).Unit, {
                        magnitude = 3,
                        duration = 0.46
                    });

                    for _, child in u11.model:GetChildren() do
                        if child:IsA("BasePart") then
                            child.Anchored = false;

                            if ship12 then
                                local Position3 = child.Position;
                                local Position4 = ship12.Position;
                                local v16 = u3:NextNumber(-1, 1);
                                local v17 = u3:NextNumber(-1, 1);
                                local v18 = Vector3.new(v16, v17, u3:NextNumber(-1, 1)) * 20;
                                child:ApplyImpulse((Position3 - (Position4 - Vector3.new(0, 10, 0)) + v18).Unit * (child.AssemblyMass * 150));
                                local v19 = u3:NextNumber(-1, 1);
                                local v20 = u3:NextNumber(-1, 1);
                                child:ApplyAngularImpulse(Vector3.new(v19, v20, u3:NextNumber(-1, 1)) * (child.AssemblyMass * 300));
                            end;
                        end;
                    end;
                end);
            end);
        end
    }
};