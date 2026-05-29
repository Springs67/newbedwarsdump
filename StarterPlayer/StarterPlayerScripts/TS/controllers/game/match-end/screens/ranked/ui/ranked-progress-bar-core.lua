local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.NumberSpinner
local u6 = v2.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").Promise
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["RankedProgressBarCore"] = v9.new(u8)(function(u14, p15) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u5
            [3] = u10
            [4] = u6
            [5] = u13
            [6] = u7
            [7] = u8
            [8] = u4
            [9] = u3
            [10] = u11
        --]]
        local v16 = p15.useState
        local v17 = p15.useEffect
        local u18 = u14.RankChangeData
        local u19, u20 = v16(u12[u18.oldDivision.division])
        local u21 = u14.RankChangeData.matchesPlayed == 5
        local u22 = nil
        local u23 = nil
        local u24 = nil
        local u25 = nil
        local u26 = nil
        local u27 = nil
        local u28 = nil
        v17(function() --[[ Line: 25 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u18
                [3] = u22
                [4] = u23
                [5] = u24
                [6] = u25
                [7] = u26
                [8] = u27
                [9] = u28
                [10] = u5
                [11] = u10
                [12] = u6
                [13] = u13
                [14] = u14
                [15] = u20
                [16] = u12
                [17] = u21
                [18] = u7
            --]]
            local u29 = true
            local u30 = u19
            local u31 = u18.oldDivision.rankPoints
            local u32 = u18.rpDelta
            local u33 = u32 > 0
            local u34 = u32 < 0
            local u35 = u22:getValue()
            local v36 = u23:getValue()
            local u37 = u24:getValue()
            local u38 = u25:getValue()
            local u39 = u26:getValue()
            local u40 = u27:getValue()
            local u41 = u28:getValue()
            local u42 = u5.fromGuiObject(v36)
            u42.Decimals = 0
            u42.Prefix = ""
            u42.Suffix = "/ " .. tostring(100)
            u42.Value = u31
            local function u52(p43, p44, p45) --[[ Line: 48 ]]
                --[[
                Upvalues:
                    [1] = u42
                    [2] = u10
                    [3] = u37
                    [4] = u6
                    [5] = u13
                --]]
                u42.Duration = p43
                u42.Value = p44
                local v46 = u10
                local v47 = u37
                local v48 = TweenInfo.new(p43, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
                local v49 = {}
                local v50 = UDim2.fromScale
                local v51 = p44 / 100
                v49.Size = v50(math.min(v51, 1), 1)
                v46:Create(v47, v48, v49):Play()
                if p45 ~= false then
                    u6:playSound(u13.BATTLE_PASS_PROGRESS_EXP_GAIN)
                end
            end
            local function u71(p53) --[[ Line: 61 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u33
                    [3] = u31
                    [4] = u52
                    [5] = u6
                    [6] = u13
                    [7] = u30
                    [8] = u34
                    [9] = u10
                    [10] = u38
                    [11] = u39
                    [12] = u40
                    [13] = u20
                    [14] = u12
                    [15] = u21
                --]]
                local u54 = u14.RankChangeData.oldDivision.division
                local u55 = false
                local u56 = nil
                if u33 then
                    u31 = 0
                    u52(0.03, u31, false)
                    u6:playSound(u13.PROMOTION_INDICATION)
                    u54 = u30.nextRank
                elseif u34 then
                    u31 = 100
                    u52(0.03, u31, false)
                    u54 = u30.prevRank
                end
                local v57 = u10:Create(u38, TweenInfo.new(0.25), {
                    ["ImageTransparency"] = 1
                })
                local u58 = u10:Create(u39, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    ["ImageTransparency"] = 0.3,
                    ["Size"] = UDim2.fromScale(1.4, 1.4)
                })
                local u59 = u10:Create(u39, TweenInfo.new(50, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
                    ["Rotation"] = 360
                })
                local v60 = u10:Create(u39, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    ["ImageTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1)
                })
                local u61 = u10:Create(u40, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    ["Visible"] = true,
                    ["Position"] = UDim2.fromScale(0.5, 0)
                })
                local u62 = u40:FindFirstChild("PromotionCongratulationsMessage")
                if p53 == "" or not p53 then
                    u62.Text = u33 and "<b>YOU HAVE BEEN PROMOTED</b>" or "<b>YOU HAVE BEEN DEMOTED</b>"
                else
                    u62.Text = p53
                end
                local u63 = u40:FindFirstChild("PromotionRankMessage")
                local v64 = u10:Create(u62, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                    ["TextTransparency"] = 1
                })
                local v65 = u10:Create(u63, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                    ["TextTransparency"] = 1
                })
                local u66 = u10:Create(u38, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                    ["Size"] = UDim2.fromScale(1, 1)
                })
                local u67 = u10:Create(u38, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                    ["ImageTransparency"] = 0
                })
                v57:Play()
                local u68 = v57.Completed:Connect(function() --[[ Line: 117 ]]
                    --[[
                    Upvalues:
                        [1] = u20
                        [2] = u12
                        [3] = u54
                        [4] = u30
                        [5] = u61
                        [6] = u6
                        [7] = u13
                        [8] = u38
                        [9] = u66
                        [10] = u67
                    --]]
                    u20(u12[u54])
                    u30 = u12[u54]
                    u61:Play()
                    u6:playSound(u13.PROMOTION_RANKUP)
                    u38.Size = UDim2.fromScale(1.7, 1.7)
                    u66:Play()
                    u67:Play()
                end)
                local u69 = u67.Completed:Connect(function() --[[ Line: 126 ]]
                    --[[
                    Upvalues:
                        [1] = u55
                        [2] = u34
                        [3] = u58
                        [4] = u59
                        [5] = u56
                        [6] = u6
                        [7] = u13
                    --]]
                    u55 = true
                    if u34 then
                        return nil
                    end
                    u58:Play()
                    u58.Completed:Connect(function() --[[ Line: 132 ]]
                        --[[
                        Upvalues:
                            [1] = u59
                            [2] = u56
                            [3] = u6
                            [4] = u13
                        --]]
                        u59:Play()
                        u56 = u6:playSound(u13.PROMOTION_SHINE_LOOP, {
                            ["looped"] = true
                        })
                    end)
                end)
                while true do
                    local v70 = not u55
                    if v70 then
                        v70 = task.wait()
                    end
                    if v70 == 0 or (v70 ~= v70 or not v70) then
                        if u21 then
                            return nil
                        end
                        task.wait(3)
                        v65:Play()
                        v64:Play()
                        if u56 then
                            u56:Stop()
                            u56:Destroy()
                        end
                        v60:Play()
                        u59:Destroy()
                        v65.Completed:Connect(function() --[[ Line: 166 ]]
                            --[[
                            Upvalues:
                                [1] = u68
                                [2] = u69
                                [3] = u62
                                [4] = u63
                                [5] = u40
                            --]]
                            u68:Disconnect()
                            u69:Disconnect()
                            u62.TextTransparency = 0
                            u63.TextTransparency = 0
                            u40.Visible = false
                            u40.Position = UDim2.fromScale(0.5, 0.5)
                        end)
                        return
                    end
                end
            end
            local u72 = nil
            local u73 = nil
            local function u77() --[[ Line: 181 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u41
                    [3] = u33
                    [4] = u32
                    [5] = u31
                    [6] = u7
                    [7] = u29
                    [8] = u30
                    [9] = u71
                    [10] = u72
                    [11] = u73
                --]]
                local u74 = u5.fromGuiObject(u41)
                u74.Duration = 0
                u74.Decimals = 0
                u74.Prefix = ""
                local v75 = u32
                u74.Suffix = "  " .. (u33 and "+" or "") .. " " .. tostring(v75) .. " RP"
                u74.Value = u31
                u7.defer(function() --[[ Line: 188 ]]
                    --[[
                    Upvalues:
                        [1] = u74
                        [2] = u32
                        [3] = u29
                        [4] = u31
                        [5] = u30
                        [6] = u71
                        [7] = u72
                        [8] = u73
                    --]]
                    task.wait(1)
                    u74.Duration = 2
                    while true do
                        local v76 = u32
                        if v76 ~= 0 and (v76 == v76 and v76) then
                            v76 = u29
                        end
                        if v76 == 0 or (v76 ~= v76 or not v76) then
                            wait(4)
                            u73()
                            return
                        end
                        if u31 + u32 < 0 and not u30.noInstantDemote then
                            u74.Value = 0
                            u32 = u32 - u31
                            u71()
                            u72()
                            return nil
                        end
                        u74.Value = u31 + u32
                        u31 = u31 + u32
                        u32 = 0
                    end
                end)
            end
            u72 = function() --[[ Line: 216 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u32
                    [3] = u29
                    [4] = u30
                    [5] = u33
                    [6] = u31
                    [7] = u52
                    [8] = u71
                    [9] = u77
                    [10] = u73
                --]]
                u7.defer(function() --[[ Line: 217 ]]
                    --[[
                    Upvalues:
                        [1] = u32
                        [2] = u29
                        [3] = u30
                        [4] = u33
                        [5] = u31
                        [6] = u52
                        [7] = u71
                        [8] = u77
                        [9] = u73
                    --]]
                    task.wait(1)
                    while true do
                        local v78 = u32
                        if v78 ~= 0 and (v78 == v78 and v78) then
                            v78 = u29
                            if v78 then
                                v78 = not u30.noRPLimit
                            end
                        end
                        if v78 == 0 or (v78 ~= v78 or not v78) then
                            local v79 = u32
                            if v79 ~= 0 and (v79 == v79 and v79) then
                                v79 = u30.noRPLimit
                            end
                            if v79 ~= 0 and (v79 == v79 and v79) then
                                u31 = 0
                                u77()
                                return nil
                            end
                            wait(4)
                            u73()
                            return
                        end
                        local v80, v81
                        if u33 then
                            v80 = 100 - u31
                            local v82 = u32
                            v81 = math.min(v82, v80)
                        else
                            v80 = -u31
                            local v83 = u32
                            v81 = math.max(v83, v80)
                        end
                        if u29 and v81 ~= 0 then
                            u31 = u31 + v81
                            u32 = u32 - v81
                            u52(0.5, u31)
                            task.wait(0.5)
                        end
                        if u33 and (u31 == 100 or v80 <= u32) then
                            u71()
                        elseif not u33 and u32 < v80 then
                            u71()
                        end
                    end
                end)
            end
            if u21 then
                u7.defer(function() --[[ Line: 261 ]]
                    --[[
                    Upvalues:
                        [1] = u71
                    --]]
                    u71("YOU HAVE PLACED INTO")
                end)
            elseif u30.noRPLimit then
                u77()
            elseif not u30.noRPLimit then
                u72()
            end
            u73 = function() --[[ Line: 269 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u35
                --]]
                u10:Create(u35, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                    ["Transparency"] = 1,
                    ["Position"] = UDim2.fromScale(0.5, 2)
                }):Play()
            end
            return function() --[[ Line: 276 ]]
                --[[
                Upvalues:
                    [1] = u29
                --]]
                u29 = false
            end
        end, {})
        u22 = u8.createRef()
        u25 = u8.createRef()
        u26 = u8.createRef()
        u27 = u8.createRef()
        u23 = u8.createRef()
        u24 = u8.createRef()
        u28 = u8.createRef()
        local v84 = {
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.45),
            ["Size"] = UDim2.fromScale(0.6, 0.6),
            ["BackgroundTransparency"] = 1,
            [u8.Ref] = u22
        }
        local v85 = u14.FrameProps
        local v86, v87, v88, v89, v90
        if v85 then
            v86 = u25
            v87 = u28
            v88 = u26
            v89 = u23
            v90 = u24
            for v91, v92 in v85 do
                v84[v91] = v92
            end
        else
            v86 = u25
            v87 = u28
            v88 = u26
            v89 = u23
            v90 = u24
        end
        local v93 = { (u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.03, 0)
            })) }
        local v94 = u8.createElement
        local v95 = u4
        local v96 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0.57, 0)
        }
        local v97 = {}
        local v98 = u8.createElement(u4, {
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.new(0.6, 0, 0.25, 0),
            [u8.Ref] = u27,
            ["Visible"] = false
        }, {
            u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 0.05)
            }),
            ["PromotionCongratulationsMessage"] = u8.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["Text"] = "<b>YOU HAVE BEEN PROMOTED</b>",
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0.375, 0),
                ["TextColor3"] = u3.WHITE
            }),
            ["PromotionRankMessage"] = u8.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["Font"] = "GothamBold",
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(1, 0, 0.575, 0),
                ["Text"] = "<b>" .. string.upper(u19.name) .. "</b>",
                ["TextColor3"] = u19.color
            })
        })
        local v99 = u8.createElement
        local v100 = u4
        local v101 = {
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 1),
            ["Size"] = UDim2.new(1, 0, 0.75, 0)
        }
        local v102 = {
            ["RankIcon"] = u8.createElement("ImageLabel", {
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = u19.imageSize,
                ["Image"] = u19.image,
                ["BackgroundTransparency"] = 1,
                ["ImageTransparency"] = u21 and 1 or 0,
                ["ScaleType"] = "Fit",
                [u8.Ref] = v86,
                ["ZIndex"] = 2
            }),
            u8.createElement("ImageLabel", {
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.new(1, 0, 1, 0),
                ["Image"] = u11.SHINING_SPINNER,
                ["BackgroundTransparency"] = 1,
                ["ImageTransparency"] = 1,
                ["ImageColor3"] = u19.color,
                ["ScaleType"] = "Fit",
                [u8.Ref] = v88,
                ["ZIndex"] = 1
            })
        }
        __set_list(v97, 1, {v98, v99(v100, v101, v102)})
        v93.TextAndRankImage = v94(v95, v96, v97)
        local v103 = #v93
        local v104 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 0.22, 0),
            ["Visible"] = not u19.noRPLimit or u21
        }
        local v105 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Right",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 8)
            }) }
        local v106 = #v105
        local v107 = {
            ["Size"] = UDim2.new(1, 0, 0.3, 0)
        }
        local v108 = {
            ["CurrentRank"] = u8.createElement("TextLabel", {
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.new(0.5, 0, 1, 0),
                ["Text"] = "<b>" .. u19.name .. "</b>",
                ["TextColor3"] = u3.WHITE
            })
        }
        local v109 = #v108
        local v110
        if u19.nextRank == nil then
            v110 = false
        else
            v110 = u8.createFragment({
                ["NextRank"] = u8.createElement("TextLabel", {
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Right",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["TextTransparency"] = 0.4,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.new(0.5, 0, 1, 0),
                    ["AnchorPoint"] = Vector2.new(1, 0),
                    ["Position"] = UDim2.fromScale(1, 0),
                    ["Text"] = "<b>" .. u12[u19.nextRank].name .. "</b>",
                    ["TextColor3"] = u3.WHITE
                })
            })
        end
        if v110 then
            v108[v109 + 1] = v110
        end
        v105[v106 + 1] = u8.createElement(u4, v107, v108)
        v105.ProgressBarBackground = u8.createElement("Frame", {
            ["BackgroundTransparency"] = 0.3,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.new(1, 0, 0.4, 0),
            ["BackgroundColor3"] = u3.BLACK
        }, {
            ["ProgressBar"] = u8.createElement("Frame", {
                ["Size"] = UDim2.new(u18.oldDivision.rankPoints / 100, 0, 1, 0),
                ["BackgroundColor3"] = u3.WHITE,
                ["BorderSizePixel"] = 0,
                [u8.Ref] = v90
            }, { u8.createElement("UIGradient", {
                    ["Rotation"] = -90,
                    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u19.color), ColorSequenceKeypoint.new(1, u3.brighten(u19.color, 0.5)) })
                }) })
        })
        local v111 = u8.createElement
        local v112 = {
            ["Size"] = UDim2.new(1, 0, 0.3, 0)
        }
        local v113 = u18.oldDivision.rankPoints
        v112.Text = "<b>" .. tostring(v113) .. " / 100</b>"
        v112.TextColor3 = u3.WHITE
        v112.Font = "Roboto"
        v112.TextXAlignment = "Right"
        v112.TextScaled = false
        v112.RichText = true
        v112.BackgroundTransparency = 1
        v112[u8.Ref] = v89
        v105.ProgressNumber = v111("TextLabel", v112)
        v93.ProgressContainer = u8.createElement(u4, v104, v105)
        local v114 = v103 + 1
        local v115 = u8.createElement
        local v116 = u4
        local v117 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.new(1, 0, 0.15, 0),
            ["Visible"] = not u21
        }
        local v118 = { (u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 8)
            })) }
        local v119 = u8.createElement
        local v120 = "TextLabel"
        local v121 = {
            ["Size"] = UDim2.new(1, 0, 0.6, 0)
        }
        local v122
        if u18.demotionShieldActive then
            v122 = "DEMOTION SHIELD ACTIVE"
        else
            local v123 = u18.rpDelta > 0 and "+" or ""
            local v124 = u18.rpDelta
            v122 = "<b>" .. v123 .. " " .. tostring(v124) .. " <font color=\"#ffffff\">RP</font></b>"
        end
        v121.Text = v122
        v121.TextColor3 = u3.hexColor(16773227)
        v121.Font = "Roboto"
        v121.TextScaled = true
        v121.TextSize = 24
        v121.RichText = true
        v121.BackgroundTransparency = 1
        v121.LayoutOrder = 1
        v121.ZIndex = 2
        v121[u8.Ref] = v87
        v118.EloGainedCount = v119(v120, v121)
        v118.MetricDescription = u8.createElement("TextLabel", {
            ["Text"] = "<b>RANK POINTS</b>",
            ["Font"] = "Roboto",
            ["TextTransparency"] = 0.4,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["ZIndex"] = 2,
            ["Size"] = UDim2.new(1, 0, 0.4, 0),
            ["TextColor3"] = u3.WHITE
        })
        v93[v114] = v115(v116, v117, v118)
        return u8.createElement(u4, v84, v93)
    end)
}