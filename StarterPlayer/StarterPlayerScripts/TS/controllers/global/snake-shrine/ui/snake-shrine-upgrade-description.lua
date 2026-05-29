local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["SnakeShrineUpgradeDescription"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u6)(function(p7) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u6
            [3] = u5
            [4] = u3
        --]]
        local v8 = u4.isSmallScreen()
        return u6.createElement(u5, {
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Position"] = UDim2.fromScale(0, 0),
            ["Size"] = p7.Size or UDim2.fromScale(1, 0.4),
            ["LayoutOrder"] = p7.LayoutOrder
        }, { u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }), u6.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["TextWrap"] = true,
                ["AnchorPoint"] = Vector2.new(0, 0),
                ["Position"] = UDim2.fromScale(0, 0),
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
                ["TextColor3"] = u3.WHITE,
                ["Text"] = p7.Description,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Top,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Medium),
                ["LayoutOrder"] = p7.LayoutOrder
            }, { u6.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = v8 and 14 or 20
                }) }) })
    end)
}