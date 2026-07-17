-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local ArmorTrimEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-meta").ArmorTrimEffectMeta;
local ArmorTrimEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-type").ArmorTrimEffectType;
local ArmorTrimMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta").ArmorTrimMeta;
local ArmorTrimEffectRank = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank").ArmorTrimEffectRank;
local ArmorTrimUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil;
local ItemSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").ItemSkinMeta;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local BedBreakEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-meta").BedBreakEffectMeta;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local KillEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-meta").KillEffectMeta;
local LobbyGadgetMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta;
local LockerPreviewUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-preview-util").LockerPreviewUtil;
local LockerPreviewFullscreenArmorTrimEffectMenu = RuntimeLib.import(script, script.Parent, "locker-preview-fullscreen-armor-trim-effect-menu").LockerPreviewFullscreenArmorTrimEffectMenu;
local LockerPreviewFullscreenFooter = RuntimeLib.import(script, script.Parent, "locker-preview-fullscreen-footer").LockerPreviewFullscreenFooter;
local u5 = v1.values(ArmorTrimEffectRank);
table.sort(u5, function(p6, p7) -- Line: 25
    return p6 < p7;
end);

local function getNextPreviewEffectRank(p8) -- Line: 30
    -- upvalues: u5 (copy)
    local v9 = (table.find(u5, p8) or 0) - 1;

    return u5[(v9 < 0 and 0 or v9 + 1) % #u5 + 1];
end;

local v59 = v3.new(u2)(function(u10, p11) -- Line: 36
    -- upvalues: ArmorTrimEffectType (copy), ArmorTrimEffectRank (copy), KnitClient (copy), LockerPreviewUtil (copy), KillEffectMeta (copy), BedBreakEffectMeta (copy), ItemSkinMeta (copy), LobbyGadgetMeta (copy), EmoteMeta (copy), BedwarsKitMeta (copy), BedwarsKitSkinMeta (copy), BedwarsKitSkin (copy), ArmorTrimEffectMeta (copy), ArmorTrimMeta (copy), ArmorTrimUtil (copy), u2 (copy), LockerPreviewFullscreenArmorTrimEffectMenu (copy), u5 (copy), LockerPreviewFullscreenFooter (copy)
    local useEffect = p11.useEffect;
    local useState = p11.useState;
    local armorTrim = u10.PreviewItem.armorTrim;
    local kit = u10.PreviewItem.kit;
    local u12;

    if kit == nil or armorTrim == nil then
        u12 = nil;
    else
        u12 = u10.AllKitProgress[kit];

        if u12 ~= nil then
            local function _(p13) -- Line: 45
                -- upvalues: armorTrim (copy)
                return p13.trim == armorTrim.type;
            end;

            u12 = nil;

            for i, v in u12 do
                local _ = i - 1;

                if v.trim == armorTrim.type == true then
                    u12 = v;
                    break;
                end;
            end;
        end;
    end;

    local v14;

    if kit == nil then
        v14 = nil;
    else
        v14 = u10.SelectedArmorTrimConfigs[kit];
    end;

    local v15 = armorTrim ~= nil;

    if v15 then
        local v16;

        if v14 == nil then
            v16 = v14;
        else
            v16 = v14.type;
        end;

        v15 = v16 == armorTrim.type;
    end;

    local u17;

    if v15 then
        u17 = v14.effectType;
    else
        u17 = nil;
    end;

    local u19, u20 = useState(function() -- Line: 74
        -- upvalues: u17 (copy), armorTrim (copy), ArmorTrimEffectType (ref)
        local v18 = u17;

        if v18 == nil then
            v18 = armorTrim;

            if v18 ~= nil then
                v18 = v18.effectType;
            end;

            if v18 == nil then
                v18 = ArmorTrimEffectType.DEFAULT;
            end;
        end;

        return v18;
    end);
    local v21;

    if armorTrim == nil then
        v21 = armorTrim;
    else
        v21 = armorTrim.armorSet;
    end;

    local u22, u23 = useState(v21 == nil and "LEATHER" or v21);
    local u25, u26 = useState(function() -- Line: 97
        -- upvalues: armorTrim (copy), ArmorTrimEffectRank (ref)
        local v24 = armorTrim;

        if v24 ~= nil then
            v24 = v24.effectRank;
        end;

        if v24 == nil then
            v24 = ArmorTrimEffectRank.T1;
        end;

        return v24;
    end);

    local function v27() -- Line: 108
        -- upvalues: armorTrim (copy), u23 (copy), ArmorTrimEffectRank (ref), u26 (copy)
        if armorTrim then
            u23(armorTrim.armorSet or "LEATHER");
            local effectRank = armorTrim.effectRank;

            if effectRank == nil then
                effectRank = ArmorTrimEffectRank.T1;
            end;

            u26(effectRank);
        end;
    end;

    local v28;

    if armorTrim == nil then
        v28 = armorTrim;
    else
        v28 = armorTrim.type;
    end;

    local v29;

    if armorTrim == nil then
        v29 = armorTrim;
    else
        v29 = armorTrim.color;
    end;

    local v30;

    if armorTrim == nil then
        v30 = armorTrim;
    else
        v30 = armorTrim.effectRank;
    end;

    useEffect(v27, { v28, v29, v30 });

    local function v34() -- Line: 131
        -- upvalues: armorTrim (copy), u17 (copy), u20 (copy), KnitClient (ref), kit (copy), u22 (copy), u25 (copy)
        if armorTrim then
            local v31 = u17 or armorTrim.effectType;
            u20(v31);
            local LockerPreviewController = KnitClient.Controllers.LockerPreviewController;
            local v32 = {
                kit = kit
            };
            local v33 = {};

            for i, v in armorTrim do
                v33[i] = v;
            end;

            v33.armorSet = u22;
            v33.effectRank = u25;
            v33.effectType = v31;
            v32.armorTrim = v33;
            LockerPreviewController:preview(v32);
        end;
    end;

    local v35;

    if armorTrim == nil then
        v35 = armorTrim;
    else
        v35 = armorTrim.type;
    end;

    local v36;

    if armorTrim == nil then
        v36 = armorTrim;
    else
        v36 = armorTrim.color;
    end;

    local v37;

    if armorTrim == nil then
        v37 = armorTrim;
    else
        v37 = armorTrim.effectRank;
    end;

    useEffect(v34, {
        v35,
        v36,
        v37,
        u17,
        u22,
        u25
    });
    local v38 = LockerPreviewUtil.canReplay(u10.PreviewItem);
    local v39 = "";
    local v40 = "";

    if u10.PreviewItem.killEffect then
        v39 = KillEffectMeta[u10.PreviewItem.killEffect].name;
        v40 = "Kill Effect";
    elseif u10.PreviewItem.bedBreakEffect then
        v39 = BedBreakEffectMeta[u10.PreviewItem.bedBreakEffect].name;
        v40 = "Bed Break Effect";
    elseif u10.PreviewItem.bedSkin then
        local name = ItemSkinMeta[u10.PreviewItem.bedSkin].name;
        v39 = name == nil and "" or name;
        v40 = "Bed Skin";
    elseif u10.PreviewItem.lobbyGadget then
        local name = LobbyGadgetMeta[u10.PreviewItem.lobbyGadget].name;
        v39 = name == nil and "" or name;
        v40 = "Lobby Gadget";
    elseif u10.PreviewItem.itemSkin then
        local name = ItemSkinMeta[u10.PreviewItem.itemSkin].name;
        v39 = name == nil and "" or name;
        v40 = "Item Skin";
    elseif u10.PreviewItem.emote then
        local name = EmoteMeta[u10.PreviewItem.emote].name;
        v39 = name == nil and "" or name;
        v40 = "Emote";
    elseif u10.PreviewItem.kit and not u10.PreviewItem.kitSkin then
        local name = BedwarsKitMeta[u10.PreviewItem.kit].name;
        v39 = name == nil and "" or name;
        v40 = "Kit";
    elseif u10.PreviewItem.kitSkin then
        local name = BedwarsKitSkinMeta[u10.PreviewItem.kitSkin].name;
        v39 = name == nil and "" or name;

        if u10.PreviewItem.kitSkin == BedwarsKitSkin.DEFAULT and u10.PreviewItem.kit then
            local name2 = BedwarsKitMeta[u10.PreviewItem.kit].name;
            local v41 = name2 == nil and "" or name2;
            v39 = v41 == "" and "Default" or "Default (" .. v41 .. ")";
        end;

        v40 = "Kit Skin";
    end;

    if u10.PreviewItem.armorTrim then
        v39 = ArmorTrimEffectMeta[u19].name;
        v40 = ArmorTrimMeta[u10.PreviewItem.armorTrim.type].name;
    end;

    useEffect(function() -- Line: 230
        -- upvalues: u10 (copy), KnitClient (ref)
        return not u10.FromLocker and function() -- Line: 234
            -- upvalues: KnitClient (ref)
            KnitClient.Controllers.LockerPreviewController:closePreview();
        end or nil;
    end, {});
    local v42 = armorTrim == nil and {} or ArmorTrimUtil.getSelectableArmorTrimEffectTypes(armorTrim.type);

    local function v45(p43) -- Line: 240
        -- upvalues: armorTrim (copy), ArmorTrimEffectType (ref), ArmorTrimUtil (ref), ArmorTrimEffectMeta (ref), u12 (copy), u10 (copy)
        if armorTrim == nil then
            return false;
        end;

        if p43 == ArmorTrimEffectType.DEFAULT then
            return false;
        end;

        local v44 = ArmorTrimUtil.getSelectableArmorTrimEffectTypes(armorTrim.type);

        if table.find(v44, p43) == nil then
            return true;
        end;

        if ArmorTrimEffectMeta[p43].unlockable == true then
            return not ArmorTrimUtil.canPlayerUseArmorTrimEffectOnTrim(u12, p43, u10.EffectUnlocks);
        end;

        return false;
    end;

    local u46 = not v45(u19);

    if u17 == nil then
        if armorTrim == nil then
            u17 = armorTrim;
        else
            u17 = armorTrim.effectType;
        end;
    end;

    local v47;

    if u17 == nil then
        v47 = false;
    else
        v47 = u17 == u19;
    end;

    local v48 = {
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        ClipToDeviceSafeArea = false,
        DisplayOrder = 101
    };
    local v49 = {};
    local v50 = #v49;
    local v51;

    if armorTrim == nil or #v42 <= 0 then
        v51 = nil;
    else
        v51 = u2.createElement(LockerPreviewFullscreenArmorTrimEffectMenu, {
            selectableTypes = v42,
            selectedEffectType = u19,
            armorTrimType = armorTrim.type,
            previewEffectRank = u25,
            currentArmorSet = u22,
            equippedEffectType = u17,
            isLockedEffectType = v45,
            canEquipSelectedEffect = u46,
            isSelectedEffectEquipped = v47,

            onSelectEffectType = function(p52) -- Line: 289, Name: onSelectEffectType
                -- upvalues: u20 (copy), KnitClient (ref), kit (copy), armorTrim (copy), u22 (copy), u25 (copy)
                u20(p52);
                local LockerPreviewController = KnitClient.Controllers.LockerPreviewController;
                local v53 = {
                    kit = kit
                };
                local v54 = {};

                for i, v in armorTrim do
                    v54[i] = v;
                end;

                v54.armorSet = u22;
                v54.effectRank = u25;
                v54.effectType = p52;
                v53.armorTrim = v54;
                LockerPreviewController:preview(v53);
            end,

            onEquipSelectedEffect = function() -- Line: 306, Name: onEquipSelectedEffect
                -- upvalues: u46 (copy), kit (copy), KnitClient (ref), armorTrim (copy), u19 (copy)
                if not u46 then
                    return nil;
                end;

                if kit == nil then
                    return nil;
                end;

                KnitClient.Controllers.ArmorTrimController:equipArmorTrimConfig(kit, armorTrim.type, armorTrim.color, u19);
            end,

            onSwitchArmorSet = function(p55) -- Line: 315, Name: onSwitchArmorSet
                -- upvalues: u23 (copy), KnitClient (ref), kit (copy), armorTrim (copy), u25 (copy), u19 (copy)
                u23(p55);
                local LockerPreviewController = KnitClient.Controllers.LockerPreviewController;
                local v56 = {
                    kit = kit
                };
                local v57 = {};

                for i, v in armorTrim do
                    v57[i] = v;
                end;

                v57.armorSet = p55;
                v57.effectRank = u25;
                v57.effectType = u19;
                v56.armorTrim = v57;
                LockerPreviewController:preview(v56);
            end,

            onCyclePreviewEffectRank = function() -- Line: 332, Name: onCyclePreviewEffectRank
                -- upvalues: u26 (copy), u25 (copy), u5 (ref)
                local v58 = (table.find(u5, u25) or 0) - 1;
                u26(u5[(v58 < 0 and 0 or v58 + 1) % #u5 + 1]);
            end
        });
    end;

    if v51 then
        v49[v50 + 1] = v51;
    end;

    v49[#v49 + 1] = u2.createElement(LockerPreviewFullscreenFooter, {
        name = v39,
        previewName = v40,
        canReplay = v38,
        previewItem = u10.PreviewItem,
        onClose = u10.OnClose
    });

    return u2.createElement("ScreenGui", v48, v49);
end);

return {
    LockerPreviewFullscreen = v4.connect(function(p60, p61) -- Line: 350
        local v62 = {};

        for i, v in p61 do
            v62[i] = v;
        end;

        v62.AllKitProgress = p60.ArmorTrim.allKitProgress;
        v62.EffectUnlocks = p60.ArmorTrim.effectUnlocks;
        v62.SelectedArmorTrimConfigs = p60.ArmorTrim.selectedArmorTrimConfigs;

        return v62;
    end)(v59)
};