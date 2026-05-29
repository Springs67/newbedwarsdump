local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.MathExtras
local u5 = v2.StatusModifier
local u6 = v2.WatchCharacter
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.ContentProvider
local u12 = v10.ContextActionService
local u13 = v10.Players
local u14 = v10.TweenService
local u15 = v10.UserInputService
local u16 = v10.Workspace
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sprint", "sprint-constants").SprintConstants
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "SprintController"
    end,
    ["__index"] = u19
})
u23.__index = u23
function u23.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(u26) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u17
        [3] = u8
        [4] = u5
        [5] = u4
        [6] = u22
    --]]
    u19.constructor(u26)
    u26.Name = "SprintController"
    u26.blockSprintStatusSignal = u17.new()
    u26.sprintMaid = u8.new()
    u26.sprinting = false
    u26.attemptingSprint = false
    u26.moveSpeedMultiplier = 1
    u26.blockSprint = false
    u26.maxSpeed = nil
    u26.immediateStop = false
    u26.shiftLockEnabled = false
    u26.movementStatusModifier = u5.new(function(p27) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u26
            [3] = u22
        --]]
        local v28 = false
        local v29 = 0
        local v30 = false
        for _, v31 in p27 do
            if v31.moveSpeedMultiplier ~= nil then
                if v31.moveSpeedMultiplier == 0 then
                    v30 = true
                else
                    v29 = v29 + u4:getPercentFromMultiplier(v31.moveSpeedMultiplier)
                end
            end
            if v31.blockSprint ~= nil then
                v28 = v28 or v31.blockSprint
            end
        end
        u26.blockSprint = v28
        u26.blockSprintStatusSignal:Fire(u26.blockSprint)
        u26.moveSpeedMultiplier = v30 and 0 or u4:getMultiplierFromPercent(v29)
        for _, v32 in p27 do
            local v33 = v32.constantSpeedMultiplier
            if v33 ~= nil then
                u26.moveSpeedMultiplier = v33
            end
        end
        if u26.blockSprint then
            u26:stopSprinting(false)
        elseif u26.attemptingSprint and not u26.sprinting then
            u26:startSprinting()
        end
        if u26.sprinting then
            u26:setSpeed(u22.RUN_SPEED)
        else
            u26:setSpeed(u22.WALK_SPEED)
        end
    end)
end
function u23.KnitStart(u34) --[[ Line: 94 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u7
        [3] = u21
        [4] = u18
        [5] = u22
        [6] = u15
        [7] = u12
        [8] = u6
        [9] = u16
        [10] = u3
        [11] = u11
        [12] = u9
        [13] = u20
    --]]
    u13.LocalPlayer.CharacterAdded:Connect(function() --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        u34.movementStatusModifier:clear()
    end)
    u34:setBindingForSprint(false)
    task.spawn(function() --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u21
            [3] = u34
        --]]
        u7.Controllers.SettingsController:waitForSettings()
        u34.shiftLockEnabled = u7.Controllers.SettingsController:getSetting(u21.PC_SHIFT_LOCK) == true
        if u34.shiftLockEnabled then
            u34:setBindingForSprint(true)
        end
    end)
    u13.LocalPlayer.CharacterAdded:Connect(function(p35) --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        local v36 = p35:GetAttribute("Locked")
        if v36 == 0 or (v36 ~= v36 or (v36 == "" or not v36)) then
            u34.movementStatusModifier:clear()
        end
    end)
    u18.SettingChanged:connect(function(p37) --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u34
        --]]
        local v38 = p37.setting == u21.PC_SHIFT_LOCK
        if v38 then
            local v39 = p37.value
            v38 = typeof(v39) == "boolean"
        end
        if v38 then
            local v40 = p37.value
            u34.shiftLockEnabled = v40
            u34:stopSprinting(false)
            if v40 then
                u34:setBindingForSprint(true)
                return
            end
            u34:setBindingForSprint(false)
        end
    end)
    u34:setSpeed(u22.WALK_SPEED)
    if u15.GamepadEnabled then
        u12:BindAction("sprint-gamepad", function(_, p41, _) --[[ Line: 134 ]]
            --[[
            Upvalues:
                [1] = u34
            --]]
            if p41 == Enum.UserInputState.Begin then
                if u34.sprinting then
                    u34:stopSprinting(true)
                    return
                end
                u34:startSprinting()
            end
        end, false, Enum.KeyCode.ButtonL3)
        u12:UnbindAction("id")
    end
    u6(function(p42, _) --[[ Line: 145 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u34
        --]]
        if p42 == u13.LocalPlayer then
            if u34.sprinting then
                u34:startSprinting()
                return
            end
            u34:stopSprinting(false)
        end
    end)
    u7.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(_) --[[ Line: 154 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u7
            [3] = u34
            [4] = u22
        --]]
        u16.CurrentCamera.FieldOfView = u7.Controllers.FovController:getFOV() * (not u34.sprinting and 1 or u22.RUN_FOV_MULT)
    end)
    task.spawn(function() --[[ Line: 157 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u11
            [3] = u9
            [4] = u20
            [5] = u34
        --]]
        if u3.isMobileControls() then
            u11:PreloadAsync({ u9("ImageLabel", {
                    ["Image"] = u20.SPRINT_ON_MOBILE
                }) })
            u34:startSprinting()
        end
    end)
end
function u23.setBindingForSprint(u43, p44) --[[ Line: 166 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u12
    --]]
    if p44 and not u3.isMobileControls() then
        u12:UnbindAction("sprint")
        u12:BindActionAtPriority("sprint-pc-lock", function(_, p45, _) --[[ Line: 169 ]]
            --[[
            Upvalues:
                [1] = u43
            --]]
            if p45 == Enum.UserInputState.Begin then
                if u43.sprinting then
                    u43:stopSprinting(true)
                    return
                end
                u43:startSprinting()
            end
        end, false, 1, Enum.KeyCode.LeftShift)
    else
        u12:UnbindAction("sprint-pc-lock")
        u12:BindActionAtPriority("sprint", function(_, p46, _) --[[ Line: 180 ]]
            --[[
            Upvalues:
                [1] = u43
            --]]
            if p46 == Enum.UserInputState.Begin then
                u43:startSprinting()
            elseif p46 == Enum.UserInputState.End then
                u43:stopSprinting(true)
            end
        end, false, 1, Enum.KeyCode.LeftShift)
    end
end
function u23.getMovementStatusModifier(p47) --[[ Line: 189 ]]
    return p47.movementStatusModifier
end
function u23.setSpeed(p48, p49) --[[ Line: 192 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v50 = u13.LocalPlayer.Character and u13.LocalPlayer.Character:WaitForChild("Humanoid", 5)
    if v50 then
        local v51 = p49 * p48.moveSpeedMultiplier
        local v52 = p48.maxSpeed
        if v52 ~= 0 and (v52 == v52 and v52) then
            local v53 = p48.maxSpeed
            v51 = math.min(v53, v51)
        end
        v50.WalkSpeed = v51
    end
end
function u23.isSprinting(p54) --[[ Line: 202 ]]
    return p54.sprinting
end
function u23.startSprinting(u55) --[[ Line: 205 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u13
        [3] = u22
        [4] = u7
    --]]
    local v56 = u16:GetAttribute("FreecamEnabled")
    if v56 ~= 0 and (v56 == v56 and (v56 ~= "" and v56)) then
        return nil
    end
    if u55.blockSprint then
        return nil
    end
    u55.sprinting = true
    u55.attemptingSprint = true
    u13.LocalPlayer:SetAttribute("Sprinting", true)
    u55:setSpeed(u22.RUN_SPEED)
    u55:tweenCameraFOV(u7.Controllers.FovController:getFOV() * u22.RUN_FOV_MULT, 0.1)
    u55.sprintMaid:GiveTask(function() --[[ Line: 219 ]]
        --[[
        Upvalues:
            [1] = u55
            [2] = u22
            [3] = u7
        --]]
        u55:setSpeed(u22.WALK_SPEED)
        local v57 = u55:tweenCameraFOV(u7.Controllers.FovController:getFOV(), 0.1)
        if u55.immediateStop then
            v57:DoCleaning()
        end
    end)
end
function u23.stopSprinting(p58, p59, p60) --[[ Line: 227 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    if p60 == nil then
        p60 = false
    end
    u13.LocalPlayer:SetAttribute("Sprinting", false)
    if not p58.sprinting then
        return nil
    end
    if p60 then
        p58.immediateStop = true
    end
    p58.sprintMaid:DoCleaning()
    p58.immediateStop = false
    p58.sprinting = false
    if p59 then
        p58.attemptingSprint = false
    end
end
function u23.tweenCameraFOV(_, p61, p62) --[[ Line: 245 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u14
        [3] = u16
    --]]
    local v63 = u8.new()
    local u64 = u14:Create(u16.CurrentCamera, TweenInfo.new(p62, Enum.EasingStyle.Linear), {
        ["FieldOfView"] = p61
    })
    u64:Play()
    v63:GiveTask(function() --[[ Line: 251 ]]
        --[[
        Upvalues:
            [1] = u64
        --]]
        u64:Cancel()
        u64:Destroy()
    end)
    return v63
end
u7.CreateController(u23.new())
return nil