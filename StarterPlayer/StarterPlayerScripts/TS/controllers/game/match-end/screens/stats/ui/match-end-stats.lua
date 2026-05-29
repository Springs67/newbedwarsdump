local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.UIUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking")
local u12 = v11.CATEGORY_TO_ICON
local u13 = v11.STAT_TO_CATEGORY
local u14 = v11.STAT_TO_DESCRIPTION
local u15 = v11.TrackType
local u16 = v11.TYPE_PRIORITY
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking-util").StatTrackingUtil
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent, "match-end-screen-meta").MatchEndScreensMeta
local u19 = v1.import(script, script.Parent, "leaderboard", "leaderboard-position").LeaderboardPosition
local u20 = v1.import(script, script.Parent, "winstreak", "winstreak-section")
local u21 = nil
local function v26(p22) --[[ Line: 257 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
        [3] = u21
    --]]
    local v23 = {}
    local v24 = #v23
    local v25 = {
        ["Size"] = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, 110),
        ["BackgroundTransparency"] = 1
    }
    v23[v24 + 1] = u8.createElement("Frame", v25, { u8.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(u5.isSmallScreen() and 0.98 or 0.8, 1),
            ["Position"] = UDim2.new(0.5, 0, 0.5, u5.isSmallScreen() and 35 or 50),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }, { u8.createElement(u21, {
                ["store"] = p22.store,
                ["WinningTeamId"] = p22.WinningTeamId,
                ["PreviousLeaderboardPosition"] = p22.PreviousLeaderboardPosition,
                ["NewLeaderboardPosition"] = p22.NewLeaderboardPosition,
                ["TrackedStats"] = p22.TrackedStats,
                ["DisableAnimation"] = p22.DisableAnimation
            }) }) })
    return u8.createElement("ScreenGui", {
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = true,
        ["DisplayOrder"] = 101
    }, v23)
end
u21 = v9.new(u8)(function(u27, p28) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
        [3] = u7
        [4] = u17
        [5] = u10
        [6] = u6
        [7] = u18
        [8] = u12
        [9] = u13
        [10] = u14
        [11] = u15
        [12] = u4
        [13] = u16
        [14] = u3
        [15] = u19
        [16] = u20
    --]]
    local _ = p28.useState
    local v29 = p28.useEffect
    local u30 = u8.createRef()
    local u31 = u8.createRef()
    local u32 = UDim2.new(1, 0, u5.isSmallScreen() and 0.6 or 0, (not u27.TrackedStats or u5.isSmallScreen()) and 0 or #u7.entries(u17.MATCH_TYPES) * 32 + 20)
    local v33
    if u27.PreviousLeaderboardPosition == nil then
        v33 = false
    else
        v33 = u27.NewLeaderboardPosition ~= nil
    end
    v29(function() --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u30
            [3] = u27
            [4] = u32
            [5] = u5
            [6] = u10
            [7] = u6
            [8] = u18
        --]]
        local u34 = u31:getValue()
        local u35 = u30:getValue()
        task.spawn(function() --[[ Line: 33 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u35
                [3] = u32
                [4] = u5
                [5] = u10
                [6] = u6
                [7] = u34
                [8] = u18
            --]]
            if u27.DisableAnimation then
                u35.Size = u32
                return nil
            end
            if u5.isHoarceKat() then
                task.wait(0.1)
            end
            local v36 = TweenInfo.new(0.4, Enum.EasingStyle.Cubic)
            if u27.TrackedStats then
                u10:Create(u35, v36, {
                    ["Size"] = u32
                }):Play()
            end
            u6:setContainerTransparency(u34, 1, {
                ["onSetTweenInfo"] = TweenInfo.new(0),
                ["onCleanUpTweenInfo"] = v36
            }):DoCleaning()
            local v37 = u18[5].displaySecs
            local v38 = (v37 == nil and 1 or v37) - 0.5
            local u39 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic)
            task.delay(v38, function() --[[ Line: 59 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u10
                    [3] = u35
                    [4] = u6
                    [5] = u34
                    [6] = u39
                --]]
                if u27.TrackedStats then
                    u10:Create(u35, TweenInfo.new(0.4, Enum.EasingStyle.Cubic), {
                        ["Size"] = UDim2.new(1, 0, 0, 0)
                    }):Play()
                end
                u6:setContainerTransparency(u34, 1, {
                    ["onSetTweenInfo"] = u39
                })
            end)
        end)
    end)
    local v40 = u27.TrackedStats
    if v40 then
        local v41 = u27.TrackedStats
        if v41 then
            local function v51(p42, p43) --[[ Line: 75 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u17
                    [3] = u12
                    [4] = u13
                    [5] = u14
                    [6] = u15
                    [7] = u8
                    [8] = u5
                    [9] = u4
                --]]
                if not u27.TrackedStats then
                    return nil
                end
                local v44 = u17.MATCH_TYPES
                if table.find(v44, p42) == nil then
                    return nil
                end
                local v45 = u12[u13[p42]]
                local v46 = u14[p42]
                local v47 = u27.TrackedStats[p42]
                if p42 == u15.HEALING or (p42 == u15.DAMAGE or p42 == u15.PROJECTILEDAMAGE) then
                    v47 = math.ceil(v47)
                end
                local v48 = u8.createElement
                local v49 = {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.new(1, 0, 0, u5.isSmallScreen() and 20 or 24),
                    ["LayoutOrder"] = p43
                }
                local v50 = {
                    u8.createElement("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["BorderSizePixel"] = 0,
                        ["Size"] = UDim2.fromScale(0.1, 1),
                        ["Position"] = UDim2.fromScale(0, 0.5),
                        ["AnchorPoint"] = Vector2.new(0, 0.5),
                        ["Image"] = v45,
                        ["ScaleType"] = Enum.ScaleType.Fit
                    }, { u8.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }) }),
                    ["MatchStatsTitle"] = u8.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(0.9, 1),
                        ["Position"] = UDim2.fromScale(0.1, 0),
                        ["Text"] = v46,
                        ["TextColor3"] = u4.WHITE,
                        ["TextSize"] = u5.isSmallScreen() and 18 or 24,
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    }),
                    ["MatchStatsValue"] = u8.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(u5.isSmallScreen() and 0.95 or 1, 1),
                        ["Text"] = tostring(v47),
                        ["TextColor3"] = u4.WHITE,
                        ["TextSize"] = u5.isSmallScreen() and 18 or 24,
                        ["TextXAlignment"] = Enum.TextXAlignment.Right,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    })
                }
                return v48("Frame", v49, v50)
            end
            local v52 = 0
            local v53 = {}
            for v54, v55 in u16 do
                local v56 = v51(v55, v54 - 1, u16)
                if v56 ~= nil then
                    v52 = v52 + 1
                    v53[v52] = v56
                end
            end
            local v57 = {
                ["ScrollingFrameProps"] = {
                    ["Size"] = UDim2.fromScale(u5.isSmallScreen() and 0.9 or 0.8, u5.isSmallScreen() and 0.9 or 1),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5)
                }
            }
            local v58 = { u8.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, u5.isSmallScreen() and 4 or 8)
                }) }
            local v59 = #v58
            for v60, v61 in v53 do
                v58[v59 + v60] = v61
            end
            v41 = u8.createFragment({
                ["StatsWrapper"] = u8.createElement(u3, v57, v58)
            })
        end
        local v62 = {
            ["Size"] = UDim2.fromScale(1, 0),
            ["BorderSizePixel"] = 0,
            ["BackgroundColor3"] = u4.BLACK,
            ["BackgroundTransparency"] = 0.7,
            ["LayoutOrder"] = 1,
            ["ClipsDescendants"] = true,
            [u8.Ref] = u30
        }
        local v63 = {
            u8.createElement("UISizeConstraint", {
                ["MaxSize"] = Vector2.new(400, (1 / 0))
            }),
            u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.05, 0)
            }),
            [#v63 + 1] = v41
        }
        v40 = u8.createFragment({
            ["StatsContainer"] = u8.createElement("Frame", v62, v63)
        })
    end
    local v64 = {
        ["Size"] = UDim2.fromScale(1, u5.isSmallScreen() and 1 or 0.8),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.new(0.5, 0, 0.5, u5.isSmallScreen() and 20 or 0),
        ["BackgroundTransparency"] = 1,
        ["Visible"] = u27.Visible,
        [u8.Ref] = u31
    }
    local v65 = {
        u8.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.05, 0)
        }),
        ["MatchStatsTitle"] = u8.createElement("TextLabel", {
            ["Text"] = "MATCH STATS",
            ["TextScaled"] = true,
            ["LayoutOrder"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.1),
            ["TextColor3"] = u4.WHITE,
            ["Font"] = Enum.Font.LuckiestGuy
        })
    }
    local v66 = #v65
    if v40 then
        v65[v66 + 1] = v40
    end
    local _ = #v65
    local v67 = {
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(0.85, u5.isSmallScreen() and 0.2 or 0.14)
    }
    local v68 = { u8.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.04, 0)
        }) }
    local v69 = #v68
    if v33 then
        v33 = u8.createElement(u19, {
            ["PreviousLeaderboardPos"] = u27.PreviousLeaderboardPosition,
            ["NewLeaderboardPos"] = u27.NewLeaderboardPosition,
            ["FrameProps"] = {
                ["Size"] = UDim2.fromScale(0.4, 1)
            }
        })
    end
    if v33 then
        v68[v69 + 1] = v33
    end
    v68[#v68 + 1] = u8.createElement(u20, {
        ["store"] = u27.store,
        ["FrameProps"] = {
            ["Size"] = UDim2.fromScale(0.4, 1)
        },
        ["WinningTeamId"] = u27.WinningTeamId
    })
    v65.BottomWrapper = u8.createElement("Frame", v67, v68)
    return u8.createFragment({
        ["MatchStatsWrapper"] = u8.createElement("Frame", v64, v65)
    })
end)
return {
    ["MatchEndStatsWrapper"] = v26,
    ["MatchEndStats"] = u21
}