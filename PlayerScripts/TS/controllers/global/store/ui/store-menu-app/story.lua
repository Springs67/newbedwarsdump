-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local ConsumableReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "consumable-reducer").ConsumableReducer;
local BedwarsReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer;
local LobbyReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "lobby-reducer").LobbyReducer;
local LockerReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "locker-reducer").LockerReducer;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types");
local Consumable = v4.Consumable;
local ConsumableStatus = v4.ConsumableStatus;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local KillEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
local DailyStoreItem = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "robux-daily-store", "robux-daily-store-items").DailyStoreItem;
local UgcType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ugc", "ugc-type").UgcType;
local StoreMenuApp = RuntimeLib.import(script, script.Parent, "store-menu-app").StoreMenuApp;

return function(p5) -- Line: 20
    -- upvalues: u1 (copy), BedwarsKit (copy), BedwarsKitSkin (copy), u3 (copy), BedwarsReducer (copy), ConsumableReducer (copy), LobbyReducer (copy), LockerReducer (copy), ConsumableStatus (copy), Consumable (copy), DailyStoreItem (copy), UgcType (copy), KillEffectType (copy), u2 (copy), StoreProvider (copy), StoreMenuApp (copy)
    local function v9() -- Line: 21
        -- upvalues: u1 (ref), BedwarsKit (ref), BedwarsKitSkin (ref)
        local v6 = u1.values(BedwarsKit);

        local function _(p7) -- Line: 23
            -- upvalues: BedwarsKitSkin (ref)
            return { p7, BedwarsKitSkin.DEFAULT };
        end;

        local v8 = table.create(#v6);

        for i, v in v6 do
            local _ = i - 1;
            v8[i] = { v, BedwarsKitSkin.DEFAULT };
        end;

        return u1.fromEntries(v8);
    end;

    local v10 = u3.Store.new(u3.combineReducers({
        Bedwars = BedwarsReducer,
        Consumable = ConsumableReducer,
        Lobby = LobbyReducer,
        Locker = LockerReducer
    }), {
        Bedwars = {
            playerLevel = 20,
            freeKitLevel = 20,
            equippedKitSkins = v9(),
            kit = BedwarsKit.AERY,
            kits = { BedwarsKit.FROSTY_HAMMER },
            favoriteKits = {
                [BedwarsKit.CYBER] = true,
                [BedwarsKit.NAZAR] = true,
                [BedwarsKit.FROSTY_HAMMER] = true
            },
            ownedKits = { BedwarsKit.FROSTY_HAMMER },
            ownedKitSkins = { BedwarsKitSkin.TRINITY_FALLEN, BedwarsKitSkin.GUN_BLADE_SUMMER }
        },
        Consumable = {
            record = {
                ["1"] = {
                    id = "1",
                    matchUsesLeft = 3,
                    status = ConsumableStatus.ACTIVE,
                    consumable = Consumable.BATTLE_PASS_2X
                },
                ["2"] = {
                    id = "2",
                    status = ConsumableStatus.ACTIVE,
                    consumable = Consumable.BATTLE_PASS_3X,
                    endTime = os.clock() + 86400
                }
            }
        },
        Lobby = {
            robuxStore = {
                newPlayerBundleData = {
                    purchased = false,
                    firstJoinTime = os.time()
                },
                dailyPurchaseHistory = { DailyStoreItem.BEDCOIN_100 },
                dailyStoreItems = {
                    DailyStoreItem.BEDCOIN_100,
                    DailyStoreItem.ANIMEMOTE_BEACHBALL,
                    DailyStoreItem.BEDBREAK_CONNFETTI,
                    DailyStoreItem.EMOTE_ALCHEMIST_YAP,
                    DailyStoreItem.EMOTE_ZARRAH_LOVE,
                    DailyStoreItem.EMOTE_ARCHER_GLARE
                }
            },
            ownedUGC = { UgcType.AERY_KIT_SHOULDER_BUDDY }
        },
        Locker = {
            killEffects = u1.values(KillEffectType)
        }
    });
    local u11 = u2.mount(u2.createElement(StoreProvider, {
        store = v10
    }, { u2.createElement(StoreMenuApp, {
            AppId = "StoreMenuApp"
        }) }), p5);

    return function() -- Line: 94
        -- upvalues: u2 (ref), u11 (copy)
        return u2.unmount(u11);
    end;
end;