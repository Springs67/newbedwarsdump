-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local Button = v1.Button;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local TooltipContainer = v1.TooltipContainer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local MarketplaceService = v5.MarketplaceService;
local Players = v5.Players;
local UserInputService = v5.UserInputService;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local ArmorTrimUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil;
local getBattlePassMetadata = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-meta").getBattlePassMetadata;
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local BundleMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta;
local ConsumableStatus = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableStatus;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta");
local BedwarsKitSkinMeta = v6.BedwarsKitSkinMeta;
local getSkinsForKit = v6.getSkinsForKit;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local BedwarsKitShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop;
local KitContractRewards = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-rewards").KitContractRewards;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util");
local getKitPriceBedCoins = v7.getKitPriceBedCoins;
local getKitPriceRobuxAsync = v7.getKitPriceRobuxAsync;
local MarketplaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "marketplace-util").MarketplaceUtil;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local KitShopArmorTrimButton = RuntimeLib.import(script, script.Parent, "kit-shop-buttons", "kit-shop-armor-trim-button").KitShopArmorTrimButton;
local KitShopBattlePassButton = RuntimeLib.import(script, script.Parent, "kit-shop-buttons", "kit-shop-battlepass-button").KitShopBattlePassButton;
local KitShopContractButton = RuntimeLib.import(script, script.Parent, "kit-shop-buttons", "kit-shop-contract-button").KitShopContractButton;
local KitShopEquipButton = RuntimeLib.import(script, script.Parent, "kit-shop-buttons", "kit-shop-equip-button").KitShopEquipButton;
local KitShopGiftButton = RuntimeLib.import(script, script.Parent, "kit-shop-buttons", "kit-shop-gift-button").KitShopGiftButton;
local KitShopKitSkinToggle = RuntimeLib.import(script, script.Parent, "kit-shop-buttons", "kit-shop-kit-skin-toggle").KitShopKitSkinToggle;
local KitShopPurchaseButton = RuntimeLib.import(script, script.Parent, "kit-shop-buttons", "kit-shop-purchase-button").KitShopPurchaseButton;
local KitShopReadLoreButton = RuntimeLib.import(script, script.Parent, "kit-shop-buttons", "kit-shop-read-lore-button").KitShopReadLoreButton;
local KitShopRentKitBedCoinsButton = RuntimeLib.import(script, script.Parent, "kit-shop-buttons", "kit-shop-rent-kit-bedcoins-button").KitShopRentKitBedCoinsButton;
local KitShopRentKitButton = RuntimeLib.import(script, script.Parent, "kit-shop-buttons", "kit-shop-rent-kit-button").KitShopRentKitButton;
local KitShopVariantSelect = RuntimeLib.import(script, script.Parent, "kit-shop-buttons", "kit-shop-variant-select").KitShopVariantSelect;
local KitShopShowcase = RuntimeLib.import(script, script.Parent, "kit-shop-showcase", "kit-shop-showcase").KitShopShowcase;
local KitSkinList = RuntimeLib.import(script, script.Parent, "kit-skin-carousel", "kit-skin-list").KitSkinList;
local v8 = u4.Component:extend("KitShopRight");

function v8.init(u9, p10) -- Line: 58
    -- upvalues: u3 (copy), getKitPriceRobuxAsync (copy), BundleMeta (copy), MarketplaceUtil (copy), u4 (copy)
    u9.maid = u3.new();

    function u9.updateItemPrice() -- Line: 60
        -- upvalues: u9 (copy), getKitPriceRobuxAsync (ref), BundleMeta (ref), MarketplaceUtil (ref)
        if u9.props.SelectedKit then
            getKitPriceRobuxAsync(u9.props.SelectedKit):andThen(function(p11) -- Line: 63
                -- upvalues: u9 (ref)
                if p11 == nil then
                    return nil;
                end;

                u9:setState({
                    priceRobux = p11
                });
            end):catch(function(p12) -- Line: 71
                -- upvalues: u9 (ref)
                u9:setState({
                    priceRobux = -1
                });
            end);

            return;
        end;

        if u9.props.SelectedBundle then
            local v13 = BundleMeta[u9.props.SelectedBundle];
            local gamepassId = v13.gamepassId;

            if gamepassId ~= 0 and (gamepassId == gamepassId and gamepassId) then
                MarketplaceUtil.getGamePassProductInfoAsync(v13.gamepassId):andThen(function(p14) -- Line: 81
                    -- upvalues: u9 (ref)
                    local v15;

                    if p14 == nil then
                        v15 = p14;
                    else
                        v15 = p14.PriceInRobux;
                    end;

                    if v15 == nil then
                        return nil;
                    end;

                    u9:setState({
                        priceRobux = p14.PriceInRobux
                    });
                end):catch(function() -- Line: 93
                    -- upvalues: u9 (ref)
                    u9:setState({
                        priceRobux = -1
                    });
                end);

                return;
            end;

            local devProductId = v13.devProductId;

            if devProductId ~= 0 and (devProductId == devProductId and devProductId) then
                MarketplaceUtil.getDevProductInfoAsync(v13.devProductId):andThen(function(p16) -- Line: 102
                    -- upvalues: u9 (ref)
                    local v17;

                    if p16 == nil then
                        v17 = p16;
                    else
                        v17 = p16.PriceInRobux;
                    end;

                    if v17 == nil then
                        return nil;
                    end;

                    u9:setState({
                        priceRobux = p16.PriceInRobux
                    });
                end):catch(function() -- Line: 114
                    -- upvalues: u9 (ref)
                    u9:setState({
                        priceRobux = -1
                    });
                end);
            end;
        end;
    end;

    u9:setState({
        purchased = false
    });

    if p10.SelectedKit and p10.store.Bedwars.equippedKitSkins then
        u9:setState({
            selectedSkin = p10.store.Bedwars.equippedKitSkins[p10.SelectedKit] or u4.None
        });
    end;
end;

function v8.didUpdate(p18, p19, p20) -- Line: 132
    -- upvalues: u4 (copy)
    if p19.SelectedKit ~= p18.props.SelectedKit or p19.SelectedBundle ~= p18.props.SelectedBundle then
        p18:setState({
            purchased = false
        });

        if p18.props.SelectedKit and p18.props.store.Bedwars.equippedKitSkins then
            p18:setState({
                selectedSkin = p18.props.store.Bedwars.equippedKitSkins[p18.props.SelectedKit] or u4.None
            });
        end;

        p18.updateItemPrice();
    end;
end;

function v8.didMount(u21) -- Line: 146
    -- upvalues: UserInputService (copy), BedwarsKitShop (copy), DeviceUtil (copy), KnitClient (copy), Flamework (copy), default (copy), ClientStore (copy)
    if #UserInputService:GetConnectedGamepads() ~= 0 then
        u21.maid:GiveTask(UserInputService.InputBegan:Connect(function(p22, p23) -- Line: 148
            -- upvalues: u21 (copy), BedwarsKitShop (ref), DeviceUtil (ref), KnitClient (ref)
            if p22.KeyCode == Enum.KeyCode.ButtonA then
                local v24 = false;

                if u21.props.SelectedKit then
                    local v25 = table.find(u21.props.store.Bedwars.ownedKits, u21.props.SelectedKit) ~= nil and true or (BedwarsKitShop.FreeKitRotation.kitAvailableThisWeek(u21.props.SelectedKit, u21.props.store.Bedwars.freeKitLevel) and true or v24);
                    v24 = not DeviceUtil.isHoarceKat() and KnitClient.Controllers.UnlockController.allKitsUnlocked and true or v25;
                end;

                if v24 then
                    u21:equipKit();

                    return;
                end;

                u21:purchaseWithRobux();
            end;
        end));

        if not DeviceUtil.isHoarceKat() then
            u21.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
                actionId = "toggle-skin-gamepad",
                action = "Interact",

                boundFunction = function(p26, p27, p28) -- Line: 174, Name: boundFunction
                    -- upvalues: u21 (copy), default (ref), ClientStore (ref)
                    if p27 ~= Enum.UserInputState.Begin then
                        return nil;
                    end;

                    local v29 = not u21.props.store.Bedwars.useKitSkin;
                    default.Client:Get("BedwarsSetUseKitSkin"):CallServerAsync({
                        useKitSkin = v29
                    }):andThen(function() -- Line: 182
                    end):catch(function(p30) -- Line: 183
                        warn(p30);
                    end);
                    ClientStore:dispatch({
                        type = "SetUseKitSkin",
                        useKitSkin = v29
                    });
                end,

                priority = Enum.ContextActionPriority.High.Value + 10
            }));
        end;
    end;

    u21.updateItemPrice();
end;

function v8.willUnmount(p31) -- Line: 197
    p31.maid:DoCleaning();
end;

function v8.rentKit(p32) -- Line: 200
    -- upvalues: BedwarsKit (copy), KnitClient (copy)
    if not p32.props.SelectedKit then
        return false;
    end;

    local v33 = p32.props.SelectedKit and table.find(p32.props.store.Bedwars.ownedKits, p32.props.SelectedKit) ~= nil;

    if p32.props.SelectedKit == BedwarsKit.NONE or v33 then
        return false;
    end;

    return KnitClient.Controllers.KitRentalController:rentKit(p32.props.SelectedKit);
end;

function v8.equipKit(p34) -- Line: 217
    -- upvalues: default (copy), SoundManager (copy), GameSound (copy), ClientStore (copy)
    local SelectedKit = p34.props.SelectedKit;

    if not SelectedKit then
        return nil;
    end;

    default.Client:Get("BedwarsActivateKit"):CallServerAsync({
        kit = SelectedKit
    }):andThen(function(p35) -- Line: 225
        -- upvalues: SoundManager (ref), GameSound (ref), ClientStore (ref), SelectedKit (copy)
        if p35 then
            SoundManager:playSound(GameSound.ARMOR_UNEQUIP);
            ClientStore:dispatch({
                type = "SetBedwarsKit",
                kit = SelectedKit
            });
        end;
    end);
end;

function v8.purchaseWithRobux(p36) -- Line: 236
    -- upvalues: BedwarsKit (copy), getBedwarsKitMeta (copy), MarketplaceService (copy), Players (copy), KnitClient (copy)
    if p36.props.SelectedKit and p36.props.SelectedKit ~= BedwarsKit.NONE then
        local v37 = getBedwarsKitMeta(p36.props.SelectedKit);

        if v37.gamepassId ~= nil then
            MarketplaceService:PromptGamePassPurchase(Players.LocalPlayer, v37.gamepassId);

            return;
        end;

        if v37.devProductId ~= nil then
            MarketplaceService:PromptProductPurchase(Players.LocalPlayer, v37.devProductId);
        end;
    elseif p36.props.SelectedBundle then
        KnitClient.Controllers.LobbyBundleController:purchaseBundle(p36.props.SelectedBundle);
    end;
end;

function v8.render(u38) -- Line: 248
    -- upvalues: getBedwarsKitMeta (copy), BedwarsKit (copy), DeviceUtil (copy), KnitClient (copy), ArmorTrimUtil (copy), KitContractRewards (copy), u2 (copy), ConsumableStatus (copy), Players (copy), BattlePassUtils (copy), getSkinsForKit (copy), BedwarsKitSkin (copy), BedwarsKitSkinMeta (copy), BundleMeta (copy), Theme (copy), u4 (copy), KitShopShowcase (copy), getBattlePassMetadata (copy), Padding (copy), TooltipContainer (copy), AutoSizedText (copy), Empty (copy), KitSkinList (copy), KitShopKitSkinToggle (copy), KitShopVariantSelect (copy), KitShopEquipButton (copy), KitShopBattlePassButton (copy), Button (copy), KitShopPurchaseButton (copy), getKitPriceBedCoins (copy), KitShopRentKitButton (copy), PlaceUtil (copy), KitShopRentKitBedCoinsButton (copy), KitShopGiftButton (copy), KitShopContractButton (copy), KitShopReadLoreButton (copy), KitShopArmorTrimButton (copy)
    local v39;

    if u38.props.SelectedKit then
        v39 = getBedwarsKitMeta(u38.props.SelectedKit);
    else
        v39 = nil;
    end;

    local v40 = false;
    local v41 = u38.props.store.Bedwars.kit == u38.props.SelectedKit;
    local v42 = false;
    local v43 = u38.props.SelectedKit ~= BedwarsKit.NONE;
    local v44 = u38.props.SelectedKit ~= BedwarsKit.NONE;
    local v45;

    if DeviceUtil.isHoarceKat() or u38.props.SelectedBundle then
        v45 = false;
    else
        v45 = KnitClient.Controllers.UnlockController:isKitUnlocked(u38.props.SelectedKit or BedwarsKit.NONE);

        if v45 then
            local v46 = table.find(ArmorTrimUtil.BLACK_LISTED_ARMOR_TRIM_KITS, u38.props.SelectedKit or BedwarsKit.NONE) ~= nil;
            v45 = not v46;
        end;
    end;

    local v47 = false;
    local v48 = false;
    local SelectedKit = u38.props.SelectedKit;

    if SelectedKit then
        if u38.props.SelectedKit == BedwarsKit.NONE then
            SelectedKit = false;
        else
            SelectedKit = KitContractRewards[u38.props.SelectedKit] ~= nil;
        end;
    end;

    if SelectedKit then
        local v49 = KitContractRewards[u38.props.SelectedKit];

        if v49 ~= nil then
            v49 = v49.disabled;
        end;

        SelectedKit = not v49;
    end;

    local v50 = SelectedKit or (v44 or (v48 or v45));
    local v51;

    if DeviceUtil.isHoarceKat() then
        v51 = true;
    else
        local v52 = u38.props.SelectedKit and KnitClient.Controllers.UnlockController:isKitUnlocked(u38.props.SelectedKit);

        if not v52 then
            local MatchController = KnitClient.Controllers.MatchController;

            if MatchController ~= nil then
                MatchController = MatchController:getQueueMeta();

                if MatchController ~= nil then
                    MatchController = MatchController.allowUnownedKits;
                end;
            end;

            v52 = MatchController == true;
        end;

        v51 = v52 and true or v40;
    end;

    local v53 = not DeviceUtil.isHoarceKat() and (u38.props.SelectedKit and KnitClient.Controllers.UnlockController:isKitOwned(u38.props.SelectedKit)) and true or false;
    local v54 = not (u38.props.store.Bedwars.kit or u38.props.SelectedKit) and true or v41;

    local function _(p55) -- Line: 319
        -- upvalues: ConsumableStatus (ref), u38 (copy)
        local _ = p55[1];
        local v56 = p55[2];
        local v57 = v56.status == ConsumableStatus.ACTIVE;

        if v57 then
            local extraData = v56.extraData;

            if extraData ~= nil then
                extraData = extraData.rentedKit;
            end;

            v57 = extraData == u38.props.SelectedKit;
        end;

        return v57;
    end;

    local v58 = nil;

    for i, v in u2.entries(u38.props.store.Consumable.record) do
        local _ = i - 1;
        local _ = v[1];
        local v59 = v[2];
        local v60 = v59.status == ConsumableStatus.ACTIVE;

        if v60 then
            local extraData = v59.extraData;

            if extraData ~= nil then
                extraData = extraData.rentedKit;
            end;

            v60 = extraData == u38.props.SelectedKit;
        end;

        if v60 == true then
            v58 = v;
            break;
        end;
    end;

    if v58 ~= nil then
        v58 = v58[2];
    end;

    local v61 = v58 == nil and not v53;

    if v61 then
        if v39 ~= nil then
            v39 = v39.disableKitRenting;
        end;

        v61 = not v39;
    end;

    local v62 = v61 and true or false;
    local LocalPlayer = Players.LocalPlayer;

    if LocalPlayer ~= nil then
        LocalPlayer = LocalPlayer.DisplayName;
    end;

    local v63 = LocalPlayer == nil and "SnickTrix" or LocalPlayer;
    local v64, v65, v66;

    if u38.props.SelectedKit and u38.props.SelectedKit ~= BedwarsKit.NONE then
        v64 = getBedwarsKitMeta(u38.props.SelectedKit);
        v63 = v64.name;
        v65 = v64.description;
        v66 = u38.state.priceRobux;
        v42 = v64.battlepassSeason == BattlePassUtils.BATTLE_PASS_SEASON;
        v43 = not v64.notGiftable and (v64.devProductId ~= nil and true or v64.gamepassId ~= nil);
        v47 = not v64.forceSkin;

        if v66 == nil or (v66 == -1 or v53) then
            v44 = false;
        end;

        if v64.lore then
            v48 = true;
        end;
    else
        v64 = nil;
        v65 = "Opt out of using a kit and play as yourself!";
        v66 = nil;
    end;

    local v67 = not u38.props.SelectedKit and {} or getSkinsForKit(u38.props.SelectedKit);
    local v68 = nil;
    local v69;

    if u38.props.SelectedKit and u38.state.selectedSkin then
        local v70;

        if v67 == nil then
            v70 = v67;
        else
            v70 = table.find(v67, u38.state.selectedSkin) ~= nil;
        end;

        if v70 then
            v69 = u38.state.selectedSkin;
        else
            v69 = u38.props.store.Bedwars.equippedKitSkins;

            if v69 ~= nil then
                v69 = v69[u38.props.SelectedKit];
            end;
        end;

        local v71;

        if v69 then
            if v67 == nil then
                v71 = v67;
            else
                v71 = table.find(v67, v69) ~= nil;
            end;

            if v71 then
                v71 = v69 ~= BedwarsKitSkin.DEFAULT;
            end;
        else
            v71 = v69;
        end;

        if v71 then
            v68 = BedwarsKitSkinMeta[v69];
            v63 = BedwarsKitSkinMeta[v69].name;
        end;
    else
        v69 = nil;
    end;

    if u38.props.SelectedBundle then
        local v72 = BundleMeta[u38.props.SelectedBundle];

        if v72.kitShopBundle then
            v63 = v72.kitShopBundle.name;
            v65 = v72.kitShopBundle.description;
            v66 = u38.state.priceRobux;
            v43 = true;
            v44 = true;
            v51 = false;
            v54 = false;
        end;

        local function _(p73) -- Line: 444
            if p73.kit then
                return p73.kit;
            end;

            return nil;
        end;

        local v74 = 0;
        local v75 = {};

        for i, v in v72.rewards do
            local _ = i - 1;
            local v76;

            if v.kit then
                v76 = v.kit;
            else
                v76 = nil;
            end;

            if v76 ~= nil then
                v74 = v74 + 1;
                v75[v74] = v76;
            end;
        end;

        local function _(p77) -- Line: 458
            -- upvalues: u38 (copy)
            return table.find(u38.props.store.Bedwars.ownedKits, p77) ~= nil;
        end;

        local v78 = true;

        for i, v in v75 do
            local _ = i - 1;

            if table.find(u38.props.store.Bedwars.ownedKits, v) == nil then
                v78 = false;
                break;
            end;
        end;

        if v78 then
            v44 = false;
        end;
    end;

    local v79 = {
        BorderSizePixel = 0,
        Size = u38.props.Size,
        Position = u38.props.Position,
        BackgroundColor3 = Theme.backgroundSecondary
    };
    local v80 = { u4.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder"
        }) };
    local v81 = {
        Size = UDim2.fromScale(1, 0.3),
        SelectedKit = u38.props.SelectedKit or nil,
        SelectedSkin = v69
    };
    local v82;

    if u38.props.SelectedBundle then
        v82 = BundleMeta[u38.props.SelectedBundle].kitShopBundle;

        if v82 ~= nil then
            v82 = v82.image;
        end;
    else
        v82 = nil;
    end;

    v81.ItemImage = v82;
    v81.store = u38.props.store;
    v80[#v80 + 1] = u4.createElement(KitShopShowcase, v81);
    local v83 = {
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0.7)
    };
    local v84 = { u4.createElement("UIPadding", {
            PaddingTop = UDim.new(0.02, 0),
            PaddingBottom = UDim.new(0.03, 0),
            PaddingLeft = UDim.new(0.05, 0),
            PaddingRight = UDim.new(0.05, 0)
        }), u4.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Left",
            VerticalAlignment = "Top",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.03, 0)
        }) };
    local _ = #v84;
    local v85 = {
        LayoutOrder = 1,
        Size = UDim2.fromScale(1, 0.4)
    };
    local v86 = { u4.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Left",
            VerticalAlignment = "Top",
            Padding = UDim.new(0.03, 0)
        }) };
    local v87 = #v86;
    local v88 = {
        SizeConstraint = "RelativeXX",
        Size = UDim2.fromScale(1, 0.15)
    };
    local v89 = { u4.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            TextXAlignment = "Left",
            Text = v63,
            Size = UDim2.fromScale(0.75, 1),
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AutoLocalize = u38.props.SelectedKit ~= BedwarsKit.NONE
        }, { u4.createElement("UITextSizeConstraint", {
                MaxTextSize = DeviceUtil.isSmallScreen() and 20 or 28
            }) }) };
    local v90 = #v89;
    local v91;

    if v64 == nil or v64.battlepassSeason == nil then
        v91 = false;
    else
        local createElement = u4.createElement;
        local v92 = {
            Size = UDim2.fromScale(0.25, 0.75),
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(1, 0.5),
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local v93 = {};
        local createElement2 = u4.createElement;
        local v94 = {
            BackgroundTransparency = 1,
            TextScaled = true,
            AutoLocalize = true
        };
        local seasonNumber = getBattlePassMetadata(v64.battlepassSeason).seasonNumber;
        v94.Text = "S" .. tostring(seasonNumber);
        v94.Size = UDim2.fromScale(0.5, 1);
        v94.AnchorPoint = Vector2.new(0, 0.5);
        v94.Position = UDim2.fromScale(0.1, 0.5);
        v94.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
        v94.TextColor3 = Color3.fromRGB(255, 255, 255);
        v94.TextXAlignment = Enum.TextXAlignment.Left;
        local v95 = createElement2("TextLabel", v94);
        local v96 = u4.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.5, 1),
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(1, 0.5),
            Image = getBattlePassMetadata(v64.battlepassSeason).icon
        }, { u4.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }), u4.createElement(Padding, {
                Padding = UDim.new(0.05, 0)
            }) });
        local v97 = u4.createElement("UICorner", {
            CornerRadius = UDim.new(0.2, 0)
        });
        local createElement3 = u4.createElement;
        local v98 = {};
        local createElement4 = u4.createElement;
        local v99 = {
            TextSize = 26
        };
        local seasonNumber2 = getBattlePassMetadata(v64.battlepassSeason).seasonNumber;
        v99.Text = "Season " .. tostring(seasonNumber2);
        v99.Font = Enum.Font.SourceSansBold;
        v99.Limits = Vector2.new(300, 60);
        v98[1] = createElement4(AutoSizedText, v99);
        v93[1], v93[2], v93[3], v93[4] = v95, v96, v97, createElement3(TooltipContainer, {}, v98);
        v91 = createElement("Frame", v92, v93);
    end;

    if v91 then
        v89[v90 + 1] = v91;
    end;

    v86[v87 + 1] = u4.createElement(Empty, v88, v89);
    v86[v87 + 2] = u4.createElement("TextLabel", {
        BackgroundTransparency = 1,
        Font = "Roboto",
        TextScaled = true,
        RichText = true,
        TextTransparency = 0.3,
        TextXAlignment = "Left",
        TextYAlignment = "Top",
        Text = v65,
        Size = UDim2.fromScale(1, 0.77),
        TextColor3 = Color3.fromRGB(255, 255, 255)
    }, { u4.createElement("UITextSizeConstraint", {
            MinTextSize = 12,
            MaxTextSize = DeviceUtil.isSmallScreen() and 14 or 22
        }) });
    v84.KitInfo = u4.createElement(Empty, v85, v86);
    local v100 = {
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0.57)
    };
    local v101 = { u4.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Bottom",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.03, 0)
        }) };
    local v102 = #v101;
    local v104 = v67 and u38.props.SelectedKit and u4.createElement(KitSkinList, {
        Size = UDim2.fromScale(1, 0.42000000000000004),
        Kit = u38.props.SelectedKit,
        Skins = v67,
        SelectedSkin = v69,

        SetSelectedSkin = function(p103) -- Line: 647, Name: SetSelectedSkin
            -- upvalues: u38 (copy)
            u38:setState({
                selectedSkin = p103
            });
        end,

        store = u38.props.store
    });

    if v104 then
        v101[v102 + 1] = v104;
    end;

    local v105 = #v101;
    local v106 = u38.props.SelectedKit ~= BedwarsKit.NONE;

    if v106 then
        local v107 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.075)
        };
        local v108 = { u4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                Padding = UDim.new(0.05, 0)
            }) };
        local v109 = #v108;

        if v47 then
            v47 = u4.createElement(KitShopKitSkinToggle, {
                LayoutOrder = 0,
                Size = UDim2.fromScale(0.4, 1),
                UseKitSkin = u38.props.store.Bedwars.useKitSkin
            });
        end;

        if v47 then
            v108[v109 + 1] = v47;
        end;

        local v110 = #v108;
        local v111 = u38.state.selectedSkin and v69;

        if v111 then
            if v68 ~= nil then
                v68 = v68.variantOfSkin;
            end;

            if v68 then
                v68 = u4.createElement(KitShopVariantSelect, {
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.55, 1),
                    SelectedSkin = v69,

                    SetSelectedSkin = function(p112) -- Line: 694, Name: SetSelectedSkin
                        -- upvalues: u38 (copy)
                        u38:setState({
                            selectedSkin = p112
                        });
                    end,

                    store = u38.props.store
                });
            end;
        else
            v68 = v111;
        end;

        if v68 then
            v108[v110 + 1] = v68;
        end;

        v106 = u4.createElement(Empty, v107, v108);
    end;

    if v106 then
        v101[v105 + 1] = v106;
    end;

    local v113 = #v101;
    local v114;

    if v51 then
        v114 = u4.createElement(KitShopEquipButton, {
            Size = UDim2.fromScale(1, 1),
            Equipped = v54,

            EquipKit = function() -- Line: 717, Name: EquipKit
                -- upvalues: u38 (copy)
                u38:equipKit();
            end,

            ActiveRental = v58
        });
    elseif v42 then
        v114 = u4.createElement(KitShopBattlePassButton, {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.8, 1)
        });
    else
        local v115;

        if v64 == nil then
            v115 = false;
        else
            v115 = v64.battlepassSeason ~= nil;
        end;

        if v115 then
            local seasonNumber = getBattlePassMetadata(v64.battlepassSeason).seasonNumber;
            v115 = (seasonNumber == nil and (1 / 0) or seasonNumber) < 10;
        end;

        if v115 then
            v114 = u4.createElement(Button, {
                Text = "Unobtainable",
                BackgroundColor3 = Theme.Gray,

                OnClick = function() -- Line: 741, Name: OnClick
                end,

                Size = UDim2.fromScale(0.8, 1)
            });
        else
            v114 = u4.createElement(Empty, {
                Size = UDim2.fromScale(0.8, 1)
            });
        end;
    end;

    local v116 = {
        LayoutOrder = 3,
        Size = UDim2.fromScale(1, 0.145)
    };
    local v117 = {
        u4.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            HorizontalAlignment = v51 and "Left" or "Right",
            Padding = UDim.new(0.05, 0)
        }),
        [#v117 + 1] = v114
    };
    v101.EquipButtonContainer = u4.createElement(Empty, v116, v117);

    if v44 then
        local v118 = {
            LayoutOrder = 4,
            Size = UDim2.fromScale(1, 0.145)
        };
        local v119 = { u4.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Left",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.04, 0)
            }) };
        local v120 = #v119;
        local v121;

        if v44 then
            if v66 == nil then
                v121 = false;
            else
                v121 = u4.createElement(KitShopPurchaseButton, {
                    LayoutOrder = 1,
                    PurchaseButtonType = "Robux",
                    Size = UDim2.fromScale(0.48, 1),

                    Purchase = function() -- Line: 784, Name: Purchase
                        -- upvalues: u38 (copy)
                        u38:purchaseWithRobux();
                    end,

                    Price = v66
                });
            end;
        else
            v121 = v44;
        end;

        if v121 then
            v119[v120 + 1] = v121;
        end;

        local v122 = #v119;
        local SelectedKit2 = u38.props.SelectedKit;

        if SelectedKit2 then
            if u38.props.SelectedKit == BedwarsKit.NONE then
                v44 = false;
            elseif v44 then
                v44 = v66 ~= nil;
            end;
        else
            v44 = SelectedKit2;
        end;

        if v44 then
            local v124 = {
                LayoutOrder = 1,
                PurchaseButtonType = "BedCoin",
                Size = UDim2.fromScale(0.48, 1),

                Purchase = function() -- Line: 799, Name: Purchase
                    -- upvalues: u38 (copy), BedwarsKit (ref), getBedwarsKitMeta (ref), KnitClient (ref)
                    if u38.props.SelectedKit and u38.props.SelectedKit ~= BedwarsKit.NONE then
                        local v123 = getBedwarsKitMeta(u38.props.SelectedKit);
                        local bedCoinProduct = v123.bedCoinProduct;

                        if bedCoinProduct ~= nil then
                            bedCoinProduct = bedCoinProduct.bedCoinProductId;
                        end;

                        if bedCoinProduct ~= 0 and (bedCoinProduct == bedCoinProduct and bedCoinProduct) then
                            KnitClient.Controllers.BedCoinProductPurchaseController:purchase({
                                productId = v123.bedCoinProduct.bedCoinProductId
                            });
                        end;
                    end;
                end
            };
            local v125 = getKitPriceBedCoins(u38.props.SelectedKit);
            v124.Price = v125 == nil and 0 or v125;
            v44 = u4.createElement(KitShopPurchaseButton, v124);
        end;

        if v44 then
            v119[v122 + 1] = v44;
        end;

        v44 = u4.createElement(Empty, v118, v119);
    end;

    if v44 then
        v101[v113 + 1] = v44;
    end;

    local v126 = #v101;

    if v50 then
        local v127 = {
            LayoutOrder = 5,
            Size = UDim2.fromScale(1, 0.145)
        };
        local v128 = { u4.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Right",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.04, 0)
            }) };
        local v129 = #v128;
        local SelectedKit2 = u38.props.SelectedKit;

        if SelectedKit2 then
            if v62 then
                SelectedKit2 = u4.createElement(KitShopRentKitButton, {
                    LayoutOrder = 4,
                    Size = UDim2.fromScale(0.15, 0.9),
                    SelectedKit = u38.props.SelectedKit,

                    RentKit = function() -- Line: 853, Name: RentKit
                        -- upvalues: u38 (copy)
                        return u38:rentKit();
                    end
                });
            else
                SelectedKit2 = v62;
            end;
        end;

        if SelectedKit2 then
            v128[v129 + 1] = SelectedKit2;
        end;

        local v130 = #v128;
        local v131 = PlaceUtil.isLobbyServer() and u38.props.SelectedKit;

        if v131 then
            if v62 then
                v62 = u4.createElement(KitShopRentKitBedCoinsButton, {
                    LayoutOrder = 4,
                    Size = UDim2.fromScale(0.15, 0.9),
                    SelectedKit = u38.props.SelectedKit,

                    OnClick = function() -- Line: 865, Name: OnClick
                        -- upvalues: u38 (copy), KnitClient (ref)
                        if u38.props.SelectedKit then
                            KnitClient.Controllers.KitRentalController:promptBedCoinPurchaseKitRental(u38.props.SelectedKit);
                        end;
                    end
                });
            end;
        else
            v62 = v131;
        end;

        if v62 then
            v128[v130 + 1] = v62;
        end;

        local v132 = #v128;

        if v43 then
            local createElement = u4.createElement;
            local v133 = {
                LayoutOrder = 100,
                Size = UDim2.fromScale(0.15, 0.9)
            };
            local v134;

            if u38.props.SelectedKit and u38.props.SelectedKit ~= BedwarsKit.NONE then
                v134 = u38.props.SelectedKit;
            else
                v134 = u38.props.SelectedBundle or BedwarsKit.NONE;
            end;

            v133.GiftType = v134;
            v43 = createElement(KitShopGiftButton, v133);
        end;

        if v43 then
            v128[v132 + 1] = v43;
        end;

        local v135 = #v128;
        local SelectedKit3 = u38.props.SelectedKit;

        if SelectedKit3 then
            if SelectedKit then
                SelectedKit = u4.createElement(KitShopContractButton, {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.15, 0.9),
                    SelectedKit = u38.props.SelectedKit
                });
            end;
        else
            SelectedKit = SelectedKit3;
        end;

        if SelectedKit then
            v128[v135 + 1] = SelectedKit;
        end;

        local v136 = #v128;
        local SelectedKit4 = u38.props.SelectedKit;

        if SelectedKit4 then
            if v48 then
                v48 = u4.createElement(KitShopReadLoreButton, {
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.15, 0.9),
                    SelectedKit = u38.props.SelectedKit
                });
            end;
        else
            v48 = SelectedKit4;
        end;

        if v48 then
            v128[v136 + 1] = v48;
        end;

        local v137 = #v128;
        local v138 = PlaceUtil.isLobbyServer();

        if v138 then
            if v45 then
                v45 = u4.createElement(KitShopArmorTrimButton, {
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.15, 0.9),
                    SelectedKit = u38.props.SelectedKit or BedwarsKit.NONE
                });
            end;
        else
            v45 = v138;
        end;

        if v45 then
            v128[v137 + 1] = v45;
        end;

        v50 = u4.createElement(Empty, v127, v128);
    end;

    if v50 then
        v101[v126 + 1] = v50;
    end;

    v84.KitActions = u4.createElement(Empty, v100, v101);
    v80.BottomSection = u4.createElement(Empty, v83, v84);

    return u4.createFragment({
        KitShopRight = u4.createElement("Frame", v79, v80)
    });
end;

return {
    KitShopRight = v8
};