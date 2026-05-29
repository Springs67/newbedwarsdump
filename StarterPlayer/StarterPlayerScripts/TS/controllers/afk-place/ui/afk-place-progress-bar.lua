local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.TweenService
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-utils").AfkShopUtils
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u15 = v1.import(script, script.Parent, "components", "progress-bar-ui").ProgressBarUI
return {
    ["AfkPlaceProgressBar"] = v5.new(u4)(function(u16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u4
            [3] = u13
            [4] = u10
            [5] = u7
            [6] = u8
            [7] = u3
            [8] = u2
            [9] = u14
            [10] = u9
            [11] = u15
            [12] = u12
        --]]
        local v18 = p17.useState
        local v19 = p17.useEffect
        local _, u20 = v18(0)
        local _, u21 = v18(0)
        local _, _ = v18(0.0001)
        v19(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u11
                [3] = u20
                [4] = u21
            --]]
            if u16.BattlePassDto then
                local v22 = u11
                local v23 = u16.BattlePassDto
                if v23 ~= nil then
                    v23 = v23.experience
                end
                u20(v22.getLevelFromExperience(v23))
                local v24 = u11
                local v25 = u16.BattlePassDto
                if v25 ~= nil then
                    v25 = v25.experience
                end
                local v26 = u11
                local v27 = u16.BattlePassDto
                if v27 ~= nil then
                    v27 = v27.experience
                end
                u21(v24.getCurrExperienceProgression(v25, v26.getLevelFromExperience(v27)))
            end
        end, { u16.BattlePassDto })
        local _, u29 = v18(function() --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            local v28 = u16.AfkStartTime * 900 / 3600
            return math.floor(v28)
        end)
        local _, u30 = v18(u16.AfkCoinStart)
        local _, u31 = v18(u16.BedCoinStart)
        local _, _ = v18(0)
        local u32 = u4.createRef()
        local u33 = u4.createRef()
        local u34 = u4.createRef()
        local u35 = u4.createRef()
        local u36 = u4.createRef()
        local u37 = u4.createRef()
        local u38 = u4.createRef()
        local u39 = u4.createRef()
        local u40 = u4.createRef()
        local u41 = u4.createRef()
        local u42 = u4.createRef()
        local u43 = u4.createRef()
        local u44 = u4.createRef()
        local u45 = u4.createRef()
        local u46 = u4.createRef()
        u4.createRef()
        local u47 = u4.createRef()
        local u48 = u4.createRef()
        local u49 = u4.createRef()
        local u50 = u4.createRef()
        local u51 = u4.createRef()
        local u52 = u4.createRef()
        local u53 = u4.createRef()
        local u54 = u4.createRef()
        local v55 = nil
        local v56 = nil
        local u57 = 1
        os.time()
        if v55 == nil then
            v55 = u13.Client:Get("IsVip"):CallServer()
        end
        if v55 then
            u57 = u57 + u10.vipMultiplier
        end
        if u7.LocalPlayer.MembershipType == Enum.MembershipType.Premium then
            u57 = u57 + u10.premiumMultiplier
            v56 = true
        end
        local function u59(p58) --[[ Line: 89 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u10
            --]]
            if p58 == nil then
                return nil
            end
            u8:Create(p58, TweenInfo.new(u10.Tween.textTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["ImageTransparency"] = 1
            }):Play()
        end
        local function u61(p60) --[[ Line: 108 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u10
            --]]
            if p60 == nil then
                return nil
            end
            u8:Create(p60, TweenInfo.new(u10.Tween.textTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["TextTransparency"] = 1,
                ["TextStrokeTransparency"] = 1
            }):Play()
        end
        local function u63(p62) --[[ Line: 118 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u10
            --]]
            if p62 == nil then
                return nil
            end
            u8:Create(p62, TweenInfo.new(u10.Tween.textTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["BackgroundTransparency"] = 1
            }):Play()
        end
        v19(function() --[[ Line: 127 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u3
                [3] = u10
                [4] = u29
                [5] = u57
                [6] = u30
                [7] = u31
            --]]
            local u64 = nil
            local u65 = nil
            local u66 = nil
            local u67 = os.time()
            local u68 = os.time() - u16.MountStartTime + u16.AfkStartTime
            local u69 = u3.new()
            local function u77() --[[ Line: 135 ]]
                --[[
                Upvalues:
                    [1] = u64
                    [2] = u67
                    [3] = u65
                    [4] = u10
                    [5] = u68
                    [6] = u16
                    [7] = u29
                    [8] = u57
                    [9] = u30
                    [10] = u31
                    [11] = u66
                    [12] = u77
                --]]
                u64 = os.time() - u67
                local v70 = u64 * u10.baseExperiencePerHour / 3600
                u65 = math.floor(v70)
                u68 = os.time() - u16.MountStartTime + u16.AfkStartTime
                local v71 = u29
                local v72 = u68 * u10.baseExperiencePerHour * u57 / 3600
                v71((math.floor(v72)))
                local v73 = u30
                local v74 = u68 * u10.baseAfkCoinsPerHour * u57 / 3600
                v73((math.floor(v74)))
                local v75 = u31
                local v76 = u68 * u10.baseAfkBedCoinsPerHour * u57 / 3600
                v75((math.floor(v76)))
                u66 = task.delay(1, u77)
            end
            u77()
            return function() --[[ Line: 147 ]]
                --[[
                Upvalues:
                    [1] = u66
                    [2] = u69
                --]]
                if u66 then
                    task.cancel(u66)
                end
                u69:DoCleaning()
            end
        end, {})
        v19(function() --[[ Line: 155 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u33
                [3] = u45
                [4] = u46
                [5] = u36
                [6] = u37
                [7] = u38
                [8] = u40
                [9] = u39
                [10] = u42
                [11] = u41
                [12] = u43
                [13] = u44
                [14] = u47
                [15] = u48
                [16] = u49
                [17] = u52
                [18] = u50
                [19] = u53
                [20] = u54
                [21] = u51
                [22] = u35
                [23] = u34
                [24] = u16
                [25] = u61
                [26] = u63
                [27] = u59
            --]]
            local v78 = u32:getValue()
            local v79 = u33:getValue()
            local v80 = u45:getValue()
            local v81 = u46:getValue()
            local v82 = u36:getValue()
            local v83 = u37:getValue()
            local v84 = u38:getValue()
            local v85 = u40:getValue()
            local v86 = u39:getValue()
            local v87 = u42:getValue()
            local v88 = u41:getValue()
            local v89 = u43:getValue()
            local v90 = u44:getValue()
            local v91 = u47:getValue()
            local v92 = u48:getValue()
            local v93 = u49:getValue()
            local v94 = u52:getValue()
            local v95 = u50:getValue()
            local v96 = u53:getValue()
            local v97 = u54:getValue()
            local v98 = u51:getValue()
            local v99 = u35:getValue()
            local v100 = u34:getValue()
            if u16.ReturnButtonPressed then
                u61(v99)
                u61(v100)
                u63(v80)
                u63(v81)
                u63(v82)
                u61(v83)
                u59(v84)
                u61(v85)
                u61(v86)
                u63(v88)
                u61(v87)
                u59(v89)
                u61(v90)
                u63(v78)
                u63(v79)
                u63(v91)
                u61(v92)
                u61(v93)
                u61(v95)
                u61(v98)
                u63(v94)
                u63(v96)
                u63(v97)
            end
            return function() --[[ Line: 204 ]] end
        end, { u16.ReturnButtonPressed })
        local v101 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 5,
            ["Size"] = UDim2.fromScale(0.6, 0.3),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["BackgroundColor3"] = u2.WHITE,
            ["Position"] = UDim2.fromScale(0.5, 0.4),
            ["AnchorPoint"] = Vector2.new(0.5, 0)
        }
        local v102 = { u4.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Vertical
            }) }
        local _ = #v102
        local v103 = {
            [u4.Ref] = u47,
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(0.5, 0),
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundTransparency"] = 1,
            ["BackgroundColor3"] = u14.backgroundPrimary,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1
        }
        local v104 = { u4.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }) }
        local _ = #v104
        local v105 = {
            [u4.Ref] = u47,
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(0.5, 0),
            ["Size"] = UDim2.fromScale(1, 0.6),
            ["BackgroundTransparency"] = 1,
            ["BackgroundColor3"] = u14.backgroundPrimary,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 5
        }
        local v106 = { u4.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["Padding"] = UDim.new(0, 6)
            }) }
        local _ = #v106
        local v107 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["LayoutOrder"] = 5,
            ["Size"] = UDim2.fromScale(0.5, 0.6),
            ["Position"] = UDim2.fromScale(0, 0.25),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["BackgroundColor3"] = Color3.fromRGB(58, 54, 112)
        }
        local v108 = { u4.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }), u4.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Horizontal
            }), u4.createElement("ImageLabel", {
                ["Size"] = UDim2.fromScale(0.12, 1),
                ["SizeConstraint"] = "RelativeXY",
                ["ScaleType"] = "Fit",
                ["Image"] = u9.currencyIcon,
                ["BackgroundTransparency"] = 0.7,
                ["BackgroundColor3"] = u2.BLACK,
                [u4.Ref] = u38,
                ["LayoutOrder"] = 0
            }) }
        local _ = #v108
        local v109 = {
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.6, 1)
        }
        local v110 = {
            u4.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Vertical
            }),
            ["CurrencyName"] = u4.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.5)
            }, { u4.createElement("TextLabel", {
                    ["Text"] = u9.currencyName,
                    ["AnchorPoint"] = Vector2.new(0, 0),
                    ["Size"] = UDim2.fromScale(0.25, 0.75),
                    ["FontFace"] = Font.fromName("GothamBold", Enum.FontWeight.Bold),
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["AutomaticSize"] = Enum.AutomaticSize.X,
                    ["Font"] = u10.Theme.font,
                    ["TextStrokeTransparency"] = 1,
                    ["TextSize"] = 42,
                    ["TextScaled"] = true,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["TextColor3"] = u2.WHITE,
                    [u4.Ref] = u39,
                    ["LayoutOrder"] = 0,
                    ["Position"] = UDim2.fromScale(0.05, 0)
                }), u4.createElement("TextLabel", {
                    ["Text"] = "(Base + 1000/hr)",
                    ["AnchorPoint"] = Vector2.new(0, 0),
                    ["Size"] = UDim2.fromScale(0.25, 0.5),
                    ["FontFace"] = Font.fromName("GothamBold", Enum.FontWeight.Thin),
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["AutomaticSize"] = Enum.AutomaticSize.X,
                    ["Font"] = u10.Theme.font,
                    ["TextStrokeTransparency"] = 1,
                    ["TextSize"] = 42,
                    ["TextScaled"] = true,
                    ["TextXAlignment"] = Enum.TextXAlignment.Right,
                    ["TextColor3"] = Color3.fromRGB(120, 120, 120),
                    [u4.Ref] = u39,
                    ["LayoutOrder"] = 1,
                    ["Position"] = UDim2.fromScale(0.37, 0.15)
                }) })
        }
        local _ = #v110
        local v111 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.5)
        }
        local v112 = {}
        local v113 = u4.createElement("UIListLayout", {
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["FillDirection"] = Enum.FillDirection.Horizontal
        })
        local v114 = u4.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.05, 1)
        })
        local v115 = u4.createElement
        local v116 = {
            [u4.Ref] = u37
        }
        local v117 = u10.baseAfkCoinsPerHour * u57
        local v118 = math.round(v117)
        v116.Text = "+" .. tostring(v118) .. "/Hour"
        v116.AnchorPoint = Vector2.new(0.5, 0.5)
        v116.Position = UDim2.fromScale(0.5, 0.8)
        v116.Size = UDim2.fromScale(0.3, 0.5)
        v116.FontFace = Font.fromName("GothamBold", Enum.FontWeight.Regular)
        v116.BackgroundTransparency = 1
        v116.BorderSizePixel = 0
        v116.AutomaticSize = Enum.AutomaticSize.X
        v116.TextSize = 28
        v116.TextStrokeTransparency = 1
        v116.TextTransparency = 0.2
        v116.TextScaled = true
        v116.TextXAlignment = Enum.TextXAlignment.Center
        v116.TextColor3 = u2.WHITE
        v116.SizeConstraint = "RelativeYY"
        v116.LayoutOrder = 1
        __set_list(v112, 1, {v113, v114, v115("TextLabel", v116)})
        local v119 = #v112
        local v120
        if v55 then
            local v121 = u4.createElement
            local v122 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextSize"] = 28,
                ["TextStrokeTransparency"] = 1,
                ["TextTransparency"] = 0.2,
                ["TextScaled"] = true,
                ["SizeConstraint"] = "RelativeYY",
                ["LayoutOrder"] = 2
            }
            local v123 = u10.baseAfkCoinsPerHour * u10.vipMultiplier
            local v124 = math.round(v123)
            v122.Text = "(+" .. tostring(v124) .. " VIP)"
            v122.AnchorPoint = Vector2.new(0.5, 0.5)
            v122.Position = UDim2.fromScale(0.5, 0.8)
            v122.Size = UDim2.fromScale(0.3, 0.5)
            v122.FontFace = Font.fromName("GothamBold", Enum.FontWeight.Regular)
            v122.AutomaticSize = Enum.AutomaticSize.X
            v122.TextXAlignment = Enum.TextXAlignment.Center
            v122.TextColor3 = Color3.fromRGB(48, 255, 8)
            v120 = v121("TextLabel", v122)
        else
            v120 = v55
        end
        if v120 then
            v112[v119 + 1] = v120
        end
        local v125 = #v112
        local v126
        if v56 then
            local v127 = u4.createElement
            local v128 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextSize"] = 28,
                ["TextStrokeTransparency"] = 1,
                ["TextTransparency"] = 0.2,
                ["TextScaled"] = true,
                ["SizeConstraint"] = "RelativeYY",
                ["LayoutOrder"] = 2
            }
            local v129 = u10.baseAfkCoinsPerHour * u10.vipMultiplier
            local v130 = math.round(v129)
            v128.Text = "(+" .. tostring(v130) .. " Roblox Premium)"
            v128.AnchorPoint = Vector2.new(0.5, 0.5)
            v128.Position = UDim2.fromScale(0.5, 0.8)
            v128.Size = UDim2.fromScale(0.3, 0.5)
            v128.FontFace = Font.fromName("GothamBold", Enum.FontWeight.Regular)
            v128.AutomaticSize = Enum.AutomaticSize.X
            v128.TextXAlignment = Enum.TextXAlignment.Center
            v128.TextColor3 = Color3.fromRGB(230, 255, 8)
            v126 = v127("TextLabel", v128)
        else
            v126 = v56
        end
        if v126 then
            v112[v125 + 1] = v126
        end
        v110.ActualRate = u4.createElement("Frame", v111, v112)
        v108.MiddleComponent = u4.createElement("Frame", v109, v110)
        v108.AfkAmountPill = u4.createElement("Frame", {
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.28, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundColor3"] = u2.BLACK,
            ["BackgroundTransparency"] = 0.55,
            ["BorderSizePixel"] = 0,
            [u4.Ref] = u36,
            ["LayoutOrder"] = 2
        }, { u4.createElement(u15, {
                ["isVip"] = false,
                ["isPremium"] = false,
                ["startTime"] = u16.AfkStartTime,
                ["mountStartTime"] = u16.MountStartTime,
                ["multiplier"] = u57,
                ["image"] = u9.currencyIcon,
                ["rate"] = u10.baseAfkCoinsPerHour,
                ["startAmount"] = u16.AfkCoinStart
            }) })
        v106.AfkCurrencyContainer = u4.createElement("Frame", v107, v108)
        local v131 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["LayoutOrder"] = 5,
            ["Size"] = UDim2.fromScale(0.5, 0.6),
            ["Position"] = UDim2.fromScale(0, 0.25),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["BackgroundColor3"] = Color3.fromRGB(58, 54, 112)
        }
        local v132 = { u4.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }), u4.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Horizontal
            }), u4.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeXY",
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 0.7,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(0.12, 1),
                ["Image"] = u12.BED_COIN_ICON,
                ["BackgroundColor3"] = u2.BLACK
            }) }
        local _ = #v132
        local v133 = {
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.6, 1)
        }
        local v134 = { (u4.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Vertical
            })) }
        local v135 = u4.createElement
        local v136 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.5)
        }
        local v137 = {}
        local v138 = u4.createElement("TextLabel", {
            ["Text"] = "Bed Coins",
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextStrokeTransparency"] = 1,
            ["TextSize"] = 42,
            ["TextScaled"] = true,
            ["LayoutOrder"] = 0,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Size"] = UDim2.fromScale(0.25, 0.75),
            ["FontFace"] = Font.fromName("GothamBold", Enum.FontWeight.Bold),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["Font"] = u10.Theme.font,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = u2.WHITE,
            ["Position"] = UDim2.fromScale(0.05, 0)
        })
        local v139 = u4.createElement
        local v140 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextStrokeTransparency"] = 1,
            ["TextSize"] = 42,
            ["TextScaled"] = true,
            ["LayoutOrder"] = 1
        }
        local v141 = u10.baseAfkBedCoinsPerHour
        v140.Text = "(Base + " .. tostring(v141) .. "/hr)"
        v140.AnchorPoint = Vector2.new(0, 0)
        v140.Size = UDim2.fromScale(0.25, 0.5)
        v140.FontFace = Font.fromName("GothamBold", Enum.FontWeight.Thin)
        v140.AutomaticSize = Enum.AutomaticSize.X
        v140.Font = u10.Theme.font
        v140.TextXAlignment = Enum.TextXAlignment.Right
        v140.TextColor3 = Color3.fromRGB(120, 120, 120)
        v140.Position = UDim2.fromScale(0.37, 0.15)
        __set_list(v137, 1, {v138, v139("TextLabel", v140)})
        v134.BedcoinCurrencyName = v135("Frame", v136, v137)
        local _ = #v134
        local v142 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.5)
        }
        local v143 = {}
        local v144 = u4.createElement("UIListLayout", {
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["FillDirection"] = Enum.FillDirection.Horizontal
        })
        local v145 = u4.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.05, 1)
        })
        local v146 = u4.createElement
        local v147 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextSize"] = 28,
            ["TextStrokeTransparency"] = 1,
            ["TextTransparency"] = 0.2,
            ["TextScaled"] = true,
            ["SizeConstraint"] = "RelativeYY",
            ["LayoutOrder"] = 1
        }
        local v148 = u10.baseAfkBedCoinsPerHour * u57
        local v149 = math.round(v148)
        v147.Text = "+" .. tostring(v149) .. "/Hour"
        v147.AnchorPoint = Vector2.new(0.5, 0.5)
        v147.Position = UDim2.fromScale(0.5, 0.8)
        v147.Size = UDim2.fromScale(0.3, 0.5)
        v147.FontFace = Font.fromName("GothamBold", Enum.FontWeight.Regular)
        v147.AutomaticSize = Enum.AutomaticSize.X
        v147.TextXAlignment = Enum.TextXAlignment.Center
        v147.TextColor3 = u2.WHITE
        __set_list(v143, 1, {v144, v145, v146("TextLabel", v147)})
        local v150 = #v143
        local v151
        if v55 then
            local v152 = u4.createElement
            local v153 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextSize"] = 28,
                ["TextStrokeTransparency"] = 1,
                ["TextTransparency"] = 0.2,
                ["TextScaled"] = true,
                ["SizeConstraint"] = "RelativeYY",
                ["LayoutOrder"] = 2
            }
            local v154 = u10.baseAfkBedCoinsPerHour * u10.vipMultiplier
            local v155 = math.round(v154)
            v153.Text = "(+" .. tostring(v155) .. " VIP)"
            v153.AnchorPoint = Vector2.new(0.5, 0.5)
            v153.Position = UDim2.fromScale(0.5, 0.8)
            v153.Size = UDim2.fromScale(0.3, 0.5)
            v153.FontFace = Font.fromName("GothamBold", Enum.FontWeight.Regular)
            v153.AutomaticSize = Enum.AutomaticSize.X
            v153.TextXAlignment = Enum.TextXAlignment.Center
            v153.TextColor3 = Color3.fromRGB(48, 255, 8)
            v151 = v152("TextLabel", v153)
        else
            v151 = v55
        end
        if v151 then
            v143[v150 + 1] = v151
        end
        local v156 = #v143
        local v157
        if v56 then
            local v158 = u4.createElement
            local v159 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextSize"] = 28,
                ["TextStrokeTransparency"] = 1,
                ["TextTransparency"] = 0.2,
                ["TextScaled"] = true,
                ["SizeConstraint"] = "RelativeYY",
                ["LayoutOrder"] = 2
            }
            local v160 = u10.baseAfkBedCoinsPerHour * u10.vipMultiplier
            local v161 = math.round(v160)
            v159.Text = "(+" .. tostring(v161) .. " Roblox Premium)"
            v159.AnchorPoint = Vector2.new(0.5, 0.5)
            v159.Position = UDim2.fromScale(0.5, 0.8)
            v159.Size = UDim2.fromScale(0.3, 0.5)
            v159.FontFace = Font.fromName("GothamBold", Enum.FontWeight.Regular)
            v159.AutomaticSize = Enum.AutomaticSize.X
            v159.TextXAlignment = Enum.TextXAlignment.Center
            v159.TextColor3 = Color3.fromRGB(230, 255, 8)
            v157 = v158("TextLabel", v159)
        else
            v157 = v56
        end
        if v157 then
            v143[v156 + 1] = v157
        end
        v134.BedcoinActualRate = u4.createElement("Frame", v142, v143)
        v132.BedcoinMiddleComponent = u4.createElement("Frame", v133, v134)
        local v162 = {
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.28, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundColor3"] = u2.BLACK,
            ["BackgroundTransparency"] = 0.55,
            ["BorderSizePixel"] = 0,
            [u4.Ref] = u36,
            ["LayoutOrder"] = 2
        }
        local v163 = {}
        local v164 = #v163
        local v165 = {
            ["startTime"] = u16.AfkStartTime,
            ["mountStartTime"] = u16.MountStartTime,
            ["multiplier"] = u57,
            ["image"] = u12.BED_COIN_ICON,
            ["rate"] = u10.baseAfkBedCoinsPerHour,
            ["startAmount"] = u16.BedCoinStart,
            ["isVip"] = v55
        }
        if v56 == nil then
            v56 = false
        end
        v165.isPremium = v56
        v163[v164 + 1] = u4.createElement(u15, v165)
        v132.BedCoinAmountPill = u4.createElement("Frame", v162, v163)
        v106.AfkBedcoinContainer = u4.createElement("Frame", v131, v132)
        v104.UpperFrame = u4.createElement("Frame", v105, v106)
        v102.BattlepassProgress = u4.createElement("Frame", v103, v104)
        v102.BattlePassTopHalfBackground = u4.createElement("Frame", {
            [u4.Ref] = u52,
            ["Size"] = UDim2.fromScale(1, 0.15),
            ["BackgroundTransparency"] = 1,
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 0,
            ["BackgroundColor3"] = u2.BLACK,
            ["Position"] = UDim2.fromScale(0.5, 0),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["ZIndex"] = 2
        }, { u4.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }), u4.createElement("TextLabel", {
                [u4.Ref] = u50,
                ["Size"] = UDim2.fromScale(1, 0.8),
                ["FontFace"] = Font.fromName("GothamBold", Enum.FontWeight.Bold),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Text"] = "Rewards",
                ["TextColor3"] = u2.WHITE,
                ["TextScaled"] = true,
                ["TextSize"] = 25,
                ["TextStrokeTransparency"] = 1,
                ["BackgroundTransparency"] = 1,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["LayoutOrder"] = 7,
                ["ZIndex"] = 3
            }) })
        return u4.createFragment({
            ["ProgressBarContainer"] = u4.createElement("Frame", v101, v102)
        })
    end)
}