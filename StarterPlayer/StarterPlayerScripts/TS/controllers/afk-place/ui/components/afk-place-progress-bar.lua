local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-utils").AfkShopUtils
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u13 = v1.import(script, script.Parent, "progress-bar-ui").ProgressBarUI
return {
    ["AfkPlaceProgressBar"] = v8.new(u7)(function(u14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u11
            [3] = u9
            [4] = u6
            [5] = u4
            [6] = u3
            [7] = u10
            [8] = u5
            [9] = u13
            [10] = u12
        --]]
        local v16 = p15.useState
        local v17 = p15.useEffect
        local _, u19 = v16(function() --[[ Line: 28 ]]
            --[[
            Upvalues:
                [1] = u14
            --]]
            local v18 = u14.AfkStartTime * 900 / 3600
            return math.floor(v18)
        end)
        local _, u20 = v16(u14.AfkCoinStart)
        local _, u21 = v16(u14.BedCoinStart)
        local _, _ = v16(0)
        u7.createRef()
        u7.createRef()
        u7.createRef()
        u7.createRef()
        local v22 = u7.createRef()
        local v23 = u7.createRef()
        local v24 = u7.createRef()
        local v25 = u7.createRef()
        u7.createRef()
        u7.createRef()
        u7.createRef()
        u7.createRef()
        u7.createRef()
        u7.createRef()
        u7.createRef()
        u7.createRef()
        u7.createRef()
        u7.createRef()
        u7.createRef()
        u7.createRef()
        u7.createRef()
        u7.createRef()
        u7.createRef()
        u7.createRef()
        local u26 = 1
        if u14.isVip then
            u26 = u26 + u11.vipMultiplier
        end
        if u14.isPremium then
            u26 = u26 + u11.premiumMultiplier
        end
        v17(function() --[[ Line: 104 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u6
                [3] = u11
                [4] = u19
                [5] = u26
                [6] = u20
                [7] = u21
            --]]
            local u27 = nil
            local u28 = nil
            local u29 = nil
            local u30 = os.time()
            local u31 = os.time() - u14.MountStartTime + u14.AfkStartTime
            local u32 = u6.new()
            local function u40() --[[ Line: 112 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u30
                    [3] = u28
                    [4] = u11
                    [5] = u31
                    [6] = u14
                    [7] = u19
                    [8] = u26
                    [9] = u20
                    [10] = u21
                    [11] = u29
                    [12] = u40
                --]]
                u27 = os.time() - u30
                local v33 = u27 * u11.baseExperiencePerHour / 3600
                u28 = math.floor(v33)
                u31 = os.time() - u14.MountStartTime + u14.AfkStartTime
                local v34 = u19
                local v35 = u31 * u11.baseExperiencePerHour * u26 / 3600
                v34((math.floor(v35)))
                local v36 = u20
                local v37 = u31 * u11.baseAfkCoinsPerHour * u26 / 3600
                v36((math.floor(v37)))
                local v38 = u21
                local v39 = u31 * u11.baseAfkBedCoinsPerHour * u26 / 3600
                v38((math.floor(v39)))
                u29 = task.delay(1, u40)
            end
            u40()
            return function() --[[ Line: 124 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u32
                --]]
                if u29 then
                    task.cancel(u29)
                end
                u32:DoCleaning()
            end
        end, {})
        v17(function() --[[ Line: 132 ]]
            return nil
        end, { u14.ReturnButtonPressed })
        local v41 = {
            ["Size"] = u14.Size or UDim2.fromScale(0.8, 0.6)
        }
        local v42 = u14.LayoutOrder
        v41.LayoutOrder = v42 == nil and 5 or v42
        local v43 = { u7.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["Padding"] = UDim.new(0, u4.isSmallScreen() and 4 or 12)
            }) }
        local _ = #v43
        local v44 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["LayoutOrder"] = 5,
            ["Size"] = UDim2.fromScale(0.75, 0.45),
            ["Position"] = UDim2.fromScale(0, 0.25),
            ["BackgroundColor3"] = Color3.fromRGB(49, 50, 84)
        }
        local v45 = { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }), u7.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Horizontal
            }), u7.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(0.12, 1),
                ["BackgroundColor3"] = u3.WHITE
            }, { u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }), u7.createElement("UIGradient", {
                    ["Rotation"] = 90,
                    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(175, 96, 255)) }),
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.85), NumberSequenceKeypoint.new(1, 0.6) })
                }), u7.createElement("ImageLabel", {
                    ["Size"] = UDim2.fromScale(0.7, 0.7),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["SizeConstraint"] = "RelativeXY",
                    ["ScaleType"] = "Fit",
                    ["Image"] = u10.currencyIcon,
                    [u7.Ref] = v24,
                    ["BackgroundTransparency"] = 1
                }) }) }
        local _ = #v45
        local v46 = {
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.6, 1)
        }
        local v47 = { u7.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0),
                ["PaddingTop"] = UDim.new(0.1, 0),
                ["PaddingBottom"] = UDim.new(0.1, 0)
            }), (u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalFlex"] = Enum.UIFlexAlignment.SpaceEvenly,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            })) }
        local v48 = u7.createElement
        local v49 = u5
        local v50 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.425)
        }
        local v51 = {}
        local v52 = u7.createElement("TextLabel", {
            ["Text"] = u10.currencyName,
            ["Size"] = UDim2.fromScale(0, 1),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Position"] = UDim2.fromScale(0, 0),
            ["FontFace"] = Font.fromName(u11.Theme.font.Name, Enum.FontWeight.Bold),
            ["TextScaled"] = true,
            ["TextColor3"] = u3.WHITE,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["LayoutOrder"] = 0,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            [u7.Ref] = v25
        })
        local v53 = u7.createElement
        local v54 = {}
        local v55 = u11.baseAfkCoinsPerHour
        v54.Text = "(Base: +" .. tostring(v55) .. "/hr)"
        v54.AnchorPoint = Vector2.new(0, 0)
        v54.Size = UDim2.fromScale(0.25, 0.75)
        v54.Position = UDim2.fromScale(0.37, 0.15)
        v54.FontFace = Font.fromName(u11.Theme.font.Name, Enum.FontWeight.Medium)
        v54.BackgroundTransparency = 1
        v54.BorderSizePixel = 0
        v54.AutomaticSize = Enum.AutomaticSize.X
        v54.TextScaled = true
        v54.TextXAlignment = Enum.TextXAlignment.Left
        v54.TextColor3 = Color3.fromRGB(255, 255, 255)
        v54.TextTransparency = 0.5
        v54.LayoutOrder = 1
        v54[u7.Ref] = v25
        __set_list(v51, 1, {v52, v53("TextLabel", v54)})
        v47.CurrencyName = v48(v49, v50, v51)
        local _ = #v47
        local v56 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.35)
        }
        local v57 = {}
        local v58 = u7.createElement("UIListLayout", {
            ["VerticalAlignment"] = "Center",
            ["HorizontalAlignment"] = "Left",
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["FillDirection"] = Enum.FillDirection.Horizontal
        })
        local v59 = u7.createElement
        local v60 = {
            [u7.Ref] = v23
        }
        local v61 = u11.baseAfkCoinsPerHour * u26
        local v62 = math.round(v61)
        v60.Text = "+" .. tostring(v62) .. "/Hour"
        v60.AnchorPoint = Vector2.new(0.5, 0.5)
        v60.Position = UDim2.fromScale(0.5, 0.8)
        v60.Size = UDim2.fromScale(0, 1)
        v60.FontFace = Font.fromName(u11.Theme.font.Name, Enum.FontWeight.Bold)
        v60.BackgroundTransparency = 1
        v60.BorderSizePixel = 0
        v60.AutomaticSize = Enum.AutomaticSize.X
        v60.TextStrokeTransparency = 1
        v60.TextScaled = true
        v60.TextXAlignment = Enum.TextXAlignment.Left
        v60.TextColor3 = u3.WHITE
        v60.TextTransparency = 0.3
        v60.LayoutOrder = 1
        __set_list(v57, 1, {v58, v59("TextLabel", v60)})
        local v63 = #v57
        local v64 = u14.isVip
        if v64 then
            local v65 = u7.createElement
            local v66 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextSize"] = 28,
                ["TextStrokeTransparency"] = 1,
                ["TextTransparency"] = 0.2,
                ["TextScaled"] = true,
                ["SizeConstraint"] = "RelativeYY",
                ["LayoutOrder"] = 2
            }
            local v67 = u11.baseAfkCoinsPerHour * u11.vipMultiplier
            local v68 = math.round(v67)
            v66.Text = "(+" .. tostring(v68) .. " VIP)"
            v66.Size = UDim2.fromScale(0, 0.75)
            v66.FontFace = Font.fromName(u11.Theme.font.Name, Enum.FontWeight.Regular)
            v66.AutomaticSize = Enum.AutomaticSize.X
            v66.TextXAlignment = Enum.TextXAlignment.Left
            v66.TextYAlignment = Enum.TextYAlignment.Bottom
            v66.TextColor3 = Color3.fromRGB(48, 255, 8)
            v64 = v65("TextLabel", v66)
        end
        if v64 then
            v57[v63 + 1] = v64
        end
        local v69 = #v57
        local v70 = u14.isPremium
        if v70 then
            local v71 = u7.createElement
            local v72 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextSize"] = 28,
                ["TextStrokeTransparency"] = 1,
                ["TextTransparency"] = 0.2,
                ["TextScaled"] = true,
                ["SizeConstraint"] = "RelativeYY",
                ["LayoutOrder"] = 2
            }
            local v73 = u11.baseAfkCoinsPerHour * u11.vipMultiplier
            local v74 = math.round(v73)
            v72.Text = "(+" .. tostring(v74) .. " Roblox Premium)"
            v72.Size = UDim2.fromScale(0, 0.75)
            v72.FontFace = Font.fromName(u11.Theme.font.Name, Enum.FontWeight.Regular)
            v72.AutomaticSize = Enum.AutomaticSize.X
            v72.TextXAlignment = Enum.TextXAlignment.Left
            v72.TextYAlignment = Enum.TextYAlignment.Bottom
            v72.TextColor3 = Color3.fromRGB(255, 247, 100)
            v70 = v71("TextLabel", v72)
        end
        if v70 then
            v57[v69 + 1] = v70
        end
        v47.ActualRate = u7.createElement("Frame", v56, v57)
        v45.MiddleComponent = u7.createElement("Frame", v46, v47)
        v45.AfkAmountPill = u7.createElement("Frame", {
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.28, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundColor3"] = u3.BLACK,
            ["BackgroundTransparency"] = 0.55,
            ["BorderSizePixel"] = 0,
            [u7.Ref] = v22,
            ["LayoutOrder"] = 2
        }, { u7.createElement(u13, {
                ["startTime"] = u14.AfkStartTime,
                ["mountStartTime"] = u14.MountStartTime,
                ["multiplier"] = u26,
                ["image"] = u10.currencyIcon,
                ["rate"] = u11.baseAfkCoinsPerHour,
                ["isVip"] = u14.isVip,
                ["isPremium"] = u14.isPremium,
                ["startAmount"] = u14.AfkCoinStart
            }) })
        v43.AfkCurrencyContainer = u7.createElement("Frame", v44, v45)
        local v75 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["LayoutOrder"] = 5,
            ["Size"] = UDim2.fromScale(0.75, 0.45),
            ["Position"] = UDim2.fromScale(0, 0.25),
            ["BackgroundColor3"] = Color3.fromRGB(49, 50, 84)
        }
        local v76 = { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }), u7.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Horizontal
            }), u7.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(0.12, 1),
                ["BackgroundColor3"] = u3.WHITE
            }, { u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }), u7.createElement("UIGradient", {
                    ["Rotation"] = 90,
                    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 104)) }),
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.85), NumberSequenceKeypoint.new(1, 0.6) })
                }), u7.createElement("ImageLabel", {
                    ["Size"] = UDim2.fromScale(0.6, 0.6),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["SizeConstraint"] = "RelativeXY",
                    ["ScaleType"] = "Fit",
                    ["Image"] = u12.BED_COIN_ICON,
                    [u7.Ref] = v24,
                    ["BackgroundTransparency"] = 1
                }) }) }
        local _ = #v76
        local v77 = {
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.6, 1)
        }
        local v78 = { u7.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0),
                ["PaddingTop"] = UDim.new(0.1, 0),
                ["PaddingBottom"] = UDim.new(0.1, 0)
            }), (u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalFlex"] = Enum.UIFlexAlignment.SpaceEvenly,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            })) }
        local v79 = u7.createElement
        local v80 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.425)
        }
        local v81 = {}
        local v82 = u7.createElement("TextLabel", {
            ["Text"] = "Bed Coins",
            ["TextScaled"] = true,
            ["LayoutOrder"] = 0,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0, 1),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Position"] = UDim2.fromScale(0, 0),
            ["FontFace"] = Font.fromName(u11.Theme.font.Name, Enum.FontWeight.Bold),
            ["TextColor3"] = u3.WHITE,
            ["TextXAlignment"] = Enum.TextXAlignment.Left
        })
        local v83 = u7.createElement
        local v84 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true,
            ["TextTransparency"] = 0.5,
            ["LayoutOrder"] = 1
        }
        local v85 = u11.baseAfkBedCoinsPerHour
        v84.Text = "(Base: +" .. tostring(v85) .. "/hr)"
        v84.AnchorPoint = Vector2.new(0, 0)
        v84.Size = UDim2.fromScale(0.25, 0.75)
        v84.FontFace = Font.fromName(u11.Theme.font.Name, Enum.FontWeight.Medium)
        v84.AutomaticSize = Enum.AutomaticSize.X
        v84.TextXAlignment = Enum.TextXAlignment.Left
        v84.TextColor3 = Color3.fromRGB(255, 255, 255)
        v84.Position = UDim2.fromScale(0.37, 0.15)
        __set_list(v81, 1, {v82, v83("TextLabel", v84)})
        v78.BedcoinCurrencyName = v79("Frame", v80, v81)
        local _ = #v78
        local v86 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.35)
        }
        local v87 = {}
        local v88 = u7.createElement("UIListLayout", {
            ["VerticalAlignment"] = "Center",
            ["HorizontalAlignment"] = "Left",
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["FillDirection"] = Enum.FillDirection.Horizontal
        })
        local v89 = u7.createElement
        local v90 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextStrokeTransparency"] = 1,
            ["TextScaled"] = true,
            ["TextTransparency"] = 0.3,
            ["LayoutOrder"] = 1
        }
        local v91 = u11.baseAfkBedCoinsPerHour * u26
        local v92 = math.round(v91)
        v90.Text = "+" .. tostring(v92) .. "/Hour"
        v90.AnchorPoint = Vector2.new(0.5, 0.5)
        v90.Position = UDim2.fromScale(0.5, 0.8)
        v90.Size = UDim2.fromScale(0, 1)
        v90.FontFace = Font.fromName(u11.Theme.font.Name, Enum.FontWeight.Bold)
        v90.AutomaticSize = Enum.AutomaticSize.X
        v90.TextXAlignment = Enum.TextXAlignment.Left
        v90.TextColor3 = u3.WHITE
        __set_list(v87, 1, {v88, v89("TextLabel", v90)})
        local v93 = #v87
        local v94 = u14.isVip
        if v94 then
            local v95 = u7.createElement
            local v96 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextSize"] = 28,
                ["TextStrokeTransparency"] = 1,
                ["TextTransparency"] = 0.2,
                ["TextScaled"] = true,
                ["SizeConstraint"] = "RelativeYY",
                ["LayoutOrder"] = 2
            }
            local v97 = u11.baseAfkBedCoinsPerHour * u11.vipMultiplier
            local v98 = math.round(v97)
            v96.Text = "(+" .. tostring(v98) .. " VIP)"
            v96.Size = UDim2.fromScale(0, 0.75)
            v96.FontFace = Font.fromName(u11.Theme.font.Name, Enum.FontWeight.Regular)
            v96.AutomaticSize = Enum.AutomaticSize.X
            v96.TextXAlignment = Enum.TextXAlignment.Left
            v96.TextYAlignment = Enum.TextYAlignment.Bottom
            v96.TextColor3 = Color3.fromRGB(48, 255, 8)
            v94 = v95("TextLabel", v96)
        end
        if v94 then
            v87[v93 + 1] = v94
        end
        local v99 = #v87
        local v100 = u14.isPremium
        if v100 then
            local v101 = u7.createElement
            local v102 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextSize"] = 28,
                ["TextStrokeTransparency"] = 1,
                ["TextTransparency"] = 0.2,
                ["TextScaled"] = true,
                ["SizeConstraint"] = "RelativeYY",
                ["LayoutOrder"] = 2
            }
            local v103 = u11.baseAfkBedCoinsPerHour * u11.vipMultiplier
            local v104 = math.round(v103)
            v102.Text = "(+" .. tostring(v104) .. " Roblox Premium)"
            v102.Size = UDim2.fromScale(0, 0.75)
            v102.FontFace = Font.fromName(u11.Theme.font.Name, Enum.FontWeight.Regular)
            v102.AutomaticSize = Enum.AutomaticSize.X
            v102.TextXAlignment = Enum.TextXAlignment.Left
            v102.TextYAlignment = Enum.TextYAlignment.Bottom
            v102.TextColor3 = Color3.fromRGB(255, 247, 100)
            v100 = v101("TextLabel", v102)
        end
        if v100 then
            v87[v99 + 1] = v100
        end
        v78.BedcoinActualRate = u7.createElement("Frame", v86, v87)
        v76.BedcoinMiddleComponent = u7.createElement("Frame", v77, v78)
        v76.BedCoinAmountPill = u7.createElement("Frame", {
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.28, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundColor3"] = u3.BLACK,
            ["BackgroundTransparency"] = 0.55,
            ["BorderSizePixel"] = 0,
            [u7.Ref] = v22,
            ["LayoutOrder"] = 2
        }, { u7.createElement(u13, {
                ["startTime"] = u14.AfkStartTime,
                ["mountStartTime"] = u14.MountStartTime,
                ["multiplier"] = u26,
                ["image"] = u12.BED_COIN_ICON,
                ["rate"] = u11.baseAfkBedCoinsPerHour,
                ["isVip"] = u14.isVip,
                ["isPremium"] = u14.isPremium,
                ["startAmount"] = u14.BedCoinStart
            }) })
        v43.AfkBedcoinContainer = u7.createElement("Frame", v75, v76)
        return u7.createFragment({
            ["ProgressBarContainer"] = u7.createElement(u5, v41, v43)
        })
    end)
}