local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.GuiService
local u7 = v5.Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "player-cameras-module")
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "ShiftLockController"
    end,
    ["__index"] = u9
})
u11.__index = u11
function u11.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p14)
    p14.Name = "ShiftLockController"
    p14.disablers = {}
end
function u11.KnitStart(u15) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u10
        [4] = u6
    --]]
    local u16 = u7.LocalPlayer:WaitForChild("PlayerScripts")
    if u16 ~= nil then
        u16 = u16:FindFirstChild("MouseLockController", true)
    end
    if not u16 then
        return nil
    end
    u16:GetAttributeChangedSignal("MouseLocked"):Connect(function() --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u16
        --]]
        local v17 = u8.ShiftLockToggle
        local v18 = u16:GetAttribute("MouseLocked")
        if v18 == nil then
            v18 = false
        end
        v17:fire(v18)
    end)
    u15.boundKeys = u16:WaitForChild("BoundKeys")
    if not u15.boundKeys then
        return nil
    end
    local u19 = UserSettings():GetService("UserGameSettings")
    u19:GetPropertyChangedSignal("ControlMode"):Connect(function() --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u19
            [3] = u10
        --]]
        if u15:isShiftLockAllowed() then
            local v20 = u19.ControlMode == Enum.ControlMode.MouseLockSwitch
            local v21 = u10.activeCameraController
            if v20 then
                v21:SetIsMouseLocked(true)
            else
                v21:SetIsMouseLocked(false)
            end
        else
            return nil
        end
    end)
    u8.AppClose:connect(function() --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        u6.SelectedObject = nil
    end)
    u15:bindGamepadShiftLock()
    u15:refreshBoundKeys()
end
function u11.bindGamepadShiftLock(u22) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u2
    --]]
    local v23 = u10
    local u24 = v23.activeCameraController
    local u25 = v23.activeMouseLockController
    local u26 = u25:GetIsMouseLocked()
    local function u27() --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u25
            [3] = u24
        --]]
        u26 = not u26
        if u26 then
            if u25:GetIsMouseLocked() then
                u25:OnMouseLockToggled()
            end
            u24:SetMouseLockOffset((Vector3.new()))
            u24:SetIsMouseLocked(true)
        else
            u24:SetIsMouseLocked(false)
        end
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["actionId"] = "GamepadToggleShiftLock",
        ["action"] = "ToggleShiftLock",
        ["boundFunction"] = function(_, p28, _) --[[ Name: boundFunction, Line 101 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u27
            --]]
            if p28 == Enum.UserInputState.End and u22:isShiftLockAllowed() then
                u27()
            end
        end
    })
end
function u11.refreshBoundKeys(p29) --[[ Line: 110 ]]
    if not p29.boundKeys then
        return nil
    end
    local v30 = p29:isShiftLockAllowed()
    p29.boundKeys.Value = v30 and "LeftControl,RightControl" or ""
end
function u11.registerShiftLockControlDisabler(u31, u32) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u31.disablers[u32] = true
    u31:refreshBoundKeys()
    local v33 = u4.new()
    v33:GiveTask(function() --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u32
        --]]
        return u31:unregisterShiftLockControlDisabler(u32)
    end)
    return v33
end
function u11.unregisterShiftLockControlDisabler(p34, p35) --[[ Line: 128 ]]
    p34.disablers[p35] = nil
    p34:refreshBoundKeys()
end
function u11.isShiftLockAllowed(p36) --[[ Line: 134 ]]
    local v37 = 0
    for _ in p36.disablers do
        v37 = v37 + 1
    end
    return v37 == 0
end
return {
    ["ShiftLockController"] = v3.CreateController(u11.new())
}