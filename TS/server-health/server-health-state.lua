local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.HEALTHY = "HEALTHY"
v1.HEALTHY = "HEALTHY"
v2.LAGGING = "LAGGING"
v1.LAGGING = "LAGGING"
v2.CRITICAL = "CRITICAL"
v1.CRITICAL = "CRITICAL"
local v3 = {
    [v2.HEALTHY] = {
        ["threshold"] = 60,
        ["multiplier"] = 1,
        ["color"] = Color3.fromRGB(64, 235, 20)
    },
    [v2.LAGGING] = {
        ["threshold"] = 20,
        ["multiplier"] = 0.75,
        ["color"] = Color3.fromRGB(255, 186, 0)
    },
    [v2.CRITICAL] = {
        ["threshold"] = 10,
        ["multiplier"] = 0.25,
        ["color"] = Color3.fromRGB(227, 18, 18)
    }
}
return {
    ["ServerHealthState"] = v2,
    ["ServerHealthMeta"] = v3
}