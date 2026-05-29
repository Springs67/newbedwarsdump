local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["LockerPreviewFullscreenFooter"] = v8.new(u7)(function(u11) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
            [3] = u5
            [4] = u3
            [5] = u10
            [6] = u6
            [7] = u9
        --]]
        local v12 = u7.createFragment
        local v13 = {}
        local v14 = u7.createFragment
        local v15 = {
            ["LockerPreviewFullscreenBackground"] = u7.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 0.2,
                ["ZIndex"] = -1,
                ["Size"] = UDim2.new(2, 0, 0.15, 0),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Position"] = UDim2.fromScale(0.5, 1),
                ["BackgroundColor3"] = u4.BLACK
            }, { u7.createElement("UISizeConstraint", {
                    ["MaxSize"] = Vector2.new((1 / 0), 75)
                }) })
        }
        v13.LockerPreviewFullscreenBackground = v14(v15)
        local v16 = u7.createElement
        local v17 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 0.15, 0),
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 1)
        }
        local v18 = { u7.createElement("UISizeConstraint", {
                ["MaxSize"] = Vector2.new((1 / 0), 75)
            }), (u7.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 10),
                ["PaddingBottom"] = UDim.new(0, 10),
                ["PaddingLeft"] = UDim.new(0, 10),
                ["PaddingRight"] = UDim.new(0, 10)
            })) }
        local v19 = u7.createElement
        local v20 = u5
        local v21 = {
            ["Size"] = UDim2.fromScale(0.5, 1),
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.fromScale(1, 0.5)
        }
        local v22 = {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0, 20),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            u7.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(0.5, 1),
                ["Text"] = "<b>" .. u11.name .. "</b> <font transparency=\'.4\'>(" .. u11.previewName .. ")</font>",
                ["TextColor3"] = u4.WHITE,
                ["Font"] = Enum.Font.Roboto,
                ["TextXAlignment"] = Enum.TextXAlignment.Right,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }, { u7.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 24
                }) }),
            ["ReplayButton"] = u7.createElement(u3, {
                ["Text"] = "<b>REPLAY</b>",
                ["LayoutOrder"] = 1,
                ["BackgroundColor3"] = u10.backgroundPrimary,
                ["Size"] = UDim2.fromScale(0.5, 1),
                ["OnClick"] = function() --[[ Name: OnClick, Line 77 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u11
                    --]]
                    u6.Controllers.LockerPreviewController:preview(u11.previewItem)
                end,
                ["CornerRadius"] = UDim.new(0, 6),
                ["Visible"] = u11.canReplay
            }, { u7.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 3.795918367346939,
                    ["DominantAxis"] = "Height"
                }) })
        }
        v18.LockerPreviewRight = v19(v20, v21, v22)
        local v23 = u7.createElement
        local v24 = u5
        local v25 = {
            ["Size"] = UDim2.fromScale(0.5, 1),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(0, 0.5)
        }
        local v26 = {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0, 10),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            ["ReturnButton"] = u7.createElement(u3, {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Image"] = u9.ARROW_LEFT,
                ["Size"] = UDim2.fromScale(0.2, 1),
                ["OnClick"] = function() --[[ Name: OnClick, Line 106 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u11
                    --]]
                    u6.Controllers.LockerPreviewController:closeFullscreenPreview()
                    if u11.onClose then
                        u11.onClose()
                    end
                end,
                ["CornerRadius"] = UDim.new(0, 6)
            }, { u7.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1,
                    ["DominantAxis"] = "Height"
                }) })
        }
        v18.LockerPreviewLeft = v23(v24, v25, v26)
        __set_list(v13, 1, {v16("Frame", v17, v18)})
        return v12(v13)
    end)
}