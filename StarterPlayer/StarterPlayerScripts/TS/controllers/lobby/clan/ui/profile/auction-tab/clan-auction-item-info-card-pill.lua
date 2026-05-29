local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.Padding
local u6 = v2.StringUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ClanAuctionInfoCardPill"] = v8.new(u7)(function(p10) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u7
            [3] = u5
            [4] = u4
            [5] = u3
            [6] = u6
        --]]
        local v11 = {}
        for v12, v13 in p10 do
            v11[v12] = v13
        end
        v11.Icon = nil
        v11.Text = nil
        v11.Amount = nil
        v11.CurrencyIcon = nil
        local v14 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u9.backgroundSecondary
        }
        for v15, v16 in v11 do
            v14[v15] = v16
        end
        local v17 = u7.createFragment
        local v18 = {
            ["ClanAuctionInfoCard"] = u7.createElement("Frame", v14, {
                u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }),
                u7.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 5)
                }),
                u7.createElement(u5, {
                    ["Padding"] = UDim.new(0, 5)
                }),
                u7.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 0,
                    ["Image"] = p10.Icon.image,
                    ["ImageColor3"] = p10.Icon.color,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["ScaleType"] = Enum.ScaleType.Fit
                }, { u7.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }),
                u7.createElement(u4, {
                    ["LayoutOrder"] = 1,
                    ["AutomaticSize"] = Enum.AutomaticSize.XY
                }, {
                    u7.createElement("UIPadding", {
                        ["PaddingTop"] = UDim.new(0, 2),
                        ["PaddingBottom"] = UDim.new(0, 2)
                    }),
                    u7.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Horizontal,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                        ["Padding"] = UDim.new(0, 5)
                    }),
                    u7.createElement("TextLabel", {
                        ["TextScaled"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 0,
                        ["Size"] = UDim2.fromScale(0.5, 1),
                        ["Text"] = p10.Text,
                        ["TextColor3"] = u3.WHITE,
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["TextYAlignment"] = Enum.TextYAlignment.Center,
                        ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
                    }),
                    u7.createElement(u4, {
                        ["LayoutOrder"] = 1,
                        ["AutomaticSize"] = Enum.AutomaticSize.XY
                    }, { u7.createElement("UIListLayout", {
                            ["FillDirection"] = Enum.FillDirection.Horizontal,
                            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                            ["Padding"] = UDim.new(0, 2)
                        }), u7.createElement("TextLabel", {
                            ["TextScaled"] = true,
                            ["BackgroundTransparency"] = 1,
                            ["LayoutOrder"] = 0,
                            ["AutomaticSize"] = Enum.AutomaticSize.XY,
                            ["Text"] = u6.formatNumberWithCommas(p10.Amount),
                            ["TextColor3"] = u3.WHITE,
                            ["TextXAlignment"] = Enum.TextXAlignment.Left,
                            ["TextYAlignment"] = Enum.TextYAlignment.Center,
                            ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
                        }), u7.createElement("ImageLabel", {
                            ["BackgroundTransparency"] = 1,
                            ["LayoutOrder"] = 1,
                            ["Image"] = p10.CurrencyIcon,
                            ["Size"] = UDim2.fromScale(1, 1),
                            ["ScaleType"] = Enum.ScaleType.Fit
                        }, { u7.createElement("UIAspectRatioConstraint", {
                                ["AspectRatio"] = 1
                            }) }) })
                })
            })
        }
        return v17(v18)
    end)
}