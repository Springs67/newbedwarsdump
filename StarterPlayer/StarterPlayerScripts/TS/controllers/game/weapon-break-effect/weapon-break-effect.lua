local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
return {
    ["WeaponBreakEffect"] = v4.new(u3)(function(p6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u2
        --]]
        local _ = p7.useState
        local v8 = p7.useEffect
        local u9 = u3.createRef()
        local u10 = u3.createRef()
        v8(function() --[[ Line: 12 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u10
                [3] = u5
            --]]
            local v11 = u9:getValue()
            local v12 = u10:getValue()
            if v11 and v12 then
                local v13 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                local u14 = u5:Create(v11, v13, {
                    ["Rotation"] = -20,
                    ["Position"] = UDim2.new(0.3, 0, 0.5, 0)
                })
                local u15 = u5:Create(v12, v13, {
                    ["Rotation"] = 35,
                    ["Position"] = UDim2.new(0.7, 0, 0.5, 0)
                })
                task.delay(0.1, function() --[[ Line: 26 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                        [2] = u15
                    --]]
                    u14:Play()
                    u15:Play()
                end)
            end
        end, {})
        local v16 = u3.createFragment
        local v17 = {}
        local v18 = u3.createElement
        local v19 = {}
        local v20 = u3.createElement
        local v21 = u2
        local v22 = {
            ["Size"] = UDim2.fromScale(0.15, 0.15),
            ["Position"] = UDim2.fromScale(0.42, 0.7)
        }
        local v23 = {
            ["WeaponBreakEffect1"] = u3.createElement("ImageLabel", {
                [u3.Ref] = u9,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 1),
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["Image"] = p6.WeaponImage,
                ["ImageTransparency"] = 0,
                ["ZIndex"] = 10
            }, { u3.createElement("UIGradient", {
                    ["Rotation"] = 0,
                    ["Transparency"] = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0),
                        NumberSequenceKeypoint.new(0.48, 0),
                        NumberSequenceKeypoint.new(0.5, 1),
                        NumberSequenceKeypoint.new(1, 1)
                    })
                }) }),
            ["WeaponBreakEffect2"] = u3.createElement("ImageLabel", {
                [u3.Ref] = u10,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 1),
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["Image"] = p6.WeaponImage,
                ["ImageTransparency"] = 0,
                ["ZIndex"] = 10
            }, { u3.createElement("UIGradient", {
                    ["Rotation"] = 0,
                    ["Transparency"] = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(0.48, 1),
                        NumberSequenceKeypoint.new(0.5, 0),
                        NumberSequenceKeypoint.new(1, 0)
                    })
                }) })
        }
        __set_list(v19, 1, {v20(v21, v22, v23)})
        v17.WeaponBreakEffect = v18("ScreenGui", {}, v19)
        return v16(v17)
    end)
}