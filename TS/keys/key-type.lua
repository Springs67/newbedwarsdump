local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.HALLOWEEN_LTM = "halloween_2022_ltm"
v1.halloween_2022_ltm = "HALLOWEEN_LTM"
return {
    ["KeyType"] = v2
}