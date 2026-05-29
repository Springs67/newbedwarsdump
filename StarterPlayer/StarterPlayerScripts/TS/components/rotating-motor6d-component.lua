local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "attribute-config")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").Attribute
local u5 = v4.new("RotationSpeed", v2.optional(v2.number))
local u6 = v4.new("RotationDirection", v2.optional(v2.string))
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "RotatingMotor6DComponent"
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
function u7.constructor(p10, p11) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u6
    --]]
    p10.instance = p11
    p10.lastHeartbeat = os.clock()
    if not p11:IsA("Motor6D") then
        error("RotatingObjects must be of class Motor6D")
    end
    local v12 = { u5, u6 }
    p10.config = u3.new(p11, v12)
end
function u7.HeartbeatUpdate(p13) --[[ Line: 28 ]]
    local v14 = os.clock()
    local v15 = v14 - p13.lastHeartbeat
    p13.lastHeartbeat = v14
    local v16 = p13.config.Values.RotationSpeed
    local v17 = v16 == nil and 10 or v16
    local v18 = p13.config.Values.RotationDirection
    if v18 ~= nil then
        v18 = string.lower(v18)
    end
    if v18 == "x" then
        local v19 = p13.instance.C0
        local v20 = CFrame.Angles
        local v21 = v17 * v15
        local v22 = v20(math.rad(v21), 0, 0)
        p13.instance.C0 = v19 * v22
        return
    elseif v18 == "y" then
        local v23 = p13.instance.C0
        local v24 = CFrame.Angles
        local v25 = v17 * v15
        local v26 = v24(0, math.rad(v25), 0)
        p13.instance.C0 = v23 * v26
        return
    elseif v18 == "z" then
        local v27 = p13.instance.C0
        local v28 = CFrame.Angles
        local v29 = v17 * v15
        local v30 = v28(0, 0, (math.rad(v29)))
        p13.instance.C0 = v27 * v30
    else
        local v31 = p13.instance.C0
        local v32 = CFrame.Angles
        local v33 = v17 * v15
        local v34 = v32(0, 0, (math.rad(v33)))
        p13.instance.C0 = v31 * v34
    end
end
function u7.Destroy(_) --[[ Line: 68 ]] end
u7.Tag = "RotatingMotor6D"
return u7