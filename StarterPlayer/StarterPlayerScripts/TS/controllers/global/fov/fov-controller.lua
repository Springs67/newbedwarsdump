local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.MathExtras
local u5 = v2.StatusModifier
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.RunService
local u11 = v8.TweenService
local u12 = v8.Workspace
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "FovController"
    end,
    ["__index"] = u13
})
u15.__index = u15
function u15.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(u18) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u7
        [3] = u5
        [4] = u4
        [5] = u14
    --]]
    u13.constructor(u18)
    u18.Name = "FovController"
    u18.fovMultiplier = 1
    u18.fov = 80
    u18.activeFOVTween = nil
    u18.fovOverrides = {}
    u18.funnyFOVMaid = u7.new()
    u18.isInFunnyMode = false
    u18.fovModifier = u5.new(function(p19) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u4
            [3] = u14
        --]]
        local v20 = 0
        for _, v21 in p19 do
            local v22 = v21.modifierMax
            if v22 ~= 0 and (v22 == v22 and v22) then
                v22 = v21.modifierMax <= u18:getFOV() / u18:getBaseFOV()
            end
            if (v22 == 0 or (v22 ~= v22 or not v22)) and v21.fovMultiplier ~= nil then
                v20 = v20 + u4:getPercentFromMultiplier(v21.fovMultiplier)
            end
        end
        u18.fovMultiplier = u4:getMultiplierFromPercent(v20)
        u18:setFOV(u14:getState().Settings.fov)
    end)
end
function u15.KnitStart(u23) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u9
        [3] = u6
        [4] = u14
        [5] = u12
        [6] = u10
    --]]
    u13.KnitStart(u23)
    u9.LocalPlayer.CharacterAdded:Connect(function() --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23.fovModifier:clear()
    end)
    u6.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(_) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u14
        --]]
        u23:setFOV(u14:getState().Settings.fov)
    end)
    u14.changed:connect(function(p24, p25) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u12
            [3] = u10
        --]]
        if p24.Settings.fov ~= p25.Settings.fov then
            u23:setFOV(p24.Settings.fov)
            if p24.Settings.fov >= 360 and not u23.isInFunnyMode then
                local u26 = u12.CurrentCamera
                if u26 then
                    u23.isInFunnyMode = true
                    u23.funnyFOVMaid:GiveTask(u10.RenderStepped:Connect(function() --[[ Line: 77 ]]
                        --[[
                        Upvalues:
                            [1] = u26
                        --]]
                        u26.CFrame = u26.CFrame * CFrame.new(0, 0, 0, 0.5, 0, 0, 0, 0.5, 0, 0, 0, 1)
                    end))
                    return
                end
            else
                u23.funnyFOVMaid:DoCleaning()
                u23.isInFunnyMode = false
            end
        end
    end)
end
function u15.addModifier(p27, p28) --[[ Line: 92 ]]
    return p27.fovModifier:addModifier(p28)
end
function u15.getFOVStatusModifier(p29) --[[ Line: 95 ]]
    return p29.fovModifier
end
function u15.getFOV(p30) --[[ Line: 98 ]]
    return p30.fov
end
function u15.getBaseFOV(_) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u14
    --]]
    local v31 = u6.Controllers.CameraPerspectiveController:getCameraPerspective()
    if u3.isMobileControls() then
        if v31 == 0 then
            return u14:getState().Settings.fov
        else
            return u14:getState().Settings.fov - 10
        end
    elseif v31 == 0 then
        return u14:getState().Settings.fov
    else
        return u14:getState().Settings.fov - 10
    end
end
function u15.setFOV(p32, p33) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u12
    --]]
    local v34 = u6.Controllers.CameraPerspectiveController:getCameraPerspective()
    if u3.isMobileControls() then
        if v34 ~= 0 then
            p33 = p33 - 10
        end
    elseif v34 == 0 then
        p33 = p33 + 0
    else
        p33 = p33 - 10
    end
    u12.CurrentCamera.FieldOfView = p33 * p32.fovMultiplier
    p32.fov = p33 * p32.fovMultiplier
end
function u15.playUIOpenFOVTween(u35) --[[ Line: 133 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u11
    --]]
    local v36 = u11:Create(u12.CurrentCamera, TweenInfo.new(0.22, Enum.EasingStyle.Cubic), {
        ["FieldOfView"] = u35:getBaseFOV() + 10
    })
    u35.activeFOVTween = v36
    if next(u35.fovOverrides) ~= nil then
        return v36
    end
    v36:Play()
    local u37 = nil
    local u38 = v36.Completed:Once(function() --[[ Line: 144 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u37
        --]]
        u35.activeFOVTween = nil
        u37:Disconnect()
    end)
    u37 = v36.Destroying:Once(function() --[[ Line: 148 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u38
        --]]
        u35.activeFOVTween = nil
        u38:Disconnect()
    end)
    return v36
end
function u15.playUICloseFOVTween(u39) --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u11
    --]]
    local v40 = u11:Create(u12.CurrentCamera, TweenInfo.new(0.22, Enum.EasingStyle.Cubic), {
        ["FieldOfView"] = u39:getBaseFOV()
    })
    u39.activeFOVTween = v40
    if next(u39.fovOverrides) ~= nil then
        return v40
    end
    v40:Play()
    local u41 = nil
    local u42 = v40.Completed:Once(function() --[[ Line: 165 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u41
        --]]
        u39.activeFOVTween = nil
        u41:Disconnect()
    end)
    u41 = v40.Destroying:Once(function() --[[ Line: 169 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u42
        --]]
        u39.activeFOVTween = nil
        u42:Disconnect()
    end)
    return v40
end
function u15.setFOVOverride(p43, p44, p45, p46) --[[ Line: 175 ]]
    p43.fovOverrides[p44] = {
        ["fov"] = p45,
        ["priority"] = p46
    }
end
function u15.removeFOVOverride(p47, p48) --[[ Line: 184 ]]
    p47.fovOverrides[p48] = nil
end
function u15.disableActiveTween(p49) --[[ Line: 189 ]]
    local v50 = p49.activeFOVTween
    if v50 ~= nil then
        v50:Destroy()
    end
end
u6.CreateController(u15.new())
return nil