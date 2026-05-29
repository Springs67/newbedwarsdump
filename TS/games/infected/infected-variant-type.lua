local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.TANK = "tank"
v1.tank = "TANK"
v2.RUSH = "rush"
v1.rush = "RUSH"
v2.DISRUPTOR = "disruptor"
v1.disruptor = "DISRUPTOR"
v2.PROWLER = "prowler"
v1.prowler = "PROWLER"
return {
    ["InfectedVariantType"] = v2
}