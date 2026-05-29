local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.XMAS_2024 = "xmas_2024"
v1.xmas_2024 = "XMAS_2024"
v2.LNY_2025 = "lny_2025"
v1.lny_2025 = "LNY_2025"
v2.FOUR_YEAR_ANNIVERSARY = "four_year_anniversary"
v1.four_year_anniversary = "FOUR_YEAR_ANNIVERSARY"
v2.SUMMER_2025 = "summer_2025"
v1.summer_2025 = "SUMMER_2025"
v2.HW_2025 = "hw_2025"
v1.hw_2025 = "HW_2025"
v2.XMAS_2025 = "xmas_2025"
v1.xmas_2025 = "XMAS_2025"
return {
    ["CheckInSystem"] = v2
}