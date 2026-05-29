local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "labelled-text", "labelled-text").LabelledText
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["EquippedRow"] = v3.new(u2)(function(p7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
            [3] = u5
            [4] = u4
        --]]
        local _ = p8.useState
        local v9 = u2.createElement
        local v10 = "Frame"
        local v11 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = p7.Size or UDim2.new(1, 0, 0, 100),
            ["LayoutOrder"] = p7.LayoutOrder
        }
        local v12 = { (u2.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.03, 0)
            })) }
        local v13 = u2.createElement
        local v14 = "Frame"
        local v15 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(0.35, 1)
        }
        local v16 = {}
        local v17 = u2.createElement
        local v18 = "Frame"
        local v19 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.9, 0.9),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundColor3"] = u6.backgroundSecondary
        }
        local v20 = {}
        local v21 = u2.createElement
        local v22 = "ImageLabel"
        local v23 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v24
        if p7.None then
            v24 = UDim2.fromScale(0.7, 0.7)
        else
            v24 = UDim2.fromScale(0.95, 0.95)
        end
        v23.Size = v24
        local v25
        if p7.None then
            v25 = u5.CANCEL
        else
            v25 = p7.Image
        end
        v23.Image = v25
        v23.ScaleType = Enum.ScaleType.Fit
        local v26
        if p7.None then
            v26 = u6.textPrimary
        else
            v26 = nil
        end
        v23.ImageColor3 = v26
        v23.ImageTransparency = p7.None and 0.5 or 0
        v20.EquipImage = v21(v22, v23)
        __set_list(v20, 1, {u2.createElement("UICorner", {
    ["CornerRadius"] = UDim.new(0.1, 0)
})})
        v16.EquipImageWrapper = v17(v18, v19, v20)
        v12.EquipImageSide = v13(v14, v15, v16)
        v12.EquipInfoSide = u2.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.6, 0.9),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }, {
            u2.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["Padding"] = UDim.new(0.1, 0)
            }),
            u2.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.1, 0)
            }),
            ["EquipType"] = u2.createElement(u4, {
                ["LayoutOrder"] = 0,
                ["ImageLeft"] = true,
                ["TextScale"] = 1,
                ["FrameProps"] = {
                    ["Size"] = UDim2.fromScale(1, 0.22)
                },
                ["Image"] = p7.Icon,
                ["ImageProps"] = {
                    ["ImageColor3"] = u6.textPrimary
                },
                ["Text"] = "<b>" .. p7.Type .. "</b>",
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["TextProps"] = {
                    ["TextColor3"] = u6.textPrimary
                },
                ["Padding"] = UDim.new(0, 1)
            }),
            ["EquipName"] = u2.createElement("TextLabel", {
                ["LayoutOrder"] = 1,
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Size"] = UDim2.fromScale(1, 0.2),
                ["Text"] = p7.Name,
                ["TextColor3"] = u6.textSecondary,
                ["TextXAlignment"] = Enum.TextXAlignment.Left
            })
        })
        return v9(v10, v11, v12)
    end)
}