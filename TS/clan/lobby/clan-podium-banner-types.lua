local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.DEFAULT = 0
v1[0] = "DEFAULT"
v2.ARCANE = 1
v1[1] = "ARCANE"
v2.BLOODFANG = 2
v1[2] = "BLOODFANG"
v2.VERDANTGUARD = 3
v1[3] = "VERDANTGUARD"
v2.ROYALCROWN = 4
v1[4] = "ROYALCROWN"
return {
    ["CLAN_PODIUM_BANNER_ICON_TAG"] = "clan-podium-banner-icon",
    ["CLAN_PODIUM_BANNER_ICON_IMAGE_ATTRIBUTE"] = "clan-podium-banner-icon-image",
    ["CLAN_PODIUM_NAMEPLATE_TAG"] = "clan-podium-nameplate",
    ["CLAN_PODIUM_DISPLAY_NAME_ATTRIBUTE"] = "clan-podium-name",
    ["CLAN_PODIUM_DISPLAY_TAG_ATTRIBUTE"] = "clan-podium-tag",
    ["CLAN_PODIUM_TAG_CHAT_COLOR_ATTRIBUTE"] = "clan-podium-tag-chat-color",
    ["ClanPodiumBannerType"] = v2
}