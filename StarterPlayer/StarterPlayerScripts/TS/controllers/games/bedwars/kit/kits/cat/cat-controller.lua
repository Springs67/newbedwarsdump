local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").SetUtil
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u6 = v5.GameQueryUtil
local u7 = v5.RandomUtil
local u8 = v5.SoundManager
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u10 = v9.KnitClient
local u11 = v9.KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u17 = v16.Players
local u18 = v16.RunService
local u19 = v16.StarterPlayer
local u20 = v16.UserInputService
local u21 = v16.Workspace
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").CatStaminaAttr
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "cat-balance").CatBalance
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "region-util").RegionUtil
local u38 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute
local u39 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u40 = v1.import(script, script.Parent, "ui", "cat-stamina-bar").CatStaminaBar
local u41 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 50 ]]
        return "CatController"
    end,
    ["__index"] = u39
})
u41.__index = u41
function u41.new(...) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u41
    --]]
    local v42 = u41
    local v43 = setmetatable({}, v42)
    return v43:constructor(...) or v43
end
function u41.constructor(p44) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u39
        [2] = u31
        [3] = u33
        [4] = u13
        [5] = u12
    --]]
    u39.constructor(p44, u31.CAT, {
        ["sounds"] = {
            u33.CAT_POUNCE_1,
            u33.CAT_POUNCE_2,
            u33.CAT_POUNCE_3,
            u33.CAT_LAND,
            u33.CAT_SCRATCH_1,
            u33.CAT_SCRATCH_2,
            u33.CAT_SCRATCH_3
        }
    })
    p44.Name = "CatController"
    p44.jumpMaid = u13.new()
    p44.wallClimbMaid = u13.new()
    p44.midLeap = false
    p44.wallMounted = false
    p44.targetVerticalVelocity = u12.SingleMotor.new(0)
end
function u41.KnitStart(p45) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u39
    --]]
    u39.KnitStart(p45)
end
function u41.onKitLocalActivated(u46, u47) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u10
        [3] = u17
        [4] = u31
        [5] = u22
        [6] = u24
        [7] = u30
        [8] = u2
        [9] = u25
        [10] = u21
        [11] = u18
        [12] = u23
        [13] = u8
        [14] = u7
        [15] = u33
        [16] = u27
        [17] = u26
        [18] = u32
        [19] = u15
        [20] = u40
    --]]
    u20.JumpRequest:Connect(function() --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u10
            [3] = u17
            [4] = u31
        --]]
        if not u46.wallMounted then
            return nil
        end
        if not u10.Controllers.KitController:isUsingKit(u17.LocalPlayer, u31.CAT) then
            return nil
        end
        local v48 = u17.LocalPlayer.Character
        if v48 == nil or not v48.PrimaryPart then
            return nil
        end
        u46:dismountWall(v48, v48.PrimaryPart.CFrame.LookVector, false)
    end)
    u22.CanUseLocalAbility:connect(function(p49) --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u10
            [3] = u17
            [4] = u31
            [5] = u30
        --]]
        if p49.ability ~= u24.CAT_POUNCE then
            return nil
        end
        if not u10.Controllers.KitController:isUsingKit(u17.LocalPlayer, u31.CAT) then
            return nil
        end
        local v50 = u30:getEntity(p49.userCharacter)
        if v50 ~= nil then
            v50 = v50:isAlive()
        end
        if not v50 then
            p49:setCancelled(true)
        end
    end)
    local v51 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v52 = u24.CAT_POUNCE
    local v53 = {}
    for v54, v55 in u25[u24.CAT_POUNCE].triggerConfig do
        v53[v54] = v55
    end
    function v53.getExtraData() --[[ Line: 112 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        return {
            ["direction"] = u21.CurrentCamera.CFrame.LookVector
        }
    end
    v51:enableAbility(v52, v53):andThen(function(p56) --[[ Line: 118 ]]
        --[[
        Upvalues:
            [1] = u47
        --]]
        u47:GiveTask(p56)
    end)
    u47:GiveTask(u18.Heartbeat:Connect(function() --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u46
        --]]
        debug.profilebegin("cat-climb")
        u46:stepWallClimbCheck()
        debug.profileend()
    end))
    u47:GiveTask((u23.On(function(p57, _, _, _, _, p58, _, _, _, _, _, _, _, _) --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u46
        --]]
        if p57 ~= u17.LocalPlayer.Character then
            return nil
        end
        if p58 ~= nil then
            p58 = p58.disabled
        end
        if p58 then
            return nil
        end
        if not u46.wallMounted then
            return nil
        end
        local v59 = u17.LocalPlayer.Character
        if v59 == nil or not v59.PrimaryPart then
            return nil
        end
        u46:dismountWall(v59, v59.PrimaryPart.CFrame.LookVector, true)
    end)))
    u47:GiveTask(u22.SwordSwing:connect(function(p60) --[[ Line: 151 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u17
            [3] = u31
            [4] = u46
        --]]
        if p60:isCancelled() then
            return nil
        end
        if not u10.Controllers.KitController:isUsingKit(u17.LocalPlayer, u31.CAT) then
            return nil
        end
        if u46.wallMounted or u46.midLeap then
            p60:setCancelled(true)
        end
    end))
    u47:GiveTask(u22.GroundTouch:connect(function(_) --[[ Line: 163 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u17
            [3] = u10
            [4] = u31
            [5] = u30
            [6] = u8
            [7] = u7
            [8] = u33
            [9] = u27
            [10] = u26
        --]]
        if not u46.midLeap then
            return nil
        end
        u46.jumpMaid:DoCleaning()
        local v61 = u17.LocalPlayer
        if not u10.Controllers.KitController:isUsingKit(v61, u31.CAT) then
            return nil
        end
        local v62 = u30:getEntity(v61)
        if not v62 then
            return nil
        end
        local v63 = v62:getInstance().PrimaryPart
        if v63 ~= nil then
            v63 = v63.Position
        end
        if not v63 then
            return nil
        end
        if u46.wallMounted then
            return nil
        end
        local v64 = u8
        local v65 = u7.fromList
        local v66 = { u33.CAT_SCRATCH_1, u33.CAT_SCRATCH_2, u33.CAT_SCRATCH_3 }
        local v67 = v65(unpack(v66))
        local v68 = {}
        local v69 = v62:getInstance().PrimaryPart
        if v69 ~= nil then
            v69 = v69.Position
        end
        v68.position = v69
        v64:playSound(v67, v68)
        u27:playAnimation(u17.LocalPlayer, u26.BEAR_CLAWS_SWIPE)
    end))
    u32.Client:WaitFor("EntityDeathEvent"):andThen(function(p70) --[[ Line: 201 ]]
        --[[
        Upvalues:
            [1] = u47
            [2] = u17
            [3] = u46
        --]]
        u47:GiveTask(p70:Connect(function(p71) --[[ Line: 202 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u46
            --]]
            if p71.entityInstance ~= u17.LocalPlayer.Character then
                return nil
            end
            u46.jumpMaid:DoCleaning()
        end))
    end)
    u47:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u15.createFragment({
        ["CatStaminaBar"] = u15.createElement(u40)
    })))
end
function u41.onKitLocalDeactivated(_) --[[ Line: 214 ]] end
function u41.onKitReplicationActivated(_, _) --[[ Line: 216 ]] end
function u41.onKitReplicationDeactivated(_) --[[ Line: 218 ]] end
function u41.onInnateAbilityEnabled(_, _, _) --[[ Line: 220 ]] end
function u41.onAbilityUsed(p72, _, p73) --[[ Line: 222 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u24
        [3] = u10
        [4] = u31
    --]]
    if p73.userCharacter ~= u17.LocalPlayer.Character then
        return nil
    end
    if p73:isCancelled() then
        return nil
    end
    if p73.ability ~= u24.CAT_POUNCE then
        return nil
    end
    if not u10.Controllers.KitController:isUsingKit(u17.LocalPlayer, u31.CAT) then
        return nil
    end
    p72:pounce()
end
function u41.stepWallClimbCheck(p74) --[[ Line: 237 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u30
        [3] = u38
        [4] = u28
        [5] = u36
        [6] = u35
        [7] = u29
        [8] = u37
        [9] = u3
        [10] = u4
        [11] = u6
        [12] = u34
        [13] = u12
    --]]
    local v75 = u17.LocalPlayer.Character
    local v76
    if v75 == nil then
        v76 = v75
    else
        v76 = v75.PrimaryPart
    end
    if not v76 then
        return nil
    end
    local v77 = v75:FindFirstChild("Humanoid")
    if not v77 then
        return nil
    end
    local v78 = v75.PrimaryPart.Position
    local v79 = v75.PrimaryPart.CFrame.LookVector
    local v80 = u30:getEntity(u17.LocalPlayer)
    if v80 ~= nil then
        v80 = v80:getInstance()
    end
    local v81 = u38(u17.LocalPlayer, u28)
    local v82 = v81 == nil and 0 or v81
    if v80 and (u36:isActive(v80, u35.GROUNDED) or u36:isActive(v80, u35.FROSTED)) or v82 <= 0 then
        if p74.wallMounted then
            p74:dismountWall(v75, v79, false)
        end
        return nil
    end
    local v83 = v78 + Vector3.new(0, 1, 0)
    local v84 = v79 * u29.WALL_RANGE
    local v85 = v83 + v84
    local v86 = u37:createRegion3(u3:getBlockPosition(v83), u3:getBlockPosition(v85))
    local v87 = u4.values(u3:getStore():getBlocksInRegion3(v86))
    local v88
    if #v87 > 0 then
        local v89 = RaycastParams.new()
        v89.FilterDescendantsInstances = v87
        v89.FilterType = Enum.RaycastFilterType.Include
        v88 = u6:raycast(v83, v84, v89, {
            ["ignorePart"] = function(p90) --[[ Name: ignorePart, Line 283 ]]
                return p90:IsA("BasePart") and not p90.CanCollide and true or false
            end
        })
    else
        v88 = nil
    end
    if not v88 then
        if p74.wallMounted then
            p74:dismountWall(v75, v79, true)
        end
        p74.beginAttemptMountWallTime = nil
        return nil
    end
    local v91 = false
    for _, v92 in u34:getBlocksInRegion(v88.Instance.CFrame, Vector3.new(6, 6, 6), false, false) do
        local v93 = ((v75.PrimaryPart.Position - v92.Position) * Vector3.new(1, 0, 1)).Unit
        local v94 = v93.X
        local v95 = math.sign(v94)
        local v96 = v93.Z
        local v97 = math.sign(v96)
        local v98 = Vector3.new(v95, 0, v97)
        local v99 = v77.MoveDirection.X
        local v100 = math.abs(v99)
        local v101 = v77.MoveDirection.Z
        local v102 = v98 * (math.abs(v101) < v100 and Vector3.new(0, 0, 1) or Vector3.new(1, 0, 0))
        local v103 = v77.MoveDirection:Dot(v102)
        local v104 = math.acos(v103)
        local v105 = math.deg(v104)
        if v105 > 45 and v105 < 135 then
            v91 = true
        end
    end
    if v88.Distance > u29.MAX_DISTANCE_FROM_WALL then
        if p74.wallMounted then
            p74:dismountWall(v75, v79, true)
        end
        p74.beginAttemptMountWallTime = nil
        return nil
    end
    if v91 and v77.MoveDirection.Magnitude ~= 0 then
        local v106 = p74.beginAttemptMountWallTime
        if v106 == 0 or (v106 ~= v106 or not v106) then
            p74.beginAttemptMountWallTime = time()
        end
    else
        p74.beginAttemptMountWallTime = nil
    end
    if p74.wallMounted then
        local v107 = v75.PrimaryPart
        local v108 = v107.CFrame.Position
        local v109 = v107.CFrame.Position
        local v110 = v88.Normal * -1
        v107:PivotTo(CFrame.new(v108, v109 + v110))
        local v111 = v77.MoveDirection:Dot(v88.Normal)
        local v112 = math.acos(v111)
        local v113 = math.deg(v112)
        local v114 = v113 > 120
        local v115 = v113 < 60
        if v114 then
            local v116 = p74.animationTrack
            if v116 ~= nil then
                v116 = v116.IsPlaying
            end
            if v116 then
                local v117 = p74.animationTrack
                if v117 ~= nil then
                    v117:AdjustSpeed(2)
                end
            end
            p74.targetVerticalVelocity:setGoal(u12.Spring.new(u29.WALL_CLIMB_SPEED))
        elseif v115 then
            local v118 = p74.animationTrack
            if v118 ~= nil then
                v118 = v118.IsPlaying
            end
            if v118 then
                local v119 = p74.animationTrack
                if v119 ~= nil then
                    v119:AdjustSpeed(-2)
                end
            end
            p74.targetVerticalVelocity:setGoal(u12.Spring.new(-u29.WALL_CLIMB_SPEED))
        else
            if v77.MoveDirection.Magnitude == 0 then
                local v120 = p74.animationTrack
                if v120 ~= nil then
                    v120 = v120.IsPlaying
                end
                if v120 then
                    v120 = p74.animationTrack.Speed ~= 0
                end
                if v120 then
                    local v121 = p74.animationTrack.Speed
                    if math.abs(v121) < 0.1 then
                        p74.animationTrack:AdjustSpeed(0)
                    else
                        p74.animationTrack:AdjustSpeed(p74.animationTrack.Speed * 0.95)
                    end
                end
            else
                local v122 = p74.animationTrack
                if v122 ~= nil then
                    v122 = v122.IsPlaying
                end
                if v122 then
                    local v123 = p74.animationTrack
                    if v123 ~= nil then
                        v123:AdjustSpeed(-2)
                    end
                end
            end
            p74.targetVerticalVelocity:setGoal(u12.Spring.new(0, {
                ["frequency"] = 1
            }))
        end
        if v88.Normal.X == 0 then
            local v124 = v75.PrimaryPart.AssemblyLinearVelocity
            local v125 = p74.targetVerticalVelocity:getValue()
            local v126 = Vector3.new(0, v125, 0)
            v75.PrimaryPart.AssemblyLinearVelocity = v124 * Vector3.new(1, 0, 0) + v126
            local v127 = v77.MoveDirection.X
            v77:Move((Vector3.new(v127, 0, 0)))
        else
            local v128 = v75.PrimaryPart.AssemblyLinearVelocity
            local v129 = p74.targetVerticalVelocity:getValue()
            local v130 = Vector3.new(0, v129, 0)
            v75.PrimaryPart.AssemblyLinearVelocity = v128 * Vector3.new(0, 0, 1) + v130
            local v131 = v77.MoveDirection.Z
            v77:Move((Vector3.new(0, 0, v131)))
        end
    end
    local v132 = p74.beginAttemptMountWallTime
    if v132 ~= 0 and (v132 == v132 and v132) then
        v132 = p74.midLeap or time() - p74.beginAttemptMountWallTime > u29.SECONDS_HOLD_TO_WALL_MOUNT
    end
    if v132 ~= 0 and (v132 == v132 and v132) then
        if p74.wallMounted then
            return nil
        end
        p74:mountWall(v75)
    end
end
function u41.mountWall(u133, u134) --[[ Line: 437 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u17
        [3] = u14
        [4] = u21
        [5] = u27
        [6] = u26
    --]]
    task.spawn(function() --[[ Line: 438 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32.Client:Get("CatWallClimbMount"):SendToServer()
    end)
    u133.wallClimbMaid:DoCleaning()
    local v135 = u17.LocalPlayer.Character
    if v135 ~= nil then
        v135 = v135.PrimaryPart
    end
    local v136 = v135.AssemblyMass
    if not u133.liftBodyForce then
        local v137 = u14
        local v138 = {
            ["Name"] = "WallClimbAntiGrav"
        }
        local v139 = u21.Gravity * v136
        v138.Force = Vector3.new(0, v139, 0)
        v138.Parent = v135
        u133.liftBodyForce = v137("BodyForce", v138)
    end
    u133.wallClimbMaid:GiveTask(u133.liftBodyForce)
    u134.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
    u133.wallMounted = true
    u133.midLeap = false
    local u140 = u27:playAnimation(u17.LocalPlayer, u26.CLIMB_ROPE, {
        ["looped"] = true
    })
    u133.animationTrack = u140
    if u133.animationTrack then
        u133.animationTrack.Priority = Enum.AnimationPriority.Movement
        u133.animationTrack:AdjustSpeed(2)
    end
    u133.wallClimbMaid:GiveTask(function() --[[ Line: 471 ]]
        --[[
        Upvalues:
            [1] = u133
            [2] = u140
            [3] = u134
        --]]
        u133.wallMounted = false
        u133.beginAttemptMountWallTime = 0
        if u140 then
            u140:Stop()
            u140:Destroy()
        end
        u134.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
    end)
end
function u41.dismountWall(p141, p142, u143, p144) --[[ Line: 481 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    task.spawn(function() --[[ Line: 482 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u143
        --]]
        local v145 = {
            ["direction"] = u143
        }
        u32.Client:Get("CatWallClimbDismount"):SendToServer(v145)
    end)
    if p141.wallMounted and p144 then
        local v146 = p142.HumanoidRootPart
        local v147 = p142.PrimaryPart
        if v147 ~= nil then
            v147 = v147.AssemblyMass
        end
        v146:ApplyImpulse(Vector3.new(0, 1, 0) * (v147 == nil and 1 or v147) * 25)
    end
    p141.wallClimbMaid:DoCleaning()
end
function u41.leap(u148, p149, p150) --[[ Line: 503 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u19
        [3] = u8
        [4] = u7
        [5] = u33
        [6] = u10
        [7] = u26
    --]]
    u148.midLeap = true
    u148.jumpMaid:GiveTask(function() --[[ Line: 508 ]]
        --[[
        Upvalues:
            [1] = u148
        --]]
        u148.midLeap = false
    end)
    local v151 = CFrame
    local v152 = p149.HumanoidRootPart.Position
    local v153 = p149.HumanoidRootPart.Position
    p149.HumanoidRootPart.CFrame = v151.lookAt(v152, v153 + p150 * Vector3.new(1, 0, 1))
    p149.Humanoid.JumpHeight = 0.5
    p149.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    local v154 = p149.HumanoidRootPart
    local v155 = p150.Unit
    local v156 = p149.PrimaryPart
    if v156 ~= nil then
        v156 = v156.AssemblyMass
    end
    local v157 = v156 == nil and 1 or v156
    v154:ApplyImpulse(v155 * Vector3.new(1, 0, 1) * v157 * 70)
    u11.Controllers.JumpHeightController:setJumpHeight(u19.CharacterJumpHeight)
    local v158 = u8
    local v159 = u7.fromList
    local v160 = { u33.CAT_POUNCE_1, u33.CAT_POUNCE_2, u33.CAT_POUNCE_3 }
    v158:playSound(v159(unpack(v160)), {
        ["position"] = p149.HumanoidRootPart.Position
    })
    u10.Controllers.ViewmodelController:playAnimation(u26.DAGGER_CHARGE)
end
function u41.pounce(p161) --[[ Line: 537 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u21
        [3] = u10
        [4] = u26
    --]]
    local v162 = u17.LocalPlayer.Character
    local v163 = u21.CurrentCamera.CFrame.LookVector
    if not v162 then
        return nil
    end
    p161:leap(v162, v163)
    u10.Controllers.ViewmodelController:playAnimation(u26.FP_USE_ITEM)
end
u10.CreateController(u41.new())
return nil