-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local Signal = v1.Signal;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local LoggerProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local EventApp = RuntimeLib.import(script, script.Parent.Parent.Parent, "lobby", "game-event", "event-app").EventApp;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "EventController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 25
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 29
    -- upvalues: KnitController (copy), default (copy), LoggerProvider (copy)
    KnitController.constructor(p6);
    p6.Name = "EventController";
    p6.eventRemotes = default.Client:GetNamespace("Event");
    p6.eventProfileCreatedRemote = default.Client:Get("EventProfileCreated");
    p6.logger = LoggerProvider.getLogger("EventController");
end;

function u4.KnitStart(u7) -- Line: 36
    -- upvalues: KnitController (copy), ClientStore (copy), u2 (copy), Players (copy), KnitClient (copy), EventApp (copy)
    KnitController.KnitStart(u7);
    u7.eventRemotes:Get("SendAllEventData"):Connect(function(p8) -- Line: 39
        -- upvalues: u7 (copy), ClientStore (ref)
        u7.logger:Debug("[EventController] SendAllEventData", p8);
        ClientStore:dispatch({
            type = "SetEventDataAll",
            eventData = p8
        });
    end);
    u7.eventRemotes:Get("SendEventDataUpdate"):Connect(function(p9, p10) -- Line: 46
        -- upvalues: u7 (copy), u2 (ref), ClientStore (ref)
        u7.logger:Debug("[EventController] Received event data: " .. u2(p10), p9);
        ClientStore:dispatch({
            type = "SetSpecificEventData",
            eventType = p9,
            data = p10
        });
    end);
    u7.eventRemotes:Get("SendEventCurrencyUpdate"):Connect(function(p11, p12) -- Line: 54
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "SetSpecificEventCurrency",
            currencyType = p11,
            data = p12
        });
    end);
    u7.eventProfileCreatedRemote:Connect(function(p13) -- Line: 61
        -- upvalues: u7 (copy), Players (ref), KnitClient (ref), EventApp (ref)
        if not u7:isEventActive(p13.event) then
            return nil;
        end;

        if Players.LocalPlayer:GetAttribute("FirstTimePlayer") == nil then
            Players.LocalPlayer:GetAttributeChangedSignal("FirstTimePlayer"):Wait();
        end;

        if Players.LocalPlayer:GetAttribute("HideOtherPopupsForRental") == nil then
            Players.LocalPlayer:GetAttributeChangedSignal("HideOtherPopupsForRental"):Wait();
        end;

        if Players.LocalPlayer:GetAttribute("FirstTimePlayer") ~= true and Players.LocalPlayer:GetAttribute("HideOtherPopupsForRental") ~= true then
            KnitClient.Controllers.UiQueueManagerController:queueApp({
                priority = 2,
                app = {
                    appId = "EventApp",
                    app = EventApp
                },
                props = {
                    event = p13.event
                }
            });
        end;
    end);
end;

function u4.waitForEventData(p14, u15) -- Line: 85
    -- upvalues: u3 (copy), Signal (copy), ClientStore (copy)
    local v16 = u3.new();
    local u17 = Signal.new();
    local u21 = ClientStore.changed:connect(function(p18, p19) -- Line: 88
        -- upvalues: u15 (copy), u17 (copy)
        local v20 = p18.Event.profileData.events[u15];

        if v20 then
            u17:Fire(v20);
        end;
    end);
    v16:GiveTask(function() -- Line: 94
        -- upvalues: u17 (copy)
        u17:DisconnectAll();
    end);
    v16:GiveTask(u17);
    v16:GiveTask(function() -- Line: 98
        -- upvalues: u21 (copy)
        u21:disconnect();
    end);
    local v22 = ClientStore:getState().Event.profileData.events[u15];

    if v22 then
        v16:DoCleaning();

        return v22;
    end;

    local v23 = u17:Wait();
    v16:DoCleaning();

    return v23;
end;

function u4.waitForEventDataAsync(p24, u25) -- Line: 110
    -- upvalues: u3 (copy), Signal (copy), ClientStore (copy), RuntimeLib (copy)
    local u26 = u3.new();
    local u27 = Signal.new();
    local u31 = ClientStore.changed:connect(function(p28, p29) -- Line: 113
        -- upvalues: u25 (copy), u27 (copy)
        local v30 = p28.Event.profileData.events[u25];

        if v30 then
            u27:Fire(v30);
        end;
    end);
    u26:GiveTask(function() -- Line: 119
        -- upvalues: u27 (copy)
        u27:DisconnectAll();
    end);
    u26:GiveTask(u27);
    u26:GiveTask(function() -- Line: 123
        -- upvalues: u31 (copy)
        u31:disconnect();
    end);
    local u32 = ClientStore:getState().Event.profileData.events[u25];

    if u32 then
        u26:DoCleaning();

        return RuntimeLib.Promise.new(function(p33) -- Line: 129
            -- upvalues: u32 (copy)
            return p33(u32);
        end);
    end;

    local v34 = u27:WaitPromise();
    v34:andThen(function() -- Line: 134
        -- upvalues: u26 (copy)
        u26:DoCleaning();
    end);

    return v34;
end;

function u4.getAllEventData(p35) -- Line: 140
    -- upvalues: ClientStore (copy)
    return ClientStore:getState().Event.profileData;
end;

function u4.getEventData(p36, p37) -- Line: 143
    -- upvalues: ClientStore (copy)
    return ClientStore:getState().Event.profileData.events[p37];
end;

function u4.isEventActive(p38, p39) -- Line: 146
    -- upvalues: EventMeta (copy)
    local v40 = EventMeta[p39];
    local active = EventMeta[p39].active;

    if active then
        if os.time() >= v40.startDate then
            active = os.time() <= v40.endDate;
        else
            active = false;
        end;
    end;

    return active;
end;

KnitClient.CreateController(u4.new());

return nil;