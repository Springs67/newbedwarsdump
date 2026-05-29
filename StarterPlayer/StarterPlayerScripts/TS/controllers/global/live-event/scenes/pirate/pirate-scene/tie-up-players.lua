local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "plasma", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.Players
local u5 = v3.ReplicatedStorage
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
return {
    ["TieUpPlayers"] = {
        ["name"] = "tie up players",
        ["event"] = "Heartbeat",
        ["priority"] = 0,
        ["func"] = function(p8, _, _) --[[ Name: func, Line 13 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u4
                [3] = u2
                [4] = u5
                [5] = u7
            --]]
            if p8.elapsedEventTime > u6.BigExplosionHit then
                local u9 = u4.LocalPlayer.Character
                if u9 then
                    u9.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                    u9.Humanoid.PlatformStand = true
                    u2.useEffect(function() --[[ Line: 19 ]]
                        --[[
                        Upvalues:
                            [1] = u9
                            [2] = u4
                        --]]
                        local v10 = u9.HumanoidRootPart
                        local v11 = math.random(-30, 30)
                        local v12 = math.random(-30, 30)
                        local v13 = math.random
                        v10:ApplyAngularImpulse(Vector3.new(v11, v12, v13(-30, 30)) * u9.HumanoidRootPart.AssemblyMass)
                        u4.LocalPlayer.CameraMaxZoomDistance = 25
                    end)
                end
                for _, v14 in u4:GetPlayers() do
                    if v14.Character and not v14.Character:FindFirstChild("RopePart") then
                        local v15 = u5.Assets.Misc.LassoWrap.default:Clone()
                        v15.Name = "RopePart"
                        v15.Parent = v14.Character
                        local v16 = v14.Character:FindFirstChild("UpperTorso")
                        if not v16 then
                            return nil
                        end
                        local v17 = v16.CFrame
                        local v18 = CFrame.Angles(0, 1.5707963267948966, 0)
                        v15.Rope.CFrame = v17 * v18
                        u7:weldParts(v15.Rope, v16)
                    end
                end
            end
        end
    }
}