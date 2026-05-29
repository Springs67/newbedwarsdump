local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "attribute-config")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").Attribute.new("RotationSpeed", v2.number)
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "RotatingObjectComponent"
    end
})
u5.__index = u5
function u5.new(...) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v6 = u5
    local v7 = setmetatable({}, v6)
    return v7:constructor(...) or v7
end
function u5.constructor(p8, p9) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    p8.instance = p9
    p8.lastHeartbeat = os.clock()
    if not p9:IsA("Model") then
        error("RotatingObjects must be of class Model")
    end
    local v10 = { u4 }
    p8.config = u3.new(p9, v10)
end
function u5.HeartbeatUpdate(p11) --[[ Line: 27 ]]
    if p11.instance.PrimaryPart ~= nil then
        local v12 = os.clock()
        local v13 = v12 - p11.lastHeartbeat
        p11.lastHeartbeat = v12
        local v14 = p11.instance
        local v15 = p11.instance:GetPrimaryPartCFrame()
        local v16 = CFrame.Angles
        local v17 = p11.config.Values.RotationSpeed * v13
        v14:PivotTo(v15 * v16(0, math.rad(v17), 0))
    end
end
function u5.Destroy(_) --[[ Line: 39 ]] end
u5.Tag = "RotatingObject"
return u5