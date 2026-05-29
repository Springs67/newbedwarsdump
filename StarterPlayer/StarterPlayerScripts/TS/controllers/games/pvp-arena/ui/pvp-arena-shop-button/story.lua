local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer
local u6 = v1.import(script, script.Parent, "pvp-arena-shop-button").PvPArenaShopButton
return function(p7) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u2
        [4] = u3
        [5] = u6
    --]]
    local v8 = {
        ["Bedwars"] = u5
    }
    local v9 = {
        ["store"] = u4.Store.new(u4.combineReducers(v8))
    }
    local u10 = u2.mount(u2.createElement(u3, v9, { u2.createElement(u6, {
            ["AppId"] = "PvPArenaShopUI"
        }) }), p7)
    return function() --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u10
        --]]
        return u2.unmount(u10)
    end
end