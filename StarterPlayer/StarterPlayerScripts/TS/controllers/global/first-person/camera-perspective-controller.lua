local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.ContextActionService
local u5 = v3.Players
local u6 = v3.RunService
local u7 = v3.Workspace
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "CameraPerspectiveController"
    end,
    ["__index"] = u10
})
u12.__index = u12
function u12.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u8
    --]]
    u10.constructor(p15)
    p15.Name = "CameraPerspectiveController"
    p15.PerspectiveChanged = u8.new()
    p15.cachedCameraPerspective = 1
end
function u12.KnitStart(u16) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u11
        [4] = u5
        [5] = u2
        [6] = u4
    --]]
    u6:BindToRenderStep("perspective-check", Enum.RenderPriority.Camera.Value, function(_) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        local v17 = u16.cachedCameraPerspective
        u16.cachedCameraPerspective = u16:calculateCameraPerspective()
        if v17 ~= u16.cachedCameraPerspective then
            u16.PerspectiveChanged:Fire(u16.cachedCameraPerspective)
        end
    end)
    u9.SettingChanged:connect(function(p18) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u16
            [3] = u5
            [4] = u2
            [5] = u4
        --]]
        if p18.setting ~= u11.LOCK_CAMERA then
            return nil
        end
        local v19 = p18.value
        if v19 == 0 or (v19 ~= v19 or not v19) then
            u5.LocalPlayer.CameraMode = Enum.CameraMode.Classic
            u2.Controllers.MobileShiftLockController:blockShiftLock(false)
            u4:UnbindAction("DisableMouseWheel")
            u4:UnbindAction("DisableBaseCameraKeyboardZoom")
        else
            if u16.cachedCameraPerspective == 0 then
                u5.LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
                u2.Controllers.MobileShiftLockController:blockShiftLock(true)
                return
            end
            if u16.cachedCameraPerspective == 1 then
                u4:BindAction("DisableMouseWheel", function(_, _, _) --[[ Line: 54 ]]
                    return Enum.ContextActionResult.Sink
                end, false, Enum.UserInputType.MouseWheel)
                u4:BindActionAtPriority("DisableBaseCameraKeyboardZoom", function() --[[ Line: 58 ]]
                    return Enum.ContextActionResult.Sink
                end, false, 2001, Enum.KeyCode.I, Enum.KeyCode.O)
                return
            end
        end
    end)
end
function u12.calculateCameraPerspective(p20) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return u7.CurrentCamera and ((u7.CurrentCamera.CFrame.Position - u7.CurrentCamera.Focus.Position).Magnitude <= 1 and 0 or 1) or p20.cachedCameraPerspective
end
function u12.getCameraPerspective(p21) --[[ Line: 83 ]]
    return p21.cachedCameraPerspective
end
return {
    ["CameraPerspectiveController"] = u2.CreateController(u12.new())
}