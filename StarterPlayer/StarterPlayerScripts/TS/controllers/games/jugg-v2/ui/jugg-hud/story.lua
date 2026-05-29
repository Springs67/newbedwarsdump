local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u7 = v1.import(script, script.Parent, "jugg-hud").JuggHud
return function(p8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u5
        [4] = u2
        [5] = u3
        [6] = u7
    --]]
    local v9 = u4.Store.new
    local v10 = {
        ["Game"] = u6,
        ["Bedwars"] = u5
    }
    local v11 = u4.combineReducers(v10)
    local v12 = {}
    local v13 = {
        ["kills"] = {
            3,
            6,
            0,
            8
        }
    }
    v12.Bedwars = v13
    local v14 = {
        ["store"] = v9(v11, v12)
    }
    local u15 = u2.mount(u2.createElement(u3, v14, { u2.createElement(u7, {
            ["AppId"] = "JuggHud"
        }) }), p8)
    return function() --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u15
        --]]
        return u2.unmount(u15)
    end
end