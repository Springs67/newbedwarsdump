local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.CircularSpinner
local u5 = v2.ColorUtil
local u6 = v2.DeviceUtil
local u7 = v2.Empty
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
return {
    ["CustomKitCreationQueueHud"] = v9.new(u8)(function(p11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u10
            [3] = u6
            [4] = u5
            [5] = u3
            [6] = u7
            [7] = u4
        --]]
        local _ = p12.useState
        local v13 = p12.useEffect
        local u14 = u8.createRef()
        local v15 = p11.message
        local v16 = v15 == nil and "Entering Custom Kit Creation" or v15
        v13(function() --[[ Line: 22 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u14
                [3] = u6
            --]]
            u10:Create(u14:getValue(), TweenInfo.new(0.12), {
                ["Size"] = UDim2.new(0.4, 0, u6.isSmallScreen() and 0.09 or 0.065, 0)
            }):Play()
        end, {})
        return u8.createFragment({
            ["CustomKitCreationQueueHud"] = u8.createElement("ScreenGui", {
                ["DisplayOrder"] = 1000
            }, { u8.createElement("Frame", {
                    [u8.Ref] = u14,
                    ["Size"] = UDim2.fromScale(0.4, 0),
                    ["Position"] = UDim2.fromScale(0.5, 0.01),
                    ["AnchorPoint"] = Vector2.new(0.5, 0),
                    ["BackgroundColor3"] = u5.hexColor(6580135),
                    ["Transparency"] = 1,
                    ["BorderSizePixel"] = 0
                }, { u8.createElement(u3, {
                        ["BorderSizePixel"] = 0,
                        ["Selectable"] = false,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["BackgroundColor3"] = u5.hexColor(6580135),
                        ["OnClick"] = function() --[[ Name: OnClick, Line 47 ]] end
                    }, {
                        u8.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 7.372093023255814,
                            ["DominantAxis"] = "Height"
                        }),
                        u8.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(0, 5)
                        }),
                        u8.createElement("UIPadding", {
                            ["PaddingLeft"] = UDim.new(0.04, 0),
                            ["PaddingRight"] = UDim.new(0.04, 0)
                        }),
                        u8.createElement("UIListLayout", {
                            ["FillDirection"] = "Horizontal",
                            ["HorizontalAlignment"] = "Center",
                            ["VerticalAlignment"] = "Center",
                            ["SortOrder"] = "LayoutOrder",
                            ["Padding"] = UDim.new(0.1, 0)
                        }),
                        ["LeftSection"] = u8.createElement(u7, {
                            ["LayoutOrder"] = 1,
                            ["Size"] = UDim2.fromScale(0.7, 1)
                        }, { u8.createElement("UIListLayout", {
                                ["FillDirection"] = "Horizontal",
                                ["HorizontalAlignment"] = "Left",
                                ["VerticalAlignment"] = "Center",
                                ["SortOrder"] = "LayoutOrder",
                                ["Padding"] = UDim.new(0.04, 0)
                            }), u8.createElement("Frame", {
                                ["BackgroundTransparency"] = 1,
                                ["BorderSizePixel"] = 0,
                                ["LayoutOrder"] = 2,
                                ["Size"] = UDim2.fromScale(0.8, 0.8)
                            }, { u8.createElement("UIPadding", {
                                    ["PaddingLeft"] = UDim.new(0.06, 0),
                                    ["PaddingTop"] = UDim.new(0.08, 0),
                                    ["PaddingBottom"] = UDim.new(0.08, 0)
                                }), u8.createElement("UIListLayout", {
                                    ["FillDirection"] = "Vertical",
                                    ["VerticalAlignment"] = "Center"
                                }), u8.createElement("TextLabel", {
                                    ["Font"] = "Roboto",
                                    ["RichText"] = true,
                                    ["TextScaled"] = true,
                                    ["BackgroundTransparency"] = 1,
                                    ["BorderSizePixel"] = 0,
                                    ["TextXAlignment"] = "Left",
                                    ["Text"] = v16,
                                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                                    ["Size"] = UDim2.fromScale(1, 0.6)
                                }) }) }),
                        u8.createElement(u4, {
                            ["SizeConstraint"] = "RelativeYY",
                            ["LayoutOrder"] = 2,
                            ["Size"] = UDim2.fromScale(0.5, 0.5)
                        })
                    }) }) })
        })
    end)
}