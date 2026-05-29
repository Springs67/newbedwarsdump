local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil
local u7 = v1.import(script, script.Parent, "dummy-match-history").DummyMatchHistory
local u8 = v1.import(script, script.Parent, "match-history-moderation-app").MatchHistoryModerationApp
return function(p9) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u2
        [4] = u3
        [5] = u8
        [6] = u6
        [7] = u7
    --]]
    local v10 = {
        ["Game"] = u5
    }
    local v11 = u4.Store.new(u4.combineReducers(v10), {})
    local u12 = u2.mount(u2.createElement(u3, {
        ["store"] = v11
    }, { u2.createElement(u8, {
            ["AppId"] = "MatchHistoryApp",
            ["player"] = u6.Dummy.oiogy,
            ["matchHistory"] = u7
        }) }), p9)
    return function() --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u12
        --]]
        return u2.unmount(u12)
    end
end