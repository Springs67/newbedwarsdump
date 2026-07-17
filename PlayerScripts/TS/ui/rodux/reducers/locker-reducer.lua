-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local BadgeType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local KillEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
local LobbyGadgetType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
local LockerItemCategory = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-item-types").LockerItemCategory;
local TitleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local u2 = {
    bedSkin = nil,
    selectedKillEffect = KillEffectType.NONE,
    killEffects = { KillEffectType.NONE },
    selectedEmotes = { EmoteType.BED_BREAK },
    emotes = { EmoteType.BED_BREAK },
    selectedTitle = TitleType.NONE,
    titles = { TitleType.NONE },
    selectedLobbyGadget = LobbyGadgetType.NONE,
    lobbyGadgets = { LobbyGadgetType.NONE },
    selectedWinEffect = WinEffectType.NONE,
    winEffects = { WinEffectType.NONE },
    selectedBreakBedEffect = BedBreakEffectType.NONE,
    breakBedEffects = { BedBreakEffectType.NONE },
    featuredBadges = { BadgeType.NONE },
    badges = { BadgeType.NONE },
    bedSkins = {},
    selectedItemSkins = {},
    itemSkins = {},
    limitedReward = {}
};

return {
    LockerReducer = function(p3, p4) -- Line: 37, Name: LockerReducer
        -- upvalues: u2 (copy), u1 (copy), LockerItemCategory (copy), EmoteType (copy)
        if p3 == nil then
            p3 = u2;
        end;

        local v5 = {};

        for i, v in p3 do
            v5[i] = v;
        end;

        local u6 = v5;
        local type = p4.type;

        if type == "LockerUpdateAll" then
            u6 = p4.locker;
        elseif type == "LockerSetOwnedItems" then
            local v7 = u1.entries(p4.items);

            local function v11(p8) -- Line: 54
                -- upvalues: LockerItemCategory (ref), u6 (ref)
                local v9 = p8[1];
                local v10 = p8[2];

                if v9 == LockerItemCategory.TITLE then
                    u6.titles = v10;

                    return;
                end;

                if v9 == LockerItemCategory.EMOTE then
                    u6.emotes = v10;

                    return;
                end;

                if v9 == LockerItemCategory.BED_BREAK_EFFECT then
                    u6.breakBedEffects = v10;

                    return;
                end;

                if v9 == LockerItemCategory.KILL_EFFECT then
                    u6.killEffects = v10;

                    return;
                end;

                if v9 == LockerItemCategory.LOBBY_GADGET then
                    u6.lobbyGadgets = v10;

                    return;
                end;

                if v9 == LockerItemCategory.WIN_EFFECT then
                    u6.winEffects = v10;

                    return;
                end;

                if v9 == LockerItemCategory.BADGE then
                    u6.badges = v10;

                    return;
                end;

                if v9 == LockerItemCategory.BED_SKIN then
                    u6.bedSkins = v10;

                    return;
                end;

                if v9 ~= LockerItemCategory.ITEM_SKIN then
                    return;
                end;

                u6.itemSkins = v10;
            end;

            for i, v in v7 do
                v11(v, i - 1, v7);
            end;
        elseif type == "LockerAddOwnedItems" then
            local v12 = u1.entries(p4.items);

            local function v43(p13) -- Line: 103
                -- upvalues: LockerItemCategory (ref), u6 (ref)
                local v14 = p13[1];
                local v15 = p13[2];

                if v14 == LockerItemCategory.TITLE then
                    local v16 = {};
                    local v17 = #v16;
                    local titles = u6.titles;
                    local v18 = #titles;
                    table.move(titles, 1, v18, v17 + 1, v16);
                    table.move(v15, 1, #v15, v17 + v18 + 1, v16);
                    u6.titles = v16;

                    return;
                end;

                if v14 == LockerItemCategory.EMOTE then
                    local v19 = {};
                    local v20 = #v19;
                    local emotes = u6.emotes;
                    local v21 = #emotes;
                    table.move(emotes, 1, v21, v20 + 1, v19);
                    table.move(v15, 1, #v15, v20 + v21 + 1, v19);
                    u6.emotes = v19;

                    return;
                end;

                if v14 == LockerItemCategory.BED_BREAK_EFFECT then
                    local v22 = {};
                    local v23 = #v22;
                    local breakBedEffects = u6.breakBedEffects;
                    local v24 = #breakBedEffects;
                    table.move(breakBedEffects, 1, v24, v23 + 1, v22);
                    table.move(v15, 1, #v15, v23 + v24 + 1, v22);
                    u6.breakBedEffects = v22;

                    return;
                end;

                if v14 == LockerItemCategory.KILL_EFFECT then
                    local v25 = {};
                    local v26 = #v25;
                    local killEffects = u6.killEffects;
                    local v27 = #killEffects;
                    table.move(killEffects, 1, v27, v26 + 1, v25);
                    table.move(v15, 1, #v15, v26 + v27 + 1, v25);
                    u6.killEffects = v25;

                    return;
                end;

                if v14 == LockerItemCategory.LOBBY_GADGET then
                    local v28 = {};
                    local v29 = #v28;
                    local lobbyGadgets = u6.lobbyGadgets;
                    local v30 = #lobbyGadgets;
                    table.move(lobbyGadgets, 1, v30, v29 + 1, v28);
                    table.move(v15, 1, #v15, v29 + v30 + 1, v28);
                    u6.lobbyGadgets = v28;

                    return;
                end;

                if v14 == LockerItemCategory.WIN_EFFECT then
                    local v31 = {};
                    local v32 = #v31;
                    local winEffects = u6.winEffects;
                    local v33 = #winEffects;
                    table.move(winEffects, 1, v33, v32 + 1, v31);
                    table.move(v15, 1, #v15, v32 + v33 + 1, v31);
                    u6.winEffects = v31;

                    return;
                end;

                if v14 == LockerItemCategory.BADGE then
                    local v34 = {};
                    local v35 = #v34;
                    local badges = u6.badges;
                    local v36 = #badges;
                    table.move(badges, 1, v36, v35 + 1, v34);
                    table.move(v15, 1, #v15, v35 + v36 + 1, v34);
                    u6.badges = v34;

                    return;
                end;

                if v14 == LockerItemCategory.BED_SKIN then
                    local v37 = {};
                    local v38 = #v37;
                    local bedSkins = u6.bedSkins;
                    local v39 = #bedSkins;
                    table.move(bedSkins, 1, v39, v38 + 1, v37);
                    table.move(v15, 1, #v15, v38 + v39 + 1, v37);
                    u6.bedSkins = v37;

                    return;
                end;

                if v14 ~= LockerItemCategory.ITEM_SKIN then
                    return;
                end;

                local v40 = {};
                local v41 = #v40;
                local itemSkins = u6.itemSkins;
                local v42 = #itemSkins;
                table.move(itemSkins, 1, v42, v41 + 1, v40);
                table.move(v15, 1, #v15, v41 + v42 + 1, v40);
                u6.itemSkins = v40;
            end;

            for i, v in v12 do
                v43(v, i - 1, v12);
            end;
        elseif type == "LockerSetKillEffect" then
            u6.selectedKillEffect = p4.killEffect;
        elseif type == "LockerSetWinEffect" then
            u6.selectedWinEffect = p4.winEffect;
        elseif type == "LockerSetEmote" then
            if p4.emote == EmoteType.NONE then
                u6.selectedEmotes[p4.slot] = nil;
            else
                u6.selectedEmotes[p4.slot] = p4.emote;
            end;
        elseif type == "LockerSetEmoteWheel" then
            u6.selectedEmotes = p4.emoteWheel;
        elseif type == "LockerSetTitle" then
            u6.selectedTitle = p4.title;
        elseif type == "LockerSetBreakBedEffect" then
            u6.selectedBreakBedEffect = p4.breakBedEffect;
        elseif type == "LockerSetLobbyGadget" then
            u6.selectedLobbyGadget = p4.lobbyGadget;
        elseif type == "LockerSetFeaturedBadge" then
            u6.featuredBadges = { p4.badge };
        elseif type == "LockerSetBedSkin" then
            u6.bedSkin = p4.bedSkin;
        elseif type == "LockerSetItemSkin" then
            if p4.itemSkin then
                u6.selectedItemSkins[p4.itemType] = p4.itemSkin;
            else
                u6.selectedItemSkins[p4.itemType] = nil;
            end;
        elseif type == "LockerSetSelectedItemSkins" then
            u6.selectedItemSkins = p4.selectedItemSkins;
        end;

        return u6;
    end
};