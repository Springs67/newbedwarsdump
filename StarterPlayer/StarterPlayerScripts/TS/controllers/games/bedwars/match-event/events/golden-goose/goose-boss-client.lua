local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.AnimationUtil
local u6 = v4.RandomUtil
local u7 = v4.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u10 = v9.Linear
local u11 = v9.OutQuad
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.CollectionService
local u15 = v13.Players
local u16 = v13.ReplicatedStorage
local u17 = v13.RunService
local u18 = v13.Workspace
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local v24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golden-goose", "golden-goose-constants")
local u25 = v24.GoldenGooseConstants
local u26 = v24.GooseBossAction
local u27 = v24.GooseBossState
local v28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golem-boss", "golem-boss-constants")
local u29 = v28.GOLEM_SCREEN_SHAKE_THRESHOLD
local u30 = v28.GOLEM_TURN_DURATION
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity").StatefulEntity
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u36 = {
    [0] = u21.CRAB_BOSS_CLAW_ATTACK,
    [0.8726646259971648] = u21.CRAB_BOSS_STAB_50,
    [1.5707963267948966] = u21.CRAB_BOSS_STAB_90,
    [2.2689280275926285] = u21.CRAB_BOSS_STAB_130,
    [4.014257279586958] = u21.CRAB_BOSS_STAB_230,
    [4.71238898038469] = u21.CRAB_BOSS_STAB_270,
    [5.410520681182422] = u21.CRAB_BOSS_STAB_310,
    [6.283185307179586] = u21.CRAB_BOSS_CLAW_ATTACK
}
local u37 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 54 ]]
        return "GooseBossClient"
    end,
    ["__index"] = u32
})
u37.__index = u37
function u37.new(...) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u37
    --]]
    local v38 = u37
    local v39 = setmetatable({}, v38)
    return v39:constructor(...) or v39
end
function u37.constructor(p40, p41, p42, p43) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u27
        [3] = u33
        [4] = u12
    --]]
    u32.constructor(p40, u27.SPAWNING, u33.GOOSE_BOSS, p41, p42)
    p40.isDead = false
    p40.stateMaid = u12.new()
    p40.activePoisonBlocks = {}
    p40.serverInstance = p43
    p40:createEntityHealthbar()
end
function u37.createEntityHealthbar(p44) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u20
    --]]
    if p44.gameEntity and p44.serverInstance then
        local v45 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
        local v46 = {
            ["app"] = u20
        }
        local v47 = p44.entityUUID
        v46.appId = "StatefulEntityHpBarBillboard_" .. tostring(v47)
        v45:openApp(v46, {
            ["hpBarOffset"] = Vector3.new(0, 6.5, 0),
            ["gameEntity"] = p44.gameEntity,
            ["serverInstance"] = p44.serverInstance
        }, nil, p44.gameEntity)
    end
end
function u37.createGameEntity(u48, p49) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u34
        [3] = u18
        [4] = u14
        [5] = u22
        [6] = u21
        [7] = u17
    --]]
    local u50 = u16.Assets.Misc.GooseBoss:Clone()
    u50:WaitForChild("RootPart").Anchored = true
    u34:setEntityIgnoreQuery(u50)
    u34:setClientEntityNotCollidable(u50)
    local v51, v52 = u50:GetBoundingBox()
    local v53 = v51 - v52 / 2 * Vector3.new(0, 1, 0)
    local v54 = (u50.PrimaryPart.CFrame - v53.Position).Y
    u50:PivotTo(p49 + Vector3.new(0, v54, 0))
    u48.gameEntity = u50
    u34:hideStatefulEntity(u48.gameEntity)
    u50.Parent = u18
    u14:AddTag(u50, "VisualGooseBoss")
    u48.gooseModel = u16.Assets.Misc.GoldenGoose:Clone()
    u48.gooseModel.Parent = u18
    for v55, v56 in u48.gooseModel:GetDescendants() do
        local _ = v55 - 1
        if v56:IsA("ParticleEmitter") then
            v56.Enabled = false
        end
        if v56:IsA("Trail") then
            v56.Enabled = false
        end
    end
    u22:playAnimation(u48.gooseModel, u21.GOLDEN_GOOSE_IDLE, {
        ["looped"] = true
    })
    local u57 = nil
    u57 = u17.Heartbeat:Connect(function() --[[ Line: 128 ]]
        --[[
        Upvalues:
            [1] = u50
            [2] = u48
            [3] = u57
        --]]
        local v58 = u50:FindFirstChild("cage_mesh")
        if v58 ~= nil then
            v58 = v58:FindFirstChild("GoosePosition")
        end
        if not v58 then
            return nil
        end
        local v59 = u48.gooseModel
        if v59 ~= nil then
            v59 = v59.Parent
        end
        if not v59 then
            u57:Disconnect()
            return nil
        end
        u48.gooseModel:PivotTo(v58.CFrame)
    end)
    u48.activePoisonBlocks = {}
    u48:registerClientGameEntity(u50)
end
function u37.handleActionRequest(p60, p61, p62) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    if p60.gameEntity and (p60.gameEntity.Parent and not p60.isDead) then
        if p61 == u26.FLIP_GROUND then
            p60:handleFlipGroundActionRequest(p62)
            return
        elseif p61 == u26.MISSILE_BARRAGE then
            p60:handleBarrage(p62)
            return
        elseif p61 == u26.UNBURROW then
            p60:handleUnburrow()
        elseif p61 == u26.BASIC_ATTACK then
            p60:handleBasicAttack(p62)
        end
    else
        return nil
    end
end
function u37.handleBasicAttack(p63, p64) --[[ Line: 166 ]]
    --[[
    Upvalues:
        [1] = u34
        [2] = u36
        [3] = u21
        [4] = u7
        [5] = u31
        [6] = u5
        [7] = u22
    --]]
    if not p63.gameEntity then
        return nil
    end
    local v65 = p64.target:GetPivot().Position
    local v66 = u34:getEntityFloorCFrame(p63.gameEntity)
    local v67 = v66 - v66.Position
    local v68 = v65 - v66.Position
    local v69 = v67:Inverse() * v68
    local v70 = v69.Z
    local v71 = v69.X
    local v72 = 6.283185307179586 - math.atan2(v70, v71) % 6.283185307179586
    local v73 = nil
    for v74, v75 in u36 do
        if v73 then
            local v76 = v74 - v72
            local v77 = math.abs(v76)
            local v78 = v73.angle - v72
            if v77 < math.abs(v78) then
                goto l6
            end
        else
            ::l6::
            v73 = {
                ["angle"] = v74,
                ["animation"] = v75
            }
        end
    end
    if not v73 then
        return nil
    end
    local v79 = u7
    local v80
    if v73.animation == u21.CRAB_BOSS_CLAW_ATTACK then
        v80 = u31.CRAB_BOSS_CLAW_ATTACK
    else
        v80 = u31.CRAB_BOSS_STAB_ATTACK
    end
    v79:playSound(v80, {
        ["position"] = p63.gameEntity:GetPivot().Position
    })
    u5:playAnimation(p63.gameEntity, u22:getAssetId(v73.animation), {
        ["looped"] = false
    })
end
function u37.handleUnburrow(u81) --[[ Line: 200 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u22
        [4] = u21
        [5] = u31
        [6] = u34
    --]]
    local v82 = u81.gameEntity
    if v82 ~= nil then
        v82 = v82.Parent
    end
    if not v82 then
        return nil
    end
    if u81.burrowLoop then
        u7:tweenSoundVolume(u81.burrowLoop, 0, 1)
        task.delay(1, function() --[[ Line: 211 ]]
            --[[
            Upvalues:
                [1] = u81
            --]]
            local v83 = u81.burrowLoop
            if v83 ~= nil then
                v83:Stop()
            end
            local v84 = u81.burrowLoop
            if v84 ~= nil then
                v84:Destroy()
            end
        end)
    end
    u5:playAnimation(u81.gameEntity, u22:getAssetId(u21.CRAB_BOSS_DIG_UP), {
        ["looped"] = false
    })
    u7:playSound(u31.CRAB_BOSS_BURROW_OUT, {
        ["position"] = u81.gameEntity:GetPivot().Position
    })
    u34:showStatefulEntity(u81.gameEntity)
    u34:showStatefulEntity(u81.gooseModel)
end
function u37.handleBarrage(u85, p86) --[[ Line: 231 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u22
        [3] = u21
        [4] = u25
    --]]
    u5:playAnimation(u85.gameEntity, u22:getAssetId(u21.CRAB_BOSS_BARRAGE_ATTACK), {
        ["looped"] = false
    })
    for _, v87 in p86.targets do
        local u88 = v87[1]
        for _, v89 in v87[2] do
            local v90 = u25.ACTION_BARRAGE_LAUNCH_TIMES[v89 + 1]
            task.delay(v90, function() --[[ Line: 240 ]]
                --[[
                Upvalues:
                    [1] = u85
                    [2] = u88
                --]]
                u85:launchMissile(u88)
            end)
        end
    end
end
function u37.launchMissile(p91, u92) --[[ Line: 246 ]]
    --[[
    Upvalues:
        [1] = u34
        [2] = u7
        [3] = u6
        [4] = u31
        [5] = u16
        [6] = u18
        [7] = u19
        [8] = u25
        [9] = u10
        [10] = u23
    --]]
    if not p91.gameEntity then
        return nil
    end
    local u93 = u34:getGameEntityCFrame(p91.gameEntity)
    local u94 = u93 * Vector3.new(0, -3, 5)
    u7:playSound(u6.fromList(u31.CRAB_BOSS_LAUNCH_1, u31.CRAB_BOSS_LAUNCH_2, u31.CRAB_BOSS_LAUNCH_3, u31.CRAB_BOSS_LAUNCH_4), {
        ["position"] = u94
    })
    local u95 = u16.Assets.Effects.CrabMissile:Clone()
    u95.Position = u94
    u95.Parent = u18
    local u96 = (math.random() - 0.5) * 120
    local u105 = u19(u25.MISSILE_FLIGHT_TIME_SEC, u10, function(p97) --[[ Line: 260 ]]
        --[[
        Upvalues:
            [1] = u92
            [2] = u93
            [3] = u96
            [4] = u23
            [5] = u94
            [6] = u95
        --]]
        local v98 = p97 - 0.5
        local v99 = math.pow(v98, 2) * math.sign(v98) / 0.5 + 0.5
        local v100 = u92:GetPivot().Position
        local v101 = (math.sqrt(v99) - v99) / 0.25
        local v102 = u96
        local v103 = (u93 - u93.Position) * CFrame.Angles(0, 0, (math.rad(v102)))
        local v104 = v101 * u23 * 4.5
        u95.Position = v103 * Vector3.new(0, v104, 0) + u94:Lerp(v100, v99)
    end)
    task.spawn(function() --[[ Line: 274 ]]
        --[[
        Upvalues:
            [1] = u105
            [2] = u7
            [3] = u6
            [4] = u31
            [5] = u94
            [6] = u95
        --]]
        u105:Wait()
        local v106 = {
            ["position"] = u94
        }
        u7:playSound(u6.fromList(u31.CRAB_BOSS_IMPACT_1, u31.CRAB_BOSS_IMPACT_2, u31.CRAB_BOSS_IMPACT_3, u31.CRAB_BOSS_IMPACT_4), v106)
        for v107, v108 in u95:GetDescendants() do
            local _ = v107 - 1
            if v108:IsA("ParticleEmitter") then
                v108.Enabled = false
            end
        end
        u95.Transparency = 1
        task.delay(3, function() --[[ Line: 290 ]]
            --[[
            Upvalues:
                [1] = u95
            --]]
            u95:Destroy()
        end)
    end)
end
function u37.handleFlipGroundActionRequest(u109, u110) --[[ Line: 295 ]]
    --[[
    Upvalues:
        [1] = u34
        [2] = u30
        [3] = u7
        [4] = u31
        [5] = u5
        [6] = u22
        [7] = u21
        [8] = u16
        [9] = u18
        [10] = u3
        [11] = u23
        [12] = u35
    --]]
    if not u109.gameEntity or (not u109.gameEntity.Parent or u109.isDead) then
        return nil
    end
    u34:rotateTo(u109.gameEntity, u110.position, u30):andThen(function() --[[ Line: 300 ]]
        --[[
        Upvalues:
            [1] = u109
            [2] = u7
            [3] = u31
            [4] = u5
            [5] = u22
            [6] = u21
            [7] = u110
            [8] = u16
            [9] = u18
            [10] = u3
            [11] = u23
            [12] = u35
        --]]
        if u109.isDead or not u109.gameEntity then
            return nil
        end
        u109.stateMaid:DoCleaning()
        u7:playSound(u31.CRAB_BOSS_FLIP_BUILDUP, {
            ["position"] = u109.gameEntity:GetPivot().Position
        })
        local v111 = u5:playAnimation(u109.gameEntity, u22:getAssetId(u21.CRAB_BOSS_FLIP_GROUND), {
            ["looped"] = false
        })
        if v111 then
            v111:GetMarkerReachedSignal("digEnd"):Connect(function() --[[ Line: 315 ]]
                --[[
                Upvalues:
                    [1] = u109
                    [2] = u7
                    [3] = u31
                    [4] = u110
                    [5] = u16
                    [6] = u18
                    [7] = u3
                    [8] = u23
                    [9] = u35
                --]]
                if not u109.alive then
                    return nil
                end
                u7:playSound(u31.CRAB_BOSS_FLIP, {
                    ["position"] = u110.position
                })
                for _, v112 in u110.dangerBlockPositions do
                    if u109.activePoisonBlocks[v112] == nil then
                        u109.activePoisonBlocks[v112] = true
                        local v113 = u16.Assets.Effects.CrabPoisonParticle:Clone()
                        v113.Parent = u18
                        u109.deathMaid:GiveTask(v113)
                        local v114 = u3:getWorldPosition(v112)
                        local v115 = u23 / 2
                        v113.Position = v114 + Vector3.new(0, v115, 0)
                    end
                end
                local v116 = u16.Assets.Effects.GolemBossOverheadSlam:Clone()
                v116.Position = u110.position
                for v117, v118 in v116:GetChildren() do
                    local _ = v117 - 1
                    if v118:IsA("BasePart") then
                        v118.Position = u110.position
                    end
                end
                v116.Parent = u18
                u35:playEffects({ v116 }, nil, {
                    ["destroyAfterSec"] = 2.5
                })
                u109:playScreenShakeEffect(u110.position, {
                    ["magnitude"] = 2
                })
            end)
        end
    end)
end
function u37.onStateEnter(p119, p120) --[[ Line: 360 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    if not p119.gameEntity or (not p119.gameEntity.Parent or p119.isDead) then
        return nil
    end
    if p119.stateMaid then
        p119.stateMaid:DoCleaning()
    end
    if p120 == u27.SPAWNING then
        p119:onEnterSpawningState()
    end
    if p120 == u27.IDLE then
        p119:onEnterIdleState()
    end
    if p120 == u27.UNDERGROUND then
        p119:digUnderground()
    end
    if p120 == u27.ROTATING or p120 == u27.PATROL then
        p119:onEnterRotatingState()
    end
end
function u37.digUnderground(u121) --[[ Line: 381 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u22
        [3] = u21
        [4] = u7
        [5] = u31
        [6] = u27
        [7] = u34
    --]]
    if not (u121.gameEntity and u121.gameEntity.Parent) then
        return nil
    end
    local v122 = u5:playAnimation(u121.gameEntity, u22:getAssetId(u21.CRAB_BOSS_DIG_DOWN), {
        ["looped"] = false
    })
    u7:playSound(u31.CRAB_BOSS_BURROW_IN, {
        ["position"] = u121.gameEntity:GetPivot().Position
    })
    u121.burrowLoop = u7:playModifiableSound(u31.CRAB_BOSS_BURROW_LOOP, {
        ["looped"] = true,
        ["position"] = u121.gameEntity:GetPivot().Position
    })
    u121.deathMaid:GiveTask(function() --[[ Line: 395 ]]
        --[[
        Upvalues:
            [1] = u121
        --]]
        local v123 = u121.burrowLoop
        if v123 ~= nil then
            v123:Stop()
        end
    end)
    if v122 ~= nil then
        v122.Stopped:Once(function() --[[ Line: 403 ]]
            --[[
            Upvalues:
                [1] = u121
                [2] = u27
                [3] = u34
            --]]
            if not u121.gameEntity or u121.activeState ~= u27.UNDERGROUND then
                return nil
            end
            u34:hideStatefulEntity(u121.gameEntity)
            u34:hideStatefulEntity(u121.gooseModel)
        end)
    end
end
function u37.onEnterSpawningState(u124) --[[ Line: 412 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u31
        [3] = u5
        [4] = u22
        [5] = u21
        [6] = u34
    --]]
    if not (u124.gameEntity and u124.gameEntity.Parent) then
        return nil
    end
    u7:playSound(u31.CRAB_BOSS_SPAWN_LOCAL, {
        ["position"] = u124.gameEntity:GetPivot().Position
    })
    u7:playSound(u31.CRAB_BOSS_SPAWN_GLOBAL, {
        ["rollOffMinDistance"] = 300,
        ["rollOffMaxDistance"] = 1500,
        ["volumeMultiplier"] = 0.75,
        ["position"] = u124.gameEntity:GetPivot().Position
    })
    u5:playAnimation(u124.gameEntity, u22:getAssetId(u21.CRAB_BOSS_SPAWN), {
        ["looped"] = false
    })
    task.delay(0.5, function() --[[ Line: 430 ]]
        --[[
        Upvalues:
            [1] = u124
            [2] = u34
        --]]
        if not u124.gameEntity or (not u124.gameEntity.Parent or u124.isDead) then
            return nil
        end
        u34:showStatefulEntity(u124.gameEntity)
    end)
end
function u37.onEnterIdleState(p125) --[[ Line: 437 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u22
        [3] = u21
    --]]
    if not p125.gameEntity or (not p125.gameEntity.Parent or p125.isDead) then
        return nil
    end
    u5:playAnimation(p125.gameEntity, u22:getAssetId(u21.CRAB_BOSS_IDLE), {
        ["looped"] = true
    })
end
function u37.onEnterRotatingState(u126) --[[ Line: 445 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u22
        [3] = u21
        [4] = u34
        [5] = u7
        [6] = u6
        [7] = u31
    --]]
    if not u126.gameEntity or (not u126.gameEntity.Parent or u126.isDead) then
        return nil
    end
    local u127 = u5:playAnimation(u126.gameEntity, u22:getAssetId(u21.CRAB_BOSS_WALK), {
        ["looped"] = true
    })
    u126.stateMaid:GiveTask(function() --[[ Line: 452 ]]
        --[[
        Upvalues:
            [1] = u127
        --]]
        local v128 = u127
        if v128 ~= nil then
            v128:Stop()
        end
        local v129 = u127
        if v129 ~= nil then
            v129:Destroy()
        end
    end)
    if u127 then
        u127:GetMarkerReachedSignal("footstep"):Connect(function(p130) --[[ Line: 464 ]]
            --[[
            Upvalues:
                [1] = u126
                [2] = u34
                [3] = u7
                [4] = u6
                [5] = u31
            --]]
            if not u126.gameEntity or u126.isDead then
                return nil
            end
            local v131 = {
                50,
                90,
                130,
                230,
                270,
                310
            }
            local v132 = tonumber(p130)
            if v132 == nil then
                return nil
            end
            local v133 = v131[v132 + 1]
            local v134 = math.rad(v133)
            local v135 = {
                ["position"] = u34:getEntityFloorCFrame(u126.gameEntity) * (CFrame.Angles(0, v134, 0) * Vector3.new(0, 0, -8))
            }
            u7:playSound(u6.fromList(u31.CRAB_BOSS_FOOTSTEP_1, u31.CRAB_BOSS_FOOTSTEP_2, u31.CRAB_BOSS_FOOTSTEP_3), v135)
        end)
    end
end
function u37.playScreenShakeEffect(p136, p137, p138) --[[ Line: 485 ]]
    --[[
    Upvalues:
        [1] = u34
        [2] = u29
        [3] = u15
        [4] = u8
    --]]
    if not (p136.gameEntity and p136.gameEntity.Parent) then
        return nil
    end
    local v139 = u34:localPlayerDistanceFromEntity(p136.gameEntity)
    if v139 ~= 0 and (v139 == v139 and v139) then
        v139 = v139 <= u29
    end
    if v139 ~= 0 and (v139 == v139 and v139) then
        local v140 = u15.LocalPlayer.Character
        if v140 ~= nil then
            v140 = v140:GetPivot().Position
        end
        if not v140 then
            return nil
        end
        local v141 = (v140 - p137).Unit
        u8.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), v141, p138)
    end
end
function u37.onStateExit(_, _) --[[ Line: 509 ]] end
function u37.onEntityDamaged(_, _, _) --[[ Line: 511 ]] end
function u37.onEntityDeath(u142) --[[ Line: 513 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u20
        [3] = u34
        [4] = u8
        [5] = u5
        [6] = u22
        [7] = u21
        [8] = u7
        [9] = u31
        [10] = u18
        [11] = u19
        [12] = u11
        [13] = u10
    --]]
    u142.isDead = true
    if not (u142.gameEntity and u142.gameEntity.Parent) then
        return nil
    end
    local v143 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
    local v144 = {
        ["app"] = u20
    }
    local v145 = u142.entityUUID
    v144.appId = "StatefulEntityHpBarBillboard_" .. tostring(v145)
    v143:closeApp(v144)
    local _ = u34:getGameEntityCFrame(u142.gameEntity).Position
    task.spawn(function() --[[ Line: 527 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        local v146 = 0
        while v146 <= 4 do
            v146 = v146 + 1
            u8.Controllers.GolemBossController:hideAllBlockDangerIndicators()
            task.wait(0.5)
        end
    end)
    task.spawn(function() --[[ Line: 538 ]]
        --[[
        Upvalues:
            [1] = u142
            [2] = u8
            [3] = u5
            [4] = u22
            [5] = u21
            [6] = u7
            [7] = u31
            [8] = u18
            [9] = u19
            [10] = u11
            [11] = u10
        --]]
        local v147 = u142.serverInstance
        if v147 ~= nil then
            v147 = v147:GetAttribute("Despawned")
        end
        if v147 == 0 or (v147 ~= v147 or (v147 == "" or not v147)) then
            v147 = u8.Controllers.GooseBossController:isGooseDespawned()
        end
        if v147 ~= 0 and (v147 == v147 and (v147 ~= "" and v147)) then
            local v148 = u5:playAnimation(u142.gameEntity, u22:getAssetId(u21.CRAB_BOSS_DIG_DOWN), {
                ["looped"] = false
            })
            local v149 = u7
            local v150 = u31.CRAB_BOSS_BURROW_IN
            local v151 = {}
            local v152 = u142.gameEntity
            if v152 ~= nil then
                v152 = v152:GetPivot().Position
            end
            v151.position = v152
            v149:playSound(v150, v151)
            if v148 ~= nil then
                v148.Stopped:Once(function() --[[ Line: 563 ]]
                    --[[
                    Upvalues:
                        [1] = u142
                        [2] = u18
                    --]]
                    local v153 = u142.gameEntity
                    if v153 ~= nil then
                        v153:Destroy()
                    end
                    local v154 = u18:FindFirstChild("GoldenGoose")
                    if v154 ~= nil then
                        v154:Destroy()
                    end
                end)
            end
            task.delay(5, function() --[[ Line: 575 ]]
                --[[
                Upvalues:
                    [1] = u142
                    [2] = u18
                --]]
                local v155 = u142.gameEntity
                if v155 ~= nil then
                    v155:Destroy()
                end
                local v156 = u18:FindFirstChild("GoldenGoose")
                if v156 ~= nil then
                    v156:Destroy()
                end
            end)
            return nil
        end
        local u157 = u5:playAnimation(u142.gameEntity, u22:getAssetId(u21.CRAB_BOSS_DEATH), {
            ["looped"] = false
        })
        local v158 = u7
        local v159 = u31.CRAB_BOSS_DEATH
        local v160 = {}
        local v161 = u142.gameEntity
        if v161 ~= nil then
            v161 = v161:GetPivot().Position
        end
        v160.position = v161
        v158:playSound(v159, v160)
        if u157 then
            u157:GetMarkerReachedSignal("finish"):Connect(function() --[[ Line: 602 ]]
                --[[
                Upvalues:
                    [1] = u157
                    [2] = u142
                    [3] = u19
                    [4] = u11
                    [5] = u10
                --]]
                u157:AdjustSpeed(0)
                if u142.gameEntity then
                    local u162 = {}
                    for _, v163 in u142.gameEntity:GetDescendants() do
                        if v163:IsA("BasePart") and v163.Name ~= "cage_mesh" then
                            u162[v163] = v163.Transparency
                        end
                    end
                    u19(4, u11, function(p164) --[[ Line: 613 ]]
                        --[[
                        Upvalues:
                            [1] = u162
                        --]]
                        for v165, v166 in u162 do
                            v165.Transparency = v166 * (1 - p164) + p164
                        end
                    end)
                    local u167 = u142.gameEntity:FindFirstChild("cage_mesh")
                    if u167 then
                        task.delay(3, function() --[[ Line: 620 ]]
                            --[[
                            Upvalues:
                                [1] = u167
                                [2] = u19
                                [3] = u10
                            --]]
                            local u168 = u167.Color
                            u19(0.5, u10, function(p169) --[[ Line: 622 ]]
                                --[[
                                Upvalues:
                                    [1] = u167
                                    [2] = u168
                                --]]
                                u167.Transparency = p169
                                u167.Color = u168:Lerp(Color3.fromRGB(255, 215, 0), p169)
                            end)
                        end)
                        return
                    end
                    warn("No cage_mesh found in GooseBoss")
                end
            end)
        end
    end)
    local v170 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
    local v171 = u142.entityUUID
    v170:closeApp("StatefulEntityHpBarBillboard_" .. tostring(v171))
    task.delay(10, function() --[[ Line: 638 ]]
        --[[
        Upvalues:
            [1] = u142
        --]]
        local v172 = u142.gameEntity
        if v172 ~= nil then
            v172:Destroy()
        end
    end)
end
return {
    ["GooseBossClient"] = u37
}