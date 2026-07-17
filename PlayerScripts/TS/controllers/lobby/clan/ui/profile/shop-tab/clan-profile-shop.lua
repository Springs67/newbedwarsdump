-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local ShopItemTile = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "shop-item-tile").ShopItemTile;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local ClanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local getClanHqBackgroundMusicMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-background-music-meta").getClanHqBackgroundMusicMeta;
local ClanShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "shop", "clan-shop").ClanShop;
local ClanShopItemsMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "shop", "clan-shop-item-meta").ClanShopItemsMeta;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-meta");
local ClanUpgradeMeta = v7.ClanUpgradeMeta;
local ClanUpgradeTypeMeta = v7.ClanUpgradeTypeMeta;
local EventUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local BackgroundMusicPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "background-music-priority").BackgroundMusicPriority;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v143 = v5.new(u4)(function(u8, p9) -- Line: 34
    -- upvalues: u3 (copy), DeviceUtil (copy), ClientStore (copy), KnitClient (copy), u4 (copy), ColorUtil (copy), BedwarsImageId (copy), Theme (copy), ClanUpgradeTypeMeta (copy), Padding (copy), Empty (copy), Countdown (copy), ClanUtil (copy), u2 (copy), ClanShopItemsMeta (copy), ClanShop (copy), ClanUpgradeMeta (copy), ShopItemTile (copy), SoundManager (copy), GameSound (copy), Flamework (copy), BedwarsAppIds (copy), EventUtil (copy), UILayers (copy), BackgroundMusicPriority (copy), getClanHqBackgroundMusicMeta (copy), AutoCanvasScrollingFrame (copy)
    local useEffect = p9.useEffect;
    local useMemo = p9.useMemo;
    local u10, u11 = p9.useState(nil);
    local u12 = useMemo(function() -- Line: 39
        -- upvalues: u3 (ref)
        return u3.new();
    end, {});
    useEffect(function() -- Line: 42
        -- upvalues: DeviceUtil (ref), ClientStore (ref), KnitClient (ref)
        if DeviceUtil.isHoarceKat() then
            return nil;
        end;

        if ClientStore:getState().Clans.clanContributionShop == nil then
            KnitClient.Controllers.ClanShopController:requestClanShopData();
        end;
    end, {});
    useEffect(function() -- Line: 50
        -- upvalues: u12 (copy)
        return function() -- Line: 51
            -- upvalues: u12 (ref)
            u12:DoCleaning();
        end;
    end, {});
    local u13 = u10 ~= nil;

    local function _(p14) -- Line: 56
        -- upvalues: KnitClient (ref)
        return KnitClient.Controllers.ClanShopController:purchaseItem(p14);
    end;

    local function u16(p15) -- Line: 59
        -- upvalues: u4 (ref), ColorUtil (ref), BedwarsImageId (ref), Theme (ref), ClanUpgradeTypeMeta (ref)
        return u4.createFragment({
            ShopItemLockedOverlay = u4.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 0.2,
                ZIndex = 10,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.fromScale(0.5, 1),
                BackgroundColor3 = ColorUtil.BLACK
            }, {
                u4.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.15, 0),
                    PaddingBottom = UDim.new(0.15, 0),
                    PaddingLeft = UDim.new(0.05, 0),
                    PaddingRight = UDim.new(0.05, 0)
                }),
                u4.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    HorizontalAlignment = "Center",
                    VerticalAlignment = "Center",
                    Padding = UDim.new(0.1, 0)
                }),
                LockedIcon = u4.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    ScaleType = "Fit",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    ZIndex = 10,
                    Size = UDim2.fromScale(1, 0.3),
                    Image = BedwarsImageId.LOCK_SOLID
                }),
                LockedMessage = u4.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    TextScaled = true,
                    RichText = true,
                    Font = "Roboto",
                    TextXAlignment = "Center",
                    TextYAlignment = "Center",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    ZIndex = 10,
                    Size = UDim2.fromScale(1, 0),
                    Text = "<b>Unlocked with <font color=\"" .. ColorUtil.richTextColor(Theme.mcYellow) .. "\">(" .. ClanUpgradeTypeMeta[p15.ItemClanUpgrade.type].name .. " Lv." .. tostring(p15.ItemClanUpgrade.level) .. ")</font> upgrade</b>",
                    TextColor3 = ColorUtil.WHITE
                }, { u4.createElement("UITextSizeConstraint", {
                        MaxTextSize = 16
                    }) })
            })
        });
    end;

    local v17 = {
        Size = UDim2.new(1, 0, 1, 0)
    };
    local FrameProps = u8.FrameProps;

    if FrameProps then
        for i, v in FrameProps do
            v17[i] = v;
        end;
    end;

    local v18 = {};
    local _ = #v18;
    local v19 = {
        ScrollingFrameProps = {
            LayoutOrder = 2,
            Selectable = false,
            Size = UDim2.fromScale(1, 1)
        }
    };
    local v20 = { u4.createElement(Padding, {
            Padding = {
                Vertical = 2,
                Horizontal = 2
            }
        }), u4.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 12)
        }), u4.createElement(Empty, {
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, 0, 18)
        }, {
            u4.createElement("TextLabel", {
                Text = "Clan Contribution Shop",
                TextXAlignment = "Left",
                TextScaled = true,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }),
            CountdownContainer = u4.createElement(Empty, {
                AutomaticSize = "X",
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.fromScale(0.95, 0.5),
                Size = UDim2.fromScale(0.5, 1)
            }, { u4.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    HorizontalAlignment = "Right",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 6)
                }), u4.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    ScaleType = "Fit",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0.75),
                    Image = BedwarsImageId.HUD_TIMER_ICON
                }), u4.createElement(Countdown, {
                    PostText = "<font transparency=\"0.3\" size=\"12\">  Shop Refresh</font>",
                    EndTime = ClanUtil.resetTime:getNextWeeklyResetTime(),
                    CountdownConfig = {
                        days = true,
                        hours = true,
                        seperator = ":"
                    },
                    TextLabel = {
                        AutomaticSize = "X",
                        TextScaled = false,
                        TextSize = 14,
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(0, 1),
                        TextXAlignment = Enum.TextXAlignment.Right
                    }
                }) })
        }) };
    local v21 = #v20;
    local v22 = u2.entries(ClanShopItemsMeta);
    table.sort(v22, function(p23, p24) -- Line: 198
        return p23[2].unlockedFromTier < p24[2].unlockedFromTier;
    end);

    local function _(p25) -- Line: 202
        -- upvalues: ClanShop (ref)
        local _ = p25[1];

        return p25[2].currency == ClanShop.ClanShopCurrency.CLAN_CONTRIBUTION_COIN;
    end;

    local v26 = 0;
    local v27 = {};

    for i, v in v22 do
        local _ = i - 1;
        local _ = v[1];

        if v[2].currency == ClanShop.ClanShopCurrency.CLAN_CONTRIBUTION_COIN == true then
            v26 = v26 + 1;
            v27[v26] = v;
        end;
    end;

    local function v49(p28) -- Line: 217
        -- upvalues: ClanUpgradeMeta (ref), u8 (copy), u4 (ref), u16 (copy), ShopItemTile (ref), ClanShop (ref), SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), ColorUtil (ref), EventUtil (ref), Theme (ref), KnitClient (ref), UILayers (ref), Empty (ref)
        local u29 = p28[1];
        local u30 = p28[2];
        local v31 = ClanUpgradeMeta[u30.unlockedFromTier];
        local ClanUpgrades = u8.ClanUpgrades;

        if ClanUpgrades ~= nil then
            ClanUpgrades = ClanUpgrades[v31.type];
        end;

        local v32;

        if ClanUpgrades then
            v32 = ClanUpgradeMeta[ClanUpgrades];
        else
            v32 = nil;
        end;

        if v32 ~= nil then
            v32 = v32.level;
        end;

        local u33 = (v32 == nil and 0 or v32) >= v31.level;
        local ClanContributionCoins = u8.ClanContributionCoins;
        local u34 = (ClanContributionCoins == nil and 0 or ClanContributionCoins) >= u30.price;
        local ClanContributionPurchaseHistory = u8.ClanContributionPurchaseHistory;

        if ClanContributionPurchaseHistory ~= nil then
            local function _(p35) -- Line: 246
                -- upvalues: u29 (copy)
                return p35.itemType == u29;
            end;

            local v36 = 0;
            local v37 = {};

            for i, v in ClanContributionPurchaseHistory do
                local _ = i - 1;

                if v.itemType == u29 == true then
                    v36 = v36 + 1;
                    v37[v36] = v;
                end;
            end;

            ClanContributionPurchaseHistory = #v37;
        end;

        local maxPurchasesPerCycle = u30.maxPurchasesPerCycle;
        local u38 = maxPurchasesPerCycle == nil and 1 or maxPurchasesPerCycle;
        local v39 = {};
        local v40 = #v39;
        local v41 = not u33 and u4.createElement(u16, {
            ItemClanUpgrade = v31
        });

        if v41 then
            v39[v40 + 1] = v41;
        end;

        v39[#v39 + 1] = u4.createElement(ShopItemTile, {
            Item = {
                id = u29,
                Name = u30.name,
                Image = u30.image
            },
            Currency = {
                Icon = ClanShop.ClanShopCurrencyMeta[u30.currency].icon,
                Name = ClanShop.ClanShopCurrencyMeta[u30.currency].name,
                Price = u30.price
            },
            CanAfford = u34,
            MaxPurchases = u38,
            TimesPurchased = ClanContributionPurchaseHistory,

            OnClick = function() -- Line: 290, Name: OnClick
                -- upvalues: ClanContributionPurchaseHistory (copy), u38 (copy), u33 (copy), u34 (copy), SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), u30 (copy), ColorUtil (ref), EventUtil (ref), Theme (ref), ClanShop (ref), u29 (copy), KnitClient (ref), UILayers (ref)
                local v42 = ClanContributionPurchaseHistory;

                if u38 <= (v42 == nil and 0 or v42) then
                    return nil;
                end;

                if not u33 then
                    return nil;
                end;

                if not u34 then
                    return nil;
                end;

                SoundManager:playSound(GameSound.UI_OPEN);
                local v43 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
                local CONFIRMATION_MODAL = BedwarsAppIds.CONFIRMATION_MODAL;
                local v44 = {
                    Title = "Purchase " .. u30.name .. "?",
                    Body = "Are you sure you want to purchase the <font transparency=\"0\" color=\"" .. ColorUtil.richTextColor(EventUtil.getItemColorRarity(u30.price)) .. "\"><b>[" .. u30.name .. "]</b></font> for <font color=\"" .. ColorUtil.richTextColor(Theme.mcGold) .. "\"><b>" .. tostring(u30.price) .. " " .. ClanShop.ClanShopCurrencyMeta[u30.currency].name .. "</b></font>?"
                };
                local v45 = {
                    Text = u34 and "Purchase" or "Can\'t Afford"
                };
                local v46;

                if u34 then
                    v46 = Theme.backgroundSuccess;
                else
                    v46 = Theme.backgroundError;
                end;

                v45.BackgroundColor3 = v46;
                v44.PrimaryBtnProps = v45;
                v44.SecondaryBtnProps = {
                    Text = "Cancel"
                };

                function v44.OnPrimaryBtnClick(p47) -- Line: 316
                    -- upvalues: u29 (ref), KnitClient (ref), SoundManager (ref), GameSound (ref)
                    KnitClient.Controllers.ClanShopController:purchaseItem(u29):andThen(function(p48) -- Line: 318
                        -- upvalues: SoundManager (ref), GameSound (ref)
                        if p48.success then
                            SoundManager:playSound(GameSound.BEDWARS_UPGRADE_SUCCESS);

                            return;
                        end;

                        SoundManager:playSound(GameSound.ERROR_NOTIFICATION);
                    end);
                end;

                function v44.OnSecondaryBtnClick() -- Line: 327
                    -- upvalues: Flamework (ref), UILayers (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
                end;

                v43:openApp(CONFIRMATION_MODAL, v44);
            end,

            RarityColor = u30.rarityColor
        });

        return u4.createFragment({
            ShopItemTileWrapper = u4.createElement(Empty, {}, v39)
        });
    end;

    local v50 = 0;
    local v51 = {};

    for i, v in v27 do
        local v52 = v49(v, i - 1, v27);

        if v52 ~= nil then
            v50 = v50 + 1;
            v51[v50] = v52;
        end;
    end;

    local v53 = {
        AutomaticSize = "Y",
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0)
    };
    local v54 = { u4.createElement("UIGridLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Left",
            FillDirectionMaxCells = 4,
            SortOrder = "LayoutOrder",
            CellSize = UDim2.new(0, 136, 0, 162),
            CellPadding = UDim2.fromOffset(8, 8)
        }) };
    local v55 = #v54;

    for i, v in v51 do
        v54[v55 + i] = v;
    end;

    v20[v21 + 1] = u4.createElement(Empty, v53, v54);
    v20[v21 + 2] = u4.createElement("TextLabel", {
        Text = "Crystal Shop",
        TextXAlignment = "Left",
        TextScaled = true,
        BackgroundTransparency = 1,
        LayoutOrder = 3,
        Size = UDim2.new(1, 0, 0, 18),
        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
        TextColor3 = Color3.fromRGB(255, 255, 255)
    });
    local v56 = u2.entries(ClanShopItemsMeta);
    table.sort(v56, function(p57, p58) -- Line: 380
        return p57[2].unlockedFromTier < p58[2].unlockedFromTier;
    end);

    local function _(p59) -- Line: 384
        -- upvalues: ClanShop (ref)
        local _ = p59[1];

        return p59[2].currency == ClanShop.ClanShopCurrency.CLAN_WAR_CRYSTAL;
    end;

    local v60 = 0;
    local v61 = {};

    for i, v in v56 do
        local _ = i - 1;
        local _ = v[1];

        if v[2].currency == ClanShop.ClanShopCurrency.CLAN_WAR_CRYSTAL == true then
            v60 = v60 + 1;
            v61[v60] = v;
        end;
    end;

    local function v100(p62) -- Line: 399
        -- upvalues: ClanUpgradeMeta (ref), u8 (copy), u4 (ref), u16 (copy), ShopItemTile (ref), ClanShop (ref), SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), ColorUtil (ref), EventUtil (ref), Theme (ref), KnitClient (ref), UILayers (ref), Empty (ref), u13 (copy), u11 (copy), u12 (copy), DeviceUtil (ref), BackgroundMusicPriority (ref), getClanHqBackgroundMusicMeta (ref), u10 (copy), BedwarsImageId (ref)
        local u63 = p62[1];
        local u64 = p62[2];
        local v65 = ClanUpgradeMeta[u64.unlockedFromTier];
        local ClanUpgrades = u8.ClanUpgrades;

        if ClanUpgrades ~= nil then
            ClanUpgrades = ClanUpgrades[v65.type];
        end;

        local v66;

        if ClanUpgrades then
            v66 = ClanUpgradeMeta[ClanUpgrades];
        else
            v66 = nil;
        end;

        if v66 ~= nil then
            v66 = v66.level;
        end;

        local u67 = (v66 == nil and 0 or v66) >= v65.level;
        local Crystals = u8.Crystals;
        local u68 = (Crystals == nil and 0 or Crystals) >= u64.price;

        local function _(p69) -- Line: 427
            return p69.clanHqSkybox ~= nil;
        end;

        local v70 = nil;

        for i, v in u64.items do
            local _ = i - 1;

            if v.clanHqSkybox ~= nil == true then
                v70 = v;
                break;
            end;
        end;

        local function _(p71) -- Line: 441
            return p71.clanHqBackgroundMusic ~= nil;
        end;

        local u72 = nil;

        for i, v in u64.items do
            local _ = i - 1;

            if v.clanHqBackgroundMusic ~= nil == true then
                u72 = v;
                break;
            end;
        end;

        local u73 = 0;
        local v74;

        if v70 == nil then
            v74 = v70;
        else
            v74 = v70.clanHqSkybox;
        end;

        if v74 then
            local OwnedClanHqSkyboxes = u8.OwnedClanHqSkyboxes;

            if OwnedClanHqSkyboxes ~= nil then
                OwnedClanHqSkyboxes = table.find(OwnedClanHqSkyboxes, v70.clanHqSkybox) ~= nil;
            end;

            u73 = OwnedClanHqSkyboxes and 1 or u73;
        else
            local v75;

            if u72 == nil then
                v75 = u72;
            else
                v75 = u72.clanHqBackgroundMusic;
            end;

            if v75 then
                local OwnedClanHqMusic = u8.OwnedClanHqMusic;

                if OwnedClanHqMusic ~= nil then
                    OwnedClanHqMusic = table.find(OwnedClanHqMusic, u72.clanHqBackgroundMusic) ~= nil;
                end;

                u73 = OwnedClanHqMusic and 1 or u73;
            end;
        end;

        local maxPurchasesPerCycle = u64.maxPurchasesPerCycle;
        local u76 = maxPurchasesPerCycle == nil and 1 or maxPurchasesPerCycle;
        local v77 = {};
        local v78 = #v77;
        local v79 = not u67 and u4.createElement(u16, {
            ItemClanUpgrade = v65
        });

        if v79 then
            v77[v78 + 1] = v79;
        end;

        local v80 = #v77;
        v77[v80 + 1] = u4.createElement(ShopItemTile, {
            Item = {
                id = u63,
                Name = u64.name,
                Image = u64.image
            },
            Currency = {
                Icon = ClanShop.ClanShopCurrencyMeta[u64.currency].icon,
                Name = ClanShop.ClanShopCurrencyMeta[u64.currency].name,
                Price = u64.price
            },
            CanAfford = u68,
            MaxPurchases = u76,
            TimesPurchased = u73,

            OnClick = function() -- Line: 512, Name: OnClick
                -- upvalues: u73 (ref), u76 (copy), u67 (copy), u68 (copy), SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), u64 (copy), ColorUtil (ref), EventUtil (ref), Theme (ref), ClanShop (ref), u63 (copy), KnitClient (ref), UILayers (ref)
                local v81 = u73;

                if u76 <= (v81 == nil and 0 or v81) then
                    return nil;
                end;

                if not u67 then
                    return nil;
                end;

                if not u68 then
                    return nil;
                end;

                SoundManager:playSound(GameSound.UI_OPEN);
                local v82 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
                local CONFIRMATION_MODAL = BedwarsAppIds.CONFIRMATION_MODAL;
                local v83 = {
                    Title = "Purchase " .. u64.name .. "?",
                    Body = "Are you sure you want to purchase the <font transparency=\"0\" color=\"" .. ColorUtil.richTextColor(EventUtil.getItemColorRarity(u64.price)) .. "\"><b>[" .. u64.name .. "]</b></font> for <font color=\"" .. ColorUtil.richTextColor(Theme.mcGold) .. "\"><b>" .. tostring(u64.price) .. " " .. ClanShop.ClanShopCurrencyMeta[u64.currency].name .. "</b></font>?"
                };
                local v84 = {
                    Text = u68 and "Purchase" or "Can\'t Afford"
                };
                local v85;

                if u68 then
                    v85 = Theme.backgroundSuccess;
                else
                    v85 = Theme.backgroundError;
                end;

                v84.BackgroundColor3 = v85;
                v83.PrimaryBtnProps = v84;
                v83.SecondaryBtnProps = {
                    Text = "Cancel"
                };

                function v83.OnPrimaryBtnClick(p86) -- Line: 538
                    -- upvalues: u63 (ref), KnitClient (ref), SoundManager (ref), GameSound (ref)
                    KnitClient.Controllers.ClanShopController:purchaseItem(u63):andThen(function(p87) -- Line: 540
                        -- upvalues: SoundManager (ref), GameSound (ref)
                        if p87.success then
                            SoundManager:playSound(GameSound.BEDWARS_UPGRADE_SUCCESS);

                            return;
                        end;

                        SoundManager:playSound(GameSound.ERROR_NOTIFICATION);
                    end);
                end;

                function v83.OnSecondaryBtnClick() -- Line: 549
                    -- upvalues: Flamework (ref), UILayers (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
                end;

                v82:openApp(CONFIRMATION_MODAL, v83);
            end,

            RarityColor = u64.rarityColor
        });

        if u72 then
            local createElement = u4.createElement;
            local v88 = {
                Size = UDim2.fromScale(0.65, 0.5),
                Position = UDim2.fromScale(0.5, 0.325),
                AnchorPoint = Vector2.new(0.5, 0.5)
            };
            local v89 = {};
            local createElement2 = u4.createElement;
            local v91 = {
                Size = UDim2.fromScale(1, 0.2),
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.fromScale(0.5, 1),
                BackgroundColor3 = Theme.backgroundSecondary,
                BackgroundTransparency = 0,
                BorderSizePixel = 0,
                ImageTransparency = 1,
                ScaleType = Enum.ScaleType.Fit,

                [u4.Event.MouseButton1Click] = function() -- Line: 570
                    -- upvalues: u13 (ref), u11 (ref), u12 (ref), DeviceUtil (ref), KnitClient (ref), BackgroundMusicPriority (ref), u72 (copy), getClanHqBackgroundMusicMeta (ref)
                    if u13 then
                        u11(nil);
                        u12:DoCleaning();

                        return;
                    end;

                    local u90;

                    if DeviceUtil.isHoarceKat() then
                        u90 = nil;
                    else
                        u90 = KnitClient.Controllers.BackgroundMusicController:getActiveTrack();
                    end;

                    if u90 ~= nil then
                        u90 = u90.SoundId;
                    end;

                    u12:GiveTask(function() -- Line: 581
                        -- upvalues: u90 (copy), DeviceUtil (ref), KnitClient (ref), BackgroundMusicPriority (ref)
                        if u90 == "" or not u90 then
                            return nil;
                        end;

                        if not DeviceUtil.isHoarceKat() then
                            KnitClient.Controllers.BackgroundMusicController:startMusic(u90, BackgroundMusicPriority.MENU);
                        end;
                    end);

                    if u72.clanHqBackgroundMusic then
                        u11(u72.clanHqBackgroundMusic);

                        if not DeviceUtil.isHoarceKat() then
                            KnitClient.Controllers.BackgroundMusicController:startMusic(getClanHqBackgroundMusicMeta(u72.clanHqBackgroundMusic).soundId, BackgroundMusicPriority.MENU);
                        end;
                    end;
                end
            };
            local v92 = {};
            local v93 = u4.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            });
            local v94 = u4.createElement("UIPadding", {
                PaddingRight = UDim.new(0.05, 0),
                PaddingLeft = UDim.new(0.05, 0)
            });
            local v95 = u4.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            });
            local v96 = u4.createElement("UIPadding", {
                PaddingRight = UDim.new(0.05, 0),
                PaddingLeft = UDim.new(0.05, 0)
            });
            local v97 = u4.createElement("TextLabel", {
                Text = "PREVIEW",
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 3,
                Size = UDim2.fromScale(0.5, 1),
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.fromScale(0.75, 0.5),
                TextXAlignment = Enum.TextXAlignment.Right,
                TextYAlignment = Enum.TextYAlignment.Center,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            });
            local createElement3 = u4.createElement;
            local v98 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.15, 1),
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.fromScale(1, 0.5)
            };
            local v99;

            if u13 and u72.clanHqBackgroundMusic == u10 then
                v99 = BedwarsImageId.PAUSE_SOLID;
            else
                v99 = BedwarsImageId.TRIANGLE_ARROW_RIGHT;
            end;

            v98.Image = v99;
            v92[1], v92[2], v92[3], v92[4], v92[5], v92[6] = v93, v94, v95, v96, v97, createElement3("ImageLabel", v98, { u4.createElement("UIAspectRatioConstraint", {
        AspectRatio = 1
    }) });
            v89[1] = createElement2("ImageButton", v91, v92);
            u72 = createElement(Empty, v88, v89);
        end;

        if u72 then
            v77[v80 + 2] = u72;
        end;

        return u4.createFragment({
            ShopItemTileWrapper = u4.createElement(Empty, {}, v77)
        });
    end;

    local v101 = 0;
    local v102 = {};

    for i, v in v61 do
        local v103 = v100(v, i - 1, v61);

        if v103 ~= nil then
            v101 = v101 + 1;
            v102[v101] = v103;
        end;
    end;

    local v104 = {
        AutomaticSize = "Y",
        LayoutOrder = 4,
        Size = UDim2.fromScale(1, 0)
    };
    local v105 = { u4.createElement("UIGridLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Left",
            FillDirectionMaxCells = 4,
            SortOrder = "LayoutOrder",
            CellSize = UDim2.new(0, 136, 0, 162),
            CellPadding = UDim2.fromOffset(8, 8)
        }) };
    local v106 = #v105;

    for i, v in v102 do
        v105[v106 + i] = v;
    end;

    v20[v21 + 3] = u4.createElement(Empty, v104, v105);
    v20[v21 + 4] = u4.createElement("TextLabel", {
        Text = "Clan Coin Shop",
        TextXAlignment = "Left",
        TextScaled = true,
        BackgroundTransparency = 1,
        LayoutOrder = 5,
        Size = UDim2.new(1, 0, 0, 18),
        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
        TextColor3 = Color3.fromRGB(255, 255, 255)
    });
    local v107 = u2.entries(ClanShopItemsMeta);
    table.sort(v107, function(p108, p109) -- Line: 688
        return p108[2].unlockedFromTier < p109[2].unlockedFromTier;
    end);

    local function v117(p110) -- Line: 692
        -- upvalues: ClanShop (ref), u8 (copy)
        local _ = p110[1];
        local v111 = p110[2];
        local v112 = v111.currency == ClanShop.ClanShopCurrency.CLAN_COIN;

        if v112 then
            local function _(p113) -- Line: 698
                -- upvalues: u8 (ref)
                local v114 = p113.clanBorder ~= nil and table.find(u8.OwnedClanBorders, p113.clanBorder) ~= nil;

                return v114;
            end;

            local v115 = false;

            for i, v in v111.items do
                local _ = i - 1;
                local v116 = v.clanBorder ~= nil and table.find(u8.OwnedClanBorders, v.clanBorder) ~= nil;

                if v116 then
                    v115 = true;
                    break;
                end;
            end;

            v112 = not v115;
        end;

        return v112;
    end;

    local v118 = 0;
    local v119 = {};

    for i, v in v107 do
        if v117(v, i - 1, v107) == true then
            v118 = v118 + 1;
            v119[v118] = v;
        end;
    end;

    local function v136(p120) -- Line: 730
        -- upvalues: ClanUpgradeMeta (ref), u8 (copy), u4 (ref), u16 (copy), ShopItemTile (ref), ClanShop (ref), SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), ColorUtil (ref), EventUtil (ref), Theme (ref), KnitClient (ref), UILayers (ref), Empty (ref)
        local u121 = p120[1];
        local u122 = p120[2];
        local v123 = ClanUpgradeMeta[u122.unlockedFromTier];
        local ClanUpgrades = u8.ClanUpgrades;

        if ClanUpgrades ~= nil then
            ClanUpgrades = ClanUpgrades[v123.type];
        end;

        local v124;

        if ClanUpgrades then
            v124 = ClanUpgradeMeta[ClanUpgrades];
        else
            v124 = nil;
        end;

        if v124 ~= nil then
            v124 = v124.level;
        end;

        local u125 = (v124 == nil and 0 or v124) >= v123.level;
        local ClanCoins = u8.ClanCoins;
        local u126 = (ClanCoins == nil and 0 or ClanCoins) >= u122.price;
        local v127 = {};
        local v128 = #v127;
        local v129 = not u125 and u4.createElement(u16, {
            ItemClanUpgrade = v123
        });

        if v129 then
            v127[v128 + 1] = v129;
        end;

        v127[#v127 + 1] = u4.createElement(ShopItemTile, {
            MaxPurchases = 1,
            Item = {
                id = u121,
                Name = u122.name,
                Image = u122.image
            },
            Currency = {
                Icon = ClanShop.ClanShopCurrencyMeta[u122.currency].icon,
                Name = ClanShop.ClanShopCurrencyMeta[u122.currency].name,
                Price = u122.price
            },
            CanAfford = u126,

            OnClick = function() -- Line: 779, Name: OnClick
                -- upvalues: u125 (copy), u126 (copy), SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), u122 (copy), ColorUtil (ref), EventUtil (ref), Theme (ref), ClanShop (ref), u121 (copy), KnitClient (ref), UILayers (ref)
                if not u125 then
                    return nil;
                end;

                if not u126 then
                    return nil;
                end;

                SoundManager:playSound(GameSound.UI_OPEN);
                local v130 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
                local CONFIRMATION_MODAL = BedwarsAppIds.CONFIRMATION_MODAL;
                local v131 = {
                    Title = "Purchase " .. u122.name .. "?",
                    Body = "Are you sure you want to purchase the <font transparency=\"0\" color=\"" .. ColorUtil.richTextColor(EventUtil.getItemColorRarity(u122.price)) .. "\"><b>[" .. u122.name .. "]</b></font> for <font color=\"" .. ColorUtil.richTextColor(Theme.mcGold) .. "\"><b>" .. tostring(u122.price) .. " " .. ClanShop.ClanShopCurrencyMeta[u122.currency].name .. "</b></font>?"
                };
                local v132 = {
                    Text = u126 and "Purchase" or "Can\'t Afford"
                };
                local v133;

                if u126 then
                    v133 = Theme.backgroundSuccess;
                else
                    v133 = Theme.backgroundError;
                end;

                v132.BackgroundColor3 = v133;
                v131.PrimaryBtnProps = v132;
                v131.SecondaryBtnProps = {
                    Text = "Cancel"
                };

                function v131.OnPrimaryBtnClick(p134) -- Line: 797
                    -- upvalues: u121 (ref), KnitClient (ref), SoundManager (ref), GameSound (ref)
                    KnitClient.Controllers.ClanShopController:purchaseItem(u121):andThen(function(p135) -- Line: 799
                        -- upvalues: SoundManager (ref), GameSound (ref)
                        if p135.success then
                            SoundManager:playSound(GameSound.BEDWARS_UPGRADE_SUCCESS);

                            return;
                        end;

                        SoundManager:playSound(GameSound.ERROR_NOTIFICATION);
                    end);
                end;

                function v131.OnSecondaryBtnClick() -- Line: 808
                    -- upvalues: Flamework (ref), UILayers (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
                end;

                v130:openApp(CONFIRMATION_MODAL, v131);
            end,

            RarityColor = u122.rarityColor
        });

        return u4.createFragment({
            ShopItemTileWrapper = u4.createElement(Empty, {}, v127)
        });
    end;

    local v137 = 0;
    local v138 = {};

    for i, v in v119 do
        local v139 = v136(v, i - 1, v119);

        if v139 ~= nil then
            v137 = v137 + 1;
            v138[v137] = v139;
        end;
    end;

    local v140 = {
        AutomaticSize = "Y",
        LayoutOrder = 6,
        Size = UDim2.fromScale(1, 0)
    };
    local v141 = { u4.createElement("UIGridLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Left",
            FillDirectionMaxCells = 4,
            SortOrder = "LayoutOrder",
            CellSize = UDim2.new(0, 136, 0, 162),
            CellPadding = UDim2.fromOffset(8, 8)
        }) };
    local v142 = #v141;

    for i, v in v138 do
        v141[v142 + i] = v;
    end;

    v20[v21 + 5] = u4.createElement(Empty, v140, v141);
    v18.ShopList = u4.createElement(AutoCanvasScrollingFrame, v19, v20);

    return u4.createFragment({
        ClanProfileShop = u4.createElement(Empty, v17, v18)
    });
end);

return {
    ClanProfileShop = v6.connect(function(p144, p145) -- Line: 856
        local v146 = {};

        for i, v in p145 do
            v146[i] = v;
        end;

        local clanContributionShop = p144.Clans.clanContributionShop;

        if clanContributionShop ~= nil then
            clanContributionShop = clanContributionShop.clanContributionCoins;
        end;

        v146.ClanContributionCoins = clanContributionShop;
        local clanContributionShop2 = p144.Clans.clanContributionShop;

        if clanContributionShop2 ~= nil then
            clanContributionShop2 = clanContributionShop2.weekPurchaseHistory;
        end;

        v146.ClanContributionPurchaseHistory = clanContributionShop2;
        local myClan = p144.Clans.myClan;

        if myClan ~= nil then
            myClan = myClan.clanWarCoins;
        end;

        v146.Crystals = myClan;
        local myClan2 = p144.Clans.myClan;

        if myClan2 ~= nil then
            myClan2 = myClan2.clanHq;

            if myClan2 ~= nil then
                myClan2 = myClan2.allSkyboxes;
            end;
        end;

        v146.OwnedClanHqSkyboxes = myClan2;
        local myClan3 = p144.Clans.myClan;

        if myClan3 ~= nil then
            myClan3 = myClan3.clanHq;

            if myClan3 ~= nil then
                myClan3 = myClan3.allLobbyMusic;
            end;
        end;

        v146.OwnedClanHqMusic = myClan3;
        local myClan4 = p144.Clans.myClan;

        if myClan4 ~= nil then
            myClan4 = myClan4.borders;
        end;

        v146.OwnedClanBorders = myClan4 == nil and {} or myClan4;
        local myClan5 = p144.Clans.myClan;

        if myClan5 ~= nil then
            myClan5 = myClan5.coins;
        end;

        v146.ClanCoins = myClan5;
        local myClan6 = p144.Clans.myClan;

        if myClan6 ~= nil then
            myClan6 = myClan6.upgrades;
        end;

        v146.ClanUpgrades = myClan6;

        return v146;
    end)(v143)
};