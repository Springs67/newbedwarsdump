local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.BED_ALARM = "bed_alarm"
v1.bed_alarm = "BED_ALARM"
v2.BED_SHIELD = "bed_shield"
v1.bed_shield = "BED_SHIELD"
return {
    ["BedTeamUpgrade"] = v2
}