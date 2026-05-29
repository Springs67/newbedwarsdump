local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.DividerComponent
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["GameUpdateCard"] = v7.new(u6)(function(p10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u6
            [3] = u4
            [4] = u8
            [5] = u3
            [6] = u5
        --]]
        local _ = p11.useState
        local v12 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["AutomaticSize"] = "Y",
            ["BackgroundColor3"] = u9.backgroundTertiary,
            ["Size"] = p10.Size,
            ["LayoutOrder"] = p10.LayoutOrder
        }
        local v13 = {}
        local v14 = u6.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        })
        local v15 = u6.createElement
        local v16 = "UIPadding"
        local v17 = {
            ["PaddingTop"] = UDim.new(0, u4.isSmallScreen() and 10 or 16),
            ["PaddingBottom"] = UDim.new(0, u4.isSmallScreen() and 10 or 16)
        }
        local v18 = UDim.new
        u4.isSmallScreen()
        local v19 = 0.04
        v17.PaddingLeft = v18(v19, 0)
        local v20 = UDim.new
        u4.isSmallScreen()
        local v21 = 0.04
        v17.PaddingRight = v20(v21, 0)
        __set_list(v13, 1, {v14, v15(v16, v17), u6.createElement("UIListLayout", {
    ["FillDirection"] = Enum.FillDirection.Vertical,
    ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
    ["Padding"] = UDim.new(0, 16)
})})
        local v22 = #v13
        local v23 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 40)
        }
        local v24 = {}
        local v25 = #v24
        local v26 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(0.75, 0, 0, 28)
        }
        local v27 = {
            u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 8)
            }),
            ["UpdateTitle"] = u6.createElement("TextLabel", {
                ["AutomaticSize"] = "XY",
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["TextYAlignment"] = "Top",
                ["TextXAlignment"] = "Left",
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(0, 0, 0, 0),
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u9.textPrimary,
                ["Text"] = p10.GameUpdate.title
            }, { u6.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = u4.isSmallScreen() and 20 or 28
                }) })
        }
        local v28 = #v27
        local v29 = p10.GameUpdate.pinned
        if v29 then
            v29 = u6.createFragment({
                ["PinnedIcon"] = u6.createElement("ImageLabel", {
                    ["ScaleType"] = "Fit",
                    ["SizeConstraint"] = "RelativeYY",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(0.5, 1),
                    ["Image"] = u8.THUMB_TACK_SOLID,
                    ["ImageColor3"] = u9.backgroundSuccess
                })
            })
        end
        if v29 then
            v27[v28 + 1] = v29
        end
        v24.UpdateTitleRow = u6.createElement("Frame", v26, v27)
        v24.UpdateDate = u6.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["TextYAlignment"] = "Bottom",
            ["TextXAlignment"] = "Right",
            ["TextTransparency"] = 0.6,
            ["AnchorPoint"] = Vector2.new(1, 1),
            ["Position"] = UDim2.new(1, 0, 0, 21),
            ["Size"] = UDim2.new(0.25, 0, 0, 16),
            ["Font"] = Enum.Font.Roboto,
            ["TextColor3"] = u3.WHITE,
            ["Text"] = p10.GameUpdate.date
        }, { u6.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = u4.isSmallScreen() and 12 or 16
            }) })
        v24[v25 + 1] = u6.createElement(u5, {
            ["Margin"] = 0,
            ["LayoutOrder"] = 2,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Position"] = UDim2.new(0, 0, 1, 0),
            ["BarPosition"] = {
                ["AnchorPoint"] = Vector2.new(0, 0),
                ["Position"] = UDim2.new(0, 0, 0, 0)
            }
        })
        v13.UpdateHeader = u6.createElement("Frame", v23, v24)
        v13.UpdateBody = u6.createElement("TextLabel", {
            ["AutomaticSize"] = "Y",
            ["BackgroundTransparency"] = 1,
            ["RichText"] = true,
            ["TextWrapped"] = true,
            ["TextYAlignment"] = "Top",
            ["TextXAlignment"] = "Left",
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.fromScale(0.95, 0),
            ["Font"] = Enum.Font.Roboto,
            ["TextSize"] = u4.isSmallScreen() and 14 or 18,
            ["TextColor3"] = u3.WHITE,
            ["Text"] = p10.GameUpdate.body
        })
        local v30 = p10.GameUpdate.image
        if v30 then
            local v31 = {}
            local v32 = p10.GameUpdate.image.height
            local v33 = v32 == nil and 125 or v32
            v31.Size = UDim2.new(1, 0, 0, v33)
            v31.BackgroundTransparency = 1
            v31.Image = p10.GameUpdate.image.assetId
            v31.ScaleType = "Fit"
            v31.SizeConstraint = "RelativeXX"
            v31.LayoutOrder = 3
            local v34 = {}
            local v35 = #v34
            local v36
            if p10.GameUpdate.image.aspectRatio == nil then
                v36 = false
            else
                v36 = u6.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = p10.GameUpdate.image.aspectRatio
                })
            end
            if v36 then
                v34[v35 + 1] = v36
            end
            v30 = u6.createFragment({
                ["UpdateImage"] = u6.createElement("ImageLabel", v31, v34)
            })
        end
        if v30 then
            v13[v22 + 1] = v30
        end
        return u6.createFragment({
            ["UpdateNotesCard"] = u6.createElement("Frame", v12, v13)
        })
    end)
}