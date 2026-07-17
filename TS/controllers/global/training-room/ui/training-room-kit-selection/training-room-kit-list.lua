-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local KitShopFilters = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "kit-shop", "filters", "kit-shop-filters").KitShopFilters;
local KitShopItemCard = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "lobby-kit-shop", "shop-items", "lobby-kit-shop-item-card").KitShopItemCard;
local AutoCompleteSearchbar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta");
local BedwarsBPKits = v5.BedwarsBPKits;
local BedwarsKitMeta = v5.BedwarsKitMeta;
local getBedwarsKitMeta = v5.getBedwarsKitMeta;
local BedwarsKitShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    TrainingRoomKitList = v4.new(u3)(function(u6, p7) -- Line: 21
        -- upvalues: getBedwarsKitMeta (copy), BedwarsKitShop (copy), BedwarsKitMeta (copy), DeviceUtil (copy), KnitClient (copy), u2 (copy), BedwarsBPKits (copy), BattlePassUtils (copy), Theme (copy), u3 (copy), KitShopFilters (copy), AutoCompleteSearchbar (copy), Empty (copy), KitShopItemCard (copy), BedwarsKit (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local v8, u9 = useState(Vector2.new(584, 443));
        local v10, u11 = useState(443);
        local u12, u13 = useState(false);
        local v14, u15 = useState(false);
        local u16, u17 = useState(false);
        local u18, u19 = useState("");
        local u20, u21 = useState("");
        local u22, u23 = useState({});
        local u24, u25 = useState({});
        local u26, u27 = useState({});
        local v28 = math.floor(v8.X * 0.2191780821917808);
        local v29 = math.floor(v8.X * 0.03571428571428571);

        local function u47() -- Line: 43
            -- upvalues: u6 (copy), u26 (copy), u22 (copy), u16 (copy), getBedwarsKitMeta (ref), u12 (copy), u18 (copy), u20 (copy), u24 (copy)
            local ownedKits = u6.store.Bedwars.ownedKits;
            local v30;

            if #u26 == 0 then
                v30 = u22;
            else
                v30 = u26;
            end;

            if u16 then
                local function _(p31) -- Line: 48
                    -- upvalues: getBedwarsKitMeta (ref)
                    if p31.bedwarsKit then
                        return getBedwarsKitMeta(p31.bedwarsKit).unlockedInBattlePass;
                    end;

                    return false;
                end;

                local v32 = 0;
                v30 = {};

                for i, v in v30 do
                    local _ = i - 1;
                    local v33;

                    if v.bedwarsKit then
                        v33 = getBedwarsKitMeta(v.bedwarsKit).unlockedInBattlePass;
                    else
                        v33 = false;
                    end;

                    if v33 == true then
                        v32 = v32 + 1;
                        v30[v32] = v;
                    end;
                end;
            end;

            if u12 then
                local function _(p34) -- Line: 69
                    -- upvalues: ownedKits (copy)
                    if p34.bedwarsKit then
                        return table.find(ownedKits, p34.bedwarsKit) ~= nil;
                    end;

                    return false;
                end;

                local v35 = 0;
                v30 = {};

                for i, v in v30 do
                    local _ = i - 1;
                    local v36;

                    if v.bedwarsKit then
                        v36 = table.find(ownedKits, v.bedwarsKit) ~= nil;
                    else
                        v36 = false;
                    end;

                    if v36 == true then
                        v35 = v35 + 1;
                        v30[v35] = v;
                    end;
                end;
            end;

            if u18 ~= "" then
                local function _(p37) -- Line: 90
                    -- upvalues: getBedwarsKitMeta (ref), u18 (ref)
                    if not p37.bedwarsKit then
                        return false;
                    end;

                    local kitClass = getBedwarsKitMeta(p37.bedwarsKit).kitClass;

                    return tostring(kitClass) == u18;
                end;

                local v38 = 0;
                v30 = {};

                for i, v in v30 do
                    local _ = i - 1;
                    local v39;

                    if v.bedwarsKit then
                        local kitClass = getBedwarsKitMeta(v.bedwarsKit).kitClass;
                        v39 = tostring(kitClass) == u18;
                    else
                        v39 = false;
                    end;

                    if v39 == true then
                        v38 = v38 + 1;
                        v30[v38] = v;
                    end;
                end;
            end;

            if u20 ~= "" then
                local u44 = u20 == "A → Z" and function(p40, p41) -- Line: 113, Name: alphabetized
                    return p40 < p41;
                end or (u20 == "Z → A" and function(p42, p43) -- Line: 120, Name: reverseAlphabetized
                    return p43 < p42;
                end or nil);
                table.sort(v30, function(p45, p46) -- Line: 128
                    -- upvalues: getBedwarsKitMeta (ref), u44 (ref)
                    return u44(not p45.bedwarsKit and "" or string.lower(getBedwarsKitMeta(p45.bedwarsKit).name), not p46.bedwarsKit and "" or string.lower(getBedwarsKitMeta(p46.bedwarsKit).name));
                end);
            end;

            if v30 == u24 then
                return u22;
            end;

            return v30;
        end;

        local function u56(p48, p49) -- Line: 147
            -- upvalues: u27 (copy), u47 (copy), getBedwarsKitMeta (ref), u22 (copy)
            if p48 == "" then
                u27({});

                return u47();
            end;

            local u50 = {};

            local function v55(u51) -- Line: 154
                -- upvalues: getBedwarsKitMeta (ref), u22 (ref), u50 (copy)
                local function _(p52) -- Line: 155
                    -- upvalues: getBedwarsKitMeta (ref), u51 (copy)
                    if p52.bedwarsKit then
                        return string.lower(getBedwarsKitMeta(p52.bedwarsKit).name) == string.lower(u51);
                    end;
                end;

                local v53 = nil;

                for i, v in u22 do
                    local _ = i - 1;
                    local v54;

                    if v.bedwarsKit then
                        v54 = string.lower(getBedwarsKitMeta(v.bedwarsKit).name) == string.lower(u51);
                    else
                        v54 = nil;
                    end;

                    if v54 == true then
                        v53 = v;
                        break;
                    end;
                end;

                if v53 then
                    table.insert(u50, v53);
                end;
            end;

            for i, v in p49 do
                v55(v, i - 1, p49);
            end;

            u27(u50);

            return u50;
        end;

        useEffect(function() -- Line: 181
            -- upvalues: getBedwarsKitMeta (ref), BedwarsKitShop (ref), u6 (copy), BedwarsKitMeta (ref), DeviceUtil (ref), KnitClient (ref), u2 (ref), BedwarsBPKits (ref), BattlePassUtils (ref), u23 (copy), u25 (copy)
            local function u82(p57, u58) -- Line: 182
                -- upvalues: getBedwarsKitMeta (ref), BedwarsKitShop (ref), u6 (ref), BedwarsKitMeta (ref), DeviceUtil (ref), KnitClient (ref)
                local function _(p59) -- Line: 184
                    -- upvalues: getBedwarsKitMeta (ref)
                    return not getBedwarsKitMeta(p59).hiddenInShop;
                end;

                local v60 = 0;
                local v61 = {};

                for i, v in p57 do
                    local _ = i - 1;

                    if not getBedwarsKitMeta(v).hiddenInShop == true then
                        v60 = v60 + 1;
                        v61[v60] = v;
                    end;
                end;

                local function _(p62) -- Line: 197
                    -- upvalues: u58 (copy), BedwarsKitShop (ref), u6 (ref)
                    local v63 = u58;

                    if v63 ~= nil then
                        v63 = v63.includeFreeKits;
                    end;

                    if v63 then
                        return BedwarsKitShop.FreeKitRotation.kitAvailableThisWeek(p62, u6.store.Bedwars.freeKitLevel);
                    end;

                    return not BedwarsKitShop.FreeKitRotation.kitAvailableThisWeek(p62, u6.store.Bedwars.freeKitLevel);
                end;

                local v64 = 0;
                local v65 = {};

                for i, v in v61 do
                    local _ = i - 1;
                    local v66;

                    if u58 == nil then
                        v66 = u58;
                    else
                        v66 = u58.includeFreeKits;
                    end;

                    local v67;

                    if v66 then
                        v67 = BedwarsKitShop.FreeKitRotation.kitAvailableThisWeek(v, u6.store.Bedwars.freeKitLevel);
                    else
                        v67 = not BedwarsKitShop.FreeKitRotation.kitAvailableThisWeek(v, u6.store.Bedwars.freeKitLevel);
                    end;

                    if v67 == true then
                        v64 = v64 + 1;
                        v65[v64] = v;
                    end;
                end;

                local function _(p68) -- Line: 214
                    -- upvalues: getBedwarsKitMeta (ref)
                    return getBedwarsKitMeta(p68).hiddenInShopTillUnlocked and true or true;
                end;

                local v69 = 0;
                local v70 = {};

                for i, v in v65 do
                    local _ = i - 1;
                    local _ = getBedwarsKitMeta(v).hiddenInShopTillUnlocked;

                    if true == true then
                        v69 = v69 + 1;
                        v70[v69] = v;
                    end;
                end;

                local function v75(p71) -- Line: 232
                    -- upvalues: BedwarsKitMeta (ref), u58 (copy), DeviceUtil (ref), KnitClient (ref), BedwarsKitShop (ref), u6 (ref)
                    local v72 = BedwarsKitMeta[p71];

                    if v72.battlepassSeason ~= nil then
                        local v73 = u58;

                        if v73 ~= nil then
                            v73 = v73.includeBattlePassKits;
                        end;

                        if not v73 then
                            return false;
                        end;

                        if not DeviceUtil.isHoarceKat() and KnitClient.Controllers.UnlockController.allKitsUnlocked then
                            return true;
                        end;

                        if BedwarsKitShop.FreeKitRotation.kitAvailableThisWeek(p71, u6.store.Bedwars.freeKitLevel) then
                            return true;
                        end;
                    end;

                    local v74 = u58;

                    if v74 ~= nil then
                        v74 = v74.includeFeaturedKits;
                    end;

                    return not (not v74 and v72.featured ~= nil);
                end;

                local v76 = 0;
                local v77 = {};

                for i, v in v70 do
                    if v75(v, i - 1, v70) == true then
                        v76 = v76 + 1;
                        v77[v76] = v;
                    end;
                end;

                table.sort(v77, function(p78, p79) -- Line: 277
                    -- upvalues: BedwarsKitMeta (ref)
                    return BedwarsKitMeta[p78].name < BedwarsKitMeta[p79].name;
                end);

                local function _(p80) -- Line: 283
                    return {
                        bedwarsKit = p80
                    };
                end;

                local v81 = table.create(#v77);

                for i, v in v77 do
                    local _ = i - 1;
                    v81[i] = {
                        bedwarsKit = v
                    };
                end;

                return v81;
            end;

            local v83 = u82(u2.values(BedwarsKitShop.ShopKits), {
                includeFreeKits = true,
                includeBattlePassKits = true
            });

            local function _(p84) -- Line: 304
                -- upvalues: getBedwarsKitMeta (ref)
                return getBedwarsKitMeta(p84).featured ~= nil;
            end;

            local v85 = 0;
            local v86 = {};

            for i, v in u2.values(BedwarsKitShop.ShopKits) do
                local _ = i - 1;

                if getBedwarsKitMeta(v).featured ~= nil == true then
                    v85 = v85 + 1;
                    v86[v85] = v;
                end;
            end;

            local v87 = u82(v86, {
                includeFeaturedKits = true
            });
            local v88 = u82(BedwarsBPKits[BattlePassUtils.BATTLE_PASS_SEASON], {
                includeBattlePassKits = true
            });
            local v89 = u82(u2.values(BedwarsKitShop.ShopKits));
            local v90 = u2.entries(BedwarsBPKits);
            table.sort(v90, function(p91, p92) -- Line: 328
                local _ = p91[2];
                local _ = p92[2];

                return p92[1] < p91[1];
            end);

            local function v100(p93, p94) -- Line: 336
                -- upvalues: BattlePassUtils (ref), u82 (copy)
                local v95 = p94[2];

                if p94[1] == BattlePassUtils.BATTLE_PASS_SEASON then
                    return p93;
                end;

                local v96 = {};
                local v97 = #v96;
                local v98 = #p93;
                table.move(p93, 1, v98, v97 + 1, v96);
                local v99 = u82(v95, {
                    includeBattlePassKits = true
                });
                table.move(v99, 1, #v99, v97 + v98 + 1, v96);

                return v96;
            end;

            local v101 = {};

            for i = 1, #v90 do
                v101 = v100(v101, v90[i], i - 1, v90);
            end;

            local v102 = {};
            local v103 = #v102;
            local v104 = #v83;
            table.move(v83, 1, v104, v103 + 1, v102);
            local v105 = v103 + v104;
            local v106 = #v87;
            table.move(v87, 1, v106, v105 + 1, v102);
            local v107 = v105 + v106;
            local v108 = #v88;
            table.move(v88, 1, v108, v107 + 1, v102);
            local v109 = v107 + v108;
            local v110 = #v89;
            table.move(v89, 1, v110, v109 + 1, v102);
            table.move(v101, 1, #v101, v109 + v110 + 1, v102);
            u23(v102);
            local v111 = {};
            local v112 = #v111;
            local v113 = #v83;
            table.move(v83, 1, v113, v112 + 1, v111);
            local v114 = v112 + v113;
            local v115 = #v87;
            table.move(v87, 1, v115, v114 + 1, v111);
            local v116 = v114 + v115;
            local v117 = #v88;
            table.move(v88, 1, v117, v116 + 1, v111);
            local v118 = v116 + v117;
            local v119 = #v89;
            table.move(v89, 1, v119, v118 + 1, v111);
            table.move(v101, 1, #v101, v118 + v119 + 1, v111);
            u25(v111);
        end, {
            u12,
            u16,
            u18,
            u20,
            u6.store.Bedwars.ownedKits
        });
        useEffect(function() -- Line: 396
            -- upvalues: u22 (copy), u47 (copy), u25 (copy)
            if #u22 == 0 then
                return nil;
            end;

            u25((u47()));
        end, {
            u12,
            u16,
            u18,
            u20
        });
        local v120 = {
            BorderSizePixel = 0,
            Size = u6.Size,
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local v126 = { u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0.03, 0),
                PaddingBottom = UDim.new(0.05, 0),
                PaddingLeft = UDim.new(0.03, 0),
                PaddingRight = UDim.new(0.03, 0)
            }), u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.01, 0)
            }), u3.createElement(KitShopFilters, {
                LayoutOrder = 1,
                Visible = true,
                Size = UDim2.fromScale(1, 0.05),

                SetKitUnlockedToggle = function(p121) -- Line: 424, Name: SetKitUnlockedToggle
                    -- upvalues: u13 (copy)
                    u13(p121);
                end,

                SetBattlePassKitsToggle = function(p122) -- Line: 427, Name: SetBattlePassKitsToggle
                    -- upvalues: u17 (copy)
                    u17(p122);
                end,

                SetKitClassFilter = function(p123) -- Line: 430, Name: SetKitClassFilter
                    -- upvalues: u19 (copy)
                    u19(p123);
                end,

                SetKitSortAlgorithm = function(p124) -- Line: 433, Name: SetKitSortAlgorithm
                    -- upvalues: u21 (copy)
                    u21(p124);
                end,

                SetFavoritedToggle = function(p125) -- Line: 436, Name: SetFavoritedToggle
                    -- upvalues: u15 (copy)
                    u15(p125);
                end,

                FavoritedToggle = v14,
                KitUnlockedToggle = u12,
                BattlePassKitsToggle = u16,
                KitClassFilter = u18,
                KitSortAlgorirthm = u20
            }) };
        local v127 = #v126;
        local v128 = {
            LayoutOrder = 2,
            Size = UDim2.new(1, 0, DeviceUtil.isSmallScreen() and 0.08 or 0.06, 0)
        };
        local v129 = {};
        local v130 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.6, 1)
        };

        local function _(p131, p132) -- Line: 458
            -- upvalues: getBedwarsKitMeta (ref)
            if p132.bedwarsKit then
                local v133 = {
                    key = getBedwarsKitMeta(p132.bedwarsKit).name
                };
                table.insert(p131, v133);
            end;

            return p131;
        end;

        local v134 = {};

        for i = 1, #u22 do
            local v135 = u22[i];
            local _ = i - 1;

            if v135.bedwarsKit then
                local v136 = {
                    key = getBedwarsKitMeta(v135.bedwarsKit).name
                };
                table.insert(v134, v136);
            end;
        end;

        v130.Items = v134;
        v130.InputText = "";

        function v130.OnTextChange(p137, p138) -- Line: 477
            -- upvalues: u25 (copy), u56 (copy)
            u25((u56(p137, p138)));
        end;

        v130.PlaceHolderText = "Search Kit";
        v129[#v129 + 1] = u3.createElement(AutoCompleteSearchbar, v130);
        v126[v127 + 1] = u3.createElement(Empty, v128, v129);
        local v140 = {
            Size = UDim2.new(1, 0, DeviceUtil.isSmallScreen() and 0.87 or 0.89, 0),
            CanvasSize = UDim2.new(1, 0, 0.07, v10 + 36),
            ScrollingDirection = "Y",
            ScrollBarThickness = 6,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Selectable = false,

            [u3.Change.AbsoluteSize] = function(p139) -- Line: 491
                -- upvalues: u9 (copy)
                u9(p139.AbsoluteSize);
            end,

            LayoutOrder = 2
        };
        local v141 = {};

        local function v144(p142, p143) -- Line: 498
            -- upvalues: u3 (ref), KitShopItemCard (ref), u6 (copy)
            if p142.bedwarsKit then
                local bedwarsKit = p142.bedwarsKit;

                return u3.createElement(KitShopItemCard, {
                    Kit = bedwarsKit,
                    Selected = u6.SelectedKit == bedwarsKit,
                    LayoutOrder = p143,
                    store = u6.store,

                    OnClick = function() -- Line: 506, Name: OnClick
                        -- upvalues: u6 (ref), bedwarsKit (copy)
                        u6.SetSelectedKit(bedwarsKit);
                    end
                });
            end;
        end;

        local v145 = 0;
        local v146 = {};

        for i, v in u24 do
            local v147 = v144(v, i - 1, u24);

            if v147 ~= nil then
                v145 = v145 + 1;
                v146[v145] = v147;
            end;
        end;

        local v148 = {
            Position = UDim2.fromScale(0, 0.01),
            Size = UDim2.fromScale(0.99, 0.9)
        };
        local v150 = { u3.createElement("UIGridLayout", {
                CellSize = UDim2.fromOffset(v28, v28),
                CellPadding = UDim2.fromOffset(v29, v29),
                HorizontalAlignment = "Center",
                VerticalAlignment = "Top",
                SortOrder = "LayoutOrder",
                FillDirectionMaxCells = 4,

                [u3.Change.AbsoluteCellCount] = function(p149) -- Line: 535
                    -- upvalues: u11 (copy)
                    u11(p149.AbsoluteContentSize.Y);
                end
            }), u3.createElement(KitShopItemCard, {
                LayoutOrder = -2,
                Kit = BedwarsKit.NONE,
                Selected = u6.SelectedKit == BedwarsKit.NONE,
                store = u6.store,

                OnClick = function() -- Line: 544, Name: OnClick
                    -- upvalues: u6 (copy), BedwarsKit (ref)
                    u6.SetSelectedKit(BedwarsKit.NONE);
                end
            }) };
        local v151 = #v150;

        for i, v in v146 do
            v150[v151 + i] = v;
        end;

        v141[#v141 + 1] = u3.createElement(Empty, v148, v150);
        v126[v127 + 2] = u3.createElement("ScrollingFrame", v140, v141);

        return u3.createElement("Frame", v120, v126);
    end)
};