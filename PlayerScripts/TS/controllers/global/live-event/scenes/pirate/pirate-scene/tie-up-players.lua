-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local PirateSceneTimestamps = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;

return {
    TieUpPlayers = {
        name = "tie up players",
        event = "Heartbeat",
        priority = 0,

        func = function(p3, p4, p5) -- Line: 13, Name: func
            -- upvalues: PirateSceneTimestamps (copy), Players (copy), u1 (copy), ReplicatedStorage (copy), WeldUtil (copy)
            if p3.elapsedEventTime > PirateSceneTimestamps.BigExplosionHit then
                local Character = Players.LocalPlayer.Character;

                if Character then
                    Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
                    Character.Humanoid.PlatformStand = true;
                    u1.useEffect(function() -- Line: 19
                        -- upvalues: Character (copy), Players (ref)
                        local HumanoidRootPart = Character.HumanoidRootPart;
                        local v6 = math.random(-30, 30);
                        local v7 = math.random(-30, 30);
                        HumanoidRootPart:ApplyAngularImpulse(Vector3.new(v6, v7, math.random(-30, 30)) * Character.HumanoidRootPart.AssemblyMass);
                        Players.LocalPlayer.CameraMaxZoomDistance = 25;
                    end);
                end;

                for _, v in Players:GetPlayers() do
                    if v.Character and not v.Character:FindFirstChild("RopePart") then
                        local v8 = ReplicatedStorage.Assets.Misc.LassoWrap.default:Clone();
                        v8.Name = "RopePart";
                        v8.Parent = v.Character;
                        local UpperTorso = v.Character:FindFirstChild("UpperTorso");

                        if not UpperTorso then
                            return nil;
                        end;

                        local CFrame2 = UpperTorso.CFrame;
                        local v9 = CFrame.Angles(0, 1.5707963267948966, 0);
                        v8.Rope.CFrame = CFrame2 * v9;
                        WeldUtil:weldParts(v8.Rope, UpperTorso);
                    end;
                end;
            end;
        end
    }
};