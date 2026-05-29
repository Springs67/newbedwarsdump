local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.ColorUtil
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.Padding
local u9 = v3.PlayerViewport
local u10 = v3.StringUtil
local u11 = v3.UIUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.TweenService
local u16 = v14.UserInputService
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-item-meta").AfkShopItemMeta
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-utils")
local u19 = v18.AfkShopUtils
local u20 = v18.getItemColorRarity
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item-tier-meta").EventShopItemTierMeta
return {
    ["AfkShopItemTile"] = v13.new(u12)(function(u22, p23) --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u21
            [3] = u20
            [4] = u12
            [5] = u15
            [6] = u5
            [7] = u16
            [8] = u11
            [9] = u6
            [10] = u2
            [11] = u9
            [12] = u7
            [13] = u8
            [14] = u19
            [15] = u4
            [16] = u10
        --]]
        local v24 = p23.useState
        local v25 = p23.useEffect
        local u26, u27 = v24(false)
        local u28 = u17[u22.Item]
        local v29
        if u28.tier then
            v29 = u21[u28.tier].color
        else
            v29 = u20(u28.price)
        end
        local u30 = u12.createRef()
        local u31 = u12.createRef()
        local v32 = u22.MaxPurchases == (1 / 0)
        v25(function() --[[ Line: 33 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u31
                [3] = u26
                [4] = u15
                [5] = u5
                [6] = u28
            --]]
            local v33 = u30:getValue()
            local v34 = u31:getValue()
            if v33 and v34 then
                if u26 then
                    u15:Create(v33, TweenInfo.new(0.3), {
                        ["Size"] = v33.Size - UDim2.fromScale(0.05, 0.05)
                    }):Play()
                    u15:Create(v34, TweenInfo.new(0.4), {
                        ["BackgroundColor3"] = u5.darken(Color3.fromHex("#6B6EB5"), 0.8)
                    }):Play()
                else
                    u15:Create(v33, TweenInfo.new(0.3), {
                        ["Size"] = UDim2.new(u28.textImage == nil and 0.65 or 0.8, 0, 0.65, 0)
                    }):Play()
                    u15:Create(v34, TweenInfo.new(0.4), {
                        ["BackgroundColor3"] = Color3.fromHex("#6B6EB5")
                    }):Play()
                end
            else
                return nil
            end
        end, { u26 })
        v25(function() --[[ Line: 61 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u11
                [3] = u31
            --]]
            if u16.GamepadEnabled then
                u11:selectGui(u31:getValue())
            end
        end, {})
        local v35 = not u22.SoldOut
        if v35 then
            if u22.MaxPurchases > 1 then
                v35 = not v32
            else
                v35 = false
            end
        end
        if v35 then
            local v36 = {
                ["AnchorPoint"] = Vector2.new(0, 0),
                ["Position"] = UDim2.fromScale(0.06, 0.04),
                ["Size"] = UDim2.new(1, 0, 0.07, 0)
            }
            local v37 = u22.MaxPurchases
            local v38 = u22.TimesPurchased
            local v39 = v37 - (v38 == nil and 0 or v38)
            local v40 = tostring(v39)
            local v41 = u22.MaxPurchases
            v36.Text = "<b>" .. v40 .. "/" .. tostring(v41) .. " Left</b>"
            v36.Font = Enum.Font.Roboto
            v36.RichText = true
            v36.TextScaled = true
            v36.TextXAlignment = Enum.TextXAlignment.Left
            v36.BackgroundTransparency = 1
            v36.BorderSizePixel = 0
            v36.TextTransparency = 0.3
            v36.TextColor3 = u5.WHITE
            local v42 = u12.createFragment
            local v43 = {
                ["PurchasesLeft"] = u12.createElement("TextLabel", v36, { u12.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = u6.isSmallScreen() and 14 or 30
                    }) })
            }
            v35 = v42(v43)
        end
        local v44 = {
            [u12.Event.Activated] = function() --[[ Line: 96 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u28
                    [3] = u2
                --]]
                if u22.SoldOut then
                    return nil
                end
                if u28.comingSoon then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        ["message"] = "Can\'t purchase at this time. Coming Soon"
                    })
                    return nil
                end
                u22.PromptPurchase(u22.Item)
            end,
            [u12.Event.MouseEnter] = function() --[[ Line: 108 ]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                u27(true)
            end,
            [u12.Event.MouseLeave] = function() --[[ Line: 111 ]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                u27(false)
            end,
            ["BackgroundColor3"] = Color3.fromHex("#6B6EB5"),
            ["AutoButtonColor"] = false,
            ["Selectable"] = true,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = u28.tier and 1 or u22.LayoutOrder,
            [u12.Ref] = u31
        }
        local v45 = {
            u12.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }),
            ["GradientGlow"] = u12.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 1)
            }, { u12.createElement("UIGradient", {
                    ["Rotation"] = 90,
                    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u5.BLACK), ColorSequenceKeypoint.new(1, v29) }),
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.65) })
                }) })
        }
        local v46 = #v45
        if v35 then
            v45[v46 + 1] = v35
        end
        local _ = #v45
        local v47 = {
            ["Size"] = UDim2.new(u28.textImage == nil and 0.65 or 0.8, 0, 0.65, 0),
            ["Position"] = UDim2.fromScale(0.5, 0.325),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            [u12.Ref] = u30
        }
        local v48 = {}
        local v49 = #v48
        local v50 = u28.comingSoon
        if v50 then
            v50 = u12.createFragment({
                ["ItemTextImage"] = u12.createElement("TextLabel", {
                    ["Text"] = "COMING SOON...",
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.new(1, 0, 1, 0),
                    ["Font"] = Enum.Font.LuckiestGuy,
                    ["TextColor3"] = u5.WHITE
                }, { u12.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = u6.isSmallScreen() and 14 or 30
                    }) })
            })
        end
        if v50 then
            v48[v49 + 1] = v50
        end
        local v51 = #v48
        local v52
        if u28.image == nil then
            v52 = false
        else
            v52 = u12.createFragment({
                ["ItemImage"] = u12.createElement("ImageLabel", {
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Image"] = u28.image,
                    ["Size"] = UDim2.new(1, 0, 1, 0)
                })
            })
        end
        if v52 then
            v48[v51 + 1] = v52
        end
        local v53 = #v48
        local v54
        if u28.textImage == nil then
            v54 = false
        else
            v54 = u12.createFragment({
                ["ItemTextImage"] = u12.createElement("TextLabel", {
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.new(1, 0, 1, 0),
                    ["Text"] = u28.textImage,
                    ["Font"] = Enum.Font.LuckiestGuy,
                    ["TextColor3"] = u5.WHITE
                }, { u12.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = u6.isSmallScreen() and 14 or 30
                    }) })
            })
        end
        if v54 then
            v48[v53 + 1] = v54
        end
        local v55 = #v48
        local v56
        if u28.animation == nil then
            v56 = false
        else
            v56 = u12.createFragment({
                ["RewardShowcase"] = u12.createElement(u9, {
                    ["ImageTransparency"] = 0,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Animation"] = u28.animation,
                    ["Size"] = UDim2.new(1, 0, 1, 0),
                    ["LayoutOrder"] = u22.LayoutOrder
                })
            })
        end
        if v56 then
            v48[v55 + 1] = v56
        end
        v45.ItemFrame = u12.createElement(u7, v47, v48)
        local v57 = u12.createElement
        local v58 = u7
        local v59 = {
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v60 = {
            u12.createElement(u8, {
                ["Padding"] = {
                    ["Horizontal"] = 6,
                    ["Vertical"] = 14
                }
            }),
            u12.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Bottom",
                ["HorizontalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 0.1)
            }),
            ["Name"] = u12.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 2,
                ["Size"] = UDim2.new(1, 0, 0, 30),
                ["Text"] = "<b>" .. string.upper(u28.name) .. "</b>",
                ["TextColor3"] = v29,
                ["Font"] = Enum.Font.Roboto
            }, { u12.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 20
                }) })
        }
        local v61
        if u22.SoldOut then
            v61 = u12.createElement(u4, {
                ["Text"] = "PURCHASED",
                ["TextSize"] = 12,
                ["ZIndex"] = 2,
                ["LayoutOrder"] = 2,
                ["Font"] = Enum.Font.SourceSansBold,
                ["TextColor3"] = u5.WHITE,
                ["Limits"] = Vector2.new(100, 24),
                ["TextYAlignment"] = Enum.TextYAlignment.Top
            })
        else
            local v62 = u12.createFragment
            local v63 = {}
            local v64 = u12.createElement
            local v65 = {
                ["AutomaticSize"] = "X",
                ["BackgroundTransparency"] = 0.6,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(0, 0, 0, 20),
                ["BackgroundColor3"] = v29
            }
            local v66 = {
                u12.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }),
                u12.createElement(u8, {
                    ["Padding"] = {
                        ["Vertical"] = 4,
                        ["Horizontal"] = 6
                    }
                }),
                u12.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["HorizontalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 6)
                }),
                ["CurrencyIcon"] = u12.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = -1,
                    ["ZIndex"] = 2,
                    ["Size"] = UDim2.new(1, 0, 1, 0),
                    ["Image"] = u19.currencyIcon
                })
            }
            local v67 = u12.createElement
            local v68 = u4
            local v69 = {
                ["TextSize"] = 11,
                ["ZIndex"] = 2,
                ["LayoutOrder"] = 2
            }
            local v70 = u10.formatNumberWithCommas
            local v71 = u10.roundNumber
            local v72 = u28.price
            v69.Text = v70((tonumber(v71(v72, 0))))
            v69.Font = Enum.Font.SourceSansBold
            v69.TextColor3 = u5.WHITE
            v69.Limits = Vector2.new(100, 12)
            v69.TextYAlignment = Enum.TextYAlignment.Center
            __set_list(v66, 4, {v67(v68, v69)})
            v63.CostContainer = v64("Frame", v65, v66)
            v61 = v62(v63)
        end
        __set_list(v60, 3, {v61})
        v45.Content = v57(v58, v59, v60)
        v45.BottomBorder = u12.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 3,
            ["Size"] = UDim2.fromScale(1, 0.02),
            ["Position"] = UDim2.fromScale(0, 1),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["BackgroundColor3"] = v29
        }, { u12.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }) })
        return u12.createElement("ImageButton", v44, v45)
    end)
}