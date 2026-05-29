local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v4 = {}
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteDisplayType.IMAGE_DEFAULT
local v6 = {
    ["soundsOnBegin"] = {
        {
            ["sound"] = v3.EMOTE_OPEN
        }
    },
    ["soundsOnEnd"] = {
        {
            ["sound"] = v3.EMOTE_CLOSE
        }
    },
    ["animation"] = {
        ["looped"] = false,
        ["type"] = v2.RAVEN_THROW
    }
}
v4[v5] = v6
return {
    ["EmoteDisplayMeta"] = v4
}