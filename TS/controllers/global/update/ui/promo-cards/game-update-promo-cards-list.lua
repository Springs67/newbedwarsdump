-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local AutoCanvasScrollingFrame = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AutoCanvasScrollingFrame;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local MarketplaceService = v3.MarketplaceService;
local Players = v3.Players;
local KitViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local getBattlePassMetadata = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-meta").getBattlePassMetadata;
local RobuxProductType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "store-consts").RobuxProductType;
local GameUpdateButtons = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "update", "game-update-meta").GameUpdateButtons;
local getKitPriceRobuxAsync = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getKitPriceRobuxAsync;
local MarketplaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "marketplace-util").MarketplaceUtil;
local GameUpdatePromoCard = RuntimeLib.import(script, script.Parent, "promo-card", "game-update-promo-card").GameUpdatePromoCard;

return {
    GameUpdatePromoCardsList = v2.new(u1)(function(u4, p5) -- Line: 18
        -- upvalues: getBedwarsKitMeta (copy), getKitPriceRobuxAsync (copy), getBattlePassMetadata (copy), BattlePassUtils (copy), RobuxProductType (copy), MarketplaceUtil (copy), MarketplaceService (copy), Players (copy), GameUpdateButtons (copy), u1 (copy), KitViewport (copy), GameUpdatePromoCard (copy), AutoCanvasScrollingFrame (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local _, u6 = useState(0);
        local v7, u8 = useState(0);
        local u9, u10 = useState(nil);
        useEffect(function() -- Line: 24
            -- upvalues: u4 (copy), getBedwarsKitMeta (ref), u10 (copy), getKitPriceRobuxAsync (ref), u8 (copy), getBattlePassMetadata (ref), BattlePassUtils (ref), RobuxProductType (ref), MarketplaceUtil (ref), u6 (copy)
            if u4.store.GameUpdates.newestKit then
                u10((getBedwarsKitMeta(u4.store.GameUpdates.newestKit)));
                getKitPriceRobuxAsync(u4.store.GameUpdates.newestKit):andThen(function(p11) -- Line: 29
                    -- upvalues: u8 (ref)
                    if p11 == nil then
                        return nil;
                    end;

                    u8(p11);
                end):catch(function() -- Line: 35
                end);
            end;

            local v12 = getBattlePassMetadata(BattlePassUtils.BATTLE_PASS_SEASON);
            local paidTrackProduct = v12.paidTrackProduct;

            if paidTrackProduct ~= nil then
                paidTrackProduct = paidTrackProduct.productType;
            end;

            if paidTrackProduct == RobuxProductType.GamePass then
                MarketplaceUtil.getGamePassProductInfoAsync(v12.paidTrackProduct.productId):andThen(function(p13) -- Line: 44
                    -- upvalues: u6 (ref)
                    local v14;

                    if p13 == nil then
                        v14 = p13;
                    else
                        v14 = p13.PriceInRobux;
                    end;

                    if v14 == nil then
                        return nil;
                    end;

                    u6(p13.PriceInRobux);
                end):catch(function() -- Line: 54
                end);
            end;
        end, {});

        local function u19() -- Line: 57
            -- upvalues: u4 (copy), u9 (copy), MarketplaceService (ref), Players (ref)
            if table.find(u4.store.Bedwars.ownedKits, u4.store.GameUpdates.newestKit) ~= nil then
                return nil;
            end;

            local v15 = u9;

            if v15 ~= nil then
                v15 = v15.gamepassId;
            end;

            if v15 == nil then
                local v16 = u9;

                if v16 ~= nil then
                    v16 = v16.devProductId;
                end;

                if v16 ~= nil then
                    local v17 = u9;

                    if v17 ~= nil then
                        v17 = v17.devProductId;
                    end;

                    MarketplaceService:PromptProductPurchase(Players.LocalPlayer, v17);
                end;

                return;
            end;

            local v18 = u9;

            if v18 ~= nil then
                v18 = v18.gamepassId;
            end;

            MarketplaceService:PromptGamePassPurchase(Players.LocalPlayer, v18);
        end;

        local v20;

        if u4.store.GameUpdates.newestKit == nil then
            v20 = false;
        else
            v20 = u9;
        end;

        if v20 then
            local v21 = {
                store = u4.store,
                PromoCard = {
                    ItemType = "NEWEST KIT",
                    BannerImage = GameUpdateButtons.newestKitBG,
                    PromoItemImageElement = u1.createElement(KitViewport, {
                        ZIndex = 4,
                        Kit = u4.store.GameUpdates.newestKit,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5)
                    }),
                    Name = u9.name,
                    Price = v7,
                    Description = u9.description,

                    OnClick = function() -- Line: 108, Name: OnClick
                        -- upvalues: u19 (copy)
                        u19();
                    end,

                    isOwned = table.find(u4.store.Bedwars.ownedKits, u4.store.GameUpdates.newestKit) ~= nil
                },
                LayoutOrder = 2
            };
            v20 = u1.createElement(GameUpdatePromoCard, v21);
        end;

        local v22 = {
            ScrollingFrameProps = {
                Size = u4.Size,
                LayoutOrder = u4.LayoutOrder
            }
        };
        local v23 = { u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 6)
            }) };
        local v24 = #v23;

        if v20 then
            v23[v24 + 1] = v20;
        end;

        return u1.createFragment({
            UpdateActionButtons = u1.createElement(AutoCanvasScrollingFrame, v22, v23)
        });
    end)
};