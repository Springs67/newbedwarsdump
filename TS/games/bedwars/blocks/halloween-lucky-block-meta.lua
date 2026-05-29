local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.STAGE_1 = 0
v1[0] = "STAGE_1"
v2.STAGE_2 = 1
v1[1] = "STAGE_2"
v2.STAGE_3 = 2
v1[2] = "STAGE_3"
return {
    ["HLBStage1Duration"] = 10,
    ["HLBStage2Duration"] = 10,
    ["HLBStage3Duration"] = 10,
    ["HLBBounceDuration"] = 1.5,
    ["HLBGrowthStage"] = v2
}