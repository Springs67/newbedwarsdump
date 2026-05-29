local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.RandomUtil
local u6 = v3.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.RunService
local u14 = v11.SoundService
local u15 = v11.Workspace
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v17 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "movement", "event", "move-mount-event")
local u18 = v17.InputActionType
local u19 = v17.MoveMountDirection
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "movement", "move-mount-ui").MoveMountUI
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "player-control-module")
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid")
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u27 = v1.import(script, script.Parent.Parent.Parent, "mount", "mount-flight-controls").MountFlightControls
local u28 = v1.import(script, script.Parent.Parent, "vehicle-client").VehicleClient
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 42 ]]
        return "JellyfishMountPilot"
    end,
    ["__index"] = u28
})
u29.__index = u29
function u29.new(...) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(u32, u33) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u8
        [3] = u25
        [4] = u15
        [5] = u12
        [6] = u9
        [7] = u14
        [8] = u13
        [9] = u21
        [10] = u26
        [11] = u27
        [12] = u6
        [13] = u5
        [14] = u24
        [15] = u2
        [16] = u22
        [17] = u23
        [18] = u16
        [19] = u19
        [20] = u18
        [21] = u4
        [22] = u7
        [23] = u10
        [24] = u20
    --]]
    u28.constructor(u32, u33)
    u32.maid = u8.new()
    u32.pitchPid = u25.new(-5, 5, 0.09, 0, 0.03)
    u32.yawPid = u25.new(-40, 40, 0.022, 0, 0)
    u32.rollPid = u25.new(-10, 10, 0.1, 0, 0)
    u32.counterDriftPid = u25.new(-100, 100, 35, 0, 1)
    u32.levitationPid = u25.new(-200, 400, 20, 30, 0)
    u32.movePid = u25.new(-30, 30, 4, 0.6, 0)
    u32.heightGoal = 0
    u32.holdingUp = false
    u32.holdingDown = false
    u32.entryTime = u15:GetServerTimeNow()
    u32.enginePowerScale = 1
    u32.defaultCameraMaxZoomDistance = 14
    u32.defaultCameraMinZoomDistance = 0.5
    u32.maid = u8.new()
    local v34 = u12.LocalPlayer.Character
    if v34 then
        if v34:FindFirstChild("Humanoid") then
            local u35 = u33:FindFirstChild("Root")
            if u35 then
                local u36 = u15.CurrentCamera
                if u36 then
                    u32.defaultCameraMaxZoomDistance = 14
                    u32.defaultCameraMinZoomDistance = 0
                    u36.CameraSubject = u35
                    u12.LocalPlayer.CameraMinZoomDistance = 14
                    u12.LocalPlayer.CameraMaxZoomDistance = 32
                    u32.maid:GiveTask(function() --[[ Line: 89 ]]
                        --[[
                        Upvalues:
                            [1] = u12
                            [2] = u36
                            [3] = u32
                        --]]
                        local v37 = u12.LocalPlayer.Character
                        if v37 ~= nil then
                            v37 = v37:FindFirstChild("Humanoid")
                        end
                        u36.CameraSubject = v37
                        u12.LocalPlayer.CameraMinZoomDistance = u32.defaultCameraMinZoomDistance
                        u12.LocalPlayer.CameraMaxZoomDistance = u32.defaultCameraMaxZoomDistance
                    end)
                end
                local u38 = u9("Attachment", {
                    ["Parent"] = u35
                })
                u32.maid:GiveTask(function() --[[ Line: 103 ]]
                    --[[
                    Upvalues:
                        [1] = u38
                    --]]
                    u38:Destroy()
                end)
                u32.angularVelocity = u9("AngularVelocity", {
                    ["MaxTorque"] = (1 / 0),
                    ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
                    ["Attachment0"] = u38,
                    ["Parent"] = u35
                })
                u32.maid:GiveTask(function() --[[ Line: 112 ]]
                    --[[
                    Upvalues:
                        [1] = u32
                    --]]
                    u32.angularVelocity:Destroy()
                end)
                u32.worldSpaceForce = u9("VectorForce", {
                    ["Name"] = "WorldSpaceForce",
                    ["ApplyAtCenterOfMass"] = true,
                    ["RelativeTo"] = Enum.ActuatorRelativeTo.World,
                    ["Attachment0"] = u38,
                    ["Parent"] = u33
                })
                u32.maid:GiveTask(function() --[[ Line: 122 ]]
                    --[[
                    Upvalues:
                        [1] = u32
                    --]]
                    u32.worldSpaceForce:Destroy()
                end)
                u32.localSpaceForce = u9("VectorForce", {
                    ["Name"] = "LocalSpaceForce",
                    ["ApplyAtCenterOfMass"] = true,
                    ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
                    ["Attachment0"] = u38,
                    ["Parent"] = u35
                })
                u32.maid:GiveTask(function() --[[ Line: 132 ]]
                    --[[
                    Upvalues:
                        [1] = u32
                    --]]
                    u32.localSpaceForce:Destroy()
                end)
                u32.levitationPid:Debug("LevitationPID", u15)
                u32.counterDriftPid:Debug("CounterDriftPID", u15)
                u32.pitchPid:Debug("PitchPID", u15)
                u32.rollPid:Debug("RollPID", u15)
                u32.movePid:Debug("MovePID", u15)
                u32.yawPid:Debug("YawPID", u15)
                u32.maid:GiveTask(u32.levitationPid)
                u32.maid:GiveTask(u32.counterDriftPid)
                u32.maid:GiveTask(u32.pitchPid)
                u32.maid:GiveTask(u32.rollPid)
                u32.maid:GiveTask(u32.movePid)
                u32.maid:GiveTask(u32.yawPid)
                u32.windSound = u9("Sound", {
                    ["Name"] = "WindSound",
                    ["Looped"] = true,
                    ["Playing"] = true,
                    ["Volume"] = 0.25,
                    ["SoundId"] = "rbxassetid://" .. tostring(7910583431),
                    ["Parent"] = u14
                })
                u32.heightGoal = u35.Position.Y + 10
                u32.maid:GiveTask(u13.Stepped:Connect(function(_, p39) --[[ Line: 156 ]]
                    --[[
                    Upvalues:
                        [1] = u35
                        [2] = u21
                        [3] = u32
                        [4] = u26
                        [5] = u33
                        [6] = u15
                    --]]
                    local v40 = u35.CFrame
                    local v41 = v40.Position
                    local v42 = v40:VectorToObjectSpace(u35.AssemblyLinearVelocity)
                    local v43, _, v44 = v40:ToOrientation()
                    local v45 = u21:GetMoveVector()
                    local v46 = v40.LookVector
                    local v47 = v46.Z
                    local v48 = v46.X
                    local v49 = math.atan2(v47, v48)
                    local v50 = u35.AssemblyLinearVelocity * Vector3.new(1.5, 0, 1.5)
                    local v51 = v40:VectorToObjectSpace(v50).X
                    local v52 = -math.sign(v51)
                    local v53 = v50.Magnitude * v52
                    local v54 = CFrame
                    local v55 = CFrame.new(-v45.X, 0, 0)
                    local v56 = v54.lookAt(v41, (v40 * v55).Position)
                    local v57 = os.clock()
                    local v58 = math.sin(v57) * 0.3 + 0
                    local v59 = u32.holdingUp and not u32.holdingDown and 50 or (u32.holdingDown and not u32.holdingUp and -50 or 0)
                    local v60 = u32
                    local v61
                    if u26.isGameServer() then
                        local v62 = u32.heightGoal + v59 * p39
                        v61 = math.clamp(v62, -50, 250)
                    else
                        v61 = u32.heightGoal + v59 * p39
                    end
                    v60.heightGoal = v61
                    local v63 = u32.levitationPid:Calculate(p39, u32.heightGoal + v58, v41.Y)
                    local v64 = v42.Z
                    local v65 = u32.counterDriftPid:Calculate(p39, 0, v64)
                    local v66 = 5 * -v45.Z
                    local v67 = u32.pitchPid:Calculate(p39, v66, (math.deg(v44)))
                    local v68 = v46:Dot(v56.LookVector)
                    local v69 = math.acos(v68)
                    local v70 = v46:Cross(v56.LookVector).Y
                    local v71 = math.clamp(v70, -1, 1)
                    local v72 = v69 * -math.round(v71)
                    local v73 = v72 ~= v72 and 0 or v72
                    local v74 = v45.Magnitude > 0.05
                    local v75
                    if v74 then
                        local v76 = v49 + v73
                        local v77 = math.deg(v76)
                        local v78 = u32.yawPid
                        local v79 = v45.X
                        if math.abs(v79) <= 0.1 then
                            v77 = math.deg(v49)
                        end
                        v75 = v78:Calculate(p39, v77, (math.deg(v49)))
                    else
                        v75 = 0
                    end
                    local v80 = 5 * (not v74 and 0 or -1 + 2 * ((v73 - -3.141592653589793) / 6.283185307179586))
                    local v81 = u32.rollPid:Calculate(p39, v80, (math.deg(v43)))
                    local v82 = -63 + 133 * ((-v45.Z - -0.9) / 1.9)
                    local v83 = u32.movePid:Calculate(p39, v82, v53)
                    local v84 = 0 + 0.5 * ((math.abs(v53) - 0) / 70)
                    if u32.windSound then
                        u32.windSound.Volume = v84
                    end
                    if u32.holdingUp and not u32.holdingDown then
                        local v85 = u32
                        v85.enginePowerScale = v85.enginePowerScale + p39 * 0.96
                    elseif u32.holdingDown and not u32.holdingDown then
                        local v86 = u32
                        v86.enginePowerScale = v86.enginePowerScale - p39 * 0.96
                    else
                        local v87 = u32
                        v87.enginePowerScale = v87.enginePowerScale - p39 * 0.9
                    end
                    local v88 = u32
                    local v89 = u32.enginePowerScale
                    v88.enginePowerScale = math.clamp(v89, 0.95, 1)
                    u32:setEnginePowerRatio(u32.enginePowerScale)
                    if u33:GetAttribute("Dead") == true then
                        u32.worldSpaceForce.Force = Vector3.new(0, 0, 0)
                        u32.localSpaceForce.Force = Vector3.new(0, 0, 0)
                        u32.angularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
                        u32.maid:DoCleaning()
                    else
                        local v90 = u35.AssemblyMass
                        local v91 = (u15:GetServerTimeNow() - u32.entryTime) / 1
                        local v92 = math.clamp(v91, 0, 1)
                        local v93 = u32.worldSpaceForce
                        local v94 = v63 * v90 * v92
                        v93.Force = Vector3.new(0, v94, 0)
                        local v95 = u32.localSpaceForce
                        local v96 = -v83 * v90
                        local v97 = v65 * v90
                        v95.Force = Vector3.new(v96, 0, v97)
                        local v98 = u32.angularVelocity
                        local v99 = v75 * 1.3
                        v98.AngularVelocity = Vector3.new(v81, v99, v67)
                    end
                end))
                local v100 = u27.bindUpDownControls()
                u32.maid:GiveTask(v100.bindActionMaid)
                u32.maid:GiveTask(v100.shouldFlyUpRef.Changed:Connect(function(p101) --[[ Line: 252 ]]
                    --[[
                    Upvalues:
                        [1] = u32
                    --]]
                    u32.holdingUp = p101
                    return u32.holdingUp
                end))
                u32.maid:GiveTask(v100.shouldFlyDownRef.Changed:Connect(function(p102) --[[ Line: 256 ]]
                    --[[
                    Upvalues:
                        [1] = u32
                    --]]
                    u32.holdingDown = p102
                    return u32.holdingDown
                end))
                u6:playSound(u5.fromList(u24.JELLYFISH_DEPLOY_1, u24.JELLYFISH_DEPLOY_2, u24.JELLYFISH_DEPLOY_3), {
                    ["position"] = nil
                })
                local v103 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
                local v104 = u22.JELLYFISH_MOUNT_SWAP_COLOR
                local v105 = {
                    ["abilityType"] = "MiscPrimary",
                    ["abilityButton"] = {
                        ["icon"] = u23.SWAP_MOBILE
                    }
                }
                v103:enableAbility(v104, v105):andThen(function(p106) --[[ Line: 269 ]]
                    --[[
                    Upvalues:
                        [1] = u32
                    --]]
                    u32.maid:GiveTask(p106)
                end)
                u32.maid:GiveTask(u16.MoveMountButtonChange:connect(function(p107) --[[ Line: 273 ]]
                    --[[
                    Upvalues:
                        [1] = u19
                        [2] = u32
                        [3] = u18
                    --]]
                    local v108 = p107.direction
                    if v108 == u19.UP then
                        u32.holdingUp = p107.inputActionType == u18.PRESS
                    elseif v108 == u19.DOWN then
                        u32.holdingDown = p107.inputActionType == u18.PRESS
                    end
                end))
                if u4.isMobileControls() then
                    u7.Controllers.MobileUiController:toggleMountMovementControls(true)
                    u32.maid:GiveTask(function() --[[ Line: 288 ]]
                        --[[
                        Upvalues:
                            [1] = u7
                        --]]
                        return u7.Controllers.MobileUiController:toggleMountMovementControls(false)
                    end)
                else
                    local u109 = u10.mount(u10.createElement("ScreenGui", {
                        ["ResetOnSpawn"] = false
                    }, { u10.createElement(u20) }), u12.LocalPlayer:WaitForChild("PlayerGui"))
                    u32.maid:GiveTask(function() --[[ Line: 297 ]]
                        --[[
                        Upvalues:
                            [1] = u10
                            [2] = u109
                        --]]
                        u10.unmount(u109)
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
function u29.onDisable(p110) --[[ Line: 302 ]]
    p110.maid:DoCleaning()
    local v111 = p110.hoverSound
    if v111 ~= nil then
        v111:Destroy()
    end
    local v112 = p110.windSound
    if v112 ~= nil then
        v112:Destroy()
    end
end
return {
    ["JellyfishMountPilot"] = u29
}