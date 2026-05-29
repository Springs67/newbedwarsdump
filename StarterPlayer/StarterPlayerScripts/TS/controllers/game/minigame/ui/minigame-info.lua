local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.RandomUtil
local u7 = v2.UIUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "circle-countdown").CircleCountdown
local u11 = {
    "rbxassetid://11815911253",
    "rbxassetid://11815911417",
    "rbxassetid://11815911579",
    "rbxassetid://11815911724"
}
return {
    ["MinigameInfo"] = v9.new(u8)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u7
            [3] = u6
            [4] = u11
            [5] = u3
            [6] = u5
            [7] = u10
            [8] = u4
        --]]
        local v14 = p13.useEffect
        local _ = p13.useState
        local u15 = u8.createRef()
        v14(function() --[[ Line: 17 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u12
                [3] = u7
            --]]
            local u16 = u15:getValue()
            if not u16 then
                return nil
            end
            local v17 = u12.startTime - os.time()
            task.delay(v17 - 0.3, function() --[[ Line: 24 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u16
                --]]
                u7:setContainerTransparency(u16, 1, {
                    ["onSetTweenInfo"] = TweenInfo.new(0.3)
                })
            end)
        end, {})
        local v18 = u8.createElement
        local v19 = {}
        local v20 = u8.createElement
        local v21 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Image"] = u6.randomArraySelectN(u11, 1)[1],
            ["ScaleType"] = "Crop",
            ["BackgroundTransparency"] = 1,
            [u8.Ref] = u15
        }
        local v22 = {
            ["GradientOverlay"] = u8.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 2,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u3.WHITE
            }, { u8.createElement("UIGradient", {
                    ["Rotation"] = 55,
                    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(179, 223, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(179, 223, 255)) }),
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0.6) })
                }) })
        }
        local v23 = u8.createElement
        local v24 = u5
        local v25 = {
            ["ZIndex"] = 3,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v26 = {
            u8.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.06, 0),
                ["PaddingBottom"] = UDim.new(0.06, 0),
                ["PaddingLeft"] = UDim.new(0.04, 0),
                ["PaddingRight"] = UDim.new(0.04, 0)
            }),
            ["Header"] = u8.createElement(u5, {
                ["Size"] = UDim2.fromScale(1, 0.1)
            }, {
                ["Title"] = u8.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["TextXAlignment"] = "Left",
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 3,
                    ["Size"] = UDim2.fromScale(0.9, 1),
                    ["Text"] = "<b>" .. string.upper(u12.minigame.displayName) .. "</b>",
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Font"] = Enum.Font.Roboto
                }),
                u8.createElement(u10, {
                    ["EndTime"] = u12.startTime,
                    ["FrameProps"] = {
                        ["ZIndex"] = 3,
                        ["Size"] = UDim2.fromScale(0.1, 1),
                        ["Position"] = UDim2.fromScale(1, 0),
                        ["AnchorPoint"] = Vector2.new(1, 0)
                    }
                })
            })
        }
        local v27 = u8.createElement
        local v28 = u5
        local v29 = {
            ["ZIndex"] = 3,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0, 0.15)
        }
        local v30 = {}
        local v31 = u8.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["HorizontalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.05, 0)
        })
        local v32 = u8.createElement(u5, {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.475, 1)
        }, {
            ["InfoImage"] = u8.createElement("ImageLabel", {
                ["ScaleType"] = "Crop",
                ["LayoutOrder"] = 2,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(1, 0.8),
                ["Image"] = u12.minigame.infoImage
            }, { u8.createElement("UIStroke", {
                    ["Thickness"] = 3,
                    ["Color"] = Color3.fromRGB(255, 255, 255)
                }), u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                }) })
        })
        local v33 = u8.createElement
        local v34 = u5
        local v35 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.475, 1)
        }
        local v36 = {}
        local v37 = u8.createElement
        local v38 = {
            ["AutomaticSize"] = "Y",
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["ZIndex"] = 3,
            ["Size"] = UDim2.fromScale(1, 0.3),
            ["BackgroundColor3"] = Color3.fromRGB(40, 40, 40)
        }
        local v39 = {
            u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }),
            u8.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, u4.isSmallScreen() and 14 or 24),
                ["PaddingBottom"] = UDim.new(0, u4.isSmallScreen() and 14 or 24),
                ["PaddingLeft"] = UDim.new(0.06, 0),
                ["PaddingRight"] = UDim.new(0.06, 0)
            }),
            u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Top",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, u4.isSmallScreen() and 8 or 10)
            }),
            ["Subtitle"] = u8.createElement("TextLabel", {
                ["AutomaticSize"] = "Y",
                ["Text"] = "<b>INSTRUCTIONS</b>",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Top",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(1, 0),
                ["TextColor3"] = Color3.fromRGB(124, 228, 255),
                ["Font"] = Enum.Font.Roboto
            }, { u8.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = u4.isSmallScreen() and 16 or 40
                }) }),
            ["Body"] = u8.createElement("TextLabel", {
                ["AutomaticSize"] = "Y",
                ["TextScaled"] = true,
                ["TextWrap"] = true,
                ["TextWrapped"] = true,
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Top",
                ["TextTransparency"] = 0.3,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(1, 0),
                ["Text"] = u12.minigame.description,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["Font"] = Enum.Font.Roboto
            }, { u8.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = u4.isSmallScreen() and 14 or 32
                }) })
        }
        v36.InfoCard = v37("Frame", v38, v39)
        __set_list(v30, 1, {v31, v32, v33(v34, v35, v36)})
        v26.Content = v27(v28, v29, v30)
        __set_list(v22, 1, {v23(v24, v25, v26)})
        v19.MinigameInfoContainer = v20("ImageLabel", v21, v22)
        return v18("ScreenGui", {
            ["IgnoreGuiInset"] = true,
            ["ResetOnSpawn"] = false,
            ["DisplayOrder"] = 100
        }, v19)
    end)
}