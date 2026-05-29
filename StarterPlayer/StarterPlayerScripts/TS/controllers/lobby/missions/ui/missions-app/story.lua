local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "battle-pass-reducer").BattlePassReducer
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "consumable-reducer").ConsumableReducer
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types")
local u9 = v8.Consumable
local u10 = v8.ConsumableStatus
local u11 = v1.import(script, script.Parent, "missions-app").MissionsApp
return function(p12) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u5
        [4] = u6
        [5] = u10
        [6] = u9
        [7] = u2
        [8] = u3
        [9] = u11
    --]]
    local v13 = u4.Store.new
    local v14 = {
        ["Bedwars"] = u7,
        ["BattlePass"] = u5,
        ["Consumable"] = u6
    }
    local v15 = u4.combineReducers(v14)
    local v16 = {
        ["Bedwars"] = {
            ["playerLevel"] = 32
        },
        ["BattlePass"] = {
            ["paid"] = false
        }
    }
    local v17 = {}
    local v18 = {
        ["0"] = {
            ["id"] = "0",
            ["amount"] = 1,
            ["status"] = u10.INVENTORY,
            ["consumable"] = u9.AUTO_COMPLETE_DAILY_MISSION_TICKET,
            ["time"] = os.time()
        },
        ["1"] = {
            ["id"] = "1",
            ["amount"] = 1,
            ["status"] = u10.INVENTORY,
            ["consumable"] = u9.AUTO_COMPLETE_WEEKLY_MISSION_TICKET,
            ["time"] = os.time()
        },
        ["2"] = {
            ["id"] = "2",
            ["amount"] = 1,
            ["status"] = u10.INVENTORY,
            ["consumable"] = u9.AUTO_COMPLETE_WEEKLY_MISSION_TICKET,
            ["time"] = os.time()
        }
    }
    v17.inventory = v18
    v16.Consumable = v17
    local v19 = {
        ["store"] = v13(v15, v16)
    }
    local u20 = u2.mount(u2.createElement(u3, v19, { u2.createElement(u11, {
            ["AppId"] = "MissionsApp"
        }) }), p12)
    return function() --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u20
        --]]
        return u2.unmount(u20)
    end
end