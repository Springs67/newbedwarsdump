local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["CustomKitCreation_KitSelection_SlotGUI"] = v8.new(u7)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u6
            [3] = u5
            [4] = u3
            [5] = u4
            [6] = u9
        --]]
        local _ = p11.useState
        local _ = p11.useEffect
        local v12 = u7.createFragment
        local v13 = {}
        local v14 = u7.createElement
        local v15 = u6
        local v16 = {
            ["Size"] = UDim2.new(1, 0, 0, u5.isSmallScreen() and 40 or 50),
            ["LayoutOrder"] = u10.LayoutOrder
        }
        local v21 = {
            ["SelectButton"] = u7.createElement(u3, {
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = u10.LayoutOrder,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u4.WHITE,
                ["BackgroundTransparency"] = u10.Selected and 0.7 or 0.8,
                ["OnClick"] = function() --[[ Name: OnClick, Line 25 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                    --]]
                    u10.OnClicked()
                end,
                ["CornerRadius"] = UDim.new(0, 0)
            }, {
                u7.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.01, 0),
                    ["PaddingBottom"] = UDim.new(0.01, 0),
                    ["PaddingLeft"] = UDim.new(0.01, 0),
                    ["PaddingRight"] = UDim.new(0.01, 0)
                }),
                u7.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["Padding"] = UDim.new(0.02, 0),
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }),
                ["KitName"] = u7.createElement("TextLabel", {
                    ["LayoutOrder"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["ZIndex"] = 60,
                    ["Size"] = UDim2.fromScale(0.75, 0.6),
                    ["Position"] = UDim2.fromScale(1, 0.5),
                    ["AnchorPoint"] = Vector2.new(1, 0.5),
                    ["Text"] = u10.Kit.name,
                    ["TextColor3"] = u4.WHITE,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    ["TextXAlignment"] = Enum.TextXAlignment.Left
                }),
                ["EditButton"] = u7.createElement("ImageButton", {
                    ["Size"] = UDim2.fromScale(0.1, 0.6),
                    ["Position"] = UDim2.fromScale(0, 0.5),
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    [u7.Event.Activated] = function() --[[ Line: 62 ]]
                        --[[
                        Upvalues:
                            [1] = u10
                        --]]
                        u10.OnEditClicked()
                    end,
                    [u7.Event.MouseEnter] = function(p17) --[[ Line: 65 ]]
                        p17.ImageTransparency = 0.3
                    end,
                    [u7.Event.MouseLeave] = function(p18) --[[ Line: 68 ]]
                        p18.ImageTransparency = 0
                    end,
                    ["Image"] = u9.EDIT_FILLED_ICON,
                    ["ZIndex"] = 120,
                    ["LayoutOrder"] = 2,
                    ["Selectable"] = true,
                    ["ScaleType"] = Enum.ScaleType.Fit
                }, { u7.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }),
                ["TrashButton"] = u7.createElement("ImageButton", {
                    ["Size"] = UDim2.fromScale(0.1, 0.6),
                    ["Position"] = UDim2.fromScale(0, 0.5),
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    [u7.Event.Activated] = function() --[[ Line: 87 ]]
                        --[[
                        Upvalues:
                            [1] = u10
                        --]]
                        u10.OnDeleteClicked()
                    end,
                    [u7.Event.MouseEnter] = function(p19) --[[ Line: 90 ]]
                        p19.ImageTransparency = 0.3
                    end,
                    [u7.Event.MouseLeave] = function(p20) --[[ Line: 93 ]]
                        p20.ImageTransparency = 0
                    end,
                    ["Image"] = u9.TRASH_ICON,
                    ["ZIndex"] = 120,
                    ["LayoutOrder"] = 3,
                    ["Selectable"] = true,
                    ["ScaleType"] = Enum.ScaleType.Fit
                }, { u7.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
            })
        }
        v13.CustomKitCreation_KitSelection_SlotGUI = v14(v15, v16, v21)
        return v12(v13)
    end)
}