local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.Players
local u5 = v3.Workspace
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "CameraController"
    end,
    ["__index"] = u6
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p10)
    p10.Name = "CameraController"
    p10.cameraSubjectMap = {}
end
function u7.KnitStart(p11) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.KnitStart(p11)
end
function u7.registerCameraSubject(p12, p13, p14, p15) --[[ Line: 30 ]]
    p12.cameraSubjectMap[p13] = {
        ["priority"] = p14,
        ["subject"] = p15
    }
    p12:setCameraSubject()
end
function u7.deregisterCameraSubject(p16, p17) --[[ Line: 40 ]]
    p16.cameraSubjectMap[p17] = nil
    p16:setCameraSubject()
end
function u7.setZoom(_, p18) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v19 = u4.LocalPlayer.CameraMaxZoomDistance
    local v20 = u4.LocalPlayer.CameraMinZoomDistance
    u4.LocalPlayer.CameraMinZoomDistance = p18
    u4.LocalPlayer.CameraMaxZoomDistance = p18
    u4.LocalPlayer.CameraMaxZoomDistance = v19
    u4.LocalPlayer.CameraMinZoomDistance = v20
end
function u7.setMaxZoom(_, p21) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.LocalPlayer.CameraMaxZoomDistance = p21
end
function u7.setMinZoom(_, p22) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.LocalPlayer.CameraMinZoomDistance = p22
end
function u7.setCameraSubject(p23) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
    --]]
    local v24 = -1
    local v25 = nil
    local v26 = v25
    local v27 = v24
    for v28, v29 in p23.cameraSubjectMap do
        if v27 < v29.priority then
            v24 = v29.priority
            v25 = v28
            v26 = v25
            v27 = v24
        end
    end
    if v26 then
        local v30 = p23.cameraSubjectMap[v26]
        if v30 ~= nil then
            v30 = v30.subject
        end
        u5.CurrentCamera.CameraSubject = v30
    else
        local v31 = u4.LocalPlayer.Character
        if v31 ~= nil then
            v31 = v31:FindFirstChild("Humanoid")
        end
        u5.CurrentCamera.CameraSubject = v31
    end
end
v2.CreateController(u7.new())
return nil