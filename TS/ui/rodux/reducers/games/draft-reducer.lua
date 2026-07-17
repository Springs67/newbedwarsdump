-- Decompiled with Potassium's decompiler.

local u1 = {
    draftMode = nil,
    sharedData = {
        draftEnded = false,
        matchDraftPhaseEndTime = 0,
        completedPhases = {},
        matchDraftPhase = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-phase").MatchDraftPhase.LOADING,
        kitBans = {}
    },
    teamData = {
        votedKitBans = {},
        kitSelection = {}
    },
    enemyTeamData = {}
};

return {
    DraftReducer = function(p2, p3) -- Line: 19, Name: DraftReducer
        -- upvalues: u1 (copy)
        if p2 == nil then
            p2 = u1;
        end;

        if p3.type ~= "SetDraft" then
            return p2;
        end;

        local v4 = {};

        for i, v in p2 do
            v4[i] = v;
        end;

        for i, v in p3.data do
            v4[i] = v;
        end;

        return v4;
    end
};