-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local FarmerCletusUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "farmer-cletus", "farmer-cletus-util").FarmerCletusUtil;
local BedwarsShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local BedwarsShopCategoryMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-meta").BedwarsShopCategoryMeta;
local BedwarsShopCategory = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Setting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting;
local ShopUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shop", "shop-util").ShopUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ShopCategoryDefault = RuntimeLib.import(script, script.Parent, "shop-category-default").ShopCategoryDefault;
local ShopCategoryUnlockableList = RuntimeLib.import(script, script.Parent, "shop-category-unlockable-list").ShopCategoryUnlockableList;
local v4 = u3.Component:extend("ShopItemList");

function v4.init(p5, p6) -- Line: 28
end;

function v4.didMount(u7) -- Line: 30
    -- upvalues: ClientStore (copy), Setting (copy), DeviceUtil (copy), BedwarsShop (copy), Players (copy), default (copy), FarmerCletusUtil (copy)
    u7:setState({
        showRecommendedShop = ClientStore:getState().Settings[Setting.SHOW_RECOMMENDED_SHOP]
    });

    if DeviceUtil.isHoarceKat() then
        u7:setState({
            baseShop = BedwarsShop.getShop(nil, u7.props.ShopID, true)
        });

        return;
    end;

    u7:setState({
        baseShop = BedwarsShop.getShop(Players.LocalPlayer, u7.props.ShopID, true)
    });
    u7.connection = default.Client:Get("BedwarsShopItemsUpdate"):Connect(function(p8) -- Line: 39
        -- upvalues: u7 (copy), BedwarsShop (ref), Players (ref)
        if p8.shopId ~= u7.props.ShopID then
            return nil;
        end;

        u7:setState({
            baseShop = BedwarsShop.getShop(Players.LocalPlayer, u7.props.ShopID, true, p8.shopItems)
        });
    end);
    u7.attributeConnection = Players.LocalPlayer.AttributeChanged:Connect(function(p9) -- Line: 48
        -- upvalues: FarmerCletusUtil (ref), BedwarsShop (ref), Players (ref), u7 (copy)
        if p9 ~= FarmerCletusUtil.MelonSeedsPurchasedAttribute then
            return nil;
        end;

        u7:setState({
            baseShop = BedwarsShop.getShop(Players.LocalPlayer, u7.props.ShopID, true)
        });
    end);
    u7.storeSignal = ClientStore.changed:connect(function(p10, p11) -- Line: 57
        -- upvalues: Setting (ref), u7 (copy), ClientStore (ref)
        if p10.Settings[Setting.SHOW_RECOMMENDED_SHOP] ~= p11.Settings[Setting.SHOW_RECOMMENDED_SHOP] then
            u7:setState({
                showRecommendedShop = ClientStore:getState().Settings[Setting.SHOW_RECOMMENDED_SHOP]
            });
        end;
    end);
end;

function v4.willUnmount(p12) -- Line: 71
    local connection = p12.connection;

    if connection ~= nil then
        connection:Disconnect();
    end;

    local attributeConnection = p12.attributeConnection;

    if attributeConnection ~= nil then
        attributeConnection:Disconnect();
    end;

    local storeSignal = p12.storeSignal;

    if storeSignal ~= nil then
        storeSignal:disconnect();
    end;
end;

function v4.render(u13) -- Line: 85
    -- upvalues: DeviceUtil (copy), KnitClient (copy), Players (copy), BedwarsShop (copy), ClientStore (copy), InventoryUtil (copy), ShopUtil (copy), ItemType (copy), Theme (copy), u3 (copy), u2 (copy), BedwarsShopCategory (copy), BedwarsShopCategoryMeta (copy), getQueueMeta (copy), ShopCategoryDefault (copy), Empty (copy), ShopCategoryUnlockableList (copy), AutoCanvasScrollingFrame (copy)
    local baseShop = u13.state.baseShop;

    if not baseShop then
        return nil;
    end;

    local showRecommendedShop = u13.state.showRecommendedShop;
    local u14 = {};

    local function _(p15) -- Line: 92
        -- upvalues: u14 (copy)
        u14[p15.itemType] = p15;
    end;

    for i, v in baseShop do
        local _ = i - 1;
        u14[v.itemType] = v;
    end;

    local function _(p16) -- Line: 101
        return not p16.tiered;
    end;

    local v17 = 0;
    local v18 = {};

    for i, v in baseShop do
        local _ = i - 1;

        if not v.tiered == true then
            v17 = v17 + 1;
            v18[v17] = v;
        end;
    end;

    if u13.props.ShopID ~= nil and not DeviceUtil.isHoarceKat() then
        local u19 = KnitClient.Controllers.BedwarsShopController:getShopComponent(u13.props.ShopID);
        local v20;

        if u19 == nil then
            v20 = u19;
        else
            v20 = u19.attributes.ShopOwner;
        end;

        if v20 ~= nil then
            local function _(p21) -- Line: 124
                -- upvalues: u19 (copy), Players (ref)
                if not p21.onlyShowForOwner then
                    return true;
                end;

                local v22 = u19;

                if v22 ~= nil then
                    v22 = v22.attributes.ShopOwner;
                end;

                return v22 == Players.LocalPlayer.UserId;
            end;

            local v23 = 0;
            v18 = {};

            for i, v in v18 do
                local _ = i - 1;
                local v24;

                if v.onlyShowForOwner then
                    local v25;

                    if u19 == nil then
                        v25 = u19;
                    else
                        v25 = u19.attributes.ShopOwner;
                    end;

                    v24 = v25 == Players.LocalPlayer.UserId;
                else
                    v24 = true;
                end;

                if v24 == true then
                    v23 = v23 + 1;
                    v18[v23] = v;
                end;
            end;
        end;
    end;

    local function v29(p26) -- Line: 149
        -- upvalues: BedwarsShop (ref), Players (ref), u13 (copy), ClientStore (ref), DeviceUtil (ref), InventoryUtil (ref), ShopUtil (ref)
        while true do
            local v27 = p26 and p26.nextTier and BedwarsShop.getShopItem(p26.nextTier, Players.LocalPlayer, {
                shopId = u13.props.ShopID
            });

            if not v27 then
                break;
            end;

            local itemTiersPurchased = ClientStore:getState().Bedwars.itemTiersPurchased;
            local v28 = table.find(itemTiersPurchased, p26.itemType) ~= nil;

            if p26.requireInInventoryToTierUp and (not DeviceUtil.isHoarceKat() and (InventoryUtil.getAmount(Players.LocalPlayer, p26.itemType) < 1 and not ShopUtil:ownsSuperiorItem(Players.LocalPlayer, p26))) or not v28 then
                break;
            end;

            p26 = v27;
        end;

        return p26;
    end;

    local v30 = 0;
    local v31 = {};

    for i, v in v18 do
        local v32 = v29(v, i - 1, v18);

        if v32 ~= nil then
            v30 = v30 + 1;
            v31[v30] = v32;
        end;
    end;

    local function _(p33) -- Line: 189
        return p33.itemType;
    end;

    local v34 = table.create(#v31);
    local u35 = {};

    for i, v in v31 do
        local _ = i - 1;
        v34[i] = v.itemType;
    end;

    for _, v in v34 do
        u35[v] = true;
    end;

    local u36 = {};

    local function v38(p37) -- Line: 205
        -- upvalues: u36 (copy), ItemType (ref), ClientStore (ref), u14 (copy), u35 (copy)
        if u36[p37.itemType] ~= nil then
            return false;
        end;

        u36[p37.itemType] = true;

        while p37.nextTier do
            if p37.itemType == ItemType.VOID_CHESTPLATE then
                local itemTiersPurchased = ClientStore:getState().Bedwars.itemTiersPurchased;

                if table.find(itemTiersPurchased, p37.itemType) == nil then
                    break;
                end;
            end;

            p37 = u14[p37.nextTier];

            if not p37 then
                return true;
            end;

            if u35[p37.itemType] ~= nil then
                return false;
            end;
        end;

        return true;
    end;

    local v39 = 0;
    local v40 = {};

    for i, v in v31 do
        if v38(v, i - 1, v31) == true then
            v39 = v39 + 1;
            v40[v39] = v;
        end;
    end;

    local u41 = v40;
    local v42 = {
        WaitForAbsoluteSize = true,
        AdditionalSpace = DeviceUtil.isSmallScreen() and 10 or 20,
        ScrollingFrameProps = {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Size = u13.props.Size or UDim2.fromScale(1, 1),
            Position = u13.props.Position,
            BackgroundColor3 = Theme.backgroundPrimary
        }
    };
    local v43 = {
        ScrollingFramePadding = u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, DeviceUtil.isSmallScreen() and 10 or 20),
            PaddingLeft = UDim.new(0.03, 0),
            PaddingRight = UDim.new(0.03, 0)
        }),
        ScrollingFrameListLayout = u3.createElement("UIListLayout", {
            VerticalAlignment = "Top",
            HorizontalAlignment = "Left",
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, DeviceUtil.isSmallScreen() and 9 or 18)
        })
    };
    local v44 = #v43;
    local v45 = u2.values(BedwarsShopCategory);

    local function v66(u46) -- Line: 272
        -- upvalues: BedwarsShopCategoryMeta (ref), u41 (ref), u13 (copy), BedwarsShopCategory (ref), showRecommendedShop (copy), DeviceUtil (ref), ItemType (ref), KnitClient (ref), getQueueMeta (ref), u3 (ref), ShopCategoryDefault (ref)
        local v47 = BedwarsShopCategoryMeta[u46];

        if v47.disabled or v47.unlockable then
            return nil;
        end;

        local function _(p48) -- Line: 278
            -- upvalues: u46 (copy)
            return p48.category == u46;
        end;

        local v49 = 0;
        local v50 = {};

        for i, v in u41 do
            local _ = i - 1;

            if v.category == u46 == true then
                v49 = v49 + 1;
                v50[v49] = v;
            end;
        end;

        local QueueType = u13.props.QueueType;

        if QueueType then
            if u46 == BedwarsShopCategory.Recommended then
                if not showRecommendedShop then
                    return nil;
                end;

                local u51;

                if DeviceUtil.isHoarceKat() then
                    u51 = { ItemType.LEATHER_CHESTPLATE, ItemType.STONE_SWORD };
                else
                    u51 = KnitClient.Controllers.BedwarsShopController:getRecommendedItems();
                end;

                local function _(p52) -- Line: 300
                    -- upvalues: u51 (copy), BedwarsShopCategory (ref)
                    if p52.requiresKit then
                        return true;
                    end;

                    local v53 = table.find(u51, p52.itemType) ~= nil and p52.category ~= BedwarsShopCategory.Recommended;

                    return v53;
                end;

                local v54 = 0;
                v50 = {};

                for i, v in u41 do
                    local _ = i - 1;
                    local v55;

                    if v.requiresKit then
                        v55 = true;
                    else
                        v55 = table.find(u51, v.itemType) ~= nil and v.category ~= BedwarsShopCategory.Recommended;
                    end;

                    if v55 == true then
                        v54 = v54 + 1;
                        v50[v54] = v;
                    end;
                end;
            end;

            if not DeviceUtil.isHoarceKat() then
                if u46 == BedwarsShopCategory.Random then
                    v50 = KnitClient.Controllers.BedwarsShopController:getRandomlySelectedItemsAsShopItems();
                else
                    local function _(p56) -- Line: 330
                        -- upvalues: KnitClient (ref)
                        local v57 = KnitClient.Controllers.BedwarsShopController:getRandomlySelectedItems();

                        return table.find(v57, p56.itemType) == nil;
                    end;

                    local v58 = 0;
                    v50 = {};

                    for i, v in v50 do
                        local _ = i - 1;
                        local v59 = KnitClient.Controllers.BedwarsShopController:getRandomlySelectedItems();

                        if table.find(v59, v.itemType) == nil == true then
                            v58 = v58 + 1;
                            v50[v58] = v;
                        end;
                    end;
                end;

                if u46 ~= BedwarsShopCategory.Random then
                    local function _(p60) -- Line: 350
                        -- upvalues: QueueType (copy), DeviceUtil (ref)
                        local disabledInQueue = p60.disabledInQueue;

                        if disabledInQueue ~= nil then
                            disabledInQueue = table.find(disabledInQueue, QueueType) ~= nil;
                        end;

                        local disabled = p60.disabled;

                        if DeviceUtil.isHoarceKat() then
                            return nil;
                        end;

                        return not disabledInQueue and not disabled;
                    end;

                    local v61 = false;

                    for i, v in v50 do
                        local _ = i - 1;
                        local disabledInQueue = v.disabledInQueue;

                        if disabledInQueue ~= nil then
                            disabledInQueue = table.find(disabledInQueue, QueueType) ~= nil;
                        end;

                        local disabled = v.disabled;
                        local v62;

                        if DeviceUtil.isHoarceKat() then
                            v62 = nil;
                        else
                            v62 = not disabledInQueue and not disabled;
                        end;

                        if v62 then
                            v61 = true;
                            break;
                        end;
                    end;

                    if not v61 then
                        return nil;
                    end;
                end;
            end;

            local v63 = getQueueMeta(QueueType);

            if v63.rankCategory or v63.disableLimitedTimeItems then
                local function _(p64) -- Line: 382
                    return not p64.limitedTimeItem;
                end;

                local v65 = false;

                for i, v in v50 do
                    local _ = i - 1;

                    if not v.limitedTimeItem then
                        v65 = true;
                        break;
                    end;
                end;

                if not v65 then
                    return nil;
                end;
            end;
        end;

        if #v50 == 0 then
            return u3.createFragment();
        end;

        return u3.createElement(ShopCategoryDefault, {
            LayoutOrder = 1,
            Category = u46,
            ShopItems = v50,
            SelectedItem = u13.props.SelectedItem,
            SetSelectedShopItem = u13.props.SetSelectedShopItem,
            ShopID = u13.props.ShopID
        });
    end;

    local v67 = 0;
    local v68 = {};

    for i, v in v45 do
        local v69 = v66(v, i - 1, v45);

        if v69 ~= nil then
            v67 = v67 + 1;
            v68[v67] = v69;
        end;
    end;

    local v70 = {
        AutomaticSize = "Y",
        LayoutOrder = 1,
        Size = UDim2.fromScale(1, 0)
    };
    local v71 = { u3.createElement("UIListLayout", {
            VerticalAlignment = "Top",
            HorizontalAlignment = "Left",
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 18)
        }) };
    local v72 = #v71;

    for i, v in v68 do
        v71[v72 + i] = v;
    end;

    v43[v44 + 1] = u3.createElement(Empty, v70, v71);
    v43[v44 + 2] = u3.createElement(ShopCategoryUnlockableList, {
        LayoutOrder = 2,
        ShopItems = u41,
        SelectedItem = u13.props.SelectedItem,
        SetSelectedShopItem = u13.props.SetSelectedShopItem,
        ShopID = u13.props.ShopID,
        ObservedInventory = u13.props.ObservedInventory,
        IsHomeBase = u13.props.IsHomeBase,
        QueueType = u13.props.QueueType
    });

    return u3.createElement(AutoCanvasScrollingFrame, v42, v43);
end;

return {
    ShopItemList = v4
};