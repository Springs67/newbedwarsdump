local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
return {
    ["TournamentWinnerBillboard"] = v4.new(u3)(function(p6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u2
        --]]
        local _ = p7.useState
        local v8 = p7.useEffect
        local u9 = u3.createRef()
        v8(function() --[[ Line: 11 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u5
            --]]
            local v10 = u9:getValue()
            if not v10 then
                return nil
            end
            local u11 = u5:Create(v10, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["Size"] = UDim2.new(8, 0, 1.1, 0)
            })
            local u12 = u5:Create(v10, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["Size"] = UDim2.new(6, 0, 0.8, 0)
            })
            u11:Play()
            u11.Completed:Connect(function() --[[ Line: 23 ]]
                --[[
                Upvalues:
                    [1] = u12
                --]]
                u12:Play()
            end)
            u12.Completed:Connect(function() --[[ Line: 26 ]]
                --[[
                Upvalues:
                    [1] = u11
                --]]
                u11:Play()
            end)
        end, {})
        local v13 = u3.createFragment
        local v14 = {
            ["TournamentEmoteGui"] = u3.createElement("BillboardGui", {
                ["Size"] = UDim2.fromScale(6, 0.8),
                ["StudsOffsetWorldSpace"] = Vector3.new(0, 3, 0),
                ["Adornee"] = p6.Character.Head,
                ["Brightness"] = 2.8,
                [u3.Ref] = u9
            }, { u3.createElement("TextLabel", {
                    ["Text"] = "<b>Champion</b>",
                    ["Font"] = "LuckiestGuy",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["TextStrokeTransparency"] = 0,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["TextColor3"] = u2.WHITE,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                }, { u3.createElement("UIGradient", {
                        ["Rotation"] = 90,
                        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#f8e50a")), ColorSequenceKeypoint.new(1, Color3.fromHex("#f8023e")) })
                    }) }) })
        }
        return v13(v14)
    end)
}