local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["SettingRow"] = v6.new(u5)(function(p8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u7
            [3] = u3
            [4] = u4
        --]]
        local _ = p9.useState
        local v10 = {
            ["Size"] = UDim2.new(1, 0, 0, 50)
        }
        local v11 = p8.FrameProps
        if v11 then
            for v12, v13 in v11 do
                v10[v12] = v13
            end
        end
        local v14 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder"
            }) }
        local v15 = #v14
        local v16 = {
            ["Size"] = p8.LeftSize or UDim2.fromScale(0.6, 1),
            ["BackgroundColor3"] = p8.ThemeColor or u7.backgroundSecondary
        }
        local v17 = p8.FrameProps
        if v17 ~= nil then
            v17 = v17.BackgroundTransparency
        end
        v16.BackgroundTransparency = v17
        v16.BorderSizePixel = 0
        v16.LayoutOrder = 1
        local v18 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center"
            }), u5.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.2, 0),
                ["PaddingBottom"] = UDim.new(0.2, 0),
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0)
            }) }
        local v19 = #v18
        local v20 = {
            ["Font"] = "Roboto",
            ["Size"] = UDim2.fromScale(1, 1),
            ["TextColor3"] = u3.WHITE
        }
        local v21 = p8.Name
        local v22 = p8.Hint
        v20.Text = "<b>" .. v21 .. "</b>" .. ((v22 == "" or not v22) and "" or "  <font transparency=\'.4\'><i>" .. p8.Hint .. "</i></font>")
        v20.TextXAlignment = "Left"
        v20.TextScaled = true
        v20.RichText = true
        v20.BackgroundTransparency = 1
        v18[v19 + 1] = u5.createElement("TextLabel", v20, { u5.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 18
            }) })
        v14[v15 + 1] = u5.createElement("Frame", v16, v18)
        local v23 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = p8.RightSize or UDim2.fromScale(0.4, 1)
        }
        local v24 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = p8.ListLayoutPadding
            }) }
        local v25 = #v24
        local v26 = p8[u5.Children]
        if v26 then
            for v27, v28 in v26 do
                if type(v27) == "number" then
                    v24[v25 + v27] = v28
                else
                    v24[v27] = v28
                end
            end
        end
        v14[v15 + 2] = u5.createElement("Frame", v23, v24)
        return u5.createElement(u4, v10, v14)
    end)
}