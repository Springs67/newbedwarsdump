-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent, "ui", "store").ClientStore;
local KnitController = RuntimeLib.import(script, script.Parent, "knit-controller").KnitController;
local v2 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "BackpackKnitController";
    end,

    __index = KnitController
});
v2.__index = v2;

function v2.constructor(p3) -- Line: 17
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p3);
    p3.Name = "Controller";
    p3.enabled = false;
    p3.enableSession = math.random();
    p3.sessionMaid = u1.new();
end;

function v2.KnitStart(u4) -- Line: 24
    -- upvalues: ClientStore (copy)
    local function u8(p5) -- Line: 25
        -- upvalues: u4 (copy)
        if p5.Inventory.observedInventory.inventory.backpack and u4:isRelevantItem(p5.Inventory.observedInventory.inventory.backpack) then
            local v6 = {};

            for i, v in p5.Inventory.observedInventory.inventory.backpack do
                v6[i] = v;
            end;

            if u4.enabled then
                u4.sessionMaid:DoCleaning();
                u4.enabled = false;
                u4.backpack = nil;
                u4.enableSession = -1;
                u4:onDisable();
            end;

            local u7 = os.clock();
            u4.enableSession = u7;
            u4.backpack = v6;
            u4.enabled = true;
            u4:onEnable(v6, function() -- Line: 44
                -- upvalues: u4 (ref), u7 (copy)
                return u4.enableSession == u7;
            end);

            return nil;
        end;

        u4.sessionMaid:DoCleaning();
        u4.enabled = false;
        u4.backpack = nil;
        u4.enableSession = -1;
        u4:onDisable();
    end;

    ClientStore.changed:connect(function(p9, p10) -- Line: 56
        -- upvalues: u8 (copy)
        if p9.Inventory.observedInventory.inventory.backpack ~= p10.Inventory.observedInventory.inventory.backpack then
            u8(p9);
        end;
    end);
    u8(ClientStore:getState());
end;

function v2.isInputAttackEquivalent(p11, p12) -- Line: 63
    -- upvalues: KnitClient (copy)
    local v13 = KnitClient.Controllers.KeybindLoadController:getKeybinds();
    local v14;

    if v13 == nil then
        v14 = v13;
    else
        v14 = v13.keyboard;

        if v14 ~= nil then
            v14 = v14.controlActions.Attack;
        end;
    end;

    local v15 = v14 or Enum.UserInputType.MouseButton1;

    if v13 ~= nil then
        v13 = v13.gamepad;

        if v13 ~= nil then
            v13 = v13.controlActions.Attack;
        end;
    end;

    return false or (p12.UserInputType == v15 and true or p12.KeyCode == v15) or p12.UserInputType == Enum.UserInputType.Touch or (v13 or Enum.KeyCode.ButtonR2) == p12.KeyCode;
end;

function v2.setupYield(u16, u17) -- Line: 107
    local enableSession = u16.enableSession;
    task.spawn(function() -- Line: 109
        -- upvalues: u17 (copy), u16 (copy), enableSession (copy)
        local u18 = u17();

        if u16.enableSession == enableSession then
            u16.sessionMaid:GiveTask(function() -- Line: 112
                -- upvalues: u18 (copy)
                task.spawn(function() -- Line: 113
                    -- upvalues: u18 (ref)
                    u18();
                end);
            end);

            return;
        end;

        u18();
    end);
end;

function v2.isEnabled(p19) -- Line: 122
    return p19.enabled;
end;

function v2.getBackpack(p20) -- Line: 125
    return p20.backpack;
end;

return {
    BackpackKnitController = v2
};