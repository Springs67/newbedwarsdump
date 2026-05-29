local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
return {
    ["UIGlitchEffectInstance"] = v6.new(u5)(function(u8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u7
            [4] = u4
        --]]
        local _ = p9.useState
        local v10 = p9.useEffect
        local u11 = u5.createRef()
        v10(function() --[[ Line: 13 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u8
                [3] = u3
                [4] = u7
            --]]
            local u12 = u11:getValue()
            if not u12 then
                return nil
            end
            local u13 = u12.Position
            local u14 = true
            local u15 = Random.new()
            local v16 = u8.AnimationConfig
            if v16 ~= nil then
                v16 = v16.DisableRandomMovement
            end
            if not v16 then
                local u17 = u3.isSmallScreen() and { -4, 4 } or { -9, 9 }
                task.spawn(function() --[[ Line: 27 ]]
                    --[[
                    Upvalues:
                        [1] = u13
                        [2] = u15
                        [3] = u17
                        [4] = u12
                        [5] = u14
                    --]]
                    while true do
                        local v18 = u13
                        if v18 ~= nil then
                            v18 = v18 + UDim2.fromOffset(u15:NextNumber(u17[1], u17[2]), u15:NextNumber(u17[1], u17[2]))
                        end
                        if v18 == nil then
                            v18 = u12.Position
                        end
                        u12.Position = v18
                        local v19 = u14
                        if v19 then
                            v19 = task.wait(u15:NextNumber(1, 2))
                        end
                        if v19 == 0 or (v19 ~= v19 or not v19) then
                            return
                        end
                    end
                end)
            end
            local v20 = u8.AnimationConfig
            if v20 ~= nil then
                v20 = v20.DisableRandomTransparency
            end
            if not v20 then
                local u21 = u8.Element.props.BackgroundTransparency == 1
                task.spawn(function() --[[ Line: 51 ]]
                    --[[
                    Upvalues:
                        [1] = u15
                        [2] = u12
                        [3] = u21
                        [4] = u14
                    --]]
                    while true do
                        local v22 = u15:NextNumber()
                        for v23, v24 in u12:GetChildren() do
                            local _ = v23 - 1
                            if v24:IsA("GuiObject") then
                                if v24:IsA("TextLabel") then
                                    v24.TextTransparency = v22
                                end
                                if v24:IsA("ImageLabel") then
                                    v24.ImageTransparency = v22
                                end
                                if not u21 then
                                    v24.BackgroundTransparency = v22
                                end
                            end
                        end
                        local v25 = u14
                        if v25 then
                            v25 = task.wait(u15:NextNumber(0.2, 1))
                        end
                        if v25 == 0 or (v25 ~= v25 or not v25) then
                            return
                        end
                    end
                end)
            end
            local v26 = u8.AnimationConfig
            if v26 ~= nil then
                v26 = v26.DisableRandomSpaz
            end
            if not v26 then
                task.spawn(function() --[[ Line: 83 ]]
                    --[[
                    Upvalues:
                        [1] = u3
                        [2] = u7
                        [3] = u13
                        [4] = u15
                        [5] = u12
                        [6] = u14
                    --]]
                    local v27 = u3.isSmallScreen() and { -4, 4 } or { -9, 9 }
                    while true do
                        local v28 = u7
                        local v29 = TweenInfo.new(0.05, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 6, true)
                        local v30 = {}
                        local v31 = u13
                        if v31 ~= nil then
                            v31 = v31 + UDim2.fromOffset(u15:NextNumber(v27[1], v27[2]), u15:NextNumber(v27[1], v27[2]))
                        end
                        if v31 == nil then
                            v31 = u12.Position
                        end
                        v30.Position = v31
                        v28:Create(u12, v29, v30):Play()
                        local v32 = u14
                        if v32 then
                            v32 = task.wait(u15:NextNumber(1, 2))
                        end
                        if v32 == 0 or (v32 ~= v32 or not v32) then
                            return
                        end
                    end
                end)
            end
        end, {})
        return u5.createElement(u4, {
            ["Size"] = UDim2.fromScale(1, 1),
            [u5.Ref] = u11
        }, { u8.Element })
    end)
}