local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.COMMON = "common"
v2.common = "COMMON"
v3.RARE = "rare"
v2.rare = "RARE"
v3.EPIC = "epic"
v2.epic = "EPIC"
v3.LEGENDARY = "legendary"
v2.legendary = "LEGENDARY"
local v4 = {
    [v3.COMMON] = {
        ["text"] = "Common",
        ["frame"] = "rbxassetid://100900435604207",
        ["background"] = "rbxassetid://102618152071384",
        ["sound"] = v1.ACHIEVEMENT_UNLOCK_COMMON
    },
    [v3.RARE] = {
        ["text"] = "Rare",
        ["frame"] = "rbxassetid://100900435604207",
        ["background"] = "rbxassetid://102618152071384",
        ["gradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 247, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(105, 166, 255)) }),
        ["sound"] = v1.ACHIEVEMENT_UNLOCK_RARE
    },
    [v3.EPIC] = {
        ["text"] = "Epic",
        ["frame"] = "rbxassetid://107143545737460",
        ["background"] = "rbxassetid://89598818697347",
        ["gradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 99, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(173, 48, 255)) }),
        ["sound"] = v1.ACHIEVEMENT_UNLOCK_EPIC
    },
    [v3.LEGENDARY] = {
        ["text"] = "Legendary",
        ["frame"] = "rbxassetid://112452531922317",
        ["background"] = "rbxassetid://77166501953845",
        ["gradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 204, 64)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 148, 23)) }),
        ["sound"] = v1.ACHIEVEMENT_UNLOCK_LEGENDARY
    }
}
return {
    ["AchievementRank"] = v3,
    ["AchievementRankMeta"] = v4
}