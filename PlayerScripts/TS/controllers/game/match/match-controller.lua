-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "MatchController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(u4) -- Line: 26
    -- upvalues: KnitController (copy), u1 (copy), default (copy), PlaceUtil (copy), ClientStore (copy), ClientSyncEvents (copy)
    KnitController.constructor(u4);
    u4.Name = "MatchController";
    u4.customMatchSignal = u1.new();
    u4.queueTypeSignal = u1.new();
    u4.parties = {};
    default.Client:WaitFor("MatchStateEvent"):expect():Connect(function(u5, u6, u7) -- Line: 32
        -- upvalues: PlaceUtil (ref), ClientStore (ref), u4 (copy), ClientSyncEvents (ref)
        if PlaceUtil.isGameServer() then
            ClientStore:dispatch({
                type = "GameSetMatchState",
                matchState = u5
            });

            if u7 ~= nil then
                ClientStore:dispatch({
                    type = "GameSetStartTime",
                    startTime = u7
                });
            end;

            if u6 ~= nil then
                ClientStore:dispatch({
                    type = "SetCustomMatchData",
                    customMatch = u6
                });
            end;
        end;

        task.spawn(function() -- Line: 51
            -- upvalues: u4 (ref), u5 (copy), u6 (copy), ClientSyncEvents (ref), u7 (copy)
            u4.matchState = u5;
            u4.customMatch = u6;
            ClientSyncEvents.MatchStateChange:fire(u5, u7, u6);
            u4.customMatchSignal:Fire();
        end);
    end);
    default.Client:WaitFor("QueueTypeEvent"):expect():Connect(function(p8) -- Line: 58
        -- upvalues: u4 (copy), ClientStore (ref)
        u4.queueType = p8;
        ClientStore:dispatch({
            type = "GameSetQueueType",
            queueType = p8
        });
        u4.queueTypeSignal:Fire();
    end);
end;

function u2.KnitStart(u9) -- Line: 67
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u9);
    default.Client:WaitFor("MatchPartiesUpdate"):expect():Connect(function(p10) -- Line: 69
        -- upvalues: u9 (copy)
        if p10 then
            u9.parties = p10;
        end;
    end);
end;

u2.getQueueTypeAsync = RuntimeLib.async(function(p11) -- Line: 75
    if p11.queueType then
        return p11.queueType;
    end;

    p11.queueTypeSignal:Wait();

    return p11.queueType;
end);

function u2.getQueueType(p12) -- Line: 82
    return p12.queueType;
end;

function u2.getMatchState(p13) -- Line: 85
    return p13.matchState;
end;

u2.getCustomMatchConfigAsync = RuntimeLib.async(function(p14) -- Line: 88
    if p14.customMatch then
        return p14.customMatch;
    end;

    p14.customMatchSignal:Wait();

    return p14.customMatch;
end);

function u2.getCustomMatchConfig(p15) -- Line: 95
    return p15.customMatch;
end;

function u2.getParties(p16) -- Line: 98
    return p16.parties;
end;

function u2.getPlayerParty(p17, u18) -- Line: 101
    local parties = p17.parties;

    local function v22(p19) -- Line: 103
        -- upvalues: u18 (copy)
        local function _(p20) -- Line: 105
            -- upvalues: u18 (ref)
            return p20 == u18.UserId;
        end;

        local v21 = nil;

        for i, v in p19.members do
            local _ = i - 1;

            if v == u18.UserId == true then
                v21 = v;
                break;
            end;
        end;

        return v21 ~= nil;
    end;

    for i, v in parties do
        if v22(v, i - 1, parties) == true then
            return v;
        end;
    end;

    return nil;
end;

function u2.getQueueMeta(p23) -- Line: 130
    -- upvalues: getQueueMeta (copy)
    if p23.queueType then
        return getQueueMeta(p23.queueType);
    end;

    return nil;
end;

function u2.getGameType(p24) -- Line: 137
    -- upvalues: Workspace (copy)
    return Workspace:GetAttribute("GameType");
end;

KnitClient.CreateController(u2.new());

return nil;