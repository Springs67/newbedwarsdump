local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
return {
    ["TournamentWinnerArrowBillboard"] = v4.new(u3)(function(p6, p7) --[[ Line: 7 ]]
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
            if not (v11 and v12) then
                return nil
            end
            local u13 = u5:Create(v11, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["Position"] = UDim2.new(0.2, 0, 0.4, 0),
                ["Size"] = UDim2.new(0.15, 0, 0.5, 0)
            })
            local u14 = u5:Create(v11, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["Position"] = UDim2.new(0.1, 0, 0.3, 0),
                ["Size"] = UDim2.new(0.1, 0, 0.5, 0)
            })
            local u15 = u5:Create(v12, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["Position"] = UDim2.new(0.8, 0, 0.4, 0),
                ["Size"] = UDim2.new(0.15, 0, 0.5, 0)
            })
            local u16 = u5:Create(v12, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["Position"] = UDim2.new(0.9, 0, 0.3, 0),
                ["Size"] = UDim2.new(0.1, 0, 0.5, 0)
            })
            task.delay(0.2, function() --[[ Line: 34 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u15
                --]]
                u13:Play()
                u15:Play()
            end)
            u13.Completed:Connect(function() --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u14
                --]]
                u14:Play()
            end)
            u14.Completed:Connect(function() --[[ Line: 41 ]]
                --[[
                Upvalues:
                    [1] = u13
                --]]
                u13:Play()
            end)
            u15.Completed:Connect(function() --[[ Line: 44 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                u16:Play()
            end)
            u16.Completed:Connect(function() --[[ Line: 47 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15:Play()
            end)
        end)
        local v17 = u3.createFragment
        local v18 = {
            ["TournamentArrowGui"] = u3.createElement("BillboardGui", {
                ["Brightness"] = 2.8,
                ["Size"] = UDim2.fromScale(10, 10),
                ["Adornee"] = p6.Character.Head
            }, { u3.createElement("TextLabel", {
                    ["Size"] = UDim2.fromScale(0.1, 0.5),
                    ["Position"] = UDim2.fromScale(0.1, 0.3),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Text"] = "<b>\226\158\161</b>",
                    ["Font"] = "LuckiestGuy",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["TextColor3"] = u2.WHITE,
                    ["BackgroundTransparency"] = 1,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center,
                    ["TextStrokeTransparency"] = 0,
                    ["Rotation"] = 45,
                    [u3.Ref] = u9
                }, { u3.createElement("UIGradient", {
                        ["Rotation"] = 90,
                        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#f8e50a")), ColorSequenceKeypoint.new(1, Color3.fromHex("#f8023e")) })
                    }) }), u3.createElement("TextLabel", {
                    ["Size"] = UDim2.fromScale(0.1, 0.5),
                    ["Position"] = UDim2.fromScale(0.9, 0.3),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Text"] = "<b>\226\158\161</b>",
                    ["Font"] = "LuckiestGuy",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["TextColor3"] = u2.WHITE,
                    ["BackgroundTransparency"] = 1,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center,
                    ["TextStrokeTransparency"] = 0,
                    ["Rotation"] = 135,
                    [u3.Ref] = u10
                }, { u3.createElement("UIGradient", {
                        ["Rotation"] = 90,
                        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#f8e50a")), ColorSequenceKeypoint.new(1, Color3.fromHex("#f8023e")) })
                    }) }) })
        }
        return v17(v18)
    end)
}