local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.HALLOWEEN_GRAVEYARD = "halloween_graveyard"
v1.halloween_graveyard = "HALLOWEEN_GRAVEYARD"
v2.HALLOWEEN_GRAVEYARD_2023 = "halloween_graveyard_2023"
v1.halloween_graveyard_2023 = "HALLOWEEN_GRAVEYARD_2023"
v2.SKELETON_BOSS = "skeleton_boss"
v1.skeleton_boss = "SKELETON_BOSS"
v2.HALLOWEEN_BOSS = "halloween_boss"
v1.halloween_boss = "HALLOWEEN_BOSS"
v2.HALLOWEEN_OBBY = "halloween_obby"
v1.halloween_obby = "HALLOWEEN_OBBY"
v2.HALLOWEEN_MAZE = "halloween_maze"
v1.halloween_maze = "HALLOWEEN_MAZE"
v2.WINTER_MINIGAME_MOUNTAIN = "winter_minigame_mountain"
v1.winter_minigame_mountain = "WINTER_MINIGAME_MOUNTAIN"
v2.HALLOWEEN_2024_STAGE_1 = "halloween_2024_stage_1"
v1.halloween_2024_stage_1 = "HALLOWEEN_2024_STAGE_1"
v2.HALLOWEEN_2024_STAGE_2 = "halloween_2024_stage_2"
v1.halloween_2024_stage_2 = "HALLOWEEN_2024_STAGE_2"
v2.HALLOWEEN_2024_STAGE_3 = "halloween_2024_stage_3"
v1.halloween_2024_stage_3 = "HALLOWEEN_2024_STAGE_3"
v2.HALLOWEEN_2025_STAGE_2 = "halloween_2025_stage_2"
v1.halloween_2025_stage_2 = "HALLOWEEN_2025_STAGE_2"
return {
    ["SceneKey"] = v2
}