-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local MatchEndScreensMeta = RuntimeLib.import(script, script.Parent, "match-end-screen-meta").MatchEndScreensMeta;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "MatchEndController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 25
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, ...) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5, ...);
    p5.Name = "MatchEndController";
    p5.currDisplayOrder = (1 / 0);
    p5.matchEndScreens = {};
    p5.currPlayingMatchEndScreens = {};
    p5.reachedMaxDisplayOrder = false;
end;

function u3.KnitStart(u6) -- Line: 37
    -- upvalues: default (copy), ClientStore (copy), MatchState (copy), KnitClient2 (copy)
    u6:setupIMatchEndScreens();
    default.Client:OnEvent("MatchEndEvent", function(p7) -- Line: 39
        -- upvalues: u6 (copy), ClientStore (ref), MatchState (ref), KnitClient2 (ref)
        if p7.cancelled then
            u6.currDisplayOrder = 1;
            u6.matchEndScreens = { { 0, 1 } };
        end;

        u6:startCurrDisplayOrder();
        ClientStore:dispatch({
            type = "GameSetMatchState",
            matchState = MatchState.POST
        });
        KnitClient2.Controllers.HotbarController:unmountHotbar();
    end);
end;

function u3.waitUntilDisplay(p8, p9) -- Line: 56
    -- upvalues: KnitClient2 (copy), getQueueMeta (copy)
    local v10 = KnitClient2.Controllers.MatchController:getQueueType();

    if v10 then
        local disabledMatchEndScreens = getQueueMeta(v10).disabledMatchEndScreens;

        if disabledMatchEndScreens ~= nil then
            disabledMatchEndScreens = table.find(disabledMatchEndScreens, p9) ~= nil;
        end;

        if disabledMatchEndScreens then
            return false;
        end;
    end;

    while table.find(p8.currPlayingMatchEndScreens, p9) == nil do
        wait(0.5);
    end;

    return true;
end;

function u3.getMatchScreensInDisplayOrder(p11, u12) -- Line: 79
    -- upvalues: MatchEndScreensMeta (copy)
    local v13 = p11.matchEndScreens[u12];

    if v13 ~= nil then
        local function _(p14) -- Line: 84
            -- upvalues: MatchEndScreensMeta (ref), u12 (copy)
            return MatchEndScreensMeta[p14].displayOrder == u12;
        end;

        local v15 = 0;
        v13 = {};

        for i, v in v13 do
            local _ = i - 1;

            if MatchEndScreensMeta[v].displayOrder == u12 == true then
                v15 = v15 + 1;
                v13[v15] = v;
            end;
        end;
    end;

    return v13;
end;

function u3.startCurrDisplayOrder(p16) -- Line: 102
    p16:startDisplayOrder(p16.currDisplayOrder);
end;

function u3.startDisplayOrder(u17, u18, u19) -- Line: 105
    -- upvalues: MatchEndScreensMeta (copy), ClientSyncEvents (copy)
    local v20 = u17:getMatchScreensInDisplayOrder(u18);
    u17:stopDisplayAllMatchEndScreens();
    u17.currDisplayOrder = u18;
    local v21 = u17:getMaxDisplayOrder();

    if v21 <= u17.currDisplayOrder then
        u17.reachedMaxDisplayOrder = true;
    end;

    if not v20 then
        if not u19 and u17.currDisplayOrder < v21 then
            u17.currDisplayOrder = u17.currDisplayOrder + 1;
            u17:startCurrDisplayOrder();
        end;

        return nil;
    end;

    local function v25(u22) -- Line: 121
        -- upvalues: MatchEndScreensMeta (ref), u17 (copy), ClientSyncEvents (ref), u19 (copy), u18 (copy)
        local v23 = MatchEndScreensMeta[u22];
        table.insert(u17.currPlayingMatchEndScreens, u22);
        ClientSyncEvents.MatchEndScreenStart:fire(u22);

        if not (u19 or v23.persistent) then
            local displaySecs = v23.displaySecs;
            task.delay(displaySecs == nil and 30 or displaySecs, function() -- Line: 133
                -- upvalues: u17 (ref), u18 (ref), u22 (copy)
                if u17.currDisplayOrder ~= u18 then
                    return nil;
                end;

                if u17:isMatchEndScreensComplete() or u17.reachedMaxDisplayOrder then
                    u17:stopDisplayMatchEndScreen(u22);

                    return;
                end;

                u17:stopDisplayMatchEndScreen(u22);
                local v24 = u17;
                v24.currDisplayOrder = v24.currDisplayOrder + 1;
                u17:startCurrDisplayOrder();
            end);
        end;
    end;

    for i, v in v20 do
        v25(v, i - 1, v20);
    end;
end;

function u3.stopDisplayAllMatchEndScreens(u26) -- Line: 151
    -- upvalues: MatchEndScreensMeta (copy)
    local function _(p27) -- Line: 153
        -- upvalues: MatchEndScreensMeta (ref)
        return not MatchEndScreensMeta[p27].persistent;
    end;

    local v28 = 0;
    local v29 = {};

    for i, v in u26.currPlayingMatchEndScreens do
        local _ = i - 1;

        if not MatchEndScreensMeta[v].persistent == true then
            v28 = v28 + 1;
            v29[v28] = v;
        end;
    end;

    local function _(p30) -- Line: 167
        -- upvalues: u26 (copy)
        u26:stopDisplayMatchEndScreen(p30);
    end;

    for i, v in v29 do
        local _ = i - 1;
        u26:stopDisplayMatchEndScreen(v);
    end;
end;

function u3.stopDisplayMatchEndScreen(p31, u32) -- Line: 174
    -- upvalues: ClientSyncEvents (copy)
    local function _(p33) -- Line: 177
        -- upvalues: u32 (copy)
        return p33 == u32;
    end;

    local v34 = -1;

    for i, v in p31.currPlayingMatchEndScreens do
        local _ = i - 1;

        if v == u32 == true then
            v34 = i - 1;
            break;
        end;
    end;

    table.remove(p31.currPlayingMatchEndScreens, v34 + 1);
    ClientSyncEvents.MatchEndScreenEnd:fire(u32);
end;

function u3.skipCurrDisplay(p35) -- Line: 192
    if not p35:getMatchScreensInDisplayOrder(p35.currDisplayOrder) then
        return nil;
    end;

    p35:stopDisplayAllMatchEndScreens();
    p35.currDisplayOrder = p35.currDisplayOrder + 1;
    p35:startCurrDisplayOrder();
end;

function u3.getMaxDisplayOrder(p36) -- Line: 202
    -- upvalues: u2 (copy)
    return math.max(unpack(u2.keys(p36.matchEndScreens)));
end;

function u3.isReachedMaxDisplayOrder(p37) -- Line: 205
    return p37.reachedMaxDisplayOrder;
end;

function u3.isMatchEndScreensComplete(p38) -- Line: 208
    -- upvalues: MatchEndScreensMeta (copy)
    local u39 = true;

    local function _(p40) -- Line: 211
        -- upvalues: MatchEndScreensMeta (ref), u39 (ref)
        if not MatchEndScreensMeta[p40].persistent then
            u39 = false;
        end;
    end;

    for i, v in p38.currPlayingMatchEndScreens do
        local _ = i - 1;

        if not MatchEndScreensMeta[v].persistent then
            u39 = false;
        end;
    end;

    return u39;
end;

function u3.setupIMatchEndScreens(u41) -- Line: 222
    -- upvalues: KnitClient2 (copy), getQueueMeta (copy), u2 (copy), MatchEndScreensMeta (copy), MapUtil (copy)
    task.spawn(function() -- Line: 223
        -- upvalues: KnitClient2 (ref), getQueueMeta (ref), u2 (ref), MatchEndScreensMeta (ref), u41 (copy), MapUtil (ref)
        local v42, u43 = KnitClient2.Controllers.MatchController:getQueueTypeAsync():await();

        if v42 then
            local u44 = getQueueMeta(u43);
            local v45 = {};
            local v46 = u2.entries(MatchEndScreensMeta);
            table.move(v46, 1, #v46, #v45 + 1, v45);

            local function v51(p47) -- Line: 231
                -- upvalues: u43 (copy), u44 (copy), u41 (ref), MapUtil (ref)
                local v48 = p47[1];
                local v49 = p47[2];

                if v49.enabledQueues and table.find(v49.enabledQueues, u43) == nil then
                    return nil;
                end;

                if v49.rankedOnly and not u44.rankCategory then
                    return nil;
                end;

                local disabledMatchEndScreens = u44.disabledMatchEndScreens;

                if disabledMatchEndScreens ~= nil then
                    disabledMatchEndScreens = table.find(disabledMatchEndScreens, v48) ~= nil;
                end;

                if disabledMatchEndScreens then
                    return nil;
                end;

                if v49.displayOrder < u41.currDisplayOrder then
                    u41.currDisplayOrder = v49.displayOrder;
                end;

                local v50 = MapUtil.getOrCreate(u41.matchEndScreens, v49.displayOrder, {});
                table.insert(v50, v48);
            end;

            for i, v in v45 do
                v51(v, i - 1, v45);
            end;
        end;
    end);
end;

KnitClient.CreateController(u3.new());

return nil;