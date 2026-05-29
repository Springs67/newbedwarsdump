local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v5 = {}
local u6 = setmetatable({}, {
    ["__index"] = v5
})
u6.BASE = 0
v5[0] = "BASE"
u6.POWER = 1
v5[1] = "POWER"
u6.SPREAD = 2
v5[2] = "SPREAD"
u6.RAPID = 3
v5[3] = "RAPID"
local v7 = {
    ["SPREAD_MULTIPLIER"] = 10,
    ["FROZEN_DURATION"] = 1,
    ["FROSTED_DURATION"] = 5,
    ["STATUS_COOLDOWN"] = 5,
    ["STACKS_TO_FROZEN"] = 5
}
local v8 = v3.SNOWBALL
v7.ammoType = v8
local u9 = {
    Vector3.new(0, -60, 0),
    Vector3.new(0, -30, 0),
    Vector3.new(0, 0, 0),
    Vector3.new(0, 30, 0),
    Vector3.new(0, 60, 0),
    Vector3.new(10, -50, 0),
    Vector3.new(10, -20, 0),
    Vector3.new(10, 0, 0),
    Vector3.new(10, 20, 0),
    Vector3.new(10, 50, 0)
}
local v10 = {}
local v11 = u6.BASE
local v12 = {
    ["fireDelaySec"] = 0.2,
    ["maxStrengthChargeSec"] = 0.3,
    ["minStrengthScalar"] = 1,
    ["projectileType"] = function() --[[ Name: projectileType, Line 40 ]]
        return "frozen_snowball"
    end,
    ["thirdPerson"] = {
        ["fireAnimation"] = v2.ROCKET_LAUNCHER_SHOT,
        ["aimAnimation"] = v2.ROCKET_LAUNCHER_IDLE,
        ["idleAnimation"] = v2.ROCKET_LAUNCHER_IDLE
    },
    ["launchSound"] = {
        v4.SNOWBALL_LAUNCHER_SINGLE_SHOT_1,
        v4.SNOWBALL_LAUNCHER_SINGLE_SHOT_2,
        v4.SNOWBALL_LAUNCHER_SINGLE_SHOT_3,
        v4.SNOWBALL_LAUNCHER_SINGLE_SHOT_4
    },
    ["ammoItemTypes"] = { v8 }
}
v10[v11] = v12
local v13 = u6.POWER
local v14 = {
    ["fireDelaySec"] = 0.1,
    ["multiShotChargeTime"] = 1,
    ["maxStrengthChargeSec"] = 0.2,
    ["minStrengthScalar"] = 1,
    ["projectileType"] = function() --[[ Name: projectileType, Line 55 ]]
        return "mega_frozen_snowball"
    end,
    ["thirdPerson"] = {
        ["fireAnimation"] = v2.ROCKET_LAUNCHER_SHOT,
        ["aimAnimation"] = v2.ROCKET_LAUNCHER_IDLE,
        ["idleAnimation"] = v2.ROCKET_LAUNCHER_IDLE
    },
    ["launchSound"] = { v4.SNOWBALL_LAUNCHER_POWER_SHOT },
    ["ammoItemTypes"] = { v8 }
}
v10[v13] = v14
local v15 = u6.SPREAD
local v16 = {
    ["fireDelaySec"] = 0,
    ["multiShotChargeTime"] = 1,
    ["maxStrengthChargeSec"] = 0.2,
    ["minStrengthScalar"] = 1,
    ["multiShot"] = true,
    ["multiShotCount"] = 10,
    ["multiShotDelay"] = 0,
    ["projectileType"] = function() --[[ Name: projectileType, Line 71 ]]
        return "spread_frozen_snowball"
    end,
    ["thirdPerson"] = {
        ["fireAnimation"] = v2.ROCKET_LAUNCHER_SHOT,
        ["aimAnimation"] = v2.ROCKET_LAUNCHER_IDLE,
        ["idleAnimation"] = v2.ROCKET_LAUNCHER_IDLE
    },
    ["ammoItemTypes"] = { v8 }
}
v10[v15] = v16
local v17 = u6.RAPID
local v18 = {
    ["fireDelaySec"] = 0.05,
    ["multiShotChargeTime"] = 1,
    ["maxStrengthChargeSec"] = 0.2,
    ["minStrengthScalar"] = 1,
    ["multiShot"] = true,
    ["multiShotCount"] = 8,
    ["multiShotDelay"] = 0.05,
    ["projectileType"] = function() --[[ Name: projectileType, Line 89 ]]
        return "rapid_frozen_snowball"
    end,
    ["thirdPerson"] = {
        ["fireAnimation"] = v2.ROCKET_LAUNCHER_SHOT,
        ["aimAnimation"] = v2.ROCKET_LAUNCHER_IDLE,
        ["idleAnimation"] = v2.ROCKET_LAUNCHER_IDLE
    },
    ["ammoItemTypes"] = { v8 }
}
v10[v17] = v18
v7.SnowballLauncherProjectile = v10
function v7.isRelevantProjectile(p19) --[[ Line: 108 ]]
    return (p19 == "frozen_snowball" or (p19 == "spread_frozen_snowball" or p19 == "mega_frozen_snowball")) and true or p19 == "rapid_frozen_snowball"
end
function v7.getNextMode(p20) --[[ Line: 112 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    if p20 == u6.RAPID then
        return u6.POWER
    end
    if p20 == u6.SPREAD then
        return u6.RAPID
    end
    local _ = p20 == u6.POWER
    return u6.SPREAD
end
function v7.getTitle(p21) --[[ Line: 127 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    return p21 == u6.POWER and "Power Shot" or (p21 == u6.SPREAD and "Spread Shot" or (p21 == u6.RAPID and "Rapid Shot" or ""))
end
function v7.getNextNum(p22) --[[ Line: 142 ]]
    return p22 == 9 and 0 or p22 + 1
end
function v7.getForce(p23, p24) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v25 = u9[p24 + 1]
    local v26 = p23:GetPivot()
    local v27 = CFrame.Angles
    local v28 = v25.X
    local v29 = math.rad(v28)
    local v30 = v25.Y
    local v31 = math.rad(v30)
    local v32 = v25.Z
    local v33 = v26:ToWorldSpace((v27(v29, v31, (math.rad(v32)))))
    return (v26.LookVector - v33.LookVector) * 10
end
return {
    ["SNOWBALL_LAUNCHER_CYCLE"] = "SnowballLauncherCycle",
    ["SnowballLauncherMode"] = u6,
    ["SnowballLauncherUtil"] = v7
}