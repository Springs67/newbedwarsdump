-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local DividerComponent = v1.DividerComponent;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local MarketplaceService = v5.MarketplaceService;
local Players = v5.Players;
local PurchaseButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "purchase-button").PurchaseButton;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local ConsumableStatus = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableStatus;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local GiftUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-utils").GiftUtils;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util");
local getKitPriceBedCoins = v6.getKitPriceBedCoins;
local getKitPriceRobuxAsync = v6.getKitPriceRobuxAsync;
local getKitRentalBedCoinProduct = v6.getKitRentalBedCoinProduct;
local getKitSkinPriceRobuxAsync = v6.getKitSkinPriceRobuxAsync;
local SquareImageButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "square-image-button").SquareImageButton;
local KitDetailsEquipButton = RuntimeLib.import(script, script.Parent, "kit-details-equip-button").KitDetailsEquipButton;

return {
    KitDetailsKitActionButtons = v4.new(u3)(function(u7, p8) -- Line: 37
        -- upvalues: BedwarsKit (copy), getKitPriceBedCoins (copy), getKitPriceRobuxAsync (copy), getKitSkinPriceRobuxAsync (copy), getBedwarsKitMeta (copy), BedwarsKitSkinMeta (copy), BedwarsKitSkin (copy), DeviceUtil (copy), KnitClient (copy), GiftUtils (copy), u2 (copy), ConsumableStatus (copy), getKitRentalBedCoinProduct (copy), SoundManager (copy), GameSound (copy), u3 (copy), PurchaseButton (copy), Flamework (copy), BedwarsAppIds (copy), MarketplaceService (copy), Players (copy), UILayers (copy), ColorUtil (copy), SquareImageButton (copy), BedwarsImageId (copy), Empty (copy), DividerComponent (copy), KitDetailsEquipButton (copy), ClientStore (copy), default (copy)
        local useState = p8.useState;
        local useEffect = p8.useEffect;
        local v9, u10 = useState(u7.store.Bedwars.kit or BedwarsKit.NONE);
        local u11, u12 = useState({
            robux = nil,
            bedcoins = nil
        });
        local v13, u14 = useState(nil);
        useEffect(function() -- Line: 46
            -- upvalues: getKitPriceBedCoins (ref), u7 (copy), getKitPriceRobuxAsync (ref), u12 (copy)
            task.spawn(function() -- Line: 47
                -- upvalues: getKitPriceBedCoins (ref), u7 (ref), getKitPriceRobuxAsync (ref), u12 (ref)
                local v15 = getKitPriceBedCoins(u7.SelectedKit);
                local v16, v17 = getKitPriceRobuxAsync(u7.SelectedKit):await();
                local v18 = {};

                if not v16 then
                    v17 = nil;
                end;

                v18.robux = v17;
                v18.bedcoins = v15;
                u12(v18);
            end);
        end, { u7.SelectedKit });
        useEffect(function() -- Line: 56
            -- upvalues: u7 (copy), getKitSkinPriceRobuxAsync (ref), u14 (copy)
            task.spawn(function() -- Line: 57
                -- upvalues: u7 (ref), getKitSkinPriceRobuxAsync (ref), u14 (ref)
                if u7.SelectedKitSkin then
                    local v19, v20 = getKitSkinPriceRobuxAsync(u7.SelectedKitSkin):await();

                    if v19 then
                        u14(v20);
                    end;
                end;
            end);
        end, { u7.SelectedKitSkin });
        useEffect(function() -- Line: 66
            -- upvalues: u10 (copy), u7 (copy), BedwarsKit (ref)
            u10(u7.store.Bedwars.kit or BedwarsKit.NONE);
        end, { u7.store.Bedwars.kit });
        local u21 = getBedwarsKitMeta(u7.SelectedKit);
        local v22;

        if u7.SelectedKitSkin then
            v22 = BedwarsKitSkinMeta[u7.SelectedKitSkin];
        else
            v22 = nil;
        end;

        local v23, v24;

        if u7.SelectedKitSkin then
            v23 = u7.SelectedKitSkin == BedwarsKitSkin.DEFAULT;

            if not v23 then
                if DeviceUtil.isHoarceKat() then
                    v23 = table.find(u7.store.Bedwars.ownedKitSkins, u7.SelectedKitSkin) ~= nil;
                else
                    v23 = KnitClient.Controllers.UnlockController:isKitSkinUnlocked(u7.SelectedKitSkin);
                end;
            end;

            if v22 ~= nil then
                v22 = v22.product;

                if v22 ~= nil then
                    v22 = v22.devProductId;
                end;
            end;

            if v22 == nil then
                v24 = false;
            else
                v24 = true;
            end;
        else
            v23 = false;
            v24 = false;
        end;

        local v25 = v9 == u7.SelectedKit;
        local v26 = false;
        local u27 = false;
        local v28;

        if DeviceUtil.isHoarceKat() then
            v28 = u7.SelectedKit == BedwarsKit.NONE and true or u21.freeKit or table.find(u7.store.Bedwars.ownedKits, u7.SelectedKit) ~= nil;
        else
            v28 = KnitClient.Controllers.UnlockController:isKitOwned(u7.SelectedKit);
        end;

        local u29 = v28 and true or false;
        local v30 = not u29 and u7.SelectedKit ~= BedwarsKit.NONE;

        if v30 then
            v30 = u11.robux;

            if v30 == 0 or (v30 ~= v30 or not v30) then
                v30 = u11.bedcoins;
            end;
        end;

        local v31 = v30 ~= 0 and (v30 == v30 and v30) and true or false;
        local v32;

        if DeviceUtil.isHoarceKat() then
            v32 = u7.SelectedKit == BedwarsKit.NONE and true or getBedwarsKitMeta(u7.SelectedKit).freeKit or table.find(u7.store.Bedwars.ownedKits, u7.SelectedKit) ~= nil;
        else
            local v33 = KnitClient.Controllers.UnlockController:isKitUnlocked(u7.SelectedKit);

            if not v33 then
                local MatchController = KnitClient.Controllers.MatchController;

                if MatchController ~= nil then
                    MatchController = MatchController:getQueueMeta();

                    if MatchController ~= nil then
                        MatchController = MatchController.allowUnownedKits;
                    end;
                end;

                v33 = MatchController == true;
            end;

            v32 = v33 and true or v26;
        end;

        local v34 = not u21.notGiftable;

        if v34 then
            if u21.devProductId == nil and u21.gamepassId == nil then
                v34 = false;
            else
                v34 = GiftUtils.isKitGift(u7.SelectedKit) and u7.SelectedKit ~= BedwarsKit.NONE;
            end;
        end;

        local v35;

        if v24 then
            if u7.SelectedKitSkin then
                v35 = GiftUtils.isKitSkinGift(u7.SelectedKitSkin);
            else
                v35 = false;
            end;
        else
            v35 = v24;
        end;

        local function _(p36) -- Line: 167
            -- upvalues: ConsumableStatus (ref), u7 (copy)
            local _ = p36[1];
            local v37 = p36[2];
            local v38 = v37.status == ConsumableStatus.ACTIVE;

            if v38 then
                local extraData = v37.extraData;

                if extraData ~= nil then
                    extraData = extraData.rentedKit;
                end;

                v38 = extraData == u7.SelectedKit;
            end;

            return v38;
        end;

        local v39 = nil;

        for i, v in u2.entries(u7.store.Consumable.record) do
            local _ = i - 1;
            local _ = v[1];
            local v40 = v[2];
            local v41 = v40.status == ConsumableStatus.ACTIVE;

            if v41 then
                local extraData = v40.extraData;

                if extraData ~= nil then
                    extraData = extraData.rentedKit;
                end;

                v41 = extraData == u7.SelectedKit;
            end;

            if v41 == true then
                v39 = v;
                break;
            end;
        end;

        if v39 ~= nil then
            v39 = v39[2];
        end;

        local u42 = getKitRentalBedCoinProduct(u7.SelectedKit);
        local v43;

        if u42 == nil then
            v43 = u42;
        else
            v43 = u42.purchaseData;
        end;

        local v44 = not (v39 ~= nil or (u29 or u21.disableKitRenting)) and u42 ~= nil;

        if v44 then
            if v43 ~= nil then
                v43 = v43.productType;
            end;

            v44 = v43 == "RentKit" and not v32;
        end;

        local v45 = v44 and true or false;

        if u7.SelectedKit then
            u27 = u7.store;

            if u27 ~= nil then
                u27 = u27.Bedwars.favoriteKits[u7.SelectedKit] ~= nil;
            end;

            if u27 == nil then
                u27 = false;
            end;
        end;

        local v46 = {
            Title = "PURCHASE KIT",
            Size = UDim2.new(0.85, -10, 1, 0)
        };
        local v47 = {};
        local v48 = #v47;
        local robux = u11.robux;
        local v49 = (robux == 0 or (robux ~= robux or not robux)) and {} or {
            {
                robux = u11.robux
            }
        };
        local v50 = #v49;
        table.move(v49, 1, v50, v48 + 1, v47);
        local bedcoins = u11.bedcoins;
        local v51 = (bedcoins == 0 or (bedcoins ~= bedcoins or not bedcoins)) and {} or {
            {
                bedcoin = u11.bedcoins
            }
        };
        table.move(v51, 1, #v51, v48 + v50 + 1, v47);
        v46.Cost = v47;
        local robux2 = u11.robux;
        local v52;

        if robux2 == 0 or (robux2 ~= robux2 or not robux2) then
            v52 = nil;
        else
            v52 = Color3.fromRGB(255, 224, 107);
        end;

        v46.BackgroundColor3 = v52;
        v46.Selectable = true;

        function v46.OnClick() -- Line: 251
            -- upvalues: SoundManager (ref), GameSound (ref), u11 (copy), u3 (ref), PurchaseButton (ref), Flamework (ref), BedwarsAppIds (ref), u7 (copy), u21 (copy), MarketplaceService (ref), Players (ref), KnitClient (ref), UILayers (ref)
            SoundManager:playSound(GameSound.UI_CLICK);
            local v53 = {};
            local robux3 = u11.robux;

            if robux3 ~= 0 and (robux3 == robux3 and robux3) then
                local v55 = u3.createElement(PurchaseButton, {
                    Selectable = true,
                    Size = UDim2.new(0.25, 0, 1, 0),
                    Cost = {
                        {
                            robux = u11.robux
                        }
                    },

                    OnClick = function() -- Line: 263, Name: OnClick
                        -- upvalues: Flamework (ref), BedwarsAppIds (ref), u7 (ref), u21 (ref), MarketplaceService (ref), Players (ref)
                        local function v54() -- Line: 264
                            -- upvalues: Flamework (ref), BedwarsAppIds (ref), u7 (ref)
                            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.PURCHASE_OPTIONS_SCREEN_APP);
                            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
                                SelectedKit = u7.SelectedKit
                            });
                        end;

                        if u21.gamepassId == nil then
                            if u21.devProductId ~= nil then
                                MarketplaceService:PromptProductPurchase(Players.LocalPlayer, u21.devProductId);
                                v54();
                            end;

                            return;
                        end;

                        MarketplaceService:PromptGamePassPurchase(Players.LocalPlayer, u21.gamepassId);
                        v54();
                    end
                });
                table.insert(v53, v55);
            end;

            local bedcoins2 = u11.bedcoins;

            if bedcoins2 ~= 0 and (bedcoins2 == bedcoins2 and bedcoins2) then
                local v56 = u3.createElement(PurchaseButton, {
                    Selectable = true,
                    Size = UDim2.new(0.25, 0, 1, 0),
                    Cost = {
                        {
                            bedcoin = u11.bedcoins
                        }
                    },
                    BackgroundColor3 = Color3.fromRGB(255, 224, 107),

                    OnClick = function() -- Line: 291, Name: OnClick
                        -- upvalues: u21 (ref), KnitClient (ref), Flamework (ref), BedwarsAppIds (ref), u7 (ref)
                        local bedCoinProduct = u21.bedCoinProduct;

                        if bedCoinProduct ~= nil then
                            bedCoinProduct = bedCoinProduct.bedCoinProductId;
                        end;

                        if bedCoinProduct ~= 0 and (bedCoinProduct == bedCoinProduct and bedCoinProduct) then
                            KnitClient.Controllers.BedCoinProductPurchaseController:purchase({
                                productId = u21.bedCoinProduct.bedCoinProductId
                            });
                            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.PURCHASE_OPTIONS_SCREEN_APP);
                            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
                                SelectedKit = u7.SelectedKit
                            });
                        end;
                    end
                });
                table.insert(v53, v56);
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.PURCHASE_OPTIONS_SCREEN_APP, {
                Description = "Please select your payment method.",
                Title = "Purchase " .. u21.name .. " Kit",
                Image = u21.renderImage,
                Buttons = v53,

                OnExit = function() -- Line: 316, Name: OnExit
                    -- upvalues: Flamework (ref), UILayers (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.MAIN);
                end,

                OnBack = function() -- Line: 319, Name: OnBack
                    -- upvalues: Flamework (ref), BedwarsAppIds (ref), u7 (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.PURCHASE_OPTIONS_SCREEN_APP);
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
                        SelectedKit = u7.SelectedKit
                    });
                end
            });
        end;

        v46.LayoutOrder = 0;
        local v57 = u3.createElement(PurchaseButton, v46);
        local v58 = u3.createElement("Frame", {
            LayoutOrder = 2,
            BackgroundTransparency = 0.5,
            Size = UDim2.new(0.85, -10, 1, 0),
            BackgroundColor3 = ColorUtil.BLACK
        }, { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }), u3.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                BackgroundColor3 = ColorUtil.BLACK
            }, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.1, 0)
                }), u3.createElement("UIGradient", {
                    Rotation = 90,
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.5) })
                }) }), u3.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                Text = "UNOBTAINABLE",
                TextTransparency = 0.4,
                Size = UDim2.fromScale(0.8, 0.8),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center
            }) });
        local v59 = {};

        for i, v in u7 do
            v59[i] = v;
        end;

        v59.SelectedKit = nil;
        v59.SelectedKitSkin = nil;
        v59.store = nil;
        local v60 = {};

        for i, v in v59 do
            v60[i] = v;
        end;

        local SelectedKitSkin = u7.SelectedKitSkin;

        if SelectedKitSkin then
            if v13 == nil then
                SelectedKitSkin = false;
            else
                SelectedKitSkin = v24;
            end;
        end;

        if SelectedKitSkin then
            local v61 = {
                LayoutOrder = 0,
                Size = UDim2.fromScale(1, 0.33)
            };
            local v62 = {};
            local v63 = u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 10),
                SortOrder = Enum.SortOrder.LayoutOrder
            });
            local v64;

            if v23 then
                v64 = u3.createElement("Frame", {
                    LayoutOrder = 0,
                    Size = UDim2.new(0.85, -10, 1, 0),
                    BackgroundColor3 = Color3.fromRGB(204, 194, 61)
                }, { u3.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        Text = "OWNED KIT SKIN",
                        TextTransparency = 0.4,
                        Size = UDim2.fromScale(0.8, 0.8),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        TextXAlignment = Enum.TextXAlignment.Center,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }), u3.createElement("Frame", {
                        BorderSizePixel = 0,
                        Size = UDim2.fromScale(1, 1),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        BackgroundColor3 = ColorUtil.BLACK
                    }, { u3.createElement("UICorner", {
                            CornerRadius = UDim.new(0.1, 0)
                        }), u3.createElement("UIGradient", {
                            Rotation = 90,
                            Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.5) })
                        }) }), u3.createElement("UICorner", {
                        CornerRadius = UDim.new(0.1, 0)
                    }) });
            else
                v64 = u3.createElement(PurchaseButton, {
                    Title = "PURCHASE KIT SKIN",
                    Selectable = true,
                    LayoutOrder = 0,
                    Size = UDim2.new(0.85, -10, 1, 0),
                    Cost = {
                        {
                            robux = v13
                        }
                    },

                    OnClick = function() -- Line: 400, Name: OnClick
                        -- upvalues: SoundManager (ref), GameSound (ref), KnitClient (ref), u7 (copy)
                        SoundManager:playSound(GameSound.UI_CLICK);
                        KnitClient.Controllers.KitSkinController:purchaseKitSkin(u7.SelectedKitSkin, u7.SelectedKit);
                    end
                });
            end;

            v62[1], v62[2] = v63, v64;
            local v65 = #v62;

            if v35 then
                v35 = u3.createElement(SquareImageButton, {
                    Selectable = true,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.15, 1),
                    BackgroundColor3 = Color3.fromRGB(84, 214, 235),
                    Image = BedwarsImageId.GIFT_SOLID,

                    OnClick = function() -- Line: 448, Name: OnClick
                        -- upvalues: SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), u7 (copy), UILayers (ref)
                        SoundManager:playSound(GameSound.UI_CLICK);
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.GIFTING, {
                            GiftType = u7.SelectedKitSkin
                        }, UILayers.OVERLAY);
                    end
                });
            end;

            if v35 then
                v62[v65 + 1] = v35;
            end;

            SelectedKitSkin = u3.createElement(Empty, v61, v62);
        end;

        local v66 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 10)
            }) };
        local v67 = #v66;

        if SelectedKitSkin then
            v66[v67 + 1] = SelectedKitSkin;
        end;

        local v68 = #v66;
        local SelectedKitSkin2 = u7.SelectedKitSkin;

        if SelectedKitSkin2 then
            if v13 == nil then
                v24 = false;
            elseif v24 then
                v24 = u3.createElement(DividerComponent, {
                    LayoutOrder = 1,
                    Size = UDim2.new(1, 0, 0, 2),
                    BarColor = {
                        Transparency = 0.5
                    }
                });
            end;
        else
            v24 = SelectedKitSkin2;
        end;

        if v24 then
            v66[v68 + 1] = v24;
        end;

        local v69 = #v66;
        local v70 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.33)
        };
        local v71 = {};
        local v72 = u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 10),
            SortOrder = Enum.SortOrder.LayoutOrder
        });

        if v32 then
            v58 = u3.createElement(KitDetailsEquipButton, {
                LayoutOrder = 2,
                Size = UDim2.new(0.85, -10, 1, 0),
                SelectedKit = u7.SelectedKit,
                Equipped = v25,
                ActiveRental = v39
            });
        elseif v31 then
            v58 = v57;
        end;

        v71[1], v71[2] = v72, v58;
        local v73 = #v71;
        local v74;

        if v34 then
            v74 = u3.createElement(SquareImageButton, {
                Selectable = true,
                LayoutOrder = 3,
                Size = UDim2.fromScale(0.15, 1),
                BackgroundColor3 = Color3.fromRGB(84, 214, 235),
                Image = BedwarsImageId.GIFT_SOLID,

                OnClick = function() -- Line: 512, Name: OnClick
                    -- upvalues: SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), u7 (copy), UILayers (ref)
                    SoundManager:playSound(GameSound.UI_CLICK);
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.GIFTING, {
                        GiftType = u7.SelectedKit
                    }, UILayers.OVERLAY);
                end
            });
        else
            v74 = v34;
        end;

        if v74 then
            v71[v73 + 1] = v74;
        end;

        v66[v69 + 1] = u3.createElement(Empty, v70, v71);

        if v32 then
            if v31 then
                v31 = u3.createElement(Empty, {
                    LayoutOrder = 3,
                    Size = UDim2.fromScale(1, 0.33)
                }, { u3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        Padding = UDim.new(0, 10),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), v57, u3.createElement(Empty, {
                        Size = UDim2.fromScale(0.15, 1)
                    }) });
            end;
        else
            v31 = v32;
        end;

        if v31 then
            v66[v69 + 2] = v31;
        end;

        if v45 then
            local v75 = {
                Title = "RENT KIT",
                Size = UDim2.new(0.85, -10, 1, 0)
            };
            local v76 = {
                custom = 1,
                Image = BedwarsImageId.KIT_RENTAL_PASS_ALL
            };
            local v77 = {};
            local v78;

            if u42 == nil then
                v78 = u42;
            else
                v78 = u42.cost;
            end;

            v77.bedcoin = v78;
            v75.Cost = { v76, v77 };
            v75.BackgroundColor3 = Color3.fromRGB(255, 224, 107);
            v75.Selectable = true;

            function v75.OnClick() -- Line: 564
                -- upvalues: SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), u21 (copy), u42 (copy), u7 (copy), KnitClient (ref), u3 (ref), PurchaseButton (ref), BedwarsImageId (ref), UILayers (ref)
                SoundManager:playSound(GameSound.UI_CLICK);
                local v79 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
                local PURCHASE_OPTIONS_SCREEN_APP = BedwarsAppIds.PURCHASE_OPTIONS_SCREEN_APP;
                local v80 = {
                    Description = "Please select your payment method.",
                    Title = "Rent " .. u21.name .. " Kit",
                    Image = u21.renderImage
                };
                local v81 = {
                    Size = UDim2.new(0.25, 0, 1, 0)
                };
                local v82 = {};
                local v83 = u42;

                if v83 ~= nil then
                    v83 = v83.cost;
                end;

                v82.bedcoin = v83;
                v81.Cost = { v82 };
                v81.BackgroundColor3 = Color3.fromRGB(255, 224, 107);
                v81.Selectable = true;

                function v81.OnClick() -- Line: 587
                    -- upvalues: Flamework (ref), BedwarsAppIds (ref), u7 (ref), KnitClient (ref)
                    local function v84() -- Line: 588
                        -- upvalues: Flamework (ref), BedwarsAppIds (ref), u7 (ref)
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.PURCHASE_OPTIONS_SCREEN_APP);
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
                            SelectedKit = u7.SelectedKit
                        });
                    end;

                    KnitClient.Controllers.KitRentalController:promptBedCoinPurchaseKitRental(u7.SelectedKit);
                    v84();
                end;

                v80.Buttons = { u3.createElement(PurchaseButton, v81), u3.createElement(PurchaseButton, {
                        Selectable = true,
                        Size = UDim2.new(0.25, 0, 1, 0),
                        Cost = {
                            {
                                custom = 1,
                                Image = BedwarsImageId.KIT_RENTAL_PASS_ALL
                            }
                        },
                        BackgroundColor3 = Color3.fromRGB(255, 224, 107),

                        OnClick = function() -- Line: 605, Name: OnClick
                            -- upvalues: Flamework (ref), BedwarsAppIds (ref), u7 (ref), KnitClient (ref)
                            local function _() -- Line: 606
                                -- upvalues: Flamework (ref), BedwarsAppIds (ref), u7 (ref)
                                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.PURCHASE_OPTIONS_SCREEN_APP);
                                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
                                    SelectedKit = u7.SelectedKit
                                });
                            end;

                            return KnitClient.Controllers.KitRentalController:rentKit(u7.SelectedKit);
                        end
                    }) };

                function v80.OnExit() -- Line: 615
                    -- upvalues: Flamework (ref), UILayers (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.MAIN);
                end;

                function v80.OnBack() -- Line: 618
                    -- upvalues: Flamework (ref), BedwarsAppIds (ref), u7 (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.PURCHASE_OPTIONS_SCREEN_APP);
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
                        SelectedKit = u7.SelectedKit
                    });
                end;

                v79:openApp(PURCHASE_OPTIONS_SCREEN_APP, v80);
            end;

            v75.LayoutOrder = 0;
            v45 = u3.createElement(PurchaseButton, v75);
        end;

        local v85 = {
            LayoutOrder = 4,
            Size = UDim2.fromScale(1, 0.33)
        };
        local v86 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 10),
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v87 = #v86;

        if v45 then
            v86[v87 + 1] = v45;
        end;

        local v88 = #v86;
        local v89;

        if u29 then
            local createElement = u3.createElement;
            local v90 = {
                Selectable = true,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.15, 1)
            };
            local v91;

            if u27 then
                v91 = BedwarsImageId.STAR_ALT_SOLID;
            else
                v91 = BedwarsImageId.STAR_ALT_OUTLINE;
            end;

            v90.Image = v91;
            v90.ImageTransparency = u27 and 0 or 0.5;
            v90.BackgroundColor3 = Color3.fromRGB(51, 51, 51);

            function v90.OnClick() -- Line: 653
                -- upvalues: u27 (ref), ClientStore (ref), u7 (copy), u29 (ref), DeviceUtil (ref), default (ref)
                if u27 then
                    ClientStore:dispatch({
                        type = "RemoveFavoriteKit",
                        kit = u7.SelectedKit
                    });
                else
                    if not u29 then
                        return nil;
                    end;

                    ClientStore:dispatch({
                        type = "AddFavoriteKit",
                        kit = u7.SelectedKit
                    });
                end;

                local store = u7.store;

                if store ~= nil then
                    store = store.Bedwars.favoriteKits;
                end;

                if store then
                    store = not DeviceUtil.isHoarceKat();
                end;

                if store then
                    local v92 = default.Client:Get("FavoriteKitUpdate");
                    local v93 = {};
                    local store2 = u7.store;

                    if store2 ~= nil then
                        store2 = store2.Bedwars.favoriteKits;
                    end;

                    v93.favoriteKits = store2;
                    v92:SendToServer(v93);
                end;
            end;

            v89 = createElement(SquareImageButton, v90);
        elseif v34 then
            v89 = u3.createElement(Empty, {
                Size = UDim2.fromScale(0.15, 1)
            });
        else
            v89 = nil;
        end;

        if v89 then
            v86[v88 + 1] = v89;
        end;

        v66[#v66 + 1] = u3.createElement(Empty, v85, v86);

        return u3.createElement(Empty, v60, v66);
    end)
};