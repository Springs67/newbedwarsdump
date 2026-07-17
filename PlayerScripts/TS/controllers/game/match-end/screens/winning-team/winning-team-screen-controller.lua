-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local MatchEndScreenController = RuntimeLib.import(script, script.Parent.Parent.Parent, "match-end-screen-controller").MatchEndScreenController;
local WinningTeamWrapper = RuntimeLib.import(script, script.Parent, "ui", "winning-team").WinningTeamWrapper;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "WinningTeamScreenController";
    end,

    __index = MatchEndScreenController
});
u2.__index = u2;

function u2.new(...) -- Line: 18
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 22
    -- upvalues: MatchEndScreenController (copy)
    MatchEndScreenController.constructor(p4, 1);
    p4.Name = "WinningTeamScreenController";
end;

function u2.KnitStart(p5) -- Line: 26
    -- upvalues: MatchEndScreenController (copy)
    MatchEndScreenController.KnitStart(p5);
end;

function u2.renderScreen(p6) -- Line: 29
    -- upvalues: CreateRoduxApp (copy), WinningTeamWrapper (copy)
    if not p6.matchEndEvent then
        return nil;
    end;

    p6.tree = CreateRoduxApp("WinningTeam", WinningTeamWrapper, {
        WinningTeamId = p6.matchEndEvent.winningTeamId,
        NewLeaderboardPos = p6.matchEndEvent.newLeaderboardPosition,
        PreviousLeaderboardPos = p6.matchEndEvent.previousLeaderboardPosition,
        CustomTitleMessage = p6.matchEndEvent.customTitleMessage
    });
end;

function u2.unmountScreen(p7) -- Line: 41
    -- upvalues: u1 (copy)
    if not p7.tree then
        return nil;
    end;

    u1.unmount(p7.tree);
end;

KnitClient.CreateController(u2.new());

return nil;