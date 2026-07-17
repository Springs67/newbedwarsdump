-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getCheckInSystemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "checkin-system", "checkin-system-meta").getCheckInSystemMeta;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local EventUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "EventAutoCheckinController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 20
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "EventAutoCheckinController";
end;

function u1.KnitStart(u4) -- Line: 28
    -- upvalues: KnitController (copy), KnitClient (copy), MatchState (copy), ClientSyncEvents (copy)
    KnitController.KnitStart(u4);

    if KnitClient.Controllers.MatchController:getMatchState() == MatchState.RUNNING then
        u4:logAutoCheckIn();

        return;
    end;

    ClientSyncEvents.MatchStateChange:connect(function(p5) -- Line: 34
        -- upvalues: MatchState (ref), u4 (copy)
        if p5.matchState ~= MatchState.RUNNING then
            return nil;
        end;

        u4:logAutoCheckIn();
    end);
end;

function u1.logAutoCheckIn(p6) -- Line: 42
    -- upvalues: EventUtil (copy), EventMeta (copy), getCheckInSystemMeta (copy), KnitClient (copy)
    local function _(p7) -- Line: 44
        -- upvalues: EventMeta (ref), getCheckInSystemMeta (ref), KnitClient (ref)
        local checkInSystem = EventMeta[p7].checkInSystem;

        if not checkInSystem then
            return nil;
        end;

        local v8 = getCheckInSystemMeta(checkInSystem);

        if v8 ~= nil then
            v8 = v8.autoCheckinOnMatchStart;
        end;

        if not v8 then
            return nil;
        end;

        KnitClient.Controllers.CheckinController:recordCheckIn(checkInSystem);
    end;

    for i, v in EventUtil.getActiveEvents() do
        local _ = i - 1;
        local checkInSystem = EventMeta[v].checkInSystem;

        if checkInSystem then
            local v9 = getCheckInSystemMeta(checkInSystem);

            if v9 ~= nil then
                v9 = v9.autoCheckinOnMatchStart;
            end;

            if v9 then
                KnitClient.Controllers.CheckinController:recordCheckIn(checkInSystem);
            end;
        end;
    end;
end;

KnitClient.CreateController(u1.new());

return nil;