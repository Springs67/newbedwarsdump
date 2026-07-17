-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CalcTotalUIScale = v1.CalcTotalUIScale;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local GetUIScaleAncestors = v1.GetUIScaleAncestors;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local AutoCompleteSearchbar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local BundleMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta;
local BundleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-type").BundleType;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta");
local BedwarsKitMeta = v5.BedwarsKitMeta;
local getBedwarsKitMeta = v5.getBedwarsKitMeta;
local BedwarsKitShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local v6 = RuntimeLib.import(script, script.Parent, "filters", "kit-shop-filters");
local KitShopFilters = v6.KitShopFilters;
local OwnedFilter = v6.OwnedFilter;
local KitShopBundleCard = RuntimeLib.import(script, script.Parent, "shop-items", "lobby-kit-shop-bundle-card").KitShopBundleCard;
local KitShopItemCard = RuntimeLib.import(script, script.Parent, "shop-items", "lobby-kit-shop-item-card").KitShopItemCard;

return {
    KitShopItemList = v4.new(u3)(function(u7, p8) -- Line: 36
        -- upvalues: OwnedFilter (copy), u3 (copy), getBedwarsKitMeta (copy), BedwarsKit (copy), BedwarsKitSkinMeta (copy), DeviceUtil (copy), KnitClient (copy), BundleMeta (copy), ClientStore (copy), SoundManager (copy), GameSound (copy), default (copy), Flamework (copy), BedwarsAppIds (copy), KitShopItemCard (copy), KitShopBundleCard (copy), BedwarsKitShop (copy), PlaceUtil (copy), BedwarsKitMeta (copy), u2 (copy), BattlePassUtils (copy), BundleType (copy), GetUIScaleAncestors (copy), CalcTotalUIScale (copy), Empty (copy), BedwarsImageId (copy), KitShopFilters (copy), ColorUtil (copy), AutoCompleteSearchbar (copy)
        local useState = p8.useState;
        local useEffect = p8.useEffect;
        local useValue = p8.useValue;
        local useMemo = p8.useMemo;

        if u7.SelectionMode == nil then
            u7.SelectionMode = "OPEN_DETAILS";
        end;

        local u9, u10 = useState(u7.SelectedKit or u7.store.Bedwars.kit);
        local v11, u12 = useState(u7.store.Bedwars.kit);
        local v13, u14 = useState(Vector2.new(584, 443));
        local InitialState = u7.InitialState;

        if InitialState ~= nil then
            InitialState = InitialState.KitClassFilter;
        end;

        local u15, u16 = useState(InitialState == nil and "" or InitialState);
        local InitialState2 = u7.InitialState;

        if InitialState2 ~= nil then
            InitialState2 = InitialState2.OwnedFilter;
        end;

        if InitialState2 == nil then
            InitialState2 = tostring(OwnedFilter.ALL);
        end;

        local u17, u18 = useState(InitialState2);
        local InitialState3 = u7.InitialState;

        if InitialState3 ~= nil then
            InitialState3 = InitialState3.FavoritedToggle;
        end;

        if InitialState3 == nil then
            InitialState3 = false;
        end;

        local u19, u20 = useState(InitialState3);
        local InitialState4 = u7.InitialState;

        if InitialState4 ~= nil then
            InitialState4 = InitialState4.SearchText;
        end;

        local u21, u22 = useState(InitialState4 == nil and "" or InitialState4);
        local u23, u24 = useState({});
        local u25, u26 = useState({});
        local u27, u28 = useState({});
        local InitialState5 = u7.InitialState;

        if InitialState5 ~= nil then
            InitialState5 = InitialState5.CanvasPositionY;
        end;

        local u29 = useValue(InitialState5);
        local InitialState6 = u7.InitialState;

        if InitialState6 ~= nil then
            InitialState6 = InitialState6.KitClassFilter;
        end;

        local u30 = useValue(InitialState6);
        local InitialState7 = u7.InitialState;

        if InitialState7 ~= nil then
            InitialState7 = InitialState7.OwnedFilter;
        end;

        local u31 = useValue(InitialState7);
        local InitialState8 = u7.InitialState;

        if InitialState8 ~= nil then
            InitialState8 = InitialState8.FavoritedToggle;
        end;

        local u32 = useValue(InitialState8);
        local InitialState9 = u7.InitialState;

        if InitialState9 ~= nil then
            InitialState9 = InitialState9.SearchText;
        end;

        local u33 = useValue(InitialState9);
        local u34, u35 = useState(false);
        local u36 = u3.createRef();
        local u37 = u3.createRef();
        local u38 = u3.createRef();
        local u39 = u3.createRef();
        local u40 = math.floor(v13.X * 0.17123287671232876);
        local u41 = math.floor(v13.X * 0.023809523809523808);
        local v42 = getBedwarsKitMeta(v11 or BedwarsKit.NONE);
        local equippedKitSkins = u7.store.Bedwars.equippedKitSkins;

        if equippedKitSkins ~= nil then
            equippedKitSkins = equippedKitSkins[v11 or BedwarsKit.NONE];
        end;

        local v43;

        if equippedKitSkins then
            v43 = BedwarsKitSkinMeta[equippedKitSkins].renderImage;
        else
            v43 = v42.renderImage;
        end;

        local function u56() -- Line: 132
            -- upvalues: u7 (copy), u27 (copy), u23 (copy), u19 (copy), u15 (copy), getBedwarsKitMeta (ref), u17 (copy), OwnedFilter (ref), DeviceUtil (ref), KnitClient (ref), u25 (copy)
            local ownedKits = u7.store.Bedwars.ownedKits;
            local v44;

            if #u27 == 0 then
                v44 = u23;
            else
                v44 = u27;
            end;

            if u19 then
                local function _(p45) -- Line: 137
                    -- upvalues: u7 (ref)
                    if p45.bedwarsKit then
                        return u7.store.Bedwars.favoriteKits[p45.bedwarsKit] ~= nil;
                    end;

                    return false;
                end;

                local v46 = 0;
                v44 = {};

                for i, v in v44 do
                    local _ = i - 1;
                    local v47;

                    if v.bedwarsKit then
                        v47 = u7.store.Bedwars.favoriteKits[v.bedwarsKit] ~= nil;
                    else
                        v47 = false;
                    end;

                    if v47 == true then
                        v46 = v46 + 1;
                        v44[v46] = v;
                    end;
                end;
            end;

            if u15 ~= "" then
                local function _(p48) -- Line: 159
                    -- upvalues: getBedwarsKitMeta (ref), u15 (ref)
                    if not p48.bedwarsKit then
                        return false;
                    end;

                    local kitClass = getBedwarsKitMeta(p48.bedwarsKit).kitClass;

                    return tostring(kitClass) == u15;
                end;

                local v49 = 0;
                v44 = {};

                for i, v in v44 do
                    local _ = i - 1;
                    local v50;

                    if v.bedwarsKit then
                        local kitClass = getBedwarsKitMeta(v.bedwarsKit).kitClass;
                        v50 = tostring(kitClass) == u15;
                    else
                        v50 = false;
                    end;

                    if v50 == true then
                        v49 = v49 + 1;
                        v44[v49] = v;
                    end;
                end;
            end;

            local v51;

            if u17 == tostring(OwnedFilter.ALL) then
                v51 = v44;
            else
                local u52 = DeviceUtil.isHoarceKat();

                local function v54(p53) -- Line: 181
                    -- upvalues: u17 (ref), OwnedFilter (ref), u52 (copy), ownedKits (copy), KnitClient (ref)
                    if p53.bedwarsKit then
                        if u17 == tostring(OwnedFilter.OWNED) then
                            if u52 then
                                return table.find(ownedKits, p53.bedwarsKit) ~= nil;
                            end;

                            return KnitClient.Controllers.UnlockController:isKitOwned(p53.bedwarsKit);
                        end;

                        if u17 == tostring(OwnedFilter.NOT_OWNED) then
                            if u52 then
                                return table.find(ownedKits, p53.bedwarsKit) == nil;
                            end;

                            return not KnitClient.Controllers.UnlockController:isKitOwned(p53.bedwarsKit);
                        end;

                        if u17 == tostring(OwnedFilter.UNLOCKED) then
                            if u52 then
                                return false;
                            end;

                            return KnitClient.Controllers.UnlockController:isKitUnlocked(p53.bedwarsKit);
                        end;
                    end;

                    return false;
                end;

                local v55 = 0;
                v51 = {};

                for i, v in v44 do
                    if v54(v, i - 1, v44) == true then
                        v55 = v55 + 1;
                        v51[v55] = v;
                    end;
                end;
            end;

            if v51 == u25 then
                return u23;
            end;

            return v51;
        end;

        local function u65(p57, p58) -- Line: 228
            -- upvalues: u28 (copy), u56 (copy), getBedwarsKitMeta (ref), BundleMeta (ref), u23 (copy)
            if p57 == "" then
                u28({});

                return u56();
            end;

            local u59 = {};

            local function v64(u60) -- Line: 235
                -- upvalues: getBedwarsKitMeta (ref), BundleMeta (ref), u23 (ref), u59 (copy)
                local function v62(p61) -- Line: 236
                    -- upvalues: getBedwarsKitMeta (ref), u60 (copy), BundleMeta (ref)
                    if p61.bedwarsKit then
                        return string.lower(getBedwarsKitMeta(p61.bedwarsKit).name) == string.lower(u60);
                    end;

                    if p61.kitBundle then
                        local kitShopBundle = BundleMeta[p61.kitBundle].kitShopBundle;

                        if kitShopBundle ~= nil then
                            kitShopBundle = string.lower(kitShopBundle.name);
                        end;

                        return kitShopBundle == string.lower(u60);
                    end;
                end;

                local v63 = nil;

                for i, v in u23 do
                    if v62(v, i - 1, u23) == true then
                        v63 = v;
                        break;
                    end;
                end;

                if v63 then
                    table.insert(u59, v63);
                end;
            end;

            for i, v in p58 do
                v64(v, i - 1, p58);
            end;

            u28(u59);

            return u59;
        end;

        local function u68(u66) -- Line: 267
            -- upvalues: u7 (copy), ClientStore (ref), u10 (copy), u12 (copy), DeviceUtil (ref), SoundManager (ref), GameSound (ref), default (ref)
            if u7.SelectionMode ~= "OPEN_DETAILS" then
                if u7.SelectionMode == "SELECTION_ONLY" then
                    local SetSelectedKit = u7.SetSelectedKit;

                    if SetSelectedKit ~= nil then
                        SetSelectedKit = SetSelectedKit(u66);
                    end;

                    if SetSelectedKit == nil and true or SetSelectedKit then
                        u10(u66);
                    end;
                end;

                return;
            end;

            local function _() -- Line: 269
                -- upvalues: ClientStore (ref), u66 (copy), u10 (ref), u12 (ref)
                ClientStore:dispatch({
                    type = "SetBedwarsKit",
                    kit = u66
                });
                u10(u66);
                u12(u66);
            end;

            if DeviceUtil.isHoarceKat() then
                local SetSelectedKit = u7.SetSelectedKit;

                if SetSelectedKit ~= nil then
                    SetSelectedKit = SetSelectedKit(u66);
                end;

                local _ = SetSelectedKit == nil;
                SoundManager:playSound(GameSound.ARMOR_UNEQUIP);
                ClientStore:dispatch({
                    type = "SetBedwarsKit",
                    kit = u66
                });
                u10(u66);
                u12(u66);

                return nil;
            end;

            default.Client:Get("BedwarsActivateKit"):CallServerAsync({
                kit = u66
            }):andThen(function(p67) -- Line: 293
                -- upvalues: u7 (ref), u66 (copy), SoundManager (ref), GameSound (ref), ClientStore (ref), u10 (ref), u12 (ref)
                if p67 then
                    local SetSelectedKit = u7.SetSelectedKit;

                    if SetSelectedKit ~= nil then
                        SetSelectedKit = SetSelectedKit(u66);
                    end;

                    SoundManager:playSound(GameSound.ARMOR_UNEQUIP);

                    if SetSelectedKit == nil and true or SetSelectedKit then
                        ClientStore:dispatch({
                            type = "SetBedwarsKit",
                            kit = u66
                        });
                        u10(u66);
                        u12(u66);
                    end;
                end;
            end);
        end;

        local function u79(u69) -- Line: 326
            -- upvalues: u7 (copy), u9 (copy), Flamework (ref), BedwarsAppIds (ref), u10 (copy), u68 (copy), u3 (ref), KitShopItemCard (ref), KitShopBundleCard (ref), u25 (copy)
            local function v73(p70, p71) -- Line: 327
                -- upvalues: u69 (copy), u7 (ref), u9 (ref), Flamework (ref), BedwarsAppIds (ref), u10 (ref), u68 (ref), u3 (ref), KitShopItemCard (ref), KitShopBundleCard (ref)
                local ShouldFilter = u69.ShouldFilter;

                if ShouldFilter ~= nil then
                    ShouldFilter = ShouldFilter(p70);
                end;

                if ShouldFilter then
                    return nil;
                end;

                if p70.bedwarsKit then
                    local bedwarsKit = p70.bedwarsKit;

                    if u7.CustomKitView and table.find(u7.CustomKitView, bedwarsKit) == nil then
                        return nil;
                    end;

                    local v72 = {
                        Kit = bedwarsKit,
                        Selected = u9 == bedwarsKit,
                        LayoutOrder = p71,
                        store = u7.store,

                        OnClick = function() -- Line: 345, Name: OnClick
                            -- upvalues: u7 (ref), bedwarsKit (copy), Flamework (ref), BedwarsAppIds (ref), u10 (ref)
                            local BannedKits = u7.BannedKits;

                            if BannedKits ~= nil then
                                BannedKits = table.find(BannedKits, bedwarsKit) ~= nil;
                            end;

                            if BannedKits then
                                return nil;
                            end;

                            if u7.SelectionMode == "OPEN_DETAILS" then
                                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
                                    SelectedKit = bedwarsKit
                                });
                            end;

                            if u7.SelectionMode == "OPEN_DETAILS" or u7.SelectionMode == "SELECTION_ONLY" then
                                local SetSelectedKit = u7.SetSelectedKit;

                                if SetSelectedKit ~= nil then
                                    SetSelectedKit = SetSelectedKit(bedwarsKit);
                                end;

                                if SetSelectedKit == nil and true or SetSelectedKit then
                                    u10(bedwarsKit);
                                end;
                            end;
                        end,

                        OnRightClick = function() -- Line: 373, Name: OnRightClick
                            -- upvalues: u68 (ref), bedwarsKit (copy)
                            u68(bedwarsKit);
                        end,

                        SelectionMode = u7.SelectionMode
                    };
                    local BannedKits = u7.BannedKits;

                    if BannedKits ~= nil then
                        BannedKits = table.find(BannedKits, bedwarsKit) ~= nil;
                    end;

                    v72.Banned = BannedKits;

                    return u3.createElement(KitShopItemCard, v72);
                end;

                if p70.kitBundle and u7.SelectionMode ~= "VIEW_ONLY" then
                    local kitBundle = p70.kitBundle;

                    return u3.createElement(KitShopBundleCard, {
                        Selected = false,
                        Bundle = kitBundle,
                        LayoutOrder = p71,

                        OnClick = function() -- Line: 390, Name: OnClick
                            -- upvalues: Flamework (ref), BedwarsAppIds (ref), kitBundle (copy)
                            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
                                SelectedBundle = kitBundle
                            });
                        end,

                        store = u7.store
                    });
                end;
            end;

            local v74 = 0;
            local v75 = {};

            for i, v in u25 do
                local v76 = v73(v, i - 1, u25);

                if v76 ~= nil then
                    v74 = v74 + 1;
                    v75[v74] = v76;
                end;
            end;

            local v77 = {};
            local v78 = #v77;

            for i, v in v75 do
                v77[v78 + i] = v;
            end;

            return u3.createFragment(v77);
        end;

        local function v160() -- Line: 419
            -- upvalues: BedwarsKitShop (ref), u7 (copy), DeviceUtil (ref), PlaceUtil (ref), KnitClient (ref), getBedwarsKitMeta (ref), BedwarsKitMeta (ref), u2 (ref), BattlePassUtils (ref), BundleType (ref), BundleMeta (ref), u24 (copy), u26 (copy)
            local ShopKits = BedwarsKitShop.ShopKits;

            if u7.ShowAllKits then
                ShopKits = BedwarsKitShop.ShopKits;
            elseif not DeviceUtil.isHoarceKat() then
                local CustomKitList = u7.CustomKitList;

                if CustomKitList == nil then
                    CustomKitList = PlaceUtil.isLobbyServer();
                end;

                if CustomKitList then
                    ShopKits = BedwarsKitShop.ShopKits;
                else
                    ShopKits = KnitClient.Controllers.UnlockController:getUnlockedShopKits();
                end;
            end;

            local function v114(p80, u81) -- Line: 432
                -- upvalues: getBedwarsKitMeta (ref), BedwarsKitShop (ref), u7 (ref), DeviceUtil (ref), KnitClient (ref), BedwarsKitMeta (ref)
                local function _(p82) -- Line: 434
                    -- upvalues: getBedwarsKitMeta (ref)
                    return not getBedwarsKitMeta(p82).hiddenInShop;
                end;

                local v83 = 0;
                local v84 = {};

                for i, v in p80 do
                    local _ = i - 1;

                    if not getBedwarsKitMeta(v).hiddenInShop == true then
                        v83 = v83 + 1;
                        v84[v83] = v;
                    end;
                end;

                local function v88(p85) -- Line: 447
                    -- upvalues: u81 (copy), BedwarsKitShop (ref), u7 (ref)
                    local v86 = u81;

                    if v86 ~= nil then
                        v86 = v86.includeFavoriteKits;
                    end;

                    if v86 then
                        return true;
                    end;

                    local v87 = u81;

                    if v87 ~= nil then
                        v87 = v87.includeFreeKitsOfTheWeek;
                    end;

                    if v87 then
                        local Bedwars = u7.store.Bedwars;

                        if Bedwars ~= nil then
                            Bedwars = Bedwars.freeKitLevel;
                        end;

                        return BedwarsKitShop.FreeKitRotation.kitAvailableThisWeek(p85, Bedwars);
                    end;

                    local Bedwars = u7.store.Bedwars;

                    if Bedwars ~= nil then
                        Bedwars = Bedwars.freeKitLevel;
                    end;

                    return not BedwarsKitShop.FreeKitRotation.kitAvailableThisWeek(p85, Bedwars);
                end;

                local v89 = 0;
                local v90 = {};

                for i, v in v84 do
                    if v88(v, i - 1, v84) == true then
                        v89 = v89 + 1;
                        v90[v89] = v;
                    end;
                end;

                local function _(p91) -- Line: 490
                    -- upvalues: u81 (copy), u7 (ref)
                    local v92 = u81;

                    if v92 ~= nil then
                        v92 = v92.includeFavoriteKits;
                    end;

                    return not (not v92 and u7.store.Bedwars.favoriteKits[p91] ~= nil);
                end;

                local v93 = 0;
                local v94 = {};

                for i, v in v90 do
                    local _ = i - 1;
                    local v95;

                    if u81 == nil then
                        v95 = u81;
                    else
                        v95 = u81.includeFavoriteKits;
                    end;

                    if not (not v95 and u7.store.Bedwars.favoriteKits[v] ~= nil) == true then
                        v93 = v93 + 1;
                        v94[v93] = v;
                    end;
                end;

                local function v100(p96) -- Line: 516
                    -- upvalues: getBedwarsKitMeta (ref), DeviceUtil (ref), KnitClient (ref), u7 (ref), BedwarsKitShop (ref)
                    if not getBedwarsKitMeta(p96).hiddenInShopTillUnlocked then
                        return true;
                    end;

                    local v97 = not DeviceUtil.isHoarceKat() and KnitClient.Controllers.UnlockController.allKitsUnlocked and true or false;
                    local v98 = table.find(u7.store.Bedwars.ownedKits, p96) ~= nil and true or v97;
                    local Bedwars = u7.store.Bedwars;

                    if Bedwars ~= nil then
                        Bedwars = Bedwars.freeKitLevel;
                    end;

                    local v99 = BedwarsKitShop.FreeKitRotation.kitAvailableThisWeek(p96, Bedwars) and true or v98;

                    return u7.ShowAllKits and true or v99;
                end;

                local v101 = 0;
                local v102 = {};

                for i, v in v94 do
                    if v100(v, i - 1, v94) == true then
                        v101 = v101 + 1;
                        v102[v101] = v;
                    end;
                end;

                local function v107(p103) -- Line: 556
                    -- upvalues: BedwarsKitMeta (ref), u81 (copy), DeviceUtil (ref), KnitClient (ref), BedwarsKitShop (ref), u7 (ref)
                    local v104 = BedwarsKitMeta[p103];

                    if v104.battlepassSeason ~= nil then
                        local v105 = u81;

                        if v105 ~= nil then
                            v105 = v105.includeBattlePassKits;
                        end;

                        if not v105 then
                            return false;
                        end;

                        if not DeviceUtil.isHoarceKat() and KnitClient.Controllers.UnlockController.allKitsUnlocked then
                            return true;
                        end;

                        if BedwarsKitShop.FreeKitRotation.kitAvailableThisWeek(p103, u7.store.Bedwars.freeKitLevel) then
                            return true;
                        end;
                    end;

                    local v106 = u81;

                    if v106 ~= nil then
                        v106 = v106.includeFeaturedKits;
                    end;

                    return not (not v106 and v104.featured ~= nil);
                end;

                local v108 = 0;
                local v109 = {};

                for i, v in v102 do
                    if v107(v, i - 1, v102) == true then
                        v108 = v108 + 1;
                        v109[v108] = v;
                    end;
                end;

                table.sort(v109, function(p110, p111) -- Line: 606
                    -- upvalues: BedwarsKitMeta (ref)
                    return BedwarsKitMeta[p110].name < BedwarsKitMeta[p111].name;
                end);

                local function _(p112) -- Line: 612
                    return {
                        bedwarsKit = p112
                    };
                end;

                local v113 = table.create(#v109);

                for i, v in v109 do
                    local _ = i - 1;
                    v113[i] = {
                        bedwarsKit = v
                    };
                end;

                return v113;
            end;

            local v115 = v114(u2.keys(u7.store.Bedwars.favoriteKits), {
                includeFreeKitsOfTheWeek = true,
                includeBattlePassKits = true,
                includeFeaturedKits = true,
                includeFavoriteKits = true
            });

            local function _(p116) -- Line: 635
                -- upvalues: getBedwarsKitMeta (ref)
                if getBedwarsKitMeta(p116).freeKit then
                    return {
                        bedwarsKit = p116
                    };
                end;
            end;

            local v117 = 0;
            local v118 = {};

            for i, v in u2.values(ShopKits) do
                local _ = i - 1;
                local v119 = getBedwarsKitMeta(v).freeKit and {
                    bedwarsKit = v
                } or nil;

                if v119 ~= nil then
                    v117 = v117 + 1;
                    v118[v117] = v119;
                end;
            end;

            local v120 = v114(u2.values(ShopKits), {
                includeFreeKitsOfTheWeek = true,
                includeBattlePassKits = true
            });

            local function _(p121) -- Line: 662
                -- upvalues: getBedwarsKitMeta (ref)
                return getBedwarsKitMeta(p121).featured ~= nil;
            end;

            local v122 = 0;
            local v123 = {};

            for i, v in u2.values(ShopKits) do
                local _ = i - 1;

                if getBedwarsKitMeta(v).featured ~= nil == true then
                    v122 = v122 + 1;
                    v123[v122] = v;
                end;
            end;

            local v124 = v114(v123, {
                includeFeaturedKits = true,
                includeBattlePassKits = true
            });
            local v125 = v114(u2.values(ShopKits));

            local function _(p126) -- Line: 683
                -- upvalues: getBedwarsKitMeta (ref), BattlePassUtils (ref)
                local battlepassSeason = getBedwarsKitMeta(p126).battlepassSeason;

                if battlepassSeason and battlepassSeason ~= BattlePassUtils.BATTLE_PASS_SEASON then
                    return p126;
                end;
            end;

            local v127 = 0;
            local v128 = {};

            for i, v in u2.values(ShopKits) do
                local _ = i - 1;
                local battlepassSeason = getBedwarsKitMeta(v).battlepassSeason;

                if not battlepassSeason or battlepassSeason == BattlePassUtils.BATTLE_PASS_SEASON then
                    local v = nil;
                end;

                if v ~= nil then
                    v127 = v127 + 1;
                    v128[v127] = v;
                end;
            end;

            table.sort(v128, function(p129, p130) -- Line: 700
                -- upvalues: getBedwarsKitMeta (ref)
                local v131 = string.split(getBedwarsKitMeta(p129).battlepassSeason, "season")[2];
                local v132 = tonumber(v131);
                local v133 = string.split(getBedwarsKitMeta(p130).battlepassSeason, "season")[2];
                local v134 = tonumber(v133);

                return ((v134 == 0 or (v134 ~= v134 or not v134)) and 0 or v134) < ((v132 == 0 or (v132 ~= v132 or not v132)) and 0 or v132);
            end);
            local v135 = v114(v128, {
                includeBattlePassKits = true
            });
            local v136;

            if PlaceUtil.isLobbyServer() then
                local v137 = u2.values(BundleType);

                local function v142(p138) -- Line: 721
                    -- upvalues: BundleMeta (ref)
                    local v139 = BundleMeta[p138];
                    local v140 = v139.kitShopBundle ~= nil;

                    if v140 then
                        local function _(p141) -- Line: 727
                            return p141.kit ~= nil;
                        end;

                        v140 = false;

                        for i, v in v139.rewards do
                            local _ = i - 1;

                            if v.kit ~= nil then
                                v140 = true;
                                break;
                            end;
                        end;
                    end;

                    if not v140 then
                        return false;
                    end;

                    local kitShopBundle = v139.kitShopBundle;

                    if kitShopBundle ~= nil then
                        kitShopBundle = kitShopBundle.disabled;
                    end;

                    return not kitShopBundle;
                end;

                local v143 = 0;
                local v144 = {};

                for i, v in v137 do
                    if v142(v, i - 1, v137) == true then
                        v143 = v143 + 1;
                        v144[v143] = v;
                    end;
                end;

                table.sort(v144, function(p145, p146) -- Line: 768
                    -- upvalues: BundleMeta (ref)
                    return BundleMeta[p145].name < BundleMeta[p146].name;
                end);

                local function _(p147) -- Line: 774
                    return {
                        kitBundle = p147
                    };
                end;

                v136 = table.create(#v144);

                for i, v in v144 do
                    local _ = i - 1;
                    v136[i] = {
                        kitBundle = v
                    };
                end;
            else
                v136 = {};
            end;

            local v148 = {};
            local v149 = #v148;
            local v150 = #v115;
            table.move(v115, 1, v150, v149 + 1, v148);
            local v151 = v149 + v150;
            local v152 = #v120;
            table.move(v120, 1, v152, v151 + 1, v148);
            local v153 = v151 + v152;
            local v154 = #v124;
            table.move(v124, 1, v154, v153 + 1, v148);
            local v155 = v153 + v154;
            local v156 = #v136;
            table.move(v136, 1, v156, v155 + 1, v148);
            local v157 = v155 + v156;
            local v158 = #v125;
            table.move(v125, 1, v158, v157 + 1, v148);
            table.move(v135, 1, #v135, v157 + v158 + 1, v148);
            u24(v148);
            local v159 = {};
            table.move(v148, 1, #v148, #v159 + 1, v159);
            u26(v159);
        end;

        local Bedwars = u7.store.Bedwars;

        if Bedwars ~= nil then
            Bedwars = Bedwars.ownedKits;
        end;

        useEffect(v160, {
            u19,
            u15,
            u17,
            Bedwars,
            u7.ShowAllKits,
            u34
        });
        useEffect(function() -- Line: 822
            -- upvalues: u23 (copy), u56 (copy), u26 (copy)
            if #u23 == 0 then
                return nil;
            end;

            u26((u56()));
        end, {
            u19,
            u15,
            u17,
            u34
        });
        useEffect(function() -- Line: 830
            -- upvalues: ClientStore (ref), u29 (copy), u32 (copy), u30 (copy), u31 (copy), u33 (copy)
            return function() -- Line: 831
                -- upvalues: ClientStore (ref), u29 (ref), u32 (ref), u30 (ref), u31 (ref), u33 (ref)
                ClientStore:dispatch({
                    type = "LobbySetKitShopFilters",
                    kitShop = {
                        CanvasPositionY = u29.value,
                        FavoritedToggle = u32.value,
                        KitClassFilter = u30.value,
                        OwnedFilter = u31.value,
                        SearchText = u33.value
                    }
                });
            end;
        end, {});
        useEffect(function() -- Line: 844
            -- upvalues: u32 (copy), u19 (copy), u30 (copy), u15 (copy), u31 (copy), u17 (copy), u33 (copy), u21 (copy)
            u32.value = u19;
            u30.value = u15;
            u31.value = u17;
            u33.value = u21;
        end, {
            u19,
            u15,
            u17,
            u21
        });
        useEffect(function() -- Line: 850
            -- upvalues: u36 (copy), u34 (copy), u35 (copy), u7 (copy)
            local u161 = u36:getValue();

            if not u161 then
                return nil;
            end;

            task.defer(function() -- Line: 855
                -- upvalues: u34 (ref), u35 (ref), u161 (copy), u7 (ref)
                if u34 then
                    return nil;
                end;

                u35(true);
                local InitialState10 = u7.InitialState;

                if InitialState10 ~= nil then
                    InitialState10 = InitialState10.CanvasPositionY;
                end;

                u161.CanvasPosition = Vector2.new(u161.CanvasPosition.X, InitialState10);
            end);
        end, { u34 });
        local v162 = {};

        for i, v in u7 do
            v162[i] = v;
        end;

        v162.store = nil;
        v162.ShowAllKits = nil;
        v162.CustomKitList = nil;
        v162.ExcludeNonShopKits = nil;
        v162.ScrollingFrameProps = nil;
        v162.SelectedKit = nil;
        v162.SetSelectedKit = nil;
        v162.SelectionMode = nil;
        v162.BannedKits = nil;
        v162.InitialState = nil;
        v162.CustomKitView = nil;

        local function v181() -- Line: 886
            -- upvalues: u3 (ref), u36 (copy), u29 (copy), u37 (copy), GetUIScaleAncestors (ref), CalcTotalUIScale (ref), u14 (copy), u7 (copy), u40 (copy), u41 (copy), u38 (copy), KitShopItemCard (ref), BedwarsKit (ref), u9 (copy), Flamework (ref), BedwarsAppIds (ref), u68 (copy), u79 (copy), DeviceUtil (ref), getBedwarsKitMeta (ref), BedwarsKitShop (ref), ClientStore (ref), KnitClient (ref), Empty (ref), BedwarsImageId (ref), u39 (copy)
            local v167 = {
                [u3.Ref] = u36,
                Size = UDim2.fromScale(1, 1),
                CanvasSize = UDim2.new(1, 0, 0, 0),
                AutomaticCanvasSize = "Y",
                ScrollingDirection = "Y",
                ScrollBarThickness = 6,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Selectable = false,

                [u3.Change.CanvasPosition] = function(p163) -- Line: 897
                    -- upvalues: u29 (ref)
                    u29.value = math.round(p163.CanvasPosition.Y / 100) * 100;
                end,

                [u3.Change.AbsoluteSize] = function(p164) -- Line: 900
                    -- upvalues: u37 (ref), GetUIScaleAncestors (ref), CalcTotalUIScale (ref), u14 (ref)
                    local v165 = u37:getValue();

                    if not v165 then
                        u14(p164.AbsoluteSize);

                        return;
                    end;

                    local v166 = CalcTotalUIScale((GetUIScaleAncestors(v165)));
                    u14(p164.AbsoluteSize * (1 / v166));
                end,

                LayoutOrder = 2
            };
            local ScrollingFrameProps = u7.ScrollingFrameProps;

            if ScrollingFrameProps then
                for i, v in ScrollingFrameProps do
                    v167[i] = v;
                end;
            end;

            local v168 = { u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 24)
                }), u3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 3),
                    PaddingTop = UDim.new(0, 12),
                    PaddingBottom = UDim.new(0, 12)
                }) };
            local v169 = #v168;
            local v170 = {
                AutomaticSize = "Y",
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0)
            };
            local v171 = { u3.createElement("UIGridLayout", {
                    CellSize = UDim2.fromOffset(u40, u40),
                    CellPadding = UDim2.fromOffset(u41, u41),
                    HorizontalAlignment = "Left",
                    VerticalAlignment = "Top",
                    SortOrder = "LayoutOrder",
                    FillDirectionMaxCells = 5,
                    [u3.Ref] = u38
                }) };
            local v172 = #v171;
            local v173 = not u7.ExcludeNonShopKits and u3.createElement(KitShopItemCard, {
                LayoutOrder = -3,
                Kit = BedwarsKit.NONE,
                Selected = u9 == BedwarsKit.NONE and true or u9 == nil,
                store = u7.store,

                OnClick = function() -- Line: 955, Name: OnClick
                    -- upvalues: u7 (ref), Flamework (ref), BedwarsAppIds (ref), BedwarsKit (ref)
                    if u7.SelectionMode == "OPEN_DETAILS" then
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
                            SelectedKit = BedwarsKit.NONE
                        });
                    end;

                    if u7.SelectionMode == "OPEN_DETAILS" or u7.SelectionMode == "SELECTION_ONLY" then
                        local SetSelectedKit = u7.SetSelectedKit;

                        if SetSelectedKit ~= nil then
                            SetSelectedKit(BedwarsKit.NONE);
                        end;
                    end;
                end,

                OnRightClick = function() -- Line: 968, Name: OnRightClick
                    -- upvalues: u68 (ref), BedwarsKit (ref)
                    u68(BedwarsKit.NONE);
                end,

                SelectionMode = u7.SelectionMode
            });

            if v173 then
                v171[v172 + 1] = v173;
            end;

            v171[#v171 + 1] = u3.createElement(u79, {
                ShouldFilter = function(p174) -- Line: 978, Name: ShouldFilter
                    -- upvalues: u7 (ref), DeviceUtil (ref), BedwarsKit (ref), getBedwarsKitMeta (ref), BedwarsKitShop (ref), ClientStore (ref), KnitClient (ref)
                    if u7.SelectionMode ~= "OPEN_DETAILS" then
                        return false;
                    end;

                    if not p174.bedwarsKit then
                        return p174.kitBundle and true or false;
                    end;

                    local v175;

                    if DeviceUtil.isHoarceKat() then
                        v175 = p174.bedwarsKit == BedwarsKit.NONE and true or (getBedwarsKitMeta(p174.bedwarsKit).freeKit or BedwarsKitShop.FreeKitRotation.kitAvailableThisWeek(p174.bedwarsKit, ClientStore:getState().Bedwars.freeKitLevel));

                        if not v175 then
                            local ownedKits = ClientStore:getState().Bedwars.ownedKits;
                            v175 = table.find(ownedKits, p174.bedwarsKit) ~= nil;
                        end;
                    else
                        v175 = KnitClient.Controllers.UnlockController:isKitUnlocked(p174.bedwarsKit);
                    end;

                    return not v175;
                end
            });
            v168.UnlockedKits = u3.createElement(Empty, v170, v171);
            local v176;

            if u7.SelectionMode == "OPEN_DETAILS" then
                v176 = u3.createFragment({
                    Divider = u3.createElement(Empty, {
                        LayoutOrder = 2,
                        Size = UDim2.new(0.96, 0, 0, 24)
                    }, {
                        u3.createElement("Frame", {
                            BorderSizePixel = 0,
                            Size = UDim2.new(0.3, 0, 0, 2),
                            Position = UDim2.fromScale(0, 0.5),
                            AnchorPoint = Vector2.new(0, 0.5),
                            BackgroundColor3 = Color3.fromRGB(217, 217, 217)
                        }),
                        u3.createElement("ImageLabel", {
                            BackgroundTransparency = 1,
                            Size = UDim2.new(1, 0, 0.4, 0),
                            Position = UDim2.fromScale(0, 0.5),
                            AnchorPoint = Vector2.new(0, 0),
                            Image = BedwarsImageId.CARET_DOWN,
                            ImageColor3 = Color3.fromRGB(217, 217, 217)
                        }, { u3.createElement("UIAspectRatioConstraint", {
                                AspectRatio = 1.3355855855855854
                            }) }),
                        u3.createElement("TextLabel", {
                            Text = "KITS TO BE UNLOCKED",
                            TextScaled = true,
                            TextXAlignment = "Center",
                            TextYAlignment = "Center",
                            BackgroundTransparency = 1,
                            Size = UDim2.fromScale(0.36, 1),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                            TextColor3 = Color3.new(255, 255, 255)
                        }),
                        u3.createElement("Frame", {
                            BorderSizePixel = 0,
                            Size = UDim2.new(0.3, 0, 0, 2),
                            Position = UDim2.fromScale(1, 0.5),
                            AnchorPoint = Vector2.new(1, 0.5),
                            BackgroundColor3 = Color3.fromRGB(217, 217, 217)
                        }),
                        u3.createElement("ImageLabel", {
                            BackgroundTransparency = 1,
                            Size = UDim2.new(1, 0, 0.4, 0),
                            Position = UDim2.fromScale(1, 0.5),
                            AnchorPoint = Vector2.new(1, 0),
                            Image = BedwarsImageId.CARET_DOWN,
                            ImageColor3 = Color3.fromRGB(217, 217, 217)
                        }, { u3.createElement("UIAspectRatioConstraint", {
                                AspectRatio = 1.3355855855855854
                            }) })
                    })
                });
            else
                v176 = false;
            end;

            if v176 then
                v168[v169 + 1] = v176;
            end;

            local v177 = #v168;
            local v178;

            if u7.SelectionMode == "OPEN_DETAILS" then
                v178 = u3.createFragment({
                    NotUnlockedKits = u3.createElement(Empty, {
                        AutomaticSize = "Y",
                        LayoutOrder = 3,
                        Size = UDim2.fromScale(1, 0)
                    }, { u3.createElement("UIGridLayout", {
                            CellSize = UDim2.fromOffset(u40, u40),
                            CellPadding = UDim2.fromOffset(u41, u41),
                            HorizontalAlignment = "Left",
                            VerticalAlignment = "Top",
                            SortOrder = "LayoutOrder",
                            FillDirectionMaxCells = 5,
                            [u3.Ref] = u39
                        }), u3.createElement(u79, {
                            ShouldFilter = function(p179) -- Line: 1081, Name: ShouldFilter
                                -- upvalues: u7 (ref), DeviceUtil (ref), BedwarsKit (ref), getBedwarsKitMeta (ref), BedwarsKitShop (ref), ClientStore (ref), KnitClient (ref)
                                if u7.SelectionMode ~= "OPEN_DETAILS" or not p179.bedwarsKit then
                                    return false;
                                end;

                                if not DeviceUtil.isHoarceKat() then
                                    return KnitClient.Controllers.UnlockController:isKitUnlocked(p179.bedwarsKit);
                                end;

                                local v180 = p179.bedwarsKit == BedwarsKit.NONE and true or (getBedwarsKitMeta(p179.bedwarsKit).freeKit or BedwarsKitShop.FreeKitRotation.kitAvailableThisWeek(p179.bedwarsKit, ClientStore:getState().Bedwars.freeKitLevel));

                                if not v180 then
                                    local ownedKits = ClientStore:getState().Bedwars.ownedKits;
                                    v180 = table.find(ownedKits, p179.bedwarsKit) ~= nil;
                                end;

                                return v180;
                            end
                        }) })
                });
            else
                v178 = false;
            end;

            if v178 then
                v168[v177 + 1] = v178;
            end;

            return u3.createFragment({
                LobbyKitShopItemList = u3.createElement("ScrollingFrame", v167, v168)
            });
        end;

        local sharedData = u7.store.Draft.sharedData;

        if sharedData ~= nil then
            sharedData = sharedData.matchDraftPhase;
        end;

        local v182 = useMemo(v181, {
            u25,
            u27,
            u7.SelectionMode,
            u7.ExcludeNonShopKits,
            sharedData,
            u9,
            v11,
            v13
        });
        local v183 = {};

        for i, v in v162 do
            v183[i] = v;
        end;

        v183[u3.Ref] = u37;
        v183.AutoButtonColor = false;
        v183.Selectable = false;
        v183.BackgroundTransparency = 1;
        local v184 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local _ = #v184;
        local v185 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.15)
        };
        local v186 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local _ = #v186;
        local v187 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.65, 1)
        };
        local v191 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.05, 0)
            }), u3.createElement("UIPadding", {
                PaddingBottom = UDim.new(0.05, 0)
            }), u3.createElement(KitShopFilters, {
                Size = UDim2.fromScale(1, 0.6),
                Position = UDim2.fromScale(0, 0.5),
                AnchorPoint = Vector2.new(0, 0.5),

                SetKitClassFilter = function(p188) -- Line: 1166, Name: SetKitClassFilter
                    -- upvalues: u16 (copy)
                    return u16(p188);
                end,

                SetOwnedFilter = function(p189) -- Line: 1169, Name: SetOwnedFilter
                    -- upvalues: u18 (copy)
                    return u18(p189);
                end,

                SetFavoritedToggle = function(p190) -- Line: 1172, Name: SetFavoritedToggle
                    -- upvalues: u20 (copy)
                    return u20(p190);
                end,

                KitClassFilter = u15,
                OwnedFilter = u17,
                FavoritedToggle = u19
            }) };
        local v192 = {
            BarTransparency = 0.5,
            Size = UDim2.fromScale(1, 0.4),
            BarColor = ColorUtil.BLACK,
            CornerRadius = UDim.new(0.1, 0)
        };

        local function v197(p193, p194) -- Line: 1187
            -- upvalues: getBedwarsKitMeta (ref), BundleMeta (ref)
            if p194.bedwarsKit then
                local v195 = {
                    key = getBedwarsKitMeta(p194.bedwarsKit).name
                };
                table.insert(p193, v195);

                return p193;
            end;

            local v196 = p194.kitBundle and BundleMeta[p194.kitBundle].kitShopBundle;

            if v196 then
                table.insert(p193, {
                    key = v196.name
                });
            end;

            return p193;
        end;

        local v198 = {};

        for i = 1, #u23 do
            v198 = v197(v198, u23[i], i - 1, u23);
        end;

        v192.Items = v198;
        v192.InputText = u21;

        function v192.OnTextChange(p199, p200) -- Line: 1215
            -- upvalues: u22 (copy), u26 (copy), u65 (copy)
            u22(p199);
            u26((u65(p199, p200)));
        end;

        v192.PlaceHolderText = "Search Kit";
        v191[#v191 + 1] = u3.createElement(AutoCompleteSearchbar, v192, { u3.createElement("UIStroke", {
                Transparency = 0.5,
                Thickness = 1,
                Color = ColorUtil.WHITE
            }) });
        v186.Filters = u3.createElement(Empty, v187, v191);
        v186.EquippedKit = u3.createElement(Empty, {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.35, 1)
        }, { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }), u3.createElement(Empty, {
                Size = UDim2.fromScale(0.5, 1)
            }, { u3.createElement("Frame", {
                    BackgroundTransparency = 0.5,
                    Size = UDim2.fromScale(1, 0.75),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = ColorUtil.BLACK
                }, {
                    u3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.1, 0),
                        PaddingBottom = UDim.new(0.1, 0),
                        PaddingLeft = UDim.new(0.1, 0),
                        PaddingRight = UDim.new(0.1, 0)
                    }),
                    u3.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 5)
                    }),
                    u3.createElement(
                        "UIListLayout",
                        {
                            FillDirection = "Vertical",
                            HorizontalAlignment = "Center",
                            VerticalFlex = "SpaceAround",
                            SortOrder = "LayoutOrder"
                        }
                    ),
                    u3.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        RichText = true,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.4),
                        Text = "<font color=\"" .. ColorUtil.richTextColor(ColorUtil.WHITE) .. "\" transparency=\"" .. tostring(0.5) .. "\">Equipped</font>",
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
                        TextXAlignment = Enum.TextXAlignment.Center,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }, { u3.createElement("UITextSizeConstraint", {
                            MaxTextSize = 24,
                            MinTextSize = 6
                        }) }),
                    u3.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        RichText = true,
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(1, 0.5),
                        Text = "<b>" .. v42.name .. "</b>",
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
                        TextXAlignment = Enum.TextXAlignment.Center,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }, { u3.createElement("UITextSizeConstraint", {
                            MaxTextSize = 32,
                            MinTextSize = 8
                        }) })
                }) }), u3.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.5, 1),
                ScaleType = Enum.ScaleType.Fit,
                Image = v43
            }, { u3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) }) });
        v184.FiltersContainer = u3.createElement(Empty, v185, v186);
        v184.KitListContainer = u3.createElement(Empty, {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.85)
        }, { v182 });

        return u3.createElement("ImageButton", v183, v184);
    end)
};