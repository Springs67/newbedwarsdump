local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u8 = v1.import(script, script.Parent, "lobby-performance-finalized-popup").LobbyPerformanceFinalizedPopup
return function(p9) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u6
        [4] = u7
        [5] = u2
        [6] = u3
        [7] = u8
    --]]
    local v10 = {
        ["Game"] = u5
    }
    local v11 = u4.Store.new(u4.combineReducers(v10), {})
    local v12 = {
        ["MatchInfo"] = {
            ["MatchId"] = "",
            ["TimeInGame"] = 720,
            ["QueueType"] = u6.BEDWARS_5v5,
            ["Kit"] = u7.AERY
        },
        ["Earned"] = {
            ["BedCoins"] = 100,
            ["BattlepassXp"] = 2500,
            ["ClanContribution"] = 50,
            ["PlayerLevelXp"] = 400,
            ["ArmorTrimXp"] = 450
        }
    }
    local v13 = {
        ["MatchInfo"] = {
            ["MatchId"] = "",
            ["TimeInGame"] = 720,
            ["QueueType"] = u6.BEDWARS_16v16,
            ["Kit"] = u7.SHEEP_HERDER
        },
        ["Earned"] = {
            ["BedCoins"] = 124,
            ["BattlepassXp"] = 1990,
            ["ClanContribution"] = 5,
            ["PlayerLevelXp"] = 420,
            ["ArmorTrimXp"] = 75
        }
    }
    local u14 = u2.mount(u2.createElement(u3, {
        ["store"] = v11
    }, { u2.createElement(u8, {
            ["data"] = { v12, v13 }
        }) }), p9)
    return function() --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u14
        --]]
        return u2.unmount(u14)
    end
end