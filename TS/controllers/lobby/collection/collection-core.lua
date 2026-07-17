-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-item-types");
local LockerCategoryToTab = v5.LockerCategoryToTab;
local LockerItemCategory = v5.LockerItemCategory;
local LockerTab = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab;
local LockerEmoteRadialWheel = RuntimeLib.import(script, script.Parent.Parent, "locker", "ui", "emote", "locker-emote-radial-wheel").LockerEmoteRadialWheel;
local CollectionItemsSection = RuntimeLib.import(script, script.Parent, "collection-items-section").CollectionItemsSection;
local CollectionSectionMeta = RuntimeLib.import(script, script.Parent, "collection-sections").CollectionSectionMeta;
local ItemSkinSelector = RuntimeLib.import(script, script.Parent, "item-skins", "item-skin-selector").ItemSkinSelector;

return {
    CollectionCore = v4.new(u3)(function(u6, p7) -- Line: 19
        -- upvalues: u3 (copy), ItemSkinSelector (copy), u2 (copy), CollectionSectionMeta (copy), CollectionItemsSection (copy), Empty (copy), LockerCategoryToTab (copy), LockerEmoteRadialWheel (copy), LockerItemCategory (copy), LockerTab (copy), ButtonComponent (copy), Padding (copy), DeviceUtil (copy)
        local useEffect = p7.useEffect;
        local v8, u9 = p7.useState(nil);
        useEffect(function() -- Line: 23
            -- upvalues: u6 (copy), u9 (copy)
            if u6.BackButtonClickCount > 0 then
                u9(nil);
                local SetShouldShowBackButton = u6.SetShouldShowBackButton;

                if SetShouldShowBackButton ~= nil then
                    SetShouldShowBackButton(false);
                end;
            end;
        end, { u6.BackButtonClickCount });
        local v10;

        if v8 then
            v10 = u3.createElement(ItemSkinSelector, {
                AppId = "ItemSkinSelector",
                BaseItemSkinType = v8
            });
        else
            local v11 = { u3.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    SortOrder = "LayoutOrder",
                    HorizontalFlex = Enum.UIFlexAlignment.SpaceAround
                }) };
            local _ = #v11;
            local v12 = u2.entries(CollectionSectionMeta);
            table.sort(v12, function(p13, p14) -- Line: 48
                local layoutOrder = p13[2].layoutOrder;
                local layoutOrder2 = p14[2].layoutOrder;

                return (layoutOrder == nil and 100 or layoutOrder) < (layoutOrder2 == nil and 100 or layoutOrder2);
            end);

            local function v19(p15, p16) -- Line: 60
                -- upvalues: u3 (ref), CollectionItemsSection (ref), u9 (copy), u6 (copy)
                local v17 = p15[1];

                if p15[2].skinBaseItemTypes then
                    return u3.createElement(CollectionItemsSection, {
                        Section = v17,
                        Size = UDim2.fromScale(1, 0.23),

                        SetSelectedBaseItemSkin = function(p18) -- Line: 69, Name: SetSelectedBaseItemSkin
                            -- upvalues: u9 (ref), u6 (ref)
                            u9(p18);
                            local SetShouldShowBackButton = u6.SetShouldShowBackButton;

                            if SetShouldShowBackButton ~= nil then
                                SetShouldShowBackButton(true);
                            end;
                        end,

                        GamepadShouldAutoSelect = p16 == 0
                    });
                end;

                return nil;
            end;

            local v20 = 0;
            local v21 = {};

            for i, v in v12 do
                local v22 = v19(v, i - 1, v12);

                if v22 ~= nil then
                    v20 = v20 + 1;
                    v21[v20] = v22;
                end;
            end;

            local v23 = {
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.4, 1)
            };
            local v24 = { u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    VerticalAlignment = "Top",
                    HorizontalAlignment = "Left",
                    Padding = UDim.new(0.0266, 0)
                }) };
            local v25 = #v24;

            for i, v in v21 do
                v24[v25 + i] = v;
            end;

            v11.ItemSkins = u3.createFragment({
                ItemSkins = u3.createElement(Empty, v23, v24)
            });
            local v26 = u2.entries(CollectionSectionMeta);
            table.sort(v26, function(p27, p28) -- Line: 110
                local layoutOrder = p27[2].layoutOrder;
                local layoutOrder2 = p28[2].layoutOrder;

                return (layoutOrder == nil and 100 or layoutOrder) < (layoutOrder2 == nil and 100 or layoutOrder2);
            end);

            local function v33(p29) -- Line: 122
                -- upvalues: u3 (ref), CollectionItemsSection (ref), LockerCategoryToTab (ref), u6 (copy)
                local v30 = p29[1];
                local u31 = p29[2];

                if u31.lockerCategory then
                    return u3.createElement(CollectionItemsSection, {
                        Section = v30,
                        Size = UDim2.fromScale(0.48, 0.23),

                        OnLockerClick = function() -- Line: 131, Name: OnLockerClick
                            -- upvalues: LockerCategoryToTab (ref), u31 (copy), u6 (ref)
                            local v32 = LockerCategoryToTab[u31.lockerCategory];
                            local OnLockerItemClick = u6.OnLockerItemClick;

                            if OnLockerItemClick ~= nil then
                                OnLockerItemClick(u31.lockerCategory, v32);
                            end;
                        end
                    });
                end;

                return nil;
            end;

            local v34 = 0;
            local v35 = {};

            for i, v in v26 do
                local v36 = v33(v, i - 1, v26);

                if v36 ~= nil then
                    v34 = v34 + 1;
                    v35[v34] = v36;
                end;
            end;

            local v37 = {
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.32, 1)
            };
            local v38 = { u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    VerticalAlignment = "Top",
                    HorizontalAlignment = "Left",
                    Wraps = true,
                    Padding = UDim.new(0.0266, 0)
                }) };
            local v39 = #v38;

            for i, v in v35 do
                v38[v39 + i] = v;
            end;

            v11.LockerItems = u3.createFragment({
                LockerItems = u3.createElement(Empty, v37, v38)
            });
            v11.Other = u3.createFragment({
                Other = u3.createElement(Empty, {
                    LayoutOrder = 3,
                    Size = UDim2.fromScale(0.22, 1)
                }, {
                    u3.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        VerticalAlignment = "Top",
                        HorizontalAlignment = "Left",
                        SortOrder = "LayoutOrder",
                        VerticalFlex = Enum.UIFlexAlignment.Fill,
                        Padding = UDim.new(0.03, 0)
                    }),
                    EmotesSection = u3.createElement(Empty, {
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.7)
                    }, {
                        Title = u3.createElement("TextLabel", {
                            Text = "EMOTES",
                            TextScaled = true,
                            TextXAlignment = "Left",
                            BackgroundTransparency = 1,
                            Size = UDim2.fromScale(1, 0.06),
                            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                            TextColor3 = Color3.fromRGB(255, 255, 255)
                        }),
                        u3.createElement(LockerEmoteRadialWheel, {
                            LayoutOrder = 3,
                            Size = UDim2.new(1, 0, 0.8, 0),
                            AnchorPoint = Vector2.new(0, 0),
                            Position = UDim2.fromScale(0, 0.12),
                            SelectedEmotes = u6.SelectedEmotes,

                            SetSelectedSlot = function(p40) -- Line: 203, Name: SetSelectedSlot
                                -- upvalues: u6 (copy), LockerItemCategory (ref), LockerTab (ref)
                                local OnLockerItemClick = u6.OnLockerItemClick;

                                if OnLockerItemClick ~= nil then
                                    OnLockerItemClick(LockerItemCategory.EMOTE, LockerTab.EMOTES);
                                end;

                                return nil;
                            end
                        })
                    }),
                    ConsumablesSection = u3.createElement(Empty, {
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(1, 0.3)
                    }, {
                        Title = u3.createElement("TextLabel", {
                            Text = "CONSUMABLES",
                            TextScaled = true,
                            TextXAlignment = "Left",
                            BackgroundTransparency = 1,
                            Size = UDim2.fromScale(1, 0.15),
                            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                            TextColor3 = Color3.fromRGB(255, 255, 255)
                        }),
                        u3.createElement(ButtonComponent, {
                            Text = "View Consumables",
                            TextScaled = true,
                            Size = UDim2.fromScale(0.8, 0.35),
                            Position = UDim2.fromScale(0, 0.2),

                            OnClick = function() -- Line: 229, Name: OnClick
                                -- upvalues: u6 (copy), LockerTab (ref)
                                local OnLockerItemClick = u6.OnLockerItemClick;

                                if OnLockerItemClick ~= nil then
                                    OnLockerItemClick(nil, LockerTab.CONSUMABLES);
                                end;
                            end
                        }, { u3.createElement(Padding, {
                                Padding = UDim.new(0.1, 0)
                            }) })
                    })
                })
            });
            v10 = u3.createFragment(v11);
        end;

        local v41 = {
            Position = UDim2.fromScale(0.5, 0.535),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.9, DeviceUtil.isSmallScreen() and 0.75 or 0.78)
        };
        local v42 = {
            [#v42 + 1] = v10
        };

        return u3.createFragment({
            Container = u3.createElement(Empty, v41, v42)
        });
    end)
};