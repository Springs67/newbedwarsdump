-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local IconButton = v1.IconButton;
local Padding = v1.Padding;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-type");
local ClanUpgradeTier = v6.ClanUpgradeTier;
local ClanUpgradeType = v6.ClanUpgradeType;
local getConsumableMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta;
local ConsumableCategory = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableCategory;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local CrateConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-constants").CrateConstants;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-meta");
local AltarUpgradeTier = v7.AltarUpgradeTier;
local CrateMeta = v7.CrateMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local CratePickerCrateList = RuntimeLib.import(script, script.Parent, "crate-picker-crate-list").CratePickerCrateList;
local CratePickerRarityProbabilities = RuntimeLib.import(script, script.Parent, "crate-picker-rarity-probabilities").CratePickerRarityProbabilities;
local CratePickerRewardTile = RuntimeLib.import(script, script.Parent, "crate-picker-reward-tile").CratePickerRewardTile;
local u8 = Color3.fromHex("16ADED");
local v64 = v4.new(u3)(function(u9, p10) -- Line: 40
    -- upvalues: AltarUpgradeTier (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), ClientStore (copy), ClanUpgradeType (copy), ClanUpgradeTier (copy), Flamework (copy), CrateConstants (copy), BedwarsAppIds (copy), Theme (copy), UILayers (copy), DeviceUtil (copy), u3 (copy), DarkBackground (copy), ScaleComponent (copy), Padding (copy), AutoSizedText (copy), ColorUtil (copy), IconButton (copy), BedwarsImageId (copy), CrateMeta (copy), CratePickerRarityProbabilities (copy), CratePickerRewardTile (copy), ButtonComponent (copy), u8 (copy), Empty (copy), u2 (copy), CratePickerCrateList (copy), SlideIn (copy)
    local useState = p10.useState;
    local useEffect = p10.useEffect;
    local u11, v12 = useState(nil);
    local v13, u14 = useState(AltarUpgradeTier.TIER_0);
    local v15 = UDim2.fromOffset(1050, 540);
    useEffect(function() -- Line: 47
        -- upvalues: SoundManager (ref), GameSound (ref), KnitClient (ref), ClientStore (ref), ClanUpgradeType (ref), ClanUpgradeTier (ref), u14 (copy), AltarUpgradeTier (ref)
        SoundManager:playSound(GameSound.UI_OPEN_2);
        KnitClient.Controllers.ClanController:getMyClanProfileData():andThen(function() -- Line: 50
            -- upvalues: ClientStore (ref), ClanUpgradeType (ref), KnitClient (ref), ClanUpgradeTier (ref), u14 (ref), AltarUpgradeTier (ref)
            local myClan = ClientStore:getState().Clans.myClan;

            if myClan ~= nil then
                myClan = myClan.upgrades[ClanUpgradeType.CRATE_ALTAR];
            end;

            if not KnitClient.Controllers.ClanHqLobby:isClanHq() then
                return nil;
            end;

            if myClan == ClanUpgradeTier.CRATE_ALTAR_1 then
                u14(AltarUpgradeTier.TIER_1);

                return;
            end;

            if myClan == ClanUpgradeTier.CRATE_ALTAR_2 then
                u14(AltarUpgradeTier.TIER_2);

                return;
            end;

            if myClan ~= ClanUpgradeTier.CRATE_ALTAR_3 then
                return;
            end;

            u14(AltarUpgradeTier.TIER_3);
        end);

        if ClientStore:getState().Clans.myClan then
            KnitClient.Controllers.ClanShopController:requestClanShopData();
        end;
    end, {});

    local function v16() -- Line: 82
        -- upvalues: Flamework (ref), SoundManager (ref), GameSound (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("CratePicker");
        SoundManager:playSound(GameSound.UI_CLOSE_2);
    end;

    local function u19(p17) -- Line: 86
        -- upvalues: ClientStore (ref), CrateConstants (ref), Flamework (ref), u11 (copy), KnitClient (ref), u9 (copy), SoundManager (ref), GameSound (ref)
        if p17 == nil then
            p17 = false;
        end;

        local v18;

        if p17 then
            local clanContributionShop = ClientStore:getState().Clans.clanContributionShop;

            if clanContributionShop ~= nil then
                clanContributionShop = clanContributionShop.clanContributionCoins;
            end;

            v18 = (clanContributionShop == nil and 0 or clanContributionShop) < CrateConstants.CRATE_UPGRADE_USAGE_COST;
        else
            v18 = p17;
        end;

        if v18 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                message = "Not enough clan contribution points available"
            });

            return nil;
        end;

        if u11 then
            KnitClient.Controllers.CrateAltarController:pickCrate(u11, u9.CrateAltarId, p17);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("CratePicker");
            SoundManager:playSound(GameSound.UI_CLOSE_2);
        end;
    end;

    local function v25() -- Line: 113
        -- upvalues: ClientStore (ref), CrateConstants (ref), SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), Theme (ref), u19 (copy), UILayers (ref)
        local clanContributionShop = ClientStore:getState().Clans.clanContributionShop;

        if clanContributionShop ~= nil then
            clanContributionShop = clanContributionShop.clanContributionCoins;
        end;

        local v20 = (clanContributionShop == nil and 0 or clanContributionShop) > CrateConstants.CRATE_UPGRADE_USAGE_COST;
        SoundManager:playSound(GameSound.UI_OPEN);
        local v21 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
        local CONFIRMATION_MODAL = BedwarsAppIds.CONFIRMATION_MODAL;
        local v22 = {
            Title = "Purchase crate upgrade?",
            Body = "Are you sure you want to purchase the crate upgrade for <b>" .. tostring(CrateConstants.CRATE_UPGRADE_USAGE_COST) .. "</b> clan contribution points?"
        };
        local v23 = {
            Text = v20 and "Purchase" or "Can\'t Afford"
        };
        local v24;

        if v20 then
            v24 = Theme.backgroundSuccess;
        else
            v24 = Theme.backgroundError;
        end;

        v23.BackgroundColor3 = v24;
        v22.PrimaryBtnProps = v23;
        v22.SecondaryBtnProps = {
            Text = "Cancel"
        };

        function v22.OnPrimaryBtnClick() -- Line: 134
            -- upvalues: u19 (ref)
            u19(true);
        end;

        function v22.OnSecondaryBtnClick() -- Line: 137
            -- upvalues: Flamework (ref), UILayers (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
        end;

        v21:openApp(CONFIRMATION_MODAL, v22);
    end;

    local v26 = {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v27 = { u3.createElement(DarkBackground, {
            AppId = "CratePicker",
            ImageButtonProps = {
                ZIndex = 0
            },

            OnClick = function() -- Line: 153, Name: OnClick
                -- upvalues: SoundManager (ref), GameSound (ref)
                SoundManager:playSound(GameSound.UI_CLOSE_2);

                return true;
            end
        }) };
    local v28 = {};
    local _ = #v28;
    local v29 = {
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Modal = true,
        Size = v15,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Color3.fromHex("#333333")
    };
    local v30 = {
        u3.createElement(ScaleComponent, {
            PowerRelationshipPastMaximum = 0.6,
            MaximumSize = Vector2.new(v15.X.Offset * 1.2, v15.Y.Offset * 1.2),
            ScreenPadding = Vector2.new(30, 30)
        }),
        u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 10)
        }),
        u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            VerticalAlignment = "Top",
            HorizontalAlignment = "Left",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 0)
        }),
        Header = u3.createElement("Frame", {
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, 0, 44),
            BackgroundColor3 = Color3.fromRGB(29, 29, 29)
        }, { u3.createElement(Padding, {
                Padding = {
                    Horizontal = 24,
                    Vertical = 8
                }
            }), u3.createElement(AutoSizedText, {
                Text = "CHOOSE CRATE ",
                TextSize = 28,
                TextColor3 = ColorUtil.WHITE,
                Position = UDim2.fromScale(0, 0.5),
                AnchorPoint = Vector2.new(0, 0.5),
                TextXAlignment = Enum.TextXAlignment.Left,
                Font = Enum.Font.SourceSansBold
            }), u3.createElement(IconButton, {
                Size = UDim2.new(0, 28, 0, 28),
                Image = BedwarsImageId.X,
                Position = UDim2.fromScale(1, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),
                OnClick = v16
            }) })
    };
    local _ = #v30;
    local v31 = {
        LayoutOrder = 2,
        Size = UDim2.new(1, 0, 1, -44)
    };
    local v32 = { u3.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            VerticalAlignment = "Center",
            HorizontalAlignment = "Left",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 0)
        }) };
    local _ = #v32;
    local v33 = {
        LayoutOrder = 1,
        Size = UDim2.new(0.3, 0, 1, 0)
    };
    local v34 = { u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 0)
        }) };
    local _ = #v34;
    local v35 = {
        BorderSizePixel = 0,
        LayoutOrder = 1,
        Size = UDim2.new(1, 0, 0.25, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    };
    local v36 = { u3.createElement("UIGradient", {
            Rotation = 70,
            Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 217, 17)), ColorSequenceKeypoint.new(1, Color3.fromRGB(199, 96, 0)) })
        }) };
    local v37 = #v36;
    local v38;

    if u11 then
        v38 = u3.createElement("ImageLabel", {
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0.9),
            Image = CrateMeta[u11].image,
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        });
    else
        v38 = u11;
    end;

    if v38 then
        v36[v37 + 1] = v38;
    end;

    v34.ShowcaseContainer = u3.createElement("Frame", v35, v36);
    local v39 = {
        BorderSizePixel = 0,
        LayoutOrder = 2,
        Size = UDim2.new(1, 0, 0.75, 0),
        BackgroundColor3 = Color3.fromRGB(39, 39, 39)
    };
    local v40 = {
        u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 8)
        }),
        u3.createElement(Padding, {
            Padding = {
                Horizontal = 12,
                Vertical = 8
            }
        }),
        Title = u3.createElement("TextLabel", {
            Font = "Roboto",
            TextXAlignment = "Left",
            RichText = true,
            TextScaled = true,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.07),
            Text = "<b>" .. (not u11 and "SELECT A CRATE" or string.upper(CrateMeta[u11].displayName)) .. "</b>",
            TextColor3 = ColorUtil.WHITE
        }),
        Subtitle = u3.createElement("TextLabel", {
            Text = "<b>PROBABILITIES</b>",
            Font = "Roboto",
            TextXAlignment = "Left",
            RichText = true,
            TextScaled = true,
            TextTransparency = 0.3,
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.04),
            TextColor3 = ColorUtil.WHITE
        })
    };
    local v41 = #v40;
    local v42;

    if u11 then
        v42 = u3.createElement(CratePickerRarityProbabilities, {
            selectedCrate = u11
        });
    else
        v42 = u11;
    end;

    if v42 then
        v40[v41 + 1] = v42;
    end;

    local v43 = #v40;
    v40.Subtitle2 = u3.createElement("TextLabel", {
        Text = "<b>REWARDS</b>",
        Font = "Roboto",
        TextXAlignment = "Left",
        RichText = true,
        TextScaled = true,
        TextTransparency = 0.3,
        BackgroundTransparency = 1,
        LayoutOrder = 4,
        Size = UDim2.fromScale(1, 0.04),
        TextColor3 = ColorUtil.WHITE
    });
    local v44;

    if u11 then
        local items = CrateMeta[u11].items;
        table.sort(items, function(p45, p46) -- Line: 334
            return string.lower(p45.itemType) < string.lower(p46.itemType);
        end);
        table.sort(items, function(p47, p48) -- Line: 338
            return p47.rarity < p48.rarity;
        end);

        local function _(p49) -- Line: 342
            -- upvalues: u3 (ref), CratePickerRewardTile (ref)
            return u3.createElement(CratePickerRewardTile, {
                CrateEntry = p49
            });
        end;

        local v50 = table.create(#items);

        for i, v in items do
            local _ = i - 1;
            v50[i] = u3.createElement(CratePickerRewardTile, {
                CrateEntry = v
            });
        end;

        local v51 = {
            BackgroundTransparency = 1,
            ScrollBarThickness = 4,
            LayoutOrder = 5,
            Size = UDim2.fromScale(1, 0.4),
            ScrollingDirection = Enum.ScrollingDirection.Y,
            CanvasSize = UDim2.new(1, 0, 0, math.ceil(#CrateMeta[u11].items / 4) * 72)
        };
        local v52 = { u3.createElement("UIGridLayout", {
                FillDirectionMaxCells = 4,
                FillDirection = "Horizontal",
                VerticalAlignment = "Top",
                HorizontalAlignment = "Left",
                CellSize = UDim2.fromOffset(67, 67),
                CellPadding = UDim2.fromOffset(5, 5)
            }) };
        local v53 = #v52;

        for i, v in v50 do
            v52[v53 + i] = v;
        end;

        v44 = u3.createFragment({
            CrateRewardsList = u3.createElement("ScrollingFrame", v51, v52)
        });
    else
        v44 = u11;
    end;

    if v44 then
        v40[v43 + 1] = v44;
    end;

    local v54 = #v40;
    local v55;

    if u11 then
        local v56 = {
            LayoutOrder = 5,
            Size = UDim2.fromScale(1, 0.12)
        };
        local v57 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0),
                HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
            }), u3.createElement(ButtonComponent, {
                Text = "OPEN",
                LayoutOrder = 0,
                Size = UDim2.fromScale(v13 == AltarUpgradeTier.TIER_0 and 1 or 0.45, 0.95),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Theme.backgroundSuccess,

                OnClick = function() -- Line: 401, Name: OnClick
                    -- upvalues: u19 (copy)
                    return u19();
                end
            }) };
        local v58 = #v57;
        local v59;

        if v13 == AltarUpgradeTier.TIER_0 then
            v59 = false;
        else
            v59 = u3.createElement(ButtonComponent, {
                Text = "UPGRADED OPEN",
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.45, 0.95),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = u8,
                OnClick = v25
            });
        end;

        if v59 then
            v57[v58 + 1] = v59;
        end;

        v55 = u3.createFragment({
            ActionButtons = u3.createElement(Empty, v56, v57)
        });
    else
        v55 = u11;
    end;

    if v55 then
        v40[v54 + 1] = v55;
    end;

    v34.ItemDetailsContainer = u3.createElement("Frame", v39, v40);
    v32.SidePanel = u3.createElement(Empty, v33, v34);
    local createElement = u3.createElement;
    local v60 = {
        LayoutOrder = 1,
        Size = UDim2.new(0.7, 0, 1, 0)
    };
    local v61 = {};
    local v62 = u3.createElement(Padding, {
        Padding = {
            Horizontal = 28,
            Vertical = 28
        }
    });
    local v63;

    if #u2.entries(u9.crates) == 0 then
        v63 = u3.createFragment({
            DefaultMessage = u3.createElement("TextLabel", {
                Text = "<b>YOU DON\'T OWN ANY CRATES</b>",
                Font = "Roboto",
                TextXAlignment = "Center",
                RichText = true,
                TextScaled = true,
                TextTransparency = 0.3,
                BackgroundTransparency = 1,
                LayoutOrder = 4,
                Size = UDim2.fromScale(0.6, 0.15),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                TextColor3 = ColorUtil.WHITE
            })
        });
    else
        v63 = u3.createElement(CratePickerCrateList, {
            crates = u9.crates,
            selectedCrate = u11,
            setSelectedCrate = v12
        });
    end;

    v61[1], v61[2] = v62, v63;
    v32.List = createElement(Empty, v60, v61);
    v30.Content = u3.createElement(Empty, v31, v32);
    v28.Container = u3.createElement("ImageButton", v29, v30);
    v27[#v27 + 1] = u3.createElement(SlideIn, {}, v28);

    return u3.createElement("ScreenGui", v26, v27);
end);

return {
    CratePickerApp = v5.connect(function(p65, p66) -- Line: 465
        -- upvalues: u2 (copy), getConsumableMeta (copy), ConsumableCategory (copy)
        local v67 = u2.entries(p65.Consumable.inventory);

        local function v71(p68, p69) -- Line: 467
            -- upvalues: getConsumableMeta (ref), ConsumableCategory (ref)
            local _ = p69[1];
            local v70 = p69[2];

            if getConsumableMeta(v70.consumable).category ~= ConsumableCategory.REWARD_CRATE then
                return p68;
            end;

            if p68[v70.consumable] then
                table.insert(p68[v70.consumable], v70);

                return p68;
            end;

            p68[v70.consumable] = { v70 };

            return p68;
        end;

        local v72 = {};

        for i = 1, #v67 do
            v72 = v71(v72, v67[i], i - 1, v67);
        end;

        local v73 = {};

        for i, v in p66 do
            v73[i] = v;
        end;

        v73.crates = v72;

        return v73;
    end)(v64)
};