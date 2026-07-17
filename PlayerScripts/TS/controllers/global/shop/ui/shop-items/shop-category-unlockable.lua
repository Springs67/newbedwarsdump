-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local BedwarsShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local BedwarsShopCategoryMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-meta").BedwarsShopCategoryMeta;
local items = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").items;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local shopPurchaseItem = RuntimeLib.import(script, script.Parent.Parent.Parent, "api", "purchase-item").shopPurchaseItem;
local BedwarsShopItemCard = RuntimeLib.import(script, script.Parent, "shop-item-card").BedwarsShopItemCard;
local v48 = v3.new(u2)(function(u5, p6) -- Line: 20
    -- upvalues: BedwarsShopCategoryMeta (copy), DeviceUtil (copy), ItemType (copy), u2 (copy), Theme (copy), ColorUtil (copy), Empty (copy), Button (copy), items (copy), KnitClient (copy), shopPurchaseItem (copy), BedwarsShop (copy), Players (copy), BedwarsShopItemCard (copy)
    local v7, u8 = p6.useState(Vector2.new(347, 261));
    local u9 = BedwarsShopCategoryMeta[u5.Category];
    local v10 = DeviceUtil.isSmallScreen() and 8 or 14;
    local u11 = true;
    local unlockable = u9.unlockable;

    if unlockable ~= nil then
        unlockable = unlockable.purchaseReq;
    end;

    if unlockable then
        unlockable = not DeviceUtil.isHoarceKat();
    end;

    if unlockable then
        local function _(p12) -- Line: 38
            -- upvalues: u9 (copy)
            local unlockable2 = u9.unlockable;

            if unlockable2 ~= nil then
                unlockable2 = unlockable2.purchaseReq;

                if unlockable2 ~= nil then
                    unlockable2 = unlockable2.currency;
                end;
            end;

            return p12.itemType == unlockable2;
        end;

        local v13 = nil;

        for i, v in u5.ObservedInventory.inventory.items do
            local _ = i - 1;
            local unlockable2 = u9.unlockable;

            if unlockable2 ~= nil then
                unlockable2 = unlockable2.purchaseReq;

                if unlockable2 ~= nil then
                    unlockable2 = unlockable2.currency;
                end;
            end;

            if v.itemType == unlockable2 == true then
                v13 = v;
                break;
            end;
        end;

        if v13 ~= nil then
            v13 = v13.amount;
        end;

        local v14 = 0;
        local unlockable2 = u9.unlockable;

        if unlockable2 ~= nil then
            unlockable2 = unlockable2.purchaseReq;

            if unlockable2 ~= nil then
                unlockable2 = unlockable2.currency;
            end;
        end;

        if unlockable2 == ItemType.DIAMOND and u5.IsHomeBase then
            local observedChest = u5.ObservedInventory.observedChest;

            if observedChest ~= nil then
                observedChest = observedChest.items;

                if observedChest ~= nil then
                    local function _(p15) -- Line: 82
                        -- upvalues: u9 (copy)
                        if p15 == "empty" then
                            return false;
                        end;

                        local unlockable3 = u9.unlockable;

                        if unlockable3 ~= nil then
                            unlockable3 = unlockable3.purchaseReq;

                            if unlockable3 ~= nil then
                                unlockable3 = unlockable3.currency;
                            end;
                        end;

                        return p15.itemType == unlockable3;
                    end;

                    observedChest = nil;

                    for i, v in observedChest do
                        local _ = i - 1;
                        local v16;

                        if v == "empty" then
                            v16 = false;
                        else
                            local unlockable3 = u9.unlockable;

                            if unlockable3 ~= nil then
                                unlockable3 = unlockable3.purchaseReq;

                                if unlockable3 ~= nil then
                                    unlockable3 = unlockable3.currency;
                                end;
                            end;

                            v16 = v.itemType == unlockable3;
                        end;

                        if v16 == true then
                            observedChest = v;
                            break;
                        end;
                    end;
                end;
            end;

            if observedChest ~= nil then
                observedChest = observedChest.amount;
            end;

            v14 = observedChest == nil and 0 or observedChest;
        end;

        local unlockable3 = u9.unlockable;

        if unlockable3 ~= nil then
            unlockable3 = unlockable3.purchaseReq;

            if unlockable3 ~= nil then
                unlockable3 = unlockable3.price;
            end;
        end;

        if unlockable3 <= (v13 == nil and 0 or v13) + v14 then
            u11 = true;
        else
            u11 = false;
        end;
    end;

    local v17 = DeviceUtil.isSmallScreen() and 79 or 69;
    local v18 = math.floor(v7.X * (v17 / 347));
    local v19 = math.floor(v7.X * 0.01488095238095238);
    local u20;

    if u9.unlockable then
        u20 = not (u5.UnlockedShopCategories[u5.Category] ~= nil);
    else
        u20 = false;
    end;

    local v22 = {
        Size = u5.Size or UDim2.new(0.5, -0.02, 0, 0),
        AutomaticSize = "Y",
        LayoutOrder = u5.LayoutOrder,

        [u2.Change.AbsoluteSize] = function(p21) -- Line: 150
            -- upvalues: u8 (copy)
            u8(p21.AbsoluteSize);
        end
    };
    local v23 = {
        TitleLayout = u2.createElement("UIListLayout", {
            VerticalAlignment = "Top",
            HorizontalAlignment = "Left",
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, DeviceUtil.isSmallScreen() and 4 or 8)
        })
    };
    local v24 = #v23;
    local v25 = {
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 35 or 50),
        BackgroundColor3 = Theme.backgroundSecondary
    };
    local v26 = { u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 5)
        }), u2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0.03, 0),
            PaddingRight = UDim.new(0.03, 0)
        }) };
    local v27 = #v26;
    local v28 = {
        Size = UDim2.fromScale(0.57, 0.8),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0, 0.5)
    };
    local v29 = { u2.createElement("UIListLayout", {
            VerticalAlignment = "Center",
            HorizontalAlignment = "Left",
            FillDirection = "Horizontal",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.07, 0)
        }) };
    local v30 = #v29;
    local v31;

    if u9.icon == nil then
        v31 = false;
    else
        v31 = u2.createElement("ImageLabel", {
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.15, 1),
            Image = u9.icon
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }) });
    end;

    if v31 then
        v29[v30 + 1] = v31;
    end;

    local v32 = {
        Size = UDim2.fromScale(0.78, 1)
    };
    local v33 = { u2.createElement("UIListLayout", {
            VerticalAlignment = "Center",
            HorizontalAlignment = "Left",
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 0)
        }), u2.createElement("TextLabel", {
            TextXAlignment = "Left",
            TextScaled = true,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.55),
            TextColor3 = ColorUtil.WHITE,
            Text = u9.name,
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        }, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = v10
            }) }) };
    local v34 = {
        TextXAlignment = "Left",
        Size = UDim2.fromScale(1, 0.45),
        TextColor3 = ColorUtil.WHITE
    };
    local unlockable2 = u9.unlockable;

    if unlockable2 ~= nil then
        unlockable2 = unlockable2.teamUnlock;
    end;

    v34.Text = unlockable2 and "TEAM" or "PERSONAL";
    v34.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
    v34.TextScaled = true;
    v34.TextTransparency = 0.5;
    v34.BackgroundTransparency = 1;
    v34.LayoutOrder = 2;
    v33[#v33 + 1] = u2.createElement("TextLabel", v34, { u2.createElement("UITextSizeConstraint", {
            MaxTextSize = v10 - 2
        }) });
    v29[#v29 + 1] = u2.createElement(Empty, v32, v33);
    v26[v27 + 1] = u2.createElement(Empty, v28, v29);
    local v35;

    if u20 then
        v35 = u9.unlockable;

        if v35 ~= nil then
            v35 = v35.purchaseReq;
        end;

        if v35 then
            local createElement = u2.createElement;
            local v36 = {
                Size = UDim2.fromScale(0.38, 0.8),
                Position = UDim2.fromScale(1, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),
                Text = "<b>" .. tostring(u9.unlockable.purchaseReq.price) .. " " .. items[u9.unlockable.purchaseReq.currency].displayName .. "</b>",
                CornerRadius = UDim.new(0, 3)
            };
            local v37;

            if u11 then
                v37 = Theme.backgroundSuccess;
            else
                v37 = Theme.backgroundError;
            end;

            v36.BackgroundColor3 = v37;

            function v36.OnClick() -- Line: 272
                -- upvalues: u11 (ref), KnitClient (ref), u5 (copy)
                if not u11 then
                    return nil;
                end;

                KnitClient.Controllers.BedwarsShopController:purchaseShopCategory(u5.Category);
            end;

            v35 = createElement(Button, v36);
        end;
    else
        v35 = u20;
    end;

    if v35 then
        v26[v27 + 2] = v35;
    end;

    v23[v24 + 1] = u2.createElement("Frame", v25, v26);
    local ShopItems = u5.ShopItems;

    local function v43(u38, p39) -- Line: 286
        -- upvalues: u5 (copy), shopPurchaseItem (ref), BedwarsShop (ref), Players (ref), KnitClient (ref), u20 (copy), u2 (ref), BedwarsShopItemCard (ref)
        local v40 = {
            ShopItem = u38,
            LayoutOrder = p39
        };
        local SelectedItem = u5.SelectedItem;

        if SelectedItem ~= nil then
            SelectedItem = SelectedItem.itemType;
        end;

        v40.Selected = SelectedItem == u38.itemType;

        function v40.OnClick() -- Line: 296
            -- upvalues: u5 (ref), u38 (copy)
            u5.SetSelectedShopItem(u38);
        end;

        function v40.OnRightClick() -- Line: 299
            -- upvalues: shopPurchaseItem (ref), u38 (copy), u5 (ref), BedwarsShop (ref), Players (ref), KnitClient (ref)
            shopPurchaseItem(u38, u5.ShopID):andThen(function(p41) -- Line: 301
                -- upvalues: u38 (ref), u5 (ref), BedwarsShop (ref), Players (ref), KnitClient (ref)
                if not p41 then
                    u5.SetSelectedShopItem(u38);

                    return;
                end;

                if u38.nextTier then
                    u5.SetSelectedShopItem(BedwarsShop.getShopItem(u38.nextTier, Players.LocalPlayer, {
                        shopId = u5.ShopID
                    }));
                elseif u38.tiered then
                    KnitClient.Controllers.BedwarsShopController.alreadyPurchasedMap[u38.itemType] = true;
                end;

                local v42;

                if u38.nextTier then
                    v42 = BedwarsShop.getShopItem(u38.nextTier, Players.LocalPlayer);
                else
                    v42 = u38;
                end;

                u5.SetSelectedShopItem(v42);
            end);
        end;

        v40.Locked = u20;

        return u2.createElement(BedwarsShopItemCard, v40);
    end;

    local v44 = table.create(#ShopItems);

    for i, v in ShopItems do
        v44[i] = v43(v, i - 1, ShopItems);
    end;

    local v45 = {
        AutomaticSize = "Y",
        LayoutOrder = 2,
        Size = UDim2.new(1, 0, 0, 0)
    };
    local v46 = { u2.createElement("UIGridLayout", {
            HorizontalAlignment = "Left",
            VerticalAlignment = "Top",
            SortOrder = "LayoutOrder",
            FillDirectionMaxCells = 4,
            CellSize = UDim2.fromOffset(v18, v18),
            CellPadding = UDim2.fromOffset(v19, v19)
        }) };
    local v47 = #v46;

    for i, v in v44 do
        v46[v47 + i] = v;
    end;

    v23[v24 + 2] = u2.createElement(Empty, v45, v46);

    return u2.createElement(Empty, v22, v23);
end);

return {
    ShopCategoryUnlockable = v4.connect(function(p49, p50) -- Line: 352
        local v51 = {};

        for i, v in p50 do
            v51[i] = v;
        end;

        v51.UnlockedShopCategories = p49.Game.unlockedShopCategories;

        return v51;
    end)(v48)
};