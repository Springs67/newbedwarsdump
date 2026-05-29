local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.EGG_HUNT_TITLE_1 = "egg_hunt_title"
v1.egg_hunt_title = "EGG_HUNT_TITLE_1"
v2.EGG_HUNT_LUCKY_CRATE = "egg_hunt_lucky_crate"
v1.egg_hunt_lucky_crate = "EGG_HUNT_LUCKY_CRATE"
v2.EGG_HUNT_BP_XP_MULTIPLIER1 = "egg_hunt_bp_xp_multiplier1"
v1.egg_hunt_bp_xp_multiplier1 = "EGG_HUNT_BP_XP_MULTIPLIER1"
v2.EGG_HUNT_EMOTE_2 = "egg_hunt_emote_2"
v1.egg_hunt_emote_2 = "EGG_HUNT_EMOTE_2"
v2.EGG_HUNT_BP_XP_MULTIPLIER2 = "egg_hunt_bp_xp_multiplier2"
v1.egg_hunt_bp_xp_multiplier2 = "EGG_HUNT_BP_XP_MULTIPLIER2"
v2.BEDWARS_EGG_HUNT_BADGE = "egg_hunt_badge"
v1.egg_hunt_badge = "BEDWARS_EGG_HUNT_BADGE"
v2.EGG_HUNT_DIAMOND_LUCKY_CRATE = "egg_hunt_diamond_lucky_crate"
v1.egg_hunt_diamond_lucky_crate = "EGG_HUNT_DIAMOND_LUCKY_CRATE"
v2.EGG_HUNT_TITLE_2 = "egg_hunt_title_2"
v1.egg_hunt_title_2 = "EGG_HUNT_TITLE_2"
return {
    ["EggHuntMilestoneReward"] = v2
}