local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.ScaleComponent
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["Badge"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u5)(function(p6, p7) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u3
        --]]
        local _ = p7.useState
        local v8 = p6.Size or UDim2.new(0, 16, 0, 16)
        local v9 = {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 4,
            ["Size"] = v8,
            ["AnchorPoint"] = Vector2.new(0.4, 0.4),
            ["BackgroundColor3"] = p6.BackgroundColor or Color3.fromRGB(237, 56, 79),
            ["AutomaticSize"] = Enum.AutomaticSize.XY
        }
        local v10 = p6.FrameProps
        if v10 then
            for v11, v12 in v10 do
                v9[v11] = v12
            end
        end
        local v13 = {}
        local v14 = #v13
        local v15
        if v8.X.Offset > 0 and v8.Y.Offset > 0 then
            v15 = u5.createElement(u4, {
                ["MaximumSize"] = Vector2.new(v8.X.Offset * 1.5, v8.Y.Offset * 1.5)
            })
        else
            v15 = false
        end
        if v15 then
            v13[v14 + 1] = v15
        end
        local v16 = #v13
        v13[v16 + 1] = u5.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(1, 0)
        })
        v13[v16 + 2] = u5.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        })
        local v17 = {}
        local v18 = p6.Text
        v17.Text = v18 == nil and "NEW" or v18
        v17.Size = UDim2.fromScale(0.85, 0.85)
        v17.Position = UDim2.fromScale(0.48, 0.48)
        v17.AnchorPoint = Vector2.new(0.5, 0.5)
        v17.FontFace = Font.fromName("GothamBold", Enum.FontWeight.Bold)
        v17.TextStrokeTransparency = 1
        v17.TextScaled = true
        v17.TextXAlignment = Enum.TextXAlignment.Center
        v17.TextYAlignment = Enum.TextYAlignment.Center
        v17.TextColor3 = u3.WHITE
        v17.ZIndex = 4
        v17.BackgroundTransparency = 1
        local v19 = p6.TextLabelProps
        if v19 then
            for v20, v21 in v19 do
                v17[v20] = v21
            end
        end
        v13[v16 + 3] = u5.createElement("TextLabel", v17)
        return u5.createElement("Frame", v9, v13)
    end)
}