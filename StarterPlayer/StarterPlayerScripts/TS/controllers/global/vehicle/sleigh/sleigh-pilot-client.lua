local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.MathExtras
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.RunService
local u12 = v9.SoundService
local u13 = v9.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v15 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "movement", "event", "move-mount-event")
local u16 = v15.InputActionType
local u17 = v15.MoveMountDirection
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "movement", "move-mount-ui").MoveMountUI
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "player-control-module")
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid")
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u23 = v1.import(script, script.Parent.Parent.Parent, "mount", "mount-flight-controls").MountFlightControls
local u24 = v1.import(script, script.Parent.Parent, "vehicle-client").VehicleClient
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 34 ]]
        return "SleighPilot"
    end,
    ["__index"] = u24
})
u25.__index = u25
function u25.new(...) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v26 = u25
    local v27 = setmetatable({}, v26)
    return v27:constructor(...) or v27
end
function u25.constructor(u28, u29) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u6
        [3] = u21
        [4] = u13
        [5] = u10
        [6] = u7
        [7] = u12
        [8] = u20
        [9] = u11
        [10] = u19
        [11] = u22
        [12] = u4
        [13] = u23
        [14] = u14
        [15] = u17
        [16] = u16
        [17] = u3
        [18] = u5
        [19] = u8
        [20] = u18
    --]]
    u24.constructor(u28, u29)
    u28.maid = u6.new()
    u28.pitchPid = u21.new(-5, 5, 0.04, 0, 0.03)
    u28.yawPid = u21.new(-10, 10, 0.009, 0, 0)
    u28.rollPid = u21.new(-10, 10, 0.07, 0, 0)
    u28.counterDriftPid = u21.new(-50, 50, 25, 0, 1)
    u28.levitationPid = u21.new(-400, 400, 20, 30, 0)
    u28.movePid = u21.new(-30, 30, 4, 0.5, 0)
    u28.heightGoal = 0
    u28.holdingUp = false
    u28.holdingDown = false
    u28.entryTime = u13:GetServerTimeNow()
    u28.enginePowerScale = 0.6
    u28.maid = u6.new()
    local v30 = u10.LocalPlayer.Character
    if v30 then
        if v30:FindFirstChild("Humanoid") then
            local u31 = u29:FindFirstChild("Root")
            if u31 then
                if u13.CurrentCamera then
                    u13.CurrentCamera.CameraSubject = u31
                    u10.LocalPlayer.CameraMaxZoomDistance = 20
                    u10.LocalPlayer.CameraMinZoomDistance = 20
                    u28.maid:GiveTask(function() --[[ Line: 75 ]]
                        --[[
                        Upvalues:
                            [1] = u10
                            [2] = u13
                        --]]
                        u10.LocalPlayer.CameraMaxZoomDistance = 14
                        u10.LocalPlayer.CameraMinZoomDistance = 0
                        local v32 = u10.LocalPlayer.Character
                        if v32 ~= nil then
                            v32 = v32:FindFirstChild("Humanoid")
                        end
                        u13.CurrentCamera.CameraSubject = v32
                    end)
                end
                local u33 = u7("Attachment", {
                    ["Parent"] = u31
                })
                u28.maid:GiveTask(function() --[[ Line: 89 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                    --]]
                    u33:Destroy()
                end)
                u28.angularVelocity = u7("AngularVelocity", {
                    ["MaxTorque"] = (1 / 0),
                    ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
                    ["Attachment0"] = u33,
                    ["Parent"] = u31
                })
                u28.maid:GiveTask(function() --[[ Line: 98 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                    --]]
                    u28.angularVelocity:Destroy()
                end)
                u28.worldSpaceForce = u7("VectorForce", {
                    ["Name"] = "WorldSpaceForce",
                    ["ApplyAtCenterOfMass"] = true,
                    ["RelativeTo"] = Enum.ActuatorRelativeTo.World,
                    ["Attachment0"] = u33,
                    ["Parent"] = u29
                })
                u28.maid:GiveTask(function() --[[ Line: 108 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                    --]]
                    u28.worldSpaceForce:Destroy()
                end)
                u28.localSpaceForce = u7("VectorForce", {
                    ["Name"] = "LocalSpaceForce",
                    ["ApplyAtCenterOfMass"] = true,
                    ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
                    ["Attachment0"] = u33,
                    ["Parent"] = u31
                })
                u28.maid:GiveTask(function() --[[ Line: 118 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                    --]]
                    u28.localSpaceForce:Destroy()
                end)
                u28.levitationPid:Debug("LevitationPID", u13)
                u28.counterDriftPid:Debug("CounterDriftPID", u13)
                u28.pitchPid:Debug("PitchPID", u13)
                u28.rollPid:Debug("RollPID", u13)
                u28.movePid:Debug("MovePID", u13)
                u28.yawPid:Debug("YawPID", u13)
                u28.maid:GiveTask(u28.levitationPid)
                u28.maid:GiveTask(u28.counterDriftPid)
                u28.maid:GiveTask(u28.pitchPid)
                u28.maid:GiveTask(u28.rollPid)
                u28.maid:GiveTask(u28.movePid)
                u28.maid:GiveTask(u28.yawPid)
                u28.windSound = u7("Sound", {
                    ["Name"] = "WindSound",
                    ["Looped"] = true,
                    ["Playing"] = true,
                    ["Volume"] = 0.25,
                    ["SoundId"] = "rbxassetid://" .. tostring(7910583431),
                    ["Parent"] = u12
                })
                u28.jingleBellSound = u7("Sound", {
                    ["Name"] = "JingleBellSound",
                    ["Looped"] = true,
                    ["Playing"] = true,
                    ["Volume"] = 0.25,
                    ["SoundId"] = u20.JINGLE_BELLS,
                    ["Parent"] = u12
                })
                u28.heightGoal = u31.Position.Y
                u28.maid:GiveTask(u11.Stepped:Connect(function(_, p34) --[[ Line: 150 ]]
                    --[[
                    Upvalues:
                        [1] = u31
                        [2] = u19
                        [3] = u28
                        [4] = u22
                        [5] = u4
                        [6] = u29
                        [7] = u13
                    --]]
                    local v35 = u31.CFrame
                    local v36 = v35.Position
                    local v37 = v35:VectorToObjectSpace(u31.AssemblyLinearVelocity)
                    local v38, _, v39 = v35:ToOrientation()
                    local v40 = u19:GetMoveVector()
                    local v41 = v35.LookVector
                    local v42 = v41.Z
                    local v43 = v41.X
                    local v44 = math.atan2(v42, v43)
                    local v45 = u31.AssemblyLinearVelocity * Vector3.new(1, 0, 1)
                    local v46 = v35:VectorToObjectSpace(v45).X
                    local v47 = -math.sign(v46)
                    local v48 = v45.Magnitude * v47
                    local v49 = CFrame
                    local v50 = CFrame.new(-v40.X, 0, 0)
                    local v51 = v49.lookAt(v36, (v35 * v50).Position)
                    local v52 = os.clock()
                    local v53 = math.sin(v52) * 0.7 + 0
                    local v54 = u28.holdingUp and not u28.holdingDown and 10 or (u28.holdingDown and not u28.holdingUp and -9 or 0)
                    local v55 = u28
                    local v56
                    if u22.isGameServer() then
                        local v57 = u28.heightGoal + v54 * p34
                        v56 = math.clamp(v57, -50, 200)
                    else
                        v56 = u28.heightGoal + v54 * p34
                    end
                    v55.heightGoal = v56
                    local v58 = u28.levitationPid:Calculate(p34, u28.heightGoal + v53, v36.Y)
                    local v59 = v37.Z
                    local v60 = u28.counterDriftPid:Calculate(p34, 0, v59)
                    local v61 = 15 * -v40.Z
                    local v62 = u28.pitchPid:Calculate(p34, v61, (math.deg(v39)))
                    local v63 = v41:Dot(v51.LookVector)
                    local v64 = math.acos(v63)
                    local v65 = v41:Cross(v51.LookVector).Y
                    local v66 = math.clamp(v65, -1, 1)
                    local v67 = v64 * -math.round(v66)
                    local v68 = v67 ~= v67 and 0 or v67
                    local v69 = v40.Magnitude > 0.05
                    local v70
                    if v69 then
                        local v71 = v44 + v68
                        local v72 = math.deg(v71)
                        local v73 = u28.yawPid
                        local v74 = v40.X
                        if math.abs(v74) <= 0.1 then
                            v72 = math.deg(v44)
                        end
                        v70 = v73:Calculate(p34, v72, (math.deg(v44)))
                    else
                        v70 = 0
                    end
                    local v75 = 25 * (not v69 and 0 or u4:rangeMap(v68, { -3.141592653589793, 3.141592653589793 }, { -1, 1 }))
                    local v76 = u28.rollPid:Calculate(p34, v75, (math.deg(v38)))
                    local v77 = u4:rangeMap(-v40.Z, { -0.9, 1 }, { -36, 40 })
                    local v78 = u28.movePid:Calculate(p34, v77, v48)
                    if u28.windSound then
                        local v79 = u4:rangeMap(math.abs(v48), { 0, 40 }, { 0, 0.5 })
                        u28.windSound.Volume = v79
                    end
                    if u28.jingleBellSound then
                        local v80 = u4:rangeMap(math.abs(v48), { 0, 40 }, { 0, 0.25 })
                        u28.jingleBellSound.Volume = v80
                    end
                    if u28.holdingUp and not u28.holdingDown then
                        local v81 = u28
                        v81.enginePowerScale = v81.enginePowerScale + p34 * 0.4
                    elseif u28.holdingDown and not u28.holdingDown then
                        local v82 = u28
                        v82.enginePowerScale = v82.enginePowerScale - p34 * 0.3
                    else
                        local v83 = u28
                        v83.enginePowerScale = v83.enginePowerScale - p34 * 0.3
                    end
                    local v84 = u28
                    local v85 = u28.enginePowerScale
                    v84.enginePowerScale = math.clamp(v85, 0.6, 1)
                    u28:setEnginePowerRatio(u28.enginePowerScale)
                    if u29:GetAttribute("Dead") == true then
                        u28.worldSpaceForce.Force = Vector3.new(0, 0, 0)
                        u28.localSpaceForce.Force = Vector3.new(0, 0, 0)
                        u28.angularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
                    else
                        local v86 = u31.AssemblyMass
                        local v87 = (u13:GetServerTimeNow() - u28.entryTime) / 1
                        local v88 = math.clamp(v87, 0, 1)
                        local v89 = u28.worldSpaceForce
                        local v90 = v58 * v86 * v88
                        v89.Force = Vector3.new(0, v90, 0)
                        local v91 = u28.localSpaceForce
                        local v92 = -v78 * v86
                        local v93 = v60 * v86
                        v91.Force = Vector3.new(v92, 0, v93)
                        u28.angularVelocity.AngularVelocity = Vector3.new(v76, v70, v62)
                    end
                end))
                local v94 = u23.bindUpDownControls()
                u28.maid:GiveTask(v94.bindActionMaid)
                u28.maid:GiveTask(v94.shouldFlyUpRef.Changed:Connect(function(p95) --[[ Line: 249 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                    --]]
                    u28.holdingUp = p95
                    return u28.holdingUp
                end))
                u28.maid:GiveTask(v94.shouldFlyDownRef.Changed:Connect(function(p96) --[[ Line: 253 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                    --]]
                    u28.holdingDown = p96
                    return u28.holdingDown
                end))
                u28.maid:GiveTask(u14.MoveMountButtonChange:connect(function(p97) --[[ Line: 257 ]]
                    --[[
                    Upvalues:
                        [1] = u17
                        [2] = u28
                        [3] = u16
                    --]]
                    local v98 = p97.direction
                    if v98 == u17.UP then
                        u28.holdingUp = p97.inputActionType == u16.PRESS
                    elseif v98 == u17.DOWN then
                        u28.holdingDown = p97.inputActionType == u16.PRESS
                    end
                end))
                if u3.isMobileControls() then
                    u5.Controllers.MobileUiController:toggleMountMovementControls(true)
                    u28.maid:GiveTask(function() --[[ Line: 272 ]]
                        --[[
                        Upvalues:
                            [1] = u5
                        --]]
                        return u5.Controllers.MobileUiController:toggleMountMovementControls(false)
                    end)
                else
                    local u99 = u8.mount(u8.createElement("ScreenGui", {
                        ["ResetOnSpawn"] = false
                    }, { u8.createElement(u18) }), u10.LocalPlayer:WaitForChild("PlayerGui"))
                    u28.maid:GiveTask(function() --[[ Line: 281 ]]
                        --[[
                        Upvalues:
                            [1] = u8
                            [2] = u99
                        --]]
                        u8.unmount(u99)
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
function u25.onDisable(p100) --[[ Line: 286 ]]
    p100.maid:DoCleaning()
    local v101 = p100.hoverSound
    if v101 ~= nil then
        v101:Destroy()
    end
    local v102 = p100.windSound
    if v102 ~= nil then
        v102:Destroy()
    end
    local v103 = p100.jingleBellSound
    if v103 ~= nil then
        v103:Destroy()
    end
end
return {
    ["SleighPilot"] = u25
}