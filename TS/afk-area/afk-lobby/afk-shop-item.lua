local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.AFK_CRATE = "afk_crate"
v1.afk_crate = "AFK_CRATE"
v2.MINI_POTION = "mini_potion"
v1.mini_potion = "MINI_POTION"
v2.BIG_POTION = "big_potion"
v1.big_potion = "BIG_POTION"
v2.MINI_COPTER = "mini_copter"
v1.mini_copter = "MINI_COPTER"
v2.PILLOW = "pillow"
v1.pillow = "PILLOW"
v2.KING_OF_AFK_TITLE = "king_of_afk_title"
v1.king_of_afk_title = "KING_OF_AFK_TITLE"
v2.YAWN_EMOTE = "yawn_emote"
v1.yawn_emote = "YAWN_EMOTE"
v2.PILLOW_SMASH_EMOTE = "pillow_smash_emote"
v1.pillow_smash_emote = "PILLOW_SMASH_EMOTE"
v2.BRB_SIGN = "brb_sign"
v1.brb_sign = "BRB_SIGN"
v2.AFK_EMOTE = "afk_emote"
v1.afk_emote = "AFK_EMOTE"
v2.SLEEP_EMOTE = "sleep_potion"
v1.sleep_potion = "SLEEP_EMOTE"
v2.BRB_EMOTE = "brb_emote"
v1.brb_emote = "BRB_EMOTE"
v2.PILLOW_KILL_EFFECT = "pillow_kill_effect"
v1.pillow_kill_effect = "PILLOW_KILL_EFFECT"
v2.PILLOW_BED_BREAK_EFFECT = "pillow_bed_break_effect"
v1.pillow_bed_break_effect = "PILLOW_BED_BREAK_EFFECT"
return {
    ["AfkShopItem"] = v2
}