-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local LockerReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "locker-reducer").LockerReducer;
local ItemSkinType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-types").ItemSkinType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local BadgeType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local KillEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
local LobbyGadgetType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
local TitleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local CollectionApp = RuntimeLib.import(script, script.Parent, "collection-app").CollectionApp;

return function(p4) -- Line: 19
    -- upvalues: u3 (copy), GameReducer (copy), LockerReducer (copy), ItemSkinType (copy), ItemType (copy), KillEffectType (copy), EmoteType (copy), TitleType (copy), u1 (copy), LobbyGadgetType (copy), WinEffectType (copy), BedBreakEffectType (copy), BadgeType (copy), u2 (copy), StoreProvider (copy), CollectionApp (copy)
    local v5 = u3.Store.new(u3.combineReducers({
        Game = GameReducer,
        Locker = LockerReducer
    }), {
        Locker = {
            itemSkins = {
                ItemSkinType.BALLOON_WOOD_SWORD,
                ItemSkinType.BALLOON_STONE_SWORD,
                ItemSkinType.BALLOON_IRON_SWORD,
                ItemSkinType.BALLOON_DIAMOND_SWORD,
                ItemSkinType.BALLOON_EMERALD_SWORD
            },
            selectedItemSkins = {
                [ItemType.WOOD_SWORD] = ItemSkinType.BALLOON_WOOD_SWORD,
                [ItemType.DIAMOND_SWORD] = ItemSkinType.BALLOON_DIAMOND_SWORD,
                [ItemType.WOOD_BOW] = ItemSkinType.LIFE_BOW_MUMMY,
                [ItemType.WOOD_SWORD] = ItemSkinType.BALLOON_WOOD_SWORD,
                [ItemType.WOOD_SWORD] = ItemSkinType.BALLOON_WOOD_SWORD
            },
            selectedKillEffect = KillEffectType.BOXING_GLOVE,
            killEffects = {
                KillEffectType.NONE,
                KillEffectType.JELLY,
                KillEffectType.GIFT,
                KillEffectType.SNOWMAN,
                KillEffectType.BLIMP,
                KillEffectType.EXPLODE,
                KillEffectType.COFFIN,
                KillEffectType.ABDUCTION,
                KillEffectType.SHARK,
                KillEffectType.SHARK,
                KillEffectType.SHARK,
                KillEffectType.SHARK,
                KillEffectType.SHARK,
                KillEffectType.SHARK,
                KillEffectType.SHARK,
                KillEffectType.SHARK,
                KillEffectType.SHARK,
                KillEffectType.SHARK,
                KillEffectType.SHARK,
                KillEffectType.SHARK,
                KillEffectType.SHARK,
                KillEffectType.ABDUCTION,
                KillEffectType.ABDUCTION,
                KillEffectType.ABDUCTION,
                KillEffectType.ABDUCTION,
                KillEffectType.ABDUCTION,
                KillEffectType.ABDUCTION,
                KillEffectType.ABDUCTION
            },
            selectedEmotes = { EmoteType.BED_BREAK },
            emotes = {
                EmoteType.ROCK_OUT,
                EmoteType.BANANA_BARBARIAN,
                EmoteType.BUILDER_HELP_PLS,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT,
                EmoteType.CLETUS_CARROT
            },
            selectedTitle = TitleType.POISON_RGB,
            titles = u1.values(TitleType),
            selectedLobbyGadget = LobbyGadgetType.RAGEBLADE,
            lobbyGadgets = { LobbyGadgetType.NONE, LobbyGadgetType.RAGEBLADE },
            selectedWinEffect = WinEffectType.JUGGERNAUT_BARBARIAN,
            winEffects = {
                WinEffectType.NONE,
                WinEffectType.JUGGERNAUT_BARBARIAN,
                WinEffectType.TRAIN,
                WinEffectType.SPIRIT_ASSASSIN
            },
            selectedBreakBedEffect = BedBreakEffectType.NONE,
            breakBedEffects = { BedBreakEffectType.NONE, BedBreakEffectType.METEOR, BedBreakEffectType.LIGHTNING_STRIKE },
            featuredBadges = { BadgeType.NONE },
            badges = {
                BadgeType.NONE,
                BadgeType.BEDWARS_NO_ARMOR,
                BadgeType.BEDWARS_NO_DEATHS,
                BadgeType.BEDWARS_NO_DAMAGE
            },
            bedSkin = ItemSkinType.RACECAR_BED,
            bedSkins = { ItemSkinType.RACECAR_BED },
            limitedReward = {}
        }
    });
    local u6 = u2.mount(u2.createElement(StoreProvider, {
        store = v5
    }, { u2.createElement(CollectionApp, {
            AppId = "CollectionApp"
        }) }), p4);

    return function() -- Line: 61
        -- upvalues: u2 (ref), u6 (copy)
        return u2.unmount(u6);
    end;
end;