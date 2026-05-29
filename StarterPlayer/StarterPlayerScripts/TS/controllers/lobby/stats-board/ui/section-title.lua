local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Checkbox
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u8 = v1.import(script, script.Parent, "section-divider").SectionDivider
return {
    ["SectionTitle"] = v6.new(u5)(function(p9, _) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u7
            [3] = u3
            [4] = u4
            [5] = u8
        --]]
        local v10 = {
            ["AutomaticSize"] = "Y",
            ["Size"] = UDim2.new(1, 0, 0, 0)
        }
        local v11 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 4)
            }) }
        local v12 = #v11
        local v13 = {
            ["Size"] = UDim2.new(1, 0, 0, 18)
        }
        local v14 = { u5.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextSize"] = 18,
                ["BorderSizePixel"] = 0,
                ["Text"] = p9.title,
                ["TextColor3"] = u7.textPrimary,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["AutomaticSize"] = Enum.AutomaticSize.Y,
                ["Size"] = UDim2.fromScale(1, 1),
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
            }) }
        local v15 = #v14
        local v16 = p9.Checkbox
        if v16 then
            v16 = u5.createElement(u3, {
                ["AspectRatio"] = 8.333333333333334,
                ["Text"] = "<b>" .. p9.Checkbox.Text .. "</b>",
                ["Value"] = p9.Checkbox.Value,
                ["SetValue"] = p9.Checkbox.SetValue,
                ["AnchorPoint"] = Vector2.new(1, 0),
                ["Position"] = UDim2.fromScale(1, 0),
                ["Size"] = UDim2.new(0, 140, 1, 0),
                ["BoxColor"] = u7.backgroundSecondary
            })
        end
        if v16 then
            v14[v15 + 1] = v16
        end
        v11[v12 + 1] = u5.createElement(u4, v13, v14)
        local v17 = p9.SectionDivider
        if v17 then
            v17 = u5.createElement(u8)
        end
        if v17 then
            v11[v12 + 2] = v17
        end
        return u5.createElement(u4, v10, v11)
    end)
}