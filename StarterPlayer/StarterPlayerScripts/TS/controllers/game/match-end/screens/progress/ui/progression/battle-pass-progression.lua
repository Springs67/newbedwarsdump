local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "color-util").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u6 = v1.import(script, script.Parent, "match-exp-progression-core").MatchExpProgressionCore
return {
    ["BattlePassProgression"] = v4.new(u3)(function(p7, _) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u6
            [3] = u2
            [4] = u5
        --]]
        return u3.createElement(u6, {
            ["Title"] = "BATTLE PASS",
            ["MatchExperienceEarned"] = p7.MatchExperienceEarned,
            ["Size"] = p7.Size,
            ["LayoutOrder"] = p7.LayoutOrder,
            ["Color"] = u2.hexColor(16574016),
            ["InitialExpProgress"] = u5.getCurrExperienceProgression(p7.MatchExperienceEarned.startingExperience, u5.getLevelFromExperience(p7.MatchExperienceEarned.startingExperience)),
            ["LevelBeforeExp"] = u5.getLevelFromExperience(p7.MatchExperienceEarned.startingExperience),
            ["LevelAfterExp"] = u5.getLevelFromExperience(p7.MatchExperienceEarned.startingExperience + p7.MatchExperienceEarned.totalExperienceEarned),
            ["GetExpForLevel"] = function(p8, p9) --[[ Name: GetExpForLevel, Line 18 ]]
                --[[
                Upvalues:
                    [1] = u5
                --]]
                if p9 then
                    return u5.getTotalExperienceForLevel(p8)
                else
                    return u5.getExperienceForLevel(p8)
                end
            end,
            ["DisableAnimation"] = p7.DisableAnimation,
            ["DisableSound"] = p7.DisableAnimation
        })
    end)
}