-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AddMatchEventCountdownZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").AddMatchEventCountdownZap;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "MatchEventController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 22
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "MatchEventController";
    p3.activeCountdowns = {};
end;

function u1.KnitStart(u4) -- Line: 27
    -- upvalues: KnitController (copy), AddMatchEventCountdownZap (copy)
    KnitController.KnitStart(u4);
    AddMatchEventCountdownZap.On(function(p5, p6, p7, p8, p9, p10, p11, p12) -- Line: 29
        -- upvalues: u4 (copy)
        u4:addMatchEventCountdown({
            id = p5,
            image = p6,
            name = p7,
            time = p8,
            isOnTopHud = p9,
            themeColor = p10,
            textColor = p11,
            textTransparency = p12
        });
    end);
end;

function u1.addMatchEventCountdown(u13, u14) -- Line: 43
    -- upvalues: ClientStore (copy), Workspace (copy)
    ClientStore:dispatch({
        type = "GameAddMatchEvent",
        matchEvent = u14
    });
    table.insert(u13.activeCountdowns, u14.id);
    local v15 = u14.time - Workspace:GetServerTimeNow();
    task.delay(v15, function() -- Line: 53
        -- upvalues: ClientStore (ref), u14 (copy), u13 (copy)
        local v16 = ClientStore:getState().Game.matchEvents[u14.id];

        if v16 ~= nil then
            v16 = v16.time;
        end;

        if v16 == u14.time then
            u13:removeMatchEventCountdown(u14.id);
        end;
    end);

    return nil;
end;

function u1.removeMatchEventCountdown(p17, u18) -- Line: 67
    -- upvalues: ClientStore (copy)
    ClientStore:dispatch({
        type = "GameRemoveMatchEvent",
        matchEventId = u18
    });

    local function _(p19) -- Line: 73
        -- upvalues: u18 (copy)
        return p19 == u18;
    end;

    local v20 = -1;

    for i, v in p17.activeCountdowns do
        local _ = i - 1;

        if v == u18 == true then
            v20 = i - 1;
            break;
        end;
    end;

    table.remove(p17.activeCountdowns, v20 + 1);
end;

function u1.removeAllMatchEventCountdowns(u21) -- Line: 88
    local function _(p22) -- Line: 90
        -- upvalues: u21 (copy)
        u21:removeMatchEventCountdown(p22);
    end;

    for i, v in u21.activeCountdowns do
        local _ = i - 1;
        u21:removeMatchEventCountdown(v);
    end;
end;

KnitClient.CreateController(u1.new());

return nil;