-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local RewardShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-showcase").RewardShowcase;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta");
local getItemSkinMeta = v5.getItemSkinMeta;
local getItemSkins = v5.getItemSkins;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ItemSkinSelectorFrame = RuntimeLib.import(script, script.Parent, "item-skin-selector-frame").ItemSkinSelectorFrame;
local v44 = v3.new(u2)(function(u6, p7) -- Line: 25
    -- upvalues: getItemMeta (copy), getItemSkinMeta (copy), DeviceUtil (copy), ClientStore (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), u2 (copy), getItemSkins (copy), ItemSkinSelectorFrame (copy), ColorUtil (copy), AutoCanvasScrollingFrame (copy), Empty (copy), RewardShowcase (copy), BedwarsImageId (copy), ButtonComponent (copy), Theme (copy), Padding (copy)
    local _ = p7.useEffect;
    local u8, u9 = p7.useState(u6.EquippedItemSkinType);
    local v10 = getItemMeta(u6.BaseItemSkinType);
    local v11;

    if u8 then
        v11 = getItemSkinMeta(u8).name;
    else
        v11 = v10.displayName;
    end;

    local v12;

    if u8 then
        v12 = getItemSkinMeta(u8).renderImage;
    else
        v12 = v10.image;
    end;

    local OwnedItemSkins = u6.OwnedItemSkins;

    local function _(p13) -- Line: 36
        return p13.skin;
    end;

    local v14 = table.create(#OwnedItemSkins);
    local u15 = {};

    for i, v in OwnedItemSkins do
        local _ = i - 1;
        v14[i] = v.skin;
    end;

    for _, v in v14 do
        u15[v] = true;
    end;

    local v16 = u6.EquippedItemSkinType == u8;

    local function u17() -- Line: 53
        -- upvalues: DeviceUtil (ref), ClientStore (ref), u6 (copy), u8 (copy), SoundManager (ref), GameSound (ref), KnitClient (ref)
        if not DeviceUtil.isHoarceKat() then
            if KnitClient.Controllers.LockerController:setItemSkin(u6.BaseItemSkinType, u8) then
                SoundManager:playSound(GameSound.EQUIP_DEFAULT);
            end;

            return;
        end;

        ClientStore:dispatch({
            type = "LockerSetItemSkin",
            itemType = u6.BaseItemSkinType,
            itemSkin = u8
        });
        SoundManager:playSound(GameSound.EQUIP_DEFAULT);
    end;

    local v18 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v19 = {};
    local v20 = {
        Size = UDim2.fromScale(0.3, 1)
    };
    local v21 = { u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 8)
        }) };
    local _ = #v21;
    local v22 = getItemSkins(u6.BaseItemSkinType);
    local v23;

    if v22 == nil then
        v23 = v22;
    else
        table.sort(v22, function(p24, p25) -- Line: 86
            -- upvalues: u15 (copy)
            local v26 = u15[p24] ~= nil;
            local v27 = u15[p25] ~= nil;

            if v26 == v27 then
                return false;
            end;

            if v26 then
                v26 = not v27;
            end;

            return v26;
        end);

        local function v29(p28) -- Line: 99
            -- upvalues: getItemSkinMeta (ref), u6 (copy), u8 (copy), u9 (copy), u15 (copy), u2 (ref), ItemSkinSelectorFrame (ref)
            if getItemSkinMeta(p28).kitSkinOnly then
                return nil;
            end;

            return u2.createElement(ItemSkinSelectorFrame, {
                ItemSkinType = p28,
                BaseItemSkinType = u6.BaseItemSkinType,
                SelectedItemSkin = u8,
                SetSelectedItemSkin = u9,
                EquipedItemSkin = u6.EquippedItemSkinType,
                IsOwned = u15[p28] ~= nil
            });
        end;

        local v30 = 0;
        v23 = {};

        for i, v in v22 do
            local v31 = v29(v, i - 1, v22);

            if v31 ~= nil then
                v30 = v30 + 1;
                v23[v30] = v31;
            end;
        end;
    end;

    local v32 = {
        ScrollingFrameProps = {
            ScrollBarThickness = 4,
            ScrollBarImageTransparency = 0.3,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.9),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ScrollingDirection = Enum.ScrollingDirection.Y,
            ScrollBarImageColor3 = ColorUtil.WHITE
        }
    };
    local v33 = { u2.createElement("UIGridLayout", {
            FillDirectionMaxCells = 3,
            VerticalAlignment = "Top",
            HorizontalAlignment = "Left",
            CellSize = UDim2.fromScale(0.31, 0.33),
            CellPadding = UDim2.new(0.01, 0, 0.01, 0)
        }), u2.createElement(ItemSkinSelectorFrame, {
            ItemSkinType = nil,
            IsOwned = true,
            GamepadShouldAutoSelect = true,
            BaseItemSkinType = u6.BaseItemSkinType,
            SelectedItemSkin = u8,
            SetSelectedItemSkin = u9,
            EquipedItemSkin = u6.EquippedItemSkinType
        }) };
    local v34 = #v33;

    if v23 then
        for i, v in v23 do
            v33[v34 + i] = v;
        end;
    end;

    v21.List = u2.createElement(AutoCanvasScrollingFrame, v32, v33);
    v19.SkinListContainer = u2.createElement(Empty, v20, v21);
    local v35 = {
        Size = UDim2.fromScale(0.4, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v36 = {};
    local v37 = {
        Size = UDim2.fromScale(0.8, 0.2),
        Position = UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0)
    };
    local v38 = {};
    local _ = #v38;
    local v39 = {
        Text = v11 == nil and "" or v11,
        TextScaled = true,
        FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = "Center",
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1
    };
    v38.Title = u2.createElement("TextLabel", v39);
    v36.TitleContainer = u2.createElement(Empty, v37, v38);
    local v40;

    if DeviceUtil.isHoarceKat() or not u8 then
        local v41 = {};

        if v12 == nil then
            v12 = BedwarsImageId.RANDOM_KIT_RENDER;
        end;

        v41.Image = v12;
        v41.Size = UDim2.fromScale(0.7, 0.7);
        v41.Position = UDim2.fromScale(0.5, 0.5);
        v41.AnchorPoint = Vector2.new(0.5, 0.5);
        v41.BackgroundTransparency = 1;
        v40 = u2.createFragment({
            DefaultSkin = u2.createElement("ImageLabel", v41, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) })
        });
    else
        v40 = u2.createElement(RewardShowcase, {
            Reward = {
                itemSkin = u8
            }
        });
    end;

    v36[#v36 + 1] = v40;
    v19.DisplayContainer = u2.createElement(Empty, v35, v36);
    local createElement = u2.createElement;
    local v42 = {
        TextScaled = true,
        Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 0.15 or 0.12),
        Position = UDim2.fromScale(1, 0.9),
        AnchorPoint = Vector2.new(1, 1),

        OnClick = function() -- Line: 228, Name: OnClick
            -- upvalues: u17 (copy)
            u17();
        end
    };
    local v43;

    if v16 then
        v43 = Color3.fromRGB(96, 96, 96);
    else
        v43 = ColorUtil.darken(Theme.mcGreen, 0.8);
    end;

    v42.BackgroundColor3 = v43;
    v42.Text = u15 and (v16 and "EQUIPPED" or "EQUIP") or "NOT OWNED";
    v42.Disabled = v16 or not u15;
    v19[#v19 + 1] = createElement(ButtonComponent, v42, { u2.createElement(Padding, {
            Padding = UDim.new(0.15, 0)
        }), u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 3.375
        }) });

    return u2.createFragment({
        Container = u2.createElement(Empty, v18, v19)
    });
end);

return {
    ItemSkinSelector = v4.connect(function(p45, u46) -- Line: 248
        -- upvalues: getItemSkinMeta (copy)
        local v47 = {};

        for i, v in u46 do
            v47[i] = v;
        end;

        local itemSkins = p45.Locker.itemSkins;

        if itemSkins ~= nil then
            local function _(p48) -- Line: 256
                -- upvalues: getItemSkinMeta (ref), u46 (copy)
                local v49 = getItemSkinMeta(p48);

                if v49.itemType == u46.BaseItemSkinType then
                    return {
                        skin = p48,
                        metadata = v49
                    };
                end;
            end;

            itemSkins = {};
            local v50 = 0;

            for i, v in itemSkins do
                local _ = i - 1;
                local v51 = getItemSkinMeta(v);
                local v52 = v51.itemType == u46.BaseItemSkinType and {
                    skin = v,
                    metadata = v51
                } or nil;

                if v52 ~= nil then
                    v50 = v50 + 1;
                    itemSkins[v50] = v52;
                end;
            end;
        end;

        v47.OwnedItemSkins = itemSkins == nil and {} or itemSkins;
        v47.EquippedItemSkinType = p45.Locker.selectedItemSkins[u46.BaseItemSkinType];

        return v47;
    end)(v44)
};