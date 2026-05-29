local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "match-level", "match-level").MatchLevel
local u2 = {
    [v1.ZERO] = {
        ["forgePointsAwarded"] = 0,
        ["experienceRequired"] = 0,
        ["experienceAwardedForKill"] = 105,
        ["experienceAwardedForAssist"] = 70
    },
    [v1.ONE] = {
        ["forgePointsAwarded"] = 2,
        ["experienceRequired"] = 100,
        ["experienceAwardedForKill"] = 215,
        ["experienceAwardedForAssist"] = 105
    },
    [v1.TWO] = {
        ["forgePointsAwarded"] = 3,
        ["experienceRequired"] = 200,
        ["experienceAwardedForKill"] = 262.2,
        ["experienceAwardedForAssist"] = 174.79999999999998
    },
    [v1.THREE] = {
        ["forgePointsAwarded"] = 3,
        ["experienceRequired"] = 300,
        ["experienceAwardedForKill"] = 331.2,
        ["experienceAwardedForAssist"] = 285.2
    },
    [v1.FOUR] = {
        ["forgePointsAwarded"] = 4,
        ["experienceRequired"] = 400,
        ["experienceAwardedForKill"] = 365.40000000000003,
        ["experienceAwardedForAssist"] = 361.2
    },
    [v1.FIVE] = {
        ["forgePointsAwarded"] = 4,
        ["experienceRequired"] = 500,
        ["experienceAwardedForKill"] = 387.59999999999997,
        ["experienceAwardedForAssist"] = 418
    },
    [v1.SIX] = {
        ["forgePointsAwarded"] = 5,
        ["experienceRequired"] = 600,
        ["experienceAwardedForKill"] = 397.8,
        ["experienceAwardedForAssist"] = 455.59999999999997
    },
    [v1.SEVEN] = {
        ["forgePointsAwarded"] = 5,
        ["experienceRequired"] = 700,
        ["experienceAwardedForKill"] = 523.6,
        ["experienceAwardedForAssist"] = 605.1999999999999
    },
    [v1.EIGHT] = {
        ["forgePointsAwarded"] = 6,
        ["experienceRequired"] = 800,
        ["experienceAwardedForKill"] = 588,
        ["experienceAwardedForAssist"] = 615
    },
    [v1.NINE] = {
        ["forgePointsAwarded"] = 6,
        ["experienceRequired"] = 900,
        ["experienceAwardedForKill"] = 729,
        ["experienceAwardedForAssist"] = 772.5
    },
    [v1.TEN] = {
        ["forgePointsAwarded"] = 8,
        ["experienceRequired"] = 1000,
        ["experienceAwardedForKill"] = 885,
        ["experienceAwardedForAssist"] = 885
    }
}
return {
    ["MatchExperienceFactors"] = {
        ["REDUCTION_PER_LEVEL_ABOVE"] = {
            0,
            0.16,
            0.32,
            0.48,
            0.6
        },
        ["INCREASE_PER_LEVEL_BELOW"] = 0.2
    },
    ["MatchLevelMeta"] = u2,
    ["getMatchLevelMeta"] = function(p3) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        return u2[p3]
    end
}