local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.ColorUtil
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.Padding
local u9 = v3.StringUtil
local u10 = v3.UIUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.ReplicatedStorage
local u15 = v13.TweenService
local u16 = v13.UserInputService
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "misc", "player-viewport").PlayerViewport
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-showcase").RewardShowcase
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-currency", "event-currency-metadata").EventCurrencyMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item-meta").EventShopItemMeta
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item-tier-meta").EventShopItemTierMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
return {
    ["EventShopItemTile"] = v12.new(u11)(function(u25, p26) --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u24
            [3] = u19
            [4] = u20
            [5] = u22
            [6] = u23
            [7] = u11
            [8] = u15
            [9] = u5
            [10] = u16
            [11] = u10
            [12] = u2
            [13] = u6
            [14] = u18
            [15] = u14
            [16] = u17
            [17] = u7
            [18] = u8
            [19] = u4
            [20] = u9
        --]]
        local v27 = p26.useState
        local v28 = p26.useEffect
        local u29, u30 = v27(false)
        local u31 = u21[u25.Item]
        local v32 = nil
        local v33 = u31.animation
        if v33 ~= "" and v33 then
            local v34 = nil
            for v35, v36 in u31.items do
                local _ = v35 - 1
                if v36.emote ~= nil == true then
                    v34 = v36
                    break
                end
            end
            if v34 ~= nil then
                v34 = v34.emote
            end
            if v34 == nil then
                v34 = nil
            end
            if v34 then
                v32 = u24[v34]
            end
        end
        local v37 = u19[u31.currency or u20[u25.EventType].currencies[1]]
        local v38
        if u31.tier then
            v38 = u22[u31.tier].color
        else
            v38 = u23.getItemColorRarity(u31.price)
        end
        local u39 = u11.createRef()
        local u40 = u11.createRef()
        v28(function() --[[ Line: 65 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u40
                [3] = u29
                [4] = u15
                [5] = u5
                [6] = u31
            --]]
            local v41 = u39:getValue()
            local v42 = u40:getValue()
            if v41 and v42 then
                if u29 then
                    u15:Create(v41, TweenInfo.new(0.3), {
                        ["Size"] = v41.Size - UDim2.fromScale(0.05, 0.05)
                    }):Play()
                    u15:Create(v42, TweenInfo.new(0.4), {
                        ["BackgroundColor3"] = u5.darken(Color3.fromHex("#6B6EB5"), 0.8)
                    }):Play()
                else
                    u15:Create(v41, TweenInfo.new(0.3), {
                        ["Size"] = UDim2.new(u31.textImage == nil and 0.65 or 0.8, 0, 0.65, 0)
                    }):Play()
                    u15:Create(v42, TweenInfo.new(0.4), {
                        ["BackgroundColor3"] = Color3.fromHex("#6B6EB5")
                    }):Play()
                end
            else
                return nil
            end
        end, { u29 })
        v28(function() --[[ Line: 93 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u10
                [3] = u40
            --]]
            if u16.GamepadEnabled then
                u10:selectGui(u40:getValue())
            end
        end, {})
        local v43 = {
            [u11.Event.Activated] = function() --[[ Line: 99 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u31
                    [3] = u2
                --]]
                if u25.SoldOut then
                    return nil
                end
                if u31.comingSoon then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        ["message"] = "Can\'t purchase at this time. Coming Soon"
                    })
                    return nil
                end
                u25.PromptPurchase(u25.Item)
            end,
            [u11.Event.MouseEnter] = function() --[[ Line: 111 ]]
                --[[
                Upvalues:
                    [1] = u30
                --]]
                u30(true)
            end,
            [u11.Event.MouseLeave] = function() --[[ Line: 114 ]]
                --[[
                Upvalues:
                    [1] = u30
                --]]
                u30(false)
            end,
            ["BackgroundColor3"] = Color3.fromHex("#6B6EB5"),
            ["AutoButtonColor"] = false,
            ["Selectable"] = true,
            ["BorderSizePixel"] = 0
        }
        local v44
        if u31.tier then
            v44 = 1
        else
            local v45 = u25.LayoutOrder
            v44 = (v45 == nil and 0 or v45) + 2
        end
        v43.LayoutOrder = v44
        v43[u11.Ref] = u40
        local v46 = not u25.SoldOut
        if v46 then
            v46 = u25.MaxPurchases > 1
        end
        if v46 then
            local v47 = {
                ["AnchorPoint"] = Vector2.new(0, 0),
                ["Position"] = UDim2.fromScale(0.06, 0.04),
                ["Size"] = UDim2.new(1, 0, 0.07, 0)
            }
            local v48 = u25.MaxPurchases
            local v49 = u25.TimesPurchased
            local v50 = v48 - (v49 == nil and 0 or v49)
            local v51 = tostring(v50)
            local v52 = u25.MaxPurchases
            v47.Text = "<b>" .. v51 .. "/" .. tostring(v52) .. " Left</b>"
            v47.Font = Enum.Font.Roboto
            v47.RichText = true
            v47.TextScaled = true
            v47.TextXAlignment = Enum.TextXAlignment.Left
            v47.BackgroundTransparency = 1
            v47.BorderSizePixel = 0
            v47.TextTransparency = 0.3
            v47.TextColor3 = u5.WHITE
            local v53 = u11.createFragment
            local v54 = {
                ["PurchasesLeft"] = u11.createElement("TextLabel", v47, { u11.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = u6.isSmallScreen() and 14 or 30
                    }) })
            }
            v46 = v53(v54)
        end
        local v55 = {
            u11.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }),
            ["GradientGlow"] = u11.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 1)
            }, { u11.createElement("UIGradient", {
                    ["Rotation"] = 90,
                    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u5.BLACK), ColorSequenceKeypoint.new(1, v38) }),
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.65) })
                }) })
        }
        local v56 = #v55
        if v46 then
            v55[v56 + 1] = v46
        end
        local _ = #v55
        local v57 = {
            ["Size"] = UDim2.new(u31.textImage == nil and 0.65 or 0.8, 0, 0.65, 0),
            ["Position"] = UDim2.fromScale(0.5, 0.325),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            [u11.Ref] = u39
        }
        local v58 = {}
        local v59 = #v58
        local v60 = u31.comingSoon
        if v60 then
            v60 = u11.createFragment({
                ["ItemTextImage"] = u11.createElement("TextLabel", {
                    ["Text"] = "COMING SOON...",
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.new(1, 0, 1, 0),
                    ["Font"] = Enum.Font.LuckiestGuy,
                    ["TextColor3"] = u5.WHITE
                }, { u11.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = u6.isSmallScreen() and 14 or 30
                    }) })
            })
        end
        if v60 then
            v58[v59 + 1] = v60
        end
        local v61 = #v58
        local v62
        if u31.image == nil then
            v62 = false
        else
            v62 = u11.createFragment({
                ["ItemImage"] = u11.createElement("ImageLabel", {
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Image"] = u31.image,
                    ["Size"] = UDim2.new(1, 0, 1, 0)
                })
            })
        end
        if v62 then
            v58[v61 + 1] = v62
        end
        local v63 = #v58
        local v64
        if u31.textImage == nil then
            v64 = false
        else
            v64 = u11.createFragment({
                ["ItemTextImage"] = u11.createElement("TextLabel", {
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.new(1, 0, 1, 0),
                    ["Text"] = u31.textImage,
                    ["Font"] = Enum.Font.LuckiestGuy,
                    ["TextColor3"] = u5.WHITE
                }, { u11.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = u6.isSmallScreen() and 14 or 30
                    }) })
            })
        end
        if v64 then
            v58[v63 + 1] = v64
        end
        local v65 = #v58
        local v66 = u31.image
        if v66 == "" then
            v66 = false
        end
        local v67 = not v66
        if v67 then
            local v68 = u31.textImage
            if v68 == "" then
                v68 = false
            end
            v67 = not v68
            if v67 then
                v67 = u31.items[1]
                if v67 then
                    v67 = u11.createElement(u18, {
                        ["Reward"] = u31.items[1]
                    })
                end
            end
        end
        if v67 then
            v58[v65 + 1] = v67
        end
        local v69 = #v58
        local v70 = u31.animation ~= nil
        if v70 then
            local v71 = {
                ["ImageTransparency"] = 0,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Animation"] = u31.animation,
                ["Size"] = UDim2.new(1, 0, 1, 0),
                ["LayoutOrder"] = u25.LayoutOrder
            }
            local v72
            if v32 == nil then
                v72 = v32
            else
                v72 = v32.animation
                if v72 ~= nil then
                    v72 = v72.previewItems
                end
            end
            v71.PreviewItemTypes = v72
            if v32 ~= nil then
                v32 = v32.animation
                if v32 ~= nil then
                    local v73 = v32.previewReplicatedStorageAssets
                    if v73 == nil then
                        v32 = v73
                    else
                        local function v81(p74) --[[ Line: 283 ]]
                            --[[
                            Upvalues:
                                [1] = u14
                            --]]
                            local v75 = string.split(p74, "/")
                            local v76 = u14.Assets
                            local v77 = v76
                            for v78, v79 in v75 do
                                local _ = v78 - 1
                                if v77 ~= nil then
                                    local v80 = v77:FindFirstChild(v79)
                                end
                                if v80 then
                                    v76 = v80
                                    v77 = v76
                                end
                            end
                            return v77
                        end
                        local v82 = 0
                        v32 = {}
                        for v83, v84 in v73 do
                            local v85 = v81(v84, v83 - 1, v73)
                            if v85 ~= nil then
                                v82 = v82 + 1
                                v32[v82] = v85
                            end
                        end
                    end
                end
            end
            v71.PreviewAccessories = v32
            v70 = u11.createFragment({
                ["RewardShowcase"] = u11.createElement(u17, v71)
            })
        end
        if v70 then
            v58[v69 + 1] = v70
        end
        v55.ItemFrame = u11.createElement(u7, v57, v58)
        local v86 = u11.createElement
        local v87 = u7
        local v88 = {
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v89 = {
            u11.createElement(u8, {
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
                ["Text"] = "<b>" .. string.upper(u31.name) .. "</b>",
                ["TextColor3"] = v38,
                ["Font"] = Enum.Font.Roboto
            }, { u11.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 20
                }) })
        }
        local v90
        if u25.SoldOut then
            v90 = u11.createElement(u4, {
                ["Text"] = "PURCHASED",
                ["TextSize"] = 12,
                ["ZIndex"] = 2,
                ["LayoutOrder"] = 2,
                ["Font"] = Enum.Font.SourceSansBold,
                ["TextColor3"] = u5.WHITE,
                ["Limits"] = Vector2.new(100, 12),
                ["TextYAlignment"] = Enum.TextYAlignment.Top
            })
        else
            local v91 = u11.createFragment
            local v92 = {}
            local v93 = u11.createElement
            local v94 = {
                ["AutomaticSize"] = "X",
                ["BackgroundTransparency"] = 0.6,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(0, 0, 0, 20),
                ["BackgroundColor3"] = v38
            }
            local v95 = {
                u11.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }),
                u11.createElement(u8, {
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
                    ["Padding"] = UDim.new(0, 3)
                }),
                ["CurrencyIcon"] = u11.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = -1,
                    ["ZIndex"] = 2,
                    ["Size"] = UDim2.new(1.2, 0, 1.2, 0),
                    ["Image"] = v37.icon
                })
            }
            local v96 = u11.createElement
            local v97 = u4
            local v98 = {
                ["TextSize"] = 11,
                ["ZIndex"] = 2,
                ["LayoutOrder"] = 2
            }
            local v99 = u9.formatNumberWithCommas
            local v100 = u9.roundNumber
            local v101 = u31.price
            v98.Text = v99((tonumber(v100(v101, 0))))
            v98.Font = Enum.Font.SourceSansBold
            v98.TextColor3 = u5.WHITE
            v98.Limits = Vector2.new(100, 12)
            v98.TextYAlignment = Enum.TextYAlignment.Center
            __set_list(v95, 4, {v96(v97, v98)})
            v92.CostContainer = v93("Frame", v94, v95)
            v90 = v91(v92)
        end
        __set_list(v89, 3, {v90})
        v55.Content = v86(v87, v88, v89)
        v55.BottomBorder = u11.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 3,
            ["Size"] = UDim2.fromScale(1, 0.02),
            ["Position"] = UDim2.fromScale(0, 1),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["BackgroundColor3"] = v38
        }, { u11.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }) })
        return u11.createElement("ImageButton", v43, v55)
    end)
}