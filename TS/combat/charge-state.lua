local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.Idle = "IDLE"
v1.IDLE = "Idle"
v2.Charging = "CHARGING"
v1.CHARGING = "Charging"
v2.Charged = "CHARGED"
v1.CHARGED = "Charged"
return {
    ["ChargeState"] = v2
}