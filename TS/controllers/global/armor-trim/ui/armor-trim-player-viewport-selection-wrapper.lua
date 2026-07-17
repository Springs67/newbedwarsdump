-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local DropdownComponent = v1.DropdownComponent;
local Empty = v1.Empty;
local Padding = v1.Padding;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedcoinPurchaseButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "bedcoin-purchase-button").BedcoinPurchaseButton;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta");
local ArmorTrimMeta = v5.ArmorTrimMeta;
local ArmorTrimPackTypeMeta = v5.ArmorTrimPackTypeMeta;
local ArmorTrimPackType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimPackType;
local ArmorTrimUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil;
local ArmorTrimProgressUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "progress", "armor-trim-progress-util").ArmorTrimProgressUtil;
local BedCoinProductList = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bed-coin", "bed-coin-product-list").BedCoinProductList;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v6 = RuntimeLib.import(script, script.Parent, "armor-trim-player-viewport");
local ArmorTrimPlayerViewport = v6.ArmorTrimPlayerViewport;
local DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION = v6.DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION;

return {
    ArmorTrimViewportSelectionWrapper = v4.new(u3)(function(u7, p8) -- Line: 27
        -- upvalues: DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION (copy), ClientStore (copy), u2 (copy), ArmorTrimPackType (copy), ArmorTrimPackTypeMeta (copy), ArmorTrimUtil (copy), Theme (copy), DeviceUtil (copy), KnitClient (copy), BedCoinProductList (copy), ArmorTrimMeta (copy), u3 (copy), ArmorTrimPlayerViewport (copy), ColorUtil (copy), Padding (copy), BedwarsImageId (copy), ArmorTrimProgressUtil (copy), Empty (copy), DropdownComponent (copy), BedcoinPurchaseButton (copy)
        local useState = p8.useState;
        local _ = p8.useEffect;
        local v9 = {};
        local StartingSelection = u7.StartingSelection;

        if StartingSelection ~= nil then
            StartingSelection = StartingSelection.armorSet;
        end;

        if StartingSelection == nil then
            StartingSelection = DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION.armorSet;
        end;

        v9.armorSet = StartingSelection;
        local StartingSelection2 = u7.StartingSelection;

        if StartingSelection2 ~= nil then
            StartingSelection2 = StartingSelection2.armorTrimColor;
        end;

        if StartingSelection2 == nil then
            StartingSelection2 = DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION.armorTrimColor;
        end;

        v9.armorTrimColor = StartingSelection2;
        local StartingSelection3 = u7.StartingSelection;

        if StartingSelection3 ~= nil then
            StartingSelection3 = StartingSelection3.displayMode;
        end;

        if StartingSelection3 == nil then
            StartingSelection3 = DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION.displayMode;
        end;

        v9.displayMode = StartingSelection3;
        local u10, u11 = useState(v9);
        local v12, u13 = useState(false);
        local u14 = ClientStore:getState().ArmorTrim.allKitProgress[u7.SelectedKit];

        local function _(p15) -- Line: 65
            -- upvalues: u14 (copy), ArmorTrimPackType (ref)
            local v16 = u14;

            if v16 ~= nil then
                v16 = #v16 == 0;
            end;

            return v16 == false or p15 ~= ArmorTrimPackType.ALL_RANDOM;
        end;

        local v17 = 0;
        local v18 = {};

        for i, v in u2.values(ArmorTrimPackType) do
            local _ = i - 1;
            local v19;

            if u14 == nil then
                v19 = u14;
            else
                v19 = #u14 == 0;
            end;

            if (v19 == false or v ~= ArmorTrimPackType.ALL_RANDOM) == true then
                v17 = v17 + 1;
                v18[v17] = v;
            end;
        end;

        table.sort(v18);

        local function v21(p20) -- Line: 88
            -- upvalues: ArmorTrimPackTypeMeta (ref), ArmorTrimUtil (ref), u14 (copy)
            return {
                text = ArmorTrimPackTypeMeta[p20].displayName,
                value = tostring(p20),
                locked = #ArmorTrimUtil.getUnlockableArmorTrims(u14 or {}, p20) == 0
            };
        end;

        local v22 = table.create(#v18);

        for i, v in v18 do
            v22[i] = v21(v, i - 1, v18);
        end;

        local u23, u24 = useState(v18[1]);
        local u25 = {
            OWNED = {
                Text = "Equip",
                BackgroundColor3 = Theme.backgroundSuccess,

                OnSelected = function() -- Line: 108, Name: OnSelected
                    -- upvalues: DeviceUtil (ref), KnitClient (ref), u7 (copy), u10 (copy)
                    if DeviceUtil.isHoarceKat() then
                        return nil;
                    end;

                    KnitClient.Controllers.ArmorTrimController:equipArmorTrimConfig(u7.SelectedKit, u7.ArmorTrimType, u10.armorTrimColor);
                end
            },
            EQUIPPED = {
                Text = "Equipped",
                BackgroundColor3 = Theme.backgroundSuccess,

                OnSelected = function() -- Line: 118, Name: OnSelected
                    -- upvalues: DeviceUtil (ref), KnitClient (ref), u7 (copy)
                    if DeviceUtil.isHoarceKat() then
                        return nil;
                    end;

                    KnitClient.Controllers.ArmorTrimController:equipArmorTrimConfig(u7.SelectedKit, nil, nil);
                end
            },
            LOCKED = {
                Text = "Locked",
                BackgroundColor3 = Theme.Gray
            }
        };
        local v26 = {};
        local cost = BedCoinProductList.getProductInfo(38).cost;
        v26.Text = tostring(cost);
        v26.BackgroundColor3 = Theme.mcGold;

        function v26.OnSelected() -- Line: 132
            -- upvalues: KnitClient (ref), ArmorTrimPackTypeMeta (ref), u23 (copy), u7 (copy)
            KnitClient.Controllers.BedCoinProductPurchaseController:purchase({
                productId = ArmorTrimPackTypeMeta[u23].productId,
                selectedKit = u7.SelectedKit
            });
        end;

        u25.PURCHASE = v26;
        local v27 = not u7.ArmorTrimType and "" or ArmorTrimMeta[u7.ArmorTrimType].name;
        local v28 = {};

        for i, v in u7 do
            v28[i] = v;
        end;

        v28.SelectedKit = nil;
        v28.ArmorTrimType = nil;
        v28.ArmorTrimEffectRank = nil;
        v28.ButtonMode = nil;
        v28.StartingSelection = nil;
        v28.SelectionState = nil;
        v28.xp = nil;
        v28.ColorSignal = nil;
        v28.ViewportProps = nil;

        if u7.SelectionState == nil then
            u7.SelectionState = "LOCKED";
        end;

        local v29;

        if u7.SelectionState == "LOCKED" or u7.ArmorTrimType == nil then
            local v30 = {
                Size = UDim2.fromScale(1, 1)
            };

            for i, v in v28 do
                v30[i] = v;
            end;

            local v31 = { u3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    Padding = UDim.new(0, 5),
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder
                }) };
            local v32 = #v31;
            local v33 = {};
            local ViewportProps = u7.ViewportProps;

            if ViewportProps ~= nil then
                ViewportProps = ViewportProps.Size;
            end;

            if ViewportProps == nil then
                ViewportProps = u7.SelectionState == "PURCHASE";
            end;

            local v34;

            if ViewportProps then
                v34 = UDim2.fromScale(0.75, 0.65);
            else
                v34 = UDim2.fromScale(0.75, 0.75);
            end;

            v33.Size = v34;
            local ViewportProps2 = u7.ViewportProps;

            if ViewportProps2 ~= nil then
                ViewportProps2 = ViewportProps2.Position;
            end;

            if ViewportProps2 == nil then
                ViewportProps2 = u7.SelectionState == "PURCHASE";
            end;

            local v35;

            if ViewportProps2 then
                v35 = UDim2.fromScale(0.5, 0.4);
            else
                v35 = UDim2.fromScale(0.5, 0.5);
            end;

            v33.Position = v35;
            local ViewportProps3 = u7.ViewportProps;

            if ViewportProps3 ~= nil then
                ViewportProps3 = ViewportProps3.AnchorPoint;
            end;

            if ViewportProps3 == nil then
                ViewportProps3 = Vector2.new(0.5, 0.5);
            end;

            v33.AnchorPoint = ViewportProps3;
            v33.BackgroundColor3 = ColorUtil.darken(Theme.backgroundTertiaryCard, 0.5);
            local ViewportProps4 = u7.ViewportProps;

            if ViewportProps4 ~= nil then
                ViewportProps4 = ViewportProps4.BorderSizePixel;
            end;

            v33.BorderSizePixel = ViewportProps4 == nil and 0 or ViewportProps4;
            local ViewportProps5 = u7.ViewportProps;

            if ViewportProps5 ~= nil then
                ViewportProps5 = ViewportProps5.BorderMode;
            end;

            v33.BorderMode = ViewportProps5;
            local ViewportProps6 = u7.ViewportProps;

            if ViewportProps6 ~= nil then
                ViewportProps6 = ViewportProps6.BorderColor3;
            end;

            v33.BorderColor3 = ViewportProps6;
            local ViewportProps7 = u7.ViewportProps;

            if ViewportProps7 ~= nil then
                ViewportProps7 = ViewportProps7.ZIndex;
            end;

            v33.ZIndex = ViewportProps7;
            local ViewportProps8 = u7.ViewportProps;

            if ViewportProps8 ~= nil then
                ViewportProps8 = ViewportProps8.ClipsDescendants;
            end;

            v33.ClipsDescendants = ViewportProps8;
            local ViewportProps9 = u7.ViewportProps;

            if ViewportProps9 ~= nil then
                ViewportProps9 = ViewportProps9.Visible;
            end;

            v33.Visible = ViewportProps9;
            local ViewportProps10 = u7.ViewportProps;

            if ViewportProps10 ~= nil then
                ViewportProps10 = ViewportProps10.LayoutOrder;
            end;

            v33.LayoutOrder = ViewportProps10 == nil and 1 or ViewportProps10;
            local ViewportProps11 = u7.ViewportProps;

            if ViewportProps11 ~= nil then
                ViewportProps11 = ViewportProps11.BackgroundTransparency;
            end;

            v33.BackgroundTransparency = ViewportProps11;
            local ViewportProps12 = u7.ViewportProps;

            if ViewportProps12 ~= nil then
                ViewportProps12 = ViewportProps12.Selectable;
            end;

            v33.Selectable = ViewportProps12;
            v31[v32 + 1] = u3.createElement("Frame", v33, {
                u3.createElement(Padding, {
                    Padding = UDim.new(0, 5)
                }),
                u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.05, 0)
                }),
                u3.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.9, 0.9),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Image = BedwarsImageId.QUESTION_MARK_SOLID,
                    ImageColor3 = Theme.backgroundPrimary,
                    ScaleType = Enum.ScaleType.Fit
                }),
                u3.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.2, 0.2),
                    Position = UDim2.fromScale(1, 0),
                    AnchorPoint = Vector2.new(1, 0),
                    Image = BedwarsImageId.LOCK_SOLID,
                    ScaleType = Enum.ScaleType.Fit
                }, { u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }),
                u3.createElement("TextLabel", {
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.95, 0.2),
                    AnchorPoint = Vector2.new(0.5, 1),
                    Position = UDim2.fromScale(0.5, 1),
                    Text = u7.SelectionState == "PURCHASE" and "" or "Requires T" .. tostring(ArmorTrimProgressUtil.NEXT_ARMOR_TRIM_TIER_UNLOCK + 1) .. " of previous Armor Trim",
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = ColorUtil.WHITE
                })
            });
            local v36;

            if u7.SelectionState == "PURCHASE" then
                v36 = u3.createFragment({
                    ArmorTrimPackSelectionDropdown = u3.createElement(Empty, {
                        LayoutOrder = 0,
                        Size = UDim2.fromScale(0.75, 0.1),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 1)
                    }, { u3.createElement(DropdownComponent, {
                            DisallowLockedSelection = true,
                            Size = UDim2.fromScale(1, 1),
                            Position = UDim2.fromOffset(0, 0),
                            DefaultItem = v22[1],
                            BackgroundColor3 = Color3.fromRGB(21, 21, 38),
                            Items = v22,

                            OnItemSelected = function(p37) -- Line: 332, Name: OnItemSelected
                                -- upvalues: ArmorTrimUtil (ref), u14 (copy), u24 (copy)
                                local v38 = tonumber(p37);

                                if #ArmorTrimUtil.getUnlockableArmorTrims(u14 or {}, v38) ~= 0 then
                                    u24(v38);
                                end;
                            end
                        }) })
                });
            else
                v36 = false;
            end;

            if v36 then
                v31[v32 + 2] = v36;
            end;

            v29 = u3.createElement("Frame", v30, v31);
        else
            local v39 = {};

            for i, v in v28 do
                v39[i] = v;
            end;

            v39.ColorSignal = u7.ColorSignal;
            v39.SelectedKit = u7.SelectedKit;
            v39.ArmorTrimType = u7.ArmorTrimType;
            v39.ArmorTrimEffectRank = u7.ArmorTrimEffectRank;
            v39.ButtonMode = u7.ButtonMode;
            v39.StartingSelection = u7.StartingSelection;

            function v39.OnSelectionChanged(p40) -- Line: 173
                -- upvalues: u7 (copy), KnitClient (ref), u11 (copy)
                if u7.SelectionState == "EQUIPPED" then
                    KnitClient.Controllers.ArmorTrimController:equipArmorTrimConfig(u7.SelectedKit, u7.ArmorTrimType, p40.armorTrimColor);
                end;

                u11(p40);
            end;

            v39.ViewportProps = u7.ViewportProps;
            v29 = u3.createElement(ArmorTrimPlayerViewport, v39);
        end;

        local v41 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v42 = {
            u3.createElement(Padding, {
                Padding = {
                    Bottom = 5
                }
            }),
            u3.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                TextWrapped = true,
                Position = UDim2.fromScale(0.5, 0.125),
                Size = UDim2.fromScale(1, 0.1),
                AnchorPoint = Vector2.new(0.5, 1),
                Text = v27,
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.SourceSansBold,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Bottom
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 32,
                    MinTextSize = 16
                }) }),
            [#v42 + 1] = v29
        };
        local v43 = #v42;
        local v44 = u7.xp ~= nil;

        if v44 then
            local v45 = {
                Size = UDim2.fromScale(1, 1)
            };
            local v46 = {};
            local v47 = {};
            local ViewportProps = u7.ViewportProps;

            if ViewportProps ~= nil then
                ViewportProps = ViewportProps.Size;
            end;

            if ViewportProps == nil then
                ViewportProps = UDim2.fromScale(0.75, 0.75);
            end;

            v47.Size = ViewportProps;
            local ViewportProps2 = u7.ViewportProps;

            if ViewportProps2 ~= nil then
                ViewportProps2 = ViewportProps2.Position;
            end;

            if ViewportProps2 == nil then
                ViewportProps2 = UDim2.fromScale(0.5, 0.5);
            end;

            v47.Position = ViewportProps2;
            local ViewportProps3 = u7.ViewportProps;

            if ViewportProps3 ~= nil then
                ViewportProps3 = ViewportProps3.AnchorPoint;
            end;

            if ViewportProps3 == nil then
                ViewportProps3 = Vector2.new(0.5, 0.5);
            end;

            v47.AnchorPoint = ViewportProps3;
            v47.ClipsDescendants = true;
            v47.BackgroundTransparency = 1;
            local createElement = u3.createElement;
            local v48 = {};
            local v49 = u3.createElement("UICorner", {
                CornerRadius = UDim.new(0.05, 0)
            });
            local createElement2 = u3.createElement;
            local v50 = {
                Size = UDim2.fromScale(1, 0.03),
                Position = UDim2.fromScale(0, 1),
                AnchorPoint = Vector2.new(0, 1)
            };
            local v51 = {};
            local createElement3 = u3.createElement;
            local v52 = {
                BorderSizePixel = 0
            };
            local fromScale = UDim2.fromScale;
            local v53 = u7.xp / ArmorTrimProgressUtil.getXpAtTier(ArmorTrimProgressUtil.getMaxTier());
            v52.Size = fromScale(math.min(v53, 1), 1);
            v52.BackgroundColor3 = Theme.mcGreen;
            v51[1] = createElement3("Frame", v52);
            v48[1], v48[2] = v49, createElement2(Empty, v50, v51);
            v46[#v46 + 1] = createElement(Empty, v47, v48);
            v44 = u3.createElement(Empty, v45, v46);
        end;

        if v44 then
            v42[v43 + 1] = v44;
        end;

        local v54;

        if u7.SelectionState == "PURCHASE" and u23 ~= nil then
            v54 = u3.createElement(BedcoinPurchaseButton, {
                BedcoinProductId = ArmorTrimPackTypeMeta[u23].productId,
                PurchaseButtonProps = {
                    OnClick = function() -- Line: 442, Name: OnClick
                        -- upvalues: u25 (copy)
                        u25.PURCHASE.OnSelected();
                    end,

                    Position = UDim2.fromScale(0.5, 1),
                    AnchorPoint = Vector2.new(0.5, 1),
                    Size = UDim2.fromScale(0.5, 0.1)
                }
            });
        else
            local v55 = {
                Position = UDim2.fromScale(0.5, 1),
                AnchorPoint = Vector2.new(0.5, 1),
                Size = UDim2.fromScale(0.5, 0.1),
                BorderSizePixel = 0
            };
            local v56;

            if v12 then
                v56 = ColorUtil.brighten(u25[u7.SelectionState].BackgroundColor3, 0.25);
            else
                v56 = u25[u7.SelectionState].BackgroundColor3;
            end;

            v55.BackgroundColor3 = v56;

            v55[u3.Event.MouseEnter] = function() -- Line: 457
                -- upvalues: u13 (copy)
                u13(true);
            end;

            v55[u3.Event.MouseLeave] = function() -- Line: 460
                -- upvalues: u13 (copy)
                u13(false);
            end;

            v55[u3.Event.MouseButton1Click] = function() -- Line: 463
                -- upvalues: u25 (copy), u7 (copy)
                local OnSelected = u25[u7.SelectionState or "LOCKED"].OnSelected;

                if OnSelected ~= nil then
                    OnSelected();
                end;
            end;

            local v57 = { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 5)
                }), u3.createElement(Padding, {
                    Padding = UDim.new(0, 5)
                }), u3.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    RichText = true,
                    Size = UDim2.fromScale(1, 1),
                    Text = u25[u7.SelectionState or "LOCKED"].Text,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
                }) };
            local v58 = #v57;

            if u7.SelectionState == "EQUIPPED" or v12 then
                local createElement = u3.createElement;
                local v59 = {
                    Thickness = 1
                };
                local v60;

                if u7.SelectionState == "EQUIPPED" then
                    v60 = Color3.fromRGB(255, 209, 97);
                else
                    v60 = ColorUtil.WHITE;
                end;

                v59.Color = v60;
                v12 = createElement("UIStroke", v59, { u3.createElement("UIGradient", {
                        Rotation = -90,
                        Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
                    }) });
            end;

            if v12 then
                v57[v58 + 1] = v12;
            end;

            v54 = u3.createElement("ImageButton", v55, v57);
        end;

        v42[#v42 + 1] = v54;

        return u3.createElement(Empty, v41, v42);
    end)
};