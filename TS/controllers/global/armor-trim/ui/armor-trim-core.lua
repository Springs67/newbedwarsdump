-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ArmorTrimMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta").ArmorTrimMeta;
local ArmorTrimEffectRank = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank").ArmorTrimEffectRank;
local ArmorTrimPackType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimPackType;
local armorTrimUnlockDefinition = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-unlock-definition").armorTrimUnlockDefinition;
local ArmorTrimUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil;
local ArmorTrimProgressUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "progress", "armor-trim-progress-util").ArmorTrimProgressUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION = RuntimeLib.import(script, script.Parent, "armor-trim-player-viewport").DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION;
local ArmorTrimViewportSelectionWrapper = RuntimeLib.import(script, script.Parent, "armor-trim-player-viewport-selection-wrapper").ArmorTrimViewportSelectionWrapper;
local ArmorTrimPreview = RuntimeLib.import(script, script.Parent, "armor-trim-preview").ArmorTrimPreview;
local ArmorTrimProgressBar = RuntimeLib.import(script, script.Parent, "armor-trim-progress-bar").ArmorTrimProgressBar;

return {
    ArmorTrimCore = v5.new(u4)(function(u6, p7) -- Line: 23
        -- upvalues: u4 (copy), ArmorTrimUtil (copy), ArmorTrimPackType (copy), ArmorTrimProgressUtil (copy), u3 (copy), u2 (copy), ArmorTrimMeta (copy), armorTrimUnlockDefinition (copy), ArmorTrimPreview (copy), Empty (copy), AutoCanvasScrollingFrame (copy), Theme (copy), ArmorTrimEffectRank (copy), DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION (copy), ArmorTrimViewportSelectionWrapper (copy), Padding (copy), ColorUtil (copy), ArmorTrimProgressBar (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local _ = p7.useMemo;
        local u8, u9 = useState(nil);
        local u10, u11 = useState({});
        local u12 = u6.store.ArmorTrim.selectedArmorTrimConfigs[u6.SelectedKit];
        local u13 = u6.store.ArmorTrim.allKitProgress[u6.SelectedKit];
        local v14;

        if u13 == nil then
            v14 = u13;
        else
            local function _(p15) -- Line: 33
                -- upvalues: u12 (copy)
                local v16 = u12;

                if v16 ~= nil then
                    v16 = v16.type;
                end;

                return p15.trim == v16;
            end;

            v14 = nil;

            for i, v in u13 do
                local _ = i - 1;
                local v17;

                if u12 == nil then
                    v17 = u12;
                else
                    v17 = u12.type;
                end;

                if v.trim == v17 == true then
                    v14 = v;
                    break;
                end;
            end;
        end;

        local u18 = u6.store.ArmorTrim.allKitXpPotential[u6.SelectedKit];
        local u19 = u4.createRef();
        useEffect(function() -- Line: 56
            -- upvalues: u13 (copy), u12 (copy), ArmorTrimUtil (ref), ArmorTrimPackType (ref), ArmorTrimProgressUtil (ref), u11 (copy)
            local v20 = u13;
            local v21;

            if v20 == nil then
                v21 = v20;
            else
                local function _(p22) -- Line: 59
                    -- upvalues: u12 (ref)
                    local v23 = {
                        armorTrimType = p22.trim
                    };
                    local v24 = u12;

                    if v24 then
                        local v25 = u12;

                        if v25 ~= nil then
                            v25 = v25.type;
                        end;

                        v24 = v25 == p22.trim;
                    end;

                    v23.state = v24 and "EQUIPPED" or "OWNED";

                    return v23;
                end;

                v21 = table.create(#v20);

                for i, v in v20 do
                    local _ = i - 1;
                    local v26 = {
                        armorTrimType = v.trim
                    };
                    local v27 = u12;

                    if v27 then
                        local v28 = u12;

                        if v28 ~= nil then
                            v28 = v28.type;
                        end;

                        v27 = v28 == v.trim;
                    end;

                    v26.state = v27 and "EQUIPPED" or "OWNED";
                    v21[i] = v26;
                end;
            end;

            local v29 = v21 == nil and {} or v21;

            if #ArmorTrimUtil.getUnlockableArmorTrims(u13 or {}, ArmorTrimPackType.ALL_RANDOM) ~= 0 then
                local v30 = u13 == nil;

                if not v30 then
                    v30 = u13;

                    if v30 ~= nil then
                        local function _(p31) -- Line: 93
                            -- upvalues: ArmorTrimProgressUtil (ref)
                            return ArmorTrimProgressUtil.isNextArmorTrimUnlockable(p31.xpEarned);
                        end;

                        v30 = true;

                        for i, v in v30 do
                            local _ = i - 1;

                            if not ArmorTrimProgressUtil.isNextArmorTrimUnlockable(v.xpEarned) then
                                v30 = false;
                                break;
                            end;
                        end;
                    end;
                end;

                if v30 then
                    table.insert(v29, {
                        state = "PURCHASE"
                    });
                else
                    table.insert(v29, {
                        state = "LOCKED"
                    });
                end;
            end;

            u11(v29);
        end, { u6.store.ArmorTrim });
        useEffect(function() -- Line: 121
            -- upvalues: u19 (copy), u3 (ref), u9 (copy)
            local u32 = u19:getValue();

            if not u32 then
                return nil;
            end;

            local u33 = u3.new();
            u33:GiveTask(task.spawn(function() -- Line: 127
                -- upvalues: u32 (copy), u9 (ref)
                local v34 = 0;

                while u32.AbsoluteSize.X <= 0 do
                    v34 = v34 + 1;
                    local v35 = task.wait(0.1);

                    if v35 ~= 0 and (v35 == v35 and v35) then
                        v35 = v34 <= 10;
                    end;

                    if v35 == 0 or (v35 ~= v35 or not v35) then
                        break;
                    end;
                end;

                u9(u32.AbsoluteSize.X);
            end));

            return function() -- Line: 143
                -- upvalues: u33 (copy)
                u33:DoCleaning();
            end;
        end, {});
        local ViewAll = u6.ViewAll;

        if ViewAll then
            local v36 = {
                Size = UDim2.fromScale(1, 0.75)
            };
            local v37 = { u4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 20)
                }) };
            local _ = #v37;
            local v38 = u2.entries(ArmorTrimMeta);

            local function v46(p39) -- Line: 163
                -- upvalues: u10 (copy), armorTrimUnlockDefinition (ref), u4 (ref), u8 (copy), u6 (copy), ArmorTrimPreview (ref)
                local v40 = p39[2];
                local u41 = p39[1];

                local function _(p42) -- Line: 166
                    -- upvalues: u41 (copy)
                    return p42.armorTrimType == u41;
                end;

                local v43 = nil;

                for i, v in u10 do
                    local _ = i - 1;

                    if v.armorTrimType == u41 == true then
                        v43 = v;
                        break;
                    end;
                end;

                if v43 ~= nil then
                    v43 = v43.state;
                end;

                if not armorTrimUnlockDefinition[u41] then
                    return u4.createFragment();
                end;

                local v44 = {};
                local v45 = u8;
                v44.Size = UDim2.new(0, (v45 == nil and 600 or v45) / 4, 1, 0);
                v44.Name = v40.name;
                v44.ArmorTrimProgressData = u6.store.ArmorTrim.allKitProgress[u6.SelectedKit];
                v44.ArmorTrimType = u41;
                v44.State = v43 or "LOCKED";

                return u4.createElement(ArmorTrimPreview, v44);
            end;

            local v47 = table.create(#v38);

            for i, v in v38 do
                v47[i] = v46(v, i - 1, v38);
            end;

            local v48 = {
                ScrollingFrameProps = {
                    ScrollBarThickness = 8,
                    Size = UDim2.fromScale(1, 0.9),
                    ScrollingDirection = Enum.ScrollingDirection.X
                }
            };
            local v49 = { u4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 20)
                }), u4.createElement(Empty, {
                    Size = UDim2.new(0, 10, 1, 0)
                }) };
            local v50 = #v49;

            for i, v in v47 do
                v49[v50 + i] = v;
            end;

            v37.ArmorTrimViewAllList = u4.createElement(AutoCanvasScrollingFrame, v48, v49);
            ViewAll = u4.createFragment({
                ArmorTrimViewAll = u4.createElement(Empty, v36, v37)
            });
        end;

        local v51 = {
            BorderSizePixel = 0,
            ZIndex = -10,
            Size = UDim2.fromScale(1, 0.91),
            BackgroundColor3 = Theme.backgroundTertiary
        };
        local v52 = {};
        local v53 = #v52;

        if ViewAll then
            v52[v53 + 1] = ViewAll;
        end;

        local v54 = #v52;
        local v55 = not u6.ViewAll;

        if v55 then
            local v56 = {
                Size = UDim2.fromScale(1, 0.75)
            };
            local v57 = {};
            local _ = #v57;
            local v58 = {
                [u4.Ref] = u19,
                Size = UDim2.fromScale(1, 1),
                ScrollingDirection = Enum.ScrollingDirection.X,
                ScrollBarThickness = 8,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                CanvasSize = UDim2.new(0, (u8 == nil and 600 or u8) / 4 * #u10, 1, 0),
                BackgroundTransparency = 1
            };

            local function v77(u59) -- Line: 265
                -- upvalues: u13 (copy), ArmorTrimProgressUtil (ref), u2 (ref), ArmorTrimEffectRank (ref), u8 (copy), u6 (copy), u12 (copy), DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION (ref), Theme (ref), u18 (copy), u4 (ref), ArmorTrimViewportSelectionWrapper (ref), Empty (ref)
                local v60 = u13;

                if v60 ~= nil then
                    local function _(p61) -- Line: 268
                        -- upvalues: u59 (copy)
                        return p61.trim == u59.armorTrimType;
                    end;

                    v60 = nil;

                    for i, v in v60 do
                        local _ = i - 1;

                        if v.trim == u59.armorTrimType == true then
                            v60 = v;
                            break;
                        end;
                    end;
                end;

                local v62;

                if v60 == nil then
                    v62 = v60;
                else
                    v62 = v60.xpEarned;
                end;

                local v63 = ArmorTrimProgressUtil.getTier(v62 == nil and 0 or v62);
                local v64 = u2.values(ArmorTrimEffectRank);
                table.sort(v64, function(p65, p66) -- Line: 294
                    return p65 < p66;
                end);
                local v67 = v64[math.min(#v64 - 1, v63) + 1];
                local v68 = {};
                local v69 = u8;
                v68.Size = UDim2.new(0, (v69 == nil and 600 or v69) / 4, 1, 0);
                local v70 = {};
                local _ = #v70;
                local v71 = {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = -1,
                    SelectedKit = u6.SelectedKit,
                    ArmorTrimType = u59.armorTrimType,
                    ArmorTrimEffectRank = v67,
                    SelectionState = u59.state
                };
                local v72 = u12;

                if v72 then
                    local v73 = u12;

                    if v73 ~= nil then
                        v73 = v73.type;
                    end;

                    v72 = v73 == u59.armorTrimType;
                end;

                v71.ButtonMode = v72 and "ALWAYS_VISIBLE" or "ON_HOVER";
                local v74 = {};
                local v75 = u12;

                if v75 ~= nil then
                    v75 = v75.color;
                end;

                local v76;

                if v75 then
                    v76 = Color3.new(u12.color.r, u12.color.g, u12.color.b);
                else
                    v76 = nil;
                end;

                v74.armorTrimColor = v76;
                v74.armorSet = DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION.armorSet;
                v74.displayMode = DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION.displayMode;
                v71.StartingSelection = v74;
                v71.ViewportProps = {
                    BackgroundTransparency = 0.5,
                    BackgroundColor3 = Theme.backgroundPrimary
                };

                if v60 ~= nil then
                    v60 = v60.xpEarned;
                end;

                if v60 == nil then
                    v60 = u18;
                end;

                v71.xp = v60;
                v70.ViewportCard = u4.createElement(ArmorTrimViewportSelectionWrapper, v71);

                return u4.createElement(Empty, v68, v70);
            end;

            local v78 = table.create(#u10);

            for i, v in u10 do
                v78[i] = v77(v, i - 1, u10);
            end;

            local v79 = { u4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), u4.createElement(Padding, {
                    Padding = {
                        Bottom = 8
                    }
                }) };
            local v80 = #v79;

            for i, v in v78 do
                v79[v80 + i] = v;
            end;

            v57.ArmorTrimSelectionList = u4.createElement("ScrollingFrame", v58, v79);
            v55 = u4.createFragment({
                ArmorTrimSelection = u4.createElement(Empty, v56, v57)
            });
        end;

        if v55 then
            v52[v54 + 1] = v55;
        end;

        local v81 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 0.25),
            Position = UDim2.fromScale(0, 0.75)
        };
        local v82 = {};
        local v83 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v84 = { u4.createElement("TextLabel", {
                Text = "Armor Effect Progress",
                BackgroundTransparency = 1,
                TextScaled = true,
                ZIndex = 2,
                Size = UDim2.fromScale(1, 0.2),
                Position = UDim2.fromScale(0.5, 0.1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.SourceSansBold,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center
            }) };
        local v85 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v86;

        if v14 == nil then
            v86 = v14;
        else
            v86 = v14.xpEarned;
        end;

        v85.unlocked = v86 ~= nil;
        local v87;

        if v14 == nil then
            v87 = v14;
        else
            v87 = v14.xpEarned;
        end;

        if v87 == nil then
            v87 = u18 == nil and 0 or u18;
        end;

        v85.xp = v87;

        if v14 ~= nil then
            v14 = v14.trim;
        end;

        v85.ArmorTrimType = v14;
        v85.SelectedKit = u6.SelectedKit;
        v84[#v84 + 1] = u4.createElement(ArmorTrimProgressBar, v85);
        v82[#v82 + 1] = u4.createElement(Empty, v83, v84);
        v52[#v52 + 1] = u4.createElement("Frame", v81, v82);

        return u4.createElement("Frame", v51, v52);
    end)
};