-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local PirateSceneTimestamps = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;

return {
    PirateEndingCutscene = {
        name = "pirates ending cutscene",
        event = "RenderStepped",

        func = function(p1, p2, p3) -- Line: 8, Name: func
            -- upvalues: PirateSceneTimestamps (copy), Workspace (copy)
            if p1.elapsedEventTime < PirateSceneTimestamps.BigExplosionHit + 3 then
                return nil;
            end;

            local v4 = p2:get("hannahModel");

            if v4 == nil then
                return nil;
            end;

            Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
            Workspace.CurrentCamera.FieldOfView = 50;
            Workspace.CurrentCamera.CFrame = CFrame.lookAt(Vector3.new(10.451, 294, 323.074), v4.UpperTorso.Position + Vector3.new(0, 3, 0));
        end
    }
};