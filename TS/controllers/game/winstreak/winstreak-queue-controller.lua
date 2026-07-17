-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local VersusHud = RuntimeLib.import(script, script.Parent, "ui", "versus-hud").VersusHud;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "WinstreakQueueController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 26
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "WinstreakQueueController";
    p5.tree = nil;
end;

function u3.KnitStart(u6) -- Line: 35
    -- upvalues: KnitController (copy), KnitClient2 (copy), QueueType (copy), default (copy), MatchState (copy), ClientSyncEvents (copy), u2 (copy)
    KnitController.KnitStart(u6);
    KnitClient2.Controllers.MatchController:getQueueTypeAsync():andThen(function(u7) -- Line: 38
        -- upvalues: QueueType (ref), default (ref), KnitClient2 (ref), MatchState (ref), u6 (copy)
        if u7 ~= QueueType.WINSTREAK_1v1 and u7 ~= QueueType.BRIDGE_DUEL then
            return nil;
        end;

        default.Client:Get("TeamsUpdateEvent"):Connect(function(p8) -- Line: 42
            -- upvalues: KnitClient2 (ref), MatchState (ref), default (ref), u7 (copy), QueueType (ref), u6 (ref)
            if KnitClient2.Controllers.MatchController:getMatchState() == MatchState.RUNNING then
                return nil;
            end;

            default.Client:Get("RequestWinstreakQueueVersusBoard"):CallServerAsync():andThen(function(p9) -- Line: 47
                -- upvalues: u7 (ref), QueueType (ref), u6 (ref)
                if u7 == QueueType.BRIDGE_DUEL then
                    u6:displayVersusHudFromTeams(p9.teamA, p9.teamB, true);

                    return;
                end;

                u6:displayVersusHudFromTeams(p9.teamA, p9.teamB);
            end);
        end);
    end);
    ClientSyncEvents.MatchStateChange:connect(function(p10) -- Line: 58
        -- upvalues: MatchState (ref), u6 (copy), u2 (ref)
        if p10.matchState == MatchState.RUNNING and u6.tree then
            u2.unmount(u6.tree);
        end;
    end);
end;

function u3.displayVersusHudFromTeams(p11, p12, p13, p14) -- Line: 66
    -- upvalues: OfflinePlayerUtil (copy), GamePlayerUtil (copy)
    local v15 = nil;
    local v16;

    if p12 then
        local v17;

        if p12.offlinePlayer then
            local v18 = OfflinePlayerUtil.getPlayer(p12.offlinePlayer);

            if v18 then
                v17 = GamePlayerUtil.getGamePlayer(v18):getDisplayName();
            else
                v17 = p12.offlinePlayer.displayName;
            end;
        else
            v17 = "";
        end;

        v16 = {
            Name = v17,
            offlinePlayer = p12.offlinePlayer,
            teamColor = p12.teamColor
        };
        local v19;

        if p14 then
            v19 = nil;
        else
            v19 = p12.stat;
        end;

        v16.stat = v19;
    else
        v16 = nil;
    end;

    if p13 then
        local v20;

        if p13.offlinePlayer then
            local v21 = OfflinePlayerUtil.getPlayer(p13.offlinePlayer);

            if v21 then
                v20 = GamePlayerUtil.getGamePlayer(v21):getDisplayName();
            else
                v20 = p13.offlinePlayer.displayName;
            end;
        else
            v20 = "";
        end;

        v15 = {
            Name = v20,
            offlinePlayer = p13.offlinePlayer,
            teamColor = p13.teamColor
        };
        local v22;

        if p14 then
            v22 = nil;
        else
            v22 = p13.stat;
        end;

        v15.stat = v22;
    end;

    p11:displayVersusHud(v16, v15);
end;

function u3.displayVersusHud(p23, p24, p25) -- Line: 97
    -- upvalues: u2 (copy), VersusHud (copy), Players (copy)
    if p23.tree then
        u2.update(p23.tree, u2.createElement(VersusHud, {
            TeamA = p24,
            TeamB = p25
        }));

        return;
    end;

    p23.tree = u2.mount(u2.createElement(VersusHud, {
        TeamA = p24,
        TeamB = p25
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
end;

KnitClient.CreateController(u3.new());

return nil;