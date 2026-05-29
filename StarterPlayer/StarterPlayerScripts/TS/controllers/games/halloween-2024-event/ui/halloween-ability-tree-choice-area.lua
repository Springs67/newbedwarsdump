local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.SlideIn
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u8 = v1.import(script, script.Parent, "halloween-ability-tree-choices").HalloweenAbilityTreeChoices
return {
    ["HalloweenAbilityTreeChoiceArea"] = v6.new(u5)(function(p9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u7
            [4] = u3
            [5] = u8
        --]]
        local _ = p10.useState
        local v11 = u5.createElement
        local v12 = u4
        local v13 = {}
        local v14 = u5.createElement
        local v15 = {
            ["BackgroundTransparency"] = 0.05,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Size"] = UDim2.fromScale(0.5, 1),
            ["Position"] = UDim2.fromScale(1.2, -0.2),
            ["BackgroundColor3"] = Color3.fromHex("#1a1c1e")
        }
        local v16 = {
            u5.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 8)
            }),
            u5.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["ImageTransparency"] = 0.92,
                ["Image"] = "rbxassetid://13667765121",
                ["Size"] = UDim2.fromScale(1, 1)
            }),
            u5.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["ImageTransparency"] = 0,
                ["Size"] = UDim2.fromScale(0.08, 0.18),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Position"] = UDim2.fromScale(0.5, 1),
                ["ImageColor3"] = Color3.fromHex("#2f2f2d"),
                ["Image"] = u7.TRIANGLE_DOWN
            }),
            ["HalloweenChoiceTitle"] = u5.createElement("Frame", {
                ["BackgroundTransparency"] = 0,
                ["BorderSizePixel"] = 0,
                ["AnchorPoint"] = Vector2.new(0, 0),
                ["Size"] = UDim2.fromScale(1, 0.35),
                ["Position"] = UDim2.fromScale(0, 0),
                ["BackgroundColor3"] = Color3.fromHex("#2f2f2d")
            }, { u5.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 8)
                }), u5.createElement("TextLabel", {
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
                }, { u5.createElement("UIGradient", {
                        ["Rotation"] = 90,
                        ["Color"] = ColorSequence.new(Color3.fromHex("#F2F3F2"), Color3.fromHex("#C9CaC9"))
                    }) }) })
        }
        local v17 = u5.createElement
        local v18 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Size"] = UDim2.fromScale(1, 0.65),
            ["Position"] = UDim2.fromScale(0, 0.35)
        }
        local v19 = {
            u5.createElement(u8, {
                ["Size"] = UDim2.fromScale(0.48, 1),
                ["Position"] = UDim2.fromScale(1, 0),
                ["AnchorPoint"] = Vector2.new(1, 0),
                ["onSelected"] = p9.onSelected,
                ["halloweenAbilityType"] = p9.halloweenAbilityOne,
                ["level"] = p9.level
            }),
            u5.createElement(u8, {
                ["Rotation"] = 180,
                ["Size"] = UDim2.fromScale(0.48, 1),
                ["Position"] = UDim2.fromScale(0, 0),
                ["AnchorPoint"] = Vector2.new(0, 0),
                ["onSelected"] = p9.onSelected,
                ["halloweenAbilityType"] = p9.halloweenAbilityTwo,
                ["level"] = p9.level
            }),
            ["HalloweenLevelCircleBackground"] = u5.createElement("Frame", {
                ["BackgroundTransparency"] = 0,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 3,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.12, 0.8),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["BackgroundColor3"] = Color3.fromHex("#aa7c47")
            }, { u5.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }), u5.createElement("UIStroke", {
                    ["Thickness"] = 1,
                    ["Color"] = Color3.fromHex("#1d1a1e")
                }) }),
            (u5.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["ImageTransparency"] = 0,
                ["ZIndex"] = 2,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.3, 1.6),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = u7.MISSION_TICKET_GLOW
            }))
        }
        local v20 = u5.createElement
        local v21 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 4,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.1, 0.7),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundColor3"] = Color3.fromHex("#1d1a1e")
        }
        local v22 = {}
        local v23 = u5.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(1, 0)
        })
        local v24 = u5.createElement
        local v25 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextStrokeTransparency"] = 0,
            ["TextScaled"] = true,
            ["ZIndex"] = 5
        }
        local v26 = p9.level
        v25.Text = tostring(v26)
        v25.AnchorPoint = Vector2.new(0.5, 0.5)
        v25.Position = UDim2.fromScale(0.5, 0.5)
        v25.Size = UDim2.fromScale(0.7, 0.7)
        v25.AutomaticSize = Enum.AutomaticSize.X
        v25.Font = Enum.Font.ArialBold
        v25.TextStrokeColor3 = Color3.fromHex("#aa7c47")
        v25.TextXAlignment = Enum.TextXAlignment.Center
        v25.TextColor3 = Color3.fromHex("#f6cd8e")
        __set_list(v22, 1, {v23, v24("TextLabel", v25)})
        v19.HalloweenLevelCircle = v20("Frame", v21, v22)
        __set_list(v16, 4, {v17("Frame", v18, v19)})
        v13.HalloweenChoiceArea = v14("Frame", v15, v16)
        return v11(v12, {}, v13)
    end)
}