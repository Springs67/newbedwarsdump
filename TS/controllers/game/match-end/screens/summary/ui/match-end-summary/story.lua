-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local RankDivision = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-division").RankDivision;
local TrackType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking").TrackType;
local StatTrackingUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking-util").StatTrackingUtil;
local LobbyControlsWrapper = RuntimeLib.import(script, script.Parent.Parent.Parent, "lobby-controls", "ui", "lobby-controls").LobbyControlsWrapper;
local MatchEndBackgroundWrapper = RuntimeLib.import(script, script.Parent.Parent.Parent, "lobby-controls", "ui", "match-end-background").MatchEndBackgroundWrapper;
local MatchEndSummaryAppWrapper = RuntimeLib.import(script, script.Parent.Parent, "match-end-summary").MatchEndSummaryAppWrapper;

return function(p2) -- Line: 13
    -- upvalues: ClientStore (copy), OfflinePlayerUtil (copy), RankDivision (copy), StatTrackingUtil (copy), TrackType (copy), CreateRoduxApp (copy), LobbyControlsWrapper (copy), MatchEndBackgroundWrapper (copy), MatchEndSummaryAppWrapper (copy), u1 (copy)
    ClientStore:dispatch({
        type = "GameSetSpectator",
        spectating = true,
        spectatingPlayer = OfflinePlayerUtil.Dummy.SnickTrix
    });
    ClientStore:dispatch({
        type = "SetMatchEndSummaryVisible",
        visible = true
    });
    local v3 = {
        rpDelta = -10,
        rankVisible = true,
        matchesPlayed = 10,
        demotionShieldActive = true,
        oldDivision = {
            rankPoints = 10,
            division = RankDivision.PLATINUM_3
        },
        newDivision = {
            rankPoints = 20,
            division = RankDivision.PLATINUM_2
        }
    };
    local DUMMY_TRACKED_STATS = StatTrackingUtil.DUMMY_TRACKED_STATS;
    local v4 = {
        {
            amount = 33,
            trackType = TrackType.BLOCKBREAKS,
            player = OfflinePlayerUtil.Dummy.Asen
        },
        {
            amount = 420,
            trackType = TrackType.DAMAGE,
            player = OfflinePlayerUtil.Dummy.oiogy
        },
        {
            amount = 7,
            trackType = TrackType.KILLS,
            player = OfflinePlayerUtil.Dummy.Bryan3838
        }
    };
    local u5 = CreateRoduxApp("LobbyControls", LobbyControlsWrapper, {}, {}, {
        Parent = p2
    });
    local u6 = CreateRoduxApp("MatchEndDarkBackground", MatchEndBackgroundWrapper, {}, {}, {
        Parent = p2
    });
    local u7 = CreateRoduxApp("MatchEndSummaryApp", MatchEndSummaryAppWrapper, {
        WinningTeamId = 0,
        ClanContributionEarned = 100,
        NewLeaderboardPosition = 12673,
        PreviousLeaderboardPosition = 63864,
        RankChangeData = v3,
        MatchExperienceEarned = {
            startingExperience = 5000,
            totalExperienceEarned = 3100,
            reasons = { {
                    experience = 900,
                    name = "Victory"
                }, {
                    experience = 200,
                    name = "Game Finish"
                }, {
                    experience = 2000,
                    name = "Battle Pass XP Bonus"
                } }
        },
        BedCoinsEarned = {
            matchAmountEarned = 100,
            dailyAmountEarned = 100,
            eligible = true,
            reachedTotalCap = false
        },
        TrackedStats = DUMMY_TRACKED_STATS,
        PlayerHighlights = v4
    }, {}, {
        Parent = p2
    });

    return function() -- Line: 89
        -- upvalues: u1 (ref), u7 (copy), u5 (copy), u6 (copy)
        u1.unmount(u7);
        u1.unmount(u5);
        u1.unmount(u6);
    end;
end;