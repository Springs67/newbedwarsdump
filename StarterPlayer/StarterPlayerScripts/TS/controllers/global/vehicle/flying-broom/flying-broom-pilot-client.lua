local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.RunService
local u8 = v5.SoundService
local u9 = v5.Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v11 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "movement", "event", "move-mount-event")
local u12 = v11.InputActionType
local u13 = v11.MoveMountDirection
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "player-control-module")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "flying-broom-balance-file").FlyingBroomBalance
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid")
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u18 = v1.import(script, script.Parent.Parent.Parent, "mount", "mount-flight-controls").MountFlightControls
local u19 = v1.import(script, script.Parent.Parent, "vehicle-client").VehicleClient
local u20 = v1.import(script, script.Parent, "flying-broom-ui").FlyingBroomUi
local u21 = v15.FLYING_BROOM_MAX_SPEED
local u22 = v15.MAX_PITCH_TILT
local u23 = v15.MAX_ROLL_TILT
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 34 ]]
        return "FlyingBroomPilot"
    end,
    ["__index"] = u19
})
u24.__index = u24
function u24.new(...) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(u27, u28) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u2
        [3] = u16
        [4] = u9
        [5] = u6
        [6] = u3
        [7] = u8
        [8] = u7
        [9] = u14
        [10] = u17
        [11] = u22
        [12] = u23
        [13] = u21
        [14] = u18
        [15] = u10
        [16] = u13
        [17] = u12
        [18] = u4
        [19] = u20
    --]]
    u19.constructor(u27, u28)
    u27.maid = u2.new()
    u27.pitchPid = u16.new(-5, 5, 0.09, 0, 0.03)
    u27.yawPid = u16.new(-40, 40, 0.022, 0, 0)
    u27.rollPid = u16.new(-10, 10, 0.1, 0, 0)
    u27.counterDriftPid = u16.new(-100, 100, 35, 0, 1)
    u27.levitationPid = u16.new(-200, 400, 20, 30, 0)
    u27.movePid = u16.new(-30, 30, 4, 0.6, 0)
    u27.heightGoal = 0
    u27.holdingUp = false
    u27.holdingDown = false
    u27.entryTime = u9:GetServerTimeNow()
    u27.enginePowerScale = 1.1
    u27.defaultCameraMaxZoomDistance = 14
    u27.defaultCameraMinZoomDistance = 0.5
    u27.maid = u2.new()
    local v29 = u6.LocalPlayer.Character
    if not v29 then
        return nil
    end
    if not v29:FindFirstChild("Humanoid") then
        return nil
    end
    local u30 = u28:FindFirstChild("Root")
    if not u30 then
        return nil
    end
    local u31 = u9.CurrentCamera
    if u31 then
        u27.defaultCameraMaxZoomDistance = 14
        u27.defaultCameraMinZoomDistance = 0
        u31.CameraSubject = u30
        u6.LocalPlayer.CameraMinZoomDistance = 14
        u6.LocalPlayer.CameraMaxZoomDistance = 32
        u27.maid:GiveTask(function() --[[ Line: 80 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u31
                [3] = u27
            --]]
            local v32 = u6.LocalPlayer.Character
            if v32 ~= nil then
                v32 = v32:FindFirstChild("Humanoid")
            end
            u31.CameraSubject = v32
            u6.LocalPlayer.CameraMinZoomDistance = u27.defaultCameraMinZoomDistance
            u6.LocalPlayer.CameraMaxZoomDistance = u27.defaultCameraMaxZoomDistance
        end)
    end
    local u33 = u3("Attachment", {
        ["Parent"] = u30
    })
    u27.maid:GiveTask(function() --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:Destroy()
    end)
    u27.angularVelocity = u3("AngularVelocity", {
        ["MaxTorque"] = (1 / 0),
        ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
        ["Attachment0"] = u33,
        ["Parent"] = u30
    })
    u27.maid:GiveTask(function() --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27.angularVelocity:Destroy()
    end)
    u27.worldSpaceForce = u3("VectorForce", {
        ["Name"] = "WorldSpaceForce",
        ["ApplyAtCenterOfMass"] = true,
        ["RelativeTo"] = Enum.ActuatorRelativeTo.World,
        ["Attachment0"] = u33,
        ["Parent"] = u28
    })
    u27.maid:GiveTask(function() --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27.worldSpaceForce:Destroy()
    end)
    u27.localSpaceForce = u3("VectorForce", {
        ["Name"] = "LocalSpaceForce",
        ["ApplyAtCenterOfMass"] = true,
        ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
        ["Attachment0"] = u33,
        ["Parent"] = u30
    })
    u27.maid:GiveTask(function() --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27.localSpaceForce:Destroy()
    end)
    u27.levitationPid:Debug("LevitationPID", u9)
    u27.counterDriftPid:Debug("CounterDriftPID", u9)
    u27.pitchPid:Debug("PitchPID", u9)
    u27.rollPid:Debug("RollPID", u9)
    u27.movePid:Debug("MovePID", u9)
    u27.yawPid:Debug("YawPID", u9)
    u27.maid:GiveTask(u27.levitationPid)
    u27.maid:GiveTask(u27.counterDriftPid)
    u27.maid:GiveTask(u27.pitchPid)
    u27.maid:GiveTask(u27.rollPid)
    u27.maid:GiveTask(u27.movePid)
    u27.maid:GiveTask(u27.yawPid)
    u27.windSound = u3("Sound", {
        ["Name"] = "WindSound",
        ["Looped"] = true,
        ["Playing"] = true,
        ["Volume"] = 0.25,
        ["SoundId"] = "rbxassetid://" .. tostring(7910583431),
        ["Parent"] = u8
    })
    u27.heightGoal = u30.Position.Y + 10
    u27.maid:GiveTask(u7.Stepped:Connect(function(_, p34) --[[ Line: 147 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u14
            [3] = u27
            [4] = u17
            [5] = u22
            [6] = u23
            [7] = u21
            [8] = u28
            [9] = u9
        --]]
        local v35 = u30.CFrame
        local v36 = v35.Position
        local v37 = v35:VectorToObjectSpace(u30.AssemblyLinearVelocity)
        local v38, _, v39 = v35:ToOrientation()
        local v40 = u14:GetMoveVector()
        local v41 = v35.LookVector
        local v42 = v41.Z
        local v43 = v41.X
        local v44 = math.atan2(v42, v43)
        local v45 = u30.AssemblyLinearVelocity * Vector3.new(1.5, 0, 1.5)
        local v46 = v35:VectorToObjectSpace(v45).X
        local v47 = -math.sign(v46)
        local v48 = v45.Magnitude * v47
        local v49 = CFrame
        local v50 = CFrame.new(-v40.X, 0, 0)
        local v51 = v49.lookAt(v36, (v35 * v50).Position)
        local v52 = os.clock()
        local v53 = math.sin(v52) * 0.3 + 0
        local v54 = u27.holdingUp and not u27.holdingDown and 20 or (u27.holdingDown and not u27.holdingUp and -20 or 0)
        local v55 = u27
        local v56
        if u17.isGameServer() then
            local v57 = u27.heightGoal + v54 * p34
            v56 = math.clamp(v57, -50, 250)
        else
            v56 = u27.heightGoal + v54 * p34
        end
        v55.heightGoal = v56
        local v58 = u27.levitationPid:Calculate(p34, u27.heightGoal + v53, v36.Y)
        local v59 = v37.Z
        local v60 = u27.counterDriftPid:Calculate(p34, 0, v59)
        local v61 = u22 * -v40.Z
        local v62 = u27.pitchPid:Calculate(p34, v61, (math.deg(v39)))
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
            local v73 = u27.yawPid
            local v74 = v40.X
            if math.abs(v74) <= 0.1 then
                v72 = math.deg(v44)
            end
            v70 = v73:Calculate(p34, v72, (math.deg(v44)))
        else
            v70 = 0
        end
        local v75 = u23 * (not v69 and 0 or -1 + 2 * ((v68 - -3.141592653589793) / 6.283185307179586))
        local v76 = u27.rollPid:Calculate(p34, v75, (math.deg(v38)))
        local v77 = -v40.Z
        local v78 = -u21 * 0.9
        local v79 = v78 + (u21 - v78) * ((v77 - -0.9) / 1.9)
        local v80 = u27.movePid:Calculate(p34, v79, v48)
        local v81 = u21
        local v82 = 0 + 0.5 * ((math.abs(v48) - 0) / (v81 - 0))
        if u27.windSound then
            u27.windSound.Volume = v82
        end
        if u27.holdingUp and not u27.holdingDown then
            local v83 = u27
            v83.enginePowerScale = v83.enginePowerScale + p34 * 0.96
        elseif u27.holdingDown and not u27.holdingDown then
            local v84 = u27
            v84.enginePowerScale = v84.enginePowerScale - p34 * 0.96
        else
            local v85 = u27
            v85.enginePowerScale = v85.enginePowerScale - p34 * 0.99
        end
        local v86 = u27
        local v87 = u27.enginePowerScale
        v86.enginePowerScale = math.clamp(v87, 0.95, 1)
        u27:setEnginePowerRatio(u27.enginePowerScale)
        if u28:GetAttribute("Dead") == true then
            u27.worldSpaceForce.Force = Vector3.new(0, 0, 0)
            u27.localSpaceForce.Force = Vector3.new(0, 0, 0)
            u27.angularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
            u27.maid:DoCleaning()
        else
            local v88 = u30.AssemblyMass
            local v89 = (u9:GetServerTimeNow() - u27.entryTime) / 1
            local v90 = math.clamp(v89, 1, 1)
            local v91 = u27.worldSpaceForce
            local v92 = v58 * v88 * v90
            v91.Force = Vector3.new(0, v92, 0)
            local v93 = u27.localSpaceForce
            local v94 = -v80 * v88
            local v95 = v60 * v88
            v93.Force = Vector3.new(v94, 0, v95)
            local v96 = u27.angularVelocity
            local v97 = v70 * 1.2
            v96.AngularVelocity = Vector3.new(v76, v97, v62)
        end
    end))
    local v98 = u18.bindUpDownControls()
    u27.maid:GiveTask(v98.bindActionMaid)
    u27.maid:GiveTask(v98.shouldFlyUpRef.Changed:Connect(function(p99) --[[ Line: 243 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27.holdingUp = p99
        return u27.holdingUp
    end))
    u27.maid:GiveTask(v98.shouldFlyDownRef.Changed:Connect(function(p100) --[[ Line: 247 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27.holdingDown = p100
        return u27.holdingDown
    end))
    u27.maid:GiveTask(u10.MoveMountButtonChange:connect(function(p101) --[[ Line: 251 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u27
            [3] = u12
        --]]
        local v102 = p101.direction
        if v102 == u13.UP then
            u27.holdingUp = p101.inputActionType == u12.PRESS
        elseif v102 == u13.DOWN then
            u27.holdingDown = p101.inputActionType == u12.PRESS
        end
    end))
    local u103 = u4.mount(u4.createElement("ScreenGui", {
        ["ResetOnSpawn"] = false
    }, { u4.createElement(u20, {
            ["vehicleModel"] = u28
        }) }), u6.LocalPlayer:WaitForChild("PlayerGui"))
    u27.maid:GiveTask(function() --[[ Line: 271 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u103
        --]]
        u4.unmount(u103)
    end)
end
function u24.onDisable(p104) --[[ Line: 275 ]]
    p104.maid:DoCleaning()
    local v105 = p104.hoverSound
    if v105 ~= nil then
        v105:Destroy()
    end
    local v106 = p104.windSound
    if v106 ~= nil then
        v106:Destroy()
    end
end
return {
    ["FlyingBroomPilot"] = u24
}