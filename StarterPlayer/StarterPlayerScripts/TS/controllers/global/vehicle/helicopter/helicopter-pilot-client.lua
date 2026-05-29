local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.ContextActionService
local u11 = v9.Players
local u12 = v9.RunService
local u13 = v9.SoundService
local u14 = v9.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v16 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "movement", "event", "move-mount-event")
local u17 = v16.InputActionType
local u18 = v16.MoveMountDirection
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "movement", "move-mount-ui").MoveMountUI
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "player-control-module")
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid")
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local v24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "helicopter", "helicopter-missile")
local u25 = v24.HelicopterMissile
local u26 = v24.MISSILE_FIRE_RATE
local u27 = v1.import(script, script.Parent.Parent.Parent, "mount", "mount-flight-controls").MountFlightControls
local u28 = v1.import(script, script.Parent.Parent, "vehicle-client").VehicleClient
local _ = { CFrame.new(-2, 0, 0), CFrame.new(0, 0, 0), CFrame.new(2, 0, 0) }
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 43 ]]
        return "HelicopterPilotClient"
    end,
    ["__index"] = u28
})
u29.__index = u29
function u29.new(...) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(u32, u33, p34) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u6
        [3] = u22
        [4] = u14
        [5] = u11
        [6] = u7
        [7] = u13
        [8] = u12
        [9] = u20
        [10] = u23
        [11] = u27
        [12] = u15
        [13] = u18
        [14] = u17
        [15] = u3
        [16] = u4
        [17] = u8
        [18] = u19
    --]]
    u28.constructor(u32, u33)
    u32.maid = u6.new()
    u32.pitchPid = u22.new(-5, 5, 0.04, 0, 0.03)
    u32.yawPid = u22.new(-10, 10, 0.009, 0, 0)
    u32.rollPid = u22.new(-10, 10, 0.07, 0, 0)
    u32.counterDriftPid = u22.new(-50, 50, 25, 0, 1)
    u32.levitationPid = u22.new(-400, 400, 20, 30, 0)
    u32.movePid = u22.new(-30, 30, 4, 0.5, 0)
    u32.heightGoal = 0
    u32.holdingUp = false
    u32.holdingDown = false
    u32.entryTime = u14:GetServerTimeNow()
    u32.enginePowerScale = 0.6
    u32.maid = u6.new()
    local v35 = u11.LocalPlayer.Character
    if not v35 then
        return nil
    end
    if not v35:FindFirstChild("Humanoid") then
        return nil
    end
    local u36 = u33:FindFirstChild("Root")
    if not u36 then
        return nil
    end
    if u14.CurrentCamera then
        u14.CurrentCamera.CameraSubject = u36
        u11.LocalPlayer.CameraMaxZoomDistance = 20
        u11.LocalPlayer.CameraMinZoomDistance = 20
        u32.maid:GiveTask(function() --[[ Line: 84 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u14
            --]]
            u11.LocalPlayer.CameraMaxZoomDistance = 14
            u11.LocalPlayer.CameraMinZoomDistance = 0
            local v37 = u11.LocalPlayer.Character
            if v37 ~= nil then
                v37 = v37:FindFirstChild("Humanoid")
            end
            u14.CurrentCamera.CameraSubject = v37
        end)
    end
    local u38 = u7("Attachment", {
        ["Parent"] = u36
    })
    u32.maid:GiveTask(function() --[[ Line: 98 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        u38:Destroy()
    end)
    u32.angularVelocity = u7("AngularVelocity", {
        ["MaxTorque"] = (1 / 0),
        ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
        ["Attachment0"] = u38,
        ["Parent"] = u36
    })
    u32.maid:GiveTask(function() --[[ Line: 107 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32.angularVelocity:Destroy()
    end)
    u32.worldSpaceForce = u7("VectorForce", {
        ["Name"] = "WorldSpaceForce",
        ["ApplyAtCenterOfMass"] = true,
        ["RelativeTo"] = Enum.ActuatorRelativeTo.World,
        ["Attachment0"] = u38,
        ["Parent"] = u33
    })
    u32.maid:GiveTask(function() --[[ Line: 117 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32.worldSpaceForce:Destroy()
    end)
    u32.localSpaceForce = u7("VectorForce", {
        ["Name"] = "LocalSpaceForce",
        ["ApplyAtCenterOfMass"] = true,
        ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
        ["Attachment0"] = u38,
        ["Parent"] = u36
    })
    u32.maid:GiveTask(function() --[[ Line: 127 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32.localSpaceForce:Destroy()
    end)
    u32.levitationPid:Debug("LevitationPID", u14)
    u32.counterDriftPid:Debug("CounterDriftPID", u14)
    u32.pitchPid:Debug("PitchPID", u14)
    u32.rollPid:Debug("RollPID", u14)
    u32.movePid:Debug("MovePID", u14)
    u32.yawPid:Debug("YawPID", u14)
    u32.maid:GiveTask(u32.levitationPid)
    u32.maid:GiveTask(u32.counterDriftPid)
    u32.maid:GiveTask(u32.pitchPid)
    u32.maid:GiveTask(u32.rollPid)
    u32.maid:GiveTask(u32.movePid)
    u32.maid:GiveTask(u32.yawPid)
    u32.windSound = u7("Sound", {
        ["Name"] = "WindSound",
        ["Looped"] = true,
        ["Playing"] = true,
        ["Volume"] = 0.25,
        ["SoundId"] = "rbxassetid://" .. tostring(7910583431),
        ["Parent"] = u13
    })
    u32.heightGoal = u36.Position.Y
    u32.maid:GiveTask(u12.Stepped:Connect(function(_, p39) --[[ Line: 151 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u20
            [3] = u32
            [4] = u23
            [5] = u33
            [6] = u14
        --]]
        local v40 = u36.CFrame
        local v41 = v40.Position
        local v42 = v40:VectorToObjectSpace(u36.AssemblyLinearVelocity)
        local v43, _, v44 = v40:ToOrientation()
        local v45 = u20:GetMoveVector()
        local v46 = v40.LookVector
        local v47 = v46.Z
        local v48 = v46.X
        local v49 = math.atan2(v47, v48)
        local v50 = u36.AssemblyLinearVelocity * Vector3.new(1, 0, 1)
        local v51 = v40:VectorToObjectSpace(v50).X
        local v52 = -math.sign(v51)
        local v53 = v50.Magnitude * v52
        local v54 = CFrame
        local v55 = CFrame.new(-v45.X, 0, 0)
        local v56 = v54.lookAt(v41, (v40 * v55).Position)
        local v57 = os.clock()
        local v58 = math.sin(v57) * 0.7 + 0
        local v59 = u32.holdingUp and not u32.holdingDown and 10 or (u32.holdingDown and not u32.holdingUp and -9 or 0)
        local v60 = u32
        local v61
        if u23.isGameServer() then
            local v62 = u32.heightGoal + v59 * p39
            v61 = math.clamp(v62, -50, 200)
        else
            v61 = u32.heightGoal + v59 * p39
        end
        v60.heightGoal = v61
        local v63 = u32.levitationPid:Calculate(p39, u32.heightGoal + v58, v41.Y)
        local v64 = v42.Z
        local v65 = u32.counterDriftPid:Calculate(p39, 0, v64)
        local v66 = 15 * -v45.Z
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
        local v80 = 25 * (not v74 and 0 or -1 + 2 * ((v73 - -3.141592653589793) / 6.283185307179586))
        local v81 = u32.rollPid:Calculate(p39, v80, (math.deg(v43)))
        local v82 = -36 + 76 * ((-v45.Z - -0.9) / 1.9)
        local v83 = u32.movePid:Calculate(p39, v82, v53)
        local v84 = 0 + 0.5 * ((math.abs(v53) - 0) / 40)
        if u32.windSound then
            u32.windSound.Volume = v84
        end
        if u32.holdingUp and not u32.holdingDown then
            local v85 = u32
            v85.enginePowerScale = v85.enginePowerScale + p39 * 0.4
        elseif u32.holdingDown and not u32.holdingDown then
            local v86 = u32
            v86.enginePowerScale = v86.enginePowerScale - p39 * 0.3
        else
            local v87 = u32
            v87.enginePowerScale = v87.enginePowerScale - p39 * 0.3
        end
        local v88 = u32
        local v89 = u32.enginePowerScale
        v88.enginePowerScale = math.clamp(v89, 0.6, 1)
        u32:setEnginePowerRatio(u32.enginePowerScale)
        if u33:GetAttribute("Dead") == true then
            u32.worldSpaceForce.Force = Vector3.new(0, 0, 0)
            u32.localSpaceForce.Force = Vector3.new(0, 0, 0)
            u32.angularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
        else
            local v90 = u36.AssemblyMass
            local v91 = (u14:GetServerTimeNow() - u32.entryTime) / 1
            local v92 = math.clamp(v91, 0, 1)
            local v93 = u32.worldSpaceForce
            local v94 = v63 * v90 * v92
            v93.Force = Vector3.new(0, v94, 0)
            local v95 = u32.localSpaceForce
            local v96 = -v83 * v90
            local v97 = v65 * v90
            v95.Force = Vector3.new(v96, 0, v97)
            u32.angularVelocity.AngularVelocity = Vector3.new(v81, v75, v67)
        end
    end))
    local v98 = u27.bindUpDownControls()
    u32.maid:GiveTask(v98.bindActionMaid)
    u32.maid:GiveTask(v98.shouldFlyUpRef.Changed:Connect(function(p99) --[[ Line: 246 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32.holdingUp = p99
        return u32.holdingUp
    end))
    u32.maid:GiveTask(v98.shouldFlyDownRef.Changed:Connect(function(p100) --[[ Line: 250 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32.holdingDown = p100
        return u32.holdingDown
    end))
    u32.maid:GiveTask(u15.MoveMountButtonChange:connect(function(p101) --[[ Line: 254 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u32
            [3] = u17
        --]]
        local v102 = p101.direction
        if v102 == u18.UP then
            u32.holdingUp = p101.inputActionType == u17.PRESS
        elseif v102 == u18.DOWN then
            u32.holdingDown = p101.inputActionType == u17.PRESS
        end
    end))
    if u3.isMobileControls() then
        u4.Controllers.MobileUiController:toggleMountMovementControls(true)
        u32.maid:GiveTask(function() --[[ Line: 269 ]]
            --[[
            Upvalues:
                [1] = u4
            --]]
            return u4.Controllers.MobileUiController:toggleMountMovementControls(false)
        end)
    else
        local u103 = u8.mount(u8.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u8.createElement(u19) }), u11.LocalPlayer:WaitForChild("PlayerGui"))
        u32.maid:GiveTask(function() --[[ Line: 278 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u103
            --]]
            u8.unmount(u103)
        end)
    end
    if p34 then
        u32:setupAttackHeli(u33, u36)
    end
end
function u29.setupAttackHeli(p104, u105, u106) --[[ Line: 286 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u11
        [3] = u21
        [4] = u26
        [5] = u2
        [6] = u12
        [7] = u15
        [8] = u5
        [9] = u10
    --]]
    local u107 = nil
    local u108 = 0
    local u109 = Random.new()
    local function u118() --[[ Line: 290 ]]
        --[[
        Upvalues:
            [1] = u109
            [2] = u106
            [3] = u25
            [4] = u11
            [5] = u21
        --]]
        local v110 = u109:NextNumber() < 0.5 and -1 or 1
        local v111 = u109:NextNumber(2.5, 6) * v110
        local v112 = u106.CFrame
        local v113 = CFrame.Angles(0, 1.5707963267948966, 0)
        local v114 = CFrame.new(v111, -3, -2)
        local v115 = v112 * v113 * v114
        local v116 = v115.Position
        local v117 = v115.LookVector
        u25.new(v116, v117, u11.LocalPlayer):fire(0, function() --[[ Line: 300 ]] end)
        u21.Client:GetNamespace("Helicopter"):Get("FireMissile"):SendToServer(v116, v117)
    end
    local function u120() --[[ Line: 303 ]]
        --[[
        Upvalues:
            [1] = u108
            [2] = u26
            [3] = u105
            [4] = u118
        --]]
        local v119 = time()
        if v119 - u108 < u26 then
            return nil
        end
        if u105:GetAttribute("Dead") or u105:GetAttribute("AttackEnergy") <= 0 then
            return nil
        end
        u108 = v119
        u118()
    end
    local v122 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["action"] = "Attack",
        ["actionId"] = "helicopter-attack",
        ["boundFunction"] = function(_, p121, _) --[[ Name: boundFunction, Line 318 ]]
            --[[
            Upvalues:
                [1] = u107
                [2] = u12
                [3] = u120
            --]]
            if p121 == Enum.UserInputState.Begin then
                if not u107 then
                    u107 = u12.Heartbeat:Connect(u120)
                    return
                end
            elseif p121 == Enum.UserInputState.End and u107 then
                u107:Disconnect()
                u107 = nil
            end
        end,
        ["priority"] = Enum.ContextActionPriority.High.Value
    })
    p104.maid:GiveTask(v122)
    p104.maid:GiveTask(u15.MobileSwordButtonPressed:setPriority(u5.HIGH):connect(function(p123) --[[ Line: 333 ]]
        --[[
        Upvalues:
            [1] = u107
            [2] = u12
            [3] = u120
        --]]
        p123:setCancelled(true)
        if p123.state == "down" then
            if not u107 then
                u107 = u12.Heartbeat:Connect(u120)
                return
            end
        elseif u107 then
            u107:Disconnect()
            u107 = nil
        end
    end))
    p104.maid:GiveTask(function() --[[ Line: 346 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u107
        --]]
        u10:UnbindAction("helicopter-attack")
        if u107 then
            u107:Disconnect()
        end
    end)
end
function u29.onDisable(p124) --[[ Line: 353 ]]
    p124.maid:DoCleaning()
    local v125 = p124.hoverSound
    if v125 ~= nil then
        v125:Destroy()
    end
    local v126 = p124.windSound
    if v126 ~= nil then
        v126:Destroy()
    end
end
return {
    ["HelicopterPilotClient"] = u29
}