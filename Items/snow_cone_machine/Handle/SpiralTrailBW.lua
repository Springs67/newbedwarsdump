local u1 = game:GetService("RunService")
local u2 = game:GetService("TweenService")
local u3 = game:GetService("Debris")
local u4 = require(script.CreateTrail)
return {
    ["Init"] = function(_, p5, p6) --[[ Name: Init, Line 11 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
            [3] = u1
            [4] = u3
        --]]
        local v7 = p6.Frequency or (1 / 0)
        local u8 = p6.Radius or 2
        local u9 = p6.Lifetime or (1 / 0)
        local v10 = p6.Time or 0.45
        local u11 = p6.Offset or 0.05
        for _ = 1, v7 do
            local u12 = 0
            local v13 = p6.Size or 0.275
            local v14 = p6.Color or Color3.fromRGB(255, 255, 255)
            local v15 = p6.Transparency or 0
            local v16 = TweenInfo.new(v10, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
            local u17 = Instance.new("Part")
            u17.Anchored = true
            u17.CanCollide = false
            u17.CanTouch = false
            u17.CanQuery = false
            u17.CFrame = p5.CFrame * CFrame.new(0, -(p5.Size.Y / 2), 0)
            u17.Size = Vector3.new(1, 1, 1)
            u17.Transparency = 1
            u17.Parent = p5
            u2:Create(u17, v16, {
                ["Orientation"] = u17.Orientation + Vector3.new(0, 360, 0)
            }):Play()
            local u18 = game.ReplicatedStorage.Assets.Effects.SnowConeMachineParticle:Clone()
            u18.Anchored = true
            u18.CanCollide = false
            u18.CanTouch = false
            u18.CanQuery = false
            u18.CFrame = u17.CFrame
            u18.Size = Vector3.new(1, 1, 1)
            u18.Transparency = 1
            u18.Parent = workspace
            local v19 = u4(u18, v13, v14, v15)
            local v22 = u1.RenderStepped:Connect(function(p20) --[[ Line: 52 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u9
                    [3] = u17
                    [4] = u11
                    [5] = u18
                    [6] = u8
                --]]
                u12 = (u12 + p20 / u9) % 1
                local v21 = 6.283185307179586 * u12
                u17.CFrame = u17.CFrame * CFrame.new(0, u11, 0)
                u18.CFrame = u17.CFrame * CFrame.Angles(0, v21, 0) * CFrame.new(0, 0, u8)
            end)
            task.wait(1.35)
            u18.Attachment.Snowflake.Enabled = false
            v19.Enabled = false
            u3:AddItem(u17, 1)
            u3:AddItem(u18, 1)
            task.wait(1)
            v22:Disconnect()
        end
    end
}