-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local SnakeShrineReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "snake-shrine-reducer").SnakeShrineReducer;
local TeamBuffType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "snake-shrine-buff", "team-buff-type").TeamBuffType;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local InventoryReducer = RuntimeLib.import(script, script.Parent.Parent.Parent, "inventory", "reducers", "inventory-reducer").InventoryReducer;
local SnakeShrineApp = RuntimeLib.import(script, script.Parent, "snake-shrine-app").SnakeShrineApp;

return function(p4) -- Line: 14
    -- upvalues: Players (copy), InventoryUtil (copy), u3 (copy), GameReducer (copy), InventoryReducer (copy), SnakeShrineReducer (copy), TeamBuffType (copy), u1 (copy), u2 (copy), StoreProvider (copy), SnakeShrineApp (copy)
    local function _() -- Line: 15
        return {
            item = nil
        };
    end;

    if Players.LocalPlayer then
        InventoryUtil.getInventory(Players.LocalPlayer);
    else
        ({
            hand = nil,
            backpack = nil,
            items = {}
        }).armor = { "empty", "empty", "empty" };
    end;

    local v5 = u3.Store.new(u3.combineReducers({
        Game = GameReducer,
        Inventory = InventoryReducer,
        SnakeShrine = SnakeShrineReducer
    }), {
        Game = {},
        Inventory = {},
        SnakeShrine = {
            activeBuffCounts = {
                [TeamBuffType.POISON_ARROW] = 3
            }
        }
    });
    local u6 = u1("Part", {
        Name = "SnakeShrineInstance",
        Children = { u1("Model", {}) }
    });
    u6:SetAttribute("Team", "1");
    local u7 = u2.mount(u2.createElement(StoreProvider, {
        store = v5
    }, { u2.createElement(SnakeShrineApp, {
            AppId = "SnakeShrineApp",
            TeamId = "1",
            IsHomeBase = true,
            SnakeShrineInstance = u6
        }) }), p4);

    return function() -- Line: 54
        -- upvalues: u6 (copy), u2 (ref), u7 (copy)
        u6:Destroy();
        u2.unmount(u7);
    end;
end;