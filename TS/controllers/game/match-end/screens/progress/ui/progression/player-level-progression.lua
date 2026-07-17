-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "color-util").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local PlayerLevelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil;
local MatchExpProgressionCore = RuntimeLib.import(script, script.Parent, "match-exp-progression-core").MatchExpProgressionCore;

return {
    PlayerLevelProgression = v2.new(u1)(function(p3, p4) -- Line: 8
        -- upvalues: u1 (copy), MatchExpProgressionCore (copy), ColorUtil (copy), PlayerLevelUtil (copy)
        return u1.createElement(MatchExpProgressionCore, {
            Title = "PLAYER LEVEL",
            DisableSound = true,
            MatchExperienceEarned = p3.MatchExperienceEarned,
            Size = p3.Size,
            LayoutOrder = p3.LayoutOrder,
            Color = ColorUtil.hexColor(10419264),
            InitialExpProgress = PlayerLevelUtil.levelSystem:getCurrExperienceProgression(p3.MatchExperienceEarned.startingExperience, PlayerLevelUtil.levelSystem:getLevelFromExperience(p3.MatchExperienceEarned.startingExperience)),
            LevelBeforeExp = PlayerLevelUtil.levelSystem:getLevelFromExperience(p3.MatchExperienceEarned.startingExperience),
            LevelAfterExp = PlayerLevelUtil.levelSystem:getLevelFromExperience(p3.MatchExperienceEarned.startingExperience + p3.MatchExperienceEarned.totalExperienceEarned),

            GetExpForLevel = function(p5, p6) -- Line: 18, Name: GetExpForLevel
                -- upvalues: PlayerLevelUtil (ref)
                if p6 then
                    return PlayerLevelUtil.levelSystem:getTotalExperienceForLevel(p5);
                end;

                return PlayerLevelUtil.levelSystem.getExperienceForLevel(p5);
            end,

            DisableAnimation = p3.DisableAnimation
        });
    end)
};