local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "consumable-reducer").ConsumableReducer
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types")
local u8 = v7.Consumable
local u9 = v7.ConsumableStatus
local u10 = v1.import(script, script.Parent, "consumable-boost-list").ConsumableBoostList
return function(p11) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u5
        [4] = u9
        [5] = u8
        [6] = u2
        [7] = u3
        [8] = u10
    --]]
    local v12 = u4.Store.new
    local v13 = {
        ["Game"] = u6,
        ["Consumable"] = u5
    }
    local v14 = u4.combineReducers(v13)
    local v15 = {}
    local v16 = {}
    local v17 = {
        ["1"] = {
            ["id"] = "1",
            ["matchUsesLeft"] = 3,
            ["status"] = u9.ACTIVE,
            ["consumable"] = u8.BATTLE_PASS_2X
        },
        ["2"] = {
            ["id"] = "2",
            ["status"] = u9.ACTIVE,
            ["consumable"] = u8.BATTLE_PASS_3X,
            ["endTime"] = os.time() + 86400
        }
    }
    v16.record = v17
    v15.Consumable = v16
    local v18 = {
        ["store"] = v12(v14, v15)
    }
    local u19 = u2.mount(u2.createElement(u3, v18, { u2.createElement(u10, {
            ["AppId"] = "ConsumableBoostList"
        }) }), p11)
    return function() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u19
        --]]
        return u2.unmount(u19)
    end
end