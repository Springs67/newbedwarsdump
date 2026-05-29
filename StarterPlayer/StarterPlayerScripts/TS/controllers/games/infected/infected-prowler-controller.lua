local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").SetUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.GameQueryUtil
local u6 = v4.WatchCharacter
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Players
local u14 = v12.RunService
local u15 = v12.UserInputService
local u16 = v12.Workspace
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "cat-balance").CatBalance
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-team-id").InfectedTeamId
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-variant-type").InfectedVariantType
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "region-util").RegionUtil
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 42 ]]
        return "InfectedProwlerController"
    end,
    ["__index"] = u18
})
u33.__index = u33
function u33.new(...) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    local v34 = u33
    local v35 = setmetatable({}, v34)
    return v35:constructor(...) or v35
end
function u33.constructor(p36) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u10
        [3] = u8
    --]]
    u18.constructor(p36)
    p36.Name = "InfectedProwlerController"
    p36.setupMaid = u10.new()
    p36.wallClimbMaid = u10.new()
    p36.wallMounted = false
    p36.targetVerticalVelocity = u8.SingleMotor.new(0)
end
function u33.KnitStart(u37) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u7
        [3] = u24
        [4] = u20
        [5] = u6
        [6] = u26
        [7] = u27
        [8] = u9
    --]]
    u18.KnitStart(u37)
    u7.Controllers.MatchController:getQueueTypeAsync():andThen(function(p38) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u7
            [3] = u20
            [4] = u6
            [5] = u26
            [6] = u27
            [7] = u37
        --]]
        if p38 == u24.INFECTED then
            u7.Controllers.PreloadController:runPreload({
                ["animations"] = { u20.CLIMB_ROPE }
            })
            u6(function(p39) --[[ Line: 67 ]]
                --[[
                Upvalues:
                    [1] = u26
                    [2] = u27
                    [3] = u37
                --]]
                local v40 = p39:GetAttribute("Team")
                local v41 = p39:GetAttribute("InfectedVariantType")
                if v40 == u26.INFECTED and v41 == u27.PROWLER then
                    u37:setupWallClimbing()
                else
                    u37.setupMaid:DoCleaning()
                end
            end)
        end
    end, function() --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        return u9.Warn("[InfectedProwler] Could not retrieve queue type.")
    end)
end
function u33.setupWallClimbing(u42) --[[ Line: 81 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u13
        [3] = u25
        [4] = u15
        [5] = u17
        [6] = u14
        [7] = u19
    --]]
    u42.setupMaid:DoCleaning()
    local u43 = u7.Controllers.KitController:isUsingKit(u13.LocalPlayer, u25.INFECTED_PROWLER)
    if not u43 then
        return nil
    end
    u42.setupMaid:GiveTask(u15.JumpRequest:Connect(function() --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u43
            [3] = u13
        --]]
        if not (u42.wallMounted and u43) then
            return nil
        end
        local v44 = u13.LocalPlayer.Character
        if v44 == nil or not v44.PrimaryPart then
            return nil
        end
        u42:dismountWall(v44, v44.PrimaryPart.CFrame.LookVector, false)
    end))
    u42.setupMaid:GiveTask(u17.SwordSwing:connect(function(p45) --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u43
            [2] = u42
        --]]
        if not p45:isCancelled() and (u43 and u42.wallMounted) then
            p45:setCancelled(true)
        end
    end))
    u42.setupMaid:GiveTask(u14.Heartbeat:Connect(function() --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        u42:stepWallClimbCheck()
    end))
    local u49 = u19.On(function(p46, _, _, _, _, p47, _, _, _, _, _, _, _, _) --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u42
        --]]
        if p46 ~= u13.LocalPlayer.Character then
            return nil
        end
        if p47 ~= nil then
            p47 = p47.disabled
        end
        if p47 then
            return nil
        end
        if not u42.wallMounted then
            return nil
        end
        local v48 = u13.LocalPlayer.Character
        if v48 == nil or not v48.PrimaryPart then
            return nil
        end
        u42:dismountWall(v48, v48.PrimaryPart.CFrame.LookVector, true)
    end)
    u42.setupMaid:GiveTask(function() --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u49
        --]]
        u49()
    end)
end
function u33.stepWallClimbCheck(p50) --[[ Line: 134 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u23
        [3] = u31
        [4] = u30
        [5] = u22
        [6] = u32
        [7] = u2
        [8] = u3
        [9] = u5
        [10] = u29
        [11] = u8
    --]]
    local v51 = u13.LocalPlayer.Character
    local v52
    if v51 == nil then
        v52 = v51
    else
        v52 = v51.PrimaryPart
    end
    if not v52 then
        return nil
    end
    local v53 = v51:FindFirstChild("Humanoid")
    if not v53 then
        return nil
    end
    local v54 = v51.PrimaryPart.Position
    local v55 = v51.PrimaryPart.CFrame.LookVector
    local v56 = u23:getEntity(u13.LocalPlayer)
    if v56 ~= nil then
        v56 = v56:getInstance()
    end
    if v56 and (u31:isActive(v56, u30.GROUNDED) or u31:isActive(v56, u30.FROSTED)) then
        if p50.wallMounted then
            p50:dismountWall(v51, v55, false)
        end
        return nil
    end
    local v57 = v54 + Vector3.new(0, 1, 0)
    local v58 = v55 * u22.WALL_RANGE
    local v59 = v57 + v58
    local v60 = u32:createRegion3(u2:getBlockPosition(v57), u2:getBlockPosition(v59))
    local v61 = u3.values(u2:getStore():getBlocksInRegion3(v60))
    local v62
    if #v61 > 0 then
        local v63 = RaycastParams.new()
        v63.FilterDescendantsInstances = v61
        v63.FilterType = Enum.RaycastFilterType.Include
        v62 = u5:raycast(v57, v58, v63, {
            ["ignorePart"] = function(p64) --[[ Name: ignorePart, Line 175 ]]
                return p64:IsA("BasePart") and not p64.CanCollide and true or false
            end
        })
    else
        v62 = nil
    end
    if not v62 then
        if p50.wallMounted then
            p50:dismountWall(v51, v55, true)
        end
        p50.beginAttemptMountWallTime = nil
        return nil
    end
    local v65 = false
    for _, v66 in u29:getBlocksInRegion(v62.Instance.CFrame, Vector3.new(6, 6, 6), false, false) do
        local v67 = ((v51.PrimaryPart.Position - v66.Position) * Vector3.new(1, 0, 1)).Unit
        local v68 = v67.X
        local v69 = math.sign(v68)
        local v70 = v67.Z
        local v71 = math.sign(v70)
        local v72 = Vector3.new(v69, 0, v71)
        local v73 = v53.MoveDirection.X
        local v74 = math.abs(v73)
        local v75 = v53.MoveDirection.Z
        local v76 = v72 * (math.abs(v75) < v74 and Vector3.new(0, 0, 1) or Vector3.new(1, 0, 0))
        local v77 = v53.MoveDirection:Dot(v76)
        local v78 = math.acos(v77)
        local v79 = math.deg(v78)
        if v79 > 45 and v79 < 135 then
            v65 = true
        end
    end
    if v62.Distance > u22.MAX_DISTANCE_FROM_WALL then
        if p50.wallMounted then
            p50:dismountWall(v51, v55, true)
        end
        p50.beginAttemptMountWallTime = nil
        return nil
    end
    if v65 and v53.MoveDirection.Magnitude ~= 0 then
        local v80 = p50.beginAttemptMountWallTime
        if v80 == 0 or (v80 ~= v80 or not v80) then
            p50.beginAttemptMountWallTime = time()
        end
    else
        p50.beginAttemptMountWallTime = nil
    end
    if p50.wallMounted then
        local v81 = v51.PrimaryPart
        local v82 = v81.CFrame.Position
        local v83 = v81.CFrame.Position
        local v84 = v62.Normal * -1
        v81:PivotTo(CFrame.new(v82, v83 + v84))
        local v85 = v53.MoveDirection:Dot(v62.Normal)
        local v86 = math.acos(v85)
        local v87 = math.deg(v86)
        local v88 = v87 > 120
        local v89 = v87 < 60
        if v88 then
            local v90 = p50.animationTrack
            if v90 ~= nil then
                v90 = v90.IsPlaying
            end
            if v90 then
                local v91 = p50.animationTrack
                if v91 ~= nil then
                    v91:AdjustSpeed(2)
                end
            end
            p50.targetVerticalVelocity:setGoal(u8.Spring.new(u22.WALL_CLIMB_SPEED))
        elseif v89 then
            local v92 = p50.animationTrack
            if v92 ~= nil then
                v92 = v92.IsPlaying
            end
            if v92 then
                local v93 = p50.animationTrack
                if v93 ~= nil then
                    v93:AdjustSpeed(-2)
                end
            end
            p50.targetVerticalVelocity:setGoal(u8.Spring.new(-u22.WALL_CLIMB_SPEED))
        else
            if v53.MoveDirection.Magnitude == 0 then
                local v94 = p50.animationTrack
                if v94 ~= nil then
                    v94 = v94.IsPlaying
                end
                if v94 then
                    v94 = p50.animationTrack.Speed ~= 0
                end
                if v94 then
                    local v95 = p50.animationTrack.Speed
                    if math.abs(v95) < 0.1 then
                        p50.animationTrack:AdjustSpeed(0)
                    else
                        p50.animationTrack:AdjustSpeed(p50.animationTrack.Speed * 0.95)
                    end
                end
            else
                local v96 = p50.animationTrack
                if v96 ~= nil then
                    v96 = v96.IsPlaying
                end
                if v96 then
                    local v97 = p50.animationTrack
                    if v97 ~= nil then
                        v97:AdjustSpeed(-2)
                    end
                end
            end
            p50.targetVerticalVelocity:setGoal(u8.Spring.new(0, {
                ["frequency"] = 1
            }))
        end
        if v62.Normal.X == 0 then
            local v98 = v51.PrimaryPart.AssemblyLinearVelocity
            local v99 = p50.targetVerticalVelocity:getValue()
            local v100 = Vector3.new(0, v99, 0)
            v51.PrimaryPart.AssemblyLinearVelocity = v98 * Vector3.new(1, 0, 0) + v100
            local v101 = v53.MoveDirection.X
            v53:Move((Vector3.new(v101, 0, 0)))
        else
            local v102 = v51.PrimaryPart.AssemblyLinearVelocity
            local v103 = p50.targetVerticalVelocity:getValue()
            local v104 = Vector3.new(0, v103, 0)
            v51.PrimaryPart.AssemblyLinearVelocity = v102 * Vector3.new(0, 0, 1) + v104
            local v105 = v53.MoveDirection.Z
            v53:Move((Vector3.new(0, 0, v105)))
        end
    end
    local v106 = p50.beginAttemptMountWallTime
    if v106 ~= 0 and (v106 == v106 and v106) then
        v106 = time() - p50.beginAttemptMountWallTime > u22.SECONDS_HOLD_TO_WALL_MOUNT
    end
    if v106 ~= 0 and (v106 == v106 and v106) then
        if p50.wallMounted then
            return nil
        end
        p50:mountWall(v51)
    end
end
function u33.mountWall(u107, u108) --[[ Line: 329 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u13
        [3] = u11
        [4] = u16
        [5] = u21
        [6] = u20
    --]]
    task.spawn(function() --[[ Line: 330 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        u28.Client:Get("CatWallClimbMount"):SendToServer()
    end)
    u107.wallClimbMaid:DoCleaning()
    local v109 = u13.LocalPlayer.Character
    if v109 ~= nil then
        v109 = v109.PrimaryPart
    end
    local v110 = v109.AssemblyMass
    if not u107.liftBodyForce then
        local v111 = u11
        local v112 = {
            ["Name"] = "WallClimbAntiGrav"
        }
        local v113 = u16.Gravity * v110
        v112.Force = Vector3.new(0, v113, 0)
        v112.Parent = v109
        u107.liftBodyForce = v111("BodyForce", v112)
    end
    u107.wallClimbMaid:GiveTask(u107.liftBodyForce)
    u108.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
    u107.wallMounted = true
    local u114 = u21:playAnimation(u13.LocalPlayer, u20.CLIMB_ROPE, {
        ["looped"] = true
    })
    u107.animationTrack = u114
    if u107.animationTrack then
        u107.animationTrack.Priority = Enum.AnimationPriority.Movement
        u107.animationTrack:AdjustSpeed(2)
    end
    u107.wallClimbMaid:GiveTask(function() --[[ Line: 360 ]]
        --[[
        Upvalues:
            [1] = u107
            [2] = u114
            [3] = u108
        --]]
        u107.wallMounted = false
        u107.beginAttemptMountWallTime = 0
        if u114 then
            u114:Stop()
            u114:Destroy()
        end
        u108.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
    end)
end
function u33.dismountWall(p115, p116, u117, p118) --[[ Line: 370 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    task.spawn(function() --[[ Line: 371 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u117
        --]]
        local v119 = {
            ["direction"] = u117
        }
        u28.Client:Get("CatWallClimbDismount"):SendToServer(v119)
    end)
    if p115.wallMounted and p118 then
        local v120 = p116.HumanoidRootPart
        local v121 = p116.PrimaryPart
        if v121 ~= nil then
            v121 = v121.AssemblyMass
        end
        v120:ApplyImpulse(Vector3.new(0, 1, 0) * (v121 == nil and 1 or v121) * 25)
    end
    p115.wallClimbMaid:DoCleaning()
end
u7.CreateController(u33.new())
return nil