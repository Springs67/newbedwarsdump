local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.Padding
local u8 = v2.PlayerViewport
local u9 = v2.StringUtil
local u10 = v2.UIUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.TweenService
local u15 = v13.UserInputService
return {
    ["ShopItemTile"] = v12.new(u11)(function(u16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u14
            [3] = u4
            [4] = u15
            [5] = u10
            [6] = u5
            [7] = u8
            [8] = u6
            [9] = u7
            [10] = u9
            [11] = u3
        --]]
        local v18 = p17.useState
        local v19 = p17.useEffect
        local u20, u21 = v18(false)
        local v22 = u16.TimesPurchased
        local v23 = (v22 == nil and 0 or v22) >= u16.MaxPurchases
        local u24 = u11.createRef()
        local u25 = u11.createRef()
        v19(function() --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u25
                [3] = u20
                [4] = u14
                [5] = u4
                [6] = u16
            --]]
            local v26 = u24:getValue()
            local v27 = u25:getValue()
            if v26 and v27 then
                if u20 then
                    u14:Create(v26, TweenInfo.new(0.3), {
                        ["Size"] = v26.Size - UDim2.fromScale(0.05, 0.05)
                    }):Play()
                    u14:Create(v27, TweenInfo.new(0.4), {
                        ["BackgroundColor3"] = u4.darken(Color3.fromHex("#6B6EB5"), 0.8)
                    }):Play()
                else
                    u14:Create(v26, TweenInfo.new(0.3), {
                        ["Size"] = UDim2.new(u16.Item.TextImage == nil and 0.65 or 0.8, 0, 0.65, 0)
                    }):Play()
                    u14:Create(v27, TweenInfo.new(0.4), {
                        ["BackgroundColor3"] = Color3.fromHex("#6B6EB5")
                    }):Play()
                end
            else
                return nil
            end
        end, { u20 })
        v19(function() --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u10
                [3] = u25
            --]]
            if u15.GamepadEnabled then
                u10:selectGui(u25:getValue())
            end
        end, {})
        local v28 = {
            [u11.Event.Activated] = function() --[[ Line: 63 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                u16.OnClick()
            end,
            [u11.Event.MouseEnter] = function() --[[ Line: 66 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21(true)
            end,
            [u11.Event.MouseLeave] = function() --[[ Line: 69 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21(false)
            end,
            ["BackgroundColor3"] = Color3.fromHex("#6B6EB5"),
            ["AutoButtonColor"] = false,
            ["Selectable"] = true,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = u16.LayoutOrder,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v29 = u16.FrameProps
        if v29 then
            for v30, v31 in v29 do
                v28[v30] = v31
            end
        end
        v28[u11.Ref] = u25
        local v32 = {
            u11.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }),
            ["GradientGlow"] = u11.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 1)
            }, { u11.createElement("UIGradient", {
                    ["Rotation"] = 90,
                    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u4.BLACK), ColorSequenceKeypoint.new(1, u16.RarityColor or u4.WHITE) }),
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.65) })
                }) })
        }
        local v33 = #v32
        local v34 = {
            ["Size"] = UDim2.new(u16.Item.TextImage == nil and 0.65 or 0.8, 0, 0.65, 0),
            ["Position"] = UDim2.fromScale(0.5, 0.325),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            [u11.Ref] = u24,
            ["ZIndex"] = 1
        }
        local v35 = {}
        local v36 = #v35
        local v37
        if u16.Item.Image == nil then
            v37 = false
        else
            v37 = u11.createFragment({
                ["ItemImage"] = u11.createElement("ImageLabel", {
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 1,
                    ["Image"] = u16.Item.Image,
                    ["Size"] = UDim2.new(1, 0, 1, 0)
                })
            })
        end
        if v37 then
            v35[v36 + 1] = v37
        end
        local v38 = #v35
        local v39
        if u16.Item.TextImage == nil then
            v39 = false
        else
            v39 = u11.createFragment({
                ["ItemTextImage"] = u11.createElement("TextLabel", {
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.new(1, 0, 1, 0),
                    ["Text"] = u16.Item.TextImage,
                    ["Font"] = Enum.Font.LuckiestGuy,
                    ["TextColor3"] = u4.WHITE
                }, { u11.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = u5.isSmallScreen() and 14 or 30
                    }) })
            })
        end
        if v39 then
            v35[v38 + 1] = v39
        end
        local v40 = #v35
        local v41
        if u16.Item.Animation == nil then
            v41 = false
        else
            v41 = u11.createFragment({
                ["RewardShowcase"] = u11.createElement(u8, {
                    ["ImageTransparency"] = 0,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Animation"] = u16.Item.Animation,
                    ["Size"] = UDim2.new(1, 0, 1, 0),
                    ["LayoutOrder"] = u16.LayoutOrder
                })
            })
        end
        if v41 then
            v35[v40 + 1] = v41
        end
        v32.ItemFrame = u11.createElement(u6, v34, v35)
        local v42 = u11.createElement
        local v43 = u6
        local v44 = {
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v45 = {
            u11.createElement(u7, {
                ["Padding"] = {
                    ["Horizontal"] = 6,
                    ["Vertical"] = 14
                }
            }),
            u11.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Bottom",
                ["HorizontalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 0.1)
            }),
            ["Name"] = u11.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 2,
                ["Size"] = UDim2.new(1, 0, 0, 30),
                ["Text"] = "<b>" .. string.upper(u16.Item.Name) .. "</b>",
                ["TextColor3"] = u16.RarityColor,
                ["Font"] = Enum.Font.Roboto
            }, { u11.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 20
                }) })
        }
        local v46
        if v23 then
            v46 = u11.createElement(u3, {
                ["Text"] = "PURCHASED",
                ["TextSize"] = 12,
                ["ZIndex"] = 2,
                ["LayoutOrder"] = 2,
                ["Font"] = Enum.Font.SourceSansBold,
                ["TextColor3"] = u4.WHITE,
                ["Limits"] = Vector2.new(220, 32),
                ["TextYAlignment"] = Enum.TextYAlignment.Top
            })
        else
            v46 = u11.createFragment({
                ["CostContainer"] = u11.createElement("Frame", {
                    ["AutomaticSize"] = "X",
                    ["ClipsDescendants"] = false,
                    ["BackgroundTransparency"] = 0.6,
                    ["BorderSizePixel"] = 0,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.new(0, 0, 0, 22),
                    ["BackgroundColor3"] = u16.RarityColor
                }, {
                    u11.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(1, 0)
                    }),
                    u11.createElement(u7, {
                        ["Padding"] = {
                            ["Vertical"] = 4,
                            ["Horizontal"] = 6
                        }
                    }),
                    u11.createElement("UIListLayout", {
                        ["FillDirection"] = "Horizontal",
                        ["HorizontalAlignment"] = "Center",
                        ["VerticalAlignment"] = "Center",
                        ["SortOrder"] = "LayoutOrder",
                        ["Padding"] = UDim.new(0, 4)
                    }),
                    ["CurrencyIcon"] = u11.createElement("ImageLabel", {
                        ["SizeConstraint"] = "RelativeYY",
                        ["ScaleType"] = "Fit",
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = -1,
                        ["ZIndex"] = 2,
                        ["Size"] = UDim2.new(1, 0, 1, 0),
                        ["Image"] = u16.Currency.Icon
                    }, { u11.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }) }),
                    ["PriceText"] = u11.createElement("TextLabel", {
                        ["TextSize"] = 11,
                        ["TextWrapped"] = false,
                        ["BackgroundTransparency"] = 1,
                        ["BorderSizePixel"] = 0,
                        ["ZIndex"] = 2,
                        ["LayoutOrder"] = 2,
                        ["AutomaticSize"] = Enum.AutomaticSize.XY,
                        ["Text"] = u9.formatNumberWithCommas(u16.Currency.Price),
                        ["Font"] = Enum.Font.SourceSansBold,
                        ["TextColor3"] = u4.WHITE,
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["TextYAlignment"] = Enum.TextYAlignment.Center
                    })
                })
            })
        end
        __set_list(v45, 3, {v46})
        v32.Content = v42(v43, v44, v45)
        v32.BottomBorder = u11.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 3,
            ["Size"] = UDim2.fromScale(1, 0.02),
            ["Position"] = UDim2.fromScale(0, 1),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["BackgroundColor3"] = u16.RarityColor
        }, { u11.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }) })
        local v47 = not v23
        if v47 then
            v47 = u16.MaxPurchases >= 1
        end
        if v47 then
            local v48 = {
                ["AnchorPoint"] = Vector2.new(0, 0),
                ["Position"] = UDim2.fromScale(0.06, 0.04),
                ["Size"] = UDim2.new(1, 0, 0.07, 0)
            }
            local v49 = u16.MaxPurchases
            local v50 = u16.TimesPurchased
            local v51 = v49 - (v50 == nil and 0 or v50)
            local v52 = tostring(v51)
            local v53 = u16.MaxPurchases
            v48.Text = "<b>" .. v52 .. "/" .. tostring(v53) .. " Left</b>"
            v48.Font = Enum.Font.Roboto
            v48.RichText = true
            v48.TextScaled = true
            v48.TextXAlignment = Enum.TextXAlignment.Left
            v48.BackgroundTransparency = 1
            v48.BorderSizePixel = 0
            v48.TextTransparency = 0.3
            v48.TextColor3 = u4.WHITE
            v48.ZIndex = 15
            local v54 = u11.createFragment
            local v55 = {
                ["PurchasesLeft"] = u11.createElement("TextLabel", v48, { u11.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = u5.isSmallScreen() and 14 or 30
                    }) })
            }
            v47 = v54(v55)
        end
        if v47 then
            v32[v33 + 1] = v47
        end
        return u11.createElement("ImageButton", v28, v32)
    end)
}