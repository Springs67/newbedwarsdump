-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Checkbox = v1.Checkbox;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local ElementGrid = v1.ElementGrid;
local Empty = v1.Empty;
local GridElement = v1.GridElement;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local EmoteShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "battle-pass", "ui", "RewardShowcase", "emote-showcase").EmoteShowcase;
local u4 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "screen-space");
local AutoCompleteSearchbar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local LockerTab = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local LockerConstants = RuntimeLib.import(script, script.Parent.Parent.Parent, "locker-constants").LockerConstants;

return {
    LockerEmoteItemsGrid = v3.new(u2)(function(u5, p6) -- Line: 20
        -- upvalues: DeviceUtil (copy), LockerConstants (copy), u4 (copy), LockerTab (copy), EmoteMeta (copy), ColorUtil (copy), SoundManager (copy), GameSound (copy), u2 (copy), EmoteShowcase (copy), GridElement (copy), ElementGrid (copy), Checkbox (copy), AutoCompleteSearchbar (copy), Empty (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local useMemo = p6.useMemo;
        local u7, u8 = useState(u5.Elements);
        local u9, u10 = useState(u5.Elements);
        local v11, u12 = useState("");
        local u13, u14 = useState(false);
        useEffect(function() -- Line: 32
            -- upvalues: u8 (copy), u5 (copy), u12 (copy)
            u8(u5.Elements);
            u12("");
        end, { u5.Elements });
        local v15;

        if DeviceUtil.isSmallScreen() then
            v15 = LockerConstants.SEARCH_BAR_HEIGHT_SMALL;
        else
            v15 = LockerConstants.SEARCH_BAR_HEIGHT;
        end;

        local u16 = {};
        local v34 = useMemo(function() -- Line: 38
            -- upvalues: u7 (copy), u16 (ref), u5 (copy), DeviceUtil (ref), u4 (ref), LockerTab (ref), EmoteMeta (ref), ColorUtil (ref), LockerConstants (ref), SoundManager (ref), GameSound (ref), u2 (ref), EmoteShowcase (ref), GridElement (ref), ElementGrid (ref)
            local function _(p17) -- Line: 39
                return {
                    id = p17.itemEnum,
                    imageId = p17.imageId,
                    alt = p17.name
                };
            end;

            local v18 = table.create(#u7);

            for i, v in u7 do
                local _ = i - 1;
                v18[i] = {
                    id = v.itemEnum,
                    imageId = v.imageId,
                    alt = v.name
                };
            end;

            u16 = v18;
            local Elements = u5.Elements;

            if Elements ~= nil then
                local function _(p19) -- Line: 55
                    -- upvalues: u5 (ref)
                    local EquippedElement = u5.EquippedElement;

                    if EquippedElement ~= nil then
                        EquippedElement = EquippedElement.itemEnum;
                    end;

                    return p19.itemEnum == EquippedElement;
                end;

                Elements = -1;

                for i, v in Elements do
                    local _ = i - 1;
                    local EquippedElement = u5.EquippedElement;

                    if EquippedElement ~= nil then
                        EquippedElement = EquippedElement.itemEnum;
                    end;

                    if v.itemEnum == EquippedElement == true then
                        Elements = i - 1;
                        break;
                    end;
                end;
            end;

            local v20 = {
                ElementSize = UDim2.new(0.187, 0, 0, 120),
                DefaultElement = Elements,
                ScrollingFrameProps = {
                    ScrollBarThickness = 2,
                    Size = UDim2.new(1, 0, 1, -40),
                    Position = UDim2.fromOffset(0, 45),
                    ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
                    VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
                },
                UIPaddingProps = {
                    PaddingRight = UDim.new(0, 0),
                    PaddingLeft = UDim.new(0, 10),
                    PaddingTop = UDim.new(0, 2),
                    PaddingBottom = UDim.new(0, 60)
                },
                UIGridLayoutProps = {
                    CellSize = UDim2.new(DeviceUtil.isSmallScreen() and 0.33 or 0.25, 0, 0, DeviceUtil.isSmallScreen() and 70 or u4.ViewSizeX() * 0.54 / 5.5) - UDim2.fromOffset(7, 0)
                }
            };
            local v21 = u16;

            local function v30(u22, p23) -- Line: 99
                -- upvalues: u5 (ref), LockerTab (ref), EmoteMeta (ref), Elements (copy), ColorUtil (ref), DeviceUtil (ref), LockerConstants (ref), SoundManager (ref), GameSound (ref), u2 (ref), EmoteShowcase (ref), GridElement (ref)
                local v24;

                if u5.Tab == LockerTab.EMOTES then
                    v24 = EmoteMeta[u22.id];

                    if v24 then
                        v24 = v24.animation ~= nil;
                    end;
                else
                    v24 = false;
                end;

                local v25 = {
                    Index = p23,
                    CurrentIndex = Elements,
                    Image = u22.imageId
                };
                local v26 = {
                    TextStrokeTransparency = 0.5,
                    Text = u22.alt,
                    TextStrokeColor3 = ColorUtil.BLACK
                };
                local v27;

                if DeviceUtil.isSmallScreen() then
                    v27 = LockerConstants.ELEMENT_TEXT_SIZE_SMALL;
                else
                    v27 = LockerConstants.ELEMENT_TEXT_SIZE;
                end;

                v26.TextSize = v27;
                v25.TextElement = v26;

                function v25.OnClick() -- Line: 115
                    -- upvalues: u22 (copy), u5 (ref), SoundManager (ref), GameSound (ref)
                    local id = u22.id;

                    if id ~= "" and id then
                        local EquippedElement = u5.EquippedElement;

                        if EquippedElement ~= nil then
                            EquippedElement = EquippedElement.itemEnum;
                        end;

                        if EquippedElement == u22.id then
                            return nil;
                        end;

                        u5.OnSelectionChange(u22.id, u5.SelectedSlot);
                        SoundManager:playSound(GameSound.ARMOR_EQUIP);
                    end;
                end;

                local v28 = {};
                local v29 = #v28;

                if v24 then
                    v24 = u2.createElement(EmoteShowcase, {
                        Emote = u22.id
                    });
                end;

                if v24 then
                    v28[v29 + 1] = v24;
                end;

                return u2.createElement(GridElement, v25, v28);
            end;

            local v31 = table.create(#v21);

            for i, v in v21 do
                v31[i] = v30(v, i - 1, v21);
            end;

            local v32 = {};
            local v33 = #v32;

            for i, v in v31 do
                v32[v33 + i] = v;
            end;

            return u2.createFragment({
                [u5.Tab .. "List"] = u2.createElement(ElementGrid, v20, v32)
            });
        end, { u7, u5.SelectedSlot });

        local function u41(p35, p36) -- Line: 155
            -- upvalues: u5 (copy), u9 (copy), u13 (copy), EmoteMeta (ref)
            local v37;

            if p35 == nil then
                v37 = p35;
            else
                v37 = #p35 == 0;
            end;

            local v38;

            if v37 or p35 == nil then
                v38 = u5.Elements;
            else
                v38 = p35 or u9;
            end;

            if p36 ~= nil then
                p36 = p36.animatedEmotesOnly;
            end;

            if p36 == nil then
                p36 = u13;
            end;

            if p36 then
                local function _(p39) -- Line: 181
                    -- upvalues: EmoteMeta (ref)
                    return EmoteMeta[p39.itemEnum].animation ~= nil;
                end;

                local v40 = 0;
                v38 = {};

                for i, v in v38 do
                    local _ = i - 1;

                    if EmoteMeta[v.itemEnum].animation ~= nil == true then
                        v40 = v40 + 1;
                        v38[v40] = v;
                    end;
                end;
            end;

            return v38;
        end;

        local v42 = {
            BackgroundTransparency = 1,
            ClipsDescendants = true,
            Size = u5.Size or UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            LayoutOrder = u5.LayoutOrder
        };
        local v43 = { u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 14)
            }), u2.createElement("UISizeConstraint", {
                MinSize = u5.MinSize,
                MaxSize = u5.MaxSize
            }) };
        local v44 = #v43;
        local v45 = {
            Size = UDim2.new(1, 0, 0, v15)
        };
        local v47 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Right",
                VerticalAlignment = "Center",
                Padding = UDim.new(0.1, 0)
            }), u2.createElement(Checkbox, {
                Text = "<b>Animated</b>",
                AspectRatio = 4.866666666666666,
                Value = u13,

                SetValue = function(p46) -- Line: 229, Name: SetValue
                    -- upvalues: u14 (copy), u41 (copy), u9 (copy), u8 (copy)
                    u14(p46);
                    u8((u41(u9, {
                        animatedEmotesOnly = p46
                    })));
                end,

                Size = UDim2.new(0.33, 0, 0.9, 0),
                BoxColor = Color3.fromRGB(23, 23, 23)
            }) };
        local v48 = {
            Size = UDim2.new(0.55, 0, 1, 0)
        };
        local Elements = u5.Elements;

        local function _(p49, p50) -- Line: 246
            local name = p50.name;

            if name ~= "" and name then
                table.insert(p49, {
                    key = name
                });
            end;

            return p49;
        end;

        local v51 = {};

        for i = 1, #Elements do
            local _ = i - 1;
            local name = Elements[i].name;

            if name ~= "" and name then
                table.insert(v51, {
                    key = name
                });
            end;
        end;

        v48.Items = v51;
        v48.InputText = v11;

        function v48.OnTextChange(p52, u53) -- Line: 266
            -- upvalues: u5 (copy), u10 (copy), u41 (copy), u8 (copy), u12 (copy)
            local function _(p54, p55) -- Line: 268
                -- upvalues: u53 (copy)
                return table.find(u53, p54.name) ~= nil;
            end;

            local v56 = 0;
            local v57 = {};

            for i, v in u5.Elements do
                local _ = i - 1;

                if table.find(u53, v.name) ~= nil == true then
                    v56 = v56 + 1;
                    v57[v56] = v;
                end;
            end;

            u10(v57);
            u8((u41(v57)));
            u12(p52);
        end;

        local v58;

        if #u16 == 0 then
            if u13 then
                v58 = #u5.Elements;
            else
                v58 = #u5.Elements - 1;
            end;
        elseif u13 then
            v58 = #u16;
        else
            v58 = #u16 - 1;
        end;

        v48.PlaceHolderText = "Search " .. tostring(v58) .. " " .. u5.Tab;
        v48.MaxCharLength = 30;
        v48.LayoutOrder = 2;
        v48.BarColor = ColorUtil.BLACK;
        v48.BarTransparency = 0.5;
        v47[#v47 + 1] = u2.createElement(AutoCompleteSearchbar, v48);
        v43[v44 + 1] = u2.createElement(Empty, v45, v47);
        v43[v44 + 2] = v34;

        return u2.createFragment({
            Items = u2.createElement("Frame", v42, v43)
        });
    end)
};