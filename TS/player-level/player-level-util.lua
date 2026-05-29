local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "level-system").LevelSystem
local v5 = {}
local u6 = v3:IsStudio() and 25 or 1
v5.STARTING_LEVEL = u6
v5.MAX_LEVEL = 200
v5.CAP_LEVEL_EXP = 50
v5.BP_EXTRA_DAILY = {
    ["levelReq"] = 25,
    ["numExtraMissions"] = 1
}
v5.BEGINNER_LEVEL = 2
v5.GAMES_TO_REACH_BEGINNER_LEVEL = 2
v5.DAILY_XP_BRACKETS = {
    {
        ["xpBracketCap"] = 5000,
        ["xpMultiplier"] = 2.5
    },
    {
        ["xpBracketCap"] = 52000,
        ["xpMultiplier"] = 1
    }
}
v5.levelSystem = v4.new(u6, 200, function(p7) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    return p7 <= u6 and 0 or 2000 + (p7 >= 50 and 50 or p7 - 1) * 1000
end)
local u8 = v2.WHITE
v5.DEFAULT_LEVEL_COLOR = u8
local u9 = {
    {
        ["levelCutoff"] = 0,
        ["color"] = v2.WHITE
    },
    {
        ["levelCutoff"] = 10,
        ["color"] = Color3.fromRGB(255, 251, 159)
    },
    {
        ["levelCutoff"] = 20,
        ["color"] = Color3.fromRGB(169, 255, 132)
    },
    {
        ["levelCutoff"] = 30,
        ["color"] = Color3.fromRGB(239, 152, 255)
    },
    {
        ["levelCutoff"] = 40,
        ["color"] = Color3.fromRGB(132, 222, 255)
    },
    {
        ["levelCutoff"] = 50,
        ["color"] = Color3.fromRGB(255, 133, 133)
    },
    {
        ["levelCutoff"] = 100,
        ["color"] = Color3.fromRGB(255, 148, 54)
    },
    {
        ["levelCutoff"] = 150,
        ["color"] = Color3.fromRGB(57, 255, 102)
    },
    {
        ["levelCutoff"] = 200,
        ["color"] = Color3.fromRGB(0, 255, 255)
    },
    {
        ["levelCutoff"] = 1000,
        ["color"] = Color3.fromRGB(255, 255, 255),
        ["gradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 2, 234)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 226, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(69, 255, 0)) })
    }
}
v5.PlayerLevelRank = u9
table.sort(u9, function(p10, p11) --[[ Line: 76 ]]
    return p10.levelCutoff > p11.levelCutoff
end)
function v5.getLevelColor(p12) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
    --]]
    for _, v13 in u9 do
        if v13.levelCutoff <= p12 then
            return v13.color
        end
    end
    return u8
end
function v5.getLevelMeta(p14) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    for _, v15 in u9 do
        if v15.levelCutoff <= p14 then
            return v15
        end
    end
end
return {
    ["PlayerLevelUtil"] = v5
}