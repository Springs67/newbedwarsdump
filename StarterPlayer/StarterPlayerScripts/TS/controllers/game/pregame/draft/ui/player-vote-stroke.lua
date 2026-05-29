local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
return {
    ["PlayerVoteStroke"] = v4.new(u3)(function(p6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
            [3] = u5
        --]]
        local v8 = p7.useEffect
        local u9 = u3.createRef()
        v8(function() --[[ Line: 10 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u2
                [3] = u5
            --]]
            local u10 = u9:getValue()
            if not u10 then
                return nil
            end
            local u11 = u2.new()
            local u12 = u5:Create(u10, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ["Transparency"] = 0.05
            })
            local u13 = u5:Create(u10, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ["Transparency"] = 0.75
            })
            u11:GiveTask(u12.Completed:Connect(function() --[[ Line: 22 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u13
                --]]
                u11:GiveTask(task.delay(0.5, function() --[[ Line: 23 ]]
                    --[[
                    Upvalues:
                        [1] = u13
                    --]]
                    u13:Play()
                end))
            end))
            u11:GiveTask(function() --[[ Line: 27 ]]
                --[[
                Upvalues:
                    [1] = u12
                --]]
                u12:Cancel()
                u12:Destroy()
            end)
            u11:GiveTask(u13.Completed:Connect(function() --[[ Line: 31 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u12
                --]]
                u11:GiveTask(task.delay(0.5, function() --[[ Line: 32 ]]
                    --[[
                    Upvalues:
                        [1] = u12
                    --]]
                    u12:Play()
                end))
            end))
            u11:GiveTask(function() --[[ Line: 36 ]]
                --[[
                Upvalues:
                    [1] = u13
                --]]
                u13:Cancel()
                u13:Destroy()
            end)
            u12:Play()
            return function() --[[ Line: 41 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u10
                --]]
                u11:Destroy()
                u10.Transparency = 0
            end
        end, { p6.Blink })
        return u3.createElement("UIStroke", {
            [u3.Ref] = u9,
            ["Thickness"] = 2,
            ["Color"] = p6.Color,
            ["Transparency"] = 0.3
        })
    end)
}