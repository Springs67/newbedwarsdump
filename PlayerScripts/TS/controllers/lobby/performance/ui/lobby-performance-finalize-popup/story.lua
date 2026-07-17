-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local LobbyPerformanceFinalizedPopup = RuntimeLib.import(script, script.Parent, "lobby-performance-finalized-popup").LobbyPerformanceFinalizedPopup;

return function(p3) -- Line: 10
    -- upvalues: u2 (copy), GameReducer (copy), QueueType (copy), BedwarsKit (copy), u1 (copy), StoreProvider (copy), LobbyPerformanceFinalizedPopup (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Game = GameReducer
    }), {});
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(LobbyPerformanceFinalizedPopup, {
            data = {
                {
                    MatchInfo = {
                        MatchId = "",
                        TimeInGame = 720,
                        QueueType = QueueType.BEDWARS_5v5,
                        Kit = BedwarsKit.AERY
                    },
                    Earned = {
                        BedCoins = 100,
                        BattlepassXp = 2500,
                        ClanContribution = 50,
                        PlayerLevelXp = 400,
                        ArmorTrimXp = 450
                    }
                },
                {
                    MatchInfo = {
                        MatchId = "",
                        TimeInGame = 720,
                        QueueType = QueueType.BEDWARS_16v16,
                        Kit = BedwarsKit.SHEEP_HERDER
                    },
                    Earned = {
                        BedCoins = 124,
                        BattlepassXp = 1990,
                        ClanContribution = 5,
                        PlayerLevelXp = 420,
                        ArmorTrimXp = 75
                    }
                }
            }
        }) }), p3);

    return function() -- Line: 51
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;