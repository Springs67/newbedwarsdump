-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local StatTrackingUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking-util").StatTrackingUtil;
local LobbyControlsWrapper = RuntimeLib.import(script, script.Parent.Parent.Parent, "lobby-controls", "ui", "lobby-controls").LobbyControlsWrapper;
local MatchEndStatsWrapper = RuntimeLib.import(script, script.Parent, "match-end-stats").MatchEndStatsWrapper;

return function(p2) -- Line: 9
    -- upvalues: StatTrackingUtil (copy), ClientStore (copy), CreateRoduxApp (copy), MatchEndStatsWrapper (copy), LobbyControlsWrapper (copy), u1 (copy)
    local DUMMY_TRACKED_STATS = StatTrackingUtil.DUMMY_TRACKED_STATS;
    ClientStore:dispatch({
        type = "SetMatchEndSummaryVisible",
        visible = true
    });
    local u3 = CreateRoduxApp("MatchEndStatsApp", MatchEndStatsWrapper, {
        WinningTeamId = 0,
        NewLeaderboardPosition = 12673,
        PreviousLeaderboardPosition = 63864,
        DisableAnimation = true,
        TrackedStats = DUMMY_TRACKED_STATS
    }, {}, {
        Parent = p2
    });
    local u4 = CreateRoduxApp("LobbyControls", LobbyControlsWrapper, {}, {}, {
        Parent = p2
    });

    return function() -- Line: 34
        -- upvalues: u1 (ref), u3 (copy), u4 (copy)
        u1.unmount(u3);
        u1.unmount(u4);
    end;
end;