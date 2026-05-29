local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.TRIM_1 = "trim_1"
v1.trim_1 = "TRIM_1"
v2.TRIM_2 = "trim_2"
v1.trim_2 = "TRIM_2"
v2.TRIM_3 = "trim_3"
v1.trim_3 = "TRIM_3"
v2.TRIM_4 = "trim_4"
v1.trim_4 = "TRIM_4"
v2.TRIM_5 = "trim_5"
v1.trim_5 = "TRIM_5"
v2.TRIM_6 = "trim_6"
v1.trim_6 = "TRIM_6"
v2.TRIM_7 = "trim_7"
v1.trim_7 = "TRIM_7"
v2.TRIM_8 = "trim_8"
v1.trim_8 = "TRIM_8"
v2.TRIM_9 = "trim_9"
v1.trim_9 = "TRIM_9"
v2.TRIM_10 = "trim_10"
v1.trim_10 = "TRIM_10"
v2.TRIM_11 = "trim_11"
v1.trim_11 = "TRIM_11"
v2.TRIM_12 = "trim_12"
v1.trim_12 = "TRIM_12"
local v3 = {}
local v4 = setmetatable({}, {
    ["__index"] = v3
})
v4.ALL_RANDOM = 0
v3[0] = "ALL_RANDOM"
v4.BEGINNER = 1
v3[1] = "BEGINNER"
v4.ELEMENTAL = 2
v3[2] = "ELEMENTAL"
v4.SPIRIT_VS_VOID = 3
v3[3] = "SPIRIT_VS_VOID"
v4.HALLOWEEN = 4
v3[4] = "HALLOWEEN"
return {
    ["ArmorTrimType"] = v2,
    ["ArmorTrimPackType"] = v4
}