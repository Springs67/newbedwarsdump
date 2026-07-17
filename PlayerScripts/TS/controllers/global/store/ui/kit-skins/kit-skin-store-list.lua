-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v5 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar");
local AutoCompleteSearchbar = v5.AutoCompleteSearchbar;
local SearchbarShowImageFunc = v5.SearchbarShowImageFunc;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta");
local BedwarsKitSkinMeta = v6.BedwarsKitSkinMeta;
local MAX_NEW_SKIN_AGE = v6.MAX_NEW_SKIN_AGE;
local RobuxProductType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "store-consts").RobuxProductType;
local RobuxStoreItemShowcaseCard = RuntimeLib.import(script, script.Parent.Parent, "robux-store-item-showcase-card").RobuxStoreItemShowcaseCard;
local v58 = v3.new(u2)(function(u7, p8) -- Line: 19
    -- upvalues: u1 (copy), BedwarsKitSkinMeta (copy), MAX_NEW_SKIN_AGE (copy), KnitClient (copy), Flamework (copy), BedwarsAppIds (copy), u2 (copy), AutoCompleteSearchbar (copy), SearchbarShowImageFunc (copy), RobuxStoreItemShowcaseCard (copy), RobuxProductType (copy), Empty (copy)
    local _ = p8.useEffect;
    local useValue = p8.useValue;
    local v9, u10 = p8.useState(u1.entries(BedwarsKitSkinMeta));
    local u11 = os.time();

    local function _(p12) -- Line: 25
        local _ = p12[1];
        local v13 = p12[2];

        return {
            key = v13.name,
            image = v13.renderImage
        };
    end;

    local v14 = table.create(#v9);

    for i, v in v9 do
        local _ = i - 1;
        local _ = v[1];
        local v15 = v[2];
        v14[i] = {
            key = v15.name,
            image = v15.renderImage
        };
    end;

    local v16 = useValue(v14);

    local function _(p17) -- Line: 41
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

    table.sort(u19, function(p20, p21) -- Line: 59
        return (p20[2].kit or "") < (p21[2].kit or "");
    end);

    local function _(p22) -- Line: 64
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

    table.sort(v24, function(p25, p26) -- Line: 82
        return (p25[2].kit or "") < (p26[2].kit or "");
    end);

    local function u28(p27) -- Line: 87
        -- upvalues: KnitClient (ref), Flamework (ref), BedwarsAppIds (ref)
        KnitClient.Controllers.LockerPreviewController:openFullscreenPreview({
            kitSkin = p27
        }, {
            onOpen = function() -- Line: 91, Name: onOpen
                -- upvalues: KnitClient (ref)
                KnitClient.Controllers.LobbyHudController:unmountLobbyHud();
                KnitClient.Controllers.HotbarController:unmountHotbar();
            end,

            onClose = function() -- Line: 95, Name: onClose
                -- upvalues: Flamework (ref), BedwarsAppIds (ref), KnitClient (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.STORE_MENU_APP, {
                    DefaultPageId = "KitSkins",
                    AppId = BedwarsAppIds.STORE_MENU_APP
                });
                KnitClient.Controllers.LobbyHudController:unmountLobbyHud();
                KnitClient.Controllers.HotbarController:unmountHotbar();
                KnitClient.Controllers.LockerPreviewController:closePreview();
            end
        });
    end;

    local v29 = {
        Size = UDim2.new(1, -16, 1, 0)
    };
    local v35 = { u2.createElement(AutoCompleteSearchbar, {
            InputText = "",
            PlaceHolderText = "Kit Skin Name",
            Size = UDim2.fromScale(0.55, 0.08),
            Items = v16.value,

            OnTextChange = function(p30, u31) -- Line: 115, Name: OnTextChange
                -- upvalues: u1 (ref), BedwarsKitSkinMeta (ref), u10 (copy)
                local function _(p32) -- Line: 117
                    -- upvalues: u31 (copy)
                    local _ = p32[1];

                    return table.find(u31, p32[2].name) ~= nil;
                end;

                local v33 = 0;
                local v34 = {};

                for i, v in u1.entries(BedwarsKitSkinMeta) do
                    local _ = i - 1;
                    local _ = v[1];

                    if table.find(u31, v[2].name) ~= nil == true then
                        v33 = v33 + 1;
                        v34[v33] = v;
                    end;
                end;

                u10(v34);
            end,

            ShowImage = SearchbarShowImageFunc.MANUAL,
            BackgroundColor3 = Color3.fromRGB(22, 22, 22)
        }) };
    local _ = #v35;

    local function v40(p36, p37) -- Line: 141
        -- upvalues: u2 (ref), RobuxStoreItemShowcaseCard (ref), RobuxProductType (ref), u7 (copy), u28 (copy)
        local u38 = p36[1];
        local v39 = p36[2];

        if v39.product then
            return u2.createElement(RobuxStoreItemShowcaseCard, {
                AspectRatio = 0.74,
                New = true,
                Title = v39.name,
                Image = v39.renderImage,
                Product = {
                    Price = v39.product.priceRobux,
                    ProductId = v39.product.devProductId,
                    GiftType = u38,
                    ProductType = RobuxProductType.DevProduct
                },
                IsOwned = table.find(u7.OwnedKitSkins, u38) ~= nil,
                GamepadShouldAutoSelect = p37 == 0,

                OnClick = function() -- Line: 160, Name: OnClick
                    -- upvalues: u28 (ref), u38 (copy)
                    return u28(u38);
                end
            });
        end;

        return nil;
    end;

    local v41 = 0;
    local v42 = {};

    for i, v in u19 do
        local v43 = v40(v, i - 1, u19);

        if v43 ~= nil then
            v41 = v41 + 1;
            v42[v41] = v43;
        end;
    end;

    local v44 = {
        Size = UDim2.fromScale(1, 0.9),
        Position = UDim2.fromScale(0, 0.1)
    };
    local v45 = { u2.createElement("UIGridLayout", {
            FillDirection = "Horizontal",
            FillDirectionMaxCells = 4,
            SortOrder = "LayoutOrder",
            CellSize = UDim2.new(0.25, -9, 0, 200),
            CellPadding = UDim2.new(0, 12, 0, 10)
        }) };
    local v46 = #v45;

    for i, v in v42 do
        v45[v46 + i] = v;
    end;

    local v47 = #v45;

    local function v54(p48, p49) -- Line: 194
        -- upvalues: u2 (ref), RobuxStoreItemShowcaseCard (ref), RobuxProductType (ref), u7 (copy), u19 (copy), u28 (copy)
        local u50 = p48[1];
        local v51 = p48[2];

        if not v51.product then
            return nil;
        end;

        local createElement = u2.createElement;
        local v52 = {
            AspectRatio = 0.74,
            Title = v51.name,
            Image = v51.renderImage,
            Product = {
                Price = v51.product.priceRobux,
                ProductId = v51.product.devProductId,
                GiftType = u50,
                ProductType = RobuxProductType.DevProduct
            },
            IsOwned = table.find(u7.OwnedKitSkins, u50) ~= nil
        };
        local v53;

        if #u19 > 0 then
            v53 = false;
        else
            v53 = p49 == 0;
        end;

        v52.GamepadShouldAutoSelect = v53;

        function v52.OnClick() -- Line: 212
            -- upvalues: u28 (ref), u50 (copy)
            return u28(u50);
        end;

        return createElement(RobuxStoreItemShowcaseCard, v52);
    end;

    local v55 = 0;
    local v56 = {};

    for i, v in v24 do
        local v57 = v54(v, i - 1, v24);

        if v57 ~= nil then
            v55 = v55 + 1;
            v56[v55] = v57;
        end;
    end;

    for i, v in v56 do
        v45[v47 + i] = v;
    end;

    v35.ListContainer = u2.createElement(Empty, v44, v45);

    return u2.createFragment({
        KitSkinList = u2.createElement(Empty, v29, v35)
    });
end);

return {
    KitSkinStoreList = v4.connect(function(p59, p60) -- Line: 237
        local v61 = {};

        for i, v in p60 do
            v61[i] = v;
        end;

        v61.OwnedKitSkins = p59.Bedwars.ownedKitSkins;

        return v61;
    end)(v58)
};