-- Decompiled with Potassium's decompiler.

local u1 = {
    globalStats = nil,
    rankStats = nil,
    leaderboards = {},
    queues = {}
};

return {
    LeaderboardReducer = function(p2, p3) -- Line: 8, Name: LeaderboardReducer
        -- upvalues: u1 (copy)
        if p2 == nil then
            p2 = u1;
        end;

        local v4 = {};

        for i, v in p2 do
            v4[i] = v;
        end;

        local type = p3.type;

        if type == "UpdateLeaderboard" then
            v4.leaderboards[p3.leaderboard] = p3.data;

            return v4;
        end;

        if type == "UpdateAllLeaderboards" then
            v4.leaderboards = p3.leaderboards;

            return v4;
        end;

        if type ~= "SetStats" then
            return v4;
        end;

        v4.globalStats = p3.globalStats;
        v4.queues = p3.queues;
        v4.rankStats = p3.rankStats;

        return v4;
    end
};