local u1 = {
    ["draftMode"] = nil,
    ["sharedData"] = {
        ["draftEnded"] = false,
        ["matchDraftPhaseEndTime"] = 0,
        ["completedPhases"] = {},
        ["matchDraftPhase"] = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-phase").MatchDraftPhase.LOADING,
        ["kitBans"] = {}
    },
    ["teamData"] = {
        ["votedKitBans"] = {},
        ["kitSelection"] = {}
    },
    ["enemyTeamData"] = {}
}
return {
    ["DraftReducer"] = function(p2, p3) --[[ Name: DraftReducer, Line 19 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        if p2 == nil then
            p2 = u1
        end
        if p3.type ~= "SetDraft" then
            return p2
        end
        local v4 = {}
        for v5, v6 in p2 do
            v4[v5] = v6
        end
        for v7, v8 in p3.data do
            v4[v7] = v8
        end
        return v4
    end
}