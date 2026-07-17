-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local RewardShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent, "global", "reward", "ui", "reward-showcase").RewardShowcase;
local getItemSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local BadgeType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType;
local LockerItemCategory = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-item-types").LockerItemCategory;
local CrateItemRarity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity").CrateItemRarity;
local getCrateItemRarityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity-meta").getCrateItemRarityMeta;
local LockerUtil = RuntimeLib.import(script, script.Parent.Parent, "locker", "ui", "locker-util").LockerUtil;
local v55 = v3.new(u2)(function(u5, p6) -- Line: 20
    -- upvalues: u2 (copy), getItemSkinMeta (copy), getItemMeta (copy), UserInputService (copy), UIUtil (copy), RewardShowcase (copy), CrateItemRarity (copy), getCrateItemRarityMeta (copy), LockerItemCategory (copy), Padding (copy), BadgeType (copy), DeviceUtil (copy), Empty (copy)
    local useState = p6.useState;
    local useEffect = p6.useEffect;
    local u7 = u2.createRef();
    local v8, u9 = useState("");
    useEffect(function() -- Line: 25
        -- upvalues: u5 (copy), getItemSkinMeta (ref), getItemMeta (ref), u9 (copy)
        if not u5.BaseItemSkinType then
            if u5.LockerCategory then
                u9(not u5.SelectedLockerItem and "" or u5.SelectedLockerItem.imageId);
            end;

            return;
        end;

        local v10;

        if u5.ItemSkinType then
            local renderImage = getItemSkinMeta(u5.ItemSkinType).renderImage;
            v10 = renderImage == nil and "" or renderImage;
        else
            local image = getItemMeta(u5.BaseItemSkinType).image;
            v10 = image == nil and "" or image;
        end;

        u9(v10);
    end, { u5.ItemSkinType, u5.SelectedLockerItem });
    useEffect(function() -- Line: 46
        -- upvalues: u5 (copy), UserInputService (ref), UIUtil (ref), u7 (copy)
        if u5.GamepadShouldAutoSelect and UserInputService.GamepadEnabled then
            UIUtil:selectGui(u7:getValue());
        end;
    end, {});

    local function v12(p11) -- Line: 51
        -- upvalues: u2 (ref), RewardShowcase (ref)
        return u2.createElement(RewardShowcase, {
            Reward = p11.Reward,
            Size = p11.Size or UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        });
    end;

    local function _() -- Line: 59
        -- upvalues: u5 (copy)
        local OnClick = u5.OnClick;

        if OnClick ~= nil then
            OnClick();
        end;
    end;

    local ItemSkinType = u5.ItemSkinType;

    if ItemSkinType then
        local v13 = {
            Size = UDim2.fromScale(1, 0.04),
            Position = UDim2.fromScale(0, 1),
            AnchorPoint = Vector2.new(0, 1)
        };
        local rarity = getItemSkinMeta(u5.ItemSkinType).rarity;

        if rarity == nil then
            rarity = CrateItemRarity.ONE_STAR;
        end;

        v13.BackgroundColor3 = getCrateItemRarityMeta(rarity).gradient.colorTop;
        v13.BorderSizePixel = 0;
        ItemSkinType = u2.createFragment({
            RarityIndicator = u2.createElement("Frame", v13, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 12)
                }) })
        });
    end;

    local v14 = {
        Size = u5.Size or UDim2.fromScale(0.25, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.85,
        BorderSizePixel = 0,

        [u2.Event.Activated] = function() -- Line: 91
            -- upvalues: u5 (copy)
            local OnClick = u5.OnClick;

            if OnClick ~= nil then
                OnClick();
            end;
        end,

        [u2.Ref] = u7
    };
    local v15 = { u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        }), u2.createElement("UIGradient", {
            Rotation = -90,
            Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(96, 96, 96)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)) }),
            Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
        }) };
    local v16 = #v15;

    if ItemSkinType then
        v15[v16 + 1] = ItemSkinType;
    end;

    local v17 = #v15;
    local v18 = u5.LockerCategory == LockerItemCategory.TITLE;

    if v18 then
        v18 = u5.SelectedLockerItem;

        if v18 ~= nil then
            v18 = v18.itemEnum;
        end;

        if v18 then
            local v19 = {};
            local v20 = {};
            local SelectedLockerItem = u5.SelectedLockerItem;

            if SelectedLockerItem ~= nil then
                SelectedLockerItem = SelectedLockerItem.itemEnum;
            end;

            v20.title = SelectedLockerItem;
            v19.Reward = v20;
            v18 = u2.createElement(v12, v19);
        end;
    end;

    local v21 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v22 = { u2.createElement(Padding, {
            Padding = UDim.new(0.1, 0)
        }) };
    local v23 = #v22;

    if v18 then
        v22[v23 + 1] = v18;
    end;

    local v24 = #v22;
    local v25 = u5.LockerCategory == LockerItemCategory.KILL_EFFECT;

    if v25 then
        v25 = u5.SelectedLockerItem;

        if v25 ~= nil then
            v25 = v25.itemEnum;
        end;

        if v25 then
            local v26 = {};
            local v27 = {};
            local SelectedLockerItem = u5.SelectedLockerItem;

            if SelectedLockerItem ~= nil then
                SelectedLockerItem = SelectedLockerItem.itemEnum;
            end;

            v27.killEffect = SelectedLockerItem;
            v26.Reward = v27;
            v26.Size = UDim2.fromScale(1.35, 1.35);
            v25 = u2.createElement(v12, v26);
        end;
    end;

    if v25 then
        v22[v24 + 1] = v25;
    end;

    local v28 = #v22;
    local v29 = u5.LockerCategory == LockerItemCategory.WIN_EFFECT;

    if v29 then
        v29 = u5.SelectedLockerItem;

        if v29 ~= nil then
            v29 = v29.itemEnum;
        end;

        if v29 then
            local v30 = {};
            local v31 = {};
            local SelectedLockerItem = u5.SelectedLockerItem;

            if SelectedLockerItem ~= nil then
                SelectedLockerItem = SelectedLockerItem.itemEnum;
            end;

            v31.winEffect = SelectedLockerItem;
            v30.Reward = v31;
            v30.Size = UDim2.fromScale(1.35, 1.35);
            v29 = u2.createElement(v12, v30);
        end;
    end;

    if v29 then
        v22[v28 + 1] = v29;
    end;

    local v32 = #v22;
    local v33 = u5.LockerCategory == LockerItemCategory.BED_SKIN;

    if v33 then
        v33 = u5.SelectedLockerItem;

        if v33 ~= nil then
            v33 = v33.itemEnum;
        end;

        if v33 then
            local v34 = {};
            local v35 = {};
            local SelectedLockerItem = u5.SelectedLockerItem;

            if SelectedLockerItem ~= nil then
                SelectedLockerItem = SelectedLockerItem.itemEnum;
            end;

            v35.bedSkin = SelectedLockerItem;
            v34.Reward = v35;
            v34.Size = UDim2.fromScale(1.35, 1.35);
            v33 = u2.createElement(v12, v34);
        end;
    end;

    if v33 then
        v22[v32 + 1] = v33;
    end;

    local v36 = #v22;
    local v37 = u5.LockerCategory == LockerItemCategory.BED_BREAK_EFFECT;

    if v37 then
        v37 = u5.SelectedLockerItem;

        if v37 ~= nil then
            v37 = v37.itemEnum;
        end;

        if v37 then
            local v38 = {};
            local v39 = {};
            local SelectedLockerItem = u5.SelectedLockerItem;

            if SelectedLockerItem ~= nil then
                SelectedLockerItem = SelectedLockerItem.itemEnum;
            end;

            v39.bedBreakEffect = SelectedLockerItem;
            v38.Reward = v39;
            v38.Size = UDim2.fromScale(1.35, 1.35);
            v37 = u2.createElement(v12, v38);
        end;
    end;

    if v37 then
        v22[v36 + 1] = v37;
    end;

    local v40 = #v22;
    local v41 = u5.LockerCategory == LockerItemCategory.LOBBY_GADGET;

    if v41 then
        v41 = u5.SelectedLockerItem;

        if v41 ~= nil then
            v41 = v41.itemEnum;
        end;

        if v41 then
            local v42 = {};
            local v43 = {};
            local SelectedLockerItem = u5.SelectedLockerItem;

            if SelectedLockerItem ~= nil then
                SelectedLockerItem = SelectedLockerItem.itemEnum;
            end;

            v43.lobbyGadget = SelectedLockerItem;
            v42.Reward = v43;
            v42.Size = UDim2.fromScale(1.3, 1.3);
            v41 = u2.createElement(v12, v42);
        end;
    end;

    if v41 then
        v22[v40 + 1] = v41;
    end;

    local v44 = #v22;
    local v45 = u5.LockerCategory == LockerItemCategory.BADGE;

    if v45 then
        local SelectedLockerItem = u5.SelectedLockerItem;

        if SelectedLockerItem ~= nil then
            SelectedLockerItem = SelectedLockerItem.itemEnum;
        end;

        v45 = SelectedLockerItem ~= BadgeType.NONE;

        if v45 then
            local v46 = {};
            local v47 = {};
            local SelectedLockerItem2 = u5.SelectedLockerItem;

            if SelectedLockerItem2 ~= nil then
                SelectedLockerItem2 = SelectedLockerItem2.itemEnum;
            end;

            v47.achievement = SelectedLockerItem2;
            v46.Reward = v47;
            v46.Size = UDim2.fromScale(1.1, 1.1);
            v45 = u2.createElement(v12, v46);
        end;
    end;

    if v45 then
        v22[v44 + 1] = v45;
    end;

    local v48 = #v22;
    local SelectedLockerItem = u5.SelectedLockerItem;

    if SelectedLockerItem ~= nil then
        SelectedLockerItem = SelectedLockerItem.itemEnum;
    end;

    local v49 = SelectedLockerItem == nil;

    if v49 then
        if u5.BaseItemSkinType == nil then
            v49 = u2.createFragment({
                DefaultLockerItem = u2.createElement("TextLabel", {
                    Text = "NONE",
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.75, 0.75),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) })
            });
        else
            v49 = false;
        end;
    end;

    if v49 then
        v22[v48 + 1] = v49;
    end;

    local v50;

    if u5.ItemSkinType and u5.BaseItemSkinType then
        local createElement = u2.createElement;
        local v51 = {};
        local v52 = {};
        local v53;

        if DeviceUtil.isHoarceKat() then
            v53 = nil;
        else
            v53 = u5.ItemSkinType;
        end;

        v52.itemSkin = v53;
        v51.Reward = v52;
        v50 = createElement(v12, v51);
    elseif u5.ItemSkinType == nil and u5.BaseItemSkinType then
        v50 = u2.createFragment({
            DefaultItemFrame = u2.createElement("ImageLabel", {
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Image = v8,
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) })
        });
    else
        v50 = u2.createFragment();
    end;

    v22[#v22 + 1] = v50;
    v15.Content = u2.createElement(Empty, v21, v22);
    local v54 = u5[u2.Children];

    if v54 then
        for i, v in v54 do
            if type(i) == "number" then
                v15[v17 + i] = v;
            else
                v15[i] = v;
            end;
        end;
    end;

    return u2.createFragment({
        CollectionItemFrame = u2.createElement("ImageButton", v14, v15)
    });
end);

return {
    CollectionItemFrame = v4.connect(function(p56, p57) -- Line: 355
        -- upvalues: LockerUtil (copy)
        if p57.BaseItemSkinType then
            local v58 = {};

            for i, v in p57 do
                v58[i] = v;
            end;

            v58.ItemSkinType = p56.Locker.selectedItemSkins[p57.BaseItemSkinType];

            return v58;
        end;

        if not p57.LockerCategory then
            local v59 = {};

            for i, v in p57 do
                v59[i] = v;
            end;

            return v59;
        end;

        local v60 = {};

        for i, v in p57 do
            v60[i] = v;
        end;

        v60.SelectedLockerItem = LockerUtil.getEquippedLockerCosmeticDisplay(p57.LockerCategory, p56.Locker);

        return v60;
    end)(v55)
};