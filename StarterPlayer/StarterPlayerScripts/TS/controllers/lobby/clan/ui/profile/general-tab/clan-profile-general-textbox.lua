local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["ClanProfileGeneralTextBox"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u5)(function(p6, p7) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u3
        --]]
        local _ = p7.useState
        local v8 = {}
        for v9, v10 in p6 do
            v8[v9] = v10
        end
        v8.Title = nil
        v8.Text = nil
        v8.BorderBottom = nil
        v8[u5.Children] = nil
        local v11 = {}
        for v12, v13 in v8 do
            v11[v12] = v13
        end
        local v14 = { u5.createElement(u4, {
                ["Size"] = UDim2.fromScale(1, 1)
            }, {
                u5.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0.05, 0),
                    ["PaddingRight"] = UDim.new(0.05, 0),
                    ["PaddingBottom"] = UDim.new(0.1, 0),
                    ["PaddingTop"] = UDim.new(0.1, 0)
                }),
                u5.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0.05, 0)
                }),
                u5.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["SizeConstraint"] = "RelativeXX",
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Left",
                    ["TextYAlignment"] = "Top",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["TextColor3"] = u3.WHITE,
                    ["Text"] = "<b>" .. p6.Title .. "</b>"
                }, { u5.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) }),
                u5.createElement("TextLabel", {
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Left",
                    ["TextYAlignment"] = "Top",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["TextTransparency"] = 0.3,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.fromScale(1, 0.9),
                    ["TextColor3"] = u3.WHITE,
                    ["Text"] = p6.Text
                }, { u5.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) })
            }) }
        local v15 = #v14
        local v16 = p6.BorderBottom
        if v16 then
            v16 = u5.createElement("Frame", {
                ["BackgroundTransparency"] = 0.8,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.new(1, 0, 0, 1),
                ["Position"] = UDim2.fromScale(0, 1),
                ["AnchorPoint"] = Vector2.new(0, 1),
                ["BackgroundColor3"] = u3.WHITE
            })
        end
        if v16 then
            v14[v15 + 1] = v16
        end
        return u5.createElement("Frame", v11, v14)
    end)
}