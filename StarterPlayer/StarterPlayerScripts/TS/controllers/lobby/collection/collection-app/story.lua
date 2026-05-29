local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "locker-reducer").LockerReducer
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-types").ItemSkinType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local u17 = v1.import(script, script.Parent, "collection-app").CollectionApp
return function(p18) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u7
        [4] = u8
        [5] = u9
        [6] = u13
        [7] = u12
        [8] = u15
        [9] = u2
        [10] = u14
        [11] = u16
        [12] = u11
        [13] = u10
        [14] = u3
        [15] = u4
        [16] = u17
    --]]
    local v19 = u5.Store.new
    local v20 = {
        ["Game"] = u6,
        ["Locker"] = u7
    }
    local v21 = u5.combineReducers(v20)
    local v22 = {}
    local v23 = {
        ["itemSkins"] = {
            u8.BALLOON_WOOD_SWORD,
            u8.BALLOON_STONE_SWORD,
            u8.BALLOON_IRON_SWORD,
            u8.BALLOON_DIAMOND_SWORD,
            u8.BALLOON_EMERALD_SWORD
        },
        ["selectedItemSkins"] = {
            [u9.WOOD_SWORD] = u8.BALLOON_WOOD_SWORD,
            [u9.DIAMOND_SWORD] = u8.BALLOON_DIAMOND_SWORD,
            [u9.WOOD_BOW] = u8.LIFE_BOW_MUMMY,
            [u9.WOOD_SWORD] = u8.BALLOON_WOOD_SWORD,
            [u9.WOOD_SWORD] = u8.BALLOON_WOOD_SWORD
        },
        ["selectedKillEffect"] = u13.BOXING_GLOVE,
        ["killEffects"] = {
            u13.NONE,
            u13.JELLY,
            u13.GIFT,
            u13.SNOWMAN,
            u13.BLIMP,
            u13.EXPLODE,
            u13.COFFIN,
            u13.ABDUCTION,
            u13.SHARK,
            u13.SHARK,
            u13.SHARK,
            u13.SHARK,
            u13.SHARK,
            u13.SHARK,
            u13.SHARK,
            u13.SHARK,
            u13.SHARK,
            u13.SHARK,
            u13.SHARK,
            u13.SHARK,
            u13.SHARK,
            u13.ABDUCTION,
            u13.ABDUCTION,
            u13.ABDUCTION,
            u13.ABDUCTION,
            u13.ABDUCTION,
            u13.ABDUCTION,
            u13.ABDUCTION
        },
        ["selectedEmotes"] = { u12.BED_BREAK },
        ["emotes"] = {
            u12.ROCK_OUT,
            u12.BANANA_BARBARIAN,
            u12.BUILDER_HELP_PLS,
            u12.CLETUS_CARROT,
            u12.CLETUS_CARROT,
            u12.CLETUS_CARROT,
            u12.CLETUS_CARROT,
            u12.CLETUS_CARROT,
            u12.CLETUS_CARROT,
            u12.CLETUS_CARROT,
            u12.CLETUS_CARROT,
            u12.CLETUS_CARROT,
            u12.CLETUS_CARROT,
            u12.CLETUS_CARROT,
            u12.CLETUS_CARROT,
            u12.CLETUS_CARROT,
            u12.CLETUS_CARROT,
            u12.CLETUS_CARROT,
            u12.CLETUS_CARROT,
            u12.CLETUS_CARROT,
            u12.CLETUS_CARROT
        },
        ["selectedTitle"] = u15.POISON_RGB,
        ["titles"] = u2.values(u15),
        ["selectedLobbyGadget"] = u14.RAGEBLADE,
        ["lobbyGadgets"] = { u14.NONE, u14.RAGEBLADE },
        ["selectedWinEffect"] = u16.JUGGERNAUT_BARBARIAN,
        ["winEffects"] = {
            u16.NONE,
            u16.JUGGERNAUT_BARBARIAN,
            u16.TRAIN,
            u16.SPIRIT_ASSASSIN
        },
        ["selectedBreakBedEffect"] = u11.NONE,
        ["breakBedEffects"] = { u11.NONE, u11.METEOR, u11.LIGHTNING_STRIKE },
        ["featuredBadges"] = { u10.NONE },
        ["badges"] = {
            u10.NONE,
            u10.BEDWARS_NO_ARMOR,
            u10.BEDWARS_NO_DEATHS,
            u10.BEDWARS_NO_DAMAGE
        },
        ["bedSkin"] = u8.RACECAR_BED,
        ["bedSkins"] = { u8.RACECAR_BED },
        ["limitedReward"] = {}
    }
    v22.Locker = v23
    local v24 = {
        ["store"] = v19(v21, v22)
    }
    local u25 = u3.mount(u3.createElement(u4, v24, { u3.createElement(u17, {
            ["AppId"] = "CollectionApp"
        }) }), p18)
    return function() --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u25
        --]]
        return u3.unmount(u25)
    end
end