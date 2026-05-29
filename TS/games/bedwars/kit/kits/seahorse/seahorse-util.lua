local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.RunService
local u5 = v3.Workspace
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "seahorse", "seahorse-level").SeahorseLevel
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "SeahorseUtil"
    end
})
u7.__index = u7
function u7.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(_) --[[ Line: 20 ]] end
function u7.getSeahorseDataObject(_, p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return u7:getSeahorseDataFolder():FindFirstChild(p10.Name .. "-Seahorse")
end
function u7.getSeahorseDataFolder(p11) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u5
    --]]
    if not p11.seahorseDataFolder then
        if u4:IsServer() then
            p11.seahorseDataFolder = u2("Folder", {
                ["Name"] = "SeahorseData",
                ["Parent"] = u5
            })
        else
            p11.seahorseDataFolder = u5:WaitForChild("SeahorseData")
        end
    end
    return p11.seahorseDataFolder
end
function u7.getSeahorseLevelFromStackCount(p12, p13) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    return p13 < p12.levelUpStacksRequired[u6.LEVEL_1] and 0 or (p13 < p12.levelUpStacksRequired[u6.LEVEL_2] and 1 or (p13 < p12.levelUpStacksRequired[u6.LEVEL_3] and 2 or 3))
end
function u7.getSeahorseStackCountFromLevel(p14, p15) --[[ Line: 51 ]]
    return p14.levelUpStacksRequired[p15]
end
function u7.getStacksNeededToLevel(p16, p17) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v18 = p16:getSeahorseLevelFromStackCount(p17) + 1
    local v19 = u6[v18]
    return (v19 == "" or not v19) and 0 or p16:getSeahorseStackCountFromLevel(v18) - p17
end
function u7.getHitDamage(_, p20) --[[ Line: 63 ]]
    local v21 = p20 / 100
    return math.pow(v21, 0.5) * 0.8 + 3
end
function u7.getHealAmount(_, p22, p23) --[[ Line: 66 ]]
    local v24 = p22 / 100
    return (math.pow(v24, 0.5) * 0.9 + 2) * (p23 and 0.7 or 1) * 0.75
end
u7.MAX_SEAHORSE_LEVEL = u6.LEVEL_3
u7.BEAM_DURATION_SEC = 1.5
u7.TIME_BETWEEN_BASIC_SHOT_SEC = 0.5
u7.BASIC_SHOT_TRAVEL_DURATION_SEC = 0.2
u7.BASE_DEATH_PENALTY_STACK_REDUCTION = 40
u7.DEATH_PENALTY_STACK_REDUCTION_RATIO = 0.15
u7.levelUpStacksRequired = {
    [u6.LEVEL_0] = 0,
    [u6.LEVEL_1] = 215,
    [u6.LEVEL_2] = 625,
    [u6.LEVEL_3] = 1240
}
return {
    ["SeahorseUtil"] = u7
}