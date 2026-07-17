-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v6 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar");
local AutoCompleteSearchbar = v6.AutoCompleteSearchbar;
local SearchbarShowImageFunc = v6.SearchbarShowImageFunc;
local MAX_NEW_SKIN_AGE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").MAX_NEW_SKIN_AGE;
local RobuxProductType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "store-consts").RobuxProductType;
local UgcMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ugc", "ugc-meta").UgcMeta;
local RobuxStoreItemShowcaseCard = RuntimeLib.import(script, script.Parent.Parent, "robux-store-item-showcase-card").RobuxStoreItemShowcaseCard;
local v56 = v4.new(u3)(function(u7, p8) -- Line: 18
    -- upvalues: u2 (copy), UgcMeta (copy), DeviceUtil (copy), KnitClient (copy), MAX_NEW_SKIN_AGE (copy), u3 (copy), AutoCompleteSearchbar (copy), SearchbarShowImageFunc (copy), RobuxStoreItemShowcaseCard (copy), RobuxProductType (copy), Empty (copy)
    local useEffect = p8.useEffect;
    local useValue = p8.useValue;
    local v9, u10 = p8.useState(u2.entries(UgcMeta));
    local u11 = os.time();
    useEffect(function() -- Line: 24
        -- upvalues: DeviceUtil (ref), KnitClient (ref)
        if not (DeviceUtil.isHoarceKat() or KnitClient.Controllers.UgcController:hasRequestedOwnedUgcData()) then
            KnitClient.Controllers.UgcController:requestOwnedUgcData();
        end;
    end, {});

    local function _(p12) -- Line: 31
        local _ = p12[1];
        local v13 = p12[2];

        return {
            key = v13.name,
            image = v13.image.render
        };
    end;

    local v14 = table.create(#v9);

    for i, v in v9 do
        local _ = i - 1;
        local _ = v[1];
        local v15 = v[2];
        v14[i] = {
            key = v15.name,
            image = v15.image.render
        };
    end;

    local v16 = useValue(v14);

    local function _(p17) -- Line: 47
        -- upvalues: u11 (copy), MAX_NEW_SKIN_AGE (ref)
        local releaseTime = p17[2].releaseTime;

        return u11 - (releaseTime == nil and 0 or releaseTime) <= MAX_NEW_SKIN_AGE;
    end;

    local v18 = 0;
    local u19 = {};

    for i, v in v9 do
        local _ = i - 1;
        local releaseTime = v[2].releaseTime;

        if u11 - (releaseTime == nil and 0 or releaseTime) <= MAX_NEW_SKIN_AGE == true then
            v18 = v18 + 1;
            u19[v18] = v;
        end;
    end;

    table.sort(u19, function(p20, p21) -- Line: 65
        local name = p20[2].name;
        local name2 = p21[2].name;

        return (name == nil and "" or name) < (name2 == nil and "" or name2);
    end);

    local function _(p22) -- Line: 78
        -- upvalues: u11 (copy), MAX_NEW_SKIN_AGE (ref)
        local releaseTime = p22[2].releaseTime;

        return MAX_NEW_SKIN_AGE < u11 - (releaseTime == nil and 0 or releaseTime);
    end;

    local v23 = 0;
    local v24 = {};

    for i, v in v9 do
        local _ = i - 1;
        local releaseTime = v[2].releaseTime;

        if MAX_NEW_SKIN_AGE < u11 - (releaseTime == nil and 0 or releaseTime) == true then
            v23 = v23 + 1;
            v24[v23] = v;
        end;
    end;

    table.sort(v24, function(p25, p26) -- Line: 96
        local name = p25[2].name;
        local name2 = p26[2].name;

        return (name == nil and "" or name) < (name2 == nil and "" or name2);
    end);
    local v27 = {
        Size = UDim2.new(1, -16, 1, 0)
    };
    local v33 = { u3.createElement(AutoCompleteSearchbar, {
            InputText = "",
            PlaceHolderText = "Name",
            Size = UDim2.fromScale(0.55, 0.08),
            Items = v16.value,

            OnTextChange = function(p28, u29) -- Line: 118, Name: OnTextChange
                -- upvalues: u2 (ref), UgcMeta (ref), u10 (copy)
                local function _(p30) -- Line: 120
                    -- upvalues: u29 (copy)
                    local _ = p30[1];

                    return table.find(u29, p30[2].name) ~= nil;
                end;

                local v31 = 0;
                local v32 = {};

                for i, v in u2.entries(UgcMeta) do
                    local _ = i - 1;
                    local _ = v[1];

                    if table.find(u29, v[2].name) ~= nil == true then
                        v31 = v31 + 1;
                        v32[v31] = v;
                    end;
                end;

                u10(v32);
            end,

            ShowImage = SearchbarShowImageFunc.MANUAL,
            BackgroundColor3 = Color3.fromRGB(22, 22, 22)
        }) };
    local _ = #v33;

    local function v38(p34, p35) -- Line: 144
        -- upvalues: u3 (ref), RobuxStoreItemShowcaseCard (ref), RobuxProductType (ref), u7 (copy)
        local v36 = p34[1];
        local v37 = p34[2];

        return u3.createElement(RobuxStoreItemShowcaseCard, {
            AspectRatio = 0.74,
            New = true,
            Title = v37.name .. (v37.limited and " (LIMITED)" or ""),
            Image = v37.image.render,
            Product = {
                Price = v37.basePrice,
                UgcType = v36,
                ProductType = RobuxProductType.BedwarsUGC
            },
            IsOwned = table.find(u7.OwnedUGC, v36) ~= nil,
            ProductImageProps = {
                ImageTransparency = v37.robuxStoreDisablePurchase and 0.36 or 0
            },
            DisablePurchase = v37.robuxStoreDisablePurchase,
            GamepadShouldAutoSelect = p35 == 0
        });
    end;

    local v39 = 0;
    local v40 = {};

    for i, v in u19 do
        local v41 = v38(v, i - 1, u19);

        if v41 ~= nil then
            v39 = v39 + 1;
            v40[v39] = v41;
        end;
    end;

    local v42 = {
        Size = UDim2.fromScale(1, 0.9),
        Position = UDim2.fromScale(0, 0.1)
    };
    local v43 = { u3.createElement("UIGridLayout", {
            FillDirection = "Horizontal",
            FillDirectionMaxCells = 4,
            SortOrder = "LayoutOrder",
            CellSize = UDim2.new(0.25, -9, 0, 200),
            CellPadding = UDim2.new(0, 12, 0, 10)
        }) };
    local v44 = #v43;

    for i, v in v40 do
        v43[v44 + i] = v;
    end;

    local v45 = #v43;

    local function v52(p46, p47) -- Line: 194
        -- upvalues: u3 (ref), RobuxStoreItemShowcaseCard (ref), RobuxProductType (ref), u7 (copy), u19 (copy)
        local v48 = p46[1];
        local v49 = p46[2];
        local createElement = u3.createElement;
        local v50 = {
            AspectRatio = 0.74,
            Title = v49.name .. (v49.limited and " (LIMITED)" or ""),
            Image = v49.image.render,
            Product = {
                Price = v49.basePrice,
                UgcType = v48,
                ProductType = RobuxProductType.BedwarsUGC
            },
            IsOwned = table.find(u7.OwnedUGC, v48) ~= nil,
            ProductImageProps = {
                ImageTransparency = v49.robuxStoreDisablePurchase and 0.36 or 0
            },
            DisablePurchase = v49.robuxStoreDisablePurchase
        };
        local v51;

        if #u19 > 0 then
            v51 = false;
        else
            v51 = p47 == 0;
        end;

        v50.GamepadShouldAutoSelect = v51;

        return createElement(RobuxStoreItemShowcaseCard, v50);
    end;

    local v53 = 0;
    local v54 = {};

    for i, v in v24 do
        local v55 = v52(v, i - 1, v24);

        if v55 ~= nil then
            v53 = v53 + 1;
            v54[v53] = v55;
        end;
    end;

    for i, v in v54 do
        v43[v45 + i] = v;
    end;

    v33.ListContainer = u3.createElement(Empty, v42, v43);

    return u3.createFragment({
        ItemListContainer = u3.createElement(Empty, v27, v33)
    });
end);

return {
    UGCStoreList = v5.connect(function(p57, p58) -- Line: 234
        local v59 = {};

        for i, v in p58 do
            v59[i] = v;
        end;

        v59.OwnedUGC = p57.Lobby.ownedUGC;

        return v59;
    end)(v56)
};