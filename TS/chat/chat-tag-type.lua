local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.CLAN = 0
v1[0] = "CLAN"
v2.RANK = 1
v1[1] = "RANK"
return {
    ["ChatTagType"] = v2
}