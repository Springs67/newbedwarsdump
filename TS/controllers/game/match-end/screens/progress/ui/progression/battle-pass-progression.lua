-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "color-util").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local MatchExpProgressionCore = RuntimeLib.import(script, script.Parent, "match-exp-progression-core").MatchExpProgressionCore;

return {
    BattlePassProgression = v2.new(u1)(function(p3, p4) -- Line: 8
        -- upvalues: u1 (copy), MatchExpProgressionCore (copy), ColorUtil (copy), BattlePassUtils (copy)
        return u1.createElement(MatchExpProgressionCore, {
            Title = "BATTLE PASS",
            MatchExperienceEarned = p3.MatchExperienceEarned,
            Size = p3.Size,
            LayoutOrder = p3.LayoutOrder,
            Color = ColorUtil.hexColor(16574016),
            InitialExpProgress = BattlePassUtils.getCurrExperienceProgression(p3.MatchExperienceEarned.startingExperience, BattlePassUtils.getLevelFromExperience(p3.MatchExperienceEarned.startingExperience)),
            LevelBeforeExp = BattlePassUtils.getLevelFromExperience(p3.MatchExperienceEarned.startingExperience),
            LevelAfterExp = BattlePassUtils.getLevelFromExperience(p3.MatchExperienceEarned.startingExperience + p3.MatchExperienceEarned.totalExperienceEarned),

            GetExpForLevel = function(p5, p6) -- Line: 18, Name: GetExpForLevel
                -- upvalues: BattlePassUtils (ref)
                if p6 then
                    return BattlePassUtils.getTotalExperienceForLevel(p5);
                end;

                return BattlePassUtils.getExperienceForLevel(p5);
            end,

            DisableAnimation = p3.DisableAnimation,
            DisableSound = p3.DisableAnimation
        });
    end)
};