local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u10 = v1.import(script, script.Parent.Parent, "player-highlights", "ui", "player-highlights").PlayerHighlights
local u11 = v1.import(script, script.Parent.Parent, "progress", "ui", "match-end-progress").MatchEndProgress
local u12 = v1.import(script, script.Parent.Parent, "stats", "ui", "match-end-stats").MatchEndStats
local u13 = v1.import(script, script.Parent, "ui", "lobby-timer").LobbyTimer
local v14 = {}
local u15 = setmetatable({}, {
    ["__index"] = v14
})
u15.PROGRESS = "PROGRESS"
v14.PROGRESS = "PROGRESS"
u15.STATS = "STATS"
v14.STATS = "STATS"
u15.HIGHLIGHTS = "HIGHLIGHTS"
v14.HIGHLIGHTS = "HIGHLIGHTS"
local function v66(p16, p17) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u6
        [3] = u4
        [4] = u5
        [5] = u8
        [6] = u13
        [7] = u3
        [8] = u9
        [9] = u11
        [10] = u12
        [11] = u10
    --]]
    local v18 = p17.useState
    local v19 = p17.useEffect
    local v20, u21 = v18(u15.PROGRESS)
    local u22 = u6.createRef()
    local v23 = u4.hexColor(6645940)
    local v24 = u4.hexColor(3026766)
    v19(function() --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u5
            [3] = u8
        --]]
        local u25 = u22:getValue()
        task.spawn(function() --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u8
                [3] = u25
            --]]
            if u5.isHoarceKat() then
                task.wait(0.5)
            end
            u8:Create(u25, TweenInfo.new(0.3, Enum.EasingStyle.Cubic), {
                ["Position"] = UDim2.fromScale(0, 0)
            }):Play()
        end)
    end)
    local v26 = {
        ["Size"] = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, 110),
        ["BackgroundTransparency"] = 1
    }
    local v27 = u6.createElement
    local v28 = "Frame"
    local v29 = {
        ["LobbyTimerWrapper"] = u6.createElement("Frame", {
            ["Size"] = UDim2.new(1, 0, 0, u5.isSmallScreen() and 30 or 50),
            ["Position"] = UDim2.fromOffset(0, -90),
            ["BackgroundTransparency"] = 1,
            [u6.Ref] = u22
        }, { u6.createElement(u13, {
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.new(0.5, 0, 0, u5.isSmallScreen() and 5 or 10)
            }) })
    }
    local v30 = u6.createElement
    local v31 = "Frame"
    local v32 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(u5.isSmallScreen() and 0.98 or 0.8, 1),
        ["Position"] = UDim2.new(0.5, 0, 0.5, u5.isSmallScreen() and 35 or 50),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Visible"] = u5.isHoarceKat() and true or p16.store.Game.matchEndSummaryVisible
    }
    local v33 = {}
    local v34 = u6.createElement
    local v35 = "Frame"
    local v36 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.new(1, 0, 0, u5.isSmallScreen() and 30 or 40),
        ["Position"] = UDim2.fromScale(0, 0),
        ["AnchorPoint"] = Vector2.new(0, 0)
    }
    local v37 = {}
    local v38 = u6.createElement
    local v39 = "Frame"
    local v40 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v41 = {}
    local v42 = u6.createElement("UIListLayout", {
        ["FillDirection"] = Enum.FillDirection.Horizontal,
        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
        ["Padding"] = UDim.new(0, 5)
    })
    local v43 = u6.createElement
    local v44 = u3
    local v45 = {
        ["Text"] = "<b>PROGRESS</b>",
        ["LayoutOrder"] = 0,
        ["Size"] = UDim2.new(0, u5.isSmallScreen() and 90 or 150, 1, 0)
    }
    local v46
    if v20 == u15.PROGRESS then
        v46 = v23
    else
        v46 = v24
    end
    v45.BackgroundColor3 = v46
    local v47 = {}
    local v48
    if v20 == u15.PROGRESS then
        v48 = u4.WHITE
    else
        v48 = u9.textSecondary
    end
    v47.TextColor3 = v48
    v45.TextLabel = v47
    v45.CornerRadius = UDim.new(0, 10)
    function v45.OnClick() --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u15
        --]]
        u21(u15.PROGRESS)
    end
    local v49 = v43(v44, v45)
    local v50 = u6.createElement
    local v51 = u3
    local v52 = {
        ["Text"] = "<b>STATS</b>",
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.new(0, u5.isSmallScreen() and 90 or 100, 1, 0)
    }
    local v53
    if v20 == u15.STATS then
        v53 = v23
    else
        v53 = v24
    end
    v52.BackgroundColor3 = v53
    local v54 = {}
    local v55
    if v20 == u15.STATS then
        v55 = u4.WHITE
    else
        v55 = u9.textSecondary
    end
    v54.TextColor3 = v55
    v52.TextLabel = v54
    v52.CornerRadius = UDim.new(0, 10)
    function v52.OnClick() --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u15
        --]]
        u21(u15.STATS)
    end
    __set_list(v41, 1, {v42, v49, v50(v51, v52)})
    v37.MatchSummaryTabButtonsLeft = v38(v39, v40, v41)
    local v56 = u6.createElement
    local v57 = "Frame"
    local v58 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v59 = {}
    local v60 = u6.createElement("UIListLayout", {
        ["FillDirection"] = Enum.FillDirection.Horizontal,
        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
        ["Padding"] = UDim.new(0, 5)
    })
    local v61 = u6.createElement
    local v62 = u3
    local v63 = {
        ["Text"] = "<b>HIGHLIGHTS</b>",
        ["LayoutOrder"] = 0,
        ["Size"] = UDim2.new(0, u5.isSmallScreen() and 90 or 150, 1, 0)
    }
    if v20 ~= u15.HIGHLIGHTS then
        v23 = v24
    end
    v63.BackgroundColor3 = v23
    local v64 = {}
    local v65
    if v20 == u15.HIGHLIGHTS then
        v65 = u4.WHITE
    else
        v65 = u9.textSecondary
    end
    v64.TextColor3 = v65
    v63.TextLabel = v64
    v63.CornerRadius = UDim.new(0, 10)
    function v63.OnClick() --[[ Line: 133 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u15
        --]]
        u21(u15.HIGHLIGHTS)
    end
    v63.Visible = p16.PlayerHighlights ~= nil
    __set_list(v59, 1, {v60, v61(v62, v63)})
    v37.MatchSummaryTabButtonsRight = v56(v57, v58, v59)
    v33.MatchSummaryTabButtons = v34(v35, v36, v37)
    __set_list(v33, 1, {u6.createElement(u11, {
    ["DisableAnimation"] = true,
    ["WinningTeamId"] = p16.WinningTeamId,
    ["BattlePassMatchExperienceEarned"] = p16.BattlePassMatchExperienceEarned,
    ["PlayerMatchExperienceEarned"] = p16.PlayerMatchExperienceEarned,
    ["BedCoinsEarned"] = p16.BedCoinsEarned,
    ["ClanContributionEarned"] = p16.ClanContributionEarned,
    ["RankChangeData"] = p16.RankChangeData,
    ["MissionProgress"] = p16.MissionProgress,
    ["ArmorTrimXpEarned"] = p16.ArmorTrimXpEarned,
    ["KitStatsDelta"] = p16.KitStatsDelta,
    ["EquippedKit"] = p16.EquippedKit,
    ["Visible"] = v20 == u15.PROGRESS
}), u6.createElement(u12, {
    ["DisableAnimation"] = true,
    ["store"] = p16.store,
    ["TrackedStats"] = p16.TrackedStats,
    ["PreviousLeaderboardPosition"] = p16.PreviousLeaderboardPosition,
    ["NewLeaderboardPosition"] = p16.NewLeaderboardPosition,
    ["WinningTeamId"] = p16.WinningTeamId,
    ["Visible"] = v20 == u15.STATS
}), u6.createElement(u10, {
    ["DisableAnimation"] = true,
    ["cards"] = p16.PlayerHighlights,
    ["Visible"] = v20 == u15.HIGHLIGHTS
})})
    v29.MatchSummaryWrapper = v30(v31, v32, v33)
    return v27(v28, v26, v29)
end
local u67 = nil
local function v75(p68) --[[ Line: 173 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u67
    --]]
    local v69 = {}
    local v70 = #v69
    local v71 = {}
    local v72 = {
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = true,
        ["DisplayOrder"] = 101
    }
    for v73, v74 in p68 do
        v71[v73] = v74
    end
    v69[v70 + 1] = u6.createElement(u67, v71)
    return u6.createElement("ScreenGui", v72, v69)
end
u67 = v7.new(u6)(v66)
return {
    ["MatchEndSummaryAppWrapper"] = v75,
    ["MatchEndSummaryTab"] = u15,
    ["MatchEndSummaryApp"] = u67
}