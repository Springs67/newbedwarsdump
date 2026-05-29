local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.LOADING = 0
v1[0] = "LOADING"
v2.BANNING = 1
v1[1] = "BANNING"
v2.BANNING_TRANSITION = 2
v1[2] = "BANNING_TRANSITION"
v2.KIT_SELECT = 3
v1[3] = "KIT_SELECT"
v2.KIT_SELECT_POST = 4
v1[4] = "KIT_SELECT_POST"
v2.START_MATCH = 5
v1[5] = "START_MATCH"
return {
    ["MatchDraftPhase"] = v2
}