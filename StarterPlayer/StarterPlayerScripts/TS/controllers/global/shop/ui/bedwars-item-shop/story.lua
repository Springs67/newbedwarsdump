local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u7 = v1.import(script, script.Parent.Parent.Parent, "inventory", "reducers", "inventory-reducer").InventoryReducer
local u8 = v1.import(script, script.Parent, "bedwars-item-shop-app").BedwarsItemShopApp
return function(p9) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u7
        [4] = u6
        [5] = u2
        [6] = u3
        [7] = u8
    --]]
    local v10 = u4.Store.new
    local v11 = {
        ["Game"] = u5,
        ["Inventory"] = u7
    }
    local v12 = u4.combineReducers(v11)
    local v13 = {
        ["Game"] = {
            ["queueType"] = u6.BEDWARS_TO4
        },
        ["Inventory"] = {}
    }
    local v14 = {
        ["store"] = v10(v12, v13)
    }
    local u15 = u2.mount(u2.createElement(u3, v14, { u2.createElement(u8, {
            ["AppId"] = "BedwarsItemShopApp",
            ["IsHomeBase"] = true
        }) }), p9)
    return function() --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u15
        --]]
        u2.unmount(u15)
    end
end