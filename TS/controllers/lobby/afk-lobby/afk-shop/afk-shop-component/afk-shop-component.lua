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
local AfkShopItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-item-meta").AfkShopItemMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local AfkShopItemTile = RuntimeLib.import(script, script.Parent, "afk-shop-item-tile").AfkShopItemTile;
local getItemColorRarity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-utils").getItemColorRarity;

return {
    AfkShopComponent = v3.new(u2)(function(u4, p5) -- Line: 21
        -- upvalues: AfkShopItemMeta (copy), SoundManager (copy), GameSound (copy), ClientStore (copy), Flamework (copy), BedwarsAppIds (copy), ColorUtil (copy), getItemColorRarity (copy), Theme (copy), KnitClient (copy), UILayers (copy), u2 (copy), AfkShopItemTile (copy), Padding (copy), AutoCanvasScrollingFrame (copy), Empty (copy)
        local _ = p5.useState;

        local function u14(u6) -- Line: 23
            -- upvalues: AfkShopItemMeta (ref), SoundManager (ref), GameSound (ref), ClientStore (ref), Flamework (ref), BedwarsAppIds (ref), ColorUtil (ref), getItemColorRarity (ref), Theme (ref), KnitClient (ref), UILayers (ref)
            local v7 = AfkShopItemMeta[u6];
            SoundManager:playSound(GameSound.UI_OPEN);
            local u8 = ClientStore:getState().Afk.profileData.afkCurrency.currAmount >= v7.price;
            local v9 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
            local CONFIRMATION_MODAL = BedwarsAppIds.CONFIRMATION_MODAL;
            local v10 = {
                Title = "Purchase " .. v7.name .. "?",
                Body = "Are you sure you want to purchase the <font transparency=\"0\" color=\"" .. ColorUtil.richTextColor(getItemColorRarity(v7.price)) .. "\"><b>[" .. v7.name .. "]</b></font> for <font color=\"" .. ColorUtil.richTextColor(Theme.mcGold) .. "\"><b>" .. tostring(v7.price) .. " Afk Coins</b></font>?"
            };
            local v11 = {
                Text = u8 and "Purchase" or "Can\'t Afford"
            };
            local v12;

            if u8 then
                v12 = Theme.backgroundSuccess;
            else
                v12 = Theme.backgroundError;
            end;

            v11.BackgroundColor3 = v12;
            v10.PrimaryBtnProps = v11;
            v10.SecondaryBtnProps = {
                Text = "Cancel"
            };

            function v10.OnPrimaryBtnClick(p13) -- Line: 37
                -- upvalues: u8 (copy), KnitClient (ref), u6 (copy), SoundManager (ref), GameSound (ref)
                if not u8 then
                    return nil;
                end;

                if KnitClient.Controllers.AfkShopController:purchaseItem(u6) then
                    SoundManager:playSound(GameSound.BEDWARS_UPGRADE_SUCCESS);

                    return;
                end;

                SoundManager:playSound(GameSound.ERROR_NOTIFICATION);
            end;

            function v10.OnSecondaryBtnClick() -- Line: 48
                -- upvalues: Flamework (ref), UILayers (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
            end;

            v9:openApp(CONFIRMATION_MODAL, v10);
        end;

        local v15 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v16 = {};
        local _ = #v16;
        local ShopItems = u4.ShopItems;

        local function v23(u17, p18) -- Line: 59
            -- upvalues: u4 (copy), AfkShopItemMeta (ref), u2 (ref), AfkShopItemTile (ref), u14 (copy)
            local AfkShopItemsPurchased = u4.AfkShopItemsPurchased;

            local function _(p19, p20) -- Line: 61
                -- upvalues: u17 (copy)
                if p20.item == u17 then
                    p19 = p19 + 1;
                end;

                return p19;
            end;

            local v21 = 0;

            for i = 1, #AfkShopItemsPurchased do
                local _ = i - 1;

                if AfkShopItemsPurchased[i].item == u17 then
                    v21 = v21 + 1;
                end;
            end;

            local maxPurchases = AfkShopItemMeta[u17].maxPurchases;
            local v22 = maxPurchases == nil and 1 or maxPurchases;

            return u2.createElement(AfkShopItemTile, {
                Item = u17,
                SoldOut = v22 <= v21,
                MaxPurchases = v22,
                TimesPurchased = v21,
                PromptPurchase = u14,
                LayoutOrder = p18
            });
        end;

        local v24 = table.create(#ShopItems);

        for i, v in ShopItems do
            v24[i] = v23(v, i - 1, ShopItems);
        end;

        local v25 = {
            ScrollingFrameProps = {
                LayoutOrder = 2,
                Selectable = false,
                Size = UDim2.fromScale(1, 1)
            }
        };
        local v26 = { u2.createElement(Padding, {
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
        local v27 = #v26;

        for i, v in v24 do
            v26[v27 + i] = v;
        end;

        v16.ShopList = u2.createElement(AutoCanvasScrollingFrame, v25, v26);

        return u2.createFragment({
            EventShop = u2.createElement(Empty, v15, v16)
        });
    end)
};