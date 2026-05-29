local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["HostPanelSetting"] = v6.new(u5)(function(p8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u7
            [3] = u3
            [4] = u4
        --]]
        local _ = p9.useState
        local v10 = {}
        for v11, v12 in p8 do
            v10[v11] = v12
        end
        v10.Name = nil
        v10.Hint = nil
        v10.LeftSize = nil
        v10.RightSize = nil
        v10[u5.Children] = nil
        local v13 = {
            ["Size"] = UDim2.new(1, 0, 0, 50)
        }
        for v14, v15 in v10 do
            v13[v14] = v15
        end
        local v16 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder"
            }) }
        local v17 = #v16
        local v18 = {
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = p8.LeftSize or UDim2.fromScale(0.6, 1),
            ["BackgroundColor3"] = u7.backgroundPrimary
        }
        local v19 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center"
            }), u5.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.2, 0),
                ["PaddingBottom"] = UDim.new(0.2, 0),
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0)
            }) }
        local v20 = #v19
        local v21 = {
            ["Font"] = "Roboto",
            ["Size"] = UDim2.fromScale(1, 1),
            ["TextColor3"] = u3.WHITE
        }
        local v22 = p8.Name
        local v23 = p8.Hint
        v21.Text = "<b>" .. v22 .. "</b>" .. ((v23 == "" or not v23) and "" or "  <font transparency=\'.4\'><i>" .. p8.Hint .. "</i></font>")
        v21.TextXAlignment = "Left"
        v21.TextScaled = true
        v21.RichText = true
        v21.BackgroundTransparency = 1
        v19[v20 + 1] = u5.createElement("TextLabel", v21, { u5.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 18
            }) })
        v16[v17 + 1] = u5.createElement("Frame", v18, v19)
        local v24 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = p8.RightSize or UDim2.fromScale(0.4, 1)
        }
        local v25 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder"
            }) }
        local v26 = #v25
        local v27 = p8[u5.Children]
        if v27 then
            for v28, v29 in v27 do
                if type(v28) == "number" then
                    v25[v26 + v28] = v29
                else
                    v25[v28] = v29
                end
            end
        end
        v16[v17 + 2] = u5.createElement("Frame", v24, v25)
        return u5.createElement(u4, v13, v16)
    end)
}