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
local u24 = v1.import(script, script.Parent.Parent.Parent, "mount", "mount-flight-controls").MountFlightControls
local u25 = v1.import(script, script.Parent.Parent, "vehicle-client").VehicleClient
local _ = { CFrame.new(-2, 0, 0), CFrame.new(0, 0, 0), CFrame.new(2, 0, 0) }
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 41 ]]
        return "UfoPilotClient"
    end,
    ["__index"] = u25
})
u26.__index = u26
function u26.new(...) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(u29, u30) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u6
        [3] = u22
        [4] = u14
        [5] = u11
        [6] = u7
        [7] = u13
        [8] = u12
        [9] = u20
        [10] = u23
        [11] = u24
        [12] = u15
        [13] = u18
        [14] = u17
        [15] = u3
        [16] = u4
        [17] = u8
        [18] = u19
    --]]
    u25.constructor(u29, u30)
    u29.maid = u6.new()
    u29.pitchPid = u22.new(-5, 5, 0.09, 0, 0.03)
    u29.yawPid = u22.new(-40, 40, 0.022, 0, 0)
    u29.rollPid = u22.new(-10, 10, 0.1, 0, 0)
    u29.counterDriftPid = u22.new(-50, 50, 35, 0, 1)
    u29.levitationPid = u22.new(-200, 400, 20, 30, 0)
    u29.movePid = u22.new(-30, 30, 4, 0.6, 0)
    u29.heightGoal = 0
    u29.holdingUp = false
    u29.holdingDown = false
    u29.entryTime = u14:GetServerTimeNow()
    u29.enginePowerScale = 1
    u29.maid = u6.new()
    local v31 = u11.LocalPlayer.Character
    if v31 then
        if v31:FindFirstChild("Humanoid") then
            local u32 = u30:FindFirstChild("Root")
            if u32 then
                if u14.CurrentCamera then
                    u14.CurrentCamera.CameraSubject = u32
                    u11.LocalPlayer.CameraMaxZoomDistance = 32
                    u11.LocalPlayer.CameraMinZoomDistance = 32
                    u29.maid:GiveTask(function() --[[ Line: 82 ]]
                        --[[
                        Upvalues:
                            [1] = u11
                            [2] = u14
                        --]]
                        u11.LocalPlayer.CameraMaxZoomDistance = 14
                        u11.LocalPlayer.CameraMinZoomDistance = 0
                        local v33 = u11.LocalPlayer.Character
                        if v33 ~= nil then
                            v33 = v33:FindFirstChild("Humanoid")
                        end
                        u14.CurrentCamera.CameraSubject = v33
                    end)
                end
                local u34 = u7("Attachment", {
                    ["Parent"] = u32
                })
                u29.maid:GiveTask(function() --[[ Line: 96 ]]
                    --[[
                    Upvalues:
                        [1] = u34
                    --]]
                    u34:Destroy()
                end)
                u29.angularVelocity = u7("AngularVelocity", {
                    ["MaxTorque"] = (1 / 0),
                    ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
                    ["Attachment0"] = u34,
                    ["Parent"] = u32
                })
                u29.maid:GiveTask(function() --[[ Line: 105 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                    --]]
                    u29.angularVelocity:Destroy()
                end)
                u29.worldSpaceForce = u7("VectorForce", {
                    ["Name"] = "WorldSpaceForce",
                    ["ApplyAtCenterOfMass"] = true,
                    ["RelativeTo"] = Enum.ActuatorRelativeTo.World,
                    ["Attachment0"] = u34,
                    ["Parent"] = u30
                })
                u29.maid:GiveTask(function() --[[ Line: 115 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                    --]]
                    u29.worldSpaceForce:Destroy()
                end)
                u29.localSpaceForce = u7("VectorForce", {
                    ["Name"] = "LocalSpaceForce",
                    ["ApplyAtCenterOfMass"] = true,
                    ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
                    ["Attachment0"] = u34,
                    ["Parent"] = u32
                })
                u29.maid:GiveTask(function() --[[ Line: 125 ]]
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
                u29.windSound = u7("Sound", {
                    ["Name"] = "WindSound",
                    ["Looped"] = true,
                    ["Playing"] = true,
                    ["Volume"] = 0.25,
                    ["SoundId"] = "rbxassetid://" .. tostring(7910583431),
                    ["Parent"] = u13
                })
                u29.heightGoal = u32.Position.Y + 30
                u29.maid:GiveTask(u12.Stepped:Connect(function(_, p35) --[[ Line: 150 ]]
                    --[[
                    Upvalues:
                        [1] = u32
                        [2] = u20
                        [3] = u29
                        [4] = u23
                        [5] = u30
                        [6] = u14
                    --]]
                    local v36 = u32.CFrame
                    local v37 = v36.Position
                    local v38 = v36:VectorToObjectSpace(u32.AssemblyLinearVelocity)
                    local v39, _, v40 = v36:ToOrientation()
                    local v41 = u20:GetMoveVector()
                    local v42 = v36.LookVector
                    local v43 = v42.Z
                    local v44 = v42.X
                    local v45 = math.atan2(v43, v44)
                    local v46 = u32.AssemblyLinearVelocity * Vector3.new(1, 0, 1)
                    local v47 = v36:VectorToObjectSpace(v46).X
                    local v48 = -math.sign(v47)
                    local v49 = v46.Magnitude * v48
                    local v50 = CFrame
                    local v51 = CFrame.new(-v41.X, 0, 0)
                    local v52 = v50.lookAt(v37, (v36 * v51).Position)
                    local v53 = os.clock()
                    local v54 = math.sin(v53) * 0.7 + 0
                    local v55 = u29.holdingUp and not u29.holdingDown and 20 or (u29.holdingDown and not u29.holdingUp and -20 or 0)
                    local v56 = u29
                    local v57
                    if u23.isGameServer() then
                        local v58 = u29.heightGoal + v55 * p35
                        v57 = math.clamp(v58, -50, 200)
                    else
                        v57 = u29.heightGoal + v55 * p35
                    end
                    v56.heightGoal = v57
                    local v59 = u29.levitationPid:Calculate(p35, u29.heightGoal + v54, v37.Y)
                    local v60 = v38.Z
                    local v61 = u29.counterDriftPid:Calculate(p35, 0, v60)
                    local v62 = 30 * -v41.Z
                    local v63 = u29.pitchPid:Calculate(p35, v62, (math.deg(v40)))
                    local v64 = v42:Dot(v52.LookVector)
                    local v65 = math.acos(v64)
                    local v66 = v42:Cross(v52.LookVector).Y
                    local v67 = math.clamp(v66, -1, 1)
                    local v68 = v65 * -math.round(v67)
                    local v69 = v68 ~= v68 and 0 or v68
                    local v70 = v41.Magnitude > 0.05
                    local v71
                    if v70 then
                        local v72 = v45 + v69
                        local v73 = math.deg(v72)
                        local v74 = u29.yawPid
                        local v75 = v41.X
                        if math.abs(v75) <= 0.1 then
                            v73 = math.deg(v45)
                        end
                        v71 = v74:Calculate(p35, v73, (math.deg(v45)))
                    else
                        v71 = 0
                    end
                    local v76 = 30 * (not v70 and 0 or -1 + 2 * ((v69 - -3.141592653589793) / 6.283185307179586))
                    local v77 = u29.rollPid:Calculate(p35, v76, (math.deg(v39)))
                    local v78 = -63 + 133 * ((-v41.Z - -0.9) / 1.9)
                    local v79 = u29.movePid:Calculate(p35, v78, v49)
                    local v80 = 0 + 0.5 * ((math.abs(v49) - 0) / 70)
                    if u29.windSound then
                        u29.windSound.Volume = v80
                    end
                    if u29.holdingUp and not u29.holdingDown then
                        local v81 = u29
                        v81.enginePowerScale = v81.enginePowerScale + p35 * 0.98
                    elseif u29.holdingDown and not u29.holdingDown then
                        local v82 = u29
                        v82.enginePowerScale = v82.enginePowerScale - p35 * 0.9
                    else
                        local v83 = u29
                        v83.enginePowerScale = v83.enginePowerScale - p35 * 0.9
                    end
                    local v84 = u29
                    local v85 = u29.enginePowerScale
                    v84.enginePowerScale = math.clamp(v85, 0.95, 1)
                    u29:setEnginePowerRatio(u29.enginePowerScale)
                    if u30:GetAttribute("Dead") == true then
                        u29.worldSpaceForce.Force = Vector3.new(0, 0, 0)
                        u29.localSpaceForce.Force = Vector3.new(0, 0, 0)
                        u29.angularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
                    else
                        local v86 = u32.AssemblyMass
                        local v87 = (u14:GetServerTimeNow() - u29.entryTime) / 1
                        local v88 = math.clamp(v87, 0, 1)
                        local v89 = u29.worldSpaceForce
                        local v90 = v59 * v86 * v88
                        v89.Force = Vector3.new(0, v90, 0)
                        local v91 = u29.localSpaceForce
                        local v92 = -v79 * v86
                        local v93 = v61 * v86
                        v91.Force = Vector3.new(v92, 0, v93)
                        u29.angularVelocity.AngularVelocity = Vector3.new(v77, v71, v63)
                    end
                end))
                local v94 = u24.bindUpDownControls()
                u29.maid:GiveTask(v94.bindActionMaid)
                u29.maid:GiveTask(v94.shouldFlyUpRef.Changed:Connect(function(p95) --[[ Line: 245 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                    --]]
                    u29.holdingUp = p95
                    return u29.holdingUp
                end))
                u29.maid:GiveTask(v94.shouldFlyDownRef.Changed:Connect(function(p96) --[[ Line: 249 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                    --]]
                    u29.holdingDown = p96
                    return u29.holdingDown
                end))
                u29:setupUfoBeam(u30, u32)
                u29.maid:GiveTask(u15.MoveMountButtonChange:connect(function(p97) --[[ Line: 254 ]]
                    --[[
                    Upvalues:
                        [1] = u18
                        [2] = u29
                        [3] = u17
                    --]]
                    local v98 = p97.direction
                    if v98 == u18.UP then
                        u29.holdingUp = p97.inputActionType == u17.PRESS
                    elseif v98 == u18.DOWN then
                        u29.holdingDown = p97.inputActionType == u17.PRESS
                    end
                end))
                if u3.isMobileControls() then
                    u4.Controllers.MobileUiController:toggleMountMovementControls(true)
                    u29.maid:GiveTask(function() --[[ Line: 269 ]]
                        --[[
                        Upvalues:
                            [1] = u4
                        --]]
                        return u4.Controllers.MobileUiController:toggleMountMovementControls(false)
                    end)
                else
                    local u99 = u8.mount(u8.createElement("ScreenGui", {
                        ["ResetOnSpawn"] = false
                    }, { u8.createElement(u19) }), u11.LocalPlayer:WaitForChild("PlayerGui"))
                    u29.maid:GiveTask(function() --[[ Line: 278 ]]
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
function u26.setupUfoBeam(p100, u101, _) --[[ Line: 283 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u2
        [3] = u12
        [4] = u15
        [5] = u5
        [6] = u10
    --]]
    local u102 = nil
    local u103 = 0
    local function u105() --[[ Line: 286 ]]
        --[[
        Upvalues:
            [1] = u103
            [2] = u101
            [3] = u21
        --]]
        local v104 = time()
        if v104 - u103 < 0.25 then
            return nil
        end
        if u101:GetAttribute("Dead") or u101:GetAttribute("TractorBeamEnergy") <= 0 then
            return nil
        end
        u103 = v104
        u21.Client:GetNamespace("Ufo"):Get("TractorBeamEvent"):SendToServer()
    end
    local v107 = {
        ["action"] = "Attack",
        ["actionId"] = "ufo-attack",
        ["boundFunction"] = function(_, p106, _) --[[ Name: boundFunction, Line 301 ]]
            --[[
            Upvalues:
                [1] = u102
                [2] = u12
                [3] = u105
            --]]
            if p106 == Enum.UserInputState.Begin then
                if not u102 then
                    u102 = u12.Heartbeat:Connect(u105)
                    return
                end
            elseif p106 == Enum.UserInputState.End and u102 then
                u102:Disconnect()
                u102 = nil
            end
        end
    }
    local v108 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction(v107)
    p100.maid:GiveTask(v108)
    p100.maid:GiveTask(u15.MobileSwordButtonPressed:setPriority(u5.HIGH):connect(function(p109) --[[ Line: 315 ]]
        --[[
        Upvalues:
            [1] = u102
            [2] = u12
            [3] = u105
        --]]
        p109:setCancelled(true)
        if p109.state == "down" then
            if not u102 then
                u102 = u12.Heartbeat:Connect(u105)
                return
            end
        elseif u102 then
            u102:Disconnect()
            u102 = nil
        end
    end))
    p100.maid:GiveTask(function() --[[ Line: 328 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u102
        --]]
        u10:UnbindAction("ufo-attack")
        if u102 then
            u102:Disconnect()
        end
    end)
end
function u26.onDisable(p110) --[[ Line: 335 ]]
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
    ["UfoPilotClient"] = u26
}