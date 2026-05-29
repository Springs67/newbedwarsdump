local u1 = {
    ["globalStats"] = nil,
    ["rankStats"] = nil,
    ["leaderboards"] = {},
    ["queues"] = {}
}
return {
    ["LeaderboardReducer"] = function(p2, p3) --[[ Name: LeaderboardReducer, Line 8 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        if p2 == nil then
            p2 = u1
        end
        local v4 = {}
        for v5, v6 in p2 do
            v4[v5] = v6
        end
        local v7 = p3.type
        if v7 == "UpdateLeaderboard" then
            v4.leaderboards[p3.leaderboard] = p3.data
            return v4
        end
        if v7 == "UpdateAllLeaderboards" then
            v4.leaderboards = p3.leaderboards
            return v4
        end
        if v7 ~= "SetStats" then
            return v4
        end
        v4.globalStats = p3.globalStats
        v4.queues = p3.queues
        v4.rankStats = p3.rankStats
        return v4
    end
}