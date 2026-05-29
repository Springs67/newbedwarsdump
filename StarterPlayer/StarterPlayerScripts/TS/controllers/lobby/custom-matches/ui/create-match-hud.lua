local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.CircularSpinner
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["CreateMatchHud"] = v8.new(u7)(function(p11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u9
            [3] = u5
            [4] = u4
            [5] = u6
            [6] = u10
            [7] = u3
        --]]
        local _ = p12.useState
        local v13 = p12.useEffect
        local u14 = u7.createRef()
        local v15 = p11.mapImage
        local v16 = p11.message
        local v17 = v16 == nil and "Creating Custom Match" or v16
        v13(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u14
                [3] = u5
            --]]
            u9:Create(u14:getValue(), TweenInfo.new(0.12), {
                ["Size"] = UDim2.new(0.4, 0, u5.isSmallScreen() and 0.09 or 0.065, 0)
            }):Play()
        end, {})
        return u7.createFragment({
            ["CreateMatchHud"] = u7.createElement("ScreenGui", {
                ["DisplayOrder"] = 1000
            }, { u7.createElement("Frame", {
                    [u7.Ref] = u14,
                    ["Size"] = UDim2.fromScale(0.4, 0),
                    ["Position"] = UDim2.fromScale(0.5, 0.01),
                    ["AnchorPoint"] = Vector2.new(0.5, 0),
                    ["BackgroundColor3"] = u4.hexColor(6580135),
                    ["BorderSizePixel"] = 0
                }, {
                    u7.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 7.372093023255814,
                        ["DominantAxis"] = "Height"
                    }),
                    u7.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 5)
                    }),
                    u7.createElement("UIPadding", {
                        ["PaddingLeft"] = UDim.new(0.04, 0),
                        ["PaddingRight"] = UDim.new(0.04, 0)
                    }),
                    u7.createElement("UIListLayout", {
                        ["FillDirection"] = "Horizontal",
                        ["HorizontalAlignment"] = "Center",
                        ["VerticalAlignment"] = "Center",
                        ["SortOrder"] = "LayoutOrder",
                        ["Padding"] = UDim.new(0.1, 0)
                    }),
                    ["LeftSection"] = u7.createElement(u6, {
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(0.7, 1)
                    }, { u7.createElement("UIListLayout", {
                            ["FillDirection"] = "Horizontal",
                            ["HorizontalAlignment"] = "Left",
                            ["VerticalAlignment"] = "Center",
                            ["SortOrder"] = "LayoutOrder",
                            ["Padding"] = UDim.new(0.04, 0)
                        }), u7.createElement("ImageLabel", {
                            ["SizeConstraint"] = "RelativeYY",
                            ["BorderSizePixel"] = 0,
                            ["BackgroundTransparency"] = 1,
                            ["ScaleType"] = "Crop",
                            ["LayoutOrder"] = 1,
                            ["Size"] = UDim2.fromScale(0.7, 0.7),
                            ["Image"] = v15
                        }), u7.createElement("Frame", {
                            ["BackgroundTransparency"] = 1,
                            ["BorderSizePixel"] = 0,
                            ["LayoutOrder"] = 2,
                            ["Size"] = UDim2.fromScale(0.8, 0.8)
                        }, {
                            u7.createElement("UIPadding", {
                                ["PaddingLeft"] = UDim.new(0.06, 0),
                                ["PaddingTop"] = UDim.new(0.08, 0),
                                ["PaddingBottom"] = UDim.new(0.08, 0)
                            }),
                            u7.createElement("UIListLayout", {
                                ["FillDirection"] = "Vertical",
                                ["VerticalAlignment"] = "Center"
                            }),
                            u7.createElement("TextLabel", {
                                ["Font"] = "Roboto",
                                ["RichText"] = true,
                                ["TextScaled"] = true,
                                ["BackgroundTransparency"] = 1,
                                ["BorderSizePixel"] = 0,
                                ["TextXAlignment"] = "Left",
                                ["Text"] = v17,
                                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                                ["Size"] = UDim2.fromScale(1, 0.6)
                            }),
                            u7.createElement("TextLabel", {
                                ["Font"] = "Roboto",
                                ["RichText"] = true,
                                ["TextScaled"] = true,
                                ["BackgroundTransparency"] = 1,
                                ["BorderSizePixel"] = 0,
                                ["TextXAlignment"] = "Left",
                                ["Text"] = "<b>" .. p11.mapName .. "</b>",
                                ["TextColor3"] = u10.mcAqua,
                                ["Size"] = UDim2.fromScale(1, 0.4)
                            })
                        }) }),
                    u7.createElement(u3, {
                        ["SizeConstraint"] = "RelativeYY",
                        ["LayoutOrder"] = 2,
                        ["Size"] = UDim2.fromScale(0.5, 0.5)
                    })
                }) })
        })
    end)
}