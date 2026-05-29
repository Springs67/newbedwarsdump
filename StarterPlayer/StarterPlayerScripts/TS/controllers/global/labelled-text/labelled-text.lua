local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["LabelledText"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p3, p4) --[[ Line: 5 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local _ = p4.useState
        local _ = p4.useEffect
        local v5 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["LayoutOrder"] = p3.LayoutOrder
        }
        local v6 = p3.FrameProps
        if v6 then
            for v7, v8 in v6 do
                v5[v7] = v8
            end
        end
        local v9 = {}
        local v10 = #v9
        local v11 = {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = p3.Padding or UDim.new(0, 0),
            ["HorizontalAlignment"] = p3.HorizontalAlignment or "Center",
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }
        local v12 = p3.ListLayoutProps
        if v12 then
            for v13, v14 in v12 do
                v11[v13] = v14
            end
        end
        v9[v10 + 1] = u2.createElement("UIListLayout", v11)
        local v15 = {
            ["Text"] = p3.Text
        }
        local v16 = UDim2
        local v17 = p3.TextScale
        local v18 = v17 == nil and 1 or v17
        v15.Size = v16.fromScale(0, v18)
        v15.TextColor3 = Color3.fromRGB(255, 255, 255)
        v15.TextXAlignment = Enum.TextXAlignment.Center
        v15.TextScaled = true
        v15.AutomaticSize = Enum.AutomaticSize.X
        v15.BorderSizePixel = 0
        v15.BackgroundTransparency = 1
        v15.RichText = true
        v15.Font = Enum.Font.Roboto
        v15.LayoutOrder = 1
        v15.TextTransparency = p3.Transparency
        local v19 = p3.TextProps
        if v19 then
            for v20, v21 in v19 do
                v15[v20] = v21
            end
        end
        v9[v10 + 2] = u2.createElement("TextLabel", v15)
        local v22 = {}
        local v23 = UDim2
        local v24 = p3.ImageScale
        local v25 = v24 == nil and 1 or v24
        v22.Size = v23.fromScale(1, v25)
        v22.Position = UDim2.fromScale(0.5, 0.5)
        v22.AnchorPoint = Vector2.new(0.5, 0.5)
        v22.Image = p3.Image
        v22.BackgroundTransparency = 1
        v22.BorderSizePixel = 0
        v22.ScaleType = Enum.ScaleType.Fit
        v22.LayoutOrder = p3.ImageLeft and 0 or 2
        v22.ImageTransparency = p3.Transparency
        local v26 = p3.ImageProps
        if v26 then
            for v27, v28 in v26 do
                v22[v27] = v28
            end
        end
        v9[v10 + 3] = u2.createElement("ImageLabel", v22, { u2.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        return u2.createElement("Frame", v5, v9)
    end)
}