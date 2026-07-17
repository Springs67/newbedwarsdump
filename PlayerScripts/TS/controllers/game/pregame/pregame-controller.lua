-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local RankUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil;
local PregameCountdownWrapper = RuntimeLib.import(script, script.Parent, "ui", "pregame-countdown").PregameCountdownWrapper;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "PregameController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "PregameController";
end;

function u2.KnitStart(u5) -- Line: 30
    -- upvalues: ClientStore (copy), MatchState (copy), ClientSyncEvents (copy), KnitClient (copy), RankUtil (copy)
    ClientStore.changed:connect(function(p6, p7) -- Line: 31
        -- upvalues: MatchState (ref), u5 (copy)
        if p6.Game ~= p7.Game and p6.Game.matchState ~= MatchState.PRE then
            u5:unmount();
        end;
    end);
    ClientSyncEvents.MatchStateChange:connect(function(p8) -- Line: 38
        -- upvalues: MatchState (ref), KnitClient (ref), RankUtil (ref), u5 (copy)
        if p8.customMatch then
            return nil;
        end;

        if p8.matchState == MatchState.PRE then
            KnitClient.Controllers.MatchController:getQueueTypeAsync():andThen(function(p9) -- Line: 44
                -- upvalues: RankUtil (ref), u5 (ref)
                if p9 ~= RankUtil.activeRankMeta.queueType then
                    u5:mount();
                end;
            end);

            return;
        end;

        u5:unmount();
    end);
end;

function u2.mount(p10) -- Line: 55
    -- upvalues: CreateRoduxApp (copy), PregameCountdownWrapper (copy)
    p10:unmount();
    p10.tree = CreateRoduxApp("PregameCountdown", PregameCountdownWrapper);
end;

function u2.unmount(p11) -- Line: 59
    -- upvalues: u1 (copy)
    if p11.tree then
        u1.unmount(p11.tree);
        p11.tree = nil;
    end;
end;

KnitClient.CreateController(u2.new());

return nil;