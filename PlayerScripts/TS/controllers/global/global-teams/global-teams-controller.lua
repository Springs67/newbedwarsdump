-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local GlobalTeamEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-event-meta").GlobalTeamEvents;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "GlobalTeamsController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 19
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "GlobalTeamsController";
    p3.localEventDataMap = {};
    p3.collectedPointsDuringMatch = 0;
    p3.timedGoalPointsCollectedDuringMatch = {};
end;

function u1.KnitStart(u4) -- Line: 30
    -- upvalues: KnitController (copy), default (copy), ClientStore (copy)
    KnitController.KnitStart(u4);
    default.Client:Get("GlobalTeamScoresUpdatedServerToClient"):Connect(function(p5) -- Line: 33
        -- upvalues: u4 (copy), ClientStore (ref)
        u4.localEventDataMap[p5.globalTeamEventKey] = p5.globalTeamEventData;
        ClientStore:dispatch({
            type = "SetEventGlobalTeamDataSingle",
            key = p5.globalTeamEventKey,
            data = p5.globalTeamEventData
        });
    end);
    default.Client:Get("GlobalTeamAddPointsToPlayerProfile"):Connect(function(u6) -- Line: 45
        -- upvalues: u4 (copy)
        task.delay(1.2, function() -- Line: 46
            -- upvalues: u4 (ref), u6 (copy)
            local v7 = u4;
            v7.collectedPointsDuringMatch = v7.collectedPointsDuringMatch + u6.points;
        end);
    end);
    default.Client:Get("GlobalTeamAddTimedGoalPointsToPlayerProfile"):Connect(function(u8) -- Line: 50
        -- upvalues: u4 (copy)
        task.delay(1.2, function() -- Line: 51
            -- upvalues: u4 (ref), u8 (copy)
            u4.timedGoalPointsCollectedDuringMatch[u8.timedGoalKey] = u8.newPoints;
        end);
    end);
    default.Client:Get("SendGlobalTeamKey"):Connect(function(p9) -- Line: 58
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "SetEventGlobalTeamKeySingle",
            key = p9.globalTeamEventKey,
            data = p9.globalTeamKey
        });
    end);
end;

function u1.getLocalGlobalEventData(p10, p11) -- Line: 67
    return p10.localEventDataMap[p11];
end;

function u1.getLocalGlobalTeamScore(p12, p13, p14) -- Line: 72
    -- upvalues: GlobalTeamEvents (copy)
    local v15 = GlobalTeamEvents[p13];

    if not v15 then
        return nil;
    end;

    local v16 = p12:getLocalGlobalEventData(p13);

    if not v16 then
        return nil;
    end;

    if not v15.useCombinedTeamScoresForRewards then
        local v17 = v16.globalTeams[p14];

        if v17 ~= nil then
            v17 = v17.score;
        end;

        return v17;
    end;

    local u18 = 0;

    local function _(p19) -- Line: 84
        -- upvalues: u18 (ref)
        u18 = u18 + p19.score;
    end;

    for _, v in v16.globalTeams do
        u18 = u18 + v.score;
    end;

    return u18;
end;

function u1.getLocalGlobalTeamTimedGoalScore(p20, p21, p22, p23) -- Line: 101
    -- upvalues: GlobalTeamEvents (copy)
    if not GlobalTeamEvents[p21] then
        return nil;
    end;

    local v24 = p20:getLocalGlobalEventData(p21);

    if not v24 then
        return nil;
    end;

    local v25 = v24.globalTeams[p22];

    if v25 and v25.timedGoalsData then
        return v25.timedGoalsData[p23];
    end;

    return nil;
end;

function u1.getCollectedPointsDuringMatch(p26) -- Line: 120
    return p26.collectedPointsDuringMatch;
end;

KnitClient.CreateController(u1.new());

return nil;