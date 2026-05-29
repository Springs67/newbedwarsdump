local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
return {
    ["MatchEndArmorTrimXp"] = v4.new(u3)(function(p6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u2
        --]]
        local _ = p7.useState
        local _ = p7.useEffect
        local v8 = u5(p6.ArmorTrimXpEarned.kit).renderImage
        local v9 = u3.createElement
        local v10 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v11 = {
            u3.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.5
            }),
            u3.createElement("UISizeConstraint", {
                ["MaxSize"] = Vector2.new((1 / 0), 50)
            }),
            ["ArmorTrimKitImage"] = u3.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.3, 0.9),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["Image"] = v8
            })
        }
        local v12 = u3.createElement
        local v13 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.68, 1),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Position"] = UDim2.fromScale(1, 0)
        }
        local v14 = { (u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            })) }
        local v15 = u3.createElement
        local v16 = {
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.6)
        }
        local v17 = p6.ArmorTrimXpEarned.xpEarned
        local v18 = math.ceil(v17)
        v16.Text = "+" .. tostring(v18) .. " XP"
        v16.TextXAlignment = Enum.TextXAlignment.Left
        v16.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v16.TextColor3 = u2.WHITE
        v14.ArmorTrimXpEarnedAmount = v15("TextLabel", v16)
        v14.ArmorTrimXpLabel = u3.createElement("TextLabel", {
            ["Text"] = "ARMOR TRIM",
            ["TextTransparency"] = 0.5,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.4),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
            ["TextColor3"] = u2.WHITE
        })
        __set_list(v11, 3, {v12("Frame", v13, v14)})
        return v9("Frame", v10, v11)
    end)
}