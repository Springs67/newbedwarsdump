-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local MarketplaceService = v5.MarketplaceService;
local Players = v5.Players;
local UserInputService = v5.UserInputService;
local KitShopKitSkinToggle = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "kit-shop", "right", "kit-shop-buttons", "kit-shop-kit-skin-toggle").KitShopKitSkinToggle;
local KitShopVariantSelect = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "kit-shop", "right", "kit-shop-buttons", "kit-shop-variant-select").KitShopVariantSelect;
local KitShopShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "kit-shop", "right", "kit-shop-showcase", "kit-shop-showcase").KitShopShowcase;
local KitSkinList = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "kit-shop", "right", "kit-skin-carousel", "kit-skin-list").KitSkinList;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
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
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local getKitPriceRobuxAsync = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getKitPriceRobuxAsync;
local MarketplaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "marketplace-util").MarketplaceUtil;
local TrainingRoomKitSelectionEquipButton = RuntimeLib.import(script, script.Parent, "training-room-kit-selection-equip-button").TrainingRoomKitSelectionEquipButton;
local v7 = u4.Component:extend("TrainingRoomKitSelectionRight");

function v7.init(u8, p9) -- Line: 40
    -- upvalues: u3 (copy), getKitPriceRobuxAsync (copy), BundleMeta (copy), MarketplaceUtil (copy), u4 (copy)
    u8.maid = u3.new();

    function u8.updateItemPrice() -- Line: 42
        -- upvalues: u8 (copy), getKitPriceRobuxAsync (ref), BundleMeta (ref), MarketplaceUtil (ref)
        if u8.props.SelectedKit then
            getKitPriceRobuxAsync(u8.props.SelectedKit):andThen(function(p10) -- Line: 45
                -- upvalues: u8 (ref)
                if p10 == nil then
                    return nil;
                end;

                u8:setState({
                    priceRobux = p10
                });
            end):catch(function(p11) -- Line: 53
                -- upvalues: u8 (ref)
                u8:setState({
                    priceRobux = -1
                });
            end);

            return;
        end;

        if u8.props.SelectedBundle then
            local v12 = BundleMeta[u8.props.SelectedBundle];
            local gamepassId = v12.gamepassId;

            if gamepassId ~= 0 and (gamepassId == gamepassId and gamepassId) then
                MarketplaceUtil.getGamePassProductInfoAsync(v12.gamepassId):andThen(function(p13) -- Line: 63
                    -- upvalues: u8 (ref)
                    local v14;

                    if p13 == nil then
                        v14 = p13;
                    else
                        v14 = p13.PriceInRobux;
                    end;

                    if v14 == nil then
                        return nil;
                    end;

                    u8:setState({
                        priceRobux = p13.PriceInRobux
                    });
                end):catch(function() -- Line: 75
                    -- upvalues: u8 (ref)
                    u8:setState({
                        priceRobux = -1
                    });
                end);
            end;
        end;
    end;

    u8:setState({
        purchased = false
    });

    if p9.SelectedKit and p9.store.Bedwars.equippedKitSkins then
        u8:setState({
            selectedSkin = p9.store.Bedwars.equippedKitSkins[p9.SelectedKit] or u4.None
        });
    end;
end;

function v7.didUpdate(p15, p16, p17) -- Line: 92
    -- upvalues: u4 (copy)
    if p16.SelectedKit ~= p15.props.SelectedKit then
        p15:setState({
            purchased = false
        });

        if p15.props.SelectedKit and p15.props.store.Bedwars.equippedKitSkins then
            p15:setState({
                selectedSkin = p15.props.store.Bedwars.equippedKitSkins[p15.props.SelectedKit] or u4.None
            });
        end;

        p15.updateItemPrice();
    end;
end;

function v7.didMount(u18) -- Line: 105
    -- upvalues: UserInputService (copy), BedwarsKitShop (copy), DeviceUtil (copy), KnitClient (copy), Flamework (copy), default (copy), ClientStore (copy)
    if UserInputService.GamepadEnabled and not UserInputService.MouseEnabled then
        u18.maid:GiveTask(UserInputService.InputBegan:Connect(function(p19, p20) -- Line: 107
            -- upvalues: u18 (copy), BedwarsKitShop (ref), DeviceUtil (ref), KnitClient (ref)
            if p19.KeyCode == Enum.KeyCode.ButtonA then
                local v21 = false;

                if u18.props.SelectedKit then
                    local v22 = table.find(u18.props.store.Bedwars.ownedKits, u18.props.SelectedKit) ~= nil and true or (BedwarsKitShop.FreeKitRotation.kitAvailableThisWeek(u18.props.SelectedKit, u18.props.store.Bedwars.freeKitLevel) and true or v21);
                    v21 = not DeviceUtil.isHoarceKat() and KnitClient.Controllers.UnlockController.allKitsUnlocked and true or v22;
                end;

                if v21 then
                    u18:confirmKitSelection();

                    return;
                end;

                u18:purchase();
            end;
        end));
    end;

    u18.updateItemPrice();
    u18.maid:GiveTask(function() -- Line: 131
        -- upvalues: Flamework (ref), u18 (copy), default (ref), ClientStore (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
            actionId = "toggle-skin-gamepad",
            action = "Interact",

            boundFunction = function(p23, p24, p25) -- Line: 135, Name: boundFunction
                -- upvalues: u18 (ref), default (ref), ClientStore (ref)
                if p24 ~= Enum.UserInputState.Begin then
                    return nil;
                end;

                local v26 = not u18.props.store.Bedwars.useKitSkin;
                default.Client:Get("BedwarsSetUseKitSkin"):CallServerAsync({
                    useKitSkin = v26
                }):andThen(function() -- Line: 143
                end):catch(function(p27) -- Line: 144
                    warn(p27);
                end);
                ClientStore:dispatch({
                    type = "SetUseKitSkin",
                    useKitSkin = v26
                });
            end,

            priority = Enum.ContextActionPriority.High.Value + 10
        });
    end);
end;

function v7.willUnmount(p28) -- Line: 156
    p28.maid:DoCleaning();
end;

function v7.rentKit(p29) -- Line: 159
    -- upvalues: BedwarsKit (copy), KnitClient (copy)
    if not p29.props.SelectedKit then
        return false;
    end;

    local v30 = p29.props.SelectedKit and table.find(p29.props.store.Bedwars.ownedKits, p29.props.SelectedKit) ~= nil;

    if p29.props.SelectedKit == BedwarsKit.NONE or v30 then
        return false;
    end;

    return KnitClient.Controllers.KitRentalController:rentKit(p29.props.SelectedKit);
end;

function v7.confirmKitSelection(p31) -- Line: 176
    -- upvalues: default (copy), Flamework (copy), BedwarsAppIds (copy)
    if not p31.props.SelectedKit then
        return nil;
    end;

    default.Client:Get("TrainingRoomQueue"):SendToServer({});
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.TRAINING_ROOM_KIT_SELECTION_APP);
end;

function v7.purchase(p32) -- Line: 185
    -- upvalues: BedwarsKit (copy), getBedwarsKitMeta (copy), MarketplaceService (copy), Players (copy), KnitClient (copy)
    if p32.props.SelectedKit and p32.props.SelectedKit ~= BedwarsKit.NONE then
        local v33 = getBedwarsKitMeta(p32.props.SelectedKit);

        if v33.gamepassId ~= nil then
            MarketplaceService:PromptGamePassPurchase(Players.LocalPlayer, v33.gamepassId);

            return;
        end;

        if v33.devProductId ~= nil then
            MarketplaceService:PromptProductPurchase(Players.LocalPlayer, v33.devProductId);
        end;
    elseif p32.props.SelectedBundle then
        KnitClient.Controllers.LobbyBundleController:purchaseBundle(p32.props.SelectedBundle);
    end;
end;

function v7.render(u34) -- Line: 197
    -- upvalues: getBedwarsKitMeta (copy), BedwarsKit (copy), KitContractRewards (copy), DeviceUtil (copy), KnitClient (copy), BedwarsKitShop (copy), u2 (copy), ConsumableStatus (copy), BattlePassUtils (copy), Players (copy), BedwarsKitSkinMeta (copy), BedwarsKitSkin (copy), BundleMeta (copy), getSkinsForKit (copy), Theme (copy), u4 (copy), KitShopShowcase (copy), Empty (copy), KitSkinList (copy), KitShopVariantSelect (copy), KitShopKitSkinToggle (copy), TrainingRoomKitSelectionEquipButton (copy)
    local v35;

    if u34.props.SelectedKit then
        v35 = getBedwarsKitMeta(u34.props.SelectedKit);
    else
        v35 = nil;
    end;

    local v36 = false;
    local v37 = false;
    local v38 = u34.props.store.Bedwars.kit == u34.props.SelectedKit;
    local _ = u34.props.SelectedKit == BedwarsKit.NONE;
    local v39 = u34.props.SelectedKit ~= BedwarsKit.NONE;
    local v40 = false;
    local v41 = true;
    local SelectedKit = u34.props.SelectedKit;

    if SelectedKit then
        if u34.props.SelectedKit == BedwarsKit.NONE then
            SelectedKit = false;
        else
            SelectedKit = KitContractRewards[u34.props.SelectedKit] ~= nil;
        end;
    end;

    if u34.props.SelectedKit == BedwarsKit.NONE then
        v37 = true;
    else
        local v42 = u34.props.SelectedKit and table.find(u34.props.store.Bedwars.ownedKits, u34.props.SelectedKit) ~= nil;

        if v42 then
            v36 = true;
            v37 = true;
        end;
    end;

    local myClan = u34.props.store.Clans.myClan;
    local v43 = u34.props.SelectedKit and (myClan and myClan.kitShop.unlocks[u34.props.SelectedKit] ~= nil) and true or v37;
    local v44 = not DeviceUtil.isHoarceKat() and KnitClient.Controllers.UnlockController.allKitsUnlocked and true or v43;
    local v45 = not (u34.props.store.Bedwars.kit or u34.props.SelectedKit) and true or v38;

    if u34.props.SelectedKit then
        BedwarsKitShop.FreeKitRotation.kitAvailableThisWeek(u34.props.SelectedKit, u34.props.store.Bedwars.freeKitLevel);
    end;

    local function _(p46) -- Line: 261
        -- upvalues: ConsumableStatus (ref), u34 (copy)
        local _ = p46[1];
        local v47 = p46[2];
        local v48 = v47.status == ConsumableStatus.ACTIVE;

        if v48 then
            local extraData = v47.extraData;

            if extraData ~= nil then
                extraData = extraData.rentedKit;
            end;

            v48 = extraData == u34.props.SelectedKit;
        end;

        return v48;
    end;

    local v49 = nil;

    for i, v in u2.entries(u34.props.store.Consumable.record) do
        local _ = i - 1;
        local _ = v[1];
        local v50 = v[2];
        local v51 = v50.status == ConsumableStatus.ACTIVE;

        if v51 then
            local extraData = v50.extraData;

            if extraData ~= nil then
                extraData = extraData.rentedKit;
            end;

            v51 = extraData == u34.props.SelectedKit;
        end;

        if v51 == true then
            v49 = v;
            break;
        end;
    end;

    if v49 ~= nil then
        v49 = v49[2];
    end;

    if not u34.props.SelectedKit or u34.props.SelectedKit == BedwarsKit.NONE then
        v41 = false;
    end;

    if u34.props.SelectedKit ~= BedwarsKit.NONE and (v49 ~= nil or v36) then
        v41 = false;
    end;

    local v52;

    if v35 == nil then
        v52 = v35;
    else
        v52 = v35.unlockedInBattlePass;
    end;

    if v52 then
        v52 = v35.battlepassSeason == BattlePassUtils.BATTLE_PASS_SEASON;
    end;

    if v52 then
        v41 = false;
    end;

    local LocalPlayer = Players.LocalPlayer;

    if LocalPlayer ~= nil then
        LocalPlayer = LocalPlayer.DisplayName;
    end;

    local v53 = LocalPlayer == nil and "SnickTrix" or LocalPlayer;
    local v54;

    if u34.props.SelectedKit and u34.props.SelectedKit ~= BedwarsKit.NONE then
        local v55 = getBedwarsKitMeta(u34.props.SelectedKit);
        v53 = v55.name;
        v54 = v55.description;
        local priceRobux = u34.state.priceRobux;
        local unlockedInBattlePass = v55.unlockedInBattlePass;

        if unlockedInBattlePass == nil then
            unlockedInBattlePass = false;
        end;

        local _ = not (unlockedInBattlePass or v55.notGiftable) and (v55.devProductId ~= nil and true or v55.gamepassId ~= nil);
        v40 = not v55.forceSkin;

        if priceRobux == nil or (priceRobux == -1 or (unlockedInBattlePass or v44)) then
            v39 = false;
        end;

        local _ = v55.lore;
    else
        v54 = "No current kit selected";
    end;

    local v56;

    if u34.state.selectedSkin and v40 then
        v56 = BedwarsKitSkinMeta[u34.state.selectedSkin];
    else
        v56 = nil;
    end;

    if u34.state.selectedSkin and u34.state.selectedSkin ~= BedwarsKitSkin.DEFAULT then
        v53 = BedwarsKitSkinMeta[u34.state.selectedSkin].name;
    end;

    if u34.props.SelectedBundle then
        local v57 = BundleMeta[u34.props.SelectedBundle];

        if v57.kitShopBundle then
            v53 = v57.kitShopBundle.name;
            v54 = v57.kitShopBundle.description;
            local _ = u34.state.priceRobux;
            v45 = false;
            v39 = true;
        end;

        local function _(p58) -- Line: 368
            if p58.kit then
                return p58.kit;
            end;

            return nil;
        end;

        local v59 = 0;
        local v60 = {};

        for i, v in v57.rewards do
            local _ = i - 1;
            local v61;

            if v.kit then
                v61 = v.kit;
            else
                v61 = nil;
            end;

            if v61 ~= nil then
                v59 = v59 + 1;
                v60[v59] = v61;
            end;
        end;

        if v60 ~= nil then
            local function _(p62) -- Line: 384
                -- upvalues: u34 (copy)
                return table.find(u34.props.store.Bedwars.ownedKits, p62) ~= nil;
            end;

            v60 = true;

            for i, v in v60 do
                local _ = i - 1;

                if table.find(u34.props.store.Bedwars.ownedKits, v) == nil then
                    v60 = false;
                    break;
                end;
            end;
        end;

        if v60 then
            v39 = false;
        end;
    end;

    local v63 = not u34.props.SelectedKit and {} or getSkinsForKit(u34.props.SelectedKit);
    local v64 = {
        BorderSizePixel = 0,
        Size = u34.props.Size,
        Position = u34.props.Position,
        BackgroundColor3 = Theme.backgroundSecondary
    };
    local v65 = { u4.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder"
        }) };
    local v66 = {
        Size = UDim2.fromScale(1, 0.3),
        SelectedKit = u34.props.SelectedKit or nil,
        SelectedSkin = u34.state.selectedSkin
    };
    local v67;

    if u34.props.SelectedBundle then
        v67 = BundleMeta[u34.props.SelectedBundle].kitShopBundle;

        if v67 ~= nil then
            v67 = v67.image;
        end;
    else
        v67 = nil;
    end;

    v66.ItemImage = v67;
    v66.store = u34.props.store;
    v65[#v65 + 1] = u4.createElement(KitShopShowcase, v66);
    local v68 = {
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0.7)
    };
    local v69 = {
        u4.createElement("UIPadding", {
            PaddingTop = UDim.new(0.02, 0),
            PaddingBottom = UDim.new(0.03, 0),
            PaddingLeft = UDim.new(0.05, 0),
            PaddingRight = UDim.new(0.05, 0)
        }),
        u4.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Left",
            VerticalAlignment = "Top",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.03, 0)
        }),
        KitInfo = u4.createElement(Empty, {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.375)
        }, { u4.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Left",
                VerticalAlignment = "Top",
                Padding = UDim.new(0.03, 0)
            }), u4.createElement("TextLabel", {
                SizeConstraint = "RelativeXX",
                BackgroundTransparency = 1,
                Font = "Roboto",
                TextScaled = true,
                RichText = true,
                TextXAlignment = "Left",
                Text = "<b>" .. v53 .. "</b>",
                Size = UDim2.fromScale(1, 0.15),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                AutoLocalize = u34.props.SelectedKit ~= BedwarsKit.NONE
            }, { u4.createElement("UITextSizeConstraint", {
                    MaxTextSize = DeviceUtil.isSmallScreen() and 20 or 28
                }) }), u4.createElement("TextLabel", {
                BackgroundTransparency = 1,
                Font = "Roboto",
                TextScaled = true,
                RichText = true,
                TextTransparency = 0.3,
                TextXAlignment = "Left",
                TextYAlignment = "Top",
                Text = v54,
                Size = UDim2.fromScale(1, 0.77),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }, { u4.createElement("UITextSizeConstraint", {
                    MaxTextSize = DeviceUtil.isSmallScreen() and 14 or 22
                }) }) })
    };
    local _ = #v69;
    local v70 = {
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0.595)
    };
    local v71 = { u4.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Bottom",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.03, 0)
        }) };
    local v72 = #v71;
    local v74 = v63 and u34.props.SelectedKit and u4.createElement(KitSkinList, {
        Size = UDim2.fromScale(1, 0.42000000000000004),
        Kit = u34.props.SelectedKit,
        Skins = v63,
        SelectedSkin = u34.state.selectedSkin,

        SetSelectedSkin = function(p73) -- Line: 519, Name: SetSelectedSkin
            -- upvalues: u34 (copy)
            u34:setState({
                selectedSkin = p73
            });
        end,

        store = u34.props.store
    });

    if v74 then
        v71[v72 + 1] = v74;
    end;

    local v75 = #v71;

    if u34.props.SelectedKit == BedwarsKit.NONE then
        v40 = false;
    end;

    if v40 then
        local selectedSkin = u34.state.selectedSkin;

        if selectedSkin then
            if v56 ~= nil then
                v56 = v56.variantOfSkin;
            end;

            if v56 then
                v56 = u4.createElement(KitShopVariantSelect, {
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.55, 1),
                    SelectedSkin = u34.state.selectedSkin,

                    SetSelectedSkin = function(p76) -- Line: 544, Name: SetSelectedSkin
                        -- upvalues: u34 (copy)
                        u34:setState({
                            selectedSkin = p76
                        });
                    end,

                    store = u34.props.store
                });
            end;
        else
            v56 = selectedSkin;
        end;

        local v77 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.075)
        };
        local v78 = { u4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                Padding = UDim.new(0.05, 0)
            }), u4.createElement(KitShopKitSkinToggle, {
                LayoutOrder = 0,
                Size = UDim2.fromScale(0.4, 1),
                UseKitSkin = u34.props.store.Bedwars.useKitSkin
            }) };
        local v79 = #v78;

        if v56 then
            v78[v79 + 1] = v56;
        end;

        v40 = u4.createElement(Empty, v77, v78);
    end;

    if v40 then
        v71[v75 + 1] = v40;
    end;

    local v80 = #v71;
    v71.EquipButtonContainer = u4.createElement(Empty, {
        LayoutOrder = 3,
        Size = UDim2.fromScale(1, 0.145)
    }, { u4.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.05, 0)
        }), u4.createElement(TrainingRoomKitSelectionEquipButton, {
            Size = UDim2.fromScale(v41 and 0.8 or 1, 1),
            Equipped = v45,

            EquipKit = function() -- Line: 594, Name: EquipKit
                -- upvalues: u34 (copy)
                u34:confirmKitSelection();
            end,

            ActiveRental = v49
        }) });

    if v39 then
        v39 = u4.createElement(Empty, {
            LayoutOrder = 4,
            Size = UDim2.fromScale(1, 0.145)
        }, { u4.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Right",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.04, 0)
            }) });
    end;

    if v39 then
        v71[v80 + 1] = v39;
    end;

    local _ = #v71;
    v69.KitActions = u4.createElement(Empty, v70, v71);
    v65.BottomSection = u4.createElement(Empty, v68, v69);

    return u4.createFragment({
        TrainingRoomKitSelectionRight = u4.createElement("Frame", v64, v65)
    });
end;

return {
    TrainingRoomKitSelectionRight = v7
};