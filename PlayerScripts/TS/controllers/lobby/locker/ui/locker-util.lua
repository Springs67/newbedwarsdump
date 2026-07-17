-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local StringUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").StringUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local AchievementUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil;
local getConsumableMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta;
local getItemSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local BadgeType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType;
local BedBreakEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-meta").BedBreakEffectMeta;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local KillEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-meta").KillEffectMeta;
local KillEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
local LobbyGadgetMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta;
local LobbyGadgetType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
local getLobbyGadgetImage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-utils").getLobbyGadgetImage;
local LockerItemCategory = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-item-types").LockerItemCategory;
local LockerPreviewUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-preview-util").LockerPreviewUtil;
local LockerTab = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab;
local TitleMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta;
local TitleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
local WinEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-meta").WinEffectMeta;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local v2 = {};
local u3 = {
    LockerTab.KILL_EFFECTS,
    LockerTab.BREAK_BED_EFFECTS,
    LockerTab.BED_SKIN,
    LockerTab.LOBBY_GADGETS,
    LockerTab.EMOTES
};
v2.PREVIEW_TABS = u3;
local u4 = nil;

function v2.buildElementGrid(u5, p6, p7, p8) -- Line: 37
    -- upvalues: LockerTab (copy), EmoteType (copy), u4 (ref), u1 (copy), getConsumableMeta (copy), getItemSkinMeta (copy), getItemMeta (copy), StringUtil (copy)
    local u9 = {};

    if u5 == LockerTab.EMOTES then
        local emotes = p6.emotes;

        if table.find(emotes, EmoteType.NONE) == nil then
            table.insert(emotes, EmoteType.NONE);
        end;

        local function _(p10) -- Line: 46
            -- upvalues: u4 (ref)
            return u4({
                emote = p10
            });
        end;

        local v11 = 0;
        u9 = {};

        for i, v in emotes do
            local _ = i - 1;
            local v12 = u4({
                emote = v
            });

            if v12 ~= nil then
                v11 = v11 + 1;
                u9[v11] = v12;
            end;
        end;
    elseif u5 == LockerTab.KILL_EFFECTS then
        local function _(p13) -- Line: 65
            -- upvalues: u4 (ref)
            return u4({
                killEffect = p13
            });
        end;

        local v14 = 0;
        u9 = {};

        for i, v in p6.killEffects do
            local _ = i - 1;
            local v15 = u4({
                killEffect = v
            });

            if v15 ~= nil then
                v14 = v14 + 1;
                u9[v14] = v15;
            end;
        end;
    elseif u5 == LockerTab.WIN_EFFECTS then
        local function _(p16) -- Line: 84
            -- upvalues: u4 (ref)
            return u4({
                winEffect = p16
            });
        end;

        local v17 = 0;
        u9 = {};

        for i, v in p6.winEffects do
            local _ = i - 1;
            local v18 = u4({
                winEffect = v
            });

            if v18 ~= nil then
                v17 = v17 + 1;
                u9[v17] = v18;
            end;
        end;
    elseif u5 == LockerTab.TITLES then
        local function _(p19) -- Line: 104
            -- upvalues: u4 (ref)
            return u4({
                title = p19
            });
        end;

        local v20 = 0;
        u9 = {};

        for i, v in p6.titles do
            local _ = i - 1;
            local v21 = u4({
                title = v
            });

            if v21 ~= nil then
                v20 = v20 + 1;
                u9[v20] = v21;
            end;
        end;
    elseif u5 == LockerTab.LOBBY_GADGETS then
        local function _(p22) -- Line: 124
            -- upvalues: u4 (ref)
            return u4({
                lobbyGadget = p22
            });
        end;

        local v23 = 0;
        u9 = {};

        for i, v in p6.lobbyGadgets do
            local _ = i - 1;
            local v24 = u4({
                lobbyGadget = v
            });

            if v24 ~= nil then
                v23 = v23 + 1;
                u9[v23] = v24;
            end;
        end;
    elseif u5 == LockerTab.CONSUMABLES then
        if not p7 then
            return {};
        end;

        local v25 = u1.entries(p7);

        local function v31(p26) -- Line: 146
            -- upvalues: getConsumableMeta (ref), LockerTab (ref)
            local v27 = p26[1];
            local v28 = p26[2];
            local v29 = getConsumableMeta(v28.consumable);

            if not v29 then
                return nil;
            end;

            if not v29.displayInLocker then
                return nil;
            end;

            local v30 = {
                name = v29.displayName
            };
            local image = v29.image;
            v30.imageId = image == nil and "" or image;
            v30.itemEnum = v28.consumable;
            v30.description = v29.description;
            v30.lockerTab = LockerTab.CONSUMABLES;
            v30.amount = v28.amount;
            v30.consumableId = v27;
            v30.expireTime = v28.expireTime;

            return v30;
        end;

        local v32 = 0;
        u9 = {};

        for i, v in v25 do
            local v33 = v31(v, i - 1, v25);

            if v33 ~= nil then
                v32 = v32 + 1;
                u9[v32] = v33;
            end;
        end;
    elseif u5 == LockerTab.BREAK_BED_EFFECTS then
        local function _(p34) -- Line: 188
            -- upvalues: u4 (ref)
            return u4({
                breakBedEffect = p34
            });
        end;

        local v35 = 0;
        u9 = {};

        for i, v in p6.breakBedEffects do
            local _ = i - 1;
            local v36 = u4({
                breakBedEffect = v
            });

            if v36 ~= nil then
                v35 = v35 + 1;
                u9[v35] = v36;
            end;
        end;
    elseif u5 == LockerTab.BADGES then
        local function _(p37) -- Line: 207
            -- upvalues: u4 (ref)
            return u4({
                achievementBadge = p37
            });
        end;

        local v38 = 0;
        u9 = {};

        for i, v in p6.badges do
            local _ = i - 1;
            local v39 = u4({
                achievementBadge = v
            });

            if v39 ~= nil then
                v38 = v38 + 1;
                u9[v38] = v39;
            end;
        end;
    elseif u5 == LockerTab.BED_SKIN then
        local bedSkins = p6.bedSkins;

        local function v47(p40) -- Line: 226
            -- upvalues: getItemSkinMeta (ref), getItemMeta (ref), StringUtil (ref), u9 (ref), u5 (copy)
            local v41 = getItemSkinMeta(p40);
            local v42 = getItemMeta(v41.itemType);
            local v43 = string.split(v41.skinTag, "_");

            local function _(p44) -- Line: 230
                -- upvalues: StringUtil (ref)
                return StringUtil.capitalizeFirstLetter(p44);
            end;

            local v45 = table.create(#v43);

            for i, v in v43 do
                local _ = i - 1;
                v45[i] = StringUtil.capitalizeFirstLetter(v);
            end;

            local v46 = {
                name = table.concat(v45, "") .. " " .. v42.displayName
            };
            local renderImage = v41.renderImage;
            v46.imageId = renderImage == nil and "" or renderImage;
            v46.itemEnum = p40;
            v46.lockerTab = u5;
            table.insert(u9, v46);
        end;

        for i, v in bedSkins do
            v47(v, i - 1, bedSkins);
        end;

        table.insert(u9, {
            name = "None",
            imageId = "",
            itemEnum = "none",
            none = true,
            lockerTab = u5
        });
    end;

    table.sort(u9, function(p48, p49) -- Line: 268
        if string.lower(p48.name) == "none" then
            return true;
        end;

        if string.lower(p49.name) == "none" then
            return false;
        end;

        return p48.name < p49.name;
    end);

    return u9;
end;

u4 = function(p50, p51) -- Line: 282, Name: createLockerItemDisplay
    -- upvalues: EmoteMeta (copy), EmoteType (copy), LockerTab (copy), KillEffectMeta (copy), KillEffectType (copy), WinEffectMeta (copy), WinEffectType (copy), TitleMeta (copy), TitleType (copy), LobbyGadgetMeta (copy), LobbyGadgetType (copy), getLobbyGadgetImage (copy), BedBreakEffectMeta (copy), BedBreakEffectType (copy), BadgeType (copy), AchievementUtil (copy)
    if p50.emote then
        local emote = p50.emote;
        local v52 = EmoteMeta[emote];

        if not v52 then
            return nil;
        end;

        if v52.disabled then
            return nil;
        end;

        if emote == EmoteType.NONE and p51 then
            return nil;
        end;

        local v53 = {
            name = v52.name
        };
        local image = v52.image;
        v53.imageId = image == nil and "" or image;
        v53.itemEnum = emote;
        v53.lockerTab = LockerTab.EMOTES;

        return v53;
    end;

    if p50.killEffect then
        local killEffect = p50.killEffect;
        local v54 = KillEffectMeta[killEffect];

        if not v54 then
            return nil;
        end;

        if killEffect == KillEffectType.NONE and p51 then
            return nil;
        end;

        local v55 = {
            name = v54.name
        };
        local image = v54.image;
        v55.imageId = image == nil and "" or image;
        v55.itemEnum = killEffect;
        v55.lockerTab = LockerTab.KILL_EFFECTS;

        return v55;
    end;

    if p50.winEffect then
        local winEffect = p50.winEffect;
        local v56 = WinEffectMeta[winEffect];

        if not v56 then
            return nil;
        end;

        if winEffect == WinEffectType.NONE and p51 then
            return nil;
        end;

        local v57 = {
            name = v56.name
        };
        local image = v56.image;
        v57.imageId = image == nil and "" or image;
        v57.itemEnum = winEffect;
        v57.lockerTab = LockerTab.WIN_EFFECTS;

        return v57;
    end;

    if p50.title then
        local title = p50.title;
        local v58 = TitleMeta[title];

        if not v58 then
            return nil;
        end;

        if title == TitleType.NONE and p51 then
            return nil;
        end;

        local name = v58.name;

        if name == nil then
            name = v58.text;
        end;

        local v59 = {};
        local v60 = {
            imageId = "",
            name = v58.name == "None" and "None" or name
        };

        for i, v in v58 do
            v59[i] = v;
        end;

        v60.title = v59;
        v60.itemEnum = title;
        v60.lockerTab = LockerTab.TITLES;

        return v60;
    end;

    if p50.lobbyGadget then
        local lobbyGadget = p50.lobbyGadget;
        local v61 = LobbyGadgetMeta[lobbyGadget];

        if not v61 then
            return nil;
        end;

        if lobbyGadget == LobbyGadgetType.NONE and p51 then
            return nil;
        end;

        local v62;

        if v61.items then
            local v63 = getLobbyGadgetImage(lobbyGadget);
            v62 = v63 == nil and "" or v63;
        else
            v62 = nil;
        end;

        local v64 = {
            name = v61.name
        };
        local image = v61.image;

        if image == nil then
            image = v62 == nil and "" or v62;
        end;

        v64.imageId = image;
        v64.itemEnum = lobbyGadget;
        v64.lockerTab = LockerTab.BREAK_BED_EFFECTS;

        return v64;
    end;

    if p50.breakBedEffect then
        local breakBedEffect = p50.breakBedEffect;
        local v65 = BedBreakEffectMeta[breakBedEffect];

        if breakBedEffect == BedBreakEffectType.NONE and p51 then
            return nil;
        end;

        local v66 = {
            name = v65.name
        };
        local image = v65.image;
        v66.imageId = image == nil and "" or image;
        v66.itemEnum = breakBedEffect;
        v66.lockerTab = LockerTab.BREAK_BED_EFFECTS;

        return v66;
    end;

    if p50.achievementBadge then
        local achievementBadge = p50.achievementBadge;

        if achievementBadge == BadgeType.NONE then
            return {
                name = "None",
                imageId = "",
                itemEnum = achievementBadge,
                lockerTab = LockerTab.BADGES
            };
        end;

        local v67 = AchievementUtil.getMeta(achievementBadge);
        local v68 = {};

        if v67 ~= nil then
            v67 = v67.title;
        end;

        v68.name = v67 == nil and "" or v67;
        v68.imageId = "";
        v68.itemEnum = achievementBadge;
        v68.lockerTab = LockerTab.BADGES;

        return v68;
    end;
end;

v2.createLockerItemDisplay = u4;

function v2.getEquippedLockerCosmeticDisplay(p69, p70) -- Line: 464
    -- upvalues: LockerItemCategory (copy), ClientStore (copy), KillEffectMeta (copy), LockerTab (copy), KillEffectType (copy), WinEffectMeta (copy), WinEffectType (copy), TitleMeta (copy), TitleType (copy), LobbyGadgetMeta (copy), getLobbyGadgetImage (copy), LobbyGadgetType (copy), BedBreakEffectMeta (copy), BedBreakEffectType (copy), BadgeType (copy), AchievementUtil (copy), getItemSkinMeta (copy), getItemMeta (copy), StringUtil (copy)
    if p69 == LockerItemCategory.KILL_EFFECT then
        local v71;

        if p70 == nil then
            v71 = p70;
        else
            v71 = p70.selectedKillEffect;
        end;

        local v72;

        if v71 then
            v72 = p70.selectedKillEffect;
        else
            v72 = ClientStore:getState().Locker.selectedKillEffect;
        end;

        local v73 = KillEffectMeta[v72];
        local v74 = {
            name = v73.name
        };
        local image = v73.image;
        v74.imageId = image == nil and "" or image;
        v74.itemEnum = v72;
        v74.lockerTab = LockerTab.KILL_EFFECTS;
        v74.none = v72 == KillEffectType.NONE;

        return v74;
    end;

    if p69 == LockerItemCategory.WIN_EFFECT then
        local v75;

        if p70 == nil then
            v75 = p70;
        else
            v75 = p70.selectedWinEffect;
        end;

        local v76;

        if v75 then
            v76 = p70.selectedWinEffect;
        else
            v76 = ClientStore:getState().Locker.selectedWinEffect;
        end;

        local v77 = WinEffectMeta[v76];
        local v78 = {
            name = v77.name
        };
        local image = v77.image;
        v78.imageId = image == nil and "" or image;
        v78.itemEnum = v76;
        v78.lockerTab = LockerTab.WIN_EFFECTS;
        v78.none = v76 == WinEffectType.NONE;

        return v78;
    end;

    if p69 == LockerItemCategory.TITLE then
        local v79;

        if p70 == nil then
            v79 = p70;
        else
            v79 = p70.selectedTitle;
        end;

        if v79 then
            if p70 ~= nil then
                p70 = p70.selectedTitle;
            end;
        else
            p70 = ClientStore:getState().Locker.selectedTitle;
        end;

        local v80 = TitleMeta[p70];
        local v81 = {};
        local name = v80.name;

        if name == nil then
            name = v80.text;
        end;

        v81.name = name;
        v81.imageId = "";
        v81.itemEnum = p70;
        v81.lockerTab = LockerTab.TITLES;
        v81.none = p70 == TitleType.NONE;

        return v81;
    end;

    if p69 == LockerItemCategory.LOBBY_GADGET then
        local v82;

        if p70 == nil then
            v82 = p70;
        else
            v82 = p70.selectedLobbyGadget;
        end;

        if v82 then
            if p70 ~= nil then
                p70 = p70.selectedLobbyGadget;
            end;
        else
            p70 = ClientStore:getState().Locker.selectedLobbyGadget;
        end;

        local v83 = LobbyGadgetMeta[p70];

        if not v83 then
            print("[Locker Util] Attempeted to index an unknown Lobby Gadget: " .. p70);
        end;

        local v84 = {};
        local v85;

        if v83 == nil then
            v85 = v83;
        else
            v85 = v83.name;
        end;

        v84.name = v85 == nil and "" or v85;
        local v86;

        if v83 then
            local v87 = getLobbyGadgetImage(p70);
            v86 = v87 == nil and "" or v87;
        else
            v86 = "";
        end;

        v84.imageId = v86;
        v84.itemEnum = p70;
        v84.lockerTab = LockerTab.LOBBY_GADGETS;
        v84.none = p70 == LobbyGadgetType.NONE;

        return v84;
    end;

    if p69 == LockerItemCategory.BED_BREAK_EFFECT then
        local v88;

        if p70 == nil then
            v88 = p70;
        else
            v88 = p70.selectedBreakBedEffect;
        end;

        if v88 then
            if p70 ~= nil then
                p70 = p70.selectedBreakBedEffect;
            end;
        else
            p70 = ClientStore:getState().Locker.selectedBreakBedEffect;
        end;

        local v89 = BedBreakEffectMeta[p70];
        local v90 = {};
        local v91;

        if v89 == nil then
            v91 = v89;
        else
            v91 = v89.name;
        end;

        v90.name = v91;

        if v89 ~= nil then
            v89 = v89.image;
        end;

        v90.imageId = v89 == nil and "" or v89;
        v90.itemEnum = p70;
        v90.lockerTab = LockerTab.BREAK_BED_EFFECTS;
        v90.none = p70 == BedBreakEffectType.NONE;

        return v90;
    end;

    if p69 == LockerItemCategory.BADGE then
        local v92;

        if p70 == nil then
            v92 = p70;
        else
            v92 = p70.featuredBadges[1];
        end;

        if v92 then
            if p70 ~= nil then
                p70 = p70.featuredBadges[1];
            end;
        else
            p70 = ClientStore:getState().Locker.featuredBadges[1];
        end;

        if p70 == BadgeType.NONE or p70 == nil then
            return {
                name = "None",
                imageId = "",
                none = true,
                itemEnum = BadgeType.NONE,
                lockerTab = LockerTab.BADGES
            };
        end;

        local v93 = AchievementUtil.getMeta(p70);
        local v94 = {};
        local v95;

        if v93 == nil then
            v95 = v93;
        else
            v95 = v93.title;
        end;

        v94.name = v95 == nil and "" or v95;
        local goal = v93.goal;

        if goal ~= nil then
            goal = goal.value;
        end;

        v94.description = v93.description(goal);
        v94.imageId = "";
        v94.itemEnum = p70;
        v94.lockerTab = LockerTab.BADGES;

        return v94;
    end;

    if p69 ~= LockerItemCategory.BED_SKIN then
        return {
            name = "None",
            imageId = "",
            itemEnum = "none",
            none = true
        };
    end;

    local v96;

    if p70 == nil then
        v96 = p70;
    else
        v96 = p70.bedSkin;
    end;

    local v97;

    if v96 then
        v97 = p70.bedSkin;
    else
        v97 = ClientStore:getState().Locker.bedSkin;
    end;

    if not v97 then
        return {
            name = "None",
            imageId = "",
            itemEnum = nil,
            none = true,
            lockerTab = LockerTab.BED_SKIN
        };
    end;

    local v98 = getItemSkinMeta(v97);
    local v99 = getItemMeta(v98.itemType);
    local v100 = string.split(v98.skinTag, "_");

    local function _(p101) -- Line: 681
        -- upvalues: StringUtil (ref)
        return StringUtil.capitalizeFirstLetter(p101);
    end;

    local v102 = table.create(#v100);

    for i, v in v100 do
        local _ = i - 1;
        v102[i] = StringUtil.capitalizeFirstLetter(v);
    end;

    local v103 = table.concat(v102, "");
    local v104 = {};
    local name = v98.name;

    if name == nil then
        name = v103 .. " " .. v99.displayName;
    end;

    v104.name = name;
    local renderImage = v98.renderImage;
    v104.imageId = renderImage == nil and "" or renderImage;
    v104.itemEnum = v97;
    v104.lockerTab = LockerTab.BED_SKIN;

    return v104;
end;

function v2.isPreviewTab(p105) -- Line: 727
    -- upvalues: u3 (copy)
    return table.find(u3, p105) ~= nil;
end;

function v2.previewElement(p106, p107, p108) -- Line: 733
    -- upvalues: LockerPreviewUtil (copy), KnitClient (copy), LockerTab (copy), KillEffectType (copy), BedBreakEffectType (copy), LobbyGadgetType (copy)
    if not LockerPreviewUtil.canPreviewLockerElement(p106, p107) then
        KnitClient.Controllers.LockerPreviewController:cleanup();

        return nil;
    end;

    if not p106 then
        KnitClient.Controllers.LockerPreviewController:cleanup();

        return;
    end;

    if p107 == LockerTab.KILL_EFFECTS then
        local itemEnum = p106.itemEnum;

        if itemEnum == KillEffectType.NONE then
            KnitClient.Controllers.LockerPreviewController:cleanup();

            return;
        end;

        KnitClient.Controllers.LockerPreviewController:preview({
            killEffect = itemEnum
        }, p108);

        return;
    end;

    if p107 == LockerTab.BREAK_BED_EFFECTS then
        local itemEnum = p106.itemEnum;

        if itemEnum == BedBreakEffectType.NONE then
            KnitClient.Controllers.LockerPreviewController:cleanup();

            return;
        end;

        KnitClient.Controllers.LockerPreviewController:preview({
            bedBreakEffect = itemEnum
        }, p108);

        return;
    end;

    if p107 == LockerTab.BED_SKIN then
        local itemEnum = p106.itemEnum;

        if itemEnum == "none" then
            KnitClient.Controllers.LockerPreviewController:cleanup();

            return;
        end;

        KnitClient.Controllers.LockerPreviewController:preview({
            bedSkin = itemEnum
        }, p108);

        return;
    end;

    if p107 ~= LockerTab.LOBBY_GADGETS then
        if p107 == LockerTab.EMOTES then
            KnitClient.Controllers.LockerPreviewController:preview({
                emote = p106.itemEnum
            }, p108);

            return;
        end;

        KnitClient.Controllers.LockerPreviewController:cleanup();

        return;
    end;

    local itemEnum = p106.itemEnum;

    if itemEnum == LobbyGadgetType.NONE then
        KnitClient.Controllers.LockerPreviewController:cleanup();

        return;
    end;

    KnitClient.Controllers.LockerPreviewController:preview({
        lobbyGadget = itemEnum
    }, p108);
end;

function v2.openFullscreenPreview(p109, p110) -- Line: 789
    -- upvalues: LockerPreviewUtil (copy), KnitClient (copy), Players (copy), BedwarsAppIds (copy), LockerTab (copy)
    if not LockerPreviewUtil.canPreviewLockerElement(p109, p110) then
        KnitClient.Controllers.LockerPreviewController:cleanup();

        return nil;
    end;

    local u111 = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui");

    if u111 ~= nil then
        u111 = u111:FindFirstChild(BedwarsAppIds.LOCKER);
    end;

    local function v112() -- Line: 800
        -- upvalues: u111 (copy)
        if u111 then
            u111.Enabled = false;
        end;
    end;

    local function v113() -- Line: 805
        -- upvalues: u111 (copy)
        if u111 then
            u111.Enabled = true;
        end;
    end;

    if p110 == LockerTab.KILL_EFFECTS then
        local LockerPreviewController = KnitClient.Controllers.LockerPreviewController;
        local v114 = {};

        if p109 ~= nil then
            p109 = p109.itemEnum;
        end;

        v114.killEffect = p109;
        LockerPreviewController:openFullscreenPreview(v114, {
            fromLocker = true,
            onOpen = v112,
            onClose = v113
        });

        return;
    end;

    if p110 == LockerTab.BREAK_BED_EFFECTS then
        local LockerPreviewController = KnitClient.Controllers.LockerPreviewController;
        local v115 = {};

        if p109 ~= nil then
            p109 = p109.itemEnum;
        end;

        v115.bedBreakEffect = p109;
        LockerPreviewController:openFullscreenPreview(v115, {
            fromLocker = true,
            onOpen = v112,
            onClose = v113
        });

        return;
    end;

    if p110 == LockerTab.BED_SKIN then
        local LockerPreviewController = KnitClient.Controllers.LockerPreviewController;
        local v116 = {};

        if p109 ~= nil then
            p109 = p109.itemEnum;
        end;

        v116.bedSkin = p109;
        LockerPreviewController:openFullscreenPreview(v116, {
            fromLocker = true,
            onOpen = v112,
            onClose = v113
        });

        return;
    end;

    if p110 ~= LockerTab.LOBBY_GADGETS then
        if p110 == LockerTab.EMOTES then
            local LockerPreviewController = KnitClient.Controllers.LockerPreviewController;
            local v117 = {};

            if p109 ~= nil then
                p109 = p109.itemEnum;
            end;

            v117.emote = p109;
            LockerPreviewController:openFullscreenPreview(v117, {
                fromLocker = true,
                onOpen = v112,
                onClose = v113
            });
        end;

        return;
    end;

    local LockerPreviewController = KnitClient.Controllers.LockerPreviewController;
    local v118 = {};

    if p109 ~= nil then
        p109 = p109.itemEnum;
    end;

    v118.lobbyGadget = p109;
    LockerPreviewController:openFullscreenPreview(v118, {
        fromLocker = true,
        onOpen = v112,
        onClose = v113
    });
end;

return {
    LockerUtil = v2
};