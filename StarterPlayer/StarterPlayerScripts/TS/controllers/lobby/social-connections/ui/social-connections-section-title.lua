local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.ImageId
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["SocialConnectionsSectionTitle"] = v6.new(u5)(function(p8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u7
            [4] = u3
        --]]
        local _ = p9.useState
        local v10 = u5.createElement
        local v11 = "Frame"
        local v12 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 24),
            ["LayoutOrder"] = p8.LayoutOrder
        }
        local v13 = {}
        local v14 = u5.createElement
        local v15 = "Frame"
        local v16 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 1, 0)
        }
        local v17 = {}
        local v18 = u5.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 10)
        })
        local v19 = u5.createElement
        local v20 = "ImageLabel"
        local v21 = {
            ["ScaleType"] = "Fit",
            ["SizeConstraint"] = "RelativeYY",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v22
        if p8.Completed then
            v22 = u4.CHECK_CIRCLE_SOLID
        else
            v22 = u4.CIRCLE_HOLLOW
        end
        v21.Image = v22
        local v23
        if p8.Completed then
            v23 = u7.backgroundSuccess
        else
            v23 = u3.WHITE
        end
        v21.ImageColor3 = v23
        v21.ImageTransparency = p8.Completed and 0 or 0.4
        __set_list(v17, 1, {v18, v19(v20, v21), u5.createElement("TextLabel", {
    ["RichText"] = true,
    ["TextSize"] = 16,
    ["BackgroundTransparency"] = 1,
    ["Size"] = UDim2.new(1, 0, 0, 0),
    ["AutomaticSize"] = Enum.AutomaticSize.Y,
    ["Text"] = p8.Title,
    ["TextColor3"] = u3.WHITE,
    ["TextXAlignment"] = Enum.TextXAlignment.Left,
    ["Font"] = Enum.Font.Roboto
})})
        __set_list(v13, 1, {v14(v15, v16, v17), u5.createElement("TextLabel", {
    ["RichText"] = true,
    ["TextSize"] = 12,
    ["BackgroundTransparency"] = 1,
    ["AnchorPoint"] = Vector2.new(1, 0.5),
    ["Position"] = UDim2.fromScale(1, 0.5),
    ["AutomaticSize"] = Enum.AutomaticSize.XY,
    ["Text"] = p8.Completed and "" or "Incomplete",
    ["TextColor3"] = u7.textSecondary,
    ["TextXAlignment"] = Enum.TextXAlignment.Right,
    ["Font"] = Enum.Font.Roboto
})})
        return v10(v11, v12, v13)
    end)
}