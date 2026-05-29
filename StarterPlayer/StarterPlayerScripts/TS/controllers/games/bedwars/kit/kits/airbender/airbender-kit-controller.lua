local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local v4 = v2.ConstantManager
local u5 = v2.GameQueryUtil
local u6 = v2.MathExtras
local u7 = v2.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.CollectionService
local u15 = v13.Players
local u16 = v13.ReplicatedStorage
local u17 = v13.RunService
local u18 = v13.Workspace
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "airbender", "airbender-kit-balance").AirbenderKitBalance
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "airbender", "airbender-kit-util").AirbenderKitUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u34 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u35 = v4.registerConstants(script, {
    ["groundForceMultiplier"] = u28.GROUND_FORCE_MULTIPLIER,
    ["airForceMultiplier"] = u28.AIR_FORCE_MULTIPLIER
})
local u36 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 44 ]]
        return "AirbenderKitController"
    end,
    ["__index"] = u34
})
u36.__index = u36
function u36.new(...) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u36
    --]]
    local v37 = u36
    local v38 = setmetatable({}, v37)
    return v38:constructor(...) or v38
end
function u36.constructor(p39) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u34
        [2] = u27
    --]]
    u34.constructor(p39, u27.AIRBENDER)
    p39.Name = "AirbenderKitController"
    p39.tornadoes = {}
    p39.tornadoesLocalPlayerIsIn = {}
end
function u36.KnitStart(p40) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u34
    --]]
    u34.KnitStart(p40)
end
function u36.onKitLocalActivated(_, _) --[[ Line: 63 ]] end
function u36.onKitLocalDeactivated(_) --[[ Line: 65 ]] end
function u36.onKitReplicationActivated(u41, p42) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u15
        [3] = u17
        [4] = u25
        [5] = u33
        [6] = u32
        [7] = u35
        [8] = u20
        [9] = u9
        [10] = u14
        [11] = u5
    --]]
    p42:GiveTask(u30.Client:Get("Airbender_PlayerEnteredTornado"):Connect(function(p43) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u41
        --]]
        if p43.player ~= u15.LocalPlayer then
            return nil
        end
        local v44 = u41:getTornadoData(p43.tornadoUUID)
        if not v44 then
            return nil
        end
        if not v44.alive then
            return nil
        end
        local v45 = nil
        for v46, v47 in u41.tornadoesLocalPlayerIsIn do
            local _ = v46 - 1
            if v47.uuid == v44.uuid == true then
                v45 = v47
                break
            end
        end
        if v45 then
            return nil
        end
        local v48 = u41.tornadoesLocalPlayerIsIn
        table.insert(v48, v44)
        if u41.vectorForce ~= nil and (u41.vectorForce.Parent ~= nil and not u41.vectorForce.Enabled) then
            u41.vectorForce.Enabled = true
        end
        local v49 = u41.vectorForce == nil
        if not v49 then
            local v50 = u41.vectorForce
            if v50 ~= nil then
                v50 = v50.Parent
            end
            v49 = v50 == nil
        end
        if v49 then
            u41:createVectorForce()
        end
    end))
    p42:GiveTask(u30.Client:Get("Airbender_PlayerExitedTornado"):Connect(function(p51) --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u41
        --]]
        if p51.player ~= u15.LocalPlayer then
            return nil
        end
        local v52 = 0
        local v53 = {}
        for v54, v55 in u41.tornadoesLocalPlayerIsIn do
            local _ = v54 - 1
            if v55.uuid ~= p51.tornadoUUID == true then
                v52 = v52 + 1
                v53[v52] = v55
            end
        end
        u41.tornadoesLocalPlayerIsIn = v53
        if #u41.tornadoesLocalPlayerIsIn == 0 and u41.vectorForce then
            u41.vectorForce.Enabled = false
            u41.vectorForce.Force = Vector3.new(0, 0, 0)
        end
    end))
    p42:GiveTask(u30.Client:Get("Airbender_PlayerExitAllTornadoes"):Connect(function() --[[ Line: 159 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        u41.tornadoesLocalPlayerIsIn = {}
        if u41.vectorForce then
            u41.vectorForce.Enabled = false
            u41.vectorForce.Force = Vector3.new(0, 0, 0)
        end
    end))
    p42:GiveTask(u17.Heartbeat:Connect(function(_) --[[ Line: 170 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u25
            [3] = u33
            [4] = u32
            [5] = u15
            [6] = u35
        --]]
        if #u41.tornadoesLocalPlayerIsIn == 0 then
            return nil
        end
        if not u41.vectorForce then
            return nil
        end
        local v56 = u25:getLocalPlayerEntity()
        if v56 and u33:isActive(v56:getInstance(), u32.WEAK_ARMOR) then
            return nil
        end
        local v57 = u15.LocalPlayer.Character
        if v57 ~= nil then
            v57 = v57.PrimaryPart
        end
        if not v57 then
            return nil
        end
        local v58 = u41:getLocalHumanoid()
        if v58 ~= nil then
            v58 = v58:GetState()
        end
        if not v58 then
            return nil
        end
        local v59 = u41.tornadoesLocalPlayerIsIn[1]
        local v60 = v59.currentPosition.X
        local v61 = v59.currentPosition.Z
        local v62 = Vector3.new(v60, 0, v61)
        local v63 = v57.Position.X
        local v64 = v57.Position.Z
        local v65 = (v62 - Vector3.new(v63, 0, v64)).Unit
        local v66
        if v58 == Enum.HumanoidStateType.Running and true or v58 == Enum.HumanoidStateType.Landed then
            v66 = u35.groundForceMultiplier
        else
            v66 = u35.airForceMultiplier
        end
        local v67 = v65 * v66 * v57.AssemblyMass
        u41.vectorForce.Force = v67
    end))
    p42:GiveTask(u30.Client:Get("Airbender_UseTornadoFromServer"):Connect(function(u68) --[[ Line: 212 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        task.spawn(function() --[[ Line: 213 ]]
            --[[
            Upvalues:
                [1] = u41
                [2] = u68
            --]]
            u41:playerUsedTornado(u68.tornadoData)
        end)
    end))
    p42:GiveTask(u30.Client:Get("Airbender_EndTornadoFromServer"):Connect(function(p69) --[[ Line: 217 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        local v70 = u41:getTornadoData(p69.tornadoData.uuid)
        if v70 then
            v70.maid:DoCleaning()
        end
        local v71 = 0
        local v72 = {}
        for v73, v74 in u41.tornadoesLocalPlayerIsIn do
            local _ = v73 - 1
            if v74.uuid ~= p69.tornadoData.uuid == true then
                v71 = v71 + 1
                v72[v71] = v74
            end
        end
        u41.tornadoesLocalPlayerIsIn = v72
        local v75 = 0
        local v76 = {}
        for v77, v78 in u41.tornadoes do
            local _ = v77 - 1
            if v78.uuid ~= p69.tornadoData.uuid == true then
                v75 = v75 + 1
                v76[v75] = v78
            end
        end
        u41.tornadoes = v76
        if #u41.tornadoesLocalPlayerIsIn == 0 and u41.vectorForce then
            u41.vectorForce.Enabled = false
            u41.vectorForce.Force = Vector3.new(0, 0, 0)
        end
    end))
    p42:GiveTask(u20.ProjectileHit:setPriority(u9.HIGHEST):connect(function(p79) --[[ Line: 264 ]]
        if p79:isCancelled() then
            return nil
        end
        local v80 = p79.hitData.part
        if not v80 then
            return nil
        end
        local v81 = p79.shooter
        if v81 ~= nil then
            v81 = v81:getPlayer()
        end
        if not v81 then
            return nil
        end
        local v82 = v81.Team
        if v82 ~= nil then
            v82 = v82.Name
        end
        local v83 = v80:GetAttribute("TornadoTeam")
        if v83 == "" or not v83 then
            return nil
        end
        if v82 == v83 then
            p79:setCancelled(true)
        end
    end))
    p42:GiveTask(u14:GetInstanceAddedSignal("airbender-tornado-collider"):Connect(function(p84) --[[ Line: 294 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u5
        --]]
        local v85 = p84:GetAttribute("TornadoTeam")
        if v85 == "" or not v85 then
            return nil
        end
        local v86 = u15.LocalPlayer.Team
        if v86 ~= nil then
            v86 = v86.Name
        end
        if v86 == "" or not v86 then
            return nil
        end
        if v85 == v86 then
            u5:setQueryIgnored(p84, true)
        end
    end))
end
function u36.onKitReplicationDeactivated(_) --[[ Line: 313 ]] end
function u36.onInnateAbilityEnabled(_, _, _) --[[ Line: 315 ]] end
function u36.onAbilityUsed(_, p87, p88) --[[ Line: 317 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u21
        [3] = u18
        [4] = u30
    --]]
    if p87 ~= u15.LocalPlayer.Character then
        return nil
    end
    if p88.ability == u21.AIRBENDER_MOVING_TORNADO then
        local v89 = u18.CurrentCamera
        if v89 ~= nil then
            v89 = v89.CFrame.LookVector
        end
        if not v89 then
            return nil
        end
        local v90 = v89.X
        local v91 = v89.Z
        local v92 = {
            ["direction"] = Vector3.new(v90, 0, v91).Unit
        }
        u30.Client:Get("Airbender_RequestMovingTornado"):SendToServer(v92)
    end
end
function u36.getLocalHumanoid(p93) --[[ Line: 338 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    if p93.localHumanoid and p93.localHumanoid.Parent ~= nil then
        return p93.localHumanoid
    end
    local v94 = u15.LocalPlayer.Character
    if v94 ~= nil then
        v94 = v94:FindFirstChildOfClass("Humanoid")
    end
    p93.localHumanoid = v94
    return p93.localHumanoid
end
function u36.playerUsedTornado(u95, u96) --[[ Line: 349 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u15
        [3] = u3
        [4] = u23
        [5] = u22
        [6] = u28
        [7] = u26
        [8] = u16
        [9] = u18
        [10] = u31
        [11] = u7
        [12] = u29
        [13] = u19
        [14] = u10
        [15] = u6
        [16] = u30
        [17] = u17
        [18] = u24
    --]]
    local v97 = u96.owner
    if not v97 then
        return nil
    end
    local u98 = v97.Character
    if u98 ~= nil then
        u98 = u98.PrimaryPart
    end
    if not u98 then
        return nil
    end
    local u99 = u11.new()
    u96.maid = u99
    u99:GiveTask(function() --[[ Line: 365 ]]
        --[[
        Upvalues:
            [1] = u96
        --]]
        u96.alive = false
    end)
    if v97 == u15.LocalPlayer then
        u3:playAnimation(u15.LocalPlayer, u23:getAssetId(u22.AIRBENDER_CAST))
    end
    local v100 = u28.TORNADO_HEIGHT - 6.5
    local u101 = Vector3.new(0, v100, 0)
    local u102
    if u95:getKitSkin(v97) == u26.SHARK_RAMIL then
        u102 = u16.Assets.Misc.Ramil_WaterTornado:Clone()
    else
        u102 = u16.Assets.Misc.Airbender_SandTunnel:Clone()
    end
    local u103
    if v97.Team == u15.LocalPlayer.Team then
        u102.Pivot.Cylinder.TextureID = ""
        u102.Pivot.Inside.TextureID = ""
        u102.Pivot.Outside.TextureID = ""
        u103 = 0.6
    else
        u103 = 0
    end
    if u96.isMoving and u96.direction ~= nil then
        local v104 = u18:GetServerTimeNow() - u96.creationServerTime
        local v105 = u96.startPosition + u96.direction * (u28.MOVING_TORNADO_SPEED * v104)
        u102:PivotTo(CFrame.new(v105, v105 + Vector3.new(0, 1, 0)))
    else
        local v106 = u98.Position + u101
        local v107 = u98.Position
        u102:PivotTo(CFrame.new(v106, v107 + Vector3.new(0, 1, 0)))
    end
    u96.currentPosition = u102.Pivot.Position
    local v108
    if u95:getKitSkin(v97) == u26.SHARK_RAMIL then
        v108 = u31.SHARK_RAMIL_TORNADO_LOOP
    else
        v108 = u31.AIRBENDER_SANDSTORM_LOOP
    end
    local u109 = u7:playModifiableSound(v108, {
        ["looped"] = true,
        ["volumeMultiplier"] = 0,
        ["position"] = u102.Pivot.Position,
        ["parent"] = u102.PrimaryPart
    })
    local v110 = u29.getScaleLengthForZoneModel(u28.TORNADO_HEIGHT)
    local v111 = u102.Pivot.Cylinder
    local v112 = u102.Pivot.Cylinder.Size.Y * v110
    v111.Size = Vector3.new(0.01, v112, 0.01)
    local v113 = u102.Pivot.Inside
    local v114 = u102.Pivot.Inside.Size.Y * v110
    v113.Size = Vector3.new(0.01, v114, 0.01)
    local v115 = u102.Pivot.Outside
    local v116 = u102.Pivot.Outside.Size.Y * v110
    v115.Size = Vector3.new(0.01, v116, 0.01)
    u19(0.35, u10, function(p117) --[[ Line: 423 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u96
            [3] = u28
            [4] = u95
            [5] = u102
            [6] = u109
        --]]
        local v118 = u6
        local v119 = 0.01
        local v120
        if u96.isMoving then
            v120 = u28.MOVING_TORNADO_RADIUS
        else
            v120 = u28.TORNADO_RADIUS
        end
        u95:setTornadoRadius(u102, (v118:lerp(v119, v120, p117)))
        u109.Volume = u6:lerp(0, 1, p117)
    end, 0, 1):Play()
    u102.Parent = u18
    local u121 = false
    if u96.isMoving then
        u99:GiveTask((u30.Client:Get("Airbender_TornadoStoppedMoving"):Connect(function(p122) --[[ Line: 435 ]]
            --[[
            Upvalues:
                [1] = u121
                [2] = u102
            --]]
            u121 = true
            local v123 = u102
            local v124 = p122.position
            local v125 = p122.position
            v123:PivotTo(CFrame.new(v124, v125 + Vector3.new(0, 1, 0)))
        end)))
    end
    local u126 = u102:FindFirstChild("Pivot")
    if u126 ~= nil then
        u126 = u126:FindFirstChild("Inside")
        if u126 ~= nil then
            u126 = u126:FindFirstChild("RamilShark")
        end
    end
    local u127 = 0
    local u128
    if u126 == nil then
        u128 = nil
    else
        u128 = u126:GetPivot().Position - u102:GetPivot().Position
    end
    local u129 = u102.Pivot.Cylinder.Transparency
    local u130 = u102.Pivot.Inside.Transparency
    local u131 = u102.Pivot.Outside.Transparency
    local u132 = 0
    local u133 = 0
    local u154 = u17.Heartbeat:Connect(function(p134) --[[ Line: 471 ]]
        --[[
        Upvalues:
            [1] = u98
            [2] = u99
            [3] = u96
            [4] = u121
            [5] = u102
            [6] = u28
            [7] = u101
            [8] = u24
            [9] = u18
            [10] = u133
            [11] = u132
            [12] = u6
            [13] = u129
            [14] = u103
            [15] = u130
            [16] = u131
            [17] = u126
            [18] = u128
            [19] = u127
        --]]
        if not u98 or u98.Parent == nil then
            u99:DoCleaning()
            return nil
        end
        if u96.isMoving and u96.direction ~= nil then
            if not u121 then
                local v135 = u102:GetPivot().Position + u96.direction * (u28.MOVING_TORNADO_SPEED * p134)
                u102:PivotTo(CFrame.new(v135, v135 + Vector3.new(0, 1, 0)))
            end
        else
            local v136 = u98.Position + u101
            u102:PivotTo(CFrame.new(v136, v136 + Vector3.new(0, 1, 0)))
        end
        u96.currentPosition = u102:GetPivot().Position
        local v137 = u24.rotateLocalDegrees
        local v138 = u102.Pivot.Cylinder
        local v139 = u28.CYLINDER_SPIN_SPEED * u28.SPIN_MULTIPLIER * p134
        v137(v138, (Vector3.new(0, v139, 0)))
        local v140 = u24.rotateLocalDegrees
        local v141 = u102.Pivot.Inside
        local v142 = u28.INSIDE_SPIN_SPEED * u28.SPIN_MULTIPLIER * p134
        v140(v141, (Vector3.new(0, v142, 0)))
        local v143 = u24.rotateLocalDegrees
        local v144 = u102.Pivot.Outside
        local v145 = u28.OUTSIDE_SPIN_SPEED * u28.SPIN_MULTIPLIER * p134
        v143(v144, (Vector3.new(0, v145, 0)))
        local v146 = (u102.Pivot.Position - u18.CurrentCamera.CFrame.Position).Magnitude
        u133 = u133 + p134
        if u133 > 0.25 then
            u133 = 0
            local v147 = u132
            u132 = u6:rangeMap(v146, { u28.CAMERA_DISTANCE_FOR_MAX_TRANSPARENCY, u28.CAMERA_DISTANCE_FOR_NORMAL_TRANSPARENCY }, { 0.9, 0 })
            local v148 = u132
            u132 = math.clamp(v148, 0, 0.9)
            if u132 ~= v147 then
                u102.Pivot.Cylinder.Transparency = u6:lerp(u129 + u103, 1, u132)
                u102.Pivot.Inside.Transparency = u6:lerp(u130 + u103, 1, u132)
                u102.Pivot.Outside.Transparency = u6:lerp(u131 + u103, 1, u132)
            end
        end
        if u126 and u128 then
            local v149 = u126.PrimaryPart
            if v149 ~= nil then
                v149 = v149:GetPivot().Position
            end
            u127 = u127 + p134
            local v150 = u127 * 2
            local v151
            if math.sin(v150) * 1 < 0 then
                local v152 = -1 * p134
                v151 = Vector3.new(0, v152, 0)
            else
                local v153 = 1 * p134
                v151 = Vector3.new(0, v153, 0)
            end
            if v149 then
                u24.setPosition(u126, v149 + v151)
            end
        end
    end)
    local v155 = u95.tornadoes
    table.insert(v155, u96)
    u99:GiveTask(function() --[[ Line: 544 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u10
            [3] = u6
            [4] = u96
            [5] = u28
            [6] = u95
            [7] = u102
            [8] = u109
            [9] = u154
        --]]
        task.spawn(function() --[[ Line: 545 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u10
                [3] = u6
                [4] = u96
                [5] = u28
                [6] = u95
                [7] = u102
                [8] = u109
                [9] = u154
            --]]
            u19(0.35, u10, function(p156) --[[ Line: 547 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u96
                    [3] = u28
                    [4] = u95
                    [5] = u102
                    [6] = u109
                --]]
                local v157 = u6
                local v158
                if u96.isMoving then
                    v158 = u28.MOVING_TORNADO_RADIUS
                else
                    v158 = u28.TORNADO_RADIUS
                end
                u95:setTornadoRadius(u102, (v157:lerp(v158, 0.01, p156)))
                u109.Volume = u6:lerp(1, 0, p156)
            end, 0, 1):Play():Wait()
            u154:Disconnect()
            u102:Destroy()
            u109:Destroy()
        end)
    end)
end
function u36.getTornadoData(p159, p160) --[[ Line: 562 ]]
    local v161 = nil
    for v162, v163 in p159.tornadoes do
        local _ = v162 - 1
        if v163.uuid == p160 == true then
            return v163
        end
    end
    return v161
end
function u36.setTornadoRadius(_, p164, p165) --[[ Line: 578 ]]
    local v166 = p164.Pivot.Cylinder
    local v167 = p164.Pivot.Cylinder.Size.Y
    v166.Size = Vector3.new(p165, v167, p165)
    local v168 = p164.Pivot.Inside
    local v169 = p164.Pivot.Inside.Size.Y
    v168.Size = Vector3.new(p165, v169, p165)
    local v170 = p164.Pivot.Outside
    local v171 = p164.Pivot.Outside.Size.Y
    v170.Size = Vector3.new(p165, v171, p165)
end
function u36.createVectorForce(p172) --[[ Line: 583 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v173 = p172:getLocalHumanoid()
    if v173 ~= nil then
        v173 = v173.RootPart
    end
    if not v173 then
        return nil
    end
    if p172.vectorForce ~= nil then
        local v174 = p172.vectorForce
        if v174 ~= nil then
            v174:Destroy()
        end
    end
    if p172.vectorForceAttachment ~= nil then
        local v175 = p172.vectorForceAttachment
        if v175 ~= nil then
            v175:Destroy()
        end
    end
    p172.vectorForceAttachment = u12("Attachment", {
        ["Name"] = "TornadoVectorForceAttachment",
        ["Parent"] = v173
    })
    p172.vectorForce = u12("VectorForce", {
        ["Name"] = "TornadoVectorForce",
        ["ApplyAtCenterOfMass"] = true,
        ["Force"] = Vector3.new(0, 0, 0),
        ["Enabled"] = true,
        ["RelativeTo"] = Enum.ActuatorRelativeTo.World,
        ["Attachment0"] = p172.vectorForceAttachment,
        ["Parent"] = v173
    })
end
function u36.getKitSkin(_, p176) --[[ Line: 619 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return u8.Controllers.KitController:getKitSkin(p176)
end
u8.CreateController(u36.new())
return nil