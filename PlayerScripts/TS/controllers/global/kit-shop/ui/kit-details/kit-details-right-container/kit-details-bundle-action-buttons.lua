-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local PurchaseButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "purchase-button").PurchaseButton;
local SquareImageButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "square-image-button").SquareImageButton;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BundleMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta;
local GiftUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-utils").GiftUtils;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local MarketplaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "marketplace-util").MarketplaceUtil;

return {
    KitDetailsBundleActionButtons = v3.new(u2)(function(u4, p5) -- Line: 19
        -- upvalues: BundleMeta (copy), GiftUtils (copy), MarketplaceUtil (copy), u2 (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), PurchaseButton (copy), SquareImageButton (copy), BedwarsImageId (copy), Flamework (copy), BedwarsAppIds (copy), UILayers (copy), Empty (copy)
        local useEffect = p5.useEffect;
        local u6 = BundleMeta[u4.SelectedKitBundle];
        local v7, u8 = p5.useState(nil);
        local v9 = GiftUtils.isBundleGift(u4.SelectedKitBundle);
        useEffect(function() -- Line: 26
            -- upvalues: u8 (copy), u6 (copy), MarketplaceUtil (ref)
            u8(nil);

            if u6.gamepassId == nil then
                if u6.devProductId ~= nil then
                    MarketplaceUtil.getDevProductInfoAsync(u6.devProductId):andThen(function(p10) -- Line: 43
                        -- upvalues: u8 (ref)
                        local v11;

                        if p10 == nil then
                            v11 = p10;
                        else
                            v11 = p10.PriceInRobux;
                        end;

                        if v11 == nil then
                            return nil;
                        end;

                        u8(p10.PriceInRobux);
                    end):catch(function() -- Line: 53
                    end);
                end;

                return;
            end;

            MarketplaceUtil.getGamePassProductInfoAsync(u6.gamepassId):andThen(function(p12) -- Line: 30
                -- upvalues: u8 (ref)
                local v13;

                if p12 == nil then
                    v13 = p12;
                else
                    v13 = p12.PriceInRobux;
                end;

                if v13 == nil then
                    return nil;
                end;

                u8(p12.PriceInRobux);
            end):catch(function() -- Line: 40
            end);
        end, { u4.SelectedKitBundle });

        local function _(p14) -- Line: 58
            if p14.kit then
                return p14.kit;
            end;

            return nil;
        end;

        local v15 = 0;
        local v16 = {};
        local v17 = true;

        for i, v in u6.rewards do
            local _ = i - 1;
            local v18;

            if v.kit then
                v18 = v.kit;
            else
                v18 = nil;
            end;

            if v18 ~= nil then
                v15 = v15 + 1;
                v16[v15] = v18;
            end;
        end;

        local function _(p19) -- Line: 72
            -- upvalues: u4 (copy)
            return table.find(u4.store.Bedwars.ownedKits, p19) ~= nil;
        end;

        local v20 = true;

        for i, v in v16 do
            local _ = i - 1;

            if table.find(u4.store.Bedwars.ownedKits, v) == nil then
                v20 = false;
                break;
            end;
        end;

        if v20 then
            v17 = false;
        end;

        local v21 = {};

        for i, v in u4 do
            v21[i] = v;
        end;

        v21.SelectedKitBundle = nil;
        v21.store = nil;
        local v22 = {};

        for i, v in v21 do
            v22[i] = v;
        end;

        local v23 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 10)
            }) };

        if v17 then
            local v24 = {
                Title = "PURCHASE BUNDLE",
                Size = UDim2.new(0.8, -10, 1, 0)
            };
            local v25 = {};

            if v7 == nil then
                v7 = u6.price;
            end;

            v25.robux = v7;
            v24.Cost = { v25 };
            v24.Selectable = true;

            function v24.OnClick() -- Line: 126
                -- upvalues: SoundManager (ref), GameSound (ref), KnitClient (ref), u4 (copy)
                SoundManager:playSound(GameSound.UI_CLICK);
                KnitClient.Controllers.LobbyBundleController:purchaseBundle(u4.SelectedKitBundle);
            end;

            v24.LayoutOrder = 0;
            v17 = u2.createElement(PurchaseButton, v24);
        end;

        local v26 = {
            Size = UDim2.fromScale(1, 0.333)
        };
        local v27 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 10),
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v28 = #v27;

        if v17 then
            v27[v28 + 1] = v17;
        end;

        local v29 = #v27;

        if v9 then
            v9 = u2.createElement(SquareImageButton, {
                Selectable = true,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.2, 1),
                BackgroundColor3 = Color3.fromRGB(84, 214, 235),
                Image = BedwarsImageId.GIFT_SOLID,

                OnClick = function() -- Line: 155, Name: OnClick
                    -- upvalues: SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), u4 (copy), UILayers (ref)
                    SoundManager:playSound(GameSound.UI_CLICK);
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.GIFTING, {
                        GiftType = u4.SelectedKitBundle
                    }, UILayers.OVERLAY);
                end
            });
        end;

        if v9 then
            v27[v29 + 1] = v9;
        end;

        v23[#v23 + 1] = u2.createElement(Empty, v26, v27);

        return u2.createElement(Empty, v22, v23);
    end)
};