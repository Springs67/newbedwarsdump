-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local SyncEvent = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEvent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local TrainingRoomEntityDpsBillboard = RuntimeLib.import(script, script.Parent.Parent.Parent, "global", "training-room", "ui", "training-room-entity-dps-billboard").TrainingRoomEntityDpsBillboard;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "PlayerDpsUpdatedEvent";
    end
});
u3.__index = u3;

function u3.new(...) -- Line: 22
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, p6, p7, p8) -- Line: 26
    p5.player = p6;
    p5.dpsData = p7;
    p5.clear = p8;
end;

local u9 = setmetatable({}, {
    __tostring = function() -- Line: 36, Name: __tostring
        return "TrainingRoomDpsCounterController";
    end,

    __index = GameKnitController
});
u9.__index = u9;

function u9.new(...) -- Line: 42
    -- upvalues: u9 (ref)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11) -- Line: 46
    -- upvalues: GameKnitController (copy), GameType (copy), SyncEvent (copy), u3 (ref)
    GameKnitController.constructor(p11, { GameType.TRAINING_ROOM });
    p11.Name = "TrainingRoomDpsCounterController";
    p11.syncEvents = {
        PlayerDpsUpdatedEvent = SyncEvent.new(u3)
    };
    p11.playerDpsMap = {};
    p11.dpsTrackingEnabled = true;
end;

function u9.onGameInit(u12) -- Line: 55
    -- upvalues: EntityDamageEventZap (copy), Players (copy), EntityUtil (copy)
    EntityDamageEventZap.On(function(p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26) -- Line: 56
        -- upvalues: u12 (copy), Players (ref), EntityUtil (ref)
        if not u12.dpsTrackingEnabled then
            return nil;
        end;

        if p17 ~= Players.LocalPlayer.Character then
            return nil;
        end;

        local v27 = u12:getDpsData(Players.LocalPlayer);

        if not v27.isRecording then
            u12:startRecordingDps(Players.LocalPlayer);
        end;

        v27.totalDamage = v27.totalDamage + p14;
        local v28 = EntityUtil:getEntity(p13);

        if v28 ~= nil then
            v28 = v28:getInstance();
        end;

        if v28 then
            local v29 = u12:getTargetDpsData(Players.LocalPlayer, v28);

            if not v29.isRecording then
                v29.isRecording = true;
                v29.damageRecordingStartTime = tick();
                v29.totalDamage = 0;
            end;

            v29.totalDamage = v29.totalDamage + p14;
        end;

        u12:fireUpdateDpsDataEvent(Players.LocalPlayer);
    end);
    u12:getDpsData(Players.LocalPlayer);
    u12:fireUpdateDpsDataEvent(Players.LocalPlayer);
end;

function u9.getDpsData(p30, p31) -- Line: 97
    -- upvalues: MapUtil (copy)
    return MapUtil.getOrCreate(p30.playerDpsMap, p31, {
        totalDamage = 0,
        isRecording = false,
        damageRecordingStartTime = tick(),
        targetDamageDataMap = {}
    });
end;

function u9.getTargetDpsData(p32, p33, p34) -- Line: 105
    -- upvalues: MapUtil (copy)
    local v35 = p32:getDpsData(p33);
    local v36 = MapUtil.getOrCreate(v35.targetDamageDataMap, p34, {
        isRecording = false,
        totalDamage = 0,
        billboardUI = nil,
        damageRecordingStartTime = tick(),
        entityInstance = p34
    });

    if not v36.billboardUI then
        p32:setupBillboardDpsGuiForEntity(p33, v35, v36);
    end;

    return v36;
end;

function u9.resetTotalDps(p37, p38, p39) -- Line: 119
    local v40 = p37:getDpsData(p38);
    v40.damageRecordingStartTime = tick();
    v40.totalDamage = 0;
    v40.isRecording = false;

    if p39 == nil and true or p39 then
        p37:fireUpdateDpsDataEvent(p38);
    end;
end;

function u9.resetAllTargetDps(p41, p42, p43) -- Line: 131
    -- upvalues: u1 (copy), u2 (copy)
    local v44 = p41:getDpsData(p42);

    local function _(p45) -- Line: 137
        -- upvalues: u2 (ref)
        p45.damageRecordingStartTime = tick();
        p45.totalDamage = 0;

        if p45.billboardUI then
            u2.unmount(p45.billboardUI);
            p45.billboardUI = nil;
        end;
    end;

    for i, v in u1.values(v44.targetDamageDataMap) do
        local _ = i - 1;
        v.damageRecordingStartTime = tick();
        v.totalDamage = 0;

        if v.billboardUI then
            u2.unmount(v.billboardUI);
            v.billboardUI = nil;
        end;
    end;

    table.clear(v44.targetDamageDataMap);

    if p43 == nil and true or p43 then
        p41:fireUpdateDpsDataEvent(p42);
    end;
end;

function u9.resetAll(p46, p47) -- Line: 153
    p46:resetTotalDps(p47, false);
    p46:resetAllTargetDps(p47, false);
    p46:fireUpdateDpsDataEvent(p47, true);
end;

function u9.getDamagePerSecond(p48, p49, p50) -- Line: 158
    local v51 = p48:getDpsData(p49);
    local v52 = tick() - v51.damageRecordingStartTime;

    return v52 == 0 and 0 or v51.totalDamage / v52;
end;

function u9.fireUpdateDpsDataEvent(p53, p54, p55) -- Line: 168
    if p55 == nil then
        p55 = false;
    end;

    local v56 = p53:getDpsData(p54);
    p53.syncEvents.PlayerDpsUpdatedEvent:fire(p54, v56, p55);
end;

function u9.startRecordingDps(p57, p58) -- Line: 175
    p57:resetAll(p58);
    p57:getDpsData(p58).isRecording = true;
    p57:fireUpdateDpsDataEvent(p58);
end;

function u9.stopRecordingDps(p59, p60) -- Line: 181
    -- upvalues: u1 (copy)
    local v61 = p59:getDpsData(p60);
    v61.isRecording = false;

    local function _(p62) -- Line: 186
        p62.isRecording = false;
    end;

    for i, v in u1.values(v61.targetDamageDataMap) do
        local _ = i - 1;
        v.isRecording = false;
    end;

    p59:fireUpdateDpsDataEvent(p60);
end;

function u9.setupBillboardDpsGuiForEntity(p63, p64, p65, p66) -- Line: 194
    -- upvalues: u2 (copy), TrainingRoomEntityDpsBillboard (copy)
    if p66.billboardUI then
        return nil;
    end;

    p66.billboardUI = u2.mount(u2.createElement(TrainingRoomEntityDpsBillboard, {
        player = p64,
        entityInstance = p66.entityInstance,
        initialPlayerDpsData = p65,
        initialTargetDpsData = p66
    }), p66.entityInstance, "TrainingRoomEntityDpsBillboard_" .. p66.entityInstance.Name);
end;

function u9.setDpsTrackingEnabled(p67, p68) -- Line: 206
    -- upvalues: Players (copy), u1 (copy)
    p67.dpsTrackingEnabled = p68;

    if not p68 then
        local v69 = p67:getDpsData(Players.LocalPlayer);
        v69.isRecording = false;

        local function _(p70) -- Line: 212
            p70.isRecording = false;
        end;

        for i, v in u1.values(v69.targetDamageDataMap) do
            local _ = i - 1;
            v.isRecording = false;
        end;
    end;

    if p68 then
        p67:resetAll(Players.LocalPlayer);
    end;

    p67:fireUpdateDpsDataEvent(Players.LocalPlayer);
end;

KnitClient.CreateController(u9.new());

return {
    PlayerDpsUpdatedEvent = u3
};