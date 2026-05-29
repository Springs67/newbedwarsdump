local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.SUMMER2025_RIDDLE_1 = "summer2025_riddle_1"
v1.summer2025_riddle_1 = "SUMMER2025_RIDDLE_1"
v2.SUMMER2025_RIDDLE_2 = "summer2025_riddle_2"
v1.summer2025_riddle_2 = "SUMMER2025_RIDDLE_2"
v2.SUMMER2025_RIDDLE_3 = "summer2025_riddle_3"
v1.summer2025_riddle_3 = "SUMMER2025_RIDDLE_3"
v2.SUMMER2025_RIDDLE_4 = "summer2025_riddle_4"
v1.summer2025_riddle_4 = "SUMMER2025_RIDDLE_4"
return {
    ["Riddle"] = v2
}