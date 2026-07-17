-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "HotbarSaveController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 28
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "HotbarInventoryController";
end;

function u2.KnitStart(u5) -- Line: 36
    -- upvalues: KnitController (copy), default (copy), ClientStore (copy), Players (copy), KnitClient2 (copy), getQueueMeta (copy), GameType (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("SaveHotBarInventory"):Connect(function() -- Line: 39
        -- upvalues: u5 (copy), ClientStore (ref)
        u5.savedHotbar = ClientStore:getState().Inventory.observedInventory.hotbar;
    end);
    default.Client:Get("EntityDeathEvent"):Connect(function(p6) -- Line: 42
        -- upvalues: Players (ref), KnitClient2 (ref), getQueueMeta (ref), GameType (ref), u5 (copy), ClientStore (ref)
        if p6.entityInstance == Players.LocalPlayer.Character then
            local v7 = KnitClient2.Controllers.MatchController:getQueueType();

            if v7 and getQueueMeta(v7).game == GameType.PVP_ARENA then
                return nil;
            end;

            u5.savedHotbar = ClientStore:getState().Inventory.observedInventory.hotbar;
        end;
    end);
    default.Client:Get("RestoreHotBarInventory"):Connect(function() -- Line: 56
        -- upvalues: u5 (copy), ClientStore (ref)
        if not u5.savedHotbar then
            return nil;
        end;

        ClientStore:dispatch({
            type = "RestoreHotBar",
            savedHotbar = u5.savedHotbar
        });
        ClientStore:dispatch({
            type = "InventorySelectHotbarSlot",
            slot = 0
        });
    end);
    default.Client:Get("ForceSwapHotbar"):Connect(function(p8) -- Line: 70
        -- upvalues: u5 (copy), ClientStore (ref)
        if not u5.savedHotbar then
            return nil;
        end;

        local v9 = false;
        local v10 = 0;

        while true do
            if v9 then
                v10 = v10 + 1;
            else
                v9 = true;
            end;

            if v10 >= #u5.savedHotbar or not u5.savedHotbar[v10 + 1].item then
                local v11 = u5:getItemFromInventory(p8.fromSlotItem, ClientStore:getState().Inventory.observedInventory.inventory.items);

                if not v11 then
                    return nil;
                end;

                ClientStore:dispatch({
                    type = "InventoryAddToHotbar",
                    item = v11,
                    slot = v10
                });

                return;
            end;
        end;
    end);
end;

function u2.getItemSlot(p12, p13, p14) -- Line: 103
    local v15 = false;
    local v16 = 0;

    while true do
        if v15 then
            v16 = v16 + 1;
        else
            v15 = true;
        end;

        if v16 >= #p14 then
            return;
        end;

        local item = p14[v16 + 1].item;

        if item ~= nil then
            item = item.itemType;
        end;

        if item == p13 then
            return v16;
        end;
    end;
end;

function u2.getItemFromInventory(p17, p18, p19) -- Line: 126
    local v20 = false;
    local v21 = 0;

    while true do
        if v20 then
            v21 = v21 + 1;
        else
            v20 = true;
        end;

        if v21 >= #p19 then
            return;
        end;

        if p19[v21 + 1].itemType == p18 then
            return p19[v21 + 1];
        end;
    end;
end;

KnitClient.CreateController(u2.new());

return nil;