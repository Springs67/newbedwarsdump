local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.SWITCHING_TRACKS = "switching_tracks"
v2.switching_tracks = "SWITCHING_TRACKS"
v3.GOING_TO_SILENCE = "going_to_silence"
v2.going_to_silence = "GOING_TO_SILENCE"
local v4 = {
    ["EARLY_GAME_PLAYLIST"] = {
        {
            ["soundId"] = v1.MATCH_MUSIC_EARLY
        }
    },
    ["LATE_GAME_PLAYLIST"] = {
        {
            ["soundId"] = v1.MATCH_MUSIC_LATE
        }
    }
}
return {
    ["GameMusicAction"] = v3,
    ["GameMusicConfig"] = v4
}