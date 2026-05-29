local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.RunService
local u7 = v5.TweenService
return {
    ["VignetteApp"] = v4.new(u3)(function(u8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
            [3] = u7
            [4] = u6
        --]]
        local v10 = p9.useEffect
        local u11 = u3.createRef()
        v10(function() --[[ Line: 12 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u2
                [3] = u8
                [4] = u7
                [5] = u6
            --]]
            local u12 = u11:getValue()
            if not u12 then
                return nil
            end
            local u13 = u2.new()
            local u14 = u2.new()
            local u15 = false
            local v16 = task
            local v17 = u8.fadeInDuration
            local v18 = v17 == nil and 0 or v17
            u13:GiveTask(v16.delay(v18, function() --[[ Line: 26 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u8
                    [3] = u7
                    [4] = u12
                    [5] = u13
                    [6] = u14
                    [7] = u6
                --]]
                if u15 then
                    return nil
                else
                    local v19 = u8.fadeInDuration
                    if v19 ~= 0 and (v19 == v19 and v19) then
                        v19 = u8.fadeInDuration > 0
                    end
                    if v19 ~= 0 and (v19 == v19 and v19) then
                        local v20 = u8.transparencyFunction
                        if v20 ~= nil then
                            v20 = v20.peakValue
                        end
                        if v20 == nil then
                            v20 = u8.transparency
                        end
                        if v20 ~= 0 and (v20 == v20 and v20) then
                            v20 = v20 > 0
                        end
                        if v20 ~= 0 and (v20 == v20 and v20) then
                            local v21 = u7
                            local v22 = u8.fadeInDuration
                            local v23 = v22 == nil and 0 or v22
                            local v24 = TweenInfo.new(v23, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
                            local v25 = {}
                            local v26 = u8.transparencyFunction
                            if v26 ~= nil then
                                v26 = v26.peakValue
                            end
                            if v26 == nil then
                                v26 = u8.transparency
                            end
                            v25.ImageTransparency = v26
                            local v27 = v21:Create(u12, v24, v25)
                            u13:GiveTask(v27)
                            v27:Play()
                            v27.Completed:Wait()
                        end
                    end
                    local v28 = u8.transparency
                    if v28 == 0 or (v28 ~= v28 or not v28) then
                        if u8.transparencyFunction then
                            local u29 = 0
                            u14:GiveTask(u6.RenderStepped:Connect(function(p30) --[[ Line: 77 ]]
                                --[[
                                Upvalues:
                                    [1] = u12
                                    [2] = u8
                                    [3] = u29
                                --]]
                                u12.ImageTransparency = u8.transparencyFunction["function"](u29)
                                u29 = u29 + p30
                            end))
                            u13:GiveTask(u14)
                        end
                    else
                        u12.ImageTransparency = u8.transparency
                    end
                end
            end))
            u13:GiveTask(u8.signalDestroy:Connect(function() --[[ Line: 84 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u8
                    [3] = u15
                    [4] = u14
                    [5] = u7
                    [6] = u12
                --]]
                u13:GiveTask(task.spawn(function() --[[ Line: 85 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u15
                        [3] = u14
                        [4] = u7
                        [5] = u12
                        [6] = u13
                    --]]
                    local v31 = u8.fadeOutDuration
                    if v31 ~= 0 and (v31 == v31 and v31) then
                        v31 = u8.fadeOutDuration > 0
                    end
                    if v31 == 0 or (v31 ~= v31 or not v31) then
                        u13:Destroy()
                    else
                        u15 = true
                        u14:Destroy()
                        local v32 = u7:Create(u12, TweenInfo.new(u8.fadeOutDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                            ["ImageTransparency"] = 1
                        })
                        v32:Play()
                        v32.Completed:Wait()
                        task.delay(u8.fadeOutDuration, function() --[[ Line: 98 ]]
                            --[[
                            Upvalues:
                                [1] = u13
                            --]]
                            u13:Destroy()
                        end)
                    end
                end))
            end))
            return function() --[[ Line: 106 ]]
                --[[
                Upvalues:
                    [1] = u13
                --]]
                u13:Destroy()
            end
        end, {})
        local v33 = {}
        local _ = #v33
        local v34 = {
            [u3.Ref] = u11,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v35 = u8.image
        v34.Image = v35 == nil and "rbxassetid://139778046372610" or v35
        v34.ImageColor3 = u8.color or Color3.fromRGB(255, 255, 255)
        v34.BackgroundTransparency = 1
        v34.ImageTransparency = 1
        v33.VignetteApp = u3.createElement("ImageLabel", v34)
        return u3.createElement("ScreenGui", {
            ["IgnoreGuiInset"] = true
        }, v33)
    end)
}