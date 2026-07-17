-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local StarterGui = v4.StarterGui;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local CollectionTagAdded = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local InventoryEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "inventory-entity").InventoryEntity;
local ArmorSlot = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "InventoryController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 34
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(u7) -- Line: 38
    -- upvalues: KnitController (copy), u3 (copy), StarterGui (copy), RuntimeLib (copy), ReplicatedStorage (copy), default (copy)
    KnitController.constructor(u7);
    u7.Name = "InventoryController";
    u7.playerMaid = u3.new();
    task.spawn(function() -- Line: 42
        -- upvalues: StarterGui (ref)
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);
    end);
    RuntimeLib.Promise.retryWithDelay(function() -- Line: 45
        -- upvalues: RuntimeLib (ref), u7 (copy), ReplicatedStorage (ref)
        return RuntimeLib.Promise.new(function(p8, p9) -- Line: 46
            -- upvalues: u7 (ref), ReplicatedStorage (ref)
            u7.cachedInventoryFolder = ReplicatedStorage:WaitForChild("CachedInvItems", 3);

            if u7.cachedInventoryFolder == nil then
                return p9();
            end;

            return p8();
        end);
    end, 3, 7):finally(function() -- Line: 50
        -- upvalues: u7 (copy), default (ref)
        if u7.cachedInventoryFolder == nil then
            default.Error("Failed to retrieve cached inventory folder on client");
        end;
    end);
end;

function u5.KnitStart(u10) -- Line: 56
    -- upvalues: ClientStore (copy), Players (copy), Flamework (copy), PlaceUtil (copy), BedwarsAppIds (copy), KnitClient2 (copy), getItemMeta (copy)
    ClientStore.changed:connect(function(p11, p12) -- Line: 57
        -- upvalues: u10 (copy), Players (ref)
        if p11.Inventory.observedPlayer and p11.Inventory.observedPlayer ~= p12.Inventory.observedPlayer then
            local observedPlayer = p11.Inventory.observedPlayer;
            task.spawn(function() -- Line: 60
                -- upvalues: u10 (ref), Players (ref), observedPlayer (copy)
                u10:hookObservedPlayer(Players.LocalPlayer, observedPlayer);
            end);
        end;
    end);
    local observedPlayer = ClientStore:getState().Inventory.observedPlayer;

    if observedPlayer then
        u10:hookObservedPlayer(Players.LocalPlayer, observedPlayer);
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        actionId = "inventory-toggle",
        action = "Inventory",
        priority = -1,

        boundFunction = function(p13, p14, p15) -- Line: 73, Name: boundFunction
            -- upvalues: PlaceUtil (ref), Flamework (ref), BedwarsAppIds (ref), KnitClient2 (ref)
            if p14 == Enum.UserInputState.Begin then
                if PlaceUtil.isLobbyServer() then
                    local v16 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");

                    if v16:isAppOpen(BedwarsAppIds.INVENTORY) then
                        v16:closeApp(BedwarsAppIds.INVENTORY);

                        return;
                    end;

                    v16:openApp(BedwarsAppIds.INVENTORY, {});

                    return;
                end;

                if PlaceUtil.isGameServer() then
                    if KnitClient2.Controllers.GamemodeController:isLocalPlayerInCreativeMode() then
                        KnitClient2.Controllers.GamemodeController:toggleCreativeInventory();

                        return;
                    end;

                    local v17 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");

                    if v17:isAppOpen(BedwarsAppIds.INVENTORY) then
                        v17:closeApp(BedwarsAppIds.INVENTORY);

                        return;
                    end;

                    v17:openApp(BedwarsAppIds.INVENTORY, {});
                end;
            end;
        end
    });
    local items = ClientStore:getState().Inventory.observedInventory.inventory.items;
    local v18 = false;
    local v19 = 0;

    while true do
        if v18 then
            v19 = v19 + 1;
        else
            v18 = true;
        end;

        if v19 >= 9 or v19 >= #items then
            for _, v in ClientStore:getState().Inventory.observedInventory.inventory.items do
                local v20 = getItemMeta(v.itemType);

                if v20.armor and ClientStore:getState().Inventory.observedInventory.inventory.armor[v20.armor.slot + 1] == "empty" then
                    ClientStore:dispatch({
                        type = "InventorySetArmorItem",
                        armorSlot = v20.armor.slot,
                        item = v
                    });
                end;

                if v20.backpack and ClientStore:getState().Inventory.observedInventory.inventory.backpack == nil then
                    ClientStore:dispatch({
                        type = "InventorySetBackpack",
                        item = v
                    });
                end;
            end;

            u10:inventoryReplication();

            return;
        end;

        ClientStore:dispatch({
            type = "InventoryAddToHotbar",
            item = items[v19 + 1],
            slot = v19
        });
    end;
end;

function u5.inventoryReplication(u21) -- Line: 142
    -- upvalues: CollectionTagAdded (copy), Players (copy), u3 (copy), InventoryEntity (copy), u2 (copy), ArmorSlot (copy)
    CollectionTagAdded("inventory-entity", function(p22) -- Line: 143
        -- upvalues: Players (ref), u3 (ref), InventoryEntity (ref), u2 (ref), ArmorSlot (ref), u21 (copy)
        if Players.LocalPlayer.Name == p22.Name then
            return nil;
        end;

        local u23 = u3.new();
        local u24 = InventoryEntity.new(p22);

        if not u24 then
            error("Failed to find entity during client entity replication.");
        end;

        p22:WaitForChild("HandInvItem");

        local function _(p25) -- Line: 158
            -- upvalues: u24 (copy)
            if p25 then
                u24:equipItem(p25);

                return;
            end;

            u24:unequipItemInHand();
        end;

        local Value = p22.HandInvItem.Value;

        if Value then
            u24:equipItem(Value);
        else
            u24:unequipItemInHand();
        end;

        u23:GiveTask(p22.HandInvItem.Changed:Connect(function(p26) -- Line: 166
            -- upvalues: u24 (copy)
            if p26 then
                u24:equipItem(p26);

                return;
            end;

            u24:unequipItemInHand();
        end));
        local u27 = 0;
        local v28 = false;

        while true do
            if v28 then
                u27 = u27 + 1;
            else
                v28 = true;
            end;

            if u27 >= #u2.values(ArmorSlot) then
                local BedWarsBackpackSlot = p22:WaitForChild("BedWarsBackpackSlot", 3);

                local function _(p29) -- Line: 221
                    -- upvalues: u24 (copy)
                    if p29 then
                        u24:equipBackpack(p29);

                        return;
                    end;

                    u24:unequipBackpackSlot();
                end;

                local Value2 = BedWarsBackpackSlot.Value;

                if Value2 then
                    u24:equipBackpack(Value2);
                else
                    u24:unequipBackpackSlot();
                end;

                u23:GiveTask(BedWarsBackpackSlot.Changed:Connect(function(p30) -- Line: 229
                    -- upvalues: BedWarsBackpackSlot (copy), u24 (copy)
                    local Value3 = BedWarsBackpackSlot.Value;

                    if Value3 then
                        u24:equipBackpack(Value3);

                        return;
                    end;

                    u24:unequipBackpackSlot();
                end));
                u23:GiveTask(p22.AncestryChanged:Connect(function(p31, p32) -- Line: 232
                    -- upvalues: u21 (ref), u23 (copy)
                    if p32 == nil or p32 == u21.cachedInventoryFolder then
                        u23:DoCleaning();
                    end;
                end));

                return;
            end;

            local v33 = p22:WaitForChild("ArmorInvItem_" .. tostring(u27));

            local function u39(p34, p35) -- Line: 187
                -- upvalues: u24 (copy)
                if not p35 then
                    u24:unequipArmorSlot(p34);

                    return;
                end;

                local v36 = u24:getPlayer();

                if v36 ~= nil then
                    v36 = v36:GetAttribute("ArmorTrimType");
                end;

                local v37 = u24:getPlayer();

                if v37 ~= nil then
                    v37 = v37:GetAttribute("ArmorTrimColor");
                end;

                local v38 = u24:getPlayer();

                if v38 ~= nil then
                    v38 = v38:GetAttribute("ArmorTrimEffectRank");
                end;

                u24:equipArmorItem(p35, p34, v36 and (v37 ~= nil and v38 ~= nil) and {
                    type = v36,
                    color = v37,
                    effectRank = v38
                } or nil);
            end;

            u39(u27, v33.Value);
            u23:GiveTask(v33.Changed:Connect(function(p40) -- Line: 214
                -- upvalues: u39 (copy), u27 (ref)
                return u39(u27, p40);
            end));
            u27 = u27;
        end;
    end);
end;

function u5.hookObservedPlayer(u41, p42, p43) -- Line: 239
    -- upvalues: u3 (copy), ClientStore (copy), ClientSyncEvents (copy), InventoryEntity (copy)
    u41.playerMaid:DoCleaning();
    local u44 = {};
    local u45 = u3.new();

    local function u50(u46) -- Line: 243
        -- upvalues: u44 (copy), u3 (ref), u45 (copy), ClientStore (ref), u41 (copy), ClientSyncEvents (ref)
        u44[u46] = true;
        local u47 = u3.new();
        u45:GiveTask(u47);
        u47:GiveTask(u46:GetAttributeChangedSignal("Amount"):Connect(function() -- Line: 248
            -- upvalues: ClientStore (ref), u46 (copy)
            ClientStore:dispatch({
                type = "InventorySetItemAmount",
                tool = u46,
                amount = u46:GetAttribute("Amount")
            });
        end));
        u47:GiveTask(u46.AncestryChanged:Connect(function(p48, p49) -- Line: 255
            -- upvalues: u41 (ref), ClientSyncEvents (ref), u46 (copy), u47 (copy)
            if p49 == nil or p49 == u41.cachedInventoryFolder then
                ClientSyncEvents.ItemRemoved:fire(u46.Name);
                u47:DoCleaning();
            end;
        end));
        u47:GiveTask(function() -- Line: 261
            -- upvalues: u46 (copy), u44 (ref), ClientStore (ref)
            u44[u46] = nil;
            ClientStore:dispatch({
                type = "InventoryRemoveItem",
                tool = u46
            });
        end);
        task.spawn(function() -- Line: 271
            -- upvalues: ClientSyncEvents (ref), u46 (copy)
            ClientSyncEvents.ItemAdded:fire(u46);
        end);

        return u47;
    end;

    local function u71(p51) -- Line: 276
        -- upvalues: u45 (copy), InventoryEntity (ref), u44 (copy), ClientStore (ref), u50 (copy), u41 (copy), u3 (ref)
        u45:DoCleaning();
        local v52 = InventoryEntity.new(p51);

        if not v52 then
            error("character not found!");
        end;

        local function u55(p53) -- Line: 283
            -- upvalues: u44 (ref), ClientStore (ref), u50 (ref), u45 (ref)
            for _, child in p53:GetChildren() do
                if u44[child] == nil then
                    ClientStore:dispatch({
                        type = "InventoryAddItem",
                        tool = child
                    });
                    u50(child);
                end;
            end;

            u45:GiveTask(p53.ChildAdded:Connect(function(p54) -- Line: 293
                -- upvalues: u44 (ref), ClientStore (ref), u50 (ref)
                if u44[p54] == nil then
                    ClientStore:dispatch({
                        type = "InventoryAddItem",
                        tool = p54
                    });
                    u50(p54);
                end;
            end));
        end;

        local v56 = v52:getInventoryFolder();

        if v56 then
            u55(v56);
        end;

        u45:GiveTask(v52:inventoryFolderAddedEvent(function(p57) -- Line: 308
            -- upvalues: u55 (copy)
            u55(p57);
        end));
        u45:GiveTask(p51.AncestryChanged:Connect(function(p58, p59) -- Line: 311
            -- upvalues: u41 (ref), u45 (ref)
            if p59 == nil or p59 == u41.cachedInventoryFolder then
                u45:DoCleaning();
            end;
        end));
        u45:GiveTask(function() -- Line: 316
        end);
        local u60 = u3.new();

        local function u65(p61) -- Line: 322
            -- upvalues: u60 (copy), ClientStore (ref)
            local function _(u62) -- Line: 323
                -- upvalues: u60 (ref), ClientStore (ref)
                u60:GiveTask(u62:GetAttributeChangedSignal("Amount"):Connect(function() -- Line: 324
                    -- upvalues: ClientStore (ref), u62 (copy)
                    ClientStore:dispatch({
                        type = "ChestItemSetAmount",
                        itemInstance = u62,
                        amount = u62:GetAttribute("Amount")
                    });
                end));
            end;

            for _, child in p61:GetChildren() do
                if child:IsA("Accessory") then
                    ClientStore:dispatch({
                        type = "ChestAddItem",
                        itemInstance = child
                    });
                    u60:GiveTask(child:GetAttributeChangedSignal("Amount"):Connect(function() -- Line: 324
                        -- upvalues: ClientStore (ref), child (copy)
                        ClientStore:dispatch({
                            type = "ChestItemSetAmount",
                            itemInstance = child,
                            amount = child:GetAttribute("Amount")
                        });
                    end));
                end;
            end;

            u60:GiveTask(p61.ChildAdded:Connect(function(u63) -- Line: 341
                -- upvalues: ClientStore (ref), u60 (ref)
                if u63:IsA("Accessory") then
                    ClientStore:dispatch({
                        type = "ChestAddItem",
                        itemInstance = u63
                    });
                    u60:GiveTask(u63:GetAttributeChangedSignal("Amount"):Connect(function() -- Line: 324
                        -- upvalues: ClientStore (ref), u63 (copy)
                        ClientStore:dispatch({
                            type = "ChestItemSetAmount",
                            itemInstance = u63,
                            amount = u63:GetAttribute("Amount")
                        });
                    end));
                end;
            end));
            u60:GiveTask(p61.ChildRemoved:Connect(function(p64) -- Line: 350
                -- upvalues: ClientStore (ref)
                ClientStore:dispatch({
                    type = "ChestRemoveItem",
                    itemInstance = p64
                });
            end));
        end;

        local function _() -- Line: 357
            -- upvalues: u60 (copy), ClientStore (ref)
            u60:DoCleaning();
            ClientStore:dispatch({
                type = "ChestClear"
            });
        end;

        u45:GiveTask(function() -- Line: 363
            -- upvalues: u60 (copy), ClientStore (ref)
            u60:DoCleaning();
            ClientStore:dispatch({
                type = "ChestClear"
            });
        end);

        local function _(p66) -- Line: 366
            -- upvalues: u65 (copy), u45 (ref), u60 (copy), ClientStore (ref)
            if p66.Value then
                u65(p66.Value);
            end;

            u45:GiveTask(p66.Changed:Connect(function(p67) -- Line: 370
                -- upvalues: u65 (ref), u60 (ref), ClientStore (ref)
                if p67 then
                    u65(p67);

                    return;
                end;

                u60:DoCleaning();
                ClientStore:dispatch({
                    type = "ChestClear"
                });
            end));
        end;

        if not p51:FindFirstChild("ObservedChestFolder") then
            u45:GiveTask(p51.ChildAdded:Connect(function(p68) -- Line: 382
                -- upvalues: u65 (copy), u45 (ref), u60 (copy), ClientStore (ref)
                if p68.Name == "ObservedChestFolder" then
                    if p68.Value then
                        u65(p68.Value);
                    end;

                    u45:GiveTask(p68.Changed:Connect(function(p69) -- Line: 370
                        -- upvalues: u65 (ref), u60 (ref), ClientStore (ref)
                        if p69 then
                            u65(p69);

                            return;
                        end;

                        u60:DoCleaning();
                        ClientStore:dispatch({
                            type = "ChestClear"
                        });
                    end));
                end;
            end));

            return;
        end;

        local ObservedChestFolder = p51:FindFirstChild("ObservedChestFolder");

        if ObservedChestFolder.Value then
            u65(ObservedChestFolder.Value);
        end;

        u45:GiveTask(ObservedChestFolder.Changed:Connect(function(p70) -- Line: 370
            -- upvalues: u65 (copy), u60 (copy), ClientStore (ref)
            if p70 then
                u65(p70);

                return;
            end;

            u60:DoCleaning();
            ClientStore:dispatch({
                type = "ChestClear"
            });
        end));
    end;

    u41.playerMaid:GiveTask(p43.CharacterAdded:Connect(function(p72) -- Line: 389
        -- upvalues: u71 (copy)
        u71(p72);
    end));

    if p43.Character then
        u71(p43.Character);
    end;

    u41.playerMaid:GiveTask(function() -- Line: 395
        -- upvalues: u45 (copy)
        u45:DoCleaning();
    end);
end;

function u5.setObservedPlayer(p73, p74) -- Line: 399
    -- upvalues: ClientStore (copy)
    ClientStore:dispatch({
        type = "SetObservedPlayer",
        observedPlayer = p74
    });
end;

function u5.getEquippedArmor(p75, p76) -- Line: 405
    -- upvalues: ClientStore (copy), getItemMeta (copy)
    local v77 = p76 or ClientStore:getState().Inventory.observedInventory.inventory.armor;

    local function _(p78, p79) -- Line: 407
        -- upvalues: getItemMeta (ref)
        if p79 == "empty" then
            return p78;
        end;

        local v80 = getItemMeta(p79.itemType);

        if v80.armor then
            p78[v80.armor.slot] = p79.itemType;
        end;

        return p78;
    end;

    local v81 = {};

    for i = 1, #v77 do
        local v82 = v77[i];
        local _ = i - 1;

        if v82 ~= "empty" then
            local v83 = getItemMeta(v82.itemType);

            if v83.armor then
                v81[v83.armor.slot] = v82.itemType;
            end;
        end;
    end;

    return v81;
end;

return {
    InventoryController = KnitClient.CreateController(u5.new())
};