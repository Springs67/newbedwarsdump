local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-division").RankDivision
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking").TrackType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking-util").StatTrackingUtil
local u9 = v1.import(script, script.Parent.Parent.Parent, "lobby-controls", "ui", "lobby-controls").LobbyControlsWrapper
local u10 = v1.import(script, script.Parent.Parent.Parent, "lobby-controls", "ui", "match-end-background").MatchEndBackgroundWrapper
local u11 = v1.import(script, script.Parent.Parent, "match-end-summary").MatchEndSummaryAppWrapper
return function(p12) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u6
        [4] = u8
        [5] = u7
        [6] = u4
        [7] = u9
        [8] = u10
        [9] = u11
        [10] = u3
    --]]
    u5:dispatch({
        ["type"] = "GameSetSpectator",
        ["spectating"] = true,
        ["spectatingPlayer"] = u2.Dummy.SnickTrix
    })
    u5:dispatch({
        ["type"] = "SetMatchEndSummaryVisible",
        ["visible"] = true
    })
    local v13 = {
        ["rpDelta"] = -10,
        ["rankVisible"] = true,
        ["matchesPlayed"] = 10,
        ["demotionShieldActive"] = true,
        ["oldDivision"] = {
            ["rankPoints"] = 10,
            ["division"] = u6.PLATINUM_3
        },
        ["newDivision"] = {
            ["rankPoints"] = 20,
            ["division"] = u6.PLATINUM_2
        }
    }
    local v14 = u8.DUMMY_TRACKED_STATS
    local v15 = {
        {
            ["amount"] = 33,
            ["trackType"] = u7.BLOCKBREAKS,
            ["player"] = u2.Dummy.Asen
        },
        {
            ["amount"] = 420,
            ["trackType"] = u7.DAMAGE,
            ["player"] = u2.Dummy.oiogy
        },
        {
            ["amount"] = 7,
            ["trackType"] = u7.KILLS,
            ["player"] = u2.Dummy.Bryan3838
        }
    }
    local u16 = u4("LobbyControls", u9, {}, {}, {
        ["Parent"] = p12
    })
    local u17 = u4("MatchEndDarkBackground", u10, {}, {}, {
        ["Parent"] = p12
    })
    local u18 = u4("MatchEndSummaryApp", u11, {
        ["WinningTeamId"] = 0,
        ["ClanContributionEarned"] = 100,
        ["NewLeaderboardPosition"] = 12673,
        ["PreviousLeaderboardPosition"] = 63864,
        ["RankChangeData"] = v13,
        ["MatchExperienceEarned"] = {
            ["startingExperience"] = 5000,
            ["totalExperienceEarned"] = 3100,
            ["reasons"] = {
                {
                    ["experience"] = 900,
                    ["name"] = "Victory"
                },
                {
                    ["experience"] = 200,
                    ["name"] = "Game Finish"
                },
                {
                    ["experience"] = 2000,
                    ["name"] = "Battle Pass XP Bonus"
                }
            }
        },
        ["BedCoinsEarned"] = {
            ["matchAmountEarned"] = 100,
            ["dailyAmountEarned"] = 100,
            ["eligible"] = true,
            ["reachedTotalCap"] = false
        },
        ["TrackedStats"] = v14,
        ["PlayerHighlights"] = v15
    }, {}, {
        ["Parent"] = p12
    })
    return function() --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u18
            [3] = u16
            [4] = u17
        --]]
        u3.unmount(u18)
        u3.unmount(u16)
        u3.unmount(u17)
    end
end