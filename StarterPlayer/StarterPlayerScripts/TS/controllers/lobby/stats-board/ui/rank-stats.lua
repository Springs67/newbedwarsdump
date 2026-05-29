local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.ProgressBar
local u6 = v2.StringUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-decay-config")
local u10 = v9.RANK_DECAY_FLOOR_DIVISION
local u11 = v9.RANK_DECAY_GRACE_SECONDS
local u12 = v9.RANK_DECAY_INTERVAL_SECONDS
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-distribution").RankDistribution
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u17 = v1.import(script, script.Parent, "section-title").SectionTitle
return {
    ["RankStats"] = v8.new(u7)(function(p18, p19) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u14
            [3] = u15
            [4] = u10
            [5] = u11
            [6] = u12
            [7] = u7
            [8] = u4
            [9] = u3
            [10] = u16
            [11] = u5
            [12] = u6
            [13] = u17
        --]]
        local _ = p19.useState
        local u20 = p18.RankStats or p18.store.Leaderboard.rankStats
        local v21 = u13
        local v22
        if u20 == nil then
            v22 = u20
        else
            v22 = u20.rankPoints
        end
        local v23 = v22 == nil and 0 or v22
        local v24
        if u20 == nil then
            v24 = u20
        else
            v24 = u20.leaderboardPosition
        end
        local u25 = v21:getDisplayedRank(v23, v24 == nil and -1 or v24)
        local u26 = u14[u25.division]
        local v27
        if u20 == nil then
            v27 = u20
        else
            v27 = u20.leaderboardPosition
        end
        local u28
        if v27 == -1 then
            u28 = nil
        elseif u20 == nil then
            u28 = u20
        else
            u28 = u20.leaderboardPosition
        end
        local u29 = u15.NUM_PROVISIONAL_MATCHES
        local v30
        if u20 == nil then
            v30 = u20
        else
            v30 = u20.matchesPlayed
        end
        local u31 = v30 == nil and 0 or v30
        local v32 = p18.OtherPlayerViewing
        local v33 = u13:getRankPointsFromDivision(u10)
        local v34 = u29 <= u31
        if v34 then
            local v35
            if u20 == nil then
                v35 = u20
            else
                v35 = u20.rankPoints
            end
            v34 = v33 <= (v35 == nil and 0 or v35)
        end
        local v36 = p18.store.Lobby.profileData
        if v36 ~= nil then
            v36 = v36.queues[u15.activeRankMeta.queueType]
            if v36 ~= nil then
                v36 = v36.lastPlayTime
            end
        end
        local v37 = v36 == nil and 0 or v36
        local u38
        if v32 or (not v34 or v37 <= 0) then
            u38 = nil
        else
            local v39 = v37 + u11 - os.time()
            if v39 > 0 then
                local v40 = v39 / u12
                local v41 = math.ceil(v40)
                local v42 = math.max(1, v41)
                local v43 = v42 == 1 and "day" or "days"
                u38 = "Rank Decay: " .. tostring(v42) .. " " .. v43
            else
                u38 = "Rank Decay: Active"
            end
        end
        local function v54(p44) --[[ Line: 106 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u4
                [3] = u3
                [4] = u16
            --]]
            local v45 = u7.createFragment
            local v46 = {}
            local v47 = u7.createElement
            local v48 = u4
            local v49 = {
                ["Size"] = p44.Size
            }
            local v50 = {}
            local v51 = u7.createElement
            local v52 = {
                ["BackgroundTransparency"] = 0.8,
                ["Size"] = UDim2.fromScale(0.9, 0.9),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["BackgroundColor3"] = u3.BLACK
            }
            local v53 = {
                ["ProvisionalInfo"] = u7.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Text"] = "UNRANKED",
                    ["TextSize"] = 10,
                    ["LayoutOrder"] = 4,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = u16.textPrimary,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                }),
                u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                })
            }
            __set_list(v50, 1, {v51("Frame", v52, v53)})
            v46.Unranked = v47(v48, v49, v50)
            return v45(v46)
        end
        local function v70(p55) --[[ Line: 137 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u4
                [3] = u5
                [4] = u31
                [5] = u29
            --]]
            local v56 = u7.createFragment
            local v57 = {}
            local v58 = u7.createElement
            local v59 = u4
            local v60 = {
                ["Size"] = p55.Size
            }
            local v61 = {
                ["ProvisionalInfo"] = u7.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Text"] = "Complete 5 placement games to unlock your rank",
                    ["TextSize"] = 10,
                    ["TextXAlignment"] = "Center",
                    ["LayoutOrder"] = 4,
                    ["Size"] = UDim2.new(1, 0, 0.4, 0),
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                })
            }
            local v62 = u7.createElement
            local v63 = u4
            local v64 = {
                ["Position"] = UDim2.fromScale(0, 0.4),
                ["Size"] = UDim2.new(1, 0, 0.6, 0)
            }
            local v65 = { u7.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["HorizontalAlignment"] = "Center",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 6)
                }), (u7.createElement(u5, {
                    ["AcceptZero"] = true,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.85, 0.5),
                    ["Progress"] = u31 / u29
                })) }
            local v66 = u7.createElement
            local v67 = {
                ["AutomaticSize"] = "Y",
                ["BackgroundTransparency"] = 1,
                ["RichText"] = true,
                ["TextSize"] = 10,
                ["TextXAlignment"] = "Right",
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.85, 0)
            }
            local v68 = u31
            local v69 = u29
            v67.Text = "<b><font color=\"#ffffff\">" .. tostring(v68) .. " games</font></b> / " .. tostring(v69)
            v67.TextColor3 = Color3.fromRGB(207, 209, 231)
            v65.ProvisionalMatchesPlayed = v66("TextLabel", v67)
            __set_list(v61, 1, {v62(v63, v64, v65)})
            v57.ProvisionalMatchesProgress = v58(v59, v60, v61)
            return v56(v57)
        end
        local function v97(p71) --[[ Line: 185 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u26
                [3] = u3
                [4] = u16
                [5] = u28
                [6] = u6
                [7] = u38
                [8] = u4
                [9] = u25
                [10] = u5
                [11] = u20
            --]]
            local v72 = {
                ["Size"] = p71.Size
            }
            local v73 = { u7.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0.03, 0)
                }), u7.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = u26.image
                }) }
            local v74 = #v73
            local v75 = {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.7, 0.9)
            }
            local v76 = { u7.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["HorizontalAlignment"] = "Left",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 12)
                }) }
            local v77 = #v76
            local v78 = {
                ["Size"] = UDim2.fromScale(1, 0.6)
            }
            local v79 = {
                u7.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["HorizontalAlignment"] = "Left",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 6)
                }),
                ["RankName"] = u7.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["BackgroundTransparency"] = 1,
                    ["TextSize"] = 12,
                    ["TextXAlignment"] = "Left",
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["Text"] = u26.name,
                    ["TextColor3"] = u3.WHITE,
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
                }),
                ["LeaderboardRank"] = u7.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["BackgroundTransparency"] = 1,
                    ["TextSize"] = 10,
                    ["RichText"] = true,
                    ["TextXAlignment"] = "Left",
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["Text"] = "Leaderboard Rank: <b><font color=\"" .. u16.textPrimaryRichText .. "\">" .. ((u28 == 0 or (u28 ~= u28 or not u28)) and "Not on leaderboard" or u6.formatNumberWithCommas(u28 - 1)) .. "</font></b>",
                    ["TextColor3"] = Color3.fromRGB(207, 209, 231)
                })
            }
            local v80 = #v79
            local v81
            if u38 == nil then
                v81 = false
            else
                v81 = u7.createFragment({
                    ["RankDecayInfo"] = u7.createElement("TextLabel", {
                        ["AutomaticSize"] = "Y",
                        ["BackgroundTransparency"] = 1,
                        ["TextSize"] = 10,
                        ["TextXAlignment"] = "Left",
                        ["LayoutOrder"] = 3,
                        ["Size"] = UDim2.fromScale(1, 0),
                        ["Text"] = u38,
                        ["TextColor3"] = Color3.fromRGB(207, 209, 231)
                    })
                })
            end
            if v81 then
                v79[v80 + 1] = v81
            end
            v76[v77 + 1] = u7.createElement(u4, v78, v79)
            local v82
            if u26.noRPLimit then
                local v83 = {
                    ["AutomaticSize"] = "Y",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.85, 0)
                }
                local v84 = u20
                if v84 ~= nil then
                    v84 = v84.demotionShield
                end
                local v85 = v84 == nil and "" or "\240\159\155\161\239\184\143 "
                local v86 = u25.rankPoints
                v83.Text = v85 .. tostring(v86) .. " RP"
                v83.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
                v83.TextSize = 10
                v83.TextColor3 = Color3.fromRGB(255, 255, 255)
                v83.TextXAlignment = "Left"
                v83.LayoutOrder = 4
                v82 = u7.createFragment({
                    ["CurrentRP"] = u7.createElement("TextLabel", v83)
                })
            else
                local v87 = {}
                local v88 = #v87
                local v89 = {
                    ["Size"] = UDim2.fromScale(0.85, 0.5)
                }
                local v90 = u25.rankPoints
                v89.Progress = (v90 == nil and 0 or v90) / 100
                v89.AcceptZero = true
                v89.LayoutOrder = 3
                v89.BarColor = u26.color
                v87[v88 + 1] = u7.createElement(u5, v89)
                local v91 = {
                    ["AutomaticSize"] = "Y",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.85, 0)
                }
                local v92 = u20
                if v92 ~= nil then
                    v92 = v92.demotionShield
                end
                local v93 = v92 == nil and "" or "\240\159\155\161\239\184\143 "
                local v94 = u25.rankPoints
                v91.Text = v93 .. "<b><font color=\"#ffffff\">" .. tostring(v94) .. " RP</font></b> / " .. tostring(100)
                v91.RichText = true
                v91.TextSize = 10
                v91.TextColor3 = Color3.fromRGB(207, 209, 231)
                v91.TextXAlignment = "Right"
                v91.LayoutOrder = 4
                v87.CurrentRP = u7.createFragment({
                    ["CurrentRP"] = u7.createElement("TextLabel", v91)
                })
                v82 = u7.createFragment(v87)
            end
            local v95 = {
                ["Size"] = UDim2.fromScale(1, 0.4)
            }
            local v96 = {
                u7.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["HorizontalAlignment"] = "Left",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 6)
                }),
                [#v96 + 1] = v82
            }
            v76[v77 + 2] = u7.createElement(u4, v95, v96)
            v73[v74 + 1] = u7.createElement(u4, v75, v76)
            return u7.createElement(u4, v72, v73)
        end
        local v98 = u7.createElement
        local v99 = u4
        local v100 = {
            ["Size"] = UDim2.new(1, 0, 0, 112)
        }
        local v101 = {}
        local v102 = u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 12)
        })
        local v103 = u7.createElement(u17, {
            ["title"] = "Ranked",
            ["SectionDivider"] = true
        })
        local v104
        if u31 >= 5 then
            v104 = u7.createElement(v97, {
                ["Size"] = UDim2.new(1, 0, 1, -32)
            })
        elseif v32 then
            v104 = u7.createElement(v54, {
                ["Size"] = UDim2.new(1, 0, 1, -32)
            })
        else
            v104 = u7.createElement(v70, {
                ["Size"] = UDim2.new(1, 0, 1, -32)
            })
        end
        __set_list(v101, 1, {v102, v103, v104})
        return v98(v99, v100, v101)
    end)
}