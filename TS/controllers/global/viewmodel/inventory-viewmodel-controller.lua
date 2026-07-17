-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "InventoryViewmodelController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 19
    -- upvalues: u1 (copy)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "InventoryViewmodelController";
end;

function u1.KnitStart(u4) -- Line: 27
    -- upvalues: ClientStore (copy), RuntimeLib (copy)
    ClientStore.changed:connect(function(u5, p6) -- Line: 28
        -- upvalues: RuntimeLib (ref), u4 (copy)
        if u5.Inventory.observedInventory.inventory.hand ~= p6.Inventory.observedInventory.inventory.hand then
            RuntimeLib.Promise.defer(function() -- Line: 30
                -- upvalues: u4 (ref), u5 (copy)
                u4:handleStore(u5);
            end);
        end;
    end);
    u4:handleStore(ClientStore:getState());
end;

function u1.handleStore(p7, p8) -- Line: 37
    -- upvalues: ItemUtil (copy), KnitClient (copy), ClientSyncEvents (copy)
    local hand = p8.Inventory.observedInventory.inventory.hand;

    if hand ~= nil then
        hand = hand.itemType;
    end;

    if hand then
        local hand2 = p8.Inventory.observedInventory.inventory.hand;

        if hand2 ~= nil then
            hand2 = hand2.itemSkin;
        end;

        local v9 = ItemUtil.createItemInstance(hand, 1, hand2);
        KnitClient.Controllers.ViewmodelController:setHeldItem(v9);
    else
        KnitClient.Controllers.ViewmodelController:setHeldItem(nil);
    end;

    ClientSyncEvents.FirstPersonItemRendered:fire(hand);
end;

return {
    InventoryViewmodelController = KnitClient.CreateController(u1.new())
};