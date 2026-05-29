local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u6 = v1.import(script, script.Parent, "rate-map-modal").RateMapModal
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
        ["Game"] = u5
    }
    local v9 = u4.Store.new(u4.combineReducers(v8), {})
    local u10 = u2.mount(u2.createElement(u3, {
        ["store"] = v9
    }, { u2.createElement(u6, {
            ["AppId"] = "RateMapModal",
            ["mapData"] = {
                ["mapEntityId"] = "",
                ["mapId"] = "",
                ["joinCode"] = "D9S3BG95LPZ0",
                ["creatorUserId"] = 1234,
                ["mapTitle"] = "5v5 Castlegrounds",
                ["mapDescription"] = "In the Blox Fruits hide-and-seek map, players explore a lush tropical paradise, blending in as pirates.",
                ["thumbnailImage"] = "rbxassetid://13915009106"
            }
        }) }), p7)
    return function() --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u10
        --]]
        return u2.unmount(u10)
    end
end