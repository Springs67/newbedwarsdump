local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "consumable-reducer").ConsumableReducer
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "locker-reducer").LockerReducer
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types")
local u9 = v8.Consumable
local u10 = v8.ConsumableStatus
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-types").ItemSkinType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local u20 = v1.import(script, script.Parent, "locker-app").LockerApp
return function(p21) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u6
        [4] = u16
        [5] = u15
        [6] = u18
        [7] = u2
        [8] = u17
        [9] = u19
        [10] = u14
        [11] = u13
        [12] = u11
        [13] = u12
        [14] = u10
        [15] = u9
        [16] = u3
        [17] = u4
        [18] = u20
    --]]
    local v22 = u5.Store.new
    local v23 = {
        ["Locker"] = u7,
        ["Consumable"] = u6
    }
    local v24 = u5.combineReducers(v23)
    local v25 = {}
    local v26 = {
        ["bedSkin"] = nil,
        ["selectedKillEffect"] = u16.NONE,
        ["killEffects"] = {
            u16.NONE,
            u16.JELLY,
            u16.GIFT,
            u16.SNOWMAN,
            u16.BLIMP,
            u16.EXPLODE,
            u16.COFFIN,
            u16.ABDUCTION,
            u16.SHARK,
            u16.SHARK,
            u16.SHARK,
            u16.SHARK,
            u16.SHARK,
            u16.SHARK,
            u16.SHARK,
            u16.SHARK,
            u16.SHARK,
            u16.SHARK,
            u16.SHARK,
            u16.SHARK,
            u16.SHARK,
            u16.ABDUCTION,
            u16.ABDUCTION,
            u16.ABDUCTION,
            u16.ABDUCTION,
            u16.ABDUCTION,
            u16.ABDUCTION,
            u16.ABDUCTION
        },
        ["selectedEmotes"] = { u15.BED_BREAK },
        ["emotes"] = {
            u15.ROCK_OUT,
            u15.BANANA_BARBARIAN,
            u15.BUILDER_HELP_PLS,
            u15.CLETUS_CARROT,
            u15.CLETUS_CARROT,
            u15.CLETUS_CARROT,
            u15.CLETUS_CARROT,
            u15.CLETUS_CARROT,
            u15.CLETUS_CARROT,
            u15.CLETUS_CARROT,
            u15.CLETUS_CARROT,
            u15.CLETUS_CARROT,
            u15.CLETUS_CARROT,
            u15.CLETUS_CARROT,
            u15.CLETUS_CARROT,
            u15.CLETUS_CARROT,
            u15.CLETUS_CARROT,
            u15.CLETUS_CARROT,
            u15.CLETUS_CARROT,
            u15.CLETUS_CARROT,
            u15.CLETUS_CARROT
        },
        ["selectedTitle"] = u18.POISON_RGB,
        ["titles"] = u2.values(u18),
        ["selectedLobbyGadget"] = u17.RAGEBLADE,
        ["lobbyGadgets"] = { u17.NONE, u17.RAGEBLADE },
        ["selectedWinEffect"] = u19.JUGGERNAUT_BARBARIAN,
        ["winEffects"] = {
            u19.NONE,
            u19.JUGGERNAUT_BARBARIAN,
            u19.TRAIN,
            u19.SPIRIT_ASSASSIN
        },
        ["selectedBreakBedEffect"] = u14.NONE,
        ["breakBedEffects"] = { u14.NONE, u14.METEOR, u14.LIGHTNING_STRIKE },
        ["featuredBadges"] = { u13.NONE },
        ["badges"] = {
            u13.NONE,
            u13.BEDWARS_NO_ARMOR,
            u13.BEDWARS_NO_DEATHS,
            u13.BEDWARS_NO_DAMAGE
        },
        ["bedSkins"] = { u11.RACECAR_BED },
        ["itemSkins"] = { u11.DARKVALENTINE_EMERALD_SWORD },
        ["selectedItemSkins"] = {
            [u12.WOOD_SWORD] = u11.BALLOON_WOOD_SWORD,
            [u12.DIAMOND_SWORD] = u11.BALLOON_DIAMOND_SWORD,
            [u12.WOOD_BOW] = u11.LIFE_BOW_MUMMY,
            [u12.WOOD_SWORD] = u11.BALLOON_WOOD_SWORD,
            [u12.WOOD_SWORD] = u11.BALLOON_WOOD_SWORD
        },
        ["limitedReward"] = {}
    }
    v25.Locker = v26
    local v27 = {}
    local v28 = {
        ["0"] = {
            ["id"] = "0",
            ["amount"] = 1,
            ["status"] = u10.INVENTORY,
            ["consumable"] = u9.BATTLE_PASS_2X,
            ["time"] = os.time()
        },
        ["1"] = {
            ["id"] = "1",
            ["amount"] = 1,
            ["status"] = u10.INVENTORY,
            ["consumable"] = u9.BATTLE_PASS_3X,
            ["time"] = os.time()
        },
        ["2"] = {
            ["id"] = "2",
            ["amount"] = 1,
            ["status"] = u10.INVENTORY,
            ["consumable"] = u9.KIT_RENTAL_ALL_7,
            ["time"] = os.time()
        },
        ["3"] = {
            ["id"] = "3",
            ["amount"] = 1,
            ["status"] = u10.INVENTORY,
            ["consumable"] = u9.BATTLE_PASS_3X,
            ["time"] = os.time()
        }
    }
    v27.inventory = v28
    v25.Consumable = v27
    local v29 = {
        ["store"] = v22(v24, v25)
    }
    local u30 = u3.mount(u3.createElement(u4, v29, { u3.createElement(u20, {
            ["AppId"] = "LockerApp"
        }) }), p21)
    return function() --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u30
        --]]
        return u3.unmount(u30)
    end
end