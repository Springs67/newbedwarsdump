local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameCoreReducerMap
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").LobbyClientReducerMap
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local v5 = v1.import(script, script.Parent.Parent, "controllers", "global", "inventory", "reducers", "inventory-reducer").InventoryReducer
local v6 = v1.import(script, script.Parent, "rodux", "reducers", "afk-reducer").AfkReducer
local v7 = v1.import(script, script.Parent, "rodux", "reducers", "app-reducer").AppReducer
local v8 = v1.import(script, script.Parent, "rodux", "reducers", "armor-trim-reducer").ArmorTrimReducer
local v9 = v1.import(script, script.Parent, "rodux", "reducers", "battle-pass-reducer").BattlePassReducer
local v10 = v1.import(script, script.Parent, "rodux", "reducers", "clan-reducer").ClansReducer
local v11 = v1.import(script, script.Parent, "rodux", "reducers", "consumable-reducer").ConsumableReducer
local v12 = v1.import(script, script.Parent, "rodux", "reducers", "event-reducer").EventReducer
local v13 = v1.import(script, script.Parent, "rodux", "reducers", "game-updates-reducer").GameUpdatesReducer
local v14 = v1.import(script, script.Parent, "rodux", "reducers", "games", "all-random-kit-draft-reducer").ARKDraftReducer
local v15 = v1.import(script, script.Parent, "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer
local v16 = v1.import(script, script.Parent, "rodux", "reducers", "games", "custom-match-reducer").CustomMatchReducer
local v17 = v1.import(script, script.Parent, "rodux", "reducers", "games", "draft-reducer").DraftReducer
local v18 = v1.import(script, script.Parent, "rodux", "reducers", "games", "game-reducer").GameReducer
local v19 = v1.import(script, script.Parent, "rodux", "reducers", "games", "kit-reducer").KitReducer
local v20 = v1.import(script, script.Parent, "rodux", "reducers", "keys-reducer").KeysReducer
local v21 = v1.import(script, script.Parent, "rodux", "reducers", "leaderboard-reducer").LeaderboardReducer
local v22 = v1.import(script, script.Parent, "rodux", "reducers", "lobby-reducer").LobbyReducer
local v23 = v1.import(script, script.Parent, "rodux", "reducers", "locker-reducer").LockerReducer
local v24 = v1.import(script, script.Parent, "rodux", "reducers", "settings-reducer").SettingsReducer
local v25 = v1.import(script, script.Parent, "rodux", "reducers", "snake-shrine-reducer").SnakeShrineReducer
local v26 = {
    ["Inventory"] = v5,
    ["App"] = v7,
    ["Game"] = v18,
    ["Bedwars"] = v15,
    ["Kit"] = v19,
    ["Leaderboard"] = v21,
    ["Locker"] = v23,
    ["BattlePass"] = v9,
    ["Settings"] = v24,
    ["SocialConnections"] = v1.import(script, script.Parent, "rodux", "reducers", "social-connections-reducer").SocialConnectionsReducer,
    ["GameUpdates"] = v13,
    ["CustomMatch"] = v16,
    ["Clans"] = v10,
    ["Event"] = v12,
    ["Keys"] = v20,
    ["Consumable"] = v11,
    ["Lobby"] = v22,
    ["Afk"] = v6,
    ["ArmorTrim"] = v8,
    ["Tournament"] = v1.import(script, script.Parent, "rodux", "reducers", "tournament-reducer").TournamentReducer,
    ["SnakeShrine"] = v25,
    ["Draft"] = v17,
    ["ARKDraft"] = v14
}
for v27, v28 in v3 do
    v26[v27] = v28
end
for v29, v30 in v2 do
    v26[v29] = v30
end
local v31 = v4.combineReducers(v26)
return {
    ["StoreReducer"] = v31,
    ["ClientStore"] = v4.Store.new(v31, {})
}