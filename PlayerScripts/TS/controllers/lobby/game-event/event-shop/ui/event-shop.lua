-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local EventCurrencyMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-currency", "event-currency-metadata").EventCurrencyMeta;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local EventShopItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item-meta").EventShopItemMeta;
local EventUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local EventShopItemTile = RuntimeLib.import(script, script.Parent, "event-shop-item-tile").EventShopItemTile;

return {
    EventShop = v3.new(u2)(function(u4, p5) -- Line: 23
        -- upvalues: EventShopItemMeta (copy), EventMeta (copy), EventCurrencyMeta (copy), SoundManager (copy), GameSound (copy), ClientStore (copy), Flamework (copy), BedwarsAppIds (copy), ColorUtil (copy), EventUtil (copy), Theme (copy), KnitClient (copy), UILayers (copy), u2 (copy), EventShopItemTile (copy), Padding (copy), AutoCanvasScrollingFrame (copy), Empty (copy)
        local _ = p5.useState;

        local function u17(u6) -- Line: 25
            -- upvalues: EventShopItemMeta (ref), EventMeta (ref), u4 (copy), EventCurrencyMeta (ref), SoundManager (ref), GameSound (ref), ClientStore (ref), Flamework (ref), BedwarsAppIds (ref), ColorUtil (ref), EventUtil (ref), Theme (ref), KnitClient (ref), UILayers (ref)
            local v7 = EventShopItemMeta[u6];
            local v8 = v7.currency or EventMeta[u4.EventType].currencies[1];
            local v9 = EventCurrencyMeta[v7.currency or EventMeta[u4.EventType].currencies[1]];
            SoundManager:playSound(GameSound.UI_OPEN);
            local v10 = ClientStore:getState().Event.profileData.currencies[v8];

            if v10 ~= nil then
                v10 = v10.currAmount;
            end;

            local u11 = (v10 == nil and 0 or v10) >= v7.price;
            local v12 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
            local CONFIRMATION_MODAL = BedwarsAppIds.CONFIRMATION_MODAL;
            local v13 = {
                Title = "Purchase " .. v7.name .. "?",
                Body = "Are you sure you want to purchase the <font transparency=\"0\" color=\"" .. ColorUtil.richTextColor(EventUtil.getItemColorRarity(v7.price)) .. "\"><b>[" .. v7.name .. "]</b></font> for <font color=\"" .. ColorUtil.richTextColor(Theme.mcGold) .. "\"><b>" .. tostring(v7.price) .. " " .. v9.name .. "</b></font>?"
            };
            local v14 = {
                Text = u11 and "Purchase" or "Can\'t Afford"
            };
            local v15;

            if u11 then
                v15 = Theme.backgroundSuccess;
            else
                v15 = Theme.backgroundError;
            end;

            v14.BackgroundColor3 = v15;
            v13.PrimaryBtnProps = v14;
            v13.SecondaryBtnProps = {
                Text = "Cancel"
            };

            function v13.OnPrimaryBtnClick(p16) -- Line: 49
                -- upvalues: u11 (copy), KnitClient (ref), u6 (copy), u4 (ref), SoundManager (ref), GameSound (ref)
                if not u11 then
                    return nil;
                end;

                if KnitClient.Controllers.EventShopContoller:purchaseItem(u6, u4.EventType) then
                    SoundManager:playSound(GameSound.BEDWARS_UPGRADE_SUCCESS);

                    return;
                end;

                SoundManager:playSound(GameSound.ERROR_NOTIFICATION);
            end;

            function v13.OnSecondaryBtnClick() -- Line: 60
                -- upvalues: Flamework (ref), UILayers (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
            end;

            v12:openApp(CONFIRMATION_MODAL, v13);
        end;

        local v18 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v19 = {};
        local _ = #v19;
        local items = u4.Shop.items;
        table.sort(items, function(p20, p21) -- Line: 71
            -- upvalues: EventShopItemMeta (ref)
            return EventShopItemMeta[p20].name > EventShopItemMeta[p21].name;
        end);
        table.sort(items, function(p22, p23) -- Line: 75
            -- upvalues: EventShopItemMeta (ref)
            return EventShopItemMeta[p22].price > EventShopItemMeta[p23].price;
        end);
        table.sort(items, function(p24, p25) -- Line: 79
            -- upvalues: EventShopItemMeta (ref)
            local shopDisplayOrder = EventShopItemMeta[p24].shopDisplayOrder;
            local shopDisplayOrder2 = EventShopItemMeta[p25].shopDisplayOrder;

            return (shopDisplayOrder == nil and 0 or shopDisplayOrder) < (shopDisplayOrder2 == nil and 0 or shopDisplayOrder2);
        end);

        local function v36(u26, p27) -- Line: 91
            -- upvalues: u4 (copy), EventShopItemMeta (ref), u2 (ref), EventShopItemTile (ref), u17 (copy)
            local EventShopItemsPurchased = u4.EventShopItemsPurchased;

            local function _(p28, p29) -- Line: 93
                -- upvalues: u26 (copy)
                if p29.item == u26 then
                    p28 = p28 + 1;
                end;

                return p28;
            end;

            local v30 = 0;

            for i = 1, #EventShopItemsPurchased do
                local _ = i - 1;

                if EventShopItemsPurchased[i].item == u26 then
                    v30 = v30 + 1;
                end;
            end;

            local v31 = EventShopItemMeta[u26];
            local maxPurchasesPerEvent = v31.maxPurchasesPerEvent;
            local v32 = maxPurchasesPerEvent == nil and 1 or maxPurchasesPerEvent;
            local v33 = v32 <= v30;

            if v31.maxPurchasesPerEvent == nil then
                local function _(p34) -- Line: 118
                    -- upvalues: u26 (copy)
                    return p34.item == u26;
                end;

                local v35 = nil;

                for i, v in u4.AllTimeItemsPurchased do
                    local _ = i - 1;

                    if v.item == u26 == true then
                        v35 = v;
                        break;
                    end;
                end;

                if v35 then
                    v33 = true;
                end;
            end;

            return u2.createElement(EventShopItemTile, {
                Item = u26,
                SoldOut = v33,
                MaxPurchases = v32,
                TimesPurchased = v30,
                PromptPurchase = u17,
                EventType = u4.EventType,
                LayoutOrder = p27
            });
        end;

        local v37 = table.create(#items);

        for i, v in items do
            v37[i] = v36(v, i - 1, items);
        end;

        local v38 = {
            AdditionalSpace = 200,
            ScrollingFrameProps = {
                LayoutOrder = 2,
                Selectable = false,
                Size = UDim2.fromScale(1, 1)
            }
        };
        local v39 = { u2.createElement(Padding, {
                Padding = {
                    Vertical = 2,
                    Horizontal = 2
                }
            }), u2.createElement("UIGridLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Left",
                FillDirectionMaxCells = 4,
                SortOrder = "LayoutOrder",
                CellSize = UDim2.new(0, 136, 0, 162),
                CellPadding = UDim2.fromOffset(8, 8)
            }) };
        local v40 = #v39;

        for i, v in v37 do
            v39[v40 + i] = v;
        end;

        v19.ShopList = u2.createElement(AutoCanvasScrollingFrame, v38, v39);

        return u2.createFragment({
            EventShop = u2.createElement(Empty, v18, v19)
        });
    end)
};