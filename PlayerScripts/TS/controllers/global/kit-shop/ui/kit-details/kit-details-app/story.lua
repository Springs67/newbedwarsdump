-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local ArmorTrimReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "armor-trim-reducer").ArmorTrimReducer;
local ConsumableReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "consumable-reducer").ConsumableReducer;
local BedwarsReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer;
local LobbyReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "lobby-reducer").LobbyReducer;
local ArmorTrimType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimType;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local KitDetailsApp = RuntimeLib.import(script, script.Parent, "kit-details-app").KitDetailsApp;

return function(p4) -- Line: 15
    -- upvalues: u1 (copy), BedwarsKit (copy), BedwarsKitSkin (copy), u3 (copy), LobbyReducer (copy), BedwarsReducer (copy), ArmorTrimReducer (copy), ConsumableReducer (copy), ArmorTrimType (copy), u2 (copy), StoreProvider (copy), KitDetailsApp (copy)
    local function v8() -- Line: 16
        -- upvalues: u1 (ref), BedwarsKit (ref), BedwarsKitSkin (ref)
        local v5 = u1.values(BedwarsKit);

        local function _(p6) -- Line: 18
            -- upvalues: BedwarsKitSkin (ref)
            return { p6, BedwarsKitSkin.DEFAULT };
        end;

        local v7 = table.create(#v5);

        for i, v in v5 do
            local _ = i - 1;
            v7[i] = { v, BedwarsKitSkin.DEFAULT };
        end;

        return u1.fromEntries(v7);
    end;

    local v9 = u3.Store.new(u3.combineReducers({
        Lobby = LobbyReducer,
        Bedwars = BedwarsReducer,
        ArmorTrim = ArmorTrimReducer,
        Consumable = ConsumableReducer
    }), {
        Lobby = {
            kitStatsProfiles = {
                [BedwarsKit.BARBARIAN] = {
                    wins = 500,
                    kills = 400
                },
                [BedwarsKit.SPIRIT_ASSASSIN] = {
                    wins = 1000,
                    kills = 1000,
                    dashes = 132,
                    ["dash kills"] = 12
                },
                [BedwarsKit.JELLYFISH] = {
                    wins = 1000,
                    kills = 1000
                }
            },
            kitContractProfiles = {
                [BedwarsKit.SPIRIT_ASSASSIN] = {
                    purchasedUnlock = false,
                    claimedRewards = {}
                },
                [BedwarsKit.SUMMONER] = {
                    purchasedUnlock = false,
                    claimedRewards = {}
                }
            }
        },
        ArmorTrim = {
            allKitProgress = {
                [BedwarsKit.JELLYFISH] = {
                    {
                        xpEarned = 45000,
                        trim = ArmorTrimType.TRIM_5
                    }
                },
                [BedwarsKit.AERY] = {
                    {
                        xpEarned = 1000,
                        trim = ArmorTrimType.TRIM_1
                    }
                }
            },
            effectUnlocks = {},
            allKitXpPotential = {
                [BedwarsKit.JELLYFISH] = 200000
            },
            selectedArmorTrimConfigs = {
                [BedwarsKit.JELLYFISH] = {
                    type = ArmorTrimType.TRIM_5,
                    color = {
                        r = 100,
                        g = 100,
                        b = 255
                    }
                }
            }
        },
        Bedwars = {
            playerLevel = 20,
            freeKitLevel = 20,
            favoriteKits = {
                [BedwarsKit.CYBER] = true,
                [BedwarsKit.NAZAR] = true,
                [BedwarsKit.FROSTY_HAMMER] = true
            },
            kits = {},
            ownedKits = { BedwarsKit.GUN_BLADE },
            kit = BedwarsKit.GUN_BLADE,
            equippedKitSkins = v8(),
            ownedKitSkins = { BedwarsKitSkin.JELLYFISH_DESSERT }
        },
        Consumable = {
            record = {}
        }
    });
    local u10 = u2.mount(u2.createElement(StoreProvider, {
        store = v9
    }, { u2.createElement(KitDetailsApp, {
            AppId = "KitDetailsApp",
            SelectedKit = BedwarsKit.LYLA
        }) }), p4);

    return function() -- Line: 117
        -- upvalues: u2 (ref), u10 (copy)
        u2.unmount(u10);
    end;
end;