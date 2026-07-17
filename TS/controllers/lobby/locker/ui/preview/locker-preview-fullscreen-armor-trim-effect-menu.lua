-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ArmorTrimSwitchArmorTypeButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "armor-trim", "ui", "armor-trim-switch-armor-type-button").ArmorTrimSwitchArmorTypeButton;
local ArmorTrimEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-meta").ArmorTrimEffectMeta;
local ArmorTrimMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta").ArmorTrimMeta;
local ArmorTrimEffectRankMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank").ArmorTrimEffectRankMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    LockerPreviewFullscreenArmorTrimEffectMenu = v3.new(u2)(function(u4) -- Line: 18
        -- upvalues: ArmorTrimEffectRankMeta (copy), ArmorTrimMeta (copy), Theme (copy), u2 (copy), ColorUtil (copy), ArmorTrimEffectMeta (copy), SoundManager (copy), GameSound (copy), BedwarsImageId (copy), Empty (copy), TooltipContainer (copy), AutoSizedText (copy), ArmorTrimSwitchArmorTypeButton (copy)
        local v5 = ArmorTrimEffectRankMeta[u4.previewEffectRank];
        local effects = ArmorTrimMeta[u4.armorTrimType].effects;

        if effects ~= nil then
            effects = effects.tierOverrides;
        end;

        local v6 = effects ~= nil and table.find(effects, u4.previewEffectRank) ~= nil;
        local v7 = {};
        local _ = #v7;
        local v8 = {
            BackgroundTransparency = 0.45,
            BorderSizePixel = 0,
            ZIndex = 5,
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -14, 0.5, 0),
            Size = UDim2.new(0, 236, 0.42, 0),
            BackgroundColor3 = Theme.backgroundSecondary
        };
        local v9 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 4)
            }) };
        local _ = #v9;
        local v10 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1)
        };
        local v11 = {
            u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12),
                PaddingBottom = UDim.new(0, 12),
                PaddingLeft = UDim.new(0, 12),
                PaddingRight = UDim.new(0, 10)
            }),
            u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                Padding = UDim.new(0, 10),
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            ArmorTrimEffectMenuTitle = u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                Text = "Armor Trim Effect",
                TextSize = 17,
                LayoutOrder = 0,
                ZIndex = 6,
                Size = UDim2.new(1, 0, 0, 22),
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Center
            })
        };
        local _ = #v11;
        local selectableTypes = u4.selectableTypes;

        local function v23(u12, p13) -- Line: 82
            -- upvalues: u4 (copy), ColorUtil (ref), ArmorTrimEffectMeta (ref), u2 (ref), SoundManager (ref), GameSound (ref), BedwarsImageId (ref)
            local v14 = u12 == u4.selectedEffectType;
            local isLockedEffectType = u4.isLockedEffectType;

            if isLockedEffectType ~= nil then
                isLockedEffectType = isLockedEffectType(u12);
            end;

            if isLockedEffectType == nil then
                isLockedEffectType = false;
            end;

            local v15 = u12 == u4.equippedEffectType;
            local v16 = {
                Size = UDim2.new(1, -2, 0, 42),
                AutoButtonColor = false,
                Active = true
            };
            local v17;

            if v14 then
                v17 = Color3.fromRGB(45, 61, 85);
            else
                v17 = Color3.fromRGB(20, 20, 20);
            end;

            v16.BackgroundColor3 = v17;
            v16.BackgroundTransparency = v14 and 0.25 or 0.4;
            v16.BorderSizePixel = 1;
            local v18;

            if isLockedEffectType then
                v18 = Color3.fromRGB(145, 145, 145);
            else
                v18 = ColorUtil.WHITE;
            end;

            v16.BorderColor3 = v18;
            v16.Text = ArmorTrimEffectMeta[u12].name;
            local v19;

            if isLockedEffectType then
                v19 = Color3.fromRGB(194, 194, 194);
            else
                v19 = ColorUtil.WHITE;
            end;

            v16.TextColor3 = v19;
            v16.TextXAlignment = Enum.TextXAlignment.Left;
            v16.Font = Enum.Font.GothamMedium;
            v16.TextSize = 15;
            v16.LayoutOrder = p13;

            v16[u2.Event.MouseButton1Click] = function() -- Line: 108
                -- upvalues: SoundManager (ref), GameSound (ref), u4 (ref), u12 (copy)
                SoundManager:playSound(GameSound.UI_CLICK);
                u4.onSelectEffectType(u12);
            end;

            v16.ZIndex = 6;
            local v20 = { u2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 10),
                    PaddingRight = UDim.new(0, 10)
                }), u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                }) };
            local v21 = #v20;

            if v15 then
                v15 = u2.createElement("UIStroke", {
                    Thickness = 2,
                    Color = Color3.fromRGB(125, 255, 178),
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                });
            end;

            if v15 then
                v20[v21 + 1] = v15;
            end;

            local v22 = #v20;

            if isLockedEffectType then
                isLockedEffectType = u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    ZIndex = 7,
                    Size = UDim2.fromOffset(18, 18),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.fromScale(1, 0.5),
                    Image = BedwarsImageId.LOCK_SOLID,
                    ImageColor3 = Color3.fromRGB(255, 214, 124)
                });
            end;

            if isLockedEffectType then
                v20[v22 + 1] = isLockedEffectType;
            end;

            return u2.createFragment({
                ["ArmorTrimEffectRow_" .. u12] = u2.createElement("TextButton", v16, v20)
            });
        end;

        local v24 = table.create(#selectableTypes);

        for i, v in selectableTypes do
            v24[i] = v23(v, i - 1, selectableTypes);
        end;

        local v25 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 5,
            LayoutOrder = 1,
            ZIndex = 6,
            Size = UDim2.new(1, 0, 1, -82),
            ScrollBarImageColor3 = ColorUtil.WHITE,
            ScrollingDirection = Enum.ScrollingDirection.Y,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.new(0, 0, 0, 0)
        };
        local v26 = { u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 2),
                PaddingLeft = UDim.new(0, 1),
                PaddingRight = UDim.new(0, 3)
            }), u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                Padding = UDim.new(0, 6),
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v27 = #v26;

        for i, v in v24 do
            v26[v27 + i] = v;
        end;

        v11.ArmorTrimEffectMenuScroll = u2.createElement("ScrollingFrame", v25, v26);
        local createElement = u2.createElement;
        local v28 = {
            Size = UDim2.new(1, 0, 0, 42),
            AutoButtonColor = false
        };
        local v29;

        if u4.isSelectedEffectEquipped then
            v29 = Color3.fromRGB(45, 61, 85);
        elseif u4.canEquipSelectedEffect then
            v29 = Color3.fromRGB(43, 156, 78);
        else
            v29 = Color3.fromRGB(59, 59, 59);
        end;

        v28.BackgroundColor3 = v29;
        v28.BackgroundTransparency = 0.2;
        v28.BorderSizePixel = 1;
        v28.BorderColor3 = ColorUtil.WHITE;
        v28.Text = u4.isSelectedEffectEquipped and "Equipped" or (u4.canEquipSelectedEffect and "Equip" or "Locked");
        v28.TextColor3 = ColorUtil.WHITE;
        v28.Font = Enum.Font.GothamBold;
        v28.TextSize = 16;
        v28.LayoutOrder = 2;

        v28[u2.Event.MouseButton1Click] = function() -- Line: 198
            -- upvalues: u4 (copy), SoundManager (ref), GameSound (ref)
            if not u4.canEquipSelectedEffect then
                SoundManager:playSound(GameSound.UI_ERROR);

                return nil;
            end;

            if u4.isSelectedEffectEquipped then
                SoundManager:playSound(GameSound.UI_CLICK);

                return nil;
            end;

            SoundManager:playSound(GameSound.UI_CLICK);
            local onEquipSelectedEffect = u4.onEquipSelectedEffect;

            if onEquipSelectedEffect ~= nil then
                onEquipSelectedEffect();
            end;
        end;

        v28.ZIndex = 6;
        v11.ArmorTrimEffectMenuEquipButton = createElement("TextButton", v28, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 4)
            }) });
        v9.ArmorTrimEffectMenuInner = u2.createElement("Frame", v10, v11);
        v7.ArmorTrimEffectMenu = u2.createFragment({
            ArmorTrimEffectMenu = u2.createElement("Frame", v8, v9)
        });
        local v30 = {
            BackgroundTransparency = 0.5,
            ZIndex = 4,
            Position = UDim2.new(0.5, 0, 1, -88),
            AnchorPoint = Vector2.new(0.5, 1),
            Size = UDim2.fromOffset(128, 64),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v31 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.22, 0)
            }), u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 6),
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local _ = #v31;
        local v32 = {
            Size = UDim2.fromOffset(52, 52),
            BackgroundTransparency = 1,
            AutoButtonColor = false,
            Text = "",
            Selectable = true,
            Active = true,

            [u2.Event.MouseButton1Click] = function() -- Line: 251
                -- upvalues: SoundManager (ref), GameSound (ref), u4 (copy)
                SoundManager:playSound(GameSound.UI_CLICK);
                local onCyclePreviewEffectRank = u4.onCyclePreviewEffectRank;

                if onCyclePreviewEffectRank ~= nil then
                    onCyclePreviewEffectRank();
                end;
            end,

            ZIndex = 5
        };
        local v33 = { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) };
        local v34 = #v33;
        local v35 = {
            BackgroundTransparency = 0.75,
            TextScaled = true,
            Active = false,
            Selectable = false,
            ZIndex = 6,
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            Text = v5.text,
            BackgroundColor3 = ColorUtil.darken(v5.color, 0.65),
            TextColor3 = ColorUtil.brighten(v5.color, 0.65),
            Font = Enum.Font.SourceSansBold,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Bottom
        };
        local v36 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.22, 0)
            }) };
        local v37 = #v36;

        if v6 then
            v6 = u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, { u2.createElement("ImageLabel", {
                    ZIndex = 7,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.28, 0.28),
                    Position = UDim2.fromScale(0.96, 0.88),
                    AnchorPoint = Vector2.new(1, 1),
                    Image = BedwarsImageId.STAR_SOLID
                }), u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                        Text = "Special Effect",
                        TextSize = 26,
                        Font = Enum.Font.SourceSansBold,
                        Limits = Vector2.new(300, 60)
                    }) }) });
        end;

        if v6 then
            v36[v37 + 1] = v6;
        end;

        v33[v34 + 1] = u2.createElement("TextLabel", v35, v36);
        v33[v34 + 2] = u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                Text = "Preview tier",
                TextSize = 16,
                Font = Enum.Font.SourceSansBold,
                Limits = Vector2.new(300, 60)
            }) });
        v31.ArmorTrimPreviewTierCycleButton = u2.createElement("TextButton", v32, v33);
        v31.SwitchArmorSetButton = u2.createElement(ArmorTrimSwitchArmorTypeButton, {
            BackgroundTransparency = 1,
            Selectable = true,
            ZIndex = 5,
            Size = UDim2.fromOffset(52, 52),
            CurrentArmorSet = u4.currentArmorSet,

            OnSwitchArmorSet = function(p38) -- Line: 328, Name: OnSwitchArmorSet
                -- upvalues: SoundManager (ref), GameSound (ref), u4 (copy)
                SoundManager:playSound(GameSound.UI_CLICK);
                local onSwitchArmorSet = u4.onSwitchArmorSet;

                if onSwitchArmorSet ~= nil then
                    onSwitchArmorSet(p38);
                end;
            end
        });
        v7.ArmorTrimPreviewTierCycleButtonContainer = u2.createFragment({
            ArmorTrimPreviewTierCycleButtonContainer = u2.createElement("Frame", v30, v31)
        });

        return u2.createFragment(v7);
    end)
};