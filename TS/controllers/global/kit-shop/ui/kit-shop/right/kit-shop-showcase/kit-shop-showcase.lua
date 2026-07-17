-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local Button = v1.Button;
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ImageId = v1.ImageId;
local TooltipContainer = v1.TooltipContainer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta");
local BedwarsKitSkinMeta = v4.BedwarsKitSkinMeta;
local getSkinsForKit = v4.getSkinsForKit;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local GiftMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-meta").GiftMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local getKitSkinPriceRobuxAsync = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getKitSkinPriceRobuxAsync;
local KitViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "misc", "kit-viewport").KitViewport;
local PlayerViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "misc", "player-viewport").PlayerViewport;

return {
    KitShopShowcase = v3.new(u2)(function(u5, p6) -- Line: 29
        -- upvalues: getKitSkinPriceRobuxAsync (copy), getBedwarsKitMeta (copy), DeviceUtil (copy), KnitClient (copy), BedwarsKitSkin (copy), BedwarsKitSkinMeta (copy), Flamework (copy), BedwarsAppIds (copy), u2 (copy), KitViewport (copy), ClientStore (copy), default (copy), Button (copy), ColorUtil (copy), ImageId (copy), TooltipContainer (copy), AutoSizedText (copy), GiftMeta (copy), BedwarsImageId (copy), ButtonComponent (copy), getSkinsForKit (copy), Empty (copy), PlayerViewport (copy)
        local useEffect = p6.useEffect;
        local u7, u8 = p6.useState(0);
        useEffect(function() -- Line: 33
            -- upvalues: u5 (copy), getKitSkinPriceRobuxAsync (ref), u8 (copy)
            if not u5.SelectedSkin then
                return nil;
            end;

            getKitSkinPriceRobuxAsync(u5.SelectedSkin):andThen(function(p9) -- Line: 38
                -- upvalues: u8 (ref)
                if p9 ~= 0 and (p9 == p9 and p9) then
                    u8(p9);
                end;
            end):catch(function() -- Line: 43
            end);
        end, { u5.SelectedSkin });
        local u10;

        if u5.SelectedKit then
            u10 = u5.store;

            if u10 ~= nil then
                u10 = u10.Bedwars.favoriteKits[u5.SelectedKit] ~= nil;
            end;

            if u10 == nil then
                u10 = false;
            end;
        else
            u10 = false;
        end;

        local v11;

        if u5.SelectedKit then
            local store = u5.store;

            if store ~= nil then
                store = table.find(store.Bedwars.ownedKits, u5.SelectedKit) ~= nil;
            end;

            v11 = store or getBedwarsKitMeta(u5.SelectedKit).freeKit;
        else
            v11 = false;
        end;

        local v12;

        if DeviceUtil.isHoarceKat() then
            v12 = false;
        else
            v12 = KnitClient.Controllers.UnlockController.allKitsUnlocked;
        end;

        local u13 = v11 or v12;
        local DEFAULT = BedwarsKitSkin.DEFAULT;
        local SelectedKit = u5.SelectedKit;

        if SelectedKit then
            SelectedKit = u5.store;

            if SelectedKit ~= nil then
                SelectedKit = SelectedKit.Bedwars.equippedKitSkins;
            end;
        end;

        if SelectedKit then
            DEFAULT = u5.store.Bedwars.equippedKitSkins[u5.SelectedKit] or DEFAULT;
        end;

        local v14, v15;

        if u5.SelectedSkin and u5.store then
            v14 = u5.SelectedSkin == BedwarsKitSkin.DEFAULT;

            if not v14 then
                if DeviceUtil.isHoarceKat() then
                    v14 = table.find(u5.store.Bedwars.ownedKitSkins, u5.SelectedSkin) ~= nil;
                else
                    v14 = KnitClient.Controllers.UnlockController:isKitSkinUnlocked(u5.SelectedSkin);
                end;
            end;

            local product = BedwarsKitSkinMeta[u5.SelectedSkin].product;

            if product ~= nil then
                product = product.devProductId;
            end;

            if product == nil then
                v15 = false;
            else
                v15 = true;
            end;
        else
            v15 = false;
            v14 = false;
        end;

        local function u16() -- Line: 116
            -- upvalues: u5 (copy), KnitClient (ref)
            if u5.SelectedSkin and u5.SelectedKit then
                KnitClient.Controllers.KitSkinController:purchaseKitSkin(u5.SelectedSkin, u5.SelectedKit);
            end;
        end;

        local function u17() -- Line: 121
            -- upvalues: u5 (copy), Flamework (ref), BedwarsAppIds (ref), u2 (ref), KitViewport (ref)
            if not u5.SelectedSkin then
                return nil;
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.GIFTING, {
                GiftType = u5.SelectedSkin,
                CustomImage = u2.createElement(KitViewport, {
                    SizeConstraint = "RelativeYY",
                    Kit = u5.SelectedKit,
                    Skin = u5.SelectedSkin,
                    Size = UDim2.fromScale(1, 1)
                })
            });
        end;

        local function u20() -- Line: 135
            -- upvalues: u5 (copy), u10 (ref), ClientStore (ref), u13 (ref), DeviceUtil (ref), default (ref)
            if u5.SelectedKit then
                if u10 then
                    ClientStore:dispatch({
                        type = "RemoveFavoriteKit",
                        kit = u5.SelectedKit
                    });
                else
                    if not u13 then
                        return nil;
                    end;

                    ClientStore:dispatch({
                        type = "AddFavoriteKit",
                        kit = u5.SelectedKit
                    });
                end;

                local store = u5.store;

                if store ~= nil then
                    store = store.Bedwars.favoriteKits;
                end;

                if store then
                    store = not DeviceUtil.isHoarceKat();
                end;

                if store then
                    local v18 = default.Client:Get("FavoriteKitUpdate");
                    local v19 = {};
                    local store2 = u5.store;

                    if store2 ~= nil then
                        store2 = store2.Bedwars.favoriteKits;
                    end;

                    v19.favoriteKits = store2;
                    v18:SendToServer(v19);
                end;
            end;
        end;

        local v21 = {};

        for i, v in u5 do
            v21[i] = v;
        end;

        v21.SelectedKit = nil;
        v21.SelectedSkin = nil;
        v21.ItemImage = nil;
        v21.store = nil;

        local function v23(p22) -- Line: 181
            -- upvalues: u2 (ref), Button (ref), u17 (copy), ColorUtil (ref), ImageId (ref), TooltipContainer (ref), AutoSizedText (ref), u5 (copy), GiftMeta (ref)
            return u2.createElement(Button, {
                BackgroundTransparency = 0.6,
                AutoButtonColor = true,
                Size = p22.Size,
                OnClick = u17,
                BackgroundColor3 = ColorUtil.hexColor(7631988),
                CornerRadius = UDim.new(0, 0)
            }, { u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ScaleType = "Fit",
                    SizeConstraint = "RelativeYY",
                    Image = ImageId.GIFTS_SOLID,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    ImageColor3 = Color3.fromRGB(255, 255, 255),
                    Size = UDim2.fromScale(0.65, 0.65)
                }), u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                        Text = "Gift Kit Skin",
                        TextSize = 16,
                        Font = Enum.Font.SourceSansBold,
                        Limits = Vector2.new(300, 60)
                    }), u2.createElement(AutoSizedText, {
                        TextSize = 14,
                        Text = not u5.SelectedSkin and "" or GiftMeta[u5.SelectedSkin].name,
                        Font = Enum.Font.SourceSansSemibold,
                        Limits = Vector2.new(300, 500)
                    }) }) });
        end;

        local function v28(p24) -- Line: 218
            -- upvalues: u2 (ref), u10 (ref), BedwarsImageId (ref), ColorUtil (ref), u20 (copy), TooltipContainer (ref), AutoSizedText (ref)
            local createElement = u2.createElement;
            local v25 = {
                Size = p24.Size,
                BackgroundTransparency = 1,
                Position = UDim2.fromScale(1, 0),
                AnchorPoint = Vector2.new(1, 0)
            };
            local v26;

            if u10 then
                v26 = BedwarsImageId.STAR_ALT_SOLID;
            else
                v26 = BedwarsImageId.STAR_ALT_OUTLINE;
            end;

            v25.Image = v26;
            v25.ImageTransparency = u10 and 0 or 0.5;
            local v27;

            if u10 then
                v27 = ColorUtil.hexColor(16765535);
            else
                v27 = ColorUtil.WHITE;
            end;

            v25.ImageColor3 = v27;

            v25[u2.Event.Activated] = function() -- Line: 228
                -- upvalues: u20 (ref)
                u20();
            end;

            return createElement("ImageButton", v25, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }), u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                        Text = "Favorite Kit",
                        TextSize = 16,
                        Font = Enum.Font.SourceSansBold,
                        Limits = Vector2.new(300, 60)
                    }) }) });
        end;

        local function v30(p29) -- Line: 245
            -- upvalues: u2 (ref), ColorUtil (ref), ImageId (ref), u7 (copy)
            return u2.createElement("Frame", {
                BackgroundTransparency = 0.6,
                Size = p29.Size,
                BackgroundColor3 = ColorUtil.BLACK
            }, {
                u2.createElement("UIPadding", {
                    PaddingRight = UDim.new(0.05, 0)
                }),
                u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    HorizontalAlignment = "Center",
                    Padding = UDim.new(0.05)
                }),
                u2.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    ScaleType = "Fit",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Image = ImageId.ROBUX,
                    Size = UDim2.fromScale(0.5, 0.6),
                    ImageColor3 = Color3.fromRGB(255, 255, 255)
                }),
                u2.createElement("TextLabel", {
                    AutomaticSize = "X",
                    SizeConstraint = "RelativeYY",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    Font = "Roboto",
                    TextXAlignment = "Left",
                    TextYAlignment = "Center",
                    Text = tostring(u7),
                    Size = UDim2.fromScale(0, 0.5),
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                })
            });
        end;

        local function v32(p31) -- Line: 285
            -- upvalues: u2 (ref), ButtonComponent (ref), u16 (copy), ColorUtil (ref), DEFAULT (ref), u5 (copy)
            return u2.createElement(ButtonComponent, {
                Text = "BUY SKIN",
                AutoButtonColor = true,
                Size = p31.Size,
                OnClick = u16,
                BackgroundColor3 = ColorUtil.WHITE,
                BackgroundTransparency = DEFAULT == u5.SelectedSkin and 0.8 or 0.6,
                TextColor3 = ColorUtil.WHITE,
                CornerRadius = UDim.new(0, 0)
            });
        end;

        local v33 = {
            Image = "rbxassetid://93313483017936",
            ImageTransparency = 0.7,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            BackgroundColor3 = ColorUtil.hexColor(3092567),
            ScaleType = Enum.ScaleType.Crop
        };

        for i, v in v21 do
            v33[i] = v;
        end;

        local v34;

        if u5.SelectedKit == nil then
            v34 = false;
        else
            v34 = getSkinsForKit(u5.SelectedKit) ~= nil;
        end;

        if v34 then
            local v35 = {
                Size = UDim2.new(1, 0, 0.2, 0),
                Position = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(1, 1)
            };
            local v36 = { u2.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new((1 / 0), 30)
                }), u2.createElement(
                    "UIListLayout",
                    {
                        FillDirection = "Horizontal",
                        VerticalAlignment = "Bottom",
                        HorizontalAlignment = "Right"
                    }
                ) };
            local v37 = #v36;
            local v38 = v15 and not DeviceUtil.isSmallScreen() and u2.createElement(v30, {
                Size = UDim2.fromScale(0.25, 1)
            });

            if v38 then
                v36[v37 + 1] = v38;
            end;

            local v39 = #v36;
            local v40 = v15 and not v14 and u2.createElement(v32, {
                Size = UDim2.fromScale(DeviceUtil.isSmallScreen() and 0.6 or 0.4, 1)
            });

            if v40 then
                v36[v39 + 1] = v40;
            end;

            local v41 = #v36;

            if v15 then
                v15 = u2.createElement(v23, {
                    Size = UDim2.fromScale(DeviceUtil.isSmallScreen() and 0.2 or 0.125, 1)
                });
            end;

            if v15 then
                v36[v41 + 1] = v15;
            end;

            v34 = u2.createFragment({
                ActionButtons = u2.createElement(Empty, v35, v36)
            });
        end;

        local v42 = {};
        local v43 = u2.createElement("UIPadding", {
            PaddingTop = UDim.new(0.05, 0),
            PaddingRight = UDim.new(0.05, 0),
            PaddingBottom = UDim.new(0.05, 0),
            PaddingLeft = UDim.new(0.05, 0)
        });
        local v44;

        if u5.SelectedKit == nil then
            if u5.ItemImage == nil then
                v44 = u2.createElement(PlayerViewport, {
                    SizeConstraint = "RelativeYY",
                    Rotate = true,
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(0.5, 0),
                    AnchorPoint = Vector2.new(0.5, 0)
                });
            else
                v44 = u2.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.85, 0.85),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = u5.ItemImage
                });
            end;
        else
            v44 = u2.createElement(KitViewport, {
                SizeConstraint = "RelativeYY",
                Kit = u5.SelectedKit,
                Skin = u5.SelectedSkin,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0),
                AnchorPoint = Vector2.new(0.5, 0)
            });
        end;

        v42[1], v42[2] = v43, v44;
        local v45 = #v42;

        if v34 then
            v42[v45 + 1] = v34;
        end;

        local v46 = #v42;
        local v47 = u5.SelectedKit and u13 and u2.createFragment({
            FavoriteButton = u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 0.15)
            }, { u2.createElement(v28, {
                    Size = UDim2.fromScale(1, 1)
                }) })
        });

        if v47 then
            v42[v46 + 1] = v47;
        end;

        return u2.createFragment({
            TopSection = u2.createElement("ImageLabel", v33, v42)
        });
    end)
};