local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.LEVEL_UP_CRATE = "level_up_crate"
v1.level_up_crate = "LEVEL_UP_CRATE"
v2.BED_COIN_200 = "bed_coin_200"
v1.bed_coin_200 = "BED_COIN_200"
v2.BED_COIN_300 = "bed_coin_300"
v1.bed_coin_300 = "BED_COIN_300"
v2.VOID_SKYBOX = "void_skybox"
v1.void_skybox = "VOID_SKYBOX"
v2.S10_LOBBY_MUSIC = "s10_lobby_music"
v1.s10_lobby_music = "S10_LOBBY_MUSIC"
v2.VOID_MUSIC = "void_music"
v1.void_music = "VOID_MUSIC"
v2.GOLD_CLAN_BORDER = "gold_clan_border"
v1.gold_clan_border = "GOLD_CLAN_BORDER"
v2.SILVER_CLAN_BORDER = "silver_clan_border"
v1.silver_clan_border = "SILVER_CLAN_BORDER"
return {
    ["ClanShopItem"] = v2
}