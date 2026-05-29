local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking-util").StatTrackingUtil
local u6 = v1.import(script, script.Parent.Parent.Parent, "lobby-controls", "ui", "lobby-controls").LobbyControlsWrapper
local u7 = v1.import(script, script.Parent, "match-end-stats").MatchEndStatsWrapper
return function(p8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u3
        [4] = u7
        [5] = u6
        [6] = u2
    --]]
    local v9 = u5.DUMMY_TRACKED_STATS
    u4:dispatch({
        ["type"] = "SetMatchEndSummaryVisible",
        ["visible"] = true
    })
    local u10 = u3("MatchEndStatsApp", u7, {
        ["WinningTeamId"] = 0,
        ["NewLeaderboardPosition"] = 12673,
        ["PreviousLeaderboardPosition"] = 63864,
        ["DisableAnimation"] = true,
        ["TrackedStats"] = v9
    }, {}, {
        ["Parent"] = p8
    })
    local u11 = u3("LobbyControls", u6, {}, {}, {
        ["Parent"] = p8
    })
    return function() --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u10
            [3] = u11
        --]]
        u2.unmount(u10)
        u2.unmount(u11)
    end
end