local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.HOVER = 0
v1[0] = "HOVER"
v2.SELECT = 1
v1[1] = "SELECT"
return {
    ["MatchDraftSelectorOption"] = v2
}