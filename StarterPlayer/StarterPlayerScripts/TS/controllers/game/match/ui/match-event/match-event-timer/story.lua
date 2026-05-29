local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u8 = v1.import(script, script.Parent, "match-event-countdown").MatchEventCountdown
return function(p9) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u3
        [4] = u4
        [5] = u8
        [6] = u7
        [7] = u2
    --]]
    local v10 = {
        ["Game"] = u6
    }
    local v11 = u5.Store.new(u5.combineReducers(v10), {})
    local u12 = u3.mount(u3.createElement(u4, {
        ["store"] = v11
    }, { u3.createElement(u8, {
            ["AppId"] = "MatchEventCountdown",
            ["id"] = "id",
            ["name"] = "Boss Spawn",
            ["textTransparency"] = 1,
            ["image"] = u7.THREE_TITANS_ICON,
            ["time"] = os.time() + 30,
            ["isOnTopHud"] = {
                ["shouldDisplay"] = false
            },
            ["textColor"] = u2.WHITE
        }) }), p9)
    return function() --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u12
        --]]
        return u3.unmount(u12)
    end
end