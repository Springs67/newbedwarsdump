local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.Division_III = 3
v1[3] = "Division_III"
v2.Division_II = 2
v1[2] = "Division_II"
v2.Division_I = 1
v1[1] = "Division_I"
return {
    ["ClanWarDivision"] = v2
}