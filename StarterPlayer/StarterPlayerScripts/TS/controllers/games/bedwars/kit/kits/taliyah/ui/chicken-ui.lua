local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
return {
    ["ChickenUi"] = v3.new(u2)(function(p5, p6) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
        --]]
        local _ = p6.useState
        local v7 = u4(p5.currency).image
        local v8 = v7 == nil and "rbxassetid://6850537969" or v7
        local v9 = u2.createElement
        local v10 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.2, 1)
        }
        local v11 = {
            u2.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.667
            }),
            u2.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 1)
            }),
            ["ChickenIcon"] = u2.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["Image"] = "rbxassetid://13988247449",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1)
            }, { u2.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }),
            ["DividerText"] = u2.createElement("TextLabel", {
                ["AutomaticSize"] = "X",
                ["Text"] = "=",
                ["Font"] = "LuckiestGuy",
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0, 0.8),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            }),
            ["RewardIcon"] = u2.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = v8
            }, { u2.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        }
        local v12 = u2.createElement
        local v13 = {
            ["AutomaticSize"] = "X",
            ["Font"] = "LuckiestGuy",
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.fromScale(0, 0.8)
        }
        local v14 = p5.chickenPrice
        v13.Text = tostring(v14)
        v13.TextColor3 = Color3.fromRGB(255, 255, 255)
        v11.PriceText = v12("TextLabel", v13)
        return v9("Frame", v10, v11)
    end)
}