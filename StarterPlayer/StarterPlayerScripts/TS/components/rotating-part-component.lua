local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "attribute-config")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").Attribute
local u5 = v4.new("RotationSpeed", v2.optional(v2.number))
local u6 = v4.new("RotationDirection", v2.optional(v2.string))
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "RotatingPartComponent"
    end
})
u7.__index = u7
function u7.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10, p11) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u6
    --]]
    p10.instance = p11
    p10.lastHeartbeat = os.clock()
    if not p11:IsA("BasePart") then
        error("RotatingObjects must be of class BasePart")
    end
    local v12 = { u5, u6 }
    p10.config = u3.new(p11, v12)
end
function u7.HeartbeatUpdate(p13) --[[ Line: 33 ]]
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
        local v19 = p13.instance
        local v20 = p13.instance:GetPivot()
        local v21 = CFrame.Angles
        local v22 = v17 * v15
        v19:PivotTo(v20 * v21(math.rad(v22), 0, 0))
        return
    elseif v18 == "y" then
        local v23 = p13.instance
        local v24 = p13.instance:GetPivot()
        local v25 = CFrame.Angles
        local v26 = v17 * v15
        v23:PivotTo(v24 * v25(0, math.rad(v26), 0))
        return
    elseif v18 == "z" then
        local v27 = p13.instance
        local v28 = p13.instance:GetPivot()
        local v29 = CFrame.Angles
        local v30 = v17 * v15
        v27:PivotTo(v28 * v29(0, 0, (math.rad(v30))))
    else
        local v31 = p13.instance
        local v32 = p13.instance:GetPivot()
        local v33 = CFrame.Angles
        local v34 = v17 * v15
        v31:PivotTo(v32 * v33(0, 0, (math.rad(v34))))
    end
end
function u7.Destroy(_) --[[ Line: 78 ]] end
u7.Tag = "RotatingPart"
return u7