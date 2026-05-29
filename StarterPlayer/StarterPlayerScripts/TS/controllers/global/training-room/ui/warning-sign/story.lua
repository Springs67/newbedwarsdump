local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
return function(p6) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u2
        [4] = u3
    --]]
    local v7 = {
        ["Game"] = u5
    }
    local v8 = {
        ["store"] = u4.Store.new(u4.combineReducers(v7), {})
    }
    local u9 = u2.mount(u2.createElement(u3, v8), p6)
    return function() --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u9
        --]]
        return u2.unmount(u9)
    end
end