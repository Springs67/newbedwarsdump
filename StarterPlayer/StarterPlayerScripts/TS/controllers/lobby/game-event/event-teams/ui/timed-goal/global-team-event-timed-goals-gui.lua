local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.Padding
local u8 = v2.SoundManager
local u9 = v2.StringUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").Logger
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-util").GlobalTeamsUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent, "event-navbar", "event-app-navlink").EventAppNavlink
local u21 = v1.import(script, script.Parent, "global-team-event-timed-goals-overview").GlobalTeamEventGoalsOverview
local u22 = v1.import(script, script.Parent, "global-team-event-timed-goals-riddle-card").GlobalTeamEventTimedGoalsRiddleCard
local u23 = v1.import(script, script.Parent, "global-team-timed-goal-reward-box").GlobalTeamTimedGoalRewardBox
return {
    ["GlobalTeamTimedGoalsGUI"] = v14.new(u13)(function(u24, p25) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u12
            [3] = u13
            [4] = u6
            [5] = u15
            [6] = u5
            [7] = u10
            [8] = u11
            [9] = u17
            [10] = u8
            [11] = u18
            [12] = u19
            [13] = u21
            [14] = u22
            [15] = u20
            [16] = u4
            [17] = u7
            [18] = u9
            [19] = u23
            [20] = u3
        --]]
        local v26 = p25.useState
        local v27 = p25.useEffect
        local u28 = 0
        local u29 = u16.getGlobalTeamEventKeyFromEventType(u24.EventType)
        if not u29 then
            u12:default():Debug("Missing globalTeamEventKey")
            return u13.createFragment({
                ["NoGlobalTeamEvent"] = u13.createElement(u6)
            })
        end
        local u30 = u16.getGlobalTeamEventMeta(u29)
        local u31, u32 = v26({})
        local u33, u34 = v26(0)
        local u35, u36 = v26(nil)
        local v37
        if u35 == nil then
            v37 = u35
        else
            local v38 = u35.timedGoal
            v37 = v38 ~= nil and #v38.rewards or v38
        end
        local u39, u40 = v26(1500 / (v37 == nil and 1 or v37))
        local v41, u42 = v26(0)
        local u43, u44 = v26(nil)
        local u45, u46 = v26(u15:getState().Event.profileData.events[u24.EventType])
        local u47, _ = v26(u13.createRef())
        local v48 = u16.getTimedGoalsForTeam(u24.EventType, u24.GlobalTeamKey)
        if not v48 then
            u12:default():Debug("Missing allTimedGoals")
            return u13.createFragment({
                ["NoTimedGoals"] = u13.createElement(u6)
            })
        end
        local v49 = #v48 - 1
        local v50 = false
        local v51 = nil
        while true do
            if v50 then
                v49 = v49 - 1
            else
                v50 = true
            end
            if v49 < 0 then
                v52 = v51
                break
            end
            local v52 = v48[v49 + 1]
            if u16.isTimedGoalActive(v52) then
                break
            end
        end
        if not v52 then
            local _ = v48[1]
        end
        v27(function() --[[ Line: 94 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u15
                [3] = u29
                [4] = u10
                [5] = u44
                [6] = u45
                [7] = u32
                [8] = u46
                [9] = u24
                [10] = u11
                [11] = u30
                [12] = u16
                [13] = u36
                [14] = u17
                [15] = u35
            --]]
            local u53 = true
            local v54
            if u5.isHoarceKat() then
                v54 = u15:getState().Event.globalTeamEventDataMap[u29]
            else
                v54 = u10.Controllers.GlobalTeamsController:getLocalGlobalEventData(u29)
            end
            u44(v54)
            local v55 = u45
            if v55 ~= nil then
                v55 = v55.claimedGlobalTeamRewards
            end
            u32(v55 == nil and {} or v55)
            u46(u15:getState().Event.profileData.events[u24.EventType])
            local v56 = u11
            local v57 = u30.timedGoals
            local v58 = u24.GlobalTeamKey
            local v59 = nil
            for v60, v61 in v56.values(v57[v58]) do
                local _ = v60 - 1
                if u16.isTimedGoalActive(v61) == true then
                    v59 = v61
                    break
                end
            end
            if v59 then
                if v54 ~= nil then
                    v54 = v54.globalTeams[u24.GlobalTeamKey]
                    if v54 ~= nil then
                        v54 = v54.timedGoalsData
                        if v54 ~= nil then
                            v54 = v54[v59.key]
                        end
                    end
                end
                u36({
                    ["timedGoal"] = v59,
                    ["score"] = v54 == nil and 0 or v54
                })
            end
            local u62
            if u5.isHoarceKat() then
                u62 = nil
            else
                u62 = u17.Client:Get("GlobalTeamScoresUpdatedServerToClient"):Connect(function(p63) --[[ Line: 155 ]]
                    --[[
                    Upvalues:
                        [1] = u53
                        [2] = u44
                        [3] = u24
                        [4] = u35
                        [5] = u36
                    --]]
                    if u53 then
                        return nil
                    end
                    u44(p63.globalTeamEventData)
                    local v64 = p63.globalTeamEventData.globalTeams[u24.GlobalTeamKey]
                    if v64 ~= nil then
                        local v65 = v64.timedGoalsData
                        if v65 ~= nil then
                            for v66, v67 in v65 do
                                local v68 = u35
                                if v68 ~= nil then
                                    v68 = v68.timedGoal.key
                                end
                                if v68 == v66 then
                                    u36({
                                        ["timedGoal"] = u35.timedGoal,
                                        ["score"] = v67
                                    })
                                end
                            end
                        end
                    end
                end)
            end
            return function() --[[ Line: 185 ]]
                --[[
                Upvalues:
                    [1] = u53
                    [2] = u62
                --]]
                u53 = false
                local v69 = u62
                if v69 ~= nil then
                    v69:Disconnect()
                end
            end
        end, {})
        v27(function() --[[ Line: 194 ]]
            --[[
            Upvalues:
                [1] = u35
                [2] = u45
                [3] = u24
                [4] = u34
                [5] = u40
                [6] = u42
                [7] = u47
            --]]
            local v70 = u35
            if v70 ~= nil then
                v70 = v70.timedGoal
            end
            local v71 = u35
            if v71 ~= nil then
                v71 = v71.score
            end
            if v70 and v71 ~= nil then
                if u45 then
                    local v72 = u45.timedGoals
                    if v72 ~= nil then
                        v72 = v72[u24.GlobalTeamKey]
                        if v72 ~= nil then
                            v72 = v72[v70.key]
                        end
                    end
                    u34(v72 == nil and 0 or v72)
                end
                local v73 = 1500 / #v70.rewards
                u40(v73)
                local v74 = 0
                local v75 = v74
                for v76, v77 in v70.rewards do
                    local _ = v76 - 1
                    if v77.globalTeamScoreRequired <= v71 then
                        v74 = v75 + 1
                        v75 = v74
                    end
                end
                local v78 = -1
                for v79, v80 in v70.rewards do
                    local _ = v79 - 1
                    if v71 < v80.globalTeamScoreRequired == true then
                        v78 = v79 - 1
                        break
                    end
                end
                local v81 = v78 - 1
                if v70.rewards[#v70.rewards - 1 + 1].globalTeamScoreRequired <= v71 then
                    v78 = #v70.rewards - 1
                    v81 = #v70.rewards - 1
                end
                local v82 = v70.rewards[v78 + 1].globalTeamScoreRequired - (v81 < 0 and 0 or v70.rewards[v81 + 1].globalTeamScoreRequired)
                local v83 = v82 == 0 and 0 or (v71 - (v81 < 0 and 0 or v70.rewards[v81 + 1].globalTeamScoreRequired)) / v82
                local v84 = v75 * v73 + v83 * v73
                u42(v84)
                local v85 = u47:getValue()
                if v85 then
                    v85.CanvasPosition = Vector2.new(0, 1500 - v84 + v73)
                end
            end
        end, { u35 })
        local function u92(p86, p87) --[[ Line: 267 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u28
                [3] = u17
                [4] = u29
                [5] = u8
                [6] = u18
                [7] = u32
            --]]
            if table.find(u31, p87) ~= nil then
                return nil
            end
            if tick() - u28 < 0.5 then
                return nil
            end
            u28 = tick()
            local v88 = {
                ["globalTeamEventKey"] = u29,
                ["timedGoalKey"] = p86,
                ["rewardId"] = p87
            }
            if not u17.Client:Get("TryToClaimGlobalTimedGoalReward"):CallServer(v88) then
                return nil
            end
            u8:playSound(u18.UI_REWARD)
            local v89 = {}
            local v90 = #v89
            local v91 = #u31
            table.move(u31, 1, v91, v90 + 1, v89)
            v89[v90 + v91 + 1] = p87
            u32(v89)
        end
        local v93 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u19.backgroundPrimary
        }
        local v94 = { u13.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.03, 0),
                ["PaddingBottom"] = UDim.new(0.03, 0),
                ["PaddingLeft"] = UDim.new(0.02, 0),
                ["PaddingRight"] = UDim.new(0.02, 0)
            }) }
        local _ = #v94
        local v95 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v96 = {}
        local v97 = #v96
        local v98 = {
            ["Size"] = UDim2.fromScale(0.265, 1)
        }
        local v99 = { u13.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 8),
                ["VerticalFlex"] = Enum.UIFlexAlignment.SpaceBetween
            }), u13.createElement(u21, {
                ["CurrentTimedGoalData"] = u35
            }), u13.createElement(u22, {
                ["CurrentTimedGoalData"] = u35
            }) }
        local _ = #v99
        local function v105(u100, _) --[[ Line: 338 ]]
            --[[
            Upvalues:
                [1] = u35
                [2] = u43
                [3] = u24
                [4] = u36
                [5] = u13
                [6] = u20
            --]]
            local v101 = {
                ["Text"] = u100.name,
                ["SubText"] = os.date("%m/%d", u100.startTime) .. " - " .. os.date("%m/%d", u100.endTime),
                ["Page"] = u100.key
            }
            local v102 = u35
            if v102 ~= nil then
                v102 = v102.timedGoal.key
            end
            v101.ActivePage = v102 == nil and "" or v102
            function v101.OnClick() --[[ Line: 353 ]]
                --[[
                Upvalues:
                    [1] = u100
                    [2] = u43
                    [3] = u24
                    [4] = u36
                --]]
                local v103 = {
                    ["timedGoal"] = u100
                }
                local v104 = u43
                if v104 ~= nil then
                    v104 = v104.globalTeams[u24.GlobalTeamKey]
                    if v104 ~= nil then
                        v104 = v104.timedGoalsData
                        if v104 ~= nil then
                            v104 = v104[u100.key]
                        end
                    end
                end
                v103.score = v104 == nil and 0 or v104
                u36(v103)
            end
            v101.ThemeColor = Color3.fromRGB(255, 214, 36)
            return u13.createElement(u20, v101)
        end
        local v106 = table.create(#v48)
        for v107, v108 in v48 do
            v106[v107] = v105(v108, v107 - 1, v48)
        end
        local v109 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.2),
            ["Position"] = UDim2.fromScale(0.05, 0.725),
            ["AnchorPoint"] = Vector2.new(0, 0.5)
        }
        local v110 = { u13.createElement("UIGridLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["FillDirectionMaxCells"] = 2,
                ["CellSize"] = UDim2.fromScale(0.45, 0.45),
                ["CellPadding"] = UDim2.fromScale(0.02, 0.02)
            }) }
        local v111 = #v110
        for v112, v113 in v106 do
            v110[v111 + v112] = v113
        end
        v99.TimedGoalsNavbar = u13.createElement(u6, v109, v110)
        v96.SideTab = u13.createElement(u6, v98, v99)
        local v114
        if u35 == nil then
            v114 = u13.createFragment({
                ["GlobalTeamEventTimedGoalsErrorText"] = u13.createElement("TextLabel", {
                    ["Text"] = "No timed goal selected",
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["TextColor3"] = u4.WHITE,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                })
            })
        else
            local v115 = {
                ["ScrollingFrameProps"] = {
                    ["LayoutOrder"] = 2,
                    ["Selectable"] = false,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["CanvasSize"] = UDim2.new(1, 0, 0, 1580)
                },
                ["ScrollingFrameRef"] = u47
            }
            local v116 = {}
            local _ = #v116
            local v117 = {
                ["BackgroundTransparency"] = 0,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v118 = { u13.createElement(u7, {
                    ["Padding"] = {
                        ["Vertical"] = 60,
                        ["Right"] = 60,
                        ["Left"] = 80
                    }
                }), u13.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["SortOrder"] = "LayoutOrder",
                    ["HorizontalAlignment"] = "Right",
                    ["Padding"] = UDim.new(0, 10)
                }) }
            local _ = #v118
            local v119 = u35.timedGoal.rewards
            local function v125(p120, p121) --[[ Line: 457 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u39
                    [3] = u9
                    [4] = u4
                --]]
                local v122 = u13.createElement
                local v123 = {
                    ["BackgroundTransparency"] = 1,
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["Position"] = UDim2.fromOffset(0, 1500 - (p121 + 1) * u39),
                    ["Size"] = UDim2.fromScale(1, 0.015)
                }
                local v124 = {
                    ["GlobalTeamEventRewardScoreRequirement"] = u13.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["TextScaled"] = true,
                        ["TextXAlignment"] = "Right",
                        ["Text"] = u9.formatNumberWithCommas(p120.globalTeamScoreRequired),
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["TextColor3"] = u4.WHITE,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    })
                }
                return v122("Frame", v123, v124)
            end
            local v126 = table.create(#v119)
            for v127, v128 in v119 do
                v126[v127] = v125(v128, v127 - 1, v119)
            end
            local v129 = {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 100,
                ["Size"] = UDim2.new(0.3, 0, 0, 1500)
            }
            local v130 = {}
            local v131 = #v130
            for v132, v133 in v126 do
                v130[v131 + v132] = v133
            end
            v118.GlobalTeamEventRewardScoreRequirementsColumn = u13.createElement("Frame", v129, v130)
            local v134 = u35.timedGoal.rewards
            local function v136(_, p135) --[[ Line: 493 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u13
                    [3] = u39
                    [4] = u4
                --]]
                if p135 == #u35.timedGoal.rewards - 1 then
                    return nil
                else
                    return u13.createElement("Frame", {
                        ["BackgroundTransparency"] = 0.6,
                        ["BorderSizePixel"] = 0,
                        ["ZIndex"] = 100,
                        ["AnchorPoint"] = Vector2.new(0, 0.5),
                        ["Position"] = UDim2.fromOffset(0, 1500 - (p135 + 1) * u39),
                        ["Size"] = UDim2.new(1, 0, 0, 2),
                        ["BackgroundColor3"] = u4.BLACK
                    })
                end
            end
            local v137 = 0
            local v138 = {}
            for v139, v140 in v134 do
                local v141 = v136(v140, v139 - 1, v134)
                if v141 ~= nil then
                    v137 = v137 + 1
                    v138[v137] = v141
                end
            end
            local v142 = {
                ["BorderSizePixel"] = 5,
                ["BackgroundTransparency"] = 0,
                ["LayoutOrder"] = 200,
                ["Size"] = UDim2.new(0, 75, 0, 1500),
                ["BackgroundColor3"] = u19.backgroundTertiary,
                ["Position"] = UDim2.fromScale(0.5, 0),
                ["AnchorPoint"] = Vector2.new(0.5, 0)
            }
            local v143 = {
                u13.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                }),
                ["GlobalTeamEventRewardProgressBar"] = u13.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 0,
                    ["Size"] = UDim2.new(0.9, 0, 0, v41),
                    ["Position"] = UDim2.fromScale(0.5, 1),
                    ["AnchorPoint"] = Vector2.new(0.5, 1),
                    ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
                }, { u13.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0.1, 0)
                    }), u13.createElement("UIGradient", {
                        ["Rotation"] = 90,
                        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 193, 73)), ColorSequenceKeypoint.new(1, Color3.fromRGB(153, 116, 44)) })
                    }) })
            }
            local v144 = #v143
            for v145, v146 in v138 do
                v143[v144 + v145] = v146
            end
            v118.GlobalTeamEventRewardProgressBarContainer = u13.createElement("Frame", v142, v143)
            local v147 = u35.timedGoal.rewards
            local function v155(u148, p149) --[[ Line: 555 ]]
                --[[
                Upvalues:
                    [1] = u39
                    [2] = u35
                    [3] = u31
                    [4] = u29
                    [5] = u92
                    [6] = u33
                    [7] = u13
                    [8] = u23
                --]]
                local v150 = {
                    ["BackgroundTransparency"] = 1,
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["Position"] = UDim2.fromOffset(0, 1500 - (p149 + 1) * u39),
                    ["Size"] = UDim2.new(1, 0, 0, 80)
                }
                local v151 = {}
                local v152 = #v151
                local v153 = {
                    ["RewardData"] = u148,
                    ["Score"] = u35.score
                }
                local v154 = u148.globalTeamRewardId
                v153.Claimed = table.find(u31, v154) ~= nil
                v153.GlobalTeamEventKey = u29
                function v153.OnClaimClick() --[[ Line: 571 ]]
                    --[[
                    Upvalues:
                        [1] = u92
                        [2] = u35
                        [3] = u148
                    --]]
                    return u92(u35.timedGoal.key, u148.globalTeamRewardId)
                end
                v153.HasEnoughPoints = u35.score >= u148.globalTeamScoreRequired
                v153.PersonalScoreContribution = u33
                v151[v152 + 1] = u13.createElement(u23, v153)
                return u13.createElement("Frame", v150, v151)
            end
            local v156 = table.create(#v147)
            for v157, v158 in v147 do
                v156[v157] = v155(v158, v157 - 1, v147)
            end
            local v159 = {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 300,
                ["Size"] = UDim2.new(0.4, 0, 0, 1500),
                ["BackgroundColor3"] = u4.BLACK
            }
            local v160 = {}
            local v161 = #v160
            for v162, v163 in v156 do
                v160[v161 + v162] = v163
            end
            v118.GlobalTeamEventRewardBoxesColumn = u13.createElement("Frame", v159, v160)
            v116.GlobalTeamFrameContainer = u13.createElement(u6, v117, v118)
            v114 = u13.createFragment({
                ["GlobalTeamRewardsList"] = u13.createElement(u3, v115, v116)
            })
        end
        v96[v97 + 1] = v114
        v94.TimedGoalsContent = u13.createElement(u6, v95, v96)
        return u13.createFragment({
            ["GlobalTeamTimedGoalsGUI"] = u13.createElement("Frame", v93, v94)
        })
    end)
}