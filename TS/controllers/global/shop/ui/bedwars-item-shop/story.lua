-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local InventoryReducer = RuntimeLib.import(script, script.Parent.Parent.Parent, "inventory", "reducers", "inventory-reducer").InventoryReducer;
local BedwarsItemShopApp = RuntimeLib.import(script, script.Parent, "bedwars-item-shop-app").BedwarsItemShopApp;

return function(p3) -- Line: 10
    -- upvalues: u2 (copy), GameReducer (copy), InventoryReducer (copy), QueueType (copy), u1 (copy), StoreProvider (copy), BedwarsItemShopApp (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Game = GameReducer,
        Inventory = InventoryReducer
    }), {
        Game = {
            queueType = QueueType.BEDWARS_TO4
        },
        Inventory = {}
    });
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(BedwarsItemShopApp, {
            AppId = "BedwarsItemShopApp",
            IsHomeBase = true
        }) }), p3);

    return function() -- Line: 28
        -- upvalues: u1 (ref), u5 (copy)
        u1.unmount(u5);
    end;
end;