local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["KitContractKitStatsCardRow"] = v4.new(u3)(function(p6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u2
        --]]
        local _ = p7.useState
        local v8 = {}
        for v9, v10 in p6 do
            v8[v9] = v10
        end
        v8.StatTitle = nil
        v8.StatValue = nil
        v8.BackgroundColor3 = nil
        v8.BackgroundTransparency = nil
        v8.StatImage = nil
        local v11 = {}
        for v12, v13 in v8 do
            v11[v12] = v13
        end
        v11.BackgroundColor3 = p6.BackgroundColor3 or Color3.fromRGB(34, 34, 34)
        local v14 = p6.BackgroundTransparency
        v11.BackgroundTransparency = v14 == nil and 0.6 or v14
        local v15 = { u3.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 4)
            }), u3.createElement("UIPadding", {
                ["PaddingRight"] = UDim.new(0.04, 0),
                ["PaddingLeft"] = UDim.new(0.04, 0),
                ["PaddingTop"] = UDim.new(0.1, 0),
                ["PaddingBottom"] = UDim.new(0.1, 0)
            }) }
        local v16 = #v15
        local v17 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.075, 0.9),
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["AnchorPoint"] = Vector2.new(0, 0.5)
        }
        local v18 = p6.StatImage
        if v18 == nil then
            v18 = u5.STAR_SOLID
        end
        v17.Image = v18
        v15[v16 + 1] = u3.createElement("ImageLabel", v17, { u3.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        v15[v16 + 2] = u3.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(0.6625, 0.8),
            ["Position"] = UDim2.fromScale(0.075, 0.5),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Text"] = "  " .. p6.StatTitle,
            ["TextColor3"] = u2.darken(u2.WHITE, 0.75),
            ["FontFace"] = Font.fromName("Roboto"),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Center
        })
        v15[v16 + 3] = u3.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(0.2625, 0.9),
            ["Position"] = UDim2.fromScale(1, 0.5),
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Text"] = p6.StatValue,
            ["TextColor3"] = u2.WHITE,
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
            ["TextXAlignment"] = Enum.TextXAlignment.Right,
            ["TextYAlignment"] = Enum.TextYAlignment.Center
        })
        return u3.createElement("Frame", v11, v15)
    end)
}