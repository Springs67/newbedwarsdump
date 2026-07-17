-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v6.Players;
local Workspace = v6.Workspace;
local BedcoinPurchaseButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "bedcoin-purchase-button").BedcoinPurchaseButton;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BedCoinDevProductInfoList = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bed-coin", "bed-coin-devproducts").BedCoinDevProductInfoList;
local BundleMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta;
local BundleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-type").BundleType;
local GameReset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game-reset", "game-reset").GameReset;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta");
local BedwarsKitSkinMeta = v7.BedwarsKitSkinMeta;
local MAX_NEW_SKIN_AGE = v7.MAX_NEW_SKIN_AGE;
local BedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local GiftType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType;
local LobbyGadgetType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
local getLobbyGadgetImage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-utils").getLobbyGadgetImage;
local TitleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
local DevProduct = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "devproduct").DevProduct;
local Gamepass = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local getDailyStoreItemMetadata = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "robux-daily-store", "robux-daily-store-items").getDailyStoreItemMetadata;
local v8 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "store-consts");
local RobuxProductType = v8.RobuxProductType;
local StoreCurrency = v8.StoreCurrency;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local NewPlayerBundleClientUtil = RuntimeLib.import(script, script.Parent, "new-player-bundle-util-client").NewPlayerBundleClientUtil;
local RobuxStoreBannerCard = RuntimeLib.import(script, script.Parent, "robux-store-banner-card").RobuxStoreBannerCard;
local RobuxStoreItemRewardCard = RuntimeLib.import(script, script.Parent, "robux-store-item-reward-card").RobuxStoreItemRewardCard;
local RobuxStoreItemShowcaseCard = RuntimeLib.import(script, script.Parent, "robux-store-item-showcase-card").RobuxStoreItemShowcaseCard;
local v126 = v4.new(u3)(function(u9, p10) -- Line: 43
    -- upvalues: NewPlayerBundleClientUtil (copy), u2 (copy), BundleMeta (copy), BundleType (copy), DeviceUtil (copy), Players (copy), Workspace (copy), RobuxProductType (copy), u3 (copy), RobuxStoreBannerCard (copy), BedwarsKitMeta (copy), MAX_NEW_SKIN_AGE (copy), Flamework (copy), BedwarsAppIds (copy), BedwarsKitSkinMeta (copy), RobuxStoreItemShowcaseCard (copy), KnitClient (copy), default (copy), DevProduct (copy), getDailyStoreItemMetadata (copy), StoreCurrency (copy), Empty (copy), Countdown (copy), GameReset (copy), BedcoinPurchaseButton (copy), RobuxStoreItemRewardCard (copy), GiftType (copy), Gamepass (copy), getLobbyGadgetImage (copy), LobbyGadgetType (copy), ColorUtil (copy), Theme (copy), TitleType (copy), BedCoinDevProductInfoList (copy)
    local useState = p10.useState;
    local useEffect = p10.useEffect;
    local u11, u12 = useState(NewPlayerBundleClientUtil.shouldShowNewPlayerBundle());
    local u13, u14 = useState(nil);
    useEffect(function() -- Line: 48
        -- upvalues: u2 (ref), BundleMeta (ref), BundleType (ref), DeviceUtil (ref), Players (ref), Workspace (ref), RobuxProductType (ref), u11 (copy), u3 (ref), RobuxStoreBannerCard (ref), BedwarsKitMeta (ref), MAX_NEW_SKIN_AGE (ref), Flamework (ref), BedwarsAppIds (ref), BedwarsKitSkinMeta (ref), RobuxStoreItemShowcaseCard (ref), u9 (copy), u14 (copy)
        local u15 = os.time();
        local v16 = u2.entries(BundleMeta);
        table.sort(v16, function(p17, p18) -- Line: 51
            local storeUI = p17[2].storeUI;

            if storeUI ~= nil then
                storeUI = storeUI.displayOrder;
            end;

            local storeUI2 = p18[2].storeUI;

            if storeUI2 ~= nil then
                storeUI2 = storeUI2.displayOrder;
            end;

            return (storeUI == nil and 1000 or storeUI) < (storeUI2 == nil and 1000 or storeUI2);
        end);

        local function v29(p19, p20) -- Line: 71
            -- upvalues: BundleType (ref), DeviceUtil (ref), Players (ref), Workspace (ref), RobuxProductType (ref), u11 (ref), u3 (ref), RobuxStoreBannerCard (ref)
            local v21 = p19[1];
            local v22 = p19[2];

            if v22.disabled then
                return nil;
            end;

            local storeUI = v22.storeUI;

            if storeUI ~= nil then
                storeUI = storeUI.disableDisplay;
            end;

            if storeUI then
                return nil;
            end;

            if v21 == BundleType.NEW_PLAYER_BUNDLE then
                return nil;
            end;

            local devProductId = v22.devProductId;

            if devProductId == nil then
                devProductId = v22.gamepassId;
            end;

            if devProductId == nil then
                return nil;
            end;

            local v23;

            if DeviceUtil.isHoarceKat() then
                v23 = false;
            else
                v23 = Players.LocalPlayer:GetAttribute("Purchased" .. v21);
            end;

            if v22.limitedTimeEndTime ~= nil and Workspace:GetServerTimeNow() > v22.limitedTimeEndTime then
                return nil;
            end;

            local v24 = {
                Title = v22.name
            };
            local v25 = {};
            local image = v22.image;
            v25.Image = image == nil and "" or image;
            v24.BackgroundImage = v25;
            local storeUI2 = v22.storeUI;

            if storeUI2 ~= nil then
                storeUI2 = storeUI2.backgroundGradient;
            end;

            v24.BackgroundGradient = storeUI2;
            local v26 = {
                Price = v22.price,
                ProductId = devProductId
            };
            local devProductId2 = v22.devProductId;
            local v27;

            if devProductId2 == 0 or (devProductId2 ~= devProductId2 or not devProductId2) then
                v27 = RobuxProductType.GamePass;
            else
                v27 = RobuxProductType.DevProduct;
            end;

            v26.ProductType = v27;
            v26.GiftType = v21;
            v24.Product = v26;
            v24.Contents = {
                Rewards = v22.rewards
            };
            v24.IsOwned = v23;
            local originalPrice = v22.originalPrice;
            v24.Discount = originalPrice ~= 0 and (originalPrice == originalPrice and originalPrice) and {
                OriginalPrice = v22.originalPrice
            } or nil;
            local v28 = {};
            local storeUI3 = v22.storeUI;

            if storeUI3 ~= nil then
                storeUI3 = storeUI3.rippleEffect;
            end;

            if storeUI3 == nil then
                storeUI3 = false;
            end;

            v28.Ripple = storeUI3;
            v24.Effects = v28;
            v24.EndTime = v22.limitedTimeEndTime;
            v24.LayoutOrder = 1;
            v24.GamepadShouldAutoSelect = not u11 and p20 == 0;

            return u3.createElement(RobuxStoreBannerCard, v24);
        end;

        local v30 = 0;
        local u31 = {};

        for i, v in v16 do
            local v32 = v29(v, i - 1, v16);

            if v32 ~= nil then
                v30 = v30 + 1;
                u31[v30] = v32;
            end;
        end;

        local function _(p33) -- Line: 163
            -- upvalues: u15 (copy), MAX_NEW_SKIN_AGE (ref)
            local releaseTime = p33[2].releaseTime;

            return u15 - (releaseTime == nil and 0 or releaseTime) <= MAX_NEW_SKIN_AGE;
        end;

        local v34 = 0;
        local v35 = {};

        for i, v in u2.entries(BedwarsKitMeta) do
            local _ = i - 1;
            local releaseTime = v[2].releaseTime;

            if u15 - (releaseTime == nil and 0 or releaseTime) <= MAX_NEW_SKIN_AGE == true then
                v34 = v34 + 1;
                v35[v34] = v;
            end;
        end;

        table.sort(v35, function(p36, p37) -- Line: 181
            local name = p36[2].name;
            local name2 = p37[2].name;

            return (name == nil and "" or name) < (name2 == nil and "" or name2);
        end);

        local function v48(p38, p39) -- Line: 193
            -- upvalues: RobuxProductType (ref), Flamework (ref), BedwarsAppIds (ref), u11 (ref), u31 (copy), u3 (ref), RobuxStoreBannerCard (ref)
            local u40 = p38[1];
            local v41 = p38[2];
            local gamepassId = v41.gamepassId;

            if gamepassId == 0 or (gamepassId ~= gamepassId or not gamepassId) then
                gamepassId = v41.devProductId;
            end;

            local basePriceRobux = v41.basePriceRobux;

            if basePriceRobux == 0 then
                basePriceRobux = false;
            elseif basePriceRobux ~= basePriceRobux then
                basePriceRobux = false;
            end;

            local v42 = not basePriceRobux;

            if not v42 then
                local v43;

                if gamepassId == 0 then
                    v43 = false;
                elseif gamepassId == gamepassId then
                    v43 = gamepassId;
                else
                    v43 = false;
                end;

                v42 = not v43;
            end;

            if v42 then
                return nil;
            end;

            local v44 = {
                Title = v41.name .. " Kit"
            };
            local v45 = {
                Price = v41.basePriceRobux,
                GiftType = u40,
                ProductId = gamepassId
            };
            local gamepassId2 = v41.gamepassId;
            local v46;

            if gamepassId2 == 0 or (gamepassId2 ~= gamepassId2 or not gamepassId2) then
                v46 = RobuxProductType.DevProduct;
            else
                v46 = RobuxProductType.GamePass;
            end;

            v45.ProductType = v46;
            v44.Product = v45;
            v44.BackgroundImage = {
                Image = ""
            };
            v44.Contents = {
                Description = { v41.description },
                Rewards = {
                    {
                        kit = u40
                    }
                }
            };

            function v44.OnClick() -- Line: 230
                -- upvalues: Flamework (ref), BedwarsAppIds (ref), u40 (copy)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
                    SelectedKit = u40
                });
            end;

            v44.LayoutOrder = 9;
            v44.Effects = {
                DisableBGGradientAnim = true
            };
            local v47 = not u11;

            if v47 then
                if #u31 == 0 then
                    v47 = p39 == 0;
                else
                    v47 = false;
                end;
            end;

            v44.GamepadShouldAutoSelect = v47;

            return u3.createElement(RobuxStoreBannerCard, v44, {
                BackgroundImage = u3.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1.45, 1.45),
                    Position = UDim2.fromScale(1.5, 0.65),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Image = v41.renderImage,
                    ScaleType = Enum.ScaleType.Fit
                })
            });
        end;

        local v49 = 0;
        local u50 = {};

        for i, v in v35 do
            local v51 = v48(v, i - 1, v35);

            if v51 ~= nil then
                v49 = v49 + 1;
                u50[v49] = v51;
            end;
        end;

        local function _(p52) -- Line: 264
            -- upvalues: u15 (copy), MAX_NEW_SKIN_AGE (ref)
            local releaseTime = p52[2].releaseTime;

            return u15 - (releaseTime == nil and 0 or releaseTime) <= MAX_NEW_SKIN_AGE;
        end;

        local v53 = 0;
        local v54 = {};

        for i, v in u2.entries(BedwarsKitSkinMeta) do
            local _ = i - 1;
            local releaseTime = v[2].releaseTime;

            if u15 - (releaseTime == nil and 0 or releaseTime) <= MAX_NEW_SKIN_AGE == true then
                v53 = v53 + 1;
                v54[v53] = v;
            end;
        end;

        table.sort(v54, function(p55, p56) -- Line: 282
            return (p55[2].kit or "") < (p56[2].kit or "");
        end);

        local function v63(p57, p58) -- Line: 286
            -- upvalues: u3 (ref), RobuxStoreItemShowcaseCard (ref), RobuxProductType (ref), u9 (ref), Flamework (ref), BedwarsAppIds (ref), u11 (ref), u31 (copy), u50 (copy)
            local u59 = p57[1];
            local u60 = p57[2];

            if not u60.product then
                return nil;
            end;

            local createElement = u3.createElement;
            local v61 = {
                AspectRatio = 0.74,
                New = true,
                Title = u60.name,
                Image = u60.renderImage,
                Product = {
                    Price = u60.product.priceRobux,
                    ProductId = u60.product.devProductId,
                    GiftType = u59,
                    ProductType = RobuxProductType.DevProduct
                },
                IsOwned = table.find(u9.OwnedKitSkins, u59) ~= nil,

                OnClick = function() -- Line: 304, Name: OnClick
                    -- upvalues: Flamework (ref), BedwarsAppIds (ref), u60 (copy), u59 (copy)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
                        SelectedKit = u60.kit,
                        SelectedKitSkin = u59
                    });
                end
            };
            local v62 = not u11;

            if v62 then
                if #u31 == 0 and #u50 == 0 then
                    v62 = p58 == 0;
                else
                    v62 = false;
                end;
            end;

            v61.GamepadShouldAutoSelect = v62;

            return createElement(RobuxStoreItemShowcaseCard, v61);
        end;

        local v64 = 0;
        local v65 = {};

        for i, v in v54 do
            local v66 = v63(v, i - 1, v54);

            if v66 ~= nil then
                v64 = v64 + 1;
                v65[v64] = v66;
            end;
        end;

        u14({
            featuredKits = u50,
            featuredKitSkins = v65,
            bundles = u31
        });
    end, {});
    useEffect(function() -- Line: 331
        -- upvalues: DeviceUtil (ref), KnitClient (ref), default (ref), DevProduct (ref), u12 (copy)
        if DeviceUtil.isHoarceKat() then
            return nil;
        end;

        KnitClient.Controllers.RobuxStoreController:requestDailyStorePurchaseHistory();
        KnitClient.Controllers.RobuxStoreController:requestDailyStoreItems();
        local u68 = default.Client:Get("RobuxPurchaseSuccess"):Connect(function(p67) -- Line: 337
            -- upvalues: DevProduct (ref), u12 (ref)
            if p67.devProductId == DevProduct.NEW_PLAYER_BUNDLE then
                u12(false);
            end;
        end);

        return function() -- Line: 342
            -- upvalues: u68 (copy)
            u68:Disconnect();
        end;
    end, {});

    local function u73(p69, p70) -- Line: 346
        -- upvalues: getDailyStoreItemMetadata (ref), StoreCurrency (ref), KnitClient (ref)
        local v71 = getDailyStoreItemMetadata(p69);

        if p70 == StoreCurrency.Robux then
            KnitClient.Controllers.RobuxStoreController:purchaseDailyStoreItem(p69, p70);

            return;
        end;

        if v71.bedcoinProduct and p70 == StoreCurrency.BedCoin then
            local BedCoinProductPurchaseController = KnitClient.Controllers.BedCoinProductPurchaseController;
            local v72 = {};
            local bedcoinProduct = v71.bedcoinProduct;

            if bedcoinProduct ~= nil then
                bedcoinProduct = bedcoinProduct.bedcoinProductId;
            end;

            v72.productId = bedcoinProduct;
            v72.dailyStoreItem = p69;
            BedCoinProductPurchaseController:purchase(v72);
        end;
    end;

    local v74;

    if u11 then
        v74 = BundleMeta[BundleType.NEW_PLAYER_BUNDLE].devProductId ~= nil;
    else
        v74 = u11;
    end;

    if v74 then
        local v75 = {
            Title = BundleMeta[BundleType.NEW_PLAYER_BUNDLE].name
        };
        local v76 = {};
        local image = BundleMeta[BundleType.NEW_PLAYER_BUNDLE].image;
        v76.Image = image == nil and "" or image;
        v75.BackgroundImage = v76;
        v75.BackgroundGradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 138, 166)), ColorSequenceKeypoint.new(1, Color3.fromRGB(157, 131, 254)) });
        v75.Product = {
            Price = BundleMeta[BundleType.NEW_PLAYER_BUNDLE].price,
            ProductId = BundleMeta[BundleType.NEW_PLAYER_BUNDLE].devProductId,
            ProductType = RobuxProductType.DevProduct
        };
        v75.Discount = {
            OriginalPrice = 1400
        };
        v75.Contents = {
            Rewards = BundleMeta[BundleType.NEW_PLAYER_BUNDLE].rewards
        };
        local newPlayerBundleData = u9.newPlayerBundleData;

        if newPlayerBundleData ~= nil then
            newPlayerBundleData = newPlayerBundleData.firstJoinTime;
        end;

        local v77;

        if newPlayerBundleData == nil then
            v77 = NewPlayerBundleClientUtil.getNewPlayerBundleExpireTime();
        else
            v77 = NewPlayerBundleClientUtil.getNewPlayerBundleExpireTimeFromJoin(u9.newPlayerBundleData.firstJoinTime);
        end;

        v75.EndTime = v77;
        v75.Effects = {
            Confetti = true,
            Ripple = true
        };
        v75.LayoutOrder = 2;
        v75.GamepadShouldAutoSelect = true;
        v74 = u3.createElement(RobuxStoreBannerCard, v75);
    end;

    local v78 = { u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            VerticalAlignment = "Top",
            HorizontalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 20)
        }) };
    local v79 = #v78;

    if v74 then
        v78[v79 + 1] = v74;
    end;

    local v80 = #v78;
    local v81;

    if u13 == nil then
        v81 = u13;
    else
        v81 = #u13.bundles == 0;
    end;

    local v82 = not v81 and u3.createElement("TextLabel", {
        Text = "Bundles",
        TextScaled = true,
        BackgroundTransparency = 1,
        TextXAlignment = "Left",
        TextYAlignment = "Center",
        LayoutOrder = -1,
        Size = UDim2.new(1, 0, 0, 32),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        FontFace = Font.fromName("Roboto", Enum.FontWeight.Heavy)
    });

    if v82 then
        v78[v80 + 1] = v82;
    end;

    local v83 = #v78;
    local v84;

    if u13 == nil then
        v84 = u13;
    else
        v84 = u13.bundles;
    end;

    if v84 then
        for i, v in v84 do
            v78[v83 + i] = v;
        end;
    end;

    local v85 = #v78;
    local v86;

    if u13 == nil then
        v86 = u13;
    else
        v86 = #u13.featuredKits == 0;
    end;

    local v87 = not v86;

    if v87 then
        local v88 = { u3.createElement("TextLabel", {
                Text = "New Kits",
                TextScaled = true,
                BackgroundTransparency = 1,
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 0, 32),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Heavy)
            }) };
        local _ = #v88;
        local v89;

        if u13 == nil then
            v89 = u13;
        else
            v89 = u13.featuredKits;
        end;

        local v90 = {
            AutomaticSize = "Y",
            LayoutOrder = 3,
            Size = UDim2.fromScale(1, 0)
        };
        local v91 = {};
        local v92 = #v91;

        if v89 then
            for i, v in v89 do
                v91[v92 + i] = v;
            end;
        end;

        v88.ListContainer = u3.createFragment({
            ListContainer = u3.createElement(Empty, v90, v91)
        });
        v87 = u3.createFragment(v88);
    end;

    if v87 then
        v78[v85 + 1] = v87;
    end;

    local v93 = #v78;
    local v94;

    if u13 == nil then
        v94 = u13;
    else
        v94 = #u13.featuredKitSkins == 0;
    end;

    local v95 = not v94;

    if v95 then
        local v96 = { u3.createElement("TextLabel", {
                Text = "New Kit Skins",
                TextScaled = true,
                BackgroundTransparency = 1,
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                LayoutOrder = 4,
                Size = UDim2.new(1, 0, 0, 32),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Heavy)
            }) };
        local _ = #v96;
        local v97;

        if u13 == nil then
            v97 = u13;
        else
            v97 = u13.featuredKitSkins;
        end;

        local v98 = {
            AutomaticSize = "Y",
            LayoutOrder = 5,
            Size = UDim2.fromScale(1, 0)
        };
        local v99 = { u3.createElement("UIGridLayout", {
                FillDirection = "Horizontal",
                FillDirectionMaxCells = 4,
                SortOrder = "LayoutOrder",
                CellSize = UDim2.new(0.25, -9, 0, 200),
                CellPadding = UDim2.new(0, 12, 0, 10)
            }) };
        local v100 = #v99;

        if v97 then
            for i, v in v97 do
                v99[v100 + i] = v;
            end;
        end;

        v96.ListContainer = u3.createFragment({
            ListContainer = u3.createElement(Empty, v98, v99)
        });
        v95 = u3.createFragment(v96);
    end;

    if v95 then
        v78[v93 + 1] = v95;
    end;

    v78.DailiesTitleHeader = u3.createFragment({
        DailiesTitleHeader = u3.createElement(Empty, {
            LayoutOrder = 6,
            Size = UDim2.new(1, 0, 0, 32)
        }, {
            LeftSection = u3.createElement(Empty, {
                Size = UDim2.fromScale(0.5, 1)
            }, {
                u3.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 8)
                }),
                DailiesTitle = u3.createElement("TextLabel", {
                    Text = "Daily | ",
                    AutomaticSize = "X",
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    TextXAlignment = "Left",
                    TextYAlignment = "Center",
                    LayoutOrder = 1,
                    Size = UDim2.new(0, 0, 0, 32),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Heavy)
                }),
                u3.createElement(Countdown, {
                    PreText = "Refresh in: ",
                    EndTime = GameReset.getResetTimeManager():getNextDailyResetTime(),
                    CountdownConfig = {
                        days = false,
                        hours = true,
                        minutes = true,
                        seconds = true,
                        seperator = ":"
                    },
                    TextLabel = {
                        TextXAlignment = "Left",
                        LayoutOrder = 2,
                        TextTransparency = 0.7,
                        Size = UDim2.fromScale(0, 0.8),
                        AutomaticSize = Enum.AutomaticSize.X
                    }
                })
            }),
            RefreshShopContainer = u3.createElement(Empty, {
                Size = UDim2.fromScale(0.5, 1),
                Position = UDim2.fromScale(1, 0),
                AnchorPoint = Vector2.new(1, 0)
            }, { u3.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Right",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 8)
                }), u3.createElement("TextLabel", {
                    AutomaticSize = "X",
                    Text = "Refresh Shop",
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    TextTransparency = 0.7,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0, 0.5),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }), u3.createElement(BedcoinPurchaseButton, {
                    BedcoinProductId = 64,
                    PurchaseButtonProps = {
                        ZIndex = 3,
                        AspectRatio = 2.8333333333333335,
                        LayoutOrder = 2,

                        OnClick = function() -- Line: 616, Name: OnClick
                            -- upvalues: KnitClient (ref)
                            KnitClient.Controllers.RobuxStoreController:requestDailyStoreRefresh();
                        end,

                        Size = UDim2.fromScale(1, 0.9)
                    }
                }) })
        })
    });
    local dailyStoreItems = u9.dailyStoreItems;
    local v101;

    if dailyStoreItems == nil then
        v101 = dailyStoreItems;
    else
        local function v110(u102) -- Line: 630
            -- upvalues: getDailyStoreItemMetadata (ref), u9 (copy), u11 (copy), u13 (copy), RobuxProductType (ref), u73 (copy), u3 (ref), RobuxStoreItemRewardCard (ref)
            local v103 = getDailyStoreItemMetadata(u102);
            local v104 = table.find(u9.dailyPurchaseHistory, u102) ~= nil;
            local v105 = not u11;

            if v105 then
                local v106 = u13;
                v105 = (v106 ~= nil and #v106.bundles or v106) == 0;

                if v105 then
                    local v107 = u13;
                    v105 = (v107 ~= nil and #v107.featuredKits or v107) == 0 and v103.freeItem == true;
                end;
            end;

            local v108 = {
                Reward = v103.reward,
                IsFree = v103.freeItem,
                RobuxProduct = v103.robuxProduct and {
                    ProductId = v103.robuxProduct.productId,
                    ProductType = RobuxProductType.DevProduct
                } or nil
            };
            local bedcoinProduct = v103.bedcoinProduct;

            if bedcoinProduct ~= nil then
                bedcoinProduct = bedcoinProduct.bedcoinProductId;
            end;

            v108.BedcoinProductId = bedcoinProduct;

            function v108.OnAttemptPuchase(p109) -- Line: 667
                -- upvalues: u73 (ref), u102 (copy)
                u73(u102, p109);
            end;

            v108.AspectRatio = 1.2121212121212122;
            v108.IsOwned = v104;
            v108.Highlight = v103.freeItem;
            v108.LayoutOrder = v103.freeItem == true and 1 or 2;
            v108.GamepadShouldAutoSelect = v105;

            return u3.createElement(RobuxStoreItemRewardCard, v108);
        end;

        v101 = table.create(#dailyStoreItems);

        for i, v in dailyStoreItems do
            v101[i] = v110(v, i - 1, dailyStoreItems);
        end;
    end;

    local v111 = {
        LayoutOrder = 7,
        Size = UDim2.new(1, 0, 0, 340)
    };
    local v112 = { u3.createElement("UIGridLayout", {
            FillDirection = "Horizontal",
            FillDirectionMaxCells = 3,
            HorizontalAlignment = "Left",
            VerticalAlignment = "Top",
            SortOrder = "LayoutOrder",
            CellSize = UDim2.new(0.3333333333333333, -8, 0, 165),
            CellPadding = UDim2.new(0, 12, 0, 10)
        }) };
    local v113 = #v112;

    for i, v in v101 do
        v112[v113 + i] = v;
    end;

    v78.DailyStoreList = u3.createFragment({
        DailyStoreList = u3.createElement(Empty, v111, v112)
    });
    v78.PerksTitle = u3.createFragment({
        PerksTitle = u3.createElement("TextLabel", {
            Text = "Buy Perks",
            TextScaled = true,
            BackgroundTransparency = 1,
            TextXAlignment = "Left",
            TextYAlignment = "Center",
            LayoutOrder = 8,
            Size = UDim2.new(1, 0, 0, 32),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Heavy)
        })
    });
    local v114 = {
        Title = "VIP Rank",
        Product = {
            Price = 400,
            GiftType = GiftType.VIP_RANK,
            ProductId = Gamepass.VIP,
            ProductType = RobuxProductType.GamePass
        }
    };
    local v115 = {};
    local v116 = getLobbyGadgetImage(LobbyGadgetType.VIP_HOVER_BOARD);
    v115.Image = v116 == nil and "" or v116;
    v114.BackgroundImage = v115;
    v114.Contents = {
        Description = {
            "<b><font color=\"" .. ColorUtil.richTextColor(Theme.mcGreen) .. "\">[VIP]</font></b> Chat Prefix & Colored Name in chat",
            "Earn +<b>50%</b> more Armor Trim XP",
            "Earn +<b>20%</b> more Bed Coins",
            "Create clans for <b>FREE</b>",
            "Exclusive Lobby Gadget & Title -->"
        },
        Rewards = {
            {
                paid = true,
                lobbyGadget = LobbyGadgetType.VIP_HOVER_BOARD
            },
            {
                paid = true,
                title = TitleType.VIP
            }
        }
    };
    v114.Effects = {
        DisableBGGradientAnim = true
    };
    v114.LayoutOrder = 9;
    v78[#v78 + 1] = u3.createElement(RobuxStoreBannerCard, v114);
    v78.BedCoinsTitle = u3.createFragment({
        BedCoinsTitle = u3.createElement("TextLabel", {
            Text = "Buy Bed Coins",
            TextScaled = true,
            BackgroundTransparency = 1,
            TextXAlignment = "Left",
            TextYAlignment = "Center",
            LayoutOrder = 10,
            Size = UDim2.new(1, 0, 0, 32),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Heavy)
        })
    });
    local v117 = u2.values(BedCoinDevProductInfoList);
    table.sort(v117, function(p118, p119) -- Line: 766
        return p118.amount < p119.amount;
    end);

    local function v121(p120) -- Line: 770
        -- upvalues: u3 (ref), RobuxStoreBannerCard (ref), RobuxProductType (ref)
        return u3.createElement(RobuxStoreBannerCard, {
            AspectRatio = 0.9333333333333333,
            Product = {
                Price = p120.robuxPrice,
                GiftType = p120.giftType,
                ProductId = p120.devProductId,
                ProductType = RobuxProductType.DevProduct
            },
            Size = UDim2.fromScale(0.24, 1),
            Contents = {
                Rewards = {
                    {
                        paid = true,
                        bedCoins = p120.amount
                    }
                },
                UIGridLayout = {
                    CellSize = UDim2.fromOffset(74, 74),
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }
            },
            Effects = {
                DisableBGGradientAnim = true
            }
        });
    end;

    local v122 = table.create(#v117);

    for i, v in v117 do
        v122[i] = v121(v, i - 1, v117);
    end;

    local v123 = {
        LayoutOrder = 11,
        Size = UDim2.fromScale(1, 1)
    };
    local v124 = { u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 2.975
        }), u3.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            VerticalAlignment = "Top",
            SortOrder = "LayoutOrder",
            HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
            ItemLineAlignment = Enum.ItemLineAlignment.Stretch
        }) };
    local v125 = #v124;

    for i, v in v122 do
        v124[v125 + i] = v;
    end;

    v78.BedCoinsList = u3.createFragment({
        BedCoinsList = u3.createElement(Empty, v123, v124)
    });

    return u3.createFragment(v78);
end);

return {
    RobuxStore = v5.connect(function(p127, p128) -- Line: 827
        local v129 = {};

        for i, v in p128 do
            v129[i] = v;
        end;

        v129.newPlayerBundleData = p127.Lobby.robuxStore.newPlayerBundleData;
        v129.dailyStoreItems = p127.Lobby.robuxStore.dailyStoreItems;
        v129.dailyPurchaseHistory = p127.Lobby.robuxStore.dailyPurchaseHistory;
        v129.emotes = p127.Locker.emotes;
        v129.winEffects = p127.Locker.winEffects;
        v129.bedBreakEffects = p127.Locker.breakBedEffects;
        v129.lobbyGadgets = p127.Locker.lobbyGadgets;
        v129.titles = p127.Locker.titles;
        v129.killEffects = p127.Locker.killEffects;
        v129.OwnedKitSkins = p127.Bedwars.ownedKitSkins;
        v129.OwnedKits = p127.Bedwars.ownedKits;

        return v129;
    end)(v126)
};