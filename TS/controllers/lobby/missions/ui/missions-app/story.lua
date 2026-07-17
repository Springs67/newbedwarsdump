-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local BattlePassReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "battle-pass-reducer").BattlePassReducer;
local ConsumableReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "consumable-reducer").ConsumableReducer;
local BedwarsReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types");
local Consumable = v3.Consumable;
local ConsumableStatus = v3.ConsumableStatus;
local MissionsApp = RuntimeLib.import(script, script.Parent, "missions-app").MissionsApp;

return function(p4) -- Line: 13
    -- upvalues: u2 (copy), BedwarsReducer (copy), BattlePassReducer (copy), ConsumableReducer (copy), ConsumableStatus (copy), Consumable (copy), u1 (copy), StoreProvider (copy), MissionsApp (copy)
    local v5 = u2.Store.new(u2.combineReducers({
        Bedwars = BedwarsReducer,
        BattlePass = BattlePassReducer,
        Consumable = ConsumableReducer
    }), {
        Bedwars = {
            playerLevel = 32
        },
        BattlePass = {
            paid = false
        },
        Consumable = {
            inventory = {
                ["0"] = {
                    id = "0",
                    amount = 1,
                    status = ConsumableStatus.INVENTORY,
                    consumable = Consumable.AUTO_COMPLETE_DAILY_MISSION_TICKET,
                    time = os.time()
                },
                ["1"] = {
                    id = "1",
                    amount = 1,
                    status = ConsumableStatus.INVENTORY,
                    consumable = Consumable.AUTO_COMPLETE_WEEKLY_MISSION_TICKET,
                    time = os.time()
                },
                ["2"] = {
                    id = "2",
                    amount = 1,
                    status = ConsumableStatus.INVENTORY,
                    consumable = Consumable.AUTO_COMPLETE_WEEKLY_MISSION_TICKET,
                    time = os.time()
                }
            }
        }
    });
    local u6 = u1.mount(u1.createElement(StoreProvider, {
        store = v5
    }, { u1.createElement(MissionsApp, {
            AppId = "MissionsApp"
        }) }), p4);

    return function() -- Line: 58
        -- upvalues: u1 (ref), u6 (copy)
        return u1.unmount(u6);
    end;
end;