local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "weighted-select").WeightedSelect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "rotation", "lucky-block-spawn-type").LuckyBlockTheme
return {
    ["LuckyBlockSpawnDefinitions"] = {
        {
            ["rotating"] = true,
            ["chanceToOccurAtAll"] = 80,
            ["luckyBlockTheme"] = v4.RAINBOW,
            ["minimumMatchTimeToSpawn"] = v3:IsStudio() and 0 or 180,
            ["chanceToOccurRandomly"] = v3:IsStudio() and 100 or 80,
            ["spawnCooldown"] = v3:IsStudio() and 15 or 60,
            ["spawnEvents"] = v2.new({
                {
                    ["luckyBlockType"] = "rainbow_lucky_block",
                    ["weight"] = 100
                }
            })
        },
        {
            ["rotating"] = true,
            ["chanceToOccurAtAll"] = 80,
            ["luckyBlockTheme"] = v4.GLITCHED,
            ["minimumMatchTimeToSpawn"] = v3:IsStudio() and 0 or 180,
            ["chanceToOccurRandomly"] = v3:IsStudio() and 100 or 80,
            ["spawnCooldown"] = v3:IsStudio() and 15 or 60,
            ["spawnEvents"] = v2.new({
                {
                    ["luckyBlockType"] = "glitched_lucky_block",
                    ["weight"] = 100
                }
            })
        },
        {
            ["disabled"] = true,
            ["chanceToOccurAtAll"] = 80,
            ["seasonal"] = true,
            ["luckyBlockTheme"] = v4.HALLOWEEN,
            ["minimumMatchTimeToSpawn"] = v3:IsStudio() and 0 or 180,
            ["chanceToOccurRandomly"] = v3:IsStudio() and 100 or 80,
            ["spawnCooldown"] = v3:IsStudio() and 15 or 60,
            ["spawnEvents"] = v2.new({
                {
                    ["luckyBlockType"] = "halloween_lucky_block",
                    ["weight"] = 50
                }
            })
        },
        {
            ["rotating"] = true,
            ["chanceToOccurAtAll"] = 100,
            ["luckyBlockTheme"] = v4.FOOD,
            ["minimumMatchTimeToSpawn"] = v3:IsStudio() and 0 or 180,
            ["chanceToOccurRandomly"] = v3:IsStudio() and 100 or 80,
            ["spawnCooldown"] = v3:IsStudio() and 15 or 45,
            ["spawnEvents"] = v2.new({
                {
                    ["luckyBlockType"] = "food_lucky_block",
                    ["weight"] = 100
                }
            })
        },
        {
            ["rotating"] = true,
            ["chanceToOccurAtAll"] = 100,
            ["luckyBlockTheme"] = v4.COSMIC,
            ["minimumMatchTimeToSpawn"] = v3:IsStudio() and 0 or 180,
            ["chanceToOccurRandomly"] = v3:IsStudio() and 100 or 80,
            ["spawnCooldown"] = v3:IsStudio() and 15 or 45,
            ["spawnEvents"] = v2.new({
                {
                    ["luckyBlockType"] = "cosmic_lucky_block",
                    ["weight"] = 100
                }
            })
        },
        {
            ["rotating"] = true,
            ["chanceToOccurAtAll"] = 100,
            ["luckyBlockTheme"] = v4.FORGE,
            ["minimumMatchTimeToSpawn"] = v3:IsStudio() and 0 or 180,
            ["chanceToOccurRandomly"] = v3:IsStudio() and 100 or 80,
            ["spawnCooldown"] = v3:IsStudio() and 15 or 45,
            ["spawnEvents"] = v2.new({
                {
                    ["luckyBlockType"] = "forge_lucky_block",
                    ["weight"] = 100
                }
            })
        },
        {
            ["rotating"] = true,
            ["chanceToOccurAtAll"] = 80,
            ["luckyBlockTheme"] = v4.MAGICAL_HERO_VILLAIN,
            ["minimumMatchTimeToSpawn"] = v3:IsStudio() and 0 or 180,
            ["chanceToOccurRandomly"] = v3:IsStudio() and 100 or 80,
            ["spawnCooldown"] = v3:IsStudio() and 15 or 45,
            ["spawnEvents"] = v2.new({
                {
                    ["luckyBlockType"] = "magical_hero_lucky_block",
                    ["weight"] = 100
                }
            })
        },
        {
            ["rotating"] = true,
            ["chanceToOccurAtAll"] = 100,
            ["luckyBlockTheme"] = v4.FLYING,
            ["minimumMatchTimeToSpawn"] = v3:IsStudio() and 0 or 180,
            ["chanceToOccurRandomly"] = v3:IsStudio() and 100 or 80,
            ["spawnCooldown"] = v3:IsStudio() and 5 or 45,
            ["spawnEvents"] = v2.new({
                {
                    ["luckyBlockType"] = "flying_lucky_block",
                    ["weight"] = 50
                },
                {
                    ["luckyBlockType"] = "flying_lucky_block_flock",
                    ["weight"] = 30
                }
            })
        },
        {
            ["rotating"] = true,
            ["chanceToOccurAtAll"] = 100,
            ["seasonal"] = true,
            ["luckyBlockTheme"] = v4.NEW_YEARS,
            ["minimumMatchTimeToSpawn"] = v3:IsStudio() and 0 or 90,
            ["chanceToOccurRandomly"] = v3:IsStudio() and 100 or 60,
            ["spawnCooldown"] = v3:IsStudio() and 5 or 30,
            ["spawnEvents"] = v2.new({
                {
                    ["luckyBlockType"] = "new_years_lucky_block",
                    ["weight"] = 50
                },
                {
                    ["luckyBlockType"] = "new_years_lucky_block",
                    ["weight"] = 30
                }
            })
        },
        {
            ["minimumMatchTimeToSpawn"] = 360,
            ["chanceToOccurRandomly"] = 50,
            ["spawnCooldown"] = 180,
            ["chanceToOccurAtAll"] = 80,
            ["luckyBlockTheme"] = v4.PURPLE,
            ["spawnEvents"] = v2.new({
                {
                    ["luckyBlockType"] = "purple_lucky_block",
                    ["weight"] = 100
                }
            })
        },
        {
            ["minimumMatchTimeToSpawn"] = 240,
            ["chanceToOccurRandomly"] = 50,
            ["spawnCooldown"] = 150,
            ["chanceToOccurAtAll"] = 100,
            ["luckyBlockTheme"] = v4.HUGE,
            ["spawnEvents"] = v2.new({
                {
                    ["luckyBlockType"] = "huge_lucky_block",
                    ["weight"] = 100
                }
            })
        }
    }
}