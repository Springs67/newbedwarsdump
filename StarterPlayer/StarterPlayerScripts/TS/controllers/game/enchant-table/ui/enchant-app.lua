local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DarkBackground
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.ScaleComponent
local u8 = v2.SlideIn
local u9 = v2.WidgetComponent
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "watcher", "ui", "engineer-film-effect").EngineerFilmEffect
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u17 = v1.import(script, script.Parent, "enchant-table-left", "enchant-item-grid").EnchantItemGrid
local u18 = v1.import(script, script.Parent, "enchant-table-right", "enchants-action-button").EnchantActionButton
local u19 = v1.import(script, script.Parent, "enchant-table-ui-util").EnchantTableUIUtil
local v53 = v11.new(u10)(function(p20, p21) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u10
        [3] = u12
        [4] = u5
        [5] = u4
        [6] = u14
        [7] = u13
        [8] = u8
        [9] = u7
        [10] = u9
        [11] = u6
        [12] = u16
        [13] = u3
        [14] = u17
        [15] = u18
    --]]
    local _ = p21.useState
    local v22 = p21.useEffect
    local v23 = p20.ThemeColor or u19.getThemeColor(p20.EnchantTableType)
    local u24 = u10.createRef()
    v22(function() --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u12
        --]]
        local u25 = u24:getValue()
        if u25 then
            local u26 = u12:Create(u25, TweenInfo.new(5, Enum.EasingStyle.Linear), {
                ["Offset"] = Vector2.new(-1, 0)
            })
            u26:Play()
            u26.Completed:Connect(function() --[[ Line: 33 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u26
                --]]
                if u25.Rotation == 180 then
                    u25.Rotation = 0
                    u25.Offset = Vector2.new(1, 0)
                else
                    u25.Rotation = 180
                    u25.Offset = Vector2.new(1, 0)
                end
                u26:Play()
            end)
        end
    end, {})
    local v27 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = u5.isSmallScreen()
    }
    local v28 = { u10.createElement(u4, {
            ["BackgroundTransparency"] = 0.4,
            ["AppId"] = p20.AppId
        }) }
    local v29 = #v28
    local v30
    if p20.EnchantTableType == u14.ENCHANT_TABLE_GLITCHED then
        v30 = u10.createElement(u13, {
            ["transparency"] = 0.95
        })
    else
        v30 = false
    end
    if v30 then
        v28[v29 + 1] = v30
    end
    local v31 = #v28 + 1
    local v32 = u10.createElement
    local v33 = u8
    local v34 = {}
    local v35 = u10.createElement
    local v36 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromOffset(622, 380)
    }
    local v37 = {}
    local v38 = u10.createElement(u7, {
        ["MaximumSize"] = Vector2.new(889, 543),
        ["ScreenPadding"] = Vector2.new(24, 24)
    })
    local v39 = u10.createElement
    local v40 = u9
    local v41 = {
        ["Title"] = "Enchanting Table",
        ["AppId"] = p20.AppId,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1),
        ["ContentUIPadding"] = u10.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0, 0),
            ["PaddingRight"] = UDim.new(0, 0),
            ["PaddingTop"] = UDim.new(0, 0),
            ["PaddingBottom"] = UDim.new(0, 0)
        }),
        ["CornerFillerProps"] = {
            ["TopLeft"] = false,
            ["TopRight"] = true
        }
    }
    local v42 = {}
    local v43 = u10.createElement
    local v44 = u6
    local v45 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v46 = { (u10.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        })) }
    local v47 = u10.createElement
    local v48 = {
        ["LayoutOrder"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(1, 0.2),
        ["BackgroundColor3"] = u16.backgroundTertiary
    }
    local v49 = {
        u10.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0.08, 0),
            ["PaddingRight"] = UDim.new(0.08, 0),
            ["PaddingTop"] = UDim.new(0.1, 0),
            ["PaddingBottom"] = UDim.new(0.05, 0)
        }),
        u10.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.02, 0)
        }),
        ["TitleContainer1"] = u10.createElement("Frame", {
            ["BackgroundTransparency"] = 0.7,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.3),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }, {
            u10.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }),
            ["Title"] = u10.createElement("TextLabel", {
                ["Text"] = "Description",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.9, 0.8),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            })
        }),
        ["Description"] = u10.createElement("TextLabel", {
            ["TextTransparency"] = 0.3,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["TextXAlignment"] = "Center",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.7),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Text"] = "Apply a random enchant to your weapons. " .. (u5.isMobileControls() and "Tap" or "Hover") .. " enchant below to read description.",
            ["TextColor3"] = u3.WHITE
        }, { u10.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = u5.isSmallScreen() and 10 or 13
            }) })
    }
    v46.Top = v47("Frame", v48, v49)
    local v50 = u10.createElement
    local v51 = {
        ["LayoutOrder"] = 2,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(1, 0.8),
        ["BackgroundColor3"] = u16.backgroundTertiary
    }
    local v52 = {
        u10.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.02, 0)
        }),
        u10.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0.08, 0),
            ["PaddingRight"] = UDim.new(0.08, 0),
            ["PaddingTop"] = UDim.new(0.05, 0),
            ["PaddingBottom"] = UDim.new(0.05, 0)
        }),
        ["Weapon Enchants"] = u10.createElement("Frame", {
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 0.7,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 1,
            ["Size"] = UDim2.fromScale(0.5, 1),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        }, {
            u10.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["Image"] = "rbxassetid://121940241866220",
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 10,
                ["Size"] = UDim2.fromScale(0.25, 0.25),
                ["Position"] = UDim2.fromScale(0.5, 0),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }),
            u10.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }),
            ["GradientOverlay"] = u10.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 2,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u3.WHITE
            }, { u10.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                }), u10.createElement("UIGradient", {
                    ["Rotation"] = -90,
                    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u3.darken(v23, 0.6)), ColorSequenceKeypoint.new(0.5, u3.darken(v23, 0.7)), ColorSequenceKeypoint.new(1, u3.darken(v23, 0.8)) }),
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.3), NumberSequenceKeypoint.new(0.6, 1), NumberSequenceKeypoint.new(1, 1) })
                }) }),
            ["WeaponEnchantFrame"] = u10.createElement("Frame", {
                ["LayoutOrder"] = 1,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 1)
            }, {
                u10.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0.02, 0)
                }),
                u10.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0.08, 0),
                    ["PaddingRight"] = UDim.new(0.08, 0),
                    ["PaddingTop"] = UDim.new(0.05, 0),
                    ["PaddingBottom"] = UDim.new(0.05, 0)
                }),
                ["TitleContainer2"] = u10.createElement("Frame", {
                    ["BackgroundTransparency"] = 0.7,
                    ["BorderSizePixel"] = 0,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.9, 0.1),
                    ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
                }, {
                    u10.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0.1, 0)
                    }),
                    ["Title"] = u10.createElement("TextLabel", {
                        ["Text"] = "Weapon Enchants",
                        ["TextScaled"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(0.9, 1),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                    })
                }),
                ["EnchantItemGrid"] = u10.createElement("Frame", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["LayoutOrder"] = 2,
                    ["ZIndex"] = 100,
                    ["Size"] = UDim2.fromScale(1, 0.7)
                }, { u10.createElement(u17, {
                        ["LayoutOrder"] = 3,
                        ["EnchantTableType"] = p20.EnchantTableType,
                        ["Size"] = UDim2.fromScale(1, 1)
                    }) }),
                ["EnchantItemButton"] = u10.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["LayoutOrder"] = 5,
                    ["BackgroundTransparency"] = 0.7,
                    ["ZIndex"] = 10,
                    ["Size"] = UDim2.fromScale(1, 0.15),
                    ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
                }, { u10.createElement(u18, {
                        ["LayoutOrder"] = 6,
                        ["Size"] = UDim2.fromScale(1, 1)
                    }) })
            })
        })
    }
    v46.Bottom = v50("Frame", v51, v52)
    __set_list(v42, 1, {v43(v44, v45, v46)})
    __set_list(v37, 1, {v38, v39(v40, v41, v42)})
    __set_list(v34, 1, {v35("Frame", v36, v37)})
    v28[v31] = v32(v33, {}, v34)
    return u10.createElement("ScreenGui", v27, v28)
end)
return {
    ["EnchantApp"] = v15.connect(function(_, p54) --[[ Line: 290 ]]
        local v55 = {}
        for v56, v57 in p54 do
            v55[v56] = v57
        end
        return v55
    end)(v53)
}