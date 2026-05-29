local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "lobby-reducer").LobbyReducer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-division").RankDivision
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta
local u8 = v1.import(script, script.Parent, "rank-decay-notification-app").RankDecayNotificationApp
return function(p9) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u6
        [4] = u7
        [5] = u2
        [6] = u3
        [7] = u8
    --]]
    local v10 = {
        ["Lobby"] = u5
    }
    local v11 = u4.combineReducers(v10)
    local v12 = u4.Store.new(v11, {
        ["Lobby"] = {}
    })
    local v13 = u6.DIAMOND_2
    local v14 = u7[v13].name
    local u15 = u2.mount(u2.createElement(u3, {
        ["store"] = v12
    }, { u2.createElement(u8, {
            ["AppId"] = "RankDecayNotificationApp",
            ["title"] = "Rank decay warning",
            ["durationSeconds"] = 999,
            ["body"] = "You will start decaying in " .. "3 days" .. ". Play a ranked match to keep " .. v14 .. ".",
            ["accentColor"] = Color3.fromRGB(255, 196, 79),
            ["rankDivision"] = v13
        }) }), p9)
    return function() --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u15
        --]]
        return u2.unmount(u15)
    end
end