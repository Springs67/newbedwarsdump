-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local LobbyReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "lobby-reducer").LobbyReducer;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local KitContractApp = RuntimeLib.import(script, script.Parent, "kit-contract-app").KitContractApp;

return function(p3) -- Line: 9
    -- upvalues: u2 (copy), LobbyReducer (copy), BedwarsKit (copy), u1 (copy), StoreProvider (copy), KitContractApp (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Lobby = LobbyReducer
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
                [BedwarsKit.SUMMONER] = {
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
        }
    });
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(KitContractApp, {
            AppId = "KitContractApp",
            SelectedKit = BedwarsKit.SUMMONER
        }) }), p3);

    return function() -- Line: 50
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;