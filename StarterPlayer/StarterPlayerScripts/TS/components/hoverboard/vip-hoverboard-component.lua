local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "promise-character").default
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.RunService
local u12 = v9.SoundService
local u13 = v9.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "draw")
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid")
local u24 = u10.LocalPlayer
local u25 = { CFrame.new(-2, 0, 0), CFrame.new(0, 0, 0), CFrame.new(2, 0, 0) }
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 49 ]]
        return "VipHoverboardComponent"
    end
})
u26.__index = u26
function u26.new(...) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(u29, p30) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u22
        [3] = u25
        [4] = u6
        [5] = u5
        [6] = u8
        [7] = u24
        [8] = u7
        [9] = u13
        [10] = u12
        [11] = u3
        [12] = u10
        [13] = u17
        [14] = u16
        [15] = u2
        [16] = u15
        [17] = u19
        [18] = u14
        [19] = u18
        [20] = u20
    --]]
    u29.hoverboard = p30
    u29.pitchPid = u23.new(-5, 5, 0.075, 0, 0)
    u29.yawPid = u23.new(-15, 15, 0.04, 0, 0)
    u29.rollPid = u23.new(-10, 10, 0.1, 0, 0)
    u29.counterDriftPid = u23.new(-10000, 10000, 2500, 1, 1)
    u29.levitationPid = u23.new(-300000, 300000, 16000, 750, 0)
    u29.movePid = u23.new(-4500, 4500, 100, 10, 0)
    u29.lastJumpTimestamp = 0
    local v31 = table.create(#u25)
    for v32, _ in u25 do
        local _ = v32 - 1
        v31[v32] = u22.ray(Ray.new())
    end
    u29.debugRays = v31
    u29.maid = u6.new()
    u29.abilityButtonMaid = u6.new()
    u29.spinning = false
    u29.largeJumpCooldown = -1
    u29.lastDirection = 0
    u29.effectEnabled = false
    u29.beamEffects = {}
    u29.moving = false
    u5.Debug("Got new VIP hoverboard at {@Location}", p30)
    u29.character = u8(u24.Character):expect()
    if not u29:isOwn() then
        return nil
    end
    u5.Debug("VIP Hoverboard belongs to local player")
    u29.character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    local v33 = u7("Attachment", {
        ["Parent"] = p30
    })
    u29.angularVelocity = u7("AngularVelocity", {
        ["MaxTorque"] = (1 / 0),
        ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
        ["Attachment0"] = v33,
        ["Parent"] = p30
    })
    u29.worldSpaceForce = u7("VectorForce", {
        ["Name"] = "WorldSpaceForce",
        ["ApplyAtCenterOfMass"] = true,
        ["RelativeTo"] = Enum.ActuatorRelativeTo.World,
        ["Attachment0"] = v33,
        ["Parent"] = p30
    })
    u29.localSpaceForce = u7("VectorForce", {
        ["Name"] = "LocalSpaceForce",
        ["ApplyAtCenterOfMass"] = true,
        ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
        ["Attachment0"] = v33,
        ["Parent"] = p30
    })
    u29.levitationPid:Debug("LevitationPID", u13)
    u29.counterDriftPid:Debug("CounterDriftPID", u13)
    u29.pitchPid:Debug("PitchPID", u13)
    u29.rollPid:Debug("RollPID", u13)
    u29.movePid:Debug("MovePID", u13)
    u29.yawPid:Debug("YawPID", u13)
    local v34 = RaycastParams.new()
    v34.FilterDescendantsInstances = { u13:FindFirstChild("Map"), u13:FindFirstChild("Lobby"), u13.Terrain }
    v34.FilterType = Enum.RaycastFilterType.Whitelist
    u29.raycastParams = v34
    u29.hoverSound = u7("Sound", {
        ["Name"] = "HoverSound",
        ["Looped"] = true,
        ["Playing"] = true,
        ["Volume"] = 1,
        ["SoundId"] = "rbxassetid://" .. tostring(7910584261),
        ["Parent"] = u12
    })
    u29.windSound = u7("Sound", {
        ["Name"] = "WindSound",
        ["Looped"] = true,
        ["Playing"] = true,
        ["Volume"] = 0.25,
        ["SoundId"] = "rbxassetid://" .. tostring(7910583431),
        ["Parent"] = u12
    })
    local v35 = u3:playAnimation(u10.LocalPlayer, u17:getAssetId(u16.HOVER_BOARD_JUMP))
    if v35 then
        task.delay(v35.Length, function() --[[ Line: 150 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            u29:setAnimationManually()
        end)
    end
    local v36 = u29.abilityButtonMaid
    local v37 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v38 = u15.HOVERBOARD_LONG_JUMP
    local v39 = {
        ["abilityType"] = "ItemPrimary",
        ["abilityButton"] = {
            ["icon"] = u19.VIP_HOVER_BOARD
        }
    }
    v36:GiveTask(v37:enableAbility(v38, v39):expect())
    u29.abilityButtonMaid:GiveTask(u14.AbilityUsed:connect(function(p40) --[[ Line: 161 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u10
            [3] = u29
        --]]
        if p40.ability == u15.HOVERBOARD_LONG_JUMP and p40.userCharacter == u10.LocalPlayer.Character then
            local v41 = u10.LocalPlayer.Character
            if v41 ~= nil then
                v41 = v41.PrimaryPart
            end
            local v42
            if v41 == nil then
                v42 = v41
            else
                v42 = v41.CFrame.LookVector.Unit * Vector3.new(1, 0, 1)
            end
            local v43 = v41.AssemblyMass
            local v44 = u10.LocalPlayer.Character
            if v44 ~= nil then
                v44 = v44.PrimaryPart
                if v44 ~= nil then
                    v44 = v44.AssemblyLinearVelocity
                end
            end
            local v45 = u10.LocalPlayer.Character
            if v45 ~= nil then
                v45 = v45.PrimaryPart
                if v45 ~= nil then
                    v45 = v45.AssemblyLinearVelocity.Magnitude
                end
            end
            if v42 then
                if v43 ~= 0 and (v43 == v43 and v43) then
                    if v45 == 0 or v45 ~= v45 then
                        v43 = v45
                    elseif v45 then
                        v43 = v44
                    else
                        v43 = v45
                    end
                end
            else
                v43 = v42
            end
            if v43 ~= 0 and (v43 == v43 and v43) then
                if v45 < 20 or v44.Y < 5 then
                    u29:spinHorizontal()
                    return
                end
                local v46 = u29.lastDirection
                if math.abs(v46) > 0.2 then
                    u29:sideTrick()
                    return
                end
                u29:spinVertical()
            end
        end
    end))
    u29.abilityButtonMaid:GiveTask(u14.EntityChangeHeldItem:connect(function(p47) --[[ Line: 215 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u20
            [3] = u29
        --]]
        local v48 = p47.entity:getInstance()
        local v49 = u18:getLocalPlayerEntity()
        if v49 ~= nil then
            v49 = v49:getInstance()
        end
        local v50 = v48 == v49
        if v50 then
            local v51 = p47.item
            if v51 ~= nil then
                v51 = v51.Name
            end
            v50 = v51 ~= u20.LOBBY_VIP_HOVERBOARD
        end
        if v50 then
            u29:Destroy()
        end
    end))
    task.spawn(function() --[[ Line: 233 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        local v52 = u29.hoverboard:WaitForChild("Board", 3)
        if v52 ~= nil then
            for v53, v54 in v52:GetDescendants() do
                local _ = v53 - 1
                if v54:IsA("Beam") then
                    local v55 = u29.beamEffects
                    table.insert(v55, v54)
                end
            end
        end
    end)
    u29.maid:GiveTask(u29.character.Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 249 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u3
            [3] = u10
            [4] = u17
            [5] = u16
        --]]
        if u29.spinning then
            return nil
        end
        if u29.character.Humanoid.MoveDirection.Magnitude > 0 and not u29.moving then
            u29.moving = true
            local v56 = u29.movementTrack
            if v56 ~= nil then
                v56:Stop()
            end
            local v57 = u29.movementTrack
            if v57 ~= nil then
                v57:Destroy()
            end
            u29.movementTrack = u3:playAnimation(u10.LocalPlayer, u17:getAssetId(u16.HOVER_BOARD_MOVE))
            if u29.animationModel then
                local v58 = u29.boardMovementTrack
                if v58 ~= nil then
                    v58:Stop()
                end
                local v59 = u29.boardMovementTrack
                if v59 ~= nil then
                    v59:Destroy()
                end
                u29.boardMovementTrack = u3:playAnimation(u29.animationModel, u17:getAssetId(u16.HOVERBOARD_MOVEMENT))
                return
            end
        elseif u29.character.Humanoid.MoveDirection.Magnitude == 0 and u29.moving then
            u29.moving = false
            local v60 = u29.movementTrack
            if v60 ~= nil then
                v60:Stop()
            end
            local v61 = u29.movementTrack
            if v61 ~= nil then
                v61:Destroy()
            end
            u29.movementTrack = u3:playAnimation(u10.LocalPlayer, u17:getAssetId(u16.HOVER_BOARD_IDLE))
            if u29.animationModel then
                local v62 = u29.boardMovementTrack
                if v62 ~= nil then
                    v62:Stop()
                end
                local v63 = u29.boardMovementTrack
                if v63 ~= nil then
                    v63:Destroy()
                end
                u29.boardMovementTrack = u3:playAnimation(u29.animationModel, u17:getAssetId(u16.HOVERBOARD_IDLE))
            end
        end
    end))
    u29.animationModel = u29.hoverboard:WaitForChild("viphoverboard", 3)
end
function u26.spinVertical(u64) --[[ Line: 301 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u3
        [3] = u17
        [4] = u16
        [5] = u11
    --]]
    local u65 = 0
    local u66 = u10.LocalPlayer.Character
    if not u66 then
        return nil
    end
    u64.spinning = true
    local v67 = u3:playAnimation(u10.LocalPlayer, u17:getAssetId(u16.HOVER_BOARD_JUMP))
    if v67 then
        task.delay(v67.Length, function() --[[ Line: 310 ]]
            --[[
            Upvalues:
                [1] = u64
            --]]
            u64:setAnimationManually()
        end)
    end
    task.delay(0.2, function() --[[ Line: 314 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u65
            [3] = u64
            [4] = u66
        --]]
        local u68 = nil
        u68 = u11.Heartbeat:Connect(function(p69) --[[ Line: 316 ]]
            --[[
            Upvalues:
                [1] = u65
                [2] = u64
                [3] = u68
                [4] = u66
            --]]
            if u65 > 0.5 then
                u64.spinning = false
                u68:Disconnect()
                return nil
            end
            u65 = u65 + p69
            u66:PivotTo(u66.PrimaryPart.CFrame * CFrame.Angles(0, 0, 12.566370614359172 * p69))
        end)
    end)
end
function u26.spinHorizontal(u70) --[[ Line: 330 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u3
        [3] = u17
        [4] = u16
        [5] = u11
    --]]
    local u71 = 0
    local u72 = u10.LocalPlayer.Character
    if not u72 then
        return nil
    end
    u70.spinning = true
    local v73 = u3:playAnimation(u10.LocalPlayer, u17:getAssetId(u16.HOVER_BOARD_JUMP))
    if v73 then
        task.delay(v73.Length, function() --[[ Line: 339 ]]
            --[[
            Upvalues:
                [1] = u70
            --]]
            u70:setAnimationManually()
        end)
    end
    task.delay(0.2, function() --[[ Line: 343 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u71
            [3] = u70
            [4] = u72
        --]]
        local u74 = nil
        u74 = u11.Heartbeat:Connect(function(p75) --[[ Line: 345 ]]
            --[[
            Upvalues:
                [1] = u71
                [2] = u70
                [3] = u74
                [4] = u72
            --]]
            if u71 > 0.5 then
                u70.spinning = false
                u74:Disconnect()
                return nil
            end
            u71 = u71 + p75
            local v76 = u70.lastDirection > 0 and -1 or 1
            u72:PivotTo(u72.PrimaryPart.CFrame * CFrame.Angles(0, v76 * 3.141592653589793 * 4 * p75, 0))
        end)
    end)
end
function u26.sideTrick(u77) --[[ Line: 360 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u3
        [3] = u17
        [4] = u16
        [5] = u11
    --]]
    local u78 = 0
    local u79 = u10.LocalPlayer.Character
    if not u79 then
        return nil
    end
    u77.spinning = true
    local v80 = u3:playAnimation(u10.LocalPlayer, u17:getAssetId(u16.HOVER_BOARD_JUMP))
    if v80 then
        task.delay(v80.Length, function() --[[ Line: 369 ]]
            --[[
            Upvalues:
                [1] = u77
            --]]
            u77:setAnimationManually()
        end)
    end
    task.delay(0.2, function() --[[ Line: 373 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u78
            [3] = u77
            [4] = u79
        --]]
        local u81 = nil
        u81 = u11.Heartbeat:Connect(function(p82) --[[ Line: 375 ]]
            --[[
            Upvalues:
                [1] = u78
                [2] = u81
                [3] = u77
                [4] = u79
            --]]
            if u78 > 0.5 then
                u81:Disconnect()
                u77.spinning = false
                return nil
            end
            u78 = u78 + p82
            local v83 = u77.lastDirection > 0 and -1 or 1
            u79:PivotTo(u79.PrimaryPart.CFrame * CFrame.Angles(v83 * 3.141592653589793 * 4 * p82, 0, 0))
        end)
    end)
end
function u26.SteppedUpdate(p84, p85) --[[ Line: 390 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u13
        [3] = u25
        [4] = u4
        [5] = u21
    --]]
    if not p84:isOwn() then
        return nil
    end
    if p84.spinning then
        return nil
    end
    local v86 = p84.hoverboard.CFrame
    local v87 = v86.Position
    local v88 = v86:VectorToObjectSpace(p84.hoverboard.AssemblyLinearVelocity)
    local v89, _, v90 = v86:ToOrientation()
    local v91 = p84.character.Humanoid
    local v92 = v91.MoveDirection
    local v93 = -v86:VectorToObjectSpace(v92).X
    local v94 = v86.LookVector
    local v95 = v94.Z
    local v96 = v94.X
    local v97 = math.atan2(v95, v96) + 1.5707963267948966
    local v98 = p84.hoverboard.AssemblyLinearVelocity * Vector3.new(1, 0, 1)
    local v99 = u10.LocalPlayer.Character
    if v99 ~= nil then
        v99 = v99.PrimaryPart
        if v99 ~= nil then
            v99 = v99.AssemblyLinearVelocity.Magnitude
        end
    end
    local v100 = v86:VectorToObjectSpace(v98).X
    local v101 = -math.sign(v100)
    local v102 = v98.Magnitude * v101
    p84.lastDirection = v86.LookVector:Dot(v92)
    local v103 = (os.clock() - 0) / 0.5
    local v104 = math.sin(v103) * 0.1 + 0 + 5
    local v105 = -v104
    local v106 = Vector3.new(0, v105, 0)
    local v107 = 0
    local v108 = {}
    local v109 = true
    local v110 = 0
    for v111, v112 in u25 do
        local _ = v111 - 1
        local v113 = u13:Raycast((v86 * v112).Position, v106, p84.raycastParams)
        local v114
        if v113 then
            v114 = v113.Position.Y
        else
            v114 = nil
        end
        if v114 ~= nil then
            v107 = v107 + 1
            v108[v107] = v114
        end
    end
    if #v108 > 0 then
        if #v108 == 0 then
            error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.")
        end
        local v115 = v108[1]
        for v116 = 2, #v108 do
            local v117 = v108[v116]
            local _ = v116 - 1
            if v117 >= v115 then
                v115 = v117
            end
        end
        v110 = p84.levitationPid:Calculate(p85, v115 + v104, v87.Y)
        local v118 = 1 - (1 - (0 + 1 * ((0.4 + 0.4 * ((v87.Y - v115 - 0) / (v104 - 0)) + (1 - (0.25 + 0.55 * ((v102 - 0) / 50))) - 0.65) / 0.9500000000000001)))
        local v119 = 1 - math.pow(v118, 3)
        p84.hoverSound.PlaybackSpeed = v119
    else
        v109 = false
    end
    local v120 = v88.Z
    local v121 = p84.counterDriftPid:Calculate(p85, 0, v120)
    local v122 = 15 * v93
    local v123 = p84.pitchPid:Calculate(p85, v122, (math.deg(v90)))
    local v124 = v86:VectorToObjectSpace(v92) * Vector3.new(1, 0, 1)
    local v125 = v124.Z
    local v126 = -v124.X
    local v127 = math.atan2(v125, v126)
    local v128 = v92.Magnitude > 0.05
    local v129
    if v128 then
        local v130 = (v97 + v127 - v97 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793 + v97
        local v131 = math.deg(v130)
        v129 = p84.yawPid:Calculate(p85, v131, (math.deg(v97)))
    else
        v129 = 0
    end
    local v132 = 25 * (not v128 and 0 or -1 + 2 * ((v127 - -3.141592653589793) / 6.283185307179586))
    local v133 = p84.rollPid:Calculate(p85, v132, (math.deg(v89)))
    local v134 = -45 + 95 * ((v93 - -0.9) / 1.9)
    local v135 = p84.movePid:Calculate(p85, v134, v102)
    local v136 = 0 + 0.5 * ((math.abs(v102) - 0) / 50)
    p84.windSound.Volume = v136
    local v137 = v91.Jump
    local v138
    if os.clock() - p84.lastJumpTimestamp >= 0.5 then
        v138 = v137 and v109
    else
        v138 = false
    end
    local v139 = u4.Controllers.SprintController:isSprinting()
    local v140 = u10.LocalPlayer.Character
    if v140 ~= nil then
        v140 = v140.PrimaryPart
        if v140 ~= nil then
            v140 = v140.AssemblyLinearVelocity.Magnitude
        end
    end
    if v138 and not v139 or v138 and p84.largeJumpCooldown > u13:GetServerTimeNow() then
        p84.hoverboard:ApplyImpulse(Vector3.new(0, 1250, 0))
        p84.lastJumpTimestamp = os.clock()
    elseif v139 and v138 then
        p84.largeJumpCooldown = u13:GetServerTimeNow() + 3
        local v141 = u10.LocalPlayer.Character
        if v141 ~= nil then
            v141 = v141.PrimaryPart
        end
        local v142
        if v141 == nil then
            v142 = v141
        else
            v142 = v141.CFrame.LookVector.Unit * Vector3.new(1, 0, 1)
        end
        local v143 = v141.AssemblyMass
        if v142 then
            if v143 == 0 or v143 ~= v143 then
                v140 = v143
            elseif not v143 then
                v140 = v143
            end
        else
            v140 = v142
        end
        if v140 ~= 0 and (v140 == v140 and v140) then
            local v144
            if v142 == nil then
                v144 = v142
            else
                v144 = v142.Z
            end
            local v145 = v142.Y
            local v146 = -v142.X
            local v147 = Vector3.new(v144, v145, v146) * (25 * v143) + Vector3.new(0, 1250, 0)
            u21.Client:Get("VipHoverBoardDash"):SendToServer({
                ["direction"] = v147
            })
            p84.hoverboard:ApplyImpulse(v147)
            p84.lastJumpTimestamp = os.clock() + 1
        end
    end
    p84.worldSpaceForce.Force = Vector3.new(0, v110, 0)
    local v148 = p84.localSpaceForce
    local v149 = -v135
    v148.Force = Vector3.new(v149, 0, v121)
    p84.angularVelocity.AngularVelocity = Vector3.new(v133, v129, v123)
end
function u26.setCharacterMassless(p150, p151) --[[ Line: 586 ]]
    for _, v152 in p150.character:GetDescendants() do
        if v152 ~= p150.hoverboard and v152:IsA("BasePart") then
            v152.Massless = p151
        end
    end
end
function u26.dismountHoverboard(_) --[[ Line: 596 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.Client:Get("DismountVipHoverboard"):SendToServer()
end
function u26.Destroy(p153) --[[ Line: 599 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    if not p153:isOwn() then
        return nil
    end
    u5.Debug("Local hoverboard destroyed")
    p153.character.HumanoidRootPart.Anchored = false
    local v154 = p153.character
    if v154 ~= nil then
        local v155 = v154.Humanoid
        if v155 ~= nil then
            v155:ChangeState(Enum.HumanoidStateType.Running)
        end
    end
    local v156 = p153.hoverSound
    if v156 ~= nil then
        v156:Destroy()
    end
    local v157 = p153.windSound
    if v157 ~= nil then
        v157:Destroy()
    end
    local v158 = p153.maid
    if v158 ~= nil then
        v158:DoCleaning()
    end
    local v159 = p153.abilityButtonMaid
    if v159 ~= nil then
        v159:DoCleaning()
    end
    local v160 = p153.movementTrack
    if v160 ~= nil then
        v160:Stop()
    end
    local v161 = p153.movementTrack
    if v161 ~= nil then
        v161:Destroy()
    end
end
function u26.isOwn(p162) --[[ Line: 638 ]]
    return p162.hoverboard.Parent == p162.character
end
function u26.enableBeams(p163) --[[ Line: 641 ]]
    p163.effectEnabled = true
    for v164, v165 in p163.beamEffects do
        local _ = v164 - 1
        v165.Enabled = true
    end
end
function u26.disableBeams(p166) --[[ Line: 651 ]]
    p166.effectEnabled = false
    for v167, v168 in p166.beamEffects do
        local _ = v167 - 1
        v168.Enabled = false
    end
end
function u26.setAnimationManually(p169) --[[ Line: 661 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u10
        [3] = u17
        [4] = u16
    --]]
    if p169.character.Humanoid.MoveDirection.Magnitude == 0 then
        p169.moving = false
        local v170 = p169.movementTrack
        if v170 ~= nil then
            v170:Stop()
        end
        local v171 = p169.movementTrack
        if v171 ~= nil then
            v171:Destroy()
        end
        p169.movementTrack = u3:playAnimation(u10.LocalPlayer, u17:getAssetId(u16.HOVER_BOARD_IDLE))
        if p169.animationModel then
            local v172 = p169.boardMovementTrack
            if v172 ~= nil then
                v172:Stop()
            end
            local v173 = p169.boardMovementTrack
            if v173 ~= nil then
                v173:Destroy()
            end
            p169.boardMovementTrack = u3:playAnimation(p169.animationModel, u17:getAssetId(u16.HOVERBOARD_IDLE))
            return
        end
    else
        p169.moving = true
        local v174 = p169.movementTrack
        if v174 ~= nil then
            v174:Stop()
        end
        local v175 = p169.movementTrack
        if v175 ~= nil then
            v175:Destroy()
        end
        p169.movementTrack = u3:playAnimation(u10.LocalPlayer, u17:getAssetId(u16.HOVER_BOARD_MOVE))
        if p169.animationModel then
            local v176 = p169.boardMovementTrack
            if v176 ~= nil then
                v176:Stop()
            end
            local v177 = p169.boardMovementTrack
            if v177 ~= nil then
                v177:Destroy()
            end
            p169.boardMovementTrack = u3:playAnimation(p169.animationModel, u17:getAssetId(u16.HOVERBOARD_MOVEMENT))
        end
    end
end
u26.Tag = "VipHoverboard"
return u26