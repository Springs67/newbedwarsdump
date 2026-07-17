-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local ConsumableReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "consumable-reducer").ConsumableReducer;
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types");
local Consumable = v3.Consumable;
local ConsumableStatus = v3.ConsumableStatus;
local CratePickerApp = RuntimeLib.import(script, script.Parent, "crate-picker").CratePickerApp;

return function(p4) -- Line: 12
    -- upvalues: u2 (copy), GameReducer (copy), ConsumableReducer (copy), ConsumableStatus (copy), Consumable (copy), u1 (copy), StoreProvider (copy), CratePickerApp (copy)
    local v5 = u2.Store.new(u2.combineReducers({
        Game = GameReducer,
        Consumable = ConsumableReducer
    }), {
        Consumable = {
            inventory = {
                ["123"] = {
                    id = "123",
                    status = ConsumableStatus.INVENTORY,
                    consumable = Consumable.LEVEL_UP_CRATE
                },
                ["1234"] = {
                    id = "1234",
                    status = ConsumableStatus.INVENTORY,
                    consumable = Consumable.DIAMOND_LUCKY_CRATE
                },
                ["12345"] = {
                    id = "12345",
                    status = ConsumableStatus.INVENTORY,
                    consumable = Consumable.AFK_CRATE
                }
            }
        }
    });
    local u6 = u1.mount(u1.createElement(StoreProvider, {
        store = v5
    }, { u1.createElement(CratePickerApp, {
            AppId = "CratePickerApp",
            CrateAltarId = 1
        }) }), p4);

    return function() -- Line: 45
        -- upvalues: u1 (ref), u6 (copy)
        return u1.unmount(u6);
    end;
end;