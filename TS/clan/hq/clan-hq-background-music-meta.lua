local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-types").ClanHqBackgroundMusicType
local u4 = {
    [v3.DEFAULT] = {
        ["title"] = "Lobby Music (Default)",
        ["soundId"] = v2.LOBBY_MUSIC
    },
    [v3.S10_LOBBY_MUSIC] = {
        ["title"] = "Season X Lobby Music",
        ["soundId"] = v2.LOBBY_MUSIC_HEAVEN
    },
    [v3.VOID_MUSIC] = {
        ["title"] = "Void Music",
        ["soundId"] = v2.VOID_THEME_SONG
    }
}
return {
    ["getClanHqBackgroundMusicMeta"] = function(p5) --[[ Name: getClanHqBackgroundMusicMeta, Line 19 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        return u4[p5]
    end,
    ["ClanHqBackgroundMusicMeta"] = u4
}