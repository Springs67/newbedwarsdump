local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "summoned-spirit-type").SummonedSpiritType
local v5 = {}
local v6 = v4.ATTACK
local v7 = {
    ["fireDelaySec"] = 0.8,
    ["maxStrengthChargeSec"] = 0,
    ["projectileType"] = function() --[[ Name: projectileType, Line 8 ]]
        return "attack_spirit"
    end,
    ["thirdPerson"] = {
        ["fireAnimation"] = v2.WIZARD_BALL_CAST
    },
    ["launchSound"] = { v3.ATTACK_SPIRIT_THROW }
}
v5[v6] = v7
local v8 = v4.HEAL
local v9 = {
    ["fireDelaySec"] = 0.8,
    ["maxStrengthChargeSec"] = 0,
    ["projectileType"] = function() --[[ Name: projectileType, Line 19 ]]
        return "heal_spirit"
    end,
    ["thirdPerson"] = {
        ["fireAnimation"] = v2.WIZARD_BALL_CAST
    },
    ["launchSound"] = { v3.HEAL_SPIRIT_THROW }
}
v5[v8] = v9
return {
    ["SpiritSummonerProjectile"] = v5
}