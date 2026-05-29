local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.DEFAULT = "default"
v1.default = "DEFAULT"
v2.VOID_SKYBOX = "void_skybox"
v1.void_skybox = "VOID_SKYBOX"
local v3 = {}
local v4 = setmetatable({}, {
    ["__index"] = v3
})
v4.DEFAULT = "default"
v3.default = "DEFAULT"
v4.S10_LOBBY_MUSIC = "s10_lobby_music"
v3.s10_lobby_music = "S10_LOBBY_MUSIC"
v4.VOID_MUSIC = "void_music"
v3.void_music = "VOID_MUSIC"
return {
    ["ClanHqSkyboxType"] = v2,
    ["ClanHqBackgroundMusicType"] = v4
}