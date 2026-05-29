local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "constants", "halloween-graveyard-scene-constants").CLUE_TO_TEXTURE
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u7 = UDim2.fromScale(0.5, -0.5)
local u8 = UDim2.fromScale(0.5, 0.065)
return {
    ["ClueDiscovered"] = v3.new(u2)(function(u9, p10) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u5
            [3] = u4
            [4] = u8
            [5] = u7
            [6] = u6
        --]]
        local _ = p10.useState
        local v11 = p10.useEffect
        local u12 = u2.createRef()
        local u13 = u2.createRef()
        v11(function() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u12
                [3] = u13
                [4] = u5
                [5] = u4
                [6] = u8
                [7] = u7
            --]]
            local u21 = u9.clueDiscoveredSignal:Connect(function(p14) --[[ Line: 23 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u13
                    [3] = u5
                    [4] = u4
                    [5] = u8
                    [6] = u7
                --]]
                local u15 = u12:getValue()
                local v16 = u13:getValue()
                if not (u15 and v16) then
                    return nil
                end
                v16.Image = u5[p14]
                local v17 = {
                    ["Position"] = u8
                }
                local v18 = u4:Create(u15, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), v17)
                v18:Play()
                local u19 = nil
                u19 = v18.Completed:Connect(function() --[[ Line: 38 ]]
                    --[[
                    Upvalues:
                        [1] = u19
                        [2] = u4
                        [3] = u15
                        [4] = u7
                    --]]
                    u19:Disconnect()
                    task.delay(2, function() --[[ Line: 40 ]]
                        --[[
                        Upvalues:
                            [1] = u4
                            [2] = u15
                            [3] = u7
                        --]]
                        local v20 = {
                            ["Position"] = u7
                        }
                        u4:Create(u15, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), v20):Play()
                    end)
                end)
            end)
            return function() --[[ Line: 47 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21:Disconnect()
            end
        end, {})
        local v22 = u2.createElement
        local v23 = {}
        local v24 = u2.createElement
        local v25 = {
            ["BorderSizePixel"] = 0,
            ["Transparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v26 = {}
        local v27 = u2.createElement
        local v28 = {
            [u2.Ref] = u12,
            ["Size"] = UDim2.fromScale(0.365, 0.075),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = u7,
            ["BorderSizePixel"] = 0,
            ["BackgroundColor3"] = u6.Gray,
            ["Transparency"] = 0.5
        }
        local v29 = {
            u2.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 3)
            }),
            u2.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Color"] = Color3.fromRGB(255, 255, 255)
            }),
            ["ClueIcon"] = u2.createElement("ImageLabel", {
                [u2.Ref] = u13,
                ["Size"] = UDim2.fromScale(0.14, 0.14),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
                ["Position"] = UDim2.fromScale(0.1, 0.5),
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["Image"] = "",
                ["ImageColor3"] = Color3.new(0, 700, 700)
            }),
            ["ClueText"] = u2.createElement("TextLabel", {
                ["Text"] = "Clue Discovered",
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.575, 0.5),
                ["Size"] = UDim2.fromScale(0.7, 0.8),
                ["Font"] = Enum.Font.RobotoMono,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            })
        }
        v26.ClueContainer = v27("Frame", v28, v29)
        v23.ScreenContainer = v24("Frame", v25, v26)
        return v22("ScreenGui", {
            ["ResetOnSpawn"] = true
        }, v23)
    end)
}