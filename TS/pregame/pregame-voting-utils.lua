local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
return {
    ["PregameVotingUtils"] = {
        ["POOL_SIZE"] = 4,
        ["DEFAULT_PREGAME_VOTING_OPTIONS"] = {},
        ["PRODUCTION_PREGAME_VOTING_PREGAME_TIME_SEC"] = 50,
        ["PRODUCTION_PREGAME_VOTING_DURATION"] = 30,
        ["STUDIO_PREGAME_VOTING_PREGAME_TIME_SEC"] = 25,
        ["STUDIO_PREGAME_VOTING_DURATION"] = 10,
        ["ROULETTE_DURATION"] = 5,
        ["ROULETTE_BREAK_DURATION"] = 3,
        ["getPregameVotingPregameTime"] = function() --[[ Name: getPregameVotingPregameTime, Line 23 ]]
            --[[
            Upvalues:
                [1] = u1
            --]]
            return u1:IsStudio() and 25 or 50
        end,
        ["getPregameVotingDuration"] = function() --[[ Name: getPregameVotingDuration, Line 27 ]]
            --[[
            Upvalues:
                [1] = u1
            --]]
            return u1:IsStudio() and 10 or 30
        end
    }
}