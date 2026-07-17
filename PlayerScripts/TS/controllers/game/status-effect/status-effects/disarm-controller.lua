-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local Workspace = v1.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "DisarmController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(u4) -- Line: 26
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), Workspace (copy)
    KnitController.constructor(u4);
    u4.Name = "DisarmController";
    u4.endTime = -1;
    ClientSyncEvents.NewHandItem:connect(function(p5) -- Line: 30
        -- upvalues: u4 (copy), Workspace (ref)
        if u4.endTime > Workspace:GetServerTimeNow() then
            p5:setCancelled(true);
        end;
    end);
end;

function u2.KnitStart(u6) -- Line: 36
    -- upvalues: KnitController (copy), default (copy), Players (copy), ClientStore (copy)
    KnitController.KnitStart(u6);
    default.Client:Get("Disarm"):Connect(function(p7) -- Line: 38
        -- upvalues: u6 (copy), Players (ref), ClientStore (ref)
        u6:removeHandItem(p7.player);

        if p7.player ~= Players.LocalPlayer then
            return nil;
        end;

        u6.endTime = p7.endTime;
        ClientStore:dispatch({
            type = "UnequipItemInHand",
            equip = false
        });
    end);
end;

function u2.removeHandItem(p8, p9) -- Line: 50
    -- upvalues: InventoryUtil (copy)
    local hand = InventoryUtil.getInventory(p9).hand;

    if hand ~= nil then
        hand = hand.itemType;
    end;

    if hand then
        local Character = p9.Character;

        if Character ~= nil then
            local v10 = Character:WaitForChild(hand, 3);

            if v10 ~= nil then
                v10:Destroy();
            end;
        end;
    end;
end;

KnitClient.CreateController(u2.new());

return nil;