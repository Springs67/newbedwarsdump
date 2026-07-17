-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ComponentUtil = v1.ComponentUtil;
local DeviceUtil = v1.DeviceUtil;
local GameCoreClientSyncEvents = v1.GameCoreClientSyncEvents;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local InteractionCategory = RuntimeLib.import(script, script.Parent.Parent, "interaction", "interaction-registry-controller").InteractionCategory;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "shop-component").default;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local BedwarsShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local BedwarsShopCategoryMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-meta").BedwarsShopCategoryMeta;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local ShopItemLockCauseMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shop", "shop-item-lock-cause-meta").ShopItemLockCauseMeta;
local ShopUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shop", "shop-util").ShopUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 35, Name: __tostring
        return "BedwarsShopController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 41
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 45
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "BedwarsShopController";
    p5.alreadyPurchasedMap = {};
    p5.registeredShopItems = {};
    p5.randomlySelectedItems = {};
end;

function u3.KnitStart(u6) -- Line: 52
    -- upvalues: default2 (copy), ClientStore (copy), KnitClient (copy), DeviceUtil (copy), InteractionCategory (copy), ComponentUtil (copy), default (copy), KnitClient2 (copy), Flamework (copy), BedwarsAppIds (copy), GameCoreClientSyncEvents (copy)
    default2.Client:Get("RegisterShopItems"):Connect(function(p7) -- Line: 53
        -- upvalues: u6 (copy)
        u6.registeredShopItems = p7.items;
    end);
    default2.Client:Get("BulkSendPurchasedItems"):Connect(function(p8) -- Line: 56
        -- upvalues: u6 (copy), ClientStore (ref)
        local function _(p9) -- Line: 58
            -- upvalues: u6 (ref)
            u6.alreadyPurchasedMap[p9] = true;
        end;

        for i, v in p8.purchasedItems do
            local _ = i - 1;
            u6.alreadyPurchasedMap[v] = true;
        end;

        ClientStore:dispatch({
            type = "BedwarsBulkAddItemPurchased",
            itemTypes = p8.purchasedItems
        });
    end);
    KnitClient.Controllers.InteractionRegistryController:RegisterInteraction({
        interactionLabel = "Item Shop",
        interactionObjectText = "Open",
        interactionTag = "BedwarsItemShop",
        instantActivation = true,
        clickablePrompt = DeviceUtil.isMobileControls(),
        category = InteractionCategory.OTHER,

        onInteracted = function(p10, u11) -- Line: 78, Name: onInteracted
            -- upvalues: ComponentUtil (ref), default (ref), KnitClient2 (ref), default2 (ref), u6 (copy), Flamework (ref), BedwarsAppIds (ref)
            local function _(p12) -- Line: 80
                -- upvalues: u11 (copy)
                return p12.instance == u11;
            end;

            local v13 = nil;

            for i, v in ComponentUtil:getAllComponents(default) do
                local _ = i - 1;

                if v.instance == u11 == true then
                    v13 = v;
                    break;
                end;
            end;

            local v14 = u11:GetAttribute("TeamId");
            local v15 = KnitClient2.Controllers.TeamController:getPlayerTeam(p10);

            if v15 ~= nil then
                v15 = v15.id;
            end;

            local v16;

            if v15 == "" or (not v15 or v15 ~= v14) then
                v16 = false;
            else
                v16 = true;
                local v17 = KnitClient2.Controllers.ChestItemDisplayController:getTeamCrate();

                if v17 ~= nil then
                    v17 = v17:FindFirstChild("ChestFolderValue");
                end;

                if v17 then
                    local Value = v17.Value;

                    if Value then
                        default2.Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(Value);
                    end;
                end;
            end;

            u6:closeAllShopApps();
            local v18 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
            local BEDWARS_ITEM_SHOP = BedwarsAppIds.BEDWARS_ITEM_SHOP;
            local v19 = {};

            if v13 ~= nil then
                v13 = v13.attributes.Id;
            end;

            v19.shopId = v13;
            v19.IsHomeBase = v16;
            v18:openApp(BEDWARS_ITEM_SHOP, v19);
        end
    });
    GameCoreClientSyncEvents.AppClose:connect(function(p20) -- Line: 134
        -- upvalues: BedwarsAppIds (ref), u6 (copy), default2 (ref)
        if p20.appId ~= BedwarsAppIds.BEDWARS_ITEM_SHOP then
            return nil;
        end;

        u6:closeAllShopApps();
        default2.Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(nil);
    end);
    default2.Client:Get("BedwarsShopItemsUpdate"):Connect(function(u21) -- Line: 141
        -- upvalues: u6 (copy), ComponentUtil (ref), default (ref)
        local v22 = u6:getShopComponent(u21.shopId);

        if v22 then
            v22:setShopItems(u21.shopItems);

            return;
        end;

        local u24 = ComponentUtil:componentAdded(default, function(p23) -- Line: 148
            -- upvalues: u21 (copy)
            if p23.attributes.Id == u21.shopId then
                p23:setShopItems(u21.shopItems);
            end;
        end);
        task.delay(3, function() -- Line: 153
            -- upvalues: u24 (copy)
            return u24;
        end);
    end);
    default2.Client:Get("BedwarsShopCategoriesUpdate"):Connect(function(p25) -- Line: 158
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "GameSetUnlockedShopCategories",
            unlockedShopCategories = p25.unlockedShopCategories
        });
    end);
    default2.Client:Get("BedwarsShopRequestRandomlySelectedItems"):CallServerAsync():andThen(function(p26) -- Line: 166
        -- upvalues: u6 (copy)
        u6.randomlySelectedItems = p26;
    end);
end;

function u3.getRegisteredShopItems(p27) -- Line: 171
    return p27.registeredShopItems;
end;

function u3.purchaseShopCategory(p28, p29) -- Line: 174
    -- upvalues: default2 (copy), SoundManager (copy), GameSound (copy)
    default2.Client:Get("BedwarsPurchaseShopCategoryUnlock"):CallServerAsync({
        category = p29
    }):andThen(function(p30) -- Line: 178
        -- upvalues: SoundManager (ref), GameSound (ref)
        if p30 then
            SoundManager:playSound(GameSound.BEDWARS_UPGRADE_SUCCESS);
        end;
    end);
end;

function u3.getShopComponent(p31, u32) -- Line: 185
    -- upvalues: ComponentUtil (copy), default (copy)
    local function _(p33) -- Line: 187
        -- upvalues: u32 (copy)
        return p33.attributes.Id == u32;
    end;

    for i, v in ComponentUtil:getAllComponents(default) do
        local _ = i - 1;

        if v.attributes.Id == u32 == true then
            return v;
        end;
    end;

    return nil;
end;

function u3.isInLockedCategory(p34, p35) -- Line: 201
    -- upvalues: BedwarsShopCategoryMeta (copy), ClientStore (copy)
    if BedwarsShopCategoryMeta[p35.category].unlockable then
        return ClientStore:getState().Game.unlockedShopCategories[p35.category] == nil;
    end;

    return false;
end;

function u3.getDisabledStatus(p36, p37, p38) -- Line: 213
    -- upvalues: Players (copy), ShopUtil (copy), ShopItemLockCauseMeta (copy), getItemMeta (copy), InventoryUtil (copy), Theme (copy)
    if p38 == nil then
        p38 = false;
    end;

    if not Players.LocalPlayer then
        return nil;
    end;

    if p36:isInLockedCategory(p37) then
        return {
            reason = "Locked"
        };
    end;

    local v39 = ShopUtil:isItemLocked(Players.LocalPlayer, p37);

    if v39 then
        local v40 = ShopItemLockCauseMeta[v39];
        local v41 = {};
        local purchaseButtonTitle = v40.purchaseButtonTitle;
        v41.reason = purchaseButtonTitle == nil and "Locked" or purchaseButtonTitle;
        v41.buttonColor = v40.purchaseButtonColor;
        v41.disabledIcon = v40.lockIcon;
        v41.lockCause = v39;

        return v41;
    end;

    getItemMeta(p37.itemType);
    local v42 = ShopUtil:getMaxStackForPlayer(Players.LocalPlayer, p37.itemType);

    if v42 ~= nil then
        local v43 = InventoryUtil.getToolFromInventory(Players.LocalPlayer, p37.itemType);
        local v44;

        if v43 == nil then
            v44 = v43;
        else
            v44 = v43.amount;
        end;

        if v44 ~= nil and v42 <= v43.amount then
            return {
                reason = "Max Amount"
            };
        end;
    end;

    if p37.lockAfterPurchase or p37.tiered then
        p38 = Players.LocalPlayer and InventoryUtil.hasEnough(Players.LocalPlayer, p37.itemType, 1) and true or p38;
    end;

    local lockIfAttribute = p37.lockIfAttribute;

    if lockIfAttribute ~= "" and lockIfAttribute then
        local v45 = Players.LocalPlayer:GetAttribute(p37.lockIfAttribute);
        p38 = v45 ~= 0 and (v45 == v45 and (v45 ~= "" and v45)) and true or p38;
    end;

    if p38 then
        return {
            reason = "Purchased",
            buttonColor = Theme.backgroundPrimary
        };
    end;

    if not InventoryUtil.hasEnough(Players.LocalPlayer, p37.currency, p37.price) then
        return {
            reason = "Not Enough"
        };
    end;
end;

function u3.closeAllShopApps(p46) -- Line: 288
    -- upvalues: Players (copy)
    local PlayerGui = Players.LocalPlayer:FindFirstChild("PlayerGui");

    if PlayerGui ~= nil then
        local function _(p47) -- Line: 292
            return p47.Name == "ItemShop";
        end;

        local v48 = 0;
        PlayerGui = {};

        for i, child in PlayerGui:GetChildren() do
            local _ = i - 1;

            if child.Name == "ItemShop" == true then
                v48 = v48 + 1;
                PlayerGui[v48] = child;
            end;
        end;
    end;

    if PlayerGui and #PlayerGui > 0 then
        local function _(p49) -- Line: 309
            p49:Destroy();
        end;

        for i, v in PlayerGui do
            local _ = i - 1;
            v:Destroy();
        end;
    end;
end;

function u3.getRandomlySelectedItems(p50) -- Line: 317
    return p50.randomlySelectedItems;
end;

function u3.getRandomlySelectedItemsAsShopItems(p51) -- Line: 320
    -- upvalues: BedwarsShop (copy), Players (copy)
    local u52 = {};

    local function _(p53) -- Line: 323
        -- upvalues: BedwarsShop (ref), Players (ref), u52 (copy)
        local v54 = BedwarsShop.getShopItem(p53, Players.LocalPlayer);

        if v54 then
            table.insert(u52, v54);
        end;
    end;

    for i, v in p51.randomlySelectedItems do
        local _ = i - 1;
        local v55 = BedwarsShop.getShopItem(v, Players.LocalPlayer);

        if v55 then
            table.insert(u52, v55);
        end;
    end;

    return u52;
end;

function u3.getRecommendedItems(p56) -- Line: 334
    -- upvalues: KnitClient2 (copy), GameType (copy), InventoryUtil (copy), Players (copy), ItemType (copy), BedwarsShop (copy), GamePlayerUtil (copy)
    local v57 = {};
    local v58 = KnitClient2.Controllers.MatchController:getQueueMeta();

    if v58 ~= nil then
        v58 = v58.game;
    end;

    if v58 == GameType.BEDWARS then
        local v59 = InventoryUtil.hasEnough(Players.LocalPlayer, ItemType.EMERALD_CHESTPLATE, 1) and {} or {
            ItemType.LEATHER_CHESTPLATE,
            ItemType.IRON_CHESTPLATE,
            ItemType.DIAMOND_CHESTPLATE,
            ItemType.EMERALD_CHESTPLATE
        };
        local v60 = {};
        local v61 = #v60;
        local v62 = #v57;
        table.move(v57, 1, v62, v61 + 1, v60);
        table.move(v59, 1, #v59, v61 + v62 + 1, v60);
        local v63 = InventoryUtil.hasEnough(Players.LocalPlayer, ItemType.EMERALD_SWORD, 1) and {} or {
            ItemType.STONE_SWORD,
            ItemType.IRON_SWORD,
            ItemType.DIAMOND_SWORD,
            ItemType.EMERALD_SWORD
        };
        v57 = {};
        local v64 = #v57;
        local v65 = #v60;
        table.move(v60, 1, v65, v64 + 1, v57);
        table.move(v63, 1, #v63, v64 + v65 + 1, v57);
        local v66 = GamePlayerUtil.getGamePlayer(Players.LocalPlayer):getTeamId();
        local v67 = BedwarsShop.getTeamWoolById(v66 == nil and "0" or v66);

        if not InventoryUtil.hasEnough(Players.LocalPlayer, v67, 16) then
            table.insert(v57, ItemType.WOOL_WHITE);
        end;

        if not InventoryUtil.hasEnough(Players.LocalPlayer, ItemType.WOOD_BOW, 1) then
            table.insert(v57, ItemType.WOOD_BOW);
        end;

        if InventoryUtil.hasEnough(Players.LocalPlayer, ItemType.WOOD_BOW, 1) and not InventoryUtil.hasEnough(Players.LocalPlayer, ItemType.ARROW, 8) then
            table.insert(v57, ItemType.ARROW);
        end;
    end;

    return v57;
end;

return {
    BedwarsShopController = KnitClient.CreateController(u3.new())
};