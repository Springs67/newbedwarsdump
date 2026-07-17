-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent, "ui", "store").ClientStore;
local KnitController = RuntimeLib.import(script, script.Parent, "knit-controller").KnitController;
local v2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "HandKnitController";
    end,

    __index = KnitController
});
v2.__index = v2;

function v2.constructor(p3) -- Line: 19
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p3);
    p3.Name = "Controller";
    p3.enabled = false;
    p3.enableSession = math.random();
    p3.sessionMaid = u1.new();
end;

function v2.KnitStart(u4) -- Line: 26
    -- upvalues: ClientStore (copy), ClientSyncEvents (copy), Players (copy)
    local function u9(p5, p6) -- Line: 27
        -- upvalues: u4 (copy)
        if p5.Inventory.observedInventory.inventory.hand and u4:isRelevantItem(p5.Inventory.observedInventory.inventory.hand) then
            local v7 = {};

            for i, v in p5.Inventory.observedInventory.inventory.hand do
                v7[i] = v;
            end;

            if u4.enabled then
                u4.sessionMaid:DoCleaning();
                u4.enabled = false;
                u4.handItem = nil;
                u4.enableSession = -1;
                u4:onDisable();
            end;

            local u8 = os.clock();
            u4.enableSession = u8;
            u4.handItem = v7;
            u4.enabled = true;
            u4:onEnable(v7, function() -- Line: 46
                -- upvalues: u4 (ref), u8 (copy)
                return u4.enableSession == u8;
            end);

            return nil;
        end;

        if u4.enabled and (p6 and u4:isRelevantItem(p6)) then
            u4.sessionMaid:DoCleaning();
            u4.enabled = false;
            u4.handItem = nil;
            u4.enableSession = -1;
            u4:onDisable();
        end;
    end;

    ClientStore.changed:connect(function(p10, p11) -- Line: 60
        -- upvalues: u9 (copy)
        local hand = p11.Inventory.observedInventory.inventory.hand;

        if p10.Inventory.observedInventory.inventory.hand ~= hand then
            u9(p10, hand);
        end;
    end);
    ClientSyncEvents.KitEquip:connect(function(p12) -- Line: 66
        -- upvalues: Players (ref), u4 (copy), u9 (copy), ClientStore (ref)
        if p12.player == Players.LocalPlayer then
            u4:onDisable();
            u9(ClientStore:getState(), nil);
        end;
    end);
    u9(ClientStore:getState(), nil);
end;

function v2.isInputAttackEquivalent(p13, p14) -- Line: 74
    -- upvalues: KnitClient (copy)
    local v15 = KnitClient.Controllers.KeybindLoadController:getKeybinds();
    local v16;

    if v15 == nil then
        v16 = v15;
    else
        v16 = v15.keyboard;

        if v16 ~= nil then
            v16 = v16.controlActions.Attack;
        end;
    end;

    local v17 = v16 or Enum.UserInputType.MouseButton1;

    if v15 ~= nil then
        v15 = v15.gamepad;

        if v15 ~= nil then
            v15 = v15.controlActions.Attack;
        end;
    end;

    return false or (p14.UserInputType == v17 and true or p14.KeyCode == v17) or p14.UserInputType == Enum.UserInputType.Touch or (v15 or Enum.KeyCode.ButtonR2) == p14.KeyCode;
end;

function v2.setupYield(u18, u19) -- Line: 118
    local enableSession = u18.enableSession;
    task.spawn(function() -- Line: 120
        -- upvalues: u19 (copy), u18 (copy), enableSession (copy)
        local u20 = u19();

        if u18.enableSession == enableSession then
            u18.sessionMaid:GiveTask(function() -- Line: 123
                -- upvalues: u20 (copy)
                task.spawn(function() -- Line: 124
                    -- upvalues: u20 (ref)
                    u20();
                end);
            end);

            return;
        end;

        u20();
    end);
end;

function v2.setupDestroyableYield(u21, u22) -- Line: 133
    -- upvalues: u1 (copy)
    local enableSession = u21.enableSession;

    local function safelyCleanup(u23) -- Line: 135
        -- upvalues: u1 (ref)
        task.spawn(function() -- Line: 136
            -- upvalues: u1 (ref), u23 (copy)
            local v24 = u1.new();
            v24:GiveTask(u23);
            v24:DoCleaning();
        end);
    end;

    task.spawn(function() -- Line: 142
        -- upvalues: u22 (copy), u21 (copy), enableSession (copy), u1 (ref)
        local u25 = u22();

        if u21.enableSession == enableSession then
            u21.sessionMaid:GiveTask(function() -- Line: 145
                -- upvalues: u25 (copy), u1 (ref)
                local u26 = u25;
                task.spawn(function() -- Line: 136
                    -- upvalues: u1 (ref), u26 (copy)
                    local v27 = u1.new();
                    v27:GiveTask(u26);
                    v27:DoCleaning();
                end);
            end);

            return;
        end;

        task.spawn(function() -- Line: 136
            -- upvalues: u1 (ref), u25 (copy)
            local v28 = u1.new();
            v28:GiveTask(u25);
            v28:DoCleaning();
        end);
    end);
end;

function v2.isEnabled(p29) -- Line: 153
    return p29.enabled;
end;

function v2.getHandItem(p30) -- Line: 156
    return p30.handItem;
end;

return {
    HandKnitController = v2
};