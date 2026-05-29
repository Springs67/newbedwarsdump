local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.RunService
local u13 = v10.SoundService
local u14 = v10.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v16 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "movement", "event", "move-mount-event")
local u17 = v16.InputActionType
local u18 = v16.MoveMountDirection
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "movement", "move-mount-ui").MoveMountUI
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "mount", "mount-flight-controls").MountFlightControls
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "vehicle", "vehicle-client").VehicleClient
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "player-control-module")
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid")
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 39 ]]
        return "FlyingCarpetPilot"
    end,
    ["__index"] = u21
})
u26.__index = u26
function u26.new(...) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(u29, u30) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u7
        [3] = u24
        [4] = u14
        [5] = u11
        [6] = u8
        [7] = u13
        [8] = u12
        [9] = u22
        [10] = u25
        [11] = u20
        [12] = u5
        [13] = u4
        [14] = u23
        [15] = u15
        [16] = u18
        [17] = u17
        [18] = u3
        [19] = u6
        [20] = u9
        [21] = u19
    --]]
    u21.constructor(u29, u30)
    u29.maid = u7.new()
    u29.pitchPid = u24.new(-5, 5, 0.09, 0, 0.03)
    u29.yawPid = u24.new(-40, 40, 0.022, 0, 0)
    u29.rollPid = u24.new(-10, 10, 0.1, 0, 0)
    u29.counterDriftPid = u24.new(-100, 100, 35, 0, 1)
    u29.levitationPid = u24.new(-200, 400, 20, 30, 0)
    u29.movePid = u24.new(-30, 30, 4, 0.6, 0)
    u29.heightGoal = 0
    u29.holdingUp = false
    u29.holdingDown = false
    u29.entryTime = u14:GetServerTimeNow()
    u29.enginePowerScale = 1
    u29.defaultCameraMaxZoomDistance = 14
    u29.defaultCameraMinZoomDistance = 0.5
    u29.maid = u7.new()
    local v31 = u11.LocalPlayer.Character
    if v31 then
        if v31:FindFirstChild("Humanoid") then
            local u32 = u30:FindFirstChild("Root")
            if u32 then
                local u33 = u14.CurrentCamera
                if u33 then
                    u29.defaultCameraMaxZoomDistance = 14
                    u29.defaultCameraMinZoomDistance = 0
                    u33.CameraSubject = u32
                    u11.LocalPlayer.CameraMinZoomDistance = 14
                    u11.LocalPlayer.CameraMaxZoomDistance = 32
                    u29.maid:GiveTask(function() --[[ Line: 86 ]]
                        --[[
                        Upvalues:
                            [1] = u11
                            [2] = u33
                            [3] = u29
                        --]]
                        local v34 = u11.LocalPlayer.Character
                        if v34 ~= nil then
                            v34 = v34:FindFirstChild("Humanoid")
                        end
                        u33.CameraSubject = v34
                        u11.LocalPlayer.CameraMinZoomDistance = u29.defaultCameraMinZoomDistance
                        u11.LocalPlayer.CameraMaxZoomDistance = u29.defaultCameraMaxZoomDistance
                    end)
                end
                local u35 = u8("Attachment", {
                    ["Parent"] = u32
                })
                u29.maid:GiveTask(function() --[[ Line: 100 ]]
                    --[[
                    Upvalues:
                        [1] = u35
                    --]]
                    u35:Destroy()
                end)
                u29.angularVelocity = u8("AngularVelocity", {
                    ["MaxTorque"] = (1 / 0),
                    ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
                    ["Attachment0"] = u35,
                    ["Parent"] = u32
                })
                u29.maid:GiveTask(function() --[[ Line: 109 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                    --]]
                    u29.angularVelocity:Destroy()
                end)
                u29.worldSpaceForce = u8("VectorForce", {
                    ["Name"] = "WorldSpaceForce",
                    ["ApplyAtCenterOfMass"] = true,
                    ["RelativeTo"] = Enum.ActuatorRelativeTo.World,
                    ["Attachment0"] = u35,
                    ["Parent"] = u30
                })
                u29.maid:GiveTask(function() --[[ Line: 119 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                    --]]
                    u29.worldSpaceForce:Destroy()
                end)
                u29.localSpaceForce = u8("VectorForce", {
                    ["Name"] = "LocalSpaceForce",
                    ["ApplyAtCenterOfMass"] = true,
                    ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
                    ["Attachment0"] = u35,
                    ["Parent"] = u32
                })
                u29.maid:GiveTask(function() --[[ Line: 129 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                    --]]
                    u29.localSpaceForce:Destroy()
                end)
                u29.levitationPid:Debug("LevitationPID", u14)
                u29.counterDriftPid:Debug("CounterDriftPID", u14)
                u29.pitchPid:Debug("PitchPID", u14)
                u29.rollPid:Debug("RollPID", u14)
                u29.movePid:Debug("MovePID", u14)
                u29.yawPid:Debug("YawPID", u14)
                u29.maid:GiveTask(u29.levitationPid)
                u29.maid:GiveTask(u29.counterDriftPid)
                u29.maid:GiveTask(u29.pitchPid)
                u29.maid:GiveTask(u29.rollPid)
                u29.maid:GiveTask(u29.movePid)
                u29.maid:GiveTask(u29.yawPid)
                u29.windSound = u8("Sound", {
                    ["Name"] = "WindSound",
                    ["Looped"] = true,
                    ["Playing"] = true,
                    ["Volume"] = 0.25,
                    ["SoundId"] = "rbxassetid://" .. tostring(7910583431),
                    ["Parent"] = u13
                })
                u29.heightGoal = u32.Position.Y + 10
                u29.maid:GiveTask(u12.Stepped:Connect(function(_, p36) --[[ Line: 153 ]]
                    --[[
                    Upvalues:
                        [1] = u32
                        [2] = u22
                        [3] = u29
                        [4] = u25
                        [5] = u30
                        [6] = u14
                    --]]
                    local v37 = u32.CFrame
                    local v38 = v37.Position
                    local v39 = v37:VectorToObjectSpace(u32.AssemblyLinearVelocity)
                    local v40, _, v41 = v37:ToOrientation()
                    local v42 = u22:GetMoveVector()
                    local v43 = v37.LookVector
                    local v44 = v43.Z
                    local v45 = v43.X
                    local v46 = math.atan2(v44, v45)
                    local v47 = u32.AssemblyLinearVelocity * Vector3.new(1.5, 0, 1.5)
                    local v48 = v37:VectorToObjectSpace(v47).X
                    local v49 = -math.sign(v48)
                    local v50 = v47.Magnitude * v49
                    local v51 = CFrame
                    local v52 = CFrame.new(-v42.X, 0, 0)
                    local v53 = v51.lookAt(v38, (v37 * v52).Position)
                    local v54 = os.clock()
                    local v55 = math.sin(v54) * 0.3 + 0
                    local v56 = u29.holdingUp and not u29.holdingDown and 50 or (u29.holdingDown and not u29.holdingUp and -50 or 0)
                    local v57 = u29
                    local v58
                    if u25.isGameServer() then
                        local v59 = u29.heightGoal + v56 * p36
                        v58 = math.clamp(v59, -50, 250)
                    else
                        v58 = u29.heightGoal + v56 * p36
                    end
                    v57.heightGoal = v58
                    local v60 = u29.levitationPid:Calculate(p36, u29.heightGoal + v55, v38.Y)
                    local v61 = v39.Z
                    local v62 = u29.counterDriftPid:Calculate(p36, 0, v61)
                    local v63 = 5 * -v42.Z
                    local v64 = u29.pitchPid:Calculate(p36, v63, (math.deg(v41)))
                    local v65 = v43:Dot(v53.LookVector)
                    local v66 = math.acos(v65)
                    local v67 = v43:Cross(v53.LookVector).Y
                    local v68 = math.clamp(v67, -1, 1)
                    local v69 = v66 * -math.round(v68)
                    local v70 = v69 ~= v69 and 0 or v69
                    local v71 = v42.Magnitude > 0.05
                    local v72
                    if v71 then
                        local v73 = v46 + v70
                        local v74 = math.deg(v73)
                        local v75 = u29.yawPid
                        local v76 = v42.X
                        if math.abs(v76) <= 0.1 then
                            v74 = math.deg(v46)
                        end
                        v72 = v75:Calculate(p36, v74, (math.deg(v46)))
                    else
                        v72 = 0
                    end
                    local v77 = 5 * (not v71 and 0 or -1 + 2 * ((v70 - -3.141592653589793) / 6.283185307179586))
                    local v78 = u29.rollPid:Calculate(p36, v77, (math.deg(v40)))
                    local v79 = -63 + 133 * ((-v42.Z - -0.9) / 1.9)
                    local v80 = u29.movePid:Calculate(p36, v79, v50)
                    local v81 = 0 + 0.5 * ((math.abs(v50) - 0) / 70)
                    if u29.windSound then
                        u29.windSound.Volume = v81
                    end
                    if u29.holdingUp and not u29.holdingDown then
                        local v82 = u29
                        v82.enginePowerScale = v82.enginePowerScale + p36 * 0.96
                    elseif u29.holdingDown and not u29.holdingDown then
                        local v83 = u29
                        v83.enginePowerScale = v83.enginePowerScale - p36 * 0.96
                    else
                        local v84 = u29
                        v84.enginePowerScale = v84.enginePowerScale - p36 * 0.9
                    end
                    local v85 = u29
                    local v86 = u29.enginePowerScale
                    v85.enginePowerScale = math.clamp(v86, 0.95, 1)
                    u29:setEnginePowerRatio(u29.enginePowerScale)
                    if u30:GetAttribute("Dead") == true then
                        u29.worldSpaceForce.Force = Vector3.new(0, 0, 0)
                        u29.localSpaceForce.Force = Vector3.new(0, 0, 0)
                        u29.angularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
                        u29.maid:DoCleaning()
                    else
                        local v87 = u32.AssemblyMass
                        local v88 = (u14:GetServerTimeNow() - u29.entryTime) / 1
                        local v89 = math.clamp(v88, 0, 1)
                        local v90 = u29.worldSpaceForce
                        local v91 = v60 * v87 * v89
                        v90.Force = Vector3.new(0, v91, 0)
                        local v92 = u29.localSpaceForce
                        local v93 = -v80 * v87
                        local v94 = v62 * v87
                        v92.Force = Vector3.new(v93, 0, v94)
                        local v95 = u29.angularVelocity
                        local v96 = v72 * 1.3
                        v95.AngularVelocity = Vector3.new(v78, v96, v64)
                    end
                end))
                local v97 = u20.bindUpDownControls()
                u29.maid:GiveTask(v97.bindActionMaid)
                u29.maid:GiveTask(v97.shouldFlyUpRef.Changed:Connect(function(p98) --[[ Line: 249 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                    --]]
                    u29.holdingUp = p98
                    return u29.holdingUp
                end))
                u29.maid:GiveTask(v97.shouldFlyDownRef.Changed:Connect(function(p99) --[[ Line: 253 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                    --]]
                    u29.holdingDown = p99
                    return u29.holdingDown
                end))
                u5:playSound(u4.fromList(u23.FLYING_CARPET_DEPLOY), {
                    ["position"] = nil
                })
                u29.maid:GiveTask(u15.MoveMountButtonChange:connect(function(p100) --[[ Line: 261 ]]
                    --[[
                    Upvalues:
                        [1] = u18
                        [2] = u29
                        [3] = u17
                    --]]
                    local v101 = p100.direction
                    if v101 == u18.UP then
                        u29.holdingUp = p100.inputActionType == u17.PRESS
                    elseif v101 == u18.DOWN then
                        u29.holdingDown = p100.inputActionType == u17.PRESS
                    end
                end))
                if u3.isMobileControls() then
                    u6.Controllers.MobileUiController:toggleMountMovementControls(true)
                    u29.maid:GiveTask(function() --[[ Line: 276 ]]
                        --[[
                        Upvalues:
                            [1] = u6
                        --]]
                        return u6.Controllers.MobileUiController:toggleMountMovementControls(false)
                    end)
                else
                    local u102 = u9.mount(u9.createElement("ScreenGui", {
                        ["ResetOnSpawn"] = false
                    }, { u9.createElement(u19) }), u11.LocalPlayer:WaitForChild("PlayerGui"))
                    u29.maid:GiveTask(function() --[[ Line: 285 ]]
                        --[[
                        Upvalues:
                            [1] = u9
                            [2] = u102
                        --]]
                        u9.unmount(u102)
                    end)
                end
            else
                return nil
            end
        else
            return nil
        end
    else
        return nil
    end
end
function u26.onDisable(p103) --[[ Line: 290 ]]
    p103.maid:DoCleaning()
    local v104 = p103.hoverSound
    if v104 ~= nil then
        v104:Destroy()
    end
    local v105 = p103.windSound
    if v105 ~= nil then
        v105:Destroy()
    end
end
return {
    ["FlyingCarpetPilot"] = u26
}