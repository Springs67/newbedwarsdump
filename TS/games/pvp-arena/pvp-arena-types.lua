local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.NONE = "none"
v1.none = "NONE"
v2.INTERMISSON = "intermission"
v1.intermission = "INTERMISSON"
v2.INTERMISSION_AUGMENT_SELECTION = "intermission_augment_selection"
v1.intermission_augment_selection = "INTERMISSION_AUGMENT_SELECTION"
v2.MATCH = "match"
v1.match = "MATCH"
local v3 = {}
local v4 = setmetatable({}, {
    ["__index"] = v3
})
v4.PRE = "pre"
v3.pre = "PRE"
v4.INTERMISSION = "intermission"
v3.intermission = "INTERMISSION"
v4.IN_PROGRESS = "in_progress"
v3.in_progress = "IN_PROGRESS"
v4.POST = "post"
v3.post = "POST"
return {
    ["PvPArenaStageType"] = v2,
    ["PvPArenaGameState"] = v4
}