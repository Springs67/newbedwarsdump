-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local MatchEndScreenController = RuntimeLib.import(script, script.Parent.Parent.Parent, "match-end-screen-controller").MatchEndScreenController;
local MatchEndStatsWrapper = RuntimeLib.import(script, script.Parent, "ui", "match-end-stats").MatchEndStatsWrapper;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "StatsScreenController";
    end,

    __index = MatchEndScreenController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
    -- upvalues: MatchEndScreenController (copy)
    MatchEndScreenController.constructor(p4, 5);
    p4.Name = "StatsScreenController";
end;

function u2.KnitStart(u5) -- Line: 27
    -- upvalues: MatchEndScreenController (copy), default (copy)
    MatchEndScreenController.KnitStart(u5);
    default.Client:OnEvent("MatchEndEvent", function(p6) -- Line: 29
        -- upvalues: u5 (copy), default (ref)
        u5.trackedStats = default.Client:Get("GetMatchStats"):CallServer();
    end);
end;

function u2.renderScreen(p7) -- Line: 34
    -- upvalues: CreateRoduxApp (copy), MatchEndStatsWrapper (copy)
    if not p7.matchEndEvent then
        return nil;
    end;

    if not p7.tree then
        p7.tree = CreateRoduxApp("MatchEndStats", MatchEndStatsWrapper, {
            PreviousLeaderboardPosition = p7.matchEndEvent.previousLeaderboardPosition,
            NewLeaderboardPosition = p7.matchEndEvent.newLeaderboardPosition,
            TrackedStats = p7.trackedStats,
            WinningTeamId = p7.matchEndEvent.winningTeamId
        });
    end;
end;

function u2.unmountScreen(p8) -- Line: 47
    -- upvalues: u1 (copy)
    if p8.tree then
        u1.unmount(p8.tree);
        p8.tree = nil;
    end;
end;

KnitClient.CreateController(u2.new());

return nil;