local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u7 = v1.import(script, script.Parent, "item-catalog-popup").ItemCatalogPopup
return function(p8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u2
        [4] = u3
        [5] = u7
        [6] = u6
    --]]
    local v9 = {
        ["Game"] = u5
    }
    local v10 = u4.Store.new(u4.combineReducers(v9), {})
    local u11 = u2.mount(u2.createElement(u3, {
        ["store"] = v10
    }, { u2.createElement(u7, {
            ["AppId"] = "ItemCatalogPopup",
            ["collectionProgress"] = 1,
            ["closeMenu"] = function() --[[ Name: closeMenu, Line 17 ]]
                return print("Closed")
            end,
            ["itemType"] = u6.MYTHIC_DAGGER
        }) }), p8)
    return function() --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u11
        --]]
        return u2.unmount(u11)
    end
end