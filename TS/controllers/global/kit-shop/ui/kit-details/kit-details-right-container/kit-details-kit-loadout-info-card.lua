-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local DEFAULT_ENTITY_MAX_HEALTH = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity").DEFAULT_ENTITY_MAX_HEALTH;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local BedwarsShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local getBedwarsShopOverrides = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-override").getBedwarsShopOverrides;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local KitDetailsItemListContainer = RuntimeLib.import(script, script.Parent.Parent, "kit-details-item-list-container").KitDetailsItemListContainer;
local KitDetailsItemCard = RuntimeLib.import(script, script.Parent, "kit-details-item-card").KitDetailsItemCard;

return {
    KitDetailsKitLoadoutInfoCard = v3.new(u2)(function(u4, p5) -- Line: 18
        -- upvalues: getBedwarsKitMeta (copy), BedwarsShop (copy), getBedwarsShopOverrides (copy), Players (copy), AbilityMeta (copy), u2 (copy), ColorUtil (copy), BedwarsImageId (copy), KitDetailsItemListContainer (copy), getItemMeta (copy), Empty (copy), KitDetailsItemCard (copy), DEFAULT_ENTITY_MAX_HEALTH (copy)
        local useEffect = p5.useEffect;
        local useMemo = p5.useMemo;
        local u6, u7 = p5.useState(nil);
        local u8 = useMemo(function() -- Line: 23
            -- upvalues: getBedwarsKitMeta (ref), u4 (copy)
            return getBedwarsKitMeta(u4.SelectedKit);
        end, { u4.SelectedKit });
        local u17 = useMemo(function() -- Line: 26
            -- upvalues: u8 (copy), BedwarsShop (ref)
            local kitItems = u8.kitItems;
            local v9;

            if kitItems == nil then
                v9 = kitItems;
            else
                local function v15(u10) -- Line: 29
                    -- upvalues: BedwarsShop (ref)
                    local function _(p11) -- Line: 31
                        -- upvalues: u10 (copy)
                        return p11.itemType == u10.itemType;
                    end;

                    local v12 = nil;

                    for i, v in BedwarsShop.ShopItems do
                        local _ = i - 1;

                        if v.itemType == u10.itemType == true then
                            v12 = v;
                            break;
                        end;
                    end;

                    local v13 = u10.innateItem ~= nil;

                    if v13 then
                        v12 = v13;
                    else
                        local loadoutinfo = u10.loadoutinfo;

                        if loadoutinfo ~= nil then
                            loadoutinfo = loadoutinfo.reoccuringTimeSeconds;
                        end;

                        local v14 = loadoutinfo ~= nil;

                        if v14 then
                            v12 = v14;
                        else
                            if v12 ~= nil then
                                v12 = v12.disabled;
                            end;

                            if not v12 then
                                v12 = u10.loadoutinfo;

                                if v12 ~= nil then
                                    v12 = v12.startingItem;
                                end;
                            end;
                        end;
                    end;

                    return v12;
                end;

                local v16 = 0;
                v9 = {};

                for i, v in kitItems do
                    if v15(v, i - 1, kitItems) == true then
                        v16 = v16 + 1;
                        v9[v16] = v;
                    end;
                end;
            end;

            return v9 == nil and {} or v9;
        end, { u4.SelectedKit });
        local u33 = useMemo(function() -- Line: 86
            -- upvalues: u8 (copy), BedwarsShop (ref), getBedwarsShopOverrides (ref), u4 (copy), Players (ref)
            local kitItems = u8.kitItems;
            local v18;

            if kitItems == nil then
                v18 = kitItems;
            else
                local function v24(u19) -- Line: 89
                    -- upvalues: BedwarsShop (ref)
                    local function _(p20) -- Line: 91
                        -- upvalues: u19 (copy)
                        local v21 = p20.itemType == u19.itemType;

                        if v21 then
                            v21 = not p20.disabled;

                            if not v21 then
                                v21 = u19.loadoutinfo;

                                if v21 ~= nil then
                                    v21 = v21.shopItem;
                                end;
                            end;
                        end;

                        return v21;
                    end;

                    local v22 = nil;

                    for i, v in BedwarsShop.ShopItems do
                        local _ = i - 1;
                        local v23 = v.itemType == u19.itemType;

                        if v23 then
                            v23 = not v.disabled;

                            if not v23 then
                                v23 = u19.loadoutinfo;

                                if v23 ~= nil then
                                    v23 = v23.shopItem;
                                end;
                            end;
                        end;

                        if v23 == true then
                            v22 = v;
                            break;
                        end;
                    end;

                    return v22 and {
                        itemType = v22.itemType,
                        amount = v22.amount,
                        price = v22.price,
                        currencyItemType = v22.currency
                    } or nil;
                end;

                local v25 = 0;
                v18 = {};

                for i, v in kitItems do
                    local v26 = v24(v, i - 1, kitItems);

                    if v26 ~= nil then
                        v25 = v25 + 1;
                        v18[v25] = v26;
                    end;
                end;
            end;

            local v27 = v18 == nil and {} or v18;

            for _, v in getBedwarsShopOverrides() do
                if v:getKit() == u4.SelectedKit then
                    for _, v2 in v:getOverride(Players.LocalPlayer, {}) do
                        local function _(p28) -- Line: 150
                            -- upvalues: v2 (copy)
                            return p28.itemType == v2.itemType;
                        end;

                        local v29 = nil;

                        for i, v4 in v27 do
                            local _ = i - 1;

                            if v4.itemType == v2.itemType == true then
                                v29 = v4;
                                break;
                            end;
                        end;

                        if not v2.disabled then
                            local amount = v2.amount;

                            if amount == nil then
                                if v29 == nil then
                                    amount = v29;
                                else
                                    amount = v29.amount;
                                end;
                            end;

                            local price = v2.price;

                            if price == nil then
                                if v29 == nil then
                                    price = v29;
                                else
                                    price = v29.price;
                                end;
                            end;

                            local currency = v2.currency;

                            if currency == nil then
                                if v29 ~= nil then
                                    v29 = v29.currencyItemType;
                                end;
                            else
                                v29 = currency;
                            end;

                            if amount ~= 0 and (amount == amount and (amount and (price ~= 0 and (price == price and (price and v29))))) then
                                local function _(p30) -- Line: 197
                                    -- upvalues: v2 (copy)
                                    return p30.itemType == v2.itemType;
                                end;

                                local v31 = -1;

                                for i, v4 in v27 do
                                    local _ = i - 1;

                                    if v4.itemType == v2.itemType == true then
                                        v31 = i - 1;
                                        break;
                                    end;
                                end;

                                local v32 = {
                                    itemType = v2.itemType,
                                    amount = amount,
                                    price = price,
                                    currencyItemType = v29
                                };

                                if v31 < 0 then
                                    table.insert(v27, v32);
                                else
                                    v27[v31 + 1] = v32;
                                end;
                            end;
                        end;
                    end;
                end;
            end;

            return v27;
        end, { u4.SelectedKit });
        local u42 = useMemo(function() -- Line: 225
            -- upvalues: u8 (copy), AbilityMeta (ref), u4 (copy)
            local v34 = u8.abilities or {};

            local function v38(p35) -- Line: 227
                -- upvalues: AbilityMeta (ref), u4 (ref)
                local v36 = AbilityMeta[p35.abilityId];
                local triggerConfigOverride = p35.triggerConfigOverride;

                if triggerConfigOverride ~= nil then
                    triggerConfigOverride = triggerConfigOverride.abilityButton;

                    if triggerConfigOverride ~= nil then
                        triggerConfigOverride = triggerConfigOverride.icon;
                    end;
                end;

                if triggerConfigOverride == nil then
                    triggerConfigOverride = v36.triggerConfig;

                    if triggerConfigOverride ~= nil then
                        triggerConfigOverride = triggerConfigOverride.abilityButton;

                        if triggerConfigOverride ~= nil then
                            triggerConfigOverride = triggerConfigOverride.icon;
                        end;
                    end;
                end;

                if triggerConfigOverride == "" or not triggerConfigOverride then
                    warn("[Bryan] missing ability image for " .. p35.abilityId .. " | " .. u4.SelectedKit);

                    return nil;
                end;

                local v37 = {};

                for i, v in p35 do
                    v37[i] = v;
                end;

                v37.image = triggerConfigOverride;

                return v37;
            end;

            local v39 = 0;
            local v40 = {};

            for i, v in v34 do
                local v41 = v38(v, i - 1, v34);

                if v41 ~= nil then
                    v39 = v39 + 1;
                    v40[v39] = v41;
                end;
            end;

            return v40;
        end, { u4.SelectedKit });
        useEffect(function() -- Line: 272
            -- upvalues: u42 (copy), u17 (copy), u33 (copy), u7 (copy)
            local v43 = u42[1];
            local v44 = u17[1];
            local v45 = u33[1];

            if v43 then
                u7({
                    idType = "AbilityId",
                    loadoutType = "Ability",
                    id = v43.abilityId
                });

                return;
            end;

            if v44 then
                u7({
                    idType = "ItemType",
                    loadoutType = "Starter Item",
                    id = v44.itemType
                });

                return;
            end;

            if v45 then
                u7({
                    idType = "ItemType",
                    loadoutType = "Shop Item",
                    id = v45.itemType
                });
            end;
        end, {});
        local v46 = {};

        for i, v in u4 do
            v46[i] = v;
        end;

        v46.SelectedKit = nil;
        local v47 = {};

        for i, v in v46 do
            v47[i] = v;
        end;

        local v48;

        if #u42 == 0 and (#u17 == 0 and (#u33 == 0 and u8.hpModifier == nil)) then
            v48 = u2.createFragment({ u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    Text = "Read description for more information.",
                    TextTransparency = 0.5,
                    Size = UDim2.fromScale(0.8, 0.5),
                    TextColor3 = ColorUtil.WHITE,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Bottom
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 32,
                        MinTextSize = 8
                    }) }), u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    ImageTransparency = 0.5,
                    Size = UDim2.fromScale(0.2, 0.2),
                    Image = BedwarsImageId.HELP_ICON_SOLID
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }) });
        else
            local v49 = {};
            local v50 = #v49;
            local v51;

            if #u17 > 0 then
                v51 = u2.createFragment({ u2.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        Text = "STARTER ITEMS",
                        TextTransparency = 0.25,
                        ZIndex = 100,
                        Size = UDim2.fromScale(1, 0.075),
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 32,
                            MinTextSize = 8
                        }) }), u2.createElement(KitDetailsItemListContainer, {
                        Size = UDim2.fromScale(1, 0.15),

                        CalculateCellSize = function(p52, p53) -- Line: 359, Name: CalculateCellSize
                            return UDim2.fromOffset(p52.Y - p53, p52.Y - p53);
                        end,

                        SetItems = function(u54) -- Line: 362, Name: SetItems
                            -- upvalues: u6 (copy), getItemMeta (ref), u7 (copy), ColorUtil (ref), u2 (ref), BedwarsImageId (ref), Empty (ref), KitDetailsItemCard (ref), u17 (copy)
                            local function v72(p55) -- Line: 363
                                -- upvalues: u6 (ref), getItemMeta (ref), u7 (ref), u54 (copy), ColorUtil (ref), u2 (ref), BedwarsImageId (ref), Empty (ref), KitDetailsItemCard (ref)
                                local v56 = u6;

                                if v56 ~= nil then
                                    v56 = v56.id;
                                end;

                                local v57 = v56 == p55.itemType;

                                if v57 then
                                    local v58 = u6;

                                    if v58 ~= nil then
                                        v58 = v58.idType;
                                    end;

                                    v57 = v58 == "ItemType";
                                end;

                                local v59 = getItemMeta(p55.itemType);

                                local function v61(p60) -- Line: 378
                                    -- upvalues: u7 (ref)
                                    u7({
                                        idType = "ItemType",
                                        loadoutType = "Starter Item",
                                        id = p60
                                    });
                                end;

                                local v62 = {
                                    BackgroundTransparency = 0.5,
                                    BorderSizePixel = 0,
                                    Size = u54,
                                    Id = p55.itemType,
                                    BackgroundColor3 = ColorUtil.brighten(ColorUtil.BLACK, v57 and 0.25 or 0)
                                };
                                local image = v59.image;
                                v62.Image = image == nil and "" or image;
                                v62.OnClick = v61;
                                v62.OnHover = v61;
                                v62.Selectable = true;
                                local innateItem = p55.innateItem;

                                if innateItem ~= nil then
                                    innateItem = innateItem.amount;
                                end;

                                local v63 = innateItem ~= nil;

                                if v63 then
                                    local v64 = {
                                        BackgroundTransparency = 1,
                                        TextScaled = true,
                                        Size = UDim2.fromScale(1, 0.3),
                                        Position = UDim2.fromScale(0, 0),
                                        AnchorPoint = Vector2.new(0, 0)
                                    };
                                    local innateItem2 = p55.innateItem;

                                    if innateItem2 ~= nil then
                                        innateItem2 = innateItem2.amount;
                                    end;

                                    v64.Text = "x" .. tostring(innateItem2);
                                    v64.TextColor3 = ColorUtil.WHITE;
                                    v64.TextStrokeColor3 = ColorUtil.BLACK;
                                    v64.TextStrokeTransparency = 0;
                                    v64.FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold);
                                    v64.TextXAlignment = Enum.TextXAlignment.Left;
                                    v64.TextYAlignment = Enum.TextYAlignment.Center;
                                    v63 = u2.createElement("TextLabel", v64);
                                end;

                                local v65 = {};
                                local v66 = #v65;

                                if v63 then
                                    v65[v66 + 1] = v63;
                                end;

                                local v67 = #v65;
                                local loadoutinfo = p55.loadoutinfo;

                                if loadoutinfo ~= nil then
                                    loadoutinfo = loadoutinfo.reoccuringTimeSeconds;
                                end;

                                local v68 = loadoutinfo ~= nil;

                                if v68 then
                                    local v69 = {
                                        Size = UDim2.fromScale(1, 0.3),
                                        Position = UDim2.fromScale(1, 1),
                                        AnchorPoint = Vector2.new(1, 1)
                                    };
                                    local v70 = { u2.createElement("UIListLayout", {
                                            FillDirection = Enum.FillDirection.Horizontal,
                                            HorizontalAlignment = Enum.HorizontalAlignment.Left,
                                            VerticalAlignment = Enum.VerticalAlignment.Center,
                                            SortOrder = Enum.SortOrder.LayoutOrder
                                        }), u2.createElement("ImageLabel", {
                                            BackgroundTransparency = 1,
                                            Size = UDim2.fromScale(0.2, 1),
                                            Image = BedwarsImageId.HUD_TIMER_ICON
                                        }, { u2.createElement("UIAspectRatioConstraint", {
                                                AspectRatio = 1
                                            }) }) };
                                    local v71 = {
                                        BackgroundTransparency = 1,
                                        TextScaled = true,
                                        Size = UDim2.fromScale(0.8, 1)
                                    };
                                    local loadoutinfo2 = p55.loadoutinfo;

                                    if loadoutinfo2 ~= nil then
                                        loadoutinfo2 = loadoutinfo2.reoccuringTimeSeconds;
                                    end;

                                    v71.Text = tostring(loadoutinfo2) .. " sec";
                                    v71.TextColor3 = ColorUtil.WHITE;
                                    v71.TextStrokeColor3 = ColorUtil.BLACK;
                                    v71.TextStrokeTransparency = 0;
                                    v71.FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold);
                                    v71.TextXAlignment = Enum.TextXAlignment.Right;
                                    v71.TextYAlignment = Enum.TextYAlignment.Center;
                                    v70[#v70 + 1] = u2.createElement("TextLabel", v71);
                                    v68 = u2.createElement(Empty, v69, v70);
                                end;

                                if v68 then
                                    v65[v67 + 1] = v68;
                                end;

                                return u2.createElement(KitDetailsItemCard, v62, v65);
                            end;

                            local v73 = table.create(#u17);

                            for i, v in u17 do
                                v73[i] = v72(v, i - 1, u17);
                            end;

                            return v73;
                        end
                    }) });
            else
                v51 = false;
            end;

            if v51 then
                v49[v50 + 1] = v51;
            end;

            local v74 = #v49;
            local v75;

            if #u33 > 0 then
                v75 = u2.createFragment({ u2.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        Text = "SHOP ITEMS",
                        TextTransparency = 0.25,
                        ZIndex = 100,
                        Size = UDim2.fromScale(1, 0.075),
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 32,
                            MinTextSize = 8
                        }) }), u2.createElement(KitDetailsItemListContainer, {
                        Size = UDim2.fromScale(1, 0.15),

                        CalculateCellSize = function(p76, p77) -- Line: 519, Name: CalculateCellSize
                            return UDim2.fromOffset(p76.Y - p77, p76.Y - p77);
                        end,

                        SetItems = function(u78) -- Line: 522, Name: SetItems
                            -- upvalues: u6 (copy), getItemMeta (ref), u7 (copy), ColorUtil (ref), u2 (ref), Empty (ref), KitDetailsItemCard (ref), u33 (copy)
                            local function v93(p79) -- Line: 523
                                -- upvalues: u6 (ref), getItemMeta (ref), u7 (ref), u78 (copy), ColorUtil (ref), u2 (ref), Empty (ref), KitDetailsItemCard (ref)
                                local v80 = u6;

                                if v80 ~= nil then
                                    v80 = v80.id;
                                end;

                                local v81 = v80 == p79.itemType;

                                if v81 then
                                    local v82 = u6;

                                    if v82 ~= nil then
                                        v82 = v82.idType;
                                    end;

                                    v81 = v82 == "ItemType";
                                end;

                                local v83 = getItemMeta(p79.itemType);

                                local function v85(p84) -- Line: 538
                                    -- upvalues: u7 (ref)
                                    u7({
                                        idType = "ItemType",
                                        loadoutType = "Shop Item",
                                        id = p84
                                    });
                                end;

                                local v86 = {
                                    BackgroundTransparency = 0.5,
                                    BorderSizePixel = 0,
                                    Size = u78,
                                    Id = p79.itemType,
                                    BackgroundColor3 = ColorUtil.brighten(ColorUtil.BLACK, v81 and 0.25 or 0)
                                };
                                local image = v83.image;
                                v86.Image = image == nil and "" or image;
                                v86.OnClick = v85;
                                v86.OnHover = v85;
                                v86.Selectable = true;
                                local v87;

                                if p79 == nil then
                                    v87 = p79;
                                else
                                    v87 = p79.amount;
                                end;

                                local v88 = v87 ~= nil;

                                if v88 then
                                    local v89 = {
                                        BackgroundTransparency = 1,
                                        TextScaled = true,
                                        Size = UDim2.fromScale(1, 0.3),
                                        Position = UDim2.fromScale(0, 0),
                                        AnchorPoint = Vector2.new(0, 0)
                                    };
                                    local v90;

                                    if p79 == nil then
                                        v90 = p79;
                                    else
                                        v90 = p79.amount;
                                    end;

                                    v89.Text = "x" .. tostring(v90);
                                    v89.TextColor3 = ColorUtil.WHITE;
                                    v89.TextStrokeColor3 = ColorUtil.BLACK;
                                    v89.TextStrokeTransparency = 0;
                                    v89.FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold);
                                    v89.TextXAlignment = Enum.TextXAlignment.Left;
                                    v89.TextYAlignment = Enum.TextYAlignment.Center;
                                    v88 = u2.createElement("TextLabel", v89);
                                end;

                                local v91 = {};
                                local v92 = #v91;

                                if v88 then
                                    v91[v92 + 1] = v88;
                                end;

                                v91[#v91 + 1] = u2.createElement(Empty, {
                                    Size = UDim2.fromScale(1, 0.3),
                                    Position = UDim2.fromScale(1, 1),
                                    AnchorPoint = Vector2.new(1, 1)
                                }, { u2.createElement("UIListLayout", {
                                        FillDirection = Enum.FillDirection.Horizontal,
                                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                                        VerticalAlignment = Enum.VerticalAlignment.Center,
                                        SortOrder = Enum.SortOrder.LayoutOrder
                                    }), u2.createElement("ImageLabel", {
                                        BackgroundTransparency = 1,
                                        Size = UDim2.fromScale(0.4, 2),
                                        Image = getItemMeta(p79.currencyItemType).image
                                    }, { u2.createElement("UIAspectRatioConstraint", {
                                            AspectRatio = 1
                                        }) }), u2.createElement("TextLabel", {
                                        BackgroundTransparency = 1,
                                        TextScaled = true,
                                        TextStrokeTransparency = 0,
                                        Size = UDim2.fromScale(0.8, 1),
                                        Text = tostring(p79.price),
                                        TextColor3 = ColorUtil.WHITE,
                                        TextStrokeColor3 = ColorUtil.BLACK,
                                        FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold),
                                        TextXAlignment = Enum.TextXAlignment.Left,
                                        TextYAlignment = Enum.TextYAlignment.Center
                                    }) });

                                return u2.createElement(KitDetailsItemCard, v86, v91);
                            end;

                            local v94 = table.create(#u33);

                            for i, v in u33 do
                                v94[i] = v93(v, i - 1, u33);
                            end;

                            return v94;
                        end
                    }) });
            else
                v75 = false;
            end;

            if v75 then
                v49[v74 + 1] = v75;
            end;

            local v95 = #v49;
            local v96;

            if #u42 > 0 then
                v96 = u2.createFragment({ u2.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        Text = "ABILITIES",
                        TextTransparency = 0.25,
                        ZIndex = 100,
                        Size = UDim2.fromScale(1, 0.075),
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 32,
                            MinTextSize = 8
                        }) }), u2.createElement(KitDetailsItemListContainer, {
                        Size = UDim2.fromScale(1, 0.15),

                        CalculateCellSize = function(p97, p98) -- Line: 661, Name: CalculateCellSize
                            return UDim2.fromOffset(p97.Y - p98, p97.Y - p98);
                        end,

                        SetItems = function(u99) -- Line: 664, Name: SetItems
                            -- upvalues: u6 (copy), AbilityMeta (ref), u7 (copy), u2 (ref), BedwarsImageId (ref), ColorUtil (ref), Empty (ref), KitDetailsItemCard (ref), u42 (copy)
                            local function v114(p100) -- Line: 665
                                -- upvalues: u6 (ref), AbilityMeta (ref), u7 (ref), u2 (ref), BedwarsImageId (ref), ColorUtil (ref), Empty (ref), u99 (copy), KitDetailsItemCard (ref)
                                local v101 = u6;

                                if v101 ~= nil then
                                    v101 = v101.id;
                                end;

                                local v102 = v101 == p100.abilityId;

                                if v102 then
                                    local v103 = u6;

                                    if v103 ~= nil then
                                        v103 = v103.idType;
                                    end;

                                    v102 = v103 == "AbilityId";
                                end;

                                local v104 = AbilityMeta[p100.abilityId];

                                local function v106(p105) -- Line: 680
                                    -- upvalues: u7 (ref)
                                    u7({
                                        idType = "AbilityId",
                                        loadoutType = "Ability",
                                        id = p105
                                    });
                                end;

                                local cooldown = v104.cooldown;

                                if cooldown ~= nil then
                                    cooldown = cooldown.duration;
                                end;

                                local v107 = cooldown ~= nil;

                                if v107 then
                                    local v108 = {
                                        Size = UDim2.fromScale(1, 0.3),
                                        Position = UDim2.fromScale(1, 1),
                                        AnchorPoint = Vector2.new(1, 1)
                                    };
                                    local v109 = { u2.createElement("UIListLayout", {
                                            FillDirection = Enum.FillDirection.Horizontal,
                                            HorizontalAlignment = Enum.HorizontalAlignment.Right,
                                            VerticalAlignment = Enum.VerticalAlignment.Center,
                                            SortOrder = Enum.SortOrder.LayoutOrder
                                        }), u2.createElement("ImageLabel", {
                                            BackgroundTransparency = 1,
                                            Size = UDim2.fromScale(0.2, 1),
                                            Image = BedwarsImageId.HUD_TIMER_ICON
                                        }, { u2.createElement("UIAspectRatioConstraint", {
                                                AspectRatio = 1
                                            }) }) };
                                    local v110 = {
                                        BackgroundTransparency = 1,
                                        TextScaled = true,
                                        Size = UDim2.fromScale(0.8, 1)
                                    };
                                    local cooldown2 = v104.cooldown;

                                    if cooldown2 ~= nil then
                                        cooldown2 = cooldown2.duration;
                                    end;

                                    v110.Text = tostring(cooldown2) .. " sec";
                                    v110.TextColor3 = ColorUtil.WHITE;
                                    v110.TextStrokeColor3 = ColorUtil.BLACK;
                                    v110.TextStrokeTransparency = 0;
                                    v110.FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold);
                                    v110.TextXAlignment = Enum.TextXAlignment.Right;
                                    v110.TextYAlignment = Enum.TextYAlignment.Center;
                                    v109[#v109 + 1] = u2.createElement("TextLabel", v110);
                                    v107 = u2.createElement(Empty, v108, v109);
                                end;

                                local v111 = {
                                    BackgroundTransparency = 0.5,
                                    BorderSizePixel = 0,
                                    Selectable = true,
                                    Size = u99,
                                    Id = p100.abilityId,
                                    BackgroundColor3 = ColorUtil.brighten(ColorUtil.BLACK, v102 and 0.25 or 0),
                                    Image = p100.image,
                                    OnClick = v106,
                                    OnHover = v106
                                };
                                local v112 = {};
                                local v113 = #v112;

                                if v107 then
                                    v112[v113 + 1] = v107;
                                end;

                                return u2.createElement(KitDetailsItemCard, v111, v112);
                            end;

                            local v115 = table.create(#u42);

                            for i, v in u42 do
                                v115[i] = v114(v, i - 1, u42);
                            end;

                            return v115;
                        end
                    }) });
            else
                v96 = false;
            end;

            if v96 then
                v49[v95 + 1] = v96;
            end;

            local v116 = #v49;
            local v117 = u6 ~= nil;

            if v117 then
                local v118 = {
                    Size = UDim2.fromScale(1, 0.325)
                };
                local v119 = { u2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Top,
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), u2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 20)
                    }) };
                local v120 = #v119;
                local v121 = {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    Size = UDim2.fromScale(1, 0.15)
                };
                local v123 = (function() -- Line: 789
                    -- upvalues: u6 (copy), getItemMeta (ref), AbilityMeta (ref), ColorUtil (ref)
                    local idType = u6.idType;
                    local v122;

                    if idType == "ItemType" then
                        v122 = getItemMeta(u6.id).displayName;
                    else
                        if idType ~= "AbilityId" then
                            return nil;
                        end;

                        v122 = AbilityMeta[u6.id].actionBarName;
                    end;

                    return v122 .. " <font color=\"" .. ColorUtil.richTextColor(ColorUtil.darken(ColorUtil.WHITE, 0.5)) .. "\">(" .. u6.loadoutType .. ")</font>";
                end)();
                v121.Text = v123 == nil and "" or v123;
                v121.TextColor3 = ColorUtil.WHITE;
                v121.RichText = true;
                v121.TextTransparency = 0.25;
                v121.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
                v121.TextXAlignment = Enum.TextXAlignment.Left;
                v121.TextYAlignment = Enum.TextYAlignment.Top;
                v119[v120 + 1] = u2.createElement("TextLabel", v121, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 24,
                        MinTextSize = 4
                    }) });
                local v124 = {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    Size = UDim2.fromScale(1, 0.85)
                };
                local v125 = (function() -- Line: 829
                    -- upvalues: u6 (copy), getItemMeta (ref), AbilityMeta (ref)
                    local idType = u6.idType;

                    if idType == "ItemType" then
                        return getItemMeta(u6.id).description;
                    end;

                    if idType == "AbilityId" then
                        return AbilityMeta[u6.id].actionBarDescription;
                    end;
                end)();
                v124.Text = v125 == nil and "" or v125;
                v124.TextColor3 = ColorUtil.WHITE;
                v124.TextTransparency = 0.5;
                v124.FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular);
                v124.TextXAlignment = Enum.TextXAlignment.Left;
                v124.TextYAlignment = Enum.TextYAlignment.Top;
                v119[v120 + 2] = u2.createElement("TextLabel", v124, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 24,
                        MinTextSize = 6
                    }) });
                v117 = u2.createElement(Empty, v118, v119);
            end;

            if v117 then
                v49[v116 + 1] = v117;
            end;

            local v126 = #v49;
            local v127;

            if u8.hpModifier == nil then
                v127 = false;
            else
                v127 = u2.createFragment({ u2.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        Text = "Stats",
                        TextTransparency = 0.25,
                        ZIndex = 100,
                        Size = UDim2.fromScale(1, 0.075),
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 32,
                            MinTextSize = 8
                        }) }), u2.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        TextTransparency = 0.25,
                        RichText = true,
                        ZIndex = 100,
                        Size = UDim2.fromScale(1, 0.075),
                        Text = "<b>Base Health:</b> " .. tostring(DEFAULT_ENTITY_MAX_HEALTH * u8.hpModifier),
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.fromName("Roboto"),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 24,
                            MinTextSize = 6
                        }) }) });
            end;

            if v127 then
                v49[v126 + 1] = v127;
            end;

            v48 = u2.createFragment(v49);
        end;

        local v128 = {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }),
            u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 20),
                PaddingRight = UDim.new(0, 20),
                PaddingTop = UDim.new(0, 15),
                PaddingBottom = UDim.new(0, 15)
            }),
            [#v128 + 1] = v48
        };

        return u2.createElement("Frame", v47, v128);
    end)
};