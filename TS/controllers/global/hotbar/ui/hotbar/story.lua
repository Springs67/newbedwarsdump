-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local AppInfoReducer = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AppInfoReducer;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out");
local PartyReducer = v1.PartyReducer;
local QueueState = v1.QueueState;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local AppReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "app-reducer").AppReducer;
local BedwarsReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer;
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local InventoryReducer = RuntimeLib.import(script, script.Parent.Parent.Parent, "inventory", "reducers", "inventory-reducer").InventoryReducer;
local HotbarApp = RuntimeLib.import(script, script.Parent, "hotbar-app").HotbarApp;

return function(p4) -- Line: 18
    -- upvalues: u3 (copy), BedwarsReducer (copy), GameReducer (copy), AppInfoReducer (copy), AppReducer (copy), InventoryReducer (copy), PartyReducer (copy), BedwarsKit (copy), QueueType (copy), OfflinePlayerUtil (copy), QueueState (copy), u2 (copy), StoreProvider (copy), HotbarApp (copy)
    local v5 = u3.Store.new(u3.combineReducers({
        Bedwars = BedwarsReducer,
        Game = GameReducer,
        AppInfo = AppInfoReducer,
        App = AppReducer,
        Inventory = InventoryReducer,
        Party = PartyReducer
    }), {
        Bedwars = {
            kit = BedwarsKit.AERY
        },
        Game = {
            spectating = true,
            spectatingPlayer = nil,
            queueType = QueueType.BEDWARS_TEST,
            teams = {}
        },
        App = {
            showHotbarPartyControls = false
        },
        AppInfo = {
            openApps = {}
        },
        Inventory = {
            observedPlayer = nil,
            observedInventory = {
                hotbarSlot = 0,
                hotbar = { {
                        item = nil
                    }, {
                        item = nil
                    }, {
                        item = nil
                    }, {
                        item = nil
                    }, {
                        item = nil
                    }, {
                        item = nil
                    }, {
                        item = nil
                    }, {
                        item = nil
                    }, {
                        item = nil
                    } },
                inventory = {
                    hand = nil,
                    backpack = nil,
                    items = {},
                    armor = {}
                },
                observedChest = {
                    items = {}
                }
            }
        },
        Party = {
            leader = OfflinePlayerUtil.Dummy.oiogy,
            queueState = QueueState.NONE
        }
    });
    local u6 = u2.mount(u2.createElement(StoreProvider, {
        store = v5
    }, { u2.createElement(HotbarApp) }), p4);

    return function() -- Line: 86
        -- upvalues: u2 (ref), u6 (copy)
        return u2.unmount(u6);
    end;
end;