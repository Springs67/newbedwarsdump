local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local v4 = v3.Players
local u5 = v3.Workspace
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "draw")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid")
local u8 = v4.LocalPlayer
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "LevitatorComponent"
    end
})
u9.__index = u9
function u9.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12, p13) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u8
        [4] = u5
        [5] = u2
    --]]
    p12.levitator = p13
    p12.debugRay = u6.ray(Ray.new())
    p12.levitationPid = u7.new(0, 1000, 100, 7, 0)
    local v14 = p13.Parent
    if v14 ~= nil then
        v14 = v14.Parent
    end
    if v14 ~= u8.Character then
        return nil
    end
    local v15 = RaycastParams.new()
    v15.FilterDescendantsInstances = { u5:FindFirstChild("Map") }
    v15.FilterType = Enum.RaycastFilterType.Whitelist
    p12.raycastParams = v15
    p12.vectorForce = u2("VectorForce", {
        ["Parent"] = p13,
        ["Attachment0"] = u2("Attachment", {
            ["Parent"] = p13
        })
    })
    p12.levitationPid:Debug("LevitationPid", u5)
end
function u9.SteppedUpdate(p16, p17) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    local v18 = p16.levitator.Position + Vector3.new(0, 0.1, 0)
    local v19 = Ray.new(v18, Vector3.new(0, -4, 0))
    u6.updateRay(p16.debugRay, v19)
    local v20 = u5:Raycast(v18, Vector3.new(0, -4, 0), p16.raycastParams)
    local v21
    if v20 then
        local v22 = v20.Position
        v21 = p16.levitationPid:Calculate(p17, v22.Y + 4, v18.Y)
    else
        v21 = 0
    end
    p16.vectorForce.Force = Vector3.new(0, v21, 0)
end
function u9.Destroy(_) --[[ Line: 69 ]] end
return u9