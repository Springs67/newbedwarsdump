local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.SoundManager
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.RunService
local u14 = v11.Workspace
local u15 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local v23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-constants", "elk-constants")
local u24 = v23.ElkChargeEndReason
local u25 = v23.ElkConstants
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-type").MountType
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u30 = u1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u31 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 36 ]]
        return "ElkMasterController"
    end,
    ["__index"] = u30
})
u31.__index = u31
function u31.new(...) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    local v32 = u31
    local v33 = setmetatable({}, v32)
    return v33:constructor(...) or v33
end
function u31.constructor(p34) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u21
    --]]
    u30.constructor(p34, u21.ELK_MASTER)
    p34.Name = "ElkMasterController"
    p34.chargeSpeed = 0
    p34.chargeMaidMap = {}
    p34.isMounted = false
end
function u31.KnitStart(p35) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    u30.KnitStart(p35)
end
function u31.onKitLocalActivated(u36, p37) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u22
        [3] = u2
        [4] = u16
        [5] = u4
        [6] = u12
        [7] = u7
        [8] = u21
        [9] = u20
        [10] = u27
    --]]
    p37:GiveTask(u15.MatchStateChange:connect(function(p38) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u2
            [3] = u16
            [4] = u4
        --]]
        if p38.matchState == u22.RUNNING then
            local v39 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u16.ELK_SUMMON)
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v39, u4.READY)
        end
    end))
    p37:GiveTask(u15.CanUseLocalAbility:connect(function(p40) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u7
            [3] = u21
            [4] = u20
            [5] = u16
            [6] = u36
        --]]
        if p40.userCharacter ~= u12.LocalPlayer.Character then
            return nil
        end
        if not u7.Controllers.KitController:isUsingKit(u12.LocalPlayer, u21.ELK_MASTER) then
            return nil
        end
        local v41 = u20:getEntity(u12.LocalPlayer)
        if not v41 then
            return nil
        end
        if p40.ability == u16.ELK_SUMMON then
            if v41 ~= nil then
                v41 = v41:isAlive()
            end
            if not v41 then
                p40:setCancelled(true)
                return nil
            end
            local v42 = u12.LocalPlayer.Character
            if v42 ~= nil then
                v42 = v42:FindFirstChildWhichIsA("Humanoid")
            end
            if not v42 then
                p40:setCancelled(true)
                return nil
            end
            if u36.isMounted == true then
                p40:setCancelled(true)
                return nil
            end
        end
    end))
    p37:GiveTask(u27.Client:Get("ElkBelowChargeThreshold"):Connect(function() --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u16
            [3] = u4
        --]]
        local v43 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u16.ELK_ANTLER_UPPERCUT)
        if not v43 then
            return nil
        end
        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v43, u4.DISABLED)
    end))
    p37:GiveTask(u27.Client:Get("ElkAboveChargeThreshold"):Connect(function() --[[ Line: 107 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u16
            [3] = u4
        --]]
        local v44 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u16.ELK_ANTLER_UPPERCUT)
        if not v44 then
            return nil
        end
        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v44, u4.READY)
    end))
end
function u31.onKitLocalDeactivated(_) --[[ Line: 115 ]] end
function u31.onKitReplicationActivated(u45, p46) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u26
        [3] = u12
        [4] = u9
        [5] = u20
        [6] = u1
        [7] = u19
        [8] = u5
        [9] = u28
        [10] = u2
        [11] = u16
        [12] = u4
        [13] = u17
        [14] = u14
        [15] = u7
        [16] = u27
        [17] = u29
        [18] = u21
        [19] = u10
        [20] = u13
        [21] = u25
        [22] = u24
    --]]
    p46:GiveTask(u15.GenericMountMounted:connect(function(p47) --[[ Line: 118 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u12
            [3] = u45
            [4] = u9
            [5] = u20
            [6] = u1
            [7] = u19
            [8] = u5
            [9] = u28
            [10] = u2
            [11] = u16
            [12] = u4
            [13] = u17
            [14] = u14
            [15] = u7
            [16] = u15
        --]]
        if p47.mountType == u26.ELK and p47.player == u12.LocalPlayer then
            u45.summonAbilityMaid = u9.new()
            local v48 = u20:getEntity(p47.player)
            if not (v48 and u1.instanceof(v48, u19)) then
                return nil
            end
            local v49 = u5
            local v50 = u28.ELK_SUMMON
            local v51 = {
                ["rollOffMaxDistance"] = 100
            }
            local v52
            if p47.player == u12.LocalPlayer then
                v52 = nil
            else
                v52 = v48:getInstance():GetPrimaryPartCFrame().Position
            end
            v51.position = v52
            local u53 = v49:playSound(v50, v51)
            local u54 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u16.ELK_SUMMON)
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u54, u4.DISABLED)
            u45.isMounted = true
            local u55 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u16.ELK_DISMISS, u17[u16.ELK_DISMISS].triggerConfig):expect()
            local v56 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
            local v57 = u16.ELK_ANTLER_UPPERCUT
            local v58 = {}
            for v59, v60 in u17[u16.ELK_ANTLER_UPPERCUT].triggerConfig do
                v58[v59] = v60
            end
            function v58.getExtraData() --[[ Line: 141 ]]
                --[[
                Upvalues:
                    [1] = u14
                --]]
                return {
                    ["direction"] = u14.CurrentCamera.CFrame.LookVector
                }
            end
            local u61 = v56:enableAbility(v57, v58):expect()
            u7.Controllers.SwordController:toggleSwordSwing(true)
            u7.Controllers.BlockPlacementController:disableBlockPlacer()
            local u63 = u15.BeginProjectileTargeting:connect(function(p62) --[[ Line: 149 ]]
                p62:setCancelled(true)
                return nil
            end)
            u45.summonAbilityMaid:GiveTask(function() --[[ Line: 153 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u63
                --]]
                u7.Controllers.SwordController:toggleSwordSwing(false)
                u7.Controllers.BlockPlacementController:enableBlockPlacer()
                u63:Destroy()
            end)
            u45.summonAbilityMaid:GiveTask(function() --[[ Line: 159 ]]
                --[[
                Upvalues:
                    [1] = u55
                    [2] = u2
                    [3] = u54
                    [4] = u4
                    [5] = u61
                    [6] = u53
                --]]
                u55.Destroy()
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u54, u4.READY)
                u61.Destroy()
                u53:Destroy()
            end)
        end
    end))
    p46:GiveTask(u15.GenericMountDismounted:connect(function(p64) --[[ Line: 167 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u26
            [3] = u20
            [4] = u1
            [5] = u19
            [6] = u5
            [7] = u28
            [8] = u45
            [9] = u27
        --]]
        if p64.player == u12.LocalPlayer and p64.mountType == u26.ELK then
            local v65 = u20:getEntity(p64.player)
            if not (v65 and u1.instanceof(v65, u19)) then
                return nil
            end
            local v66 = u5
            local v67 = u28.ELK_DISMISS
            local v68 = {
                ["rollOffMaxDistance"] = 100
            }
            local v69
            if p64.player == u12.LocalPlayer then
                v69 = nil
            else
                v69 = v65:getInstance():GetPrimaryPartCFrame().Position
            end
            v68.position = v69
            v66:playSound(v67, v68)
            local v70 = u45.playerModifierMaid
            if v70 ~= nil then
                v70:DoCleaning()
            end
            local v71 = u45.summonAbilityMaid
            if v71 ~= nil then
                v71:DoCleaning()
            end
            local v72 = u45.uppercutAnimationMaid
            if v72 ~= nil then
                v72:DoCleaning()
            end
            local v73 = u45.chargeMaidMap[p64.player]
            if v73 ~= nil then
                v73:DoCleaning()
            end
            u45.isMounted = false
            u27.Client:Get("Dismount"):SendToServer({
                ["mountType"] = u26.ELK
            })
        end
    end))
    p46:GiveTask(u15.StatusEffectAdded:connect(function(p74) --[[ Line: 202 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u12
            [3] = u7
            [4] = u21
            [5] = u45
            [6] = u27
        --]]
        if p74.statusEffect ~= u29.GROUNDED and p74.statusEffect ~= u29.FROSTED then
            return nil
        end
        local v75 = u12:GetPlayerFromCharacter(p74.entityInstance)
        if not v75 then
            return nil
        end
        if not u7.Controllers.KitController:isUsingKit(v75, u21.ELK_MASTER) then
            return nil
        end
        local v76 = u45.chargeMaidMap[v75]
        if v76 ~= nil then
            v76:DoCleaning()
        end
        if v75 ~= u12.LocalPlayer then
            return nil
        end
        if u45.isMounted then
            u27.Client:Get("Dismount"):SendToServer()
        end
    end))
    p46:GiveTask(u15.StatusEffectReapplied:connect(function(p77) --[[ Line: 224 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u12
            [3] = u7
            [4] = u21
            [5] = u45
            [6] = u27
        --]]
        if p77.statusEffect ~= u29.GROUNDED and p77.statusEffect ~= u29.FROSTED then
            return nil
        end
        local v78 = u12:GetPlayerFromCharacter(p77.entityInstance)
        if not v78 then
            return nil
        end
        if not u7.Controllers.KitController:isUsingKit(v78, u21.ELK_MASTER) then
            return nil
        end
        local v79 = u45.chargeMaidMap[v78]
        if v79 ~= nil then
            v79:DoCleaning()
        end
        if v78 ~= u12.LocalPlayer then
            return nil
        end
        if u45.isMounted then
            u27.Client:Get("Dismount"):SendToServer()
        end
    end))
    p46:GiveTask(u27.Client:Get("SigridBeginCharge"):Connect(function(u80) --[[ Line: 246 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u9
            [3] = u12
            [4] = u10
            [5] = u7
            [6] = u13
            [7] = u25
        --]]
        u45:enableChargingEffects(u80.player)
        local u81 = u80.player.Character
        local v82
        if u81 == nil then
            v82 = u81
        else
            v82 = u81.PrimaryPart
        end
        if not v82 then
            return nil
        end
        local v83 = u45.chargeMaidMap[u80.player] or u9.new()
        u45.chargeMaidMap[u80.player] = v83
        if u80.player == u12.LocalPlayer then
            local u84 = u10("Attachment", {
                ["Parent"] = u81.PrimaryPart
            })
            local u85 = u10("AngularVelocity", {
                ["MaxTorque"] = (1 / 0),
                ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
                ["Attachment0"] = u84,
                ["Parent"] = u81.PrimaryPart
            })
            v83:GiveTask(function() --[[ Line: 278 ]]
                --[[
                Upvalues:
                    [1] = u85
                    [2] = u84
                --]]
                u85:Destroy()
                u84:Destroy()
            end)
            v83:GiveTask(u7.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["blockSprint"] = true,
                ["moveSpeedMultiplier"] = 0.01
            }))
            u45.chargeSpeed = 0
            v83:GiveTask(function() --[[ Line: 288 ]]
                --[[
                Upvalues:
                    [1] = u45
                --]]
                u45.chargeSpeed = 0
            end)
        end
        local u86 = 0
        v83:GiveTask((u13.Heartbeat:Connect(function(p87) --[[ Line: 293 ]]
            --[[
            Upvalues:
                [1] = u81
                [2] = u86
                [3] = u25
                [4] = u45
                [5] = u80
                [6] = u12
            --]]
            local v88 = u81
            if v88 ~= nil then
                v88 = v88.PrimaryPart
            end
            if not v88 then
                return nil
            end
            u86 = u86 + p87
            if u86 > u25.CHARGE_DURATION then
                local v89 = u45.chargeMaidMap[u80.player]
                if v89 ~= nil then
                    v89:DoCleaning()
                end
            end
            local v90 = u45
            local v91 = u86 * 8
            v90.chargeSpeed = math.pow(v91, 0.5) * 4.8 + 26
            if u12.LocalPlayer == u80.player then
                local v92 = u81.PrimaryPart.CFrame
                local v93 = CFrame.new(0, 0, -u45.chargeSpeed * p87)
                u81.PrimaryPart.CFrame = v92 * v93
            end
        end)))
    end))
    p46:GiveTask(u27.Client:Get("SigridEndCharge"):Connect(function(p94) --[[ Line: 321 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u24
        --]]
        local v95 = u45.chargeMaidMap[p94.player]
        if v95 ~= nil then
            v95:DoCleaning()
        end
        if p94.chargeEndReason == u24.ENTITY_HIT or p94.chargeEndReason == u24.BLOCK_HIT then
            u45:playUppercutAttackEffects(p94.player)
        end
    end))
end
function u31.onKitReplicationDeactivated(_) --[[ Line: 334 ]] end
function u31.onInnateAbilityEnabled(_, _, _) --[[ Line: 336 ]] end
function u31.onAbilityUsed(p96, p97, p98) --[[ Line: 338 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u16
        [3] = u27
    --]]
    local v99 = u12:GetPlayerFromCharacter(p97)
    if not v99 then
        return nil
    end
    if p98.userCharacter:FindFirstChildOfClass("Humanoid") == nil then
        return nil
    end
    if p98.ability == u16.ELK_SUMMON and v99 == u12.LocalPlayer then
        p96:giveSummonModifiers()
    end
    if p98.ability == u16.ELK_DISMISS and v99 == u12.LocalPlayer then
        u27.Client:Get("Dismount"):SendToServer()
    end
    if p98.ability == u16.ELK_ANTLER_UPPERCUT then
        if v99 ~= u12.LocalPlayer then
            return nil
        end
        u27.Client:Get("SigridBeginChargeRequest"):CallServer({
            ["player"] = v99
        })
    end
end
function u31.giveSummonModifiers(p100) --[[ Line: 366 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u25
        [4] = u27
    --]]
    p100.playerModifierMaid = u9.new()
    local v101 = u8.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["blockSprint"] = false,
        ["moveSpeedMultiplier"] = u25.ELK_SUMMON_SPEED_MULTIPLIER
    })
    local v102 = u8.Controllers.JumpHeightController:getJumpModifier():addModifier({
        ["jumpHeightMultiplier"] = u25.ELK_SUMMON_JUMP_MULTIPLIER
    })
    p100.playerModifierMaid:GiveTask(v101)
    p100.playerModifierMaid:GiveTask(v102)
    u27.Client:Get("ElkKitMounted"):SendToServer()
end
function u31.enableChargingEffects(p103, p104) --[[ Line: 381 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u18
        [3] = u5
        [4] = u28
        [5] = u9
    --]]
    if not p104.Character then
        return nil
    end
    local v105 = u8.Controllers.MountController:getActiveMounts()[p104]
    if v105 ~= nil then
        v105 = v105.model
    end
    if v105 then
        local u106 = u8.Controllers.MountAnimationController:playAnimationInMount(v105, u18.ELK_CHARGING)
        local v107 = v105:FindFirstChild("body_mesh"):FindFirstChild("RightTrailPart")
        local v108 = v105:FindFirstChild("body_mesh"):FindFirstChild("LeftTrailPart")
        local u109 = v107:FindFirstChild("Trail")
        local u110 = v108:FindFirstChild("Trail")
        if u106 then
            u106.Priority = Enum.AnimationPriority.Action
            if u109 and u110 then
                if u109.Enabled == false then
                    u109.Enabled = true
                end
                if u110.Enabled == false then
                    u110.Enabled = true
                end
            end
            local u111 = u5:playSound(u28.ELK_CHARGING_LOOP, {
                ["rollOffMaxDistance"] = 100,
                ["looped"] = true,
                ["parent"] = p104.Character.PrimaryPart
            })
            local v112 = p103.chargeMaidMap[p104] or u9.new()
            p103.chargeMaidMap[p104] = v112
            v112:GiveTask(function() --[[ Line: 425 ]]
                --[[
                Upvalues:
                    [1] = u106
                    [2] = u109
                    [3] = u110
                    [4] = u111
                --]]
                u106:Stop()
                u106:Destroy()
                if u109 and u110 then
                    if u109.Enabled == true then
                        u109.Enabled = false
                    end
                    if u110.Enabled == true then
                        u110.Enabled = false
                    end
                end
                u111:Destroy()
            end)
        end
    end
end
function u31.playUppercutAttackEffects(u113, p114) --[[ Line: 441 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u28
        [4] = u8
        [5] = u18
    --]]
    local v115 = p114.Character
    local v116
    if v115 == nil then
        v116 = v115
    else
        v116 = v115.PrimaryPart
    end
    if v116 then
        u113.uppercutAnimationMaid = u9.new()
        u5:playSound(u28.ELK_UPPERCUT, {
            ["rollOffMaxDistance"] = 100,
            ["position"] = v115.PrimaryPart.Position
        })
        local v117 = u8.Controllers.MountController:getActiveMounts()[p114]
        if v117 ~= nil then
            v117 = v117.model
        end
        local u118 = v117 and u8.Controllers.MountAnimationController:playAnimationInMount(v117, u18.ELK_UPPERCUT)
        if u118 then
            u118.Priority = Enum.AnimationPriority.Action
            u113.uppercutAnimationMaid:GiveTask(function() --[[ Line: 466 ]]
                --[[
                Upvalues:
                    [1] = u118
                --]]
                u118:Stop()
                u118:Destroy()
            end)
            u118:GetMarkerReachedSignal("impact"):Connect(function() --[[ Line: 470 ]]
                --[[
                Upvalues:
                    [1] = u113
                --]]
                task.delay(0.7, function() --[[ Line: 471 ]]
                    --[[
                    Upvalues:
                        [1] = u113
                    --]]
                    local v119 = u113.uppercutAnimationMaid
                    if v119 ~= nil then
                        v119:DoCleaning()
                    end
                end)
            end)
        end
    end
end
u7.CreateController(u31.new())
return nil