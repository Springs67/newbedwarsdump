local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v2 = {}
local u3 = setmetatable({}, {
    ["__index"] = v2
})
u3.Namespace = "namespace"
v2.namespace = "Namespace"
u3.MatchId = "matchId"
v2.matchId = "MatchId"
u3.QueueType = "queueType"
v2.queueType = "QueueType"
return {
    ["UserIdLogDataProperty"] = "userId",
    ["extractExtraLogData"] = function(p4) --[[ Name: extractExtraLogData, Line 37 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u3
        --]]
        local v5 = {}
        for v6, v7 in u1.values(u3) do
            local _ = v6 - 1
            if p4[v7] ~= nil then
                v5[v7] = p4[v7]
            end
        end
        return v5
    end,
    ["ExtraLogDataProperties"] = u3
}