-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local MaxPriorityQueue = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "datastructures", "out").MaxPriorityQueue;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "UiQueueManagerController";
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
    -- upvalues: KnitController (copy), MaxPriorityQueue (copy)
    KnitController.constructor(p3);
    p3.Name = "UiQueueManagerController";
    p3.queueDelayTime = 1;
    p3.initFinished = false;
    p3.uiQueue = MaxPriorityQueue.new();
end;

function u1.KnitStart(u4) -- Line: 30
    -- upvalues: KnitController (copy), ClientSyncEvents (copy)
    KnitController.KnitStart(u4);
    ClientSyncEvents.AppClose:connect(function(p5) -- Line: 32
        -- upvalues: u4 (copy)
        if p5.appId ~= u4.activeAppId then
            return nil;
        end;

        u4.activeAppId = nil;
        u4:mountNextUI();
    end);
    task.delay(u4.queueDelayTime, function() -- Line: 41
        -- upvalues: u4 (copy)
        local v6 = u4.uiQueue:PopElement();

        if v6 then
            u4:mountApp(v6.Value);
        end;

        u4.initFinished = true;
    end);
end;

function u1.getActiveAppId(p7) -- Line: 49
    return p7.activeAppId;
end;

function u1.queueApp(p8, p9) -- Line: 52
    if p8.initFinished and p8.activeAppId == nil then
        p8:mountApp(p9);

        return nil;
    end;

    local v10 = {
        app = p9.app,
        props = p9.props
    };
    local priority = p9.priority;
    p8.uiQueue:InsertWithPriority(v10, priority == nil and 0 or priority);
end;

function u1.mountNextUI(p11) -- Line: 70
    local v12 = p11.uiQueue:PopElement();

    if v12 ~= nil then
        v12 = v12.Value;
    end;

    if v12 then
        p11:mountApp(v12);
    end;
end;

function u1.mountApp(p13, p14) -- Line: 80
    -- upvalues: Flamework (copy), Players (copy)
    local shouldDisplay = p14.shouldDisplay;

    if shouldDisplay then
        local shouldDisplay2 = p14.shouldDisplay;

        if shouldDisplay2 ~= nil then
            shouldDisplay2 = shouldDisplay2();
        end;

        shouldDisplay = not shouldDisplay2;
    end;

    if shouldDisplay then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(p14.app, p14.props, nil, Players.LocalPlayer:WaitForChild("PlayerGui"));

    if type(p14.app) == "string" then
        p13.activeAppId = p14.app;

        return;
    end;

    p13.activeAppId = p14.app.appId;
end;

KnitClient.CreateController(u1.new());

return nil;