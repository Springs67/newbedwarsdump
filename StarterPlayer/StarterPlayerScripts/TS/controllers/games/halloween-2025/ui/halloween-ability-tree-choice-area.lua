local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.SlideIn
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u9 = v1.import(script, script.Parent, "halloween-ability-tree-choices").HalloweenAbilityTreeChoices
return {
    ["HalloweenAbilityTreeChoiceArea"] = v7.new(u6)(function(p10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u5
            [3] = u4
            [4] = u8
            [5] = u3
            [6] = u9
        --]]
        local _ = p11.useState
        local v12 = u6.createElement
        local v13 = u5
        local v14 = {}
        local v15 = {}
        local v16 = u6.createElement
        local v17 = "Frame"
        local v18 = {
            ["BackgroundTransparency"] = 0.05,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Size"] = UDim2.fromScale(0.5, 1)
        }
        local v19
        if u4.isMobileControls() then
            v19 = UDim2.fromScale(0.6, -2)
        else
            v19 = UDim2.fromScale(1.2, -0.2)
        end
        v18.Position = v19
        v18.BackgroundColor3 = Color3.fromHex("#1a1c1e")
        local v20 = {
            u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 8)
            }),
            u6.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["ImageTransparency"] = 0.92,
                ["Image"] = "rbxassetid://13667765121",
                ["Size"] = UDim2.fromScale(1, 1)
            }),
            u6.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["ImageTransparency"] = 0,
                ["Size"] = UDim2.fromScale(0.08, 0.18),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Position"] = UDim2.fromScale(0.5, 1),
                ["ImageColor3"] = Color3.fromHex("#2f2f2d"),
                ["Image"] = u8.TRIANGLE_DOWN
            }),
            ["HalloweenChoiceTitle"] = u6.createElement("Frame", {
                ["BackgroundTransparency"] = 0,
                ["BorderSizePixel"] = 0,
                ["AnchorPoint"] = Vector2.new(0, 0),
                ["Size"] = UDim2.fromScale(1, 0.35),
                ["Position"] = UDim2.fromScale(0, 0),
                ["BackgroundColor3"] = Color3.fromHex("#2f2f2d")
            }, { u6.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 8)
                }), u6.createElement("TextLabel", {
                    ["Text"] = "Select an Upgrade",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["TextStrokeTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.8, 0.8),
                    ["AutomaticSize"] = Enum.AutomaticSize.X,
                    ["Font"] = Enum.Font.ArialBold,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextColor3"] = u3.WHITE
                }, { u6.createElement("UIGradient", {
                        ["Rotation"] = 90,
                        ["Color"] = ColorSequence.new(Color3.fromHex("#F2F3F2"), Color3.fromHex("#C9CaC9"))
                    }) }) })
        }
        local v21 = u6.createElement
        local v22 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Size"] = UDim2.fromScale(1, 0.65),
            ["Position"] = UDim2.fromScale(0, 0.35)
        }
        local v23 = {}
        local v24 = u6.createElement
        local v25 = u9
        local v26 = {
            ["Size"] = UDim2.fromScale(0.48, 1),
            ["Position"] = UDim2.fromScale(1, 0),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["onSelected"] = p10.onSelected,
            ["halloweenAbilityType"] = p10.halloweenAbilityOne,
            ["level"] = p10.level,
            ["Hotkeys"] = {
                ["Display"] = "RIGHT",
                ["PC"] = Enum.KeyCode.X
            }
        }
        local v27 = v24(v25, v26)
        local v28 = u6.createElement
        local v29 = u9
        local v30 = {
            ["Rotation"] = 180,
            ["Size"] = UDim2.fromScale(0.48, 1),
            ["Position"] = UDim2.fromScale(0, 0),
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["onSelected"] = p10.onSelected,
            ["halloweenAbilityType"] = p10.halloweenAbilityTwo,
            ["level"] = p10.level,
            ["Hotkeys"] = {
                ["Display"] = "LEFT",
                ["PC"] = Enum.KeyCode.Z
            }
        }
        __set_list(v23, 1, {v27, (v28(v29, v30))})
        v23.HalloweenLevelCircleBackground = u6.createElement("Frame", {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 3,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.12, 0.8),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundColor3"] = Color3.fromHex("#aa7c47")
        }, { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            }), u6.createElement("UIStroke", {
                ["Thickness"] = 1,
                ["Color"] = Color3.fromHex("#1d1a1e")
            }) })
        __set_list(v23, 3, {(u6.createElement("ImageLabel", {
    ["BackgroundTransparency"] = 1,
    ["ImageTransparency"] = 0,
    ["ZIndex"] = 2,
    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
    ["Size"] = UDim2.fromScale(0.3, 1.6),
    ["Position"] = UDim2.fromScale(0.5, 0.5),
    ["Image"] = u8.MISSION_TICKET_GLOW
}))})
        local v31 = u6.createElement
        local v32 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 4,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.1, 0.7),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundColor3"] = Color3.fromHex("#1d1a1e")
        }
        local v33 = {}
        local v34 = u6.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(1, 0)
        })
        local v35 = u6.createElement
        local v36 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextStrokeTransparency"] = 0,
            ["TextScaled"] = true,
            ["ZIndex"] = 5
        }
        local v37 = p10.level
        v36.Text = tostring(v37)
        v36.AnchorPoint = Vector2.new(0.5, 0.5)
        v36.Position = UDim2.fromScale(0.5, 0.5)
        v36.Size = UDim2.fromScale(0.7, 0.7)
        v36.AutomaticSize = Enum.AutomaticSize.X
        v36.Font = Enum.Font.ArialBold
        v36.TextStrokeColor3 = Color3.fromHex("#aa7c47")
        v36.TextXAlignment = Enum.TextXAlignment.Center
        v36.TextColor3 = Color3.fromHex("#f6cd8e")
        __set_list(v33, 1, {v34, v35("TextLabel", v36)})
        v23.HalloweenLevelCircle = v31("Frame", v32, v33)
        __set_list(v20, 4, {v21("Frame", v22, v23)})
        v15.HalloweenChoiceArea = v16(v17, v18, v20)
        return v12(v13, v14, v15)
    end)
}