local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local v4 = {}
local v5 = setmetatable({}, {
    ["__index"] = v4
})
v5.IDLE = 0
v4[0] = "IDLE"
v5.CHANGING_PLAYER = 1
v4[1] = "CHANGING_PLAYER"
local v6 = {}
local v7 = setmetatable({}, {
    ["__index"] = v6
})
v7.HEALING = 0
v6[0] = "HEALING"
v7.VOID = 1
v6[1] = "VOID"
v7.STICKY = 2
v6[2] = "STICKY"
v7.FROSTY = 3
v6[3] = "FROSTY"
local v8 = {
    [v7.HEALING] = {
        ["name"] = "Blessed Slime",
        ["image"] = "rbxassetid://15295059428",
        ["minBuffPercent"] = 0.05,
        ["maxBuffPercent"] = 0.1,
        ["description"] = "Restores teammate\'s missing health every " .. tostring(2.5) .. " seconds.",
        ["color"] = Color3.fromRGB(232, 214, 56),
        ["okSound"] = v2.SLIME_OK_1,
        ["alertSound"] = v2.SLIME_ALERT_1,
        ["directSound"] = v2.SLIME_DIRECT_1,
        ["buffDescription"] = "Percent missing health restored every " .. tostring(2.5) .. " seconds.",
        ["statusEffect"] = v3.SLIME_BUFF_HEALING
    },
    [v7.VOID] = {
        ["name"] = "Void Slime",
        ["description"] = "Boosts damage of the teammate it is following.",
        ["image"] = "rbxassetid://15295057154",
        ["minBuffPercent"] = 0.05,
        ["maxBuffPercent"] = 0.15,
        ["buffDescription"] = "Percent damage boost",
        ["color"] = Color3.fromRGB(204, 102, 219),
        ["okSound"] = v2.SLIME_OK_2,
        ["alertSound"] = v2.SLIME_ALERT_2,
        ["directSound"] = v2.SLIME_DIRECT_2,
        ["statusEffect"] = v3.SLIME_BUFF_VOID
    },
    [v7.STICKY] = {
        ["name"] = "Sticky Slime",
        ["description"] = "Attracts nearby resources with a chance to duplicate them.",
        ["image"] = "rbxassetid://15295064061",
        ["minBuffPercent"] = 0.04,
        ["maxBuffPercent"] = 0.25,
        ["buffDescription"] = "Chance to duplicate",
        ["color"] = Color3.fromRGB(56, 209, 79),
        ["okSound"] = v2.SLIME_OK_3,
        ["alertSound"] = v2.SLIME_ALERT_3,
        ["directSound"] = v2.SLIME_DIRECT_3,
        ["statusEffect"] = v3.SLIME_BUFF_STICKY
    },
    [v7.FROSTY] = {
        ["name"] = "Frosty Slime",
        ["description"] = "Slows the movement speed of enemies hit by its teammate.",
        ["image"] = "rbxassetid://15295050177",
        ["minBuffPercent"] = 0.1,
        ["maxBuffPercent"] = 0.3,
        ["buffDescription"] = "Enemy movement speed reduction",
        ["color"] = Color3.fromRGB(97, 204, 232),
        ["okSound"] = v2.SLIME_OK_4,
        ["alertSound"] = v2.SLIME_ALERT_4,
        ["directSound"] = v2.SLIME_DIRECT_4,
        ["statusEffect"] = v3.SLIME_BUFF_FROSTY
    }
}
return {
    ["SLIME_CHANGE_PLAYER_DURATION"] = 1,
    ["HEAL_SLIME_INTERVAL_SECONDS"] = 2.5,
    ["SlimeState"] = v5,
    ["SlimeType"] = v7,
    ["SlimeMeta"] = v8
}