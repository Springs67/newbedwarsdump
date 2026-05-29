local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
return {
    ["GlitchedTextLabel"] = v4.new(u3)(function(u6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
            [3] = u5
        --]]
        local _ = p7.useState
        local v8 = p7.useEffect
        local u9 = u3.createRef()
        v8(function() --[[ Line: 11 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u6
                [3] = u2
                [4] = u5
            --]]
            local u10 = u9:getValue()
            if not u10 then
                return nil
            end
            local u11 = true
            local u12 = Random.new()
            local v13 = u6.AnimationConfig
            if v13 ~= nil then
                v13 = v13.DisableRandomMovement
            end
            if not v13 then
                local u14 = u2.isSmallScreen() and { -4, 4 } or { -9, 9 }
                task.spawn(function() --[[ Line: 24 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u12
                        [3] = u14
                        [4] = u10
                        [5] = u11
                    --]]
                    while true do
                        local v15 = u6.TextLabelProps.Position
                        if v15 ~= nil then
                            v15 = v15 + UDim2.fromOffset(u12:NextNumber(u14[1], u14[2]), u12:NextNumber(u14[1], u14[2]))
                        end
                        if v15 == nil then
                            v15 = u10.Position
                        end
                        u10.Position = v15
                        local v16 = u11
                        if v16 then
                            v16 = task.wait(u12:NextNumber(1, 2))
                        end
                        if v16 == 0 or (v16 ~= v16 or not v16) then
                            return
                        end
                    end
                end)
            end
            local v17 = u6.AnimationConfig
            if v17 ~= nil then
                v17 = v17.DisableRandomTransparency
            end
            if not v17 then
                task.spawn(function() --[[ Line: 47 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u12
                        [3] = u11
                    --]]
                    while true do
                        u10.TextTransparency = u12:NextNumber()
                        local v18 = u11
                        if v18 then
                            v18 = task.wait(u12:NextNumber(0.2, 1))
                        end
                        if v18 == 0 or (v18 ~= v18 or not v18) then
                            return
                        end
                    end
                end)
            end
            local v19 = u6.AnimationConfig
            if v19 ~= nil then
                v19 = v19.DisableRandomSpaz
            end
            if not v19 then
                task.spawn(function() --[[ Line: 61 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u5
                        [3] = u6
                        [4] = u12
                        [5] = u10
                        [6] = u11
                    --]]
                    local v20 = u2.isSmallScreen() and { -4, 4 } or { -9, 9 }
                    while true do
                        local v21 = u5
                        local v22 = TweenInfo.new(0.05, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 6, true)
                        local v23 = {}
                        local v24 = u6.TextLabelProps.Position
                        if v24 ~= nil then
                            v24 = v24 + UDim2.fromOffset(u12:NextNumber(v20[1], v20[2]), u12:NextNumber(v20[1], v20[2]))
                        end
                        if v24 == nil then
                            v24 = u10.Position
                        end
                        v23.Position = v24
                        v21:Create(u10, v22, v23):Play()
                        local v25 = u11
                        if v25 then
                            v25 = task.wait(u12:NextNumber(1, 2))
                        end
                        if v25 == 0 or (v25 ~= v25 or not v25) then
                            return
                        end
                    end
                end)
            end
        end, {})
        local v26 = {}
        for v27, v28 in u6.TextLabelProps do
            v26[v27] = v28
        end
        v26[u3.Ref] = u9
        v26.BackgroundTransparency = 1
        return u3.createElement("TextLabel", v26)
    end)
}