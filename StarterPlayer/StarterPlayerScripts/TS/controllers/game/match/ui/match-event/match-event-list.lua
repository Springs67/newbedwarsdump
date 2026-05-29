local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u7 = v1.import(script, script.Parent, "match-event-countdown").MatchEventCountdown
local v22 = v5.new(u4)(function(p8, p9) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u7
        [4] = u2
    --]]
    local _ = p9.useState
    local v10 = u3.values(p8.MatchEvents)
    local v11 = table.create(#v10)
    for v12, v13 in v10 do
        local _ = v12 - 1
        local v14 = {
            ["AppId"] = "MatchEventCountdown"
        }
        for v15, v16 in v13 do
            v14[v15] = v16
        end
        v11[v12] = u4.createElement(u7, v14)
    end
    local v17 = {
        ["Size"] = p8.Size or UDim2.fromScale(1, 0.125)
    }
    local v18 = { u4.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["Padding"] = UDim.new(0.05, 0)
        }) }
    local v19 = #v18
    for v20, v21 in v11 do
        v18[v19 + v20] = v21
    end
    return u4.createElement(u2, v17, v18)
end)
return {
    ["MatchEventList"] = v6.connect(function(p23, p24) --[[ Line: 44 ]]
        local v25 = {}
        for v26, v27 in p24 do
            v25[v26] = v27
        end
        v25.MatchEvents = p23.Game.matchEvents
        return v25
    end)(v22)
}