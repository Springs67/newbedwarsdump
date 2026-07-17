-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local InventoryReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "reducers", "inventory-reducer").InventoryReducer;
local BedwarsReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer;
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local StudioQueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "studio-config-override").StudioQueueType;
local BedPlatingUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil;
local TeamUpgradeApp = RuntimeLib.import(script, script.Parent, "team-upgrade-app").TeamUpgradeApp;

return function(p3) -- Line: 12
    -- upvalues: u2 (copy), GameReducer (copy), BedwarsReducer (copy), InventoryReducer (copy), BedPlatingUtil (copy), StudioQueueType (copy), u1 (copy), StoreProvider (copy), TeamUpgradeApp (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Game = GameReducer,
        Bedwars = BedwarsReducer,
        Inventory = InventoryReducer
    }), {
        Bedwars = {
            myTeamUpgrades = {},
            myBedTeamUpgrades = {},
            teamBedStatus = { BedPlatingUtil.BedStatus.BED_ALIVE }
        },
        Game = {
            queueType = StudioQueueType
        }
    });
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(TeamUpgradeApp, {
            AppId = "TeamUpgradeApp",
            TeamId = "0",
            IsHomeBase = false
        }) }), p3);

    return function() -- Line: 38
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;