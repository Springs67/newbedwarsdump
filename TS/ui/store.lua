-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local GameCoreReducerMap = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameCoreReducerMap;
local LobbyClientReducerMap = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").LobbyClientReducerMap;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local InventoryReducer = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "inventory", "reducers", "inventory-reducer").InventoryReducer;
local AfkReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "afk-reducer").AfkReducer;
local AppReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "app-reducer").AppReducer;
local ArmorTrimReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "armor-trim-reducer").ArmorTrimReducer;
local BattlePassReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "battle-pass-reducer").BattlePassReducer;
local ClansReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "clan-reducer").ClansReducer;
local ConsumableReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "consumable-reducer").ConsumableReducer;
local EventReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "event-reducer").EventReducer;
local GameUpdatesReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "game-updates-reducer").GameUpdatesReducer;
local ARKDraftReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "games", "all-random-kit-draft-reducer").ARKDraftReducer;
local BedwarsReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer;
local CustomMatchReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "games", "custom-match-reducer").CustomMatchReducer;
local DraftReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "games", "draft-reducer").DraftReducer;
local GameReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "games", "game-reducer").GameReducer;
local KitReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "games", "kit-reducer").KitReducer;
local KeysReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "keys-reducer").KeysReducer;
local LeaderboardReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "leaderboard-reducer").LeaderboardReducer;
local LobbyReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "lobby-reducer").LobbyReducer;
local LockerReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "locker-reducer").LockerReducer;
local SettingsReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "settings-reducer").SettingsReducer;
local SnakeShrineReducer = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "snake-shrine-reducer").SnakeShrineReducer;
local v2 = {
    Inventory = InventoryReducer,
    App = AppReducer,
    Game = GameReducer,
    Bedwars = BedwarsReducer,
    Kit = KitReducer,
    Leaderboard = LeaderboardReducer,
    Locker = LockerReducer,
    BattlePass = BattlePassReducer,
    Settings = SettingsReducer,
    SocialConnections = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "social-connections-reducer").SocialConnectionsReducer,
    GameUpdates = GameUpdatesReducer,
    CustomMatch = CustomMatchReducer,
    Clans = ClansReducer,
    Event = EventReducer,
    Keys = KeysReducer,
    Consumable = ConsumableReducer,
    Lobby = LobbyReducer,
    Afk = AfkReducer,
    ArmorTrim = ArmorTrimReducer,
    Tournament = RuntimeLib.import(script, script.Parent, "rodux", "reducers", "tournament-reducer").TournamentReducer,
    SnakeShrine = SnakeShrineReducer,
    Draft = DraftReducer,
    ARKDraft = ARKDraftReducer
};

for i, v in LobbyClientReducerMap do
    v2[i] = v;
end;

for i, v in GameCoreReducerMap do
    v2[i] = v;
end;

local v3 = v1.combineReducers(v2);

return {
    StoreReducer = v3,
    ClientStore = v1.Store.new(v3, {})
};