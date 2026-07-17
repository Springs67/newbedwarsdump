-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ArmorTrimMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta").ArmorTrimMeta;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank");
local ArmorTrimEffectRank = v5.ArmorTrimEffectRank;
local ArmorTrimEffectRankMeta = v5.ArmorTrimEffectRankMeta;
local ArmorTrimUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil;
local BedwarsArmorSet = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-armor-set").BedwarsArmorSet;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PlayerViewport = RuntimeLib.import(script, script.Parent.Parent.Parent, "kit-shop", "ui", "misc", "player-viewport").PlayerViewport;
local ArmorTrimSwitchArmorTypeButton = RuntimeLib.import(script, script.Parent, "armor-trim-switch-armor-type-button").ArmorTrimSwitchArmorTypeButton;
local u6 = {
    armorSet = "LEATHER",
    displayMode = "KIT",
    armorTrimColor = ColorUtil.WHITE
};

return {
    DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION = u6,
    ArmorTrimPlayerViewportBase = v4.new(u3)(function(u7, p8) -- Line: 32
        -- upvalues: u6 (copy), ArmorTrimEffectRankMeta (copy), ArmorTrimEffectRank (copy), DeviceUtil (copy), u2 (copy), BedwarsArmorSet (copy), ReplicatedStorage (copy), ArmorTrimUtil (copy), u3 (copy), Theme (copy), GameAnimationUtil (copy), AnimationType (copy), PlayerViewport (copy), Padding (copy), ArmorTrimMeta (copy), Empty (copy), BedwarsImageId (copy), TooltipContainer (copy), AutoSizedText (copy), ColorUtil (copy), ArmorTrimSwitchArmorTypeButton (copy)
        local useState = p8.useState;
        local useEffect = p8.useEffect;
        local StartingSelection = u7.StartingSelection;

        if StartingSelection ~= nil then
            StartingSelection = StartingSelection.displayMode;
        end;

        if StartingSelection == nil then
            StartingSelection = u6.displayMode;
        end;

        local u9, _ = useState(StartingSelection);
        local u10, u11 = useState(false);
        local StartingSelection2 = u7.StartingSelection;

        if StartingSelection2 ~= nil then
            StartingSelection2 = StartingSelection2.armorSet;
        end;

        local u12, u13 = useState(StartingSelection2 == nil and "LEATHER" or StartingSelection2);
        local StartingSelection3 = u7.StartingSelection;

        if StartingSelection3 ~= nil then
            StartingSelection3 = StartingSelection3.armorTrimColor;
        end;

        if StartingSelection3 == nil then
            StartingSelection3 = u6.armorTrimColor;
        end;

        local u14, u15 = useState(StartingSelection3);
        local v16, u17 = useState({});
        local ArmorTrimEffectRank2 = u7.ArmorTrimEffectRank;

        if ArmorTrimEffectRank2 == nil then
            ArmorTrimEffectRank2 = ArmorTrimEffectRank.T1;
        end;

        local v18 = ArmorTrimEffectRankMeta[ArmorTrimEffectRank2];
        local u19 = DeviceUtil.isMobileControls();
        useEffect(function() -- Line: 71
            -- upvalues: u7 (copy), u2 (ref), u15 (copy)
            if not u7.ColorSignal then
                return nil;
            end;

            local u20 = u2.new();
            u20:GiveTask(u7.ColorSignal:Connect(function(p21) -- Line: 76
                -- upvalues: u15 (ref)
                return u15(p21);
            end));

            return function() -- Line: 79
                -- upvalues: u20 (copy)
                return u20:Destroy();
            end;
        end, { u7.ColorSignal });
        useEffect(function() -- Line: 83
            -- upvalues: BedwarsArmorSet (ref), u12 (copy), ReplicatedStorage (ref), u2 (ref), u7 (copy), ArmorTrimUtil (ref), ArmorTrimEffectRank (ref), u14 (copy), u17 (copy)
            local function _(p22) -- Line: 86
                -- upvalues: ReplicatedStorage (ref)
                return ReplicatedStorage.Assets.Armor:WaitForChild(p22);
            end;

            local v23 = 0;
            local v24 = {};
            local u25 = {};

            for i, v in BedwarsArmorSet[u12] do
                local _ = i - 1;
                local v26 = ReplicatedStorage.Assets.Armor:WaitForChild(v);

                if v26 ~= nil then
                    v23 = v23 + 1;
                    v24[v23] = v26;
                end;
            end;

            local function v32(p27) -- Line: 101
                -- upvalues: u25 (copy)
                local function _(p28) -- Line: 103
                    return p28:IsA("Accessory");
                end;

                local v29 = 0;
                local v30 = {};

                for i, child in p27:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("Accessory") == true then
                        v29 = v29 + 1;
                        v30[v29] = child;
                    end;
                end;

                local function _(p31) -- Line: 116
                    -- upvalues: u25 (ref)
                    table.insert(u25, p31);
                end;

                for i, v in v30 do
                    local _ = i - 1;
                    table.insert(u25, v);
                end;
            end;

            for i, v in v24 do
                v32(v, i - 1, v24);
            end;

            local u33 = u2.new();

            if u7.ArmorTrimType then
                local ArmorTrimEffectRank3 = u7.ArmorTrimEffectRank;

                if ArmorTrimEffectRank3 == nil then
                    ArmorTrimEffectRank3 = ArmorTrimEffectRank.T1;
                end;

                local function _(p34) -- Line: 136
                    -- upvalues: u25 (copy), u33 (copy)
                    p34:SetAttribute("ArmorTrimTintableAccessory", true);
                    table.insert(u25, p34);
                    u33:GiveTask(p34);
                end;

                for i, v in ArmorTrimUtil.createArmorTrims(u7.ArmorTrimType, u14, ArmorTrimEffectRank3) do
                    local _ = i - 1;
                    v:SetAttribute("ArmorTrimTintableAccessory", true);
                    table.insert(u25, v);
                    u33:GiveTask(v);
                end;
            end;

            u17(u25);

            return function() -- Line: 147
                -- upvalues: u33 (copy)
                u33:Destroy();
            end;
        end, { u12, u7.ArmorTrimType, u7.ArmorTrimEffectRank });
        local v35 = {};

        for i, v in u7 do
            v35[i] = v;
        end;

        v35.SelectedKit = nil;
        v35.ArmorTrimType = nil;
        v35.ArmorTrimEffectRank = nil;
        v35.ButtonMode = nil;
        v35.StartingSelection = nil;
        v35.OnSelectionChanged = nil;
        v35.ViewportProps = nil;
        v35.Rotate = nil;
        v35.ColorSignal = nil;
        v35.renderArmorTrimColorControl = nil;
        v35[u3.Children] = nil;
        local v36 = {
            Size = v35.Size or UDim2.fromScale(1, 1),
            BackgroundColor3 = v35.BackgroundColor3 or Theme.backgroundPrimary
        };
        local BorderSizePixel = v35.BorderSizePixel;
        v36.BorderSizePixel = BorderSizePixel == nil and 0 or BorderSizePixel;

        for i, v in v35 do
            v36[i] = v;
        end;

        local v37 = {};
        local v38 = #v37;
        local v39 = u7[u3.Children];

        if v39 then
            for i, v in v39 do
                if type(i) == "number" then
                    v37[v38 + i] = v;
                else
                    v37[i] = v;
                end;
            end;
        end;

        local v40 = {
            ClipsDescendants = true,
            Size = UDim2.fromScale(0.75, 0.75),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        };
        local ViewportProps = u7.ViewportProps;

        if ViewportProps then
            for i, v in ViewportProps do
                v40[i] = v;
            end;
        end;

        v40.PreviewAccessories = v16;
        v40.PreviewAccessoryTint = u14;
        local Rotate = u7.Rotate;
        v40.Rotate = Rotate == nil and true or Rotate;
        v40.Mode = u9;
        v40.Kit = u7.SelectedKit;
        v40.Animation = GameAnimationUtil:getAssetId(AnimationType.ROBLOX_DEFAULT_IDLE);
        v40.AnimationSpeed = 1;
        v37[#v37 + 1] = u3.createElement(PlayerViewport, v40, { u3.createElement(Padding, {
                Padding = UDim.new(0, 5)
            }), u3.createElement("UICorner", {
                CornerRadius = UDim.new(0.05, 0)
            }) });
        local v41 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            ZIndex = 2,
            Size = UDim2.fromScale(0.75, 0.75),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        };
        local v42 = { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0.05, 0)
            }) };
        local v43 = ((u7.ButtonMode == "ALWAYS_VISIBLE" or u7.ButtonMode == nil) and true or u10) and u7.ButtonMode ~= "NONE";

        if v43 then
            local v44 = {
                Size = UDim2.fromScale(1, 1)
            };
            local v45 = {};
            local v46 = #v45;
            local v47 = {
                Position = UDim2.new(0, 6, 0, 6),
                Size = UDim2.fromScale(0.23, 0.23)
            };
            local v48 = { u3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) };
            local v49;

            if u7.ArmorTrimType == nil then
                v49 = false;
            else
                v49 = u7.ArmorTrimEffectRank ~= nil;
            end;

            if v49 then
                local effects = ArmorTrimMeta[u7.ArmorTrimType].effects;

                if effects ~= nil then
                    effects = effects.tierOverrides;
                end;

                v49 = table.find(effects == nil and { -1 } or effects, u7.ArmorTrimEffectRank) ~= nil and u3.createElement(Empty, {
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                }, { u3.createElement("ImageLabel", {
                        ZIndex = 2,
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0.28, 0.28),
                        Position = UDim2.fromScale(0.96, 0.88),
                        AnchorPoint = Vector2.new(1, 1),
                        Image = BedwarsImageId.STAR_SOLID
                    }), u3.createElement(TooltipContainer, {}, { u3.createElement(AutoSizedText, {
                            Text = "Special Effect",
                            TextSize = 26,
                            Font = Enum.Font.SourceSansBold,
                            Limits = Vector2.new(300, 60)
                        }) }) });
            end;

            local v50 = {
                BackgroundTransparency = 0.75,
                TextScaled = true,
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                Text = v18.text,
                BackgroundColor3 = ColorUtil.darken(v18.color, 0.65),
                TextColor3 = ColorUtil.brighten(v18.color, 0.65),
                Font = Enum.Font.SourceSansBold,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Bottom
            };
            local v51 = { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.22, 0)
                }) };
            local v52 = #v51;

            if v49 then
                v51[v52 + 1] = v49;
            end;

            v48[#v48 + 1] = u3.createElement("TextLabel", v50, v51);
            v45[v46 + 1] = u3.createElement(Empty, v47, v48);
            v45.SwitchArmorSetButton = u3.createElement(ArmorTrimSwitchArmorTypeButton, {
                BackgroundTransparency = 1,
                Selectable = true,
                Position = UDim2.new(0, 6, 1, -16),
                AnchorPoint = Vector2.new(0, 1),
                Size = UDim2.fromScale(0.23, 0.23),
                CurrentArmorSet = u12,

                OnSwitchArmorSet = function(p53) -- Line: 323, Name: OnSwitchArmorSet
                    -- upvalues: u13 (copy), u7 (copy), u14 (copy), u9 (copy)
                    u13(p53);

                    if u7.OnSelectionChanged then
                        u7.OnSelectionChanged({
                            armorSet = p53,
                            armorTrimColor = u14,
                            displayMode = u9
                        });
                    end;
                end
            });
            local v54;

            if u7.ArmorTrimType == nil or u7.ArmorTrimEffectRank == nil then
                v54 = false;
            else
                v54 = u7.renderArmorTrimColorControl ~= nil;
            end;

            if v54 then
                local v55 = {};
                local v56 = #v55;

                for i, v in u7.renderArmorTrimColorControl({
                    selectedKit = u7.SelectedKit,
                    armorTrimType = u7.ArmorTrimType,
                    armorTrimEffectRank = u7.ArmorTrimEffectRank,
                    armorTrimColor = u14,

                    onColorSelected = function(p57) -- Line: 343, Name: onColorSelected
                        -- upvalues: DeviceUtil (ref), u15 (copy), u7 (copy), u12 (copy), u9 (copy)
                        if DeviceUtil.isHoarceKat() then
                            return nil;
                        end;

                        u15(p57);

                        if u7.OnSelectionChanged then
                            u7.OnSelectionChanged({
                                armorSet = u12,
                                armorTrimColor = p57,
                                displayMode = u9
                            });
                        end;
                    end
                }) do
                    v55[v56 + i] = v;
                end;

                v54 = u3.createFragment(v55);
            end;

            if v54 then
                v45[v46 + 2] = v54;
            end;

            v43 = u3.createElement(Empty, v44, v45);
        end;

        local v58 = {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 1,

            [u3.Event.MouseEnter] = function() -- Line: 371
                -- upvalues: u19 (copy), u11 (copy)
                if u19 then
                    return nil;
                end;

                u11(true);
            end,

            [u3.Event.MouseLeave] = function() -- Line: 377
                -- upvalues: u19 (copy), u11 (copy)
                if u19 then
                    return nil;
                end;

                u11(false);
            end,

            [u3.Event.MouseButton1Click] = function() -- Line: 383
                -- upvalues: u19 (copy), u11 (copy), u10 (copy)
                if not u19 then
                    return nil;
                end;

                u11(not u10);
            end
        };
        local v59 = {};
        local v60 = #v59;

        if v43 then
            v59[v60 + 1] = v43;
        end;

        v42[#v42 + 1] = u3.createElement("ImageButton", v58, v59);
        v37.ArmorTrimViewportOverlay = u3.createElement("Frame", v41, v42);

        return u3.createFragment({
            ArmorTrimPlayerViewport = u3.createElement("Frame", v36, v37)
        });
    end)
};