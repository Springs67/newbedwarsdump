local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "consumable-reducer").ConsumableReducer
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "lobby-reducer").LobbyReducer
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "locker-reducer").LockerReducer
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types")
local u11 = v10.Consumable
local u12 = v10.ConsumableStatus
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "robux-daily-store", "robux-daily-store-items").DailyStoreItem
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ugc", "ugc-type").UgcType
local u18 = v1.import(script, script.Parent, "store-menu-app").StoreMenuApp
return function(p19) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u14
        [3] = u13
        [4] = u5
        [5] = u7
        [6] = u6
        [7] = u8
        [8] = u9
        [9] = u12
        [10] = u11
        [11] = u16
        [12] = u17
        [13] = u15
        [14] = u3
        [15] = u4
        [16] = u18
    --]]
    local function v24() --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u14
            [3] = u13
        --]]
        local v20 = u2.values(u14)
        local v21 = table.create(#v20)
        for v22, v23 in v20 do
            local _ = v22 - 1
            v21[v22] = { v23, u13.DEFAULT }
        end
        return u2.fromEntries(v21)
    end
    local v25 = u5.Store.new
    local v26 = {
        ["Bedwars"] = u7,
        ["Consumable"] = u6,
        ["Lobby"] = u8,
        ["Locker"] = u9
    }
    local v27 = u5.combineReducers(v26)
    local v28 = {}
    local v29 = {
        ["playerLevel"] = 20,
        ["freeKitLevel"] = 20,
        ["equippedKitSkins"] = v24(),
        ["kit"] = u14.AERY,
        ["kits"] = { u14.FROSTY_HAMMER },
        ["favoriteKits"] = {
            [u14.CYBER] = true,
            [u14.NAZAR] = true,
            [u14.FROSTY_HAMMER] = true
        },
        ["ownedKits"] = { u14.FROSTY_HAMMER },
        ["ownedKitSkins"] = { u13.TRINITY_FALLEN, u13.GUN_BLADE_SUMMER }
    }
    v28.Bedwars = v29
    local v30 = {}
    local v31 = {
        ["1"] = {
            ["id"] = "1",
            ["matchUsesLeft"] = 3,
            ["status"] = u12.ACTIVE,
            ["consumable"] = u11.BATTLE_PASS_2X
        },
        ["2"] = {
            ["id"] = "2",
            ["status"] = u12.ACTIVE,
            ["consumable"] = u11.BATTLE_PASS_3X,
            ["endTime"] = os.clock() + 86400
        }
    }
    v30.record = v31
    v28.Consumable = v30
    local v32 = {}
    local v33 = {
        ["newPlayerBundleData"] = {
            ["purchased"] = false,
            ["firstJoinTime"] = os.time()
        },
        ["dailyPurchaseHistory"] = { u16.BEDCOIN_100 },
        ["dailyStoreItems"] = {
            u16.BEDCOIN_100,
            u16.ANIMEMOTE_BEACHBALL,
            u16.BEDBREAK_CONNFETTI,
            u16.EMOTE_ALCHEMIST_YAP,
            u16.EMOTE_ZARRAH_LOVE,
            u16.EMOTE_ARCHER_GLARE
        }
    }
    v32.robuxStore = v33
    v32.ownedUGC = { u17.AERY_KIT_SHOULDER_BUDDY }
    v28.Lobby = v32
    v28.Locker = {
        ["killEffects"] = u2.values(u15)
    }
    local v34 = {
        ["store"] = v25(v27, v28)
    }
    local u35 = u3.mount(u3.createElement(u4, v34, { u3.createElement(u18, {
            ["AppId"] = "StoreMenuApp"
        }) }), p19)
    return function() --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u35
        --]]
        return u3.unmount(u35)
    end
end