local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.RandomUtil
local u6 = v3.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.Players
local u12 = v9.ReplicatedStorage
local u13 = v9.RunService
local u14 = v9.TweenService
local u15 = v9.Workspace
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local v19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "falconer", "falcon-constants")
local u20 = v19.AGGRO_SPEED
local u21 = v19.ATTACK_RANGE
local u22 = v19.FalconState
local u23 = v19.MIN_DISTANCE_TO_TELEPORT
local u24 = v19.MIN_MOVE_DISTANCE_TO_TARGET
local u25 = v19.MIN_Y
local u26 = v19.RECALL_SPEED
local u27 = v19.SCOUTING_HEIGHT
local u28 = v19.SCOUTING_RADIUS
local u29 = v19.SCOUTING_SPEED
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity").StatefulEntity
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil
local u34 = { u30.FALCON_SCREECH, u30.FALCON_SCREECH_2, u30.FALCON_SCREECH_3 }
local u35 = { u30.FALCON_CRY, u30.FALCON_CRY_2, u30.FALCON_CRY_3 }
local u36 = { u30.FALCON_WING_FLAP_1, u30.FALCON_WING_FLAP_2, u30.FALCON_WING_FLAP_3 }
local u37 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 44 ]]
        return "FalconClient"
    end,
    ["__index"] = u31
})
u37.__index = u37
function u37.new(...) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u37
    --]]
    local v38 = u37
    local v39 = setmetatable({}, v38)
    return v39:constructor(...) or v39
end
function u37.constructor(p40, p41, p42, p43, p44) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u22
        [3] = u32
        [4] = u11
        [5] = u7
    --]]
    u31.constructor(p40, u22.SPAWNING, u32.FALCON, p41, p42)
    p40.lastOwnerPositionPolledTime = 0
    p40.elapsedTime = 0
    p40.visible = false
    p40.entityHealthbarOn = false
    p40.lastState = u22.SPAWNING
    p40.lastAttackAnimationTime = 0
    p40.serverInstance = p43
    p40.owner = p44
    local v45 = p44:GetAttribute("Team")
    local v46 = p40.gameEntity
    if v46 ~= nil then
        v46:SetAttribute("Team", v45)
    end
    if p40.owner == u11.LocalPlayer then
        u7.Controllers.FalconerController:setFalconReference(p40.serverInstance)
    end
    p40:setUpAnimationTrack()
end
function u37.setStrikeZoneEpicenter(p47, p48) --[[ Line: 75 ]]
    p47.strikeZoneEpicenter = p48
end
function u37.setTarget(p49, p50) --[[ Line: 78 ]]
    p49.currentTarget = p50
end
function u37.setPosition(p51, p52) --[[ Line: 81 ]]
    local v53 = p51.gameEntity
    if v53 ~= nil then
        v53:PivotTo(p52)
    end
end
function u37.createEntityHealthbar(p54) --[[ Line: 87 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u16
    --]]
    if p54.entityHealthbarOn then
        return nil
    end
    if p54.gameEntity and p54.serverInstance then
        local v55 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
        local v56 = {
            ["app"] = u16
        }
        local v57 = p54.entityUUID
        v56.appId = "StatefulEntityHpBarBillboard_" .. tostring(v57)
        p54.entityHealthbarOn = v55:openApp(v56, {
            ["hpBarOffset"] = Vector3.new(0, 2, 0),
            ["maxDistance"] = 150,
            ["gameEntity"] = p54.gameEntity,
            ["serverInstance"] = p54.serverInstance
        }, nil, p54.gameEntity)
    end
end
function u37.createGameEntity(p58, p59) --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u10
        [3] = u8
        [4] = u15
        [5] = u33
    --]]
    local v60 = u12.Assets.Misc.Eagle:Clone()
    u10:AddTag(v60, "FirstPersonHidden")
    local v61 = u8
    local v62 = {
        ["Name"] = "FalconForce"
    }
    local v63 = u15.Gravity * v60.PrimaryPart.AssemblyMass
    v62.Force = Vector3.new(0, v63, 0)
    v62.Parent = v60.PrimaryPart
    v61("BodyForce", v62)
    u33:setEntityIgnoreQuery(v60)
    u33:setClientEntityNotCollidable(v60)
    v60:PivotTo(p59)
    p58.gameEntity = v60
    v60.Parent = u15
    p58:onHeartbeat()
    p58:registerClientGameEntity(v60)
end
function u37.onEntityDamaged(p64, _, _) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u5
        [3] = u34
        [4] = u6
        [5] = u4
        [6] = u18
        [7] = u17
    --]]
    if not p64.gameEntity then
        return nil
    end
    if p64.activeState == u22.SPAWNING or p64.activeState == u22.RECALLED then
        return nil
    end
    local v65 = u34
    u6:playSound(u5.fromList(unpack(v65)), {
        ["rollOffMaxDistance"] = 50,
        ["position"] = p64.gameEntity:GetPivot().Position
    })
    local v66 = u4:playAnimation(p64.gameEntity, u18:getAssetId(u17.FALCON_RECOIL), {
        ["looped"] = false
    })
    if v66 then
        v66:AdjustSpeed(1.5)
        v66.Priority = Enum.AnimationPriority.Action3
    end
end
function u37.onEntityDeath(p67) --[[ Line: 146 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u7
    --]]
    if p67.owner == u11.LocalPlayer then
        u7.Controllers.FalconerController:unmountFalconHealthbarGui()
    end
end
function u37.onStateEnter(p68, p69) --[[ Line: 151 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    if p69 == u22.RECALLED then
        p68:enterRecalledState()
    end
    if p69 == u22.SCOUTING then
        p68:enterScoutingState()
    end
    if p69 == u22.AGGRO then
        p68:enterAggroState()
    end
end
function u37.onStateExit(_, _) --[[ Line: 162 ]] end
function u37.handleActionRequest(_, _, _) --[[ Line: 164 ]] end
function u37.onHeartbeat(u70) --[[ Line: 166 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u15
        [3] = u22
        [4] = u21
        [5] = u4
        [6] = u18
        [7] = u17
    --]]
    local v71 = u70.lastOwnerPositionPolledTime
    if v71 == 0 or (v71 ~= v71 or not v71) then
        u70.lastOwnerPositionPolledTime = 0
    end
    u13.Heartbeat:Connect(function(p72) --[[ Line: 171 ]]
        --[[
        Upvalues:
            [1] = u70
            [2] = u15
            [3] = u22
            [4] = u21
            [5] = u4
            [6] = u18
            [7] = u17
        --]]
        if u70.lastOwnerPositionPolledTime + 1 < u15:GetServerTimeNow() then
            local v73 = u70.owner
            if v73 ~= nil then
                v73 = v73.Character
                if v73 ~= nil then
                    v73 = v73.PrimaryPart
                    if v73 ~= nil then
                        v73 = v73.Position
                    end
                end
            end
            u70.lastOwnerPosition = v73
            u70.lastOwnerPositionPolledTime = u15:GetServerTimeNow()
        end
        if not (u70.gameEntity and u70.gameEntity.Parent) then
            return nil
        end
        if u70.activeState == u22.RECALLED then
            u70:followOwner(p72)
        end
        if u70.activeState == u22.SCOUTING then
            u70:scoutStrikeZone(p72)
        end
        if u70.activeState == u22.AGGRO then
            if not u70.currentTarget then
                return nil
            end
            local v74 = u70.currentTarget
            if v74 ~= nil then
                v74 = v74.PrimaryPart
                if v74 ~= nil then
                    v74 = v74.Position
                end
            end
            local v75 = u70.gameEntity:GetPivot().Position
            if not (u70.currentTarget and (v74 and v75)) then
                return nil
            end
            u70:moveTowardsCurrentTarget(p72)
            local v76 = (v74 - v75).Magnitude
            if v76 == 0 then
                v76 = false
            elseif v76 ~= v76 then
                v76 = false
            end
            if (not v76 or (v74 - v75).Magnitude < u21 + 5) and u70.lastAttackAnimationTime + 2 < u15:GetServerTimeNow() then
                u70.lastAttackAnimationTime = u15:GetServerTimeNow()
                local v77 = u4:playAnimation(u70.gameEntity, u18:getAssetId(u17.FALCON_ATTACK), {
                    ["looped"] = false
                })
                if v77 then
                    v77:AdjustSpeed(1.5)
                    v77.Priority = Enum.AnimationPriority.Action
                end
            end
        end
    end)
end
function u37.moveTowardsCurrentTarget(p78, p79) --[[ Line: 232 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    if not (p78.currentTarget and p78.gameEntity) then
        return nil
    end
    local v80 = p78.currentTarget
    if v80 ~= nil then
        v80 = v80.PrimaryPart
        if v80 ~= nil then
            v80 = v80.Position
        end
    end
    if not v80 then
        return nil
    end
    p78:moveToTargetPosition(v80, u20, v80, p79)
end
function u37.followOwner(p81, p82) --[[ Line: 249 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u23
        [3] = u26
        [4] = u6
        [5] = u30
    --]]
    if not (p81.owner and (p81.owner.Character and p81.gameEntity)) then
        return nil
    end
    local v83 = p81.owner.Character
    if v83 ~= nil then
        v83 = v83.PrimaryPart
        if v83 ~= nil then
            v83 = v83.Position
        end
    end
    if not v83 then
        return nil
    end
    local v84 = p81.owner.Character
    if v84 ~= nil then
        v84 = v84:FindFirstChild("LeftUpperArm")
        if v84 ~= nil then
            v84 = v84:FindFirstChild("LeftShoulderAttachment")
        end
    end
    if v84 ~= nil then
        v84 = v84.WorldPosition
    end
    if v84 == nil then
        v84 = v83
    end
    local v85 = v84 + Vector3.new(0, 10, 0)
    local v86 = v85.X
    local v87 = v85.Y
    local v88 = u25
    local v89 = math.max(v87, v88)
    local v90 = v85.Z
    local v91 = Vector3.new(v86, v89, v90)
    local v92 = not p81.lastOwnerPosition
    if not v92 then
        v92 = p81.lastOwnerPosition
        if v92 then
            v92 = (p81.lastOwnerPosition - v83).Magnitude
            if v92 ~= 0 and (v92 == v92 and v92) then
                v92 = u23 < (p81.lastOwnerPosition - v83).Magnitude
            end
        end
    end
    if v92 ~= 0 and (v92 == v92 and v92) then
        p81.gameEntity:PivotTo(CFrame.new(v91))
        return nil
    end
    p81:moveToTargetPosition(v91, u26, v91, p82)
    local v93 = (p81.gameEntity:GetPivot().Position - v91).Magnitude
    if p81.visible and v93 < 10 then
        p81:playDesummonEffects(CFrame.new(v91, p81.gameEntity:GetPivot().Position))
        local v94 = {
            ["rollOffMaxDistance"] = 60,
            ["position"] = p81.gameEntity:GetPivot().Position
        }
        u6:playSound(u30.FALCON_DESUMMON, v94)
    end
end
function u37.moveToTargetPosition(p95, p96, p97, p98, p99) --[[ Line: 313 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    if not p95.gameEntity then
        return nil
    end
    local v100 = p95.gameEntity:GetPivot().Position
    if not v100 then
        return nil
    end
    local v101 = not p96
    if not v101 then
        local v102
        if p96 == nil then
            v102 = p96
        else
            v102 = (p96 - v100).Magnitude
        end
        v101 = v102 < u24
    end
    if v101 then
        return nil
    end
    local v103 = (p96 - v100).Magnitude
    local v104
    if v103 == 0 or (v103 ~= v103 or not v103) then
        v104 = p96 - v100
    else
        v104 = (p96 - v100).Unit
    end
    if v104 == Vector3.new(nil, nil, nil) or not v104 then
        return nil
    end
    local v105 = v100 + v104 * (p97 * p99)
    local v106 = (v105 - v100).Magnitude
    if v106 == 0 then
        v106 = false
    elseif v106 ~= v106 then
        v106 = false
    end
    if not v106 or (v105 - v100).Magnitude > (p96 - v100).Magnitude then
        v105 = p96
    end
    p95.gameEntity:PivotTo(CFrame.new(v105, p98))
end
function u37.enterRecalledState(p107) --[[ Line: 372 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u22
        [3] = u7
    --]]
    local v108 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
    local v109 = p107.entityUUID
    v108:closeApp("StatefulEntityHpBarBillboard_" .. tostring(v109))
    p107.entityHealthbarOn = false
    p107.lastState = u22.RECALLED
    if not p107.owner then
        return nil
    end
    u7.Controllers.FalconerController:disableRecallFalcon(p107.owner)
    if p107.divingTrack then
        p107.divingTrack:Stop()
    end
    if p107.soaringTrack then
        p107.soaringTrack:Play()
    end
end
function u37.enterScoutingState(u110) --[[ Line: 387 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u6
        [3] = u30
        [4] = u5
        [5] = u36
        [6] = u7
    --]]
    u110.elapsedTime = 0
    if u110.lastState == u22.RECALLED then
        task.defer(function() --[[ Line: 390 ]]
            --[[
            Upvalues:
                [1] = u110
                [2] = u6
                [3] = u30
                [4] = u5
                [5] = u36
            --]]
            local v111 = u110.gameEntity
            if v111 ~= nil then
                v111 = v111:GetPivot()
            end
            if v111 then
                u110:playSummonEffects(v111)
            end
            if u110.gameEntity then
                local v112 = u110.gameEntity:GetPivot().Position
                u6:playSound(u30.FALCON_SUMMON, {
                    ["rollOffMaxDistance"] = 60,
                    ["position"] = v112
                })
                local v113 = u36
                u6:playSound(u5.fromList(unpack(v113)), {
                    ["rollOffMaxDistance"] = 50,
                    ["position"] = v112
                })
            end
        end)
    end
    if u110.divingTrack then
        u110.divingTrack:Stop()
    end
    if u110.soaringTrack then
        u110.soaringTrack:Play()
    end
    u110:createEntityHealthbar()
    u110.lastState = u22.SCOUTING
    if not u110.owner then
        return nil
    end
    u7.Controllers.FalconerController:enableRecallFalcon(u110.owner)
end
function u37.enterAggroState(p114) --[[ Line: 427 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u35
        [3] = u6
        [4] = u22
    --]]
    if not p114.gameEntity then
        return nil
    end
    local v115 = u35
    u6:playSound(u5.fromList(unpack(v115)), {
        ["rollOffMaxDistance"] = 200,
        ["position"] = p114.gameEntity:GetPivot().Position
    })
    if p114.soaringTrack then
        p114.soaringTrack:Stop()
    end
    if p114.divingTrack then
        p114.divingTrack:Play()
    end
    p114:createEntityHealthbar()
    p114.lastState = u22.AGGRO
end
function u37.scoutStrikeZone(p116, p117) --[[ Line: 447 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u27
        [3] = u29
    --]]
    if not p116.strikeZoneEpicenter then
        return nil
    end
    if not p116.gameEntity then
        return nil
    end
    p116.elapsedTime = p116.elapsedTime + p117
    local v118 = p116.strikeZoneEpicenter
    local v119 = p116.elapsedTime
    local v120 = math.sin(v119) * u28
    local v121 = u27
    local v122 = p116.elapsedTime
    local v123 = math.cos(v122) * u28
    local v124 = v118 + Vector3.new(v120, v121, v123)
    p116:moveToTargetPosition(v124, u29, v124, p117)
end
function u37.playSummonEffects(p125, p126) --[[ Line: 460 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u12
        [3] = u15
        [4] = u11
        [5] = u10
    --]]
    local v127 = p125.gameEntity
    if v127 ~= nil then
        v127 = v127:FindFirstChild("falcon")
    end
    if v127 then
        u14:Create(v127, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
            ["Transparency"] = 0
        }):Play()
    end
    local v128 = p125.gameEntity
    if v128 ~= nil then
        local v129 = 0
        v128 = {}
        for v130, v131 in v128:GetDescendants() do
            local _ = v130 - 1
            if v131:IsA("Trail") == true then
                v129 = v129 + 1
                v128[v129] = v131
            end
        end
    end
    if v128 then
        for _, v132 in v128 do
            v132.Transparency = NumberSequence.new(0.7, 0.925)
        end
    end
    p125.visible = true
    local u133 = u12.Assets.Effects.EagleSummon:Clone()
    u133.Parent = u15
    local v134 = p125.currentTarget
    if v134 ~= nil then
        v134 = v134.PrimaryPart
        if v134 ~= nil then
            v134 = v134.Position
        end
    end
    if v134 then
        p126 = CFrame.new(p126.Position, p125.currentTarget.PrimaryPart.Position)
    end
    u133.CFrame = p126
    local u135 = u133.RootAttachment.Specs
    local u136 = u133.RootAttachment.Wind
    local v137 = u133.SummonCircle.SummonCircle
    v137:Emit(1)
    local v138 = u133.Smoke
    v138:Emit(25)
    local v139 = u133.Feathers.FeatherParticle
    v139:Emit(10)
    if p125.owner == u11.LocalPlayer then
        u10:AddTag(u135, "FirstPersonHidden")
        u10:AddTag(u136, "FirstPersonHidden")
        u10:AddTag(v137, "FirstPersonHidden")
        u10:AddTag(v138, "FirstPersonHidden")
        u10:AddTag(v139, "FirstPersonHidden")
    end
    task.delay(0.75, function() --[[ Line: 527 ]]
        --[[
        Upvalues:
            [1] = u135
            [2] = u136
        --]]
        u135.Enabled = false
        u136.Enabled = false
    end)
    task.delay(2.5, function() --[[ Line: 531 ]]
        --[[
        Upvalues:
            [1] = u133
        --]]
        u133:Destroy()
    end)
end
function u37.playDesummonEffects(p140, p141) --[[ Line: 535 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u12
        [3] = u15
        [4] = u11
        [5] = u10
    --]]
    local v142 = p140.gameEntity
    if v142 ~= nil then
        v142 = v142:FindFirstChild("falcon")
    end
    if v142 then
        u14:Create(v142, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
            ["Transparency"] = 1
        }):Play()
    end
    local v143 = p140.gameEntity
    if v143 ~= nil then
        local v144 = 0
        v143 = {}
        for v145, v146 in v143:GetDescendants() do
            local _ = v145 - 1
            if v146:IsA("Trail") == true then
                v144 = v144 + 1
                v143[v144] = v146
            end
        end
    end
    if v143 then
        for _, v147 in v143 do
            v147.Transparency = NumberSequence.new(1)
        end
    end
    p140.visible = false
    local u148 = u12.Assets.Effects.EagleSummon:Clone()
    u148.Parent = u15
    local v149 = p140.currentTarget
    if v149 ~= nil then
        v149 = v149.PrimaryPart
        if v149 ~= nil then
            v149 = v149.Position
        end
    end
    if v149 then
        CFrame.new(p141.Position, p140.currentTarget.PrimaryPart.Position)
    end
    u148.CFrame = p141
    local u150 = u148.RootAttachment.Specs
    local u151 = u148.RootAttachment.Wind
    local v152 = u148.SummonCircle.SummonCircle
    v152:Emit(1)
    local v153 = u148.Smoke
    v153:Emit(20)
    if p140.owner == u11.LocalPlayer then
        u10:AddTag(u150, "FirstPersonHidden")
        u10:AddTag(u151, "FirstPersonHidden")
        u10:AddTag(v152, "FirstPersonHidden")
        u10:AddTag(v153, "FirstPersonHidden")
    end
    task.delay(0.5, function() --[[ Line: 598 ]]
        --[[
        Upvalues:
            [1] = u150
            [2] = u151
        --]]
        u150.Enabled = false
        u151.Enabled = false
    end)
    task.delay(2, function() --[[ Line: 602 ]]
        --[[
        Upvalues:
            [1] = u148
        --]]
        u148:Destroy()
    end)
end
function u37.setUpAnimationTrack(p154) --[[ Line: 606 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u17
    --]]
    local v155 = p154.gameEntity
    if v155 ~= nil then
        v155 = v155:WaitForChild("AnimationController", 3)
        if v155 ~= nil then
            v155 = v155:WaitForChild("Animator", 3)
        end
    end
    p154.soaringTrack = v155:LoadAnimation(u18:getAnimation(u17.FALCON_WING_FLAP))
    if p154.soaringTrack then
        p154.soaringTrack.Priority = Enum.AnimationPriority.Idle
    end
    p154.soaringTrack.Looped = true
    p154.divingTrack = v155:LoadAnimation(u18:getAnimation(u17.FALCON_DIVE))
    if p154.soaringTrack then
        p154.soaringTrack.Priority = Enum.AnimationPriority.Movement
    end
    p154.divingTrack.Looped = true
end
return {
    ["FalconClient"] = u37
}