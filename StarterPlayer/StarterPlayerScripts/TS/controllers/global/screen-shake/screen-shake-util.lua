local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ConstantManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.RunService
local u7 = v5.Workspace
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u9 = v2.registerConstants(script, {
    ["Duration"] = 0.25,
    ["Magnitude"] = 0.4,
    ["TotalCycles"] = 5
})
local v10 = {}
local u11 = nil
local function u33(u12, u13) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
        [3] = u8
        [4] = u3
        [5] = u11
        [6] = u6
        [7] = u7
    --]]
    local u14 = u4.new()
    local u15 = 0
    local v16
    if u13 == nil then
        v16 = u13
    else
        v16 = u13.duration
    end
    if v16 == nil then
        v16 = u9.Duration
    end
    local u19 = u8(v16, u3, function(p17) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u15
            [3] = u11
        --]]
        local v18 = u13
        if v18 ~= nil then
            v18 = v18.cycles
        end
        u15 = u11(p17, v18)
    end, 0, 1)
    u14:GiveTask(function() --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        return u19:Cancel()
    end)
    local v20 = math.random
    local u21 = "screen-shake" .. tostring(v20())
    u6:BindToRenderStep(u21, Enum.RenderPriority.Camera.Value + 3, function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u12
            [3] = u13
            [4] = u15
            [5] = u9
        --]]
        if not u7.CurrentCamera then
            return nil
        end
        local v22 = u7.CurrentCamera.CFrame
        local v23 = u12.X
        local v24 = u12.Y
        local v25 = Vector3.new(v23, v24, 0).Unit
        local v26 = u13
        if v26 ~= nil then
            v26 = v26.zMagnitude
        end
        local v27 = v26 == nil and 0 or v26
        local v28 = Vector3.new(0, 0, v27)
        local v29 = u15
        local v30 = u13
        if v30 ~= nil then
            v30 = v30.magnitude
        end
        if v30 == nil then
            v30 = u9.Magnitude
        end
        local v31 = CFrame.new(v22 * ((v25 + v28) * (v29 * v30)))
        local v32 = u7.CurrentCamera.CFrame - u7.CurrentCamera.CFrame.Position
        u7.CurrentCamera.CFrame = v31 * v32
    end)
    u14:GiveTask(function() --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u21
        --]]
        return u6:UnbindFromRenderStep(u21)
    end)
    task.spawn(function() --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u14
        --]]
        u19:Wait()
        u14:DoCleaning()
    end)
    return u14
end
v10.shakeScreenDirection = u33
u11 = function(p34, p35) --[[ Name: getShakeMagnitude, Line 82 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if p35 == nil then
        p35 = u9.TotalCycles
    end
    local v36 = p34 * 3.141592653589793 * p35
    return math.sin(v36) / math.pow(v36, 0.5)
end
v10.getShakeMagnitude = u11
function v10.shake(p37, p38, p39) --[[ Line: 90 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u33
    --]]
    if not u7.CurrentCamera then
        return nil
    end
    local v40 = u7.CurrentCamera:WorldToScreenPoint(p37)
    local v41 = u7.CurrentCamera:WorldToScreenPoint(p37 + p38.Unit)
    return u33(Vector2.new(v41.X - v40.X, -(v41.Y - v40.Y)), p39)
end
return {
    ["ScreenShakeUtil"] = v10
}