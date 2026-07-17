-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local StringUtil = v1.StringUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local CollectionService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "EventCountdownController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "EventCountdownController";
    p4.shouldActive = false;
    p4.countdownTag = "event-countdown";
    p4.startTime = 1760133600;
    p4.endTime = 1760392800;
    p4.eventActive = false;
    p4.eventName = "Double Armor Trim Exp";
end;

function u2.KnitStart(u5) -- Line: 33
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), CollectionService (copy)
    KnitController.KnitStart(u5);

    if not u5.shouldActive then
        return nil;
    end;

    WatchCollectionTag("event-countdown-board", function(p6) -- Line: 38
        -- upvalues: u5 (copy)
        local CountdownPart = p6:WaitForChild("CountdownPart", 3);

        if CountdownPart ~= nil then
            CountdownPart = CountdownPart:WaitForChild("SurfaceGui", 3);

            if CountdownPart ~= nil then
                CountdownPart = CountdownPart:WaitForChild("CountdownText", 3);
            end;
        end;

        local TitlePart = p6:WaitForChild("TitlePart", 3);

        if TitlePart ~= nil then
            TitlePart = TitlePart:WaitForChild("SurfaceGui", 3);

            if TitlePart ~= nil then
                TitlePart = TitlePart:WaitForChild("TitleText", 3);
            end;
        end;

        local eventNamePart = p6:WaitForChild("eventNamePart", 3);

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

        task.spawn(function() -- Line: 69
            -- upvalues: u5 (ref), TitlePart (copy), CountdownPart (copy), eventNamePart (copy)
            if os.time() > u5.startTime and os.time() < u5.endTime then
                u5.eventActive = true;
                TitlePart.Text = "Event End In";
            elseif os.time() > u5.endTime then
                CountdownPart.Active = false;
                CountdownPart:Destroy();
                local v7 = eventNamePart;

                if v7 ~= nil then
                    v7:Destroy();
                end;

                TitlePart.Active = false;
                TitlePart:Destroy();

                return nil;
            end;

            while true do
                if os.time() > u5.startTime and u5.eventActive == false then
                    u5.eventActive = true;
                    TitlePart.Text = "Event End In";
                end;

                if os.time() > u5.endTime then
                    CountdownPart.Active = false;
                    CountdownPart:Destroy();
                    TitlePart.Active = false;
                    TitlePart:Destroy();
                    local v8 = eventNamePart;

                    if v8 ~= nil then
                        v8:Destroy();

                        return;
                    end;

                    break;
                end;

                local v9;

                if u5.eventActive then
                    v9 = u5.endTime;
                else
                    v9 = u5.startTime;
                end;

                CountdownPart.Text = u5:getTime(v9, "");
                local v10 = task.wait(1);

                if v10 == 0 or (v10 ~= v10 or not v10) then
                    break;
                end;
            end;
        end);
    end);
    WatchCollectionTag(u5.countdownTag, function(u11) -- Line: 108
        -- upvalues: CollectionService (ref), u5 (copy)
        task.spawn(function() -- Line: 109
            -- upvalues: CollectionService (ref), u5 (ref), u11 (copy)
            local v12 = CollectionService:GetTagged("event-countdown-title");

            if os.time() > u5.startTime and os.time() < u5.endTime then
                u5.eventActive = true;

                local function _(p13) -- Line: 113
                    p13.Text = "Event End In";
                end;

                for i, v in v12 do
                    local _ = i - 1;
                    v.Text = "Event End In";
                end;
            elseif os.time() > u5.endTime then
                u11.Active = false;
                u11:Destroy();

                local function _(p14) -- Line: 122
                    p14.Active = false;
                    p14:Destroy();
                end;

                for i, v in v12 do
                    local _ = i - 1;
                    v.Active = false;
                    v:Destroy();
                end;

                return nil;
            end;

            while true do
                if os.time() > u5.startTime and u5.eventActive == false then
                    u5.eventActive = true;

                    local function _(p15) -- Line: 135
                        p15.Text = "Event End In";
                    end;

                    for i, v in v12 do
                        local _ = i - 1;
                        v.Text = "Event End In";
                    end;
                end;

                if os.time() > u5.endTime then
                    u11.Active = false;
                    u11:Destroy();

                    local function _(p16) -- Line: 145
                        p16.Active = false;
                        p16:Destroy();
                    end;

                    for i, v in v12 do
                        local _ = i - 1;
                        v.Active = false;
                        v:Destroy();
                    end;

                    return;
                end;

                local v17;

                if u5.eventActive then
                    v17 = u5.endTime;
                else
                    v17 = u5.startTime;
                end;

                u11.Text = u5:getTime(v17, "");
                local v18 = task.wait(1);

                if v18 == 0 or (v18 ~= v18 or not v18) then
                    return;
                end;
            end;
        end);
    end);
end;

function u2.getTime(p19, p20, p21) -- Line: 162
    -- upvalues: StringUtil (copy)
    local v22 = p20 - os.time();
    local v23 = math.max(0, v22);

    if v23 == 0 then
        return p21;
    end;

    return StringUtil.formatCountdownTime(v23, {
        days = true,
        hours = true,
        seperator = " : "
    });
end;

function u2.onEventStart(p24) -- Line: 173
end;

KnitClient.CreateController(u2.new());

return nil;