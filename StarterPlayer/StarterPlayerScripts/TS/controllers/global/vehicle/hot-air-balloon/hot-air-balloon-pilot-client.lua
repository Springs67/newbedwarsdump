local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.RunService
local u10 = v7.SoundService
local u11 = v7.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v13 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "movement", "event", "move-mount-event")
local u14 = v13.InputActionType
local u15 = v13.MoveMountDirection
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "player-control-module")
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid")
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u21 = v1.import(script, script.Parent.Parent.Parent, "mount", "mount-flight-controls").MountFlightControls
local u22 = v1.import(script, script.Parent.Parent, "vehicle-client").VehicleClient
local u23 = v1.import(script, script.Parent, "hot-air-balloon-ui").HotAirBalloonUi
local u24 = v17.HOT_AIR_BALLOON_SPEED
local u25 = v17.HOT_AIR_BALLOON_YAW_MULTIPLIER
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "HotAirBalloonPilot"
    end,
    ["__index"] = u22
})
u26.__index = u26
function u26.new(...) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(u29, u30) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u4
        [3] = u19
        [4] = u11
        [5] = u3
        [6] = u18
        [7] = u8
        [8] = u5
        [9] = u10
        [10] = u9
        [11] = u16
        [12] = u20
        [13] = u24
        [14] = u25
        [15] = u2
        [16] = u21
        [17] = u12
        [18] = u15
        [19] = u14
        [20] = u6
        [21] = u23
    --]]
    u22.constructor(u29, u30)
    u29.maid = u4.new()
    u29.pitchPid = u19.new(-5, 5, 0.09, 0, 0.03)
    u29.yawPid = u19.new(-40, 40, 0.022, 0, 0)
    u29.rollPid = u19.new(-10, 10, 0.1, 0, 0)
    u29.counterDriftPid = u19.new(-100, 100, 35, 0, 1)
    u29.levitationPid = u19.new(-200, 400, 20, 30, 0)
    u29.movePid = u19.new(-30, 30, 4, 0.6, 0)
    u29.heightGoal = 0
    u29.holdingUp = false
    u29.holdingDown = false
    u29.entryTime = u11:GetServerTimeNow()
    u29.enginePowerScale = 1
    u29.defaultCameraMaxZoomDistance = 14
    u29.defaultCameraMinZoomDistance = 0.5
    u29.thrusterLoopSound = u3:playModifiableSound(u18.HOT_AIR_BALLOON_THRUSTER_LOOP, {
        ["volumeMultiplier"] = 0.4,
        ["looped"] = true
    })
    u29.maid = u4.new()
    local v31 = u8.LocalPlayer.Character
    if not v31 then
        return nil
    end
    if not v31:FindFirstChild("Humanoid") then
        return nil
    end
    local u32 = u30:FindFirstChild("Root")
    if not u32 then
        return nil
    end
    local u33 = u11.CurrentCamera
    if u33 then
        u29.defaultCameraMaxZoomDistance = 14
        u29.defaultCameraMinZoomDistance = 0
        u33.CameraSubject = u32
        u8.LocalPlayer.CameraMinZoomDistance = 24
        u8.LocalPlayer.CameraMaxZoomDistance = 44
        u29.maid:GiveTask(function() --[[ Line: 89 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u33
                [3] = u29
            --]]
            local v34 = u8.LocalPlayer.Character
            if v34 ~= nil then
                v34 = v34:FindFirstChild("Humanoid")
            end
            u33.CameraSubject = v34
            u8.LocalPlayer.CameraMinZoomDistance = u29.defaultCameraMinZoomDistance
            u8.LocalPlayer.CameraMaxZoomDistance = u29.defaultCameraMaxZoomDistance
        end)
    end
    local u35 = u5("Attachment", {
        ["Parent"] = u32
    })
    u29.maid:GiveTask(function() --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        u35:Destroy()
    end)
    u29.angularVelocity = u5("AngularVelocity", {
        ["MaxTorque"] = (1 / 0),
        ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
        ["Attachment0"] = u35,
        ["Parent"] = u32
    })
    u29.maid:GiveTask(function() --[[ Line: 112 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29.angularVelocity:Destroy()
    end)
    u29.worldSpaceForce = u5("VectorForce", {
        ["Name"] = "WorldSpaceForce",
        ["ApplyAtCenterOfMass"] = true,
        ["RelativeTo"] = Enum.ActuatorRelativeTo.World,
        ["Attachment0"] = u35,
        ["Parent"] = u30
    })
    u29.maid:GiveTask(function() --[[ Line: 122 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29.worldSpaceForce:Destroy()
    end)
    u29.localSpaceForce = u5("VectorForce", {
        ["Name"] = "LocalSpaceForce",
        ["ApplyAtCenterOfMass"] = true,
        ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
        ["Attachment0"] = u35,
        ["Parent"] = u32
    })
    u29.maid:GiveTask(function() --[[ Line: 132 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29.localSpaceForce:Destroy()
    end)
    u29.levitationPid:Debug("LevitationPID", u11)
    u29.counterDriftPid:Debug("CounterDriftPID", u11)
    u29.pitchPid:Debug("PitchPID", u11)
    u29.rollPid:Debug("RollPID", u11)
    u29.movePid:Debug("MovePID", u11)
    u29.yawPid:Debug("YawPID", u11)
    u29.maid:GiveTask(u29.levitationPid)
    u29.maid:GiveTask(u29.counterDriftPid)
    u29.maid:GiveTask(u29.pitchPid)
    u29.maid:GiveTask(u29.rollPid)
    u29.maid:GiveTask(u29.movePid)
    u29.maid:GiveTask(u29.yawPid)
    u29.windSound = u5("Sound", {
        ["Name"] = "WindSound",
        ["Looped"] = true,
        ["Playing"] = true,
        ["Volume"] = 0.2,
        ["SoundId"] = "rbxassetid://" .. tostring(7910583431),
        ["Parent"] = u10
    })
    u29.heightGoal = u32.Position.Y
    local v36 = u29.thrusterLoopSound
    if v36 ~= nil then
        v36:Stop()
    end
    u29.maid:GiveTask(u9.Stepped:Connect(function(_, p37) --[[ Line: 160 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u16
            [3] = u29
            [4] = u20
            [5] = u24
            [6] = u30
            [7] = u11
            [8] = u25
        --]]
        local v38 = u32.CFrame
        local v39 = v38.Position
        local v40 = v38:VectorToObjectSpace(u32.AssemblyLinearVelocity)
        local v41, _, v42 = v38:ToOrientation()
        local v43 = u16:GetMoveVector()
        local v44 = v38.LookVector
        local v45 = v44.Z
        local v46 = v44.X
        local v47 = math.atan2(v45, v46)
        local v48 = u32.AssemblyLinearVelocity * Vector3.new(1.5, 0, 1.5)
        local v49 = v38:VectorToObjectSpace(v48).X
        local v50 = -math.sign(v49)
        local v51 = v48.Magnitude * v50
        local v52 = CFrame
        local v53 = CFrame.new(-v43.X, 0, 0)
        local v54 = v52.lookAt(v39, (v38 * v53).Position)
        local v55 = os.clock()
        local v56 = math.sin(v55) * 0.3 + 0
        local v57 = u29.holdingUp and not u29.holdingDown and 7 or (u29.holdingDown and not u29.holdingUp and -6 or 0)
        local v58 = u29
        local v59
        if u20.isGameServer() then
            local v60 = u29.heightGoal + v57 * p37
            v59 = math.clamp(v60, -100, 300)
        else
            v59 = u29.heightGoal + v57 * p37
        end
        v58.heightGoal = v59
        local v61 = u29.levitationPid:Calculate(p37, u29.heightGoal + v56, v39.Y)
        local v62 = v40.Z
        local v63 = u29.counterDriftPid:Calculate(p37, 0, v62)
        local v64 = 4 * -v43.Z
        local v65 = u29.pitchPid:Calculate(p37, v64, (math.deg(v42)))
        local v66 = v44:Dot(v54.LookVector)
        local v67 = math.acos(v66)
        local v68 = v44:Cross(v54.LookVector).Y
        local v69 = math.clamp(v68, -1, 1)
        local v70 = v67 * -math.round(v69)
        local v71 = v70 ~= v70 and 0 or v70
        local v72 = v43.Magnitude > 0.05
        local v73
        if v72 then
            local v74 = v47 + v71
            local v75 = math.deg(v74)
            local v76 = u29.yawPid
            local v77 = v43.X
            if math.abs(v77) <= 0.1 then
                v75 = math.deg(v47)
            end
            v73 = v76:Calculate(p37, v75, (math.deg(v47)))
        else
            v73 = 0
        end
        local v78 = 4 * (not v72 and 0 or -1 + 2 * ((v71 - -3.141592653589793) / 6.283185307179586))
        local v79 = u29.rollPid:Calculate(p37, v78, (math.deg(v41)))
        local v80 = -v43.Z
        local v81 = -u24 * 0.9
        local v82 = v81 + (u24 - v81) * ((v80 - -0.9) / 1.9)
        local v83 = u29.movePid:Calculate(p37, v82, v51)
        local v84 = u24
        local v85 = 0 + 0.4 * ((math.abs(v51) - 0) / (v84 - 0))
        if u29.windSound then
            u29.windSound.Volume = v85
        end
        if u29.holdingUp and not u29.holdingDown then
            local v86 = u29
            v86.enginePowerScale = v86.enginePowerScale + p37 * 0.98
        elseif u29.holdingDown and not u29.holdingDown then
            local v87 = u29
            v87.enginePowerScale = v87.enginePowerScale - p37 * 0.97
        else
            local v88 = u29
            v88.enginePowerScale = v88.enginePowerScale - p37 * 0.9
        end
        local v89 = u29
        local v90 = u29.enginePowerScale
        v89.enginePowerScale = math.clamp(v90, 0.95, 1)
        u29:setEnginePowerRatio(u29.enginePowerScale)
        if u30:GetAttribute("Dead") == true then
            u29.worldSpaceForce.Force = Vector3.new(0, 0, 0)
            u29.localSpaceForce.Force = Vector3.new(0, 0, 0)
            u29.angularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
            u29.maid:DoCleaning()
        else
            local v91 = u32.AssemblyMass
            local v92 = (u11:GetServerTimeNow() - u29.entryTime) / 1
            local v93 = math.clamp(v92, 0, 1)
            local v94 = u29.worldSpaceForce
            local v95 = v61 * v91 * v93
            v94.Force = Vector3.new(0, v95, 0)
            local v96 = u29.localSpaceForce
            local v97 = -v83 * v91
            local v98 = v63 * v91
            v96.Force = Vector3.new(v97, 0, v98)
            local v99 = u29.angularVelocity
            local v100 = v73 * u25
            v99.AngularVelocity = Vector3.new(v79, v100, v65)
        end
    end))
    u29.maid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["actionId"] = "balloon-up",
        ["action"] = "MoveMountUp",
        ["boundFunction"] = function(_, p101) --[[ Name: boundFunction, Line 257 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u18
                [3] = u32
                [4] = u29
            --]]
            if p101 == Enum.UserInputState.Begin then
                u3:playSound(u18.HOT_AIR_BALLOON_THRUSTER_START, {
                    ["volumeMultiplier"] = 0.8,
                    ["position"] = u32.Position
                })
                u29.holdingUp = true
                local v102 = u29.thrusterLoopSound
                if v102 ~= nil then
                    v102 = v102.IsPlaying
                end
                if not v102 then
                    local v103 = u29.thrusterLoopSound
                    if v103 ~= nil then
                        v103:Play()
                    end
                end
            elseif p101 == Enum.UserInputState.End then
                u29.holdingUp = false
                local v104 = u29.thrusterLoopSound
                if v104 ~= nil then
                    v104 = v104.IsPlaying
                end
                if v104 then
                    local v105 = u29.thrusterLoopSound
                    if v105 ~= nil then
                        v105:Stop()
                    end
                end
            end
            return Enum.ContextActionResult.Sink
        end,
        ["priority"] = Enum.ContextActionPriority.High.Value
    }))
    local v106 = u21.bindDownControls()
    u29.maid:GiveTask(v106.bindActionMaid)
    u29.maid:GiveTask(v106.shouldFlyDownRef.Changed:Connect(function(p107) --[[ Line: 293 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29.holdingDown = p107
        return u29.holdingDown
    end))
    u29.maid:GiveTask(u12.MoveMountButtonChange:connect(function(p108) --[[ Line: 297 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u29
            [3] = u14
        --]]
        local v109 = p108.direction
        if v109 == u15.UP then
            u29.holdingUp = p108.inputActionType == u14.PRESS
        elseif v109 == u15.DOWN then
            u29.holdingDown = p108.inputActionType == u14.PRESS
        end
    end))
    local u110 = u6.mount(u6.createElement("ScreenGui", {
        ["ResetOnSpawn"] = false
    }, { u6.createElement(u23, {
            ["vehicleModel"] = u30
        }) }), u8.LocalPlayer:WaitForChild("PlayerGui"))
    u29.maid:GiveTask(function() --[[ Line: 317 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u110
        --]]
        u6.unmount(u110)
    end)
end
function u26.onDisable(p111) --[[ Line: 321 ]]
    p111.maid:DoCleaning()
    local v112 = p111.windSound
    if v112 ~= nil then
        v112:Destroy()
    end
end
return {
    ["HotAirBalloonPilot"] = u26
}