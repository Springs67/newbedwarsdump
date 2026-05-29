local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps
return {
    ["PirateEndingCutscene"] = {
        ["name"] = "pirates ending cutscene",
        ["event"] = "RenderStepped",
        ["func"] = function(p4, p5, _) --[[ Name: func, Line 8 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u2
            --]]
            if p4.elapsedEventTime < u3.BigExplosionHit + 3 then
                return nil
            end
            local v6 = p5:get("hannahModel")
            if v6 == nil then
                return nil
            end
            u2.CurrentCamera.CameraType = Enum.CameraType.Scriptable
            u2.CurrentCamera.FieldOfView = 50
            local v7 = CFrame
            local v8 = v6.UpperTorso.Position
            u2.CurrentCamera.CFrame = v7.lookAt(Vector3.new(10.451, 294, 323.074), v8 + Vector3.new(0, 3, 0))
        end
    }
}