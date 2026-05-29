local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.ColorUtil
local u5 = v2.CornerFiller
local u6 = v2.ImageId
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["SocialConnectionsConnectInfoCard"] = v8.new(u7)(function(p10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u7
            [3] = u5
            [4] = u4
            [5] = u6
            [6] = u3
        --]]
        local _ = p11.useState
        local v12 = p10.Size
        if v12 == nil then
            v12 = UDim2.new(1, 0, 0, 46)
        end
        local v13 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 1,
            ["Size"] = v12,
            ["BackgroundColor3"] = u9.backgroundTertiary,
            ["LayoutOrder"] = p10.LayoutOrder
        }
        local v14 = { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 5)
            }) }
        local v15 = #v14
        local v16 = p10.CornerFill
        if v16 then
            v16 = u7.createElement(u5, {
                ["BottomLeft"] = true,
                ["BottomRight"] = true
            })
        end
        if v16 then
            v14[v15 + 1] = v16
        end
        local v17 = #v14
        local v18 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 1, 0)
        }
        local v19 = { u7.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 10),
                ["PaddingBottom"] = UDim.new(0, 10),
                ["PaddingLeft"] = UDim.new(0, 10),
                ["PaddingRight"] = UDim.new(0, 10)
            }), u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 12)
            }), u7.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.75, 0.75),
                ["Image"] = p10.ImageId,
                ["ImageColor3"] = u9.textPrimary
            }) }
        local v20 = #v19
        local v21 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 1, 0)
        }
        local v22 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 0)
            }), u7.createElement("TextLabel", {
                ["RichText"] = true,
                ["TextSize"] = 15,
                ["BackgroundTransparency"] = 1,
                ["AutomaticSize"] = Enum.AutomaticSize.XY,
                ["Text"] = p10.Text,
                ["TextColor3"] = u4.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["Font"] = Enum.Font.Roboto
            }) }
        local v23 = #v22
        local v24 = p10.MiddleElementEmbed
        if v24 then
            v24 = u7.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["AutomaticSize"] = Enum.AutomaticSize.XY
            }, { u7.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 5)
                }), u7.createElement("Frame", {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromOffset(18, 12.5)
                }, { u7.createElement("ImageLabel", {
                        ["Rotation"] = 47,
                        ["ScaleType"] = "Fit",
                        ["SizeConstraint"] = "RelativeYY",
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromOffset(18, 12.5),
                        ["Image"] = u6.WIFI_SOLID,
                        ["ImageColor3"] = u4.hexColor(16752398)
                    }) }), u7.createElement("TextLabel", {
                    ["RichText"] = true,
                    ["TextSize"] = 15,
                    ["BackgroundTransparency"] = 1,
                    ["AutomaticSize"] = Enum.AutomaticSize.XY,
                    ["Text"] = p10.MiddleElementEmbed.rightText,
                    ["TextColor3"] = u4.WHITE,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["Font"] = Enum.Font.Roboto
                }) })
        end
        if v24 then
            v22[v23 + 1] = v24
        end
        v19[v20 + 1] = u7.createElement("Frame", v21, v22)
        v14[v17 + 1] = u7.createElement("Frame", v18, v19)
        local v25 = p10[u7.Children]
        if v25 then
            for v26, v27 in v25 do
                if type(v26) == "number" then
                    v14[v17 + 1 + v26] = v27
                else
                    v14[v26] = v27
                end
            end
        end
        local v28 = #v14
        local v29 = p10.Button and not p10.ButtonHidden
        if v29 then
            v29 = u7.createElement(u3, {
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Position"] = UDim2.new(1, -10, 0.5, 0),
                ["Size"] = UDim2.new(0.25, -10, 0.5, 0),
                ["Text"] = p10.Button.text,
                ["OnClick"] = p10.Button.onClick
            })
        end
        if v29 then
            v14[v28 + 1] = v29
        end
        return u7.createElement("Frame", v13, v14)
    end)
}