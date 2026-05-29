local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ButtonComponent
local u5 = v2.ColorUtil
local u6 = v2.DeviceUtil
local u7 = v2.Empty
local u8 = v2.Padding
local u9 = v2.SoundManager
local u10 = v2.StringUtil
local u11 = v2.TooltipContainer
local u12 = v2.UIUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-showcase").RewardShowcase
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-currency", "event-currency-metadata").EventCurrencyMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventCurrencyType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["EventMissionsCard"] = v15.new(u14)(function(u24, p25) --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u10
            [3] = u6
            [4] = u13
            [5] = u9
            [6] = u22
            [7] = u18
            [8] = u21
            [9] = u20
            [10] = u16
            [11] = u12
            [12] = u5
            [13] = u8
            [14] = u7
            [15] = u19
            [16] = u3
            [17] = u11
            [18] = u17
            [19] = u23
            [20] = u4
        --]]
        local _ = p25.useState
        local v26 = p25.useEffect
        local v27 = u24.Progress >= u24.Stage.progress
        local u28 = u14.createRef()
        local u29 = u14.createRef()
        local v30 = false
        local v31 = ""
        local v32 = u24.Mission.reward
        if v32 ~= nil then
            local v33 = v32.rewards
            if v33 ~= nil then
                for v34, v35 in v33 do
                    local _ = v34 - 1
                    if v35.globalTeamCurrency then
                        local v36 = true
                        local v37 = u10.formatNumberWithCommas
                        local v38 = u10.roundNumber
                        local v39 = v35.globalTeamCurrency.amount
                        local v40 = v37((tonumber(v38(v39, 0))))
                        v30 = v36
                        v31 = v40
                    end
                end
            end
        end
        local function u51(_, _, _) --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u13
                [3] = u24
                [4] = u9
                [5] = u22
                [6] = u28
                [7] = u29
                [8] = u18
                [9] = u21
                [10] = u20
            --]]
            if not u6.isHoarceKat() then
                if not u13.Controllers.EventMissionsController:claimMission(u24.Mission, u24.EventType) then
                    return nil
                end
                u9:playSound(u22.UI_REWARD)
            end
            if u28:getValue() and (u29:getValue() and (u24.Mission.reward and u6.isHoarceKat())) then
                local v41 = u18
                local v42 = {}
                local v43 = {}
                local v44 = {
                    ["type"] = "SetEventPartial"
                }
                for v45, v46 in u21.makeStarterEventData() do
                    v42[v45] = v46
                end
                local v47 = {}
                local v48 = u20.DOUBLOONS
                local v49 = {}
                local v50 = u18:getState().Event.profileData.currencies[u20.DOUBLOONS]
                if v50 ~= nil then
                    v50 = v50.currAmount
                end
                v49.currAmount = (v50 == nil and 0 or v50) + 300
                v49.amountEarned = 0
                v49.amountSpent = 0
                v47[v48] = v49
                v42.currencies = v47
                v43.profileData = v42
                v44.data = v43
                v41:dispatch(v44)
            end
        end
        v26(function() --[[ Line: 106 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u12
                [3] = u28
            --]]
            if u16.GamepadEnabled then
                u12:selectGui(u28:getValue())
            end
        end, {})
        local v52 = u10.formatNumberWithCommas
        local v53 = u10.roundNumber
        local v54 = u24.Mission.rewardAmount
        local v55 = v52((tonumber(v53(v54, 0))))
        local v56 = {
            ["Size"] = UDim2.new(0.98, 0, 0, 80),
            ["BackgroundColor3"] = Color3.fromHex("#6B6EB5"),
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = u24.LayoutOrder,
            [u14.Ref] = u29
        }
        local v57 = { (u14.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            })) }
        local v58 = u14.createElement
        local v59 = "Frame"
        local v60 = {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v61 = {}
        local v62 = u14.createElement
        local v63 = "UIGradient"
        local v64 = {
            ["Rotation"] = 180
        }
        local v65 = ColorSequence.new
        local v66 = {}
        local v67 = ColorSequenceKeypoint.new(0, u5.BLACK)
        local v68 = ColorSequenceKeypoint.new
        local v69 = 1
        local v70
        if v27 or u24.Claimed then
            v70 = Color3.fromHex("#FFDF38")
        else
            v70 = Color3.fromHex("#3894FF")
        end
        __set_list(v66, 1, {v67, v68(v69, v70)})
        v64.Color = v65(v66)
        v64.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.4) })
        __set_list(v61, 1, {v62(v63, v64)})
        v57.GradientGlow = v58(v59, v60, v61)
        local _ = #v57
        local v71 = {
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v72 = { (u14.createElement(u8, {
                ["Padding"] = {
                    ["Top"] = 10,
                    ["Bottom"] = 20,
                    ["Left"] = 14,
                    ["Right"] = 14
                }
            })) }
        local v73 = u14.createElement
        local v74 = u7
        local v75 = {
            ["LayoutOrder"] = 1,
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(0.5, 1)
        }
        local v76 = {
            u14.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.15, 0)
            }),
            ["MissionTask"] = u14.createElement("TextLabel", {
                ["TextXAlignment"] = "Left",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.5),
                ["Text"] = "<b>" .. u24.Mission.name .. "</b>",
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            }, { u14.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) })
        }
        local v77 = u14.createElement
        local v78 = "TextLabel"
        local v79 = {
            ["TextXAlignment"] = "Left",
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.3)
        }
        local v80
        if v27 or u24.Claimed then
            v80 = "<b><font transparency=\".3\">Completed</font></b>"
        else
            local v81 = u10.roundNumber(u24.Progress, 1)
            local v82 = u24.Mission.stages[1].progress
            v80 = "<b><font transparency=\".3\">Progress:</font> (" .. v81 .. " / <font transparency=\".3\">" .. tostring(v82) .. "</font>)</b>"
        end
        v79.Text = v80
        v79.TextColor3 = Color3.fromRGB(255, 255, 255)
        v76.Progress = v77(v78, v79)
        v72.MissionInfoContainer = v73(v74, v75, v76)
        local _ = #v72
        local v83 = u24.Mission.currencyReward
        if v83 then
            local v84 = {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.5),
                ["AnchorPoint"] = Vector2.new(1, 0.5)
            }
            local v85 = {}
            local v86 = #v85
            local v87 = {
                ["SizeConstraint"] = "RelativeYY",
                ["Size"] = UDim2.new(1, 0, 0.9, 0)
            }
            local v88 = u24.Mission.reward
            if v88 ~= nil then
                v88 = v88.icon
            end
            local v89
            if v88 == "" or not v88 then
                v89 = not u24.Mission.currencyReward and "" or u19[u24.Mission.currencyReward].icon
            else
                v89 = u24.Mission.reward
                if v89 ~= nil then
                    v89 = v89.icon
                end
            end
            v87.Image = v89
            v87.ScaleType = "Fit"
            v87.BackgroundTransparency = 1
            v87.LayoutOrder = -1
            v87.ZIndex = 2
            v87.Position = UDim2.new(0.5, 0, 0.5, 0)
            v87.AnchorPoint = Vector2.new(0.5, 0.5)
            local v90 = { u14.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }
            local v91 = #v90
            local v92 = {}
            local v93 = #v92
            local v94 = {}
            local v95 = u24.Mission.reward
            if v95 ~= nil then
                v95 = v95.name
            end
            local v96
            if v95 == "" or not v95 then
                v96 = not u24.Mission.currencyReward and "" or u19[u24.Mission.currencyReward].name
            else
                v96 = u24.Mission.reward
                if v96 ~= nil then
                    v96 = v96.name
                end
            end
            v94.Text = v96
            v94.Font = Enum.Font.SourceSansBold
            v94.TextSize = 16
            v94.Limits = Vector2.new(300, 60)
            v92[v93 + 1] = u14.createElement(u3, v94)
            v90[v91 + 1] = u14.createElement(u11, {}, v92)
            v85.CurrencyIcon = u14.createElement("ImageLabel", v87, v90)
            local v97 = v86 + 1
            local v98 = u14.createElement
            local v99 = u3
            local v100 = {
                ["TextSize"] = 15,
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 2,
                ["LayoutOrder"] = 2,
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Position"] = UDim2.fromScale(1, 0.5)
            }
            local v101
            if v30 then
                v101 = v31
            else
                v101 = v55 == "0" and "" or v55
            end
            v100.Text = v101
            v100.Font = Enum.Font.SourceSansBold
            v100.TextColor3 = u5.WHITE
            v100.TextYAlignment = Enum.TextYAlignment.Top
            v100.TextXAlignment = Enum.TextXAlignment.Left
            v85[v97] = v98(v99, v100)
            v83 = u14.createFragment({
                ["CurrencyContainer"] = u14.createElement(u7, v84, v85)
            })
        end
        local v102 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.2, 1.4),
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.fromScale(0.7749999999999999, 0.5)
        }
        local v103 = { u14.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v104 = #v103
        if v83 then
            v103[v104 + 1] = v83
        end
        local v105 = #v103
        local v106 = u24.Mission.reward
        if v106 then
            local v107 = u24.Mission.reward
            if v107 ~= nil then
                local v108 = v107.rewards
                if v108 == nil then
                    v107 = v108
                else
                    local function v115(p109) --[[ Line: 297 ]]
                        --[[
                        Upvalues:
                            [1] = u24
                            [2] = u14
                            [3] = u17
                        --]]
                        local v110 = {}
                        local v111 = UDim2
                        local v112 = u24.Mission.reward
                        if v112 ~= nil then
                            local v113 = v112.rewards
                            v112 = v113 ~= nil and #v113 or v113
                        end
                        local v114 = v112 == nil and 1 or v112
                        v110.Size = v111.fromScale(1 / v114, 1)
                        v110.Reward = p109
                        return u14.createElement(u17, v110)
                    end
                    v107 = table.create(#v108)
                    for v116, v117 in v108 do
                        v107[v116] = v115(v117, v116 - 1, v108)
                    end
                end
            end
            local v118 = {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.5),
                ["AnchorPoint"] = Vector2.new(1, 0.5)
            }
            local v119 = { u14.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["VerticalAlignment"] = "Center",
                    ["HorizontalAlignment"] = "Right",
                    ["Padding"] = UDim.new(0, 3)
                }) }
            local v120 = #v119
            if v107 then
                for v121, v122 in v107 do
                    v119[v120 + v121] = v122
                end
            end
            local v123 = #v119
            local v124 = u24.Mission.reward
            if v124 ~= nil then
                v124 = v124.icon
            end
            local v125 = v124 ~= nil
            if v125 then
                local v126 = {}
                local v127 = #v126
                local v128 = {
                    ["SizeConstraint"] = "RelativeYY",
                    ["Size"] = UDim2.new(1, 0, 0.8, 0)
                }
                local v129 = u24.Mission.reward
                if v129 ~= nil then
                    v129 = v129.icon
                end
                v128.Image = v129
                v128.ScaleType = "Fit"
                v128.BackgroundTransparency = 1
                v128.LayoutOrder = -1
                v128.ZIndex = 2
                v128.Position = UDim2.new(0.5, 0, 0.5, 0)
                v128.AnchorPoint = Vector2.new(0.5, 0.5)
                local v130 = {}
                local v131 = #v130
                local v132 = {}
                local v133 = #v132
                local v134 = {}
                local v135 = u24.Mission.reward
                if v135 ~= nil then
                    v135 = v135.name
                end
                v134.Text = v135 == nil and "" or v135
                v134.Font = Enum.Font.SourceSansBold
                v134.TextSize = 16
                v134.Limits = Vector2.new(300, 60)
                v132[v133 + 1] = u14.createElement(u3, v134)
                v130[v131 + 1] = u14.createElement(u11, {}, v132)
                v126.Icon = u14.createFragment({
                    ["Icon"] = u14.createElement("ImageLabel", v128, v130)
                })
                local v136 = v127 + 1
                local v137 = u14.createElement
                local v138 = u3
                local v139 = {
                    ["TextSize"] = 15,
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 2,
                    ["LayoutOrder"] = 2,
                    ["AnchorPoint"] = Vector2.new(1, 0.5),
                    ["Position"] = UDim2.fromScale(1, 0.5)
                }
                if not v30 then
                    v31 = v55 == "0" and "" or v55
                end
                v139.Text = v31
                v139.Font = Enum.Font.SourceSansBold
                v139.TextColor3 = u5.WHITE
                v139.TextYAlignment = Enum.TextYAlignment.Top
                v139.TextXAlignment = Enum.TextXAlignment.Left
                v126[v136] = v137(v138, v139)
                v125 = u14.createFragment(v126)
            end
            if v125 then
                v119[v123 + 1] = v125
            end
            v106 = u14.createFragment({
                ["RewardsContainer"] = u14.createElement(u7, v118, v119)
            })
        end
        if v106 then
            v103[v105 + 1] = v106
        end
        v72.RewardContainer = u14.createElement(u7, v102, v103)
        local v140 = {
            ["Size"] = UDim2.fromScale(0.175, 0.8),
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.fromScale(1, 0.5),
            ["Text"] = v27 and not u24.Claimed and "CLAIM REWARD" or (u24.Claimed and "CLAIMED" or u10.formatPercentage(u24.Progress, u24.Stage.progress, 1) .. " COMPLETE")
        }
        local v141
        if v27 and not u24.Claimed then
            v141 = u23.backgroundSuccess
        else
            v141 = Color3.fromHex("#525585")
        end
        v140.BackgroundColor3 = v141
        function v140.OnClick(p142, p143) --[[ Line: 421 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u18
                [3] = u51
            --]]
            local v144
            if u24.Mission.currencyReward then
                v144 = {}
                local v145 = u18:getState().Event.currencyGuiLocations[u24.Mission.currencyReward]
                if v145 == nil then
                    v145 = Vector2.new(0, 0)
                end
                v144.endPos = v145
            else
                v144 = nil
            end
            u51(p142, p143, v144)
        end
        local v146
        if u24.Claimed then
            v146 = Color3.fromHex("#FFDF38")
        else
            v146 = u5.WHITE
        end
        v140.TextColor3 = v146
        v140.BackgroundTransparency = u24.Claimed and 1 or 0
        v140.Disabled = not v27 or u24.Claimed
        v140.LayoutOrder = 3
        v140.Selectable = true
        v140[u14.Ref] = u28
        local v147 = {}
        local v148 = #v147
        local v149 = v27 and not u24.Claimed
        if v149 then
            v149 = u14.createFragment({
                ["CompletedButtonStroke"] = u14.createElement("Frame", {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1)
                }, { u14.createElement("UICorner"), u14.createElement("UIStroke", {
                        ["Thickness"] = 2,
                        ["Color"] = u5.WHITE
                    }, { u14.createElement("UIGradient", {
                            ["Rotation"] = 90,
                            ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#5DFF4F")), ColorSequenceKeypoint.new(1, Color3.fromHex("#5DFF4F")) }),
                            ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
                        }) }) })
            })
        end
        if v149 then
            v147[v148 + 1] = v149
        end
        v72.ClaimRewardButton = u14.createElement(u4, v140, v147)
        v57.Content = u14.createElement(u7, v71, v72)
        local v150 = u14.createElement
        local v151 = "Frame"
        local v152 = {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 2,
            ["Size"] = UDim2.new(1, 0, 0, 10),
            ["Position"] = UDim2.fromScale(0, 1),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["BackgroundColor3"] = Color3.fromHex("#787EC8")
        }
        local v153 = { (u14.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            })) }
        local v154 = u14.createElement
        local v155 = "Frame"
        local v156 = {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 2
        }
        local v157 = UDim2.fromScale
        local v158 = u24.Progress / u24.Stage.progress
        v156.Size = v157(math.clamp(v158, 0, 1), 1)
        local v159
        if v27 then
            v159 = Color3.fromHex("#FFDF38")
        else
            v159 = u23.textPrimary
        end
        v156.BackgroundColor3 = v159
        v153.ProgressBar = v154(v155, v156, { u14.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }) })
        v57.ProgressBarContainer = v150(v151, v152, v153)
        return u14.createElement("Frame", v56, v57)
    end)
}