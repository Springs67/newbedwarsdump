-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local BackpackKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "backpack-knit-controller").BackpackKnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "TreasureChestBackpackController";
    end,

    __index = BackpackKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 27
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 31
    -- upvalues: BackpackKnitController (copy), u1 (copy)
    BackpackKnitController.constructor(p4);
    p4.Name = "TreasureChestBackpackController";
    p4.abilityMaid = u1.new();
end;

function u2.isRelevantItem(p5, p6) -- Line: 36
    -- upvalues: ItemType (copy)
    return p6.itemType == ItemType.PORTABLE_VENDING_MACHINE;
end;

function u2.onEnable(u7, p8, p9) -- Line: 39
    -- upvalues: Flamework (copy), AbilityId (copy), getItemMeta (copy), ItemType (copy)
    local u10 = true;
    u7.abilityMaid:GiveTask(function() -- Line: 41
        -- upvalues: u10 (ref)
        u10 = false;

        return u10;
    end);
    task.spawn(function() -- Line: 45
        -- upvalues: Flamework (ref), AbilityId (ref), getItemMeta (ref), ItemType (ref), u10 (ref), u7 (copy)
        local v11 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
        local TREASURE_BACKPACK = AbilityId.TREASURE_BACKPACK;
        local v12 = {};
        local v13 = {};
        local image = getItemMeta(ItemType.PORTABLE_VENDING_MACHINE).image;
        v13.icon = image == nil and "" or image;
        v12.abilityButton = v13;
        v12.abilityType = "MiscPrimary";
        local v14 = v11:enableAbility(TREASURE_BACKPACK, v12):expect();

        if u10 then
            u7.abilityMaid:GiveTask(v14);

            return;
        end;

        v14.Destroy();
    end);
end;

function u2.onDisable(p15) -- Line: 67
    p15.abilityMaid:DoCleaning();
end;

function u2.KnitStart(p16) -- Line: 70
    -- upvalues: BackpackKnitController (copy), ClientSyncEvents (copy), AbilityId (copy), Players (copy), InventoryUtil (copy), ItemType (copy), Flamework (copy), BedwarsAppIds (copy), default (copy), CooldownId (copy), BalanceFile (copy)
    BackpackKnitController.KnitStart(p16);
    ClientSyncEvents.AbilityUsed:connect(function(p17) -- Line: 72
        -- upvalues: AbilityId (ref), Players (ref), InventoryUtil (ref), ItemType (ref), Flamework (ref), BedwarsAppIds (ref)
        local v18;

        if p17.ability == AbilityId.TREASURE_BACKPACK then
            v18 = p17.userCharacter == Players.LocalPlayer.Character;
        else
            v18 = false;
        end;

        if v18 then
            local backpack = InventoryUtil.getInventory(Players.LocalPlayer).backpack;

            if backpack ~= nil then
                backpack = backpack.itemType;
            end;

            v18 = backpack == ItemType.PORTABLE_VENDING_MACHINE;
        end;

        if v18 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.BEDWARS_ITEM_SHOP, {});
        end;
    end);
    default.Client:Get("PurchaseFromVendingMachine"):Connect(function() -- Line: 85
        -- upvalues: Flamework (ref), CooldownId (ref), BalanceFile (ref)
        if not Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(CooldownId.BACKPACK) then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.BACKPACK, BalanceFile.VENDING_MACHINE_COOLDOWN);
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;