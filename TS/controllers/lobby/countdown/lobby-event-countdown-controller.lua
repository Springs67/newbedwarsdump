-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local StringUtil = v1.StringUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local EventType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType;
local EventUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "LobbyEventCountdownController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 24
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 28
    -- upvalues: KnitController (copy), EventType (copy), EventMeta (copy), EventUtil (copy)
    KnitController.constructor(p4);
    p4.Name = "LobbyEventCountdownController";
    p4.shouldActive = true;
    p4.eventType = EventType.PENGUIN_CATCHING_LOBBY_EVENT;
    p4.eventMeta = EventMeta[p4.eventType];
    p4.startTime = p4.eventMeta.startDate;
    p4.endTime = p4.eventMeta.endDate;
    p4.eventActive = EventUtil.isEventRunning(p4.eventType);
    p4.eventName = p4.eventMeta.name;
    p4.nextEventTime = p4.startTime;
end;

function u2.KnitStart(u5) -- Line: 40
    -- upvalues: KnitController (copy), EventMeta (copy), EventType (copy), PlaceUtil (copy), Workspace (copy), default (copy), WatchCollectionTag (copy)
    KnitController.KnitStart(u5);

    if not EventMeta[EventType.PENGUIN_CATCHING_LOBBY_EVENT].active then
        return nil;
    end;

    if not PlaceUtil.isLobbyServer() then
        return nil;
    end;

    if not u5.shouldActive then
        return nil;
    end;

    if os.time() > u5.endTime then
        return nil;
    end;

    local v6 = Workspace:GetAttribute(u5.eventType);

    if v6 ~= 0 and (v6 == v6 and v6) then
        u5.nextEventTime = v6;
    end;

    default.Client:Get("NextMeteorScheduled"):Connect(function(p7) -- Line: 59
        -- upvalues: u5 (copy)
        u5.nextEventTime = p7.startTime;
    end);
    Workspace:GetAttributeChangedSignal(u5.eventType):Connect(function(p8) -- Line: 62
        -- upvalues: Workspace (ref), u5 (copy)
        local v9 = Workspace:GetAttribute(u5.eventType);
        u5.nextEventTime = v9 == nil and 0 or v9;
    end);
    WatchCollectionTag("event-countdown-board", function(p10) -- Line: 69
        -- upvalues: u5 (copy)
        local CountdownPart = p10:WaitForChild("CountdownPart", 3);

        if CountdownPart ~= nil then
            CountdownPart = CountdownPart:WaitForChild("SurfaceGui", 3);

            if CountdownPart ~= nil then
                CountdownPart = CountdownPart:WaitForChild("CountdownText", 3);
            end;
        end;

        local TitlePart = p10:WaitForChild("TitlePart", 3);

        if TitlePart ~= nil then
            TitlePart = TitlePart:WaitForChild("SurfaceGui", 3);

            if TitlePart ~= nil then
                TitlePart = TitlePart:WaitForChild("TitleText", 3);
            end;
        end;

        local eventNamePart = p10:WaitForChild("eventNamePart", 3);

        if eventNamePart ~= nil then
            eventNamePart = eventNamePart:WaitForChild("SurfaceGui", 3);

            if eventNamePart ~= nil then
                eventNamePart = eventNamePart:WaitForChild("TitleText", 3);
            end;
        end;

        if eventNamePart then
            eventNamePart.Text = u5.eventName;
        end;

        if not (CountdownPart and TitlePart) then
            return nil;
        end;

        TitlePart.Text = "Next Penguin Event";
        local UIGradient = TitlePart:FindFirstChild("UIGradient");

        if UIGradient then
            UIGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 102, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 242, 214)) });
        end;

        task.spawn(function() -- Line: 105
            -- upvalues: u5 (ref), CountdownPart (copy), eventNamePart (copy), TitlePart (copy)
            if os.time() > u5.startTime and os.time() < u5.endTime then
                u5.eventActive = true;
            elseif os.time() > u5.endTime then
                CountdownPart.Active = false;
                CountdownPart:Destroy();
                local v11 = eventNamePart;

                if v11 ~= nil then
                    v11:Destroy();
                end;

                TitlePart.Active = false;
                TitlePart:Destroy();

                return nil;
            end;

            while true do
                if os.time() > u5.startTime and u5.eventActive == false then
                    u5.eventActive = true;
                    TitlePart.Text = "Next Penguin Event";
                end;

                if os.time() > u5.endTime then
                    CountdownPart.Active = false;
                    CountdownPart:Destroy();
                    TitlePart.Active = false;
                    TitlePart:Destroy();
                    local v12 = eventNamePart;

                    if v12 ~= nil then
                        v12:Destroy();

                        return;
                    end;

                    break;
                end;

                CountdownPart.Text = u5:getTime(u5.nextEventTime, "");
                local v13 = task.wait(1);

                if v13 == 0 or (v13 ~= v13 or not v13) then
                    break;
                end;
            end;
        end);
    end);
end;

function u2.getTime(p14, p15, p16) -- Line: 143
    -- upvalues: StringUtil (copy)
    local v17 = p15 - os.time();
    local v18 = math.max(0, v17);

    if v18 == 0 then
        return p16;
    end;

    return StringUtil.formatCountdownTime(v18, {
        days = true,
        hours = true,
        seperator = " : "
    });
end;

function u2.onEventStart(p19) -- Line: 154
end;

KnitClient.CreateController(u2.new());

return nil;