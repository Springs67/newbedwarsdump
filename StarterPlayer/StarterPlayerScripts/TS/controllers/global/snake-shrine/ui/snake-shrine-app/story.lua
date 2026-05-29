local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "snake-shrine-reducer").SnakeShrineReducer
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "snake-shrine-buff", "team-buff-type").TeamBuffType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u11 = v1.import(script, script.Parent.Parent.Parent, "inventory", "reducers", "inventory-reducer").InventoryReducer
local u12 = v1.import(script, script.Parent, "snake-shrine-app").SnakeShrineApp
return function(p13) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u5
        [4] = u7
        [5] = u11
        [6] = u8
        [7] = u9
        [8] = u2
        [9] = u3
        [10] = u4
        [11] = u12
    --]]
    if u6.LocalPlayer then
        u10.getInventory(u6.LocalPlayer)
    end
    local v14 = u5.Store.new
    local v15 = {
        ["Game"] = u7,
        ["Inventory"] = u11,
        ["SnakeShrine"] = u8
    }
    local v16 = u5.combineReducers(v15)
    local v17 = {
        ["Game"] = {},
        ["Inventory"] = {}
    }
    local v18 = {
        ["activeBuffCounts"] = {
            [u9.POISON_ARROW] = 3
        }
    }
    v17.SnakeShrine = v18
    local v19 = v14(v16, v17)
    local u20 = u2("Part", {
        ["Name"] = "SnakeShrineInstance",
        ["Children"] = { u2("Model", {}) }
    })
    u20:SetAttribute("Team", "1")
    local u21 = u3.mount(u3.createElement(u4, {
        ["store"] = v19
    }, { u3.createElement(u12, {
            ["AppId"] = "SnakeShrineApp",
            ["TeamId"] = "1",
            ["IsHomeBase"] = true,
            ["SnakeShrineInstance"] = u20
        }) }), p13)
    return function() --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u3
            [3] = u21
        --]]
        u20:Destroy()
        u3.unmount(u21)
    end
end