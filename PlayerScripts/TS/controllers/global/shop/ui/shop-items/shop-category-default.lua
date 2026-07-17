-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local BedwarsShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local BedwarsShopCategoryMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-meta").BedwarsShopCategoryMeta;
local BedwarsShopCategory = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory;
local shopPurchaseItem = RuntimeLib.import(script, script.Parent.Parent.Parent, "api", "purchase-item").shopPurchaseItem;
local BedwarsShopItemCard = RuntimeLib.import(script, script.Parent, "shop-item-card").BedwarsShopItemCard;

return {
    ShopCategoryDefault = v3.new(u2)(function(u4, p5) -- Line: 16
        -- upvalues: BedwarsShopCategoryMeta (copy), DeviceUtil (copy), BedwarsShopCategory (copy), u2 (copy), ColorUtil (copy), shopPurchaseItem (copy), BedwarsShop (copy), Players (copy), KnitClient (copy), BedwarsShopItemCard (copy), Empty (copy)
        local _ = p5.useEffect;
        local v6, u7 = p5.useState(Vector2.new(694, 523));
        local v8 = BedwarsShopCategoryMeta[u4.Category];
        local v9 = (DeviceUtil.isSmallScreen() and 10 or 20) + 2;
        local v10 = DeviceUtil.isSmallScreen() and 93 or 69;
        local v11 = math.floor(v6.X * (v10 / 694)) * (u4.Category == BedwarsShopCategory.Recommended and 1.1 or 1);
        local v12 = math.floor(v6.X * 0.01488095238095238);
        local v14 = {
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = "Y",

            [u2.Change.AbsoluteSize] = function(p13) -- Line: 29
                -- upvalues: u7 (copy)
                u7(p13.AbsoluteSize);
            end
        };
        local displayLayoutOrder = v8.displayLayoutOrder;
        v14.LayoutOrder = displayLayoutOrder == nil and 0 or displayLayoutOrder;
        local v15 = {
            TitleLayout = u2.createElement("UIListLayout", {
                VerticalAlignment = "Top",
                HorizontalAlignment = "Left",
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, DeviceUtil.isSmallScreen() and 4 or 8)
            }),
            CategoryTitle = u2.createElement("TextLabel", {
                TextXAlignment = "Left",
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0, v9),
                TextColor3 = ColorUtil.WHITE,
                Text = v8.name,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 22
                }) })
        };
        local v16 = #v15;
        local ShopItems = u4.ShopItems;

        local function v24(u17, p18) -- Line: 63
            -- upvalues: u4 (copy), shopPurchaseItem (ref), BedwarsShop (ref), Players (ref), KnitClient (ref), u2 (ref), BedwarsShopItemCard (ref)
            local v19 = {
                ShopItem = u17,
                LayoutOrder = p18
            };
            local SelectedItem = u4.SelectedItem;

            if SelectedItem ~= nil then
                SelectedItem = SelectedItem.itemType;
            end;

            v19.Selected = SelectedItem == u17.itemType;

            function v19.OnClick() -- Line: 73
                -- upvalues: u4 (ref), u17 (copy)
                u4.SetSelectedShopItem(u17);
            end;

            function v19.OnRightClick() -- Line: 76
                -- upvalues: shopPurchaseItem (ref), u17 (copy), u4 (ref), BedwarsShop (ref), Players (ref), KnitClient (ref)
                shopPurchaseItem(u17, u4.ShopID):andThen(function(p20) -- Line: 78
                    -- upvalues: u17 (ref), BedwarsShop (ref), Players (ref), u4 (ref), KnitClient (ref)
                    if not p20 then
                        u4.SetSelectedShopItem(u17);

                        return;
                    end;

                    if u17.nextTier then
                        local v21 = BedwarsShop.getShopItem(u17.nextTier, Players.LocalPlayer, {
                            shopId = u4.ShopID
                        });
                        u4.SetSelectedShopItem(v21);
                    elseif u17.tiered then
                        KnitClient.Controllers.BedwarsShopController.alreadyPurchasedMap[u17.itemType] = true;
                    end;

                    local v22;

                    if u17.nextTier then
                        local function _(p23) -- Line: 93
                            -- upvalues: u17 (ref)
                            return p23.itemType == u17.nextTier;
                        end;

                        v22 = nil;

                        for i, v in u4.ShopItems do
                            local _ = i - 1;

                            if v.itemType == u17.nextTier == true then
                                v22 = v;
                                break;
                            end;
                        end;
                    else
                        v22 = u17;
                    end;

                    u4.SetSelectedShopItem(v22);
                end);
            end;

            return u2.createElement(BedwarsShopItemCard, v19);
        end;

        local v25 = table.create(#ShopItems);

        for i, v in ShopItems do
            v25[i] = v24(v, i - 1, ShopItems);
        end;

        local v26 = {
            AutomaticSize = "Y",
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0)
        };
        local v27 = { u2.createElement("UIGridLayout", {
                HorizontalAlignment = "Left",
                VerticalAlignment = "Top",
                SortOrder = "LayoutOrder",
                FillDirectionMaxCells = 8,
                CellSize = UDim2.new(0, v11, 0, v11),
                CellPadding = UDim2.fromOffset(v12, v12)
            }) };
        local v28 = #v27;

        for i, v in v25 do
            v27[v28 + i] = v;
        end;

        v15[v16 + 1] = u2.createElement(Empty, v26, v27);
        local v29;

        if u4.Category == BedwarsShopCategory.Recommended then
            v29 = u2.createFragment({
                ShopCategoryBorder = u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 0.3,
                    LayoutOrder = 9,
                    Size = UDim2.new(1, 0, 0, 1),
                    BackgroundColor3 = ColorUtil.WHITE
                })
            });
        else
            v29 = false;
        end;

        if v29 then
            v15[v16 + 2] = v29;
        end;

        return u2.createElement(Empty, v14, v15);
    end)
};