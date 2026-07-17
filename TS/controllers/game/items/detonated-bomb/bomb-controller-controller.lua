-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "BombControllerController";
    end,

    __index = HandKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 24
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 28
    -- upvalues: HandKnitController (copy), u1 (copy)
    HandKnitController.constructor(p4);
    p4.abilityMaid = u1.new();
    p4.Name = "BombControllerController";
end;

function u2.isRelevantItem(p5, p6) -- Line: 33
    -- upvalues: ItemType (copy)
    return p6.itemType == ItemType.BOMB_CONTROLLER;
end;

function u2.onEnable(p7, p8, p9) -- Line: 36
    -- upvalues: Flamework (copy), AbilityId (copy), getItemMeta (copy), ItemType (copy)
    p7:setupDestroyableYield(function() -- Line: 37
        -- upvalues: Flamework (ref), AbilityId (ref), getItemMeta (ref), ItemType (ref)
        local v10 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
        local DETONATE_BOMB = AbilityId.DETONATE_BOMB;
        local v11 = {};
        local v12 = {};
        local image = getItemMeta(ItemType.BOMB_CONTROLLER).image;
        v12.icon = image == nil and "" or image;
        v11.abilityButton = v12;
        v11.abilityType = "ItemPrimary";

        return v10:enableAbility(DETONATE_BOMB, v11):expect();
    end);
end;

function u2.onDisable(p13) -- Line: 54
    p13.abilityMaid:DoCleaning();
end;

function u2.KnitStart(p14) -- Line: 57
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), AbilityId (copy), Players (copy), InventoryUtil (copy), ItemType (copy), default (copy)
    HandKnitController.KnitStart(p14);
    ClientSyncEvents.AbilityUsed:connect(function(p15) -- Line: 59
        -- upvalues: AbilityId (ref), Players (ref), InventoryUtil (ref), ItemType (ref), default (ref)
        local v16;

        if p15.ability == AbilityId.DETONATE_BOMB then
            v16 = p15.userCharacter == Players.LocalPlayer.Character;
        else
            v16 = false;
        end;

        if v16 then
            local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

            if hand ~= nil then
                hand = hand.itemType;
            end;

            v16 = hand == ItemType.BOMB_CONTROLLER;
        end;

        if v16 then
            default.Client:Get("DetonateBomb"):CallServer();
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;