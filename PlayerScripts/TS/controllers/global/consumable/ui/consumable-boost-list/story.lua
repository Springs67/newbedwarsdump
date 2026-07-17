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
local ConsumableBoostList = RuntimeLib.import(script, script.Parent, "consumable-boost-list").ConsumableBoostList;

return function(p4) -- Line: 12
    -- upvalues: u2 (copy), GameReducer (copy), ConsumableReducer (copy), ConsumableStatus (copy), Consumable (copy), u1 (copy), StoreProvider (copy), ConsumableBoostList (copy)
    local v5 = u2.Store.new(u2.combineReducers({
        Game = GameReducer,
        Consumable = ConsumableReducer
    }), {
        Consumable = {
            record = {
                ["1"] = {
                    id = "1",
                    matchUsesLeft = 3,
                    status = ConsumableStatus.ACTIVE,
                    consumable = Consumable.BATTLE_PASS_2X
                },
                ["2"] = {
                    id = "2",
                    status = ConsumableStatus.ACTIVE,
                    consumable = Consumable.BATTLE_PASS_3X,
                    endTime = os.time() + 86400
                }
            }
        }
    });
    local u6 = u1.mount(u1.createElement(StoreProvider, {
        store = v5
    }, { u1.createElement(ConsumableBoostList, {
            AppId = "ConsumableBoostList"
        }) }), p4);

    return function() -- Line: 41
        -- upvalues: u1 (ref), u6 (copy)
        return u1.unmount(u6);
    end;
end;