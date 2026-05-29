local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.ReplicatedStorage
local u5 = v3.TweenService
local u6 = v3.Workspace
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
return function(_) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u2
        [4] = u7
        [5] = u5
    --]]
    local u8 = u4.Assets.Effects.PirateTreasure:Clone()
    u8.Parent = u6
    u2(u8, 1.25)
    local v9 = u4.Assets.Effects.MagicMirrorExplosion:Clone()
    v9.Parent = u8
    v9:PivotTo(u8:GetPivot())
    u7:playEffects({ v9 }, nil, {
        ["destroyAfterSec"] = 1
    })
    local function u21(u10) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u8
            [4] = u7
        --]]
        local u11 = Color3.fromRGB(255, 79, 79)
        local v12 = u10.PrimaryPart
        if v12 then
            local u13 = u5:Create(v12, TweenInfo.new(0.025, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, true), {
                ["CFrame"] = v12:GetPivot() * CFrame.Angles(0, 0, -0.03490658503988659)
            })
            local u14 = u5:Create(v12, TweenInfo.new(0.025, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, true), {
                ["CFrame"] = v12:GetPivot() * CFrame.Angles(0, 0, 0.03490658503988659)
            })
            local u15 = 0
            u13:Play()
            u13.Completed:Connect(function() --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u14
                --]]
                u14:Play()
            end)
            u14.Completed:Connect(function() --[[ Line: 49 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u13
                --]]
                u15 = u15 + 1
                if u15 == 6 then
                    return nil
                end
                u13:Play()
            end)
        end
        local u16 = u10:WaitForChild("Main", 3)
        if u16 ~= nil then
            u16 = u16:WaitForChild("neon", 3)
        end
        if u16 then
            u5:Create(u16, TweenInfo.new(0.7000000000000001), {
                ["Color"] = u11
            }):Play()
        end
        task.delay(0.7000000000000001, function() --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u5
                [3] = u4
                [4] = u8
                [5] = u11
                [6] = u7
                [7] = u16
            --]]
            local u17 = u10:WaitForChild("Main", 3)
            if u17 ~= nil then
                u17 = u17:WaitForChild("Hinge", 3)
            end
            local v18 = u17:FindFirstChildWhichIsA("WeldConstraint")
            if v18 ~= nil then
                v18:Destroy()
            end
            u17.Anchored = true
            u5:Create(u17, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                ["CFrame"] = u17.CFrame * CFrame.Angles(0.08726646259971647, 0, 0)
            }):Play()
            local v19 = u4.Assets.Effects.PulseEffect:Clone()
            v19.Parent = u8
            v19:PivotTo(u8:GetPivot())
            v19.Pulse.Color = ColorSequence.new(u11)
            u7:playEffects({ v19 }, nil, {
                ["destroyAfterSec"] = 1
            })
            local v20 = u16
            if v20 ~= nil then
                v20:Destroy()
            end
            task.delay(2, function() --[[ Line: 98 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u10
                    [3] = u5
                    [4] = u17
                --]]
                u7:enableInstanceEffect(u10)
                u5:Create(u17, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    ["CFrame"] = u17.CFrame * CFrame.Angles(1.7951958020513104, 0, 0)
                }):Play()
            end)
        end)
    end
    task.delay(2, function() --[[ Line: 127 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u8
        --]]
        u21(u8)
    end)
    return function() --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        u8:Destroy()
    end
end