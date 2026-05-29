local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.RandomUtil
local u6 = v3.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v8.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-skin-theme-meta").getCurrentStatefulEntitySkinMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-type").StatefulEntityType
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golem-boss", "golem-boss-constants")
local u18 = v17.GOLEM_CLIENT_SOUND_DELAY
local u19 = v17.GOLEM_FOOTSTEP_SOUNDS
local u20 = v17.GOLEM_SCREEN_SHAKE_THRESHOLD
local u21 = v17.GOLEM_TURN_DURATION
local u22 = v17.GolemBossAction
local u23 = v17.GolemBossState
local u24 = v17.GROUND_Y_OFFSET
local u25 = v17.SpiritGolemBossConstants
local u26 = v17.VoidGolemBossConstants
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity").StatefulEntity
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u32 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 39 ]]
        return "GolemBossClient"
    end,
    ["__index"] = u28
})
u32.__index = u32
function u32.new(...) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    local v33 = u32
    local v34 = setmetatable({}, v33)
    return v34:constructor(...) or v34
end
function u32.constructor(p35, p36, p37, p38) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u23
        [3] = u29
    --]]
    u28.constructor(p35, u23.SPAWNING, u29.GOLEM_BOSS, p36, p37)
    p35.isDead = false
    p35.serverInstance = p38
    p35:createEntityHealthbar()
end
function u32.createEntityHealthbar(p39) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u12
    --]]
    if p39.gameEntity and p39.serverInstance then
        local v40 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
        local v41 = {
            ["app"] = u12
        }
        local v42 = p39.entityUUID
        v41.appId = "StatefulEntityHpBarBillboard_" .. tostring(v42)
        v40:openApp(v41, {
            ["hpBarOffset"] = Vector3.new(0, 6.5, 0),
            ["gameEntity"] = p39.gameEntity,
            ["serverInstance"] = p39.serverInstance
        }, nil, p39.gameEntity)
    end
end
function u32.createGameEntity(p43, p44) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u16
        [3] = u30
        [4] = u29
        [5] = u11
    --]]
    local v45 = u15(u16.GOLEM_BOSS).model:Clone()
    v45:WaitForChild("RootPart").Anchored = true
    u30:setEntityIgnoreQuery(v45)
    u30:setClientEntityNotCollidable(v45)
    v45:PivotTo(p44)
    p43.gameEntity = v45
    p43.gameEntity:AddTag("GameEntity_" .. u29.GOLEM_BOSS)
    u30:hideStatefulEntity(p43.gameEntity)
    v45.Parent = u11
    p43:registerClientGameEntity(v45)
end
function u32.handleActionRequest(p46, p47, p48) --[[ Line: 84 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    if p46.gameEntity and (p46.gameEntity.Parent and not p46.isDead) then
        if p47 == u22.FIST_SLAM then
            p46:handleFistSlamActionRequest(p48)
            return
        elseif p47 == u22.HAMMER_SLAM then
            p46:handleHammerSlamActionRequest(p48)
            return
        elseif p47 == u22.PILLAR_SUMMON then
            p46:handlePillarSummonActionRequest(p48)
        elseif p47 == u22.PATROL_TURN then
            p46:handlePatrolTurnActionRequest(p48)
        end
    else
        return nil
    end
end
function u32.handlePatrolTurnActionRequest(p49, p50) --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u21
    --]]
    if not p49.gameEntity or (not p49.gameEntity.Parent or p49.isDead) then
        return nil
    end
    u30:rotateTo(p49.gameEntity, p50.turnPosition, u21)
end
function u32.handleFistSlamActionRequest(u51, u52) --[[ Line: 110 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u21
        [3] = u18
        [4] = u6
        [5] = u27
        [6] = u4
        [7] = u14
        [8] = u13
        [9] = u7
        [10] = u10
        [11] = u11
        [12] = u31
    --]]
    if not u51.gameEntity or (not u51.gameEntity.Parent or u51.isDead) then
        return nil
    end
    u30:rotateTo(u51.gameEntity, u52.slamPosition, u21):andThen(function() --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u6
            [3] = u27
            [4] = u52
            [5] = u4
            [6] = u51
            [7] = u14
            [8] = u13
            [9] = u7
            [10] = u10
            [11] = u11
            [12] = u31
        --]]
        task.delay(u18, function() --[[ Line: 117 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u27
                [3] = u52
            --]]
            u6:playSound(u27.TITAN_HAMMER_SLAM, {
                ["position"] = u52.slamPosition
            })
        end)
        local v53 = u4:playAnimation(u51.gameEntity, u14:getAssetId(u13.GOLEM_BOSS_FIST_SLAM), {
            ["looped"] = false
        })
        u7.Controllers.GolemBossController:showDangerIndicators(u51:convertLayersIntoDangerPositions(u52.dangerBlockPositions))
        if v53 then
            v53:GetMarkerReachedSignal("fistImpact"):Connect(function() --[[ Line: 128 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u52
                    [3] = u51
                    [4] = u10
                    [5] = u11
                    [6] = u31
                --]]
                u7.Controllers.GolemBossController:playShockwaveEffect(u52.dangerBlockPositions, nil, nil, u51.serverInstance)
                local v54 = u10.Assets.Effects.GolemBossOverheadSlam:Clone()
                v54.Position = u52.slamPosition
                for v55, v56 in v54:GetChildren() do
                    local _ = v55 - 1
                    if v56:IsA("BasePart") then
                        v56.Position = u52.slamPosition
                    end
                end
                v54.Parent = u11
                u31:playEffects({ v54 }, nil, {
                    ["destroyAfterSec"] = 2.5
                })
                u51:playScreenShakeEffect(u52.slamPosition, {
                    ["magnitude"] = 2
                })
            end)
        end
    end)
end
function u32.handleHammerSlamActionRequest(u57, u58) --[[ Line: 156 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u14
        [3] = u13
        [4] = u24
        [5] = u18
        [6] = u6
        [7] = u27
        [8] = u10
        [9] = u11
        [10] = u31
        [11] = u7
    --]]
    if not (u57.gameEntity and u57.gameEntity.Parent) then
        return nil
    end
    local u59 = u4:playAnimation(u57.gameEntity, u14:getAssetId(u13.GOLEM_BOSS_HAMMER_SLAM), {
        ["looped"] = false
    })
    if u59 then
        local u60 = u57.gameEntity:GetPivot().Position + u24
        task.delay(u18, function() --[[ Line: 166 ]]
            --[[
            Upvalues:
                [1] = u57
                [2] = u6
                [3] = u27
                [4] = u60
            --]]
            local v61 = u57.serverInstance
            if v61 ~= nil then
                v61 = v61:GetAttribute("BossType")
            end
            if v61 == "SpiritGolem" then
                local v62 = {
                    ["position"] = u60
                }
                u6:playSound(u27.SPIRIT_TITAN_HAMMER_SLAM, v62)
                return
            elseif v61 == "VoidGolem" then
                local v63 = {
                    ["position"] = u60
                }
                u6:playSound(u27.VOID_TITAN_HAMMER_SLAM, v63)
            else
                local v64 = {
                    ["position"] = u60
                }
                u6:playSound(u27.TITAN_HAMMER_SLAM, v64)
            end
        end)
        u59:GetMarkerReachedSignal("slamImpact"):Connect(function() --[[ Line: 186 ]]
            --[[
            Upvalues:
                [1] = u57
                [2] = u10
                [3] = u60
                [4] = u11
                [5] = u31
                [6] = u59
                [7] = u7
                [8] = u58
            --]]
            if u57.gameEntity then
                local v65 = u10.Assets.Effects.GolemBossGroundSlam:Clone()
                v65.Position = u60
                v65.Parent = u11
                u31:playEffects({ v65 }, nil, {
                    ["sizeMultiplier"] = 4,
                    ["destroyAfterSec"] = 2.5
                })
                u57:playScreenShakeEffect(u60, {
                    ["cycles"] = 20,
                    ["magnitude"] = 2
                })
            end
            u59:AdjustSpeed(0)
            u7.Controllers.GolemBossController:showDangerIndicators(u57:convertLayersIntoDangerPositions(u58.dangerBlockPositions))
            u7.Controllers.GolemBossController:playShockwaveEffect(u58.dangerBlockPositions, nil, nil, u57.serverInstance)
        end)
    end
end
function u32.handlePillarSummonActionRequest(u66, u67) --[[ Line: 210 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u14
        [4] = u13
        [5] = u30
        [6] = u6
        [7] = u27
        [8] = u5
        [9] = u10
        [10] = u11
        [11] = u31
    --]]
    if not u66.gameEntity or (not u66.gameEntity.Parent or u66.isDead) then
        return nil
    end
    u7.Controllers.GolemBossController:showDangerIndicators(u66:convertLayersIntoDangerPositions(u67.dangerBlockPositions))
    if u4:playAnimation(u66.gameEntity, u14:getAssetId(u13.GOLEM_BOSS_HAMMER_RAISE), {
        ["looped"] = false
    }) then
        local v68 = u30:getGameEntityCFrame(u66.gameEntity).Position
        local v69 = u66.serverInstance
        if v69 ~= nil then
            v69 = v69:GetAttribute("BossType")
        end
        if v69 == "SpiritGolem" then
            u6:playSound(u27.SPIRIT_TITAN_SUMMON_PILLARS, {
                ["position"] = v68
            })
        elseif v69 == "VoidGolem" then
            u6:playSound(u27.VOID_TITAN_SUMMON_PILLARS, {
                ["position"] = v68
            })
        else
            u6:playSound(u27.TITAN_SUMMON_PILLARS, {
                ["position"] = v68
            })
        end
        task.delay(0.5, function() --[[ Line: 240 ]]
            --[[
            Upvalues:
                [1] = u67
                [2] = u5
                [3] = u66
                [4] = u10
                [5] = u11
                [6] = u31
                [7] = u7
            --]]
            if u67.pillarSummonLocations then
                local v70 = u5.fromList
                local v71 = u67.pillarSummonLocations
                u66:playScreenShakeEffect(v70(unpack(v71)), {
                    ["magnitude"] = 1
                })
                local v72 = u67.pillarSummonLocations
                local function v75(p73) --[[ Line: 248 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u11
                        [3] = u31
                    --]]
                    local v74 = u10.Assets.Effects.GolemBossGroundSlam:Clone()
                    v74.Position = p73
                    v74.Parent = u11
                    u31:playEffects({ v74 }, nil, {
                        ["sizeMultiplier"] = 1.5,
                        ["destroyAfterSec"] = 2.5
                    })
                end
                for v76, v77 in v72 do
                    v75(v77, v76 - 1, v72)
                end
            end
            u7.Controllers.GolemBossController:playShockwaveEffect(u67.dangerBlockPositions, nil, true, u66.serverInstance)
        end)
    end
end
function u32.onStateEnter(p78, p79) --[[ Line: 266 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    if not p78.gameEntity or (not p78.gameEntity.Parent or p78.isDead) then
        return nil
    end
    if p79 == u23.SPAWNING then
        p78:onEnterSpawningState()
    end
    if p79 == u23.IDLE then
        p78:onEnterIdleState()
    end
    if p79 == u23.ROTATING then
        p78:onEnterRotatingState()
    end
    if p79 == u23.PATROL then
        p78:onEnterPatrolState()
    end
end
function u32.onEnterPatrolState(u80) --[[ Line: 284 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u14
        [3] = u13
        [4] = u24
        [5] = u25
        [6] = u26
        [7] = u19
        [8] = u5
        [9] = u6
    --]]
    if not u80.gameEntity or (not u80.gameEntity.Parent or u80.isDead) then
        return nil
    end
    local v81 = u4:playAnimation(u80.gameEntity, u14:getAssetId(u13.GOLEM_BOSS_MOVE), {
        ["looped"] = true
    })
    if v81 then
        local u82 = u80.gameEntity:GetPivot().Position + u24
        local v83 = u80.serverInstance
        if v83 ~= nil then
            v83 = v83:GetAttribute("BossType")
        end
        local u84
        if v83 == "SpiritGolem" then
            u84 = u25.SPIRIT_GOLEM_FOOTSTEP_SOUNDS
        elseif v83 == "VoidGolem" then
            u84 = u26.VOID_GOLEM_FOOTSTEP_SOUNDS
        else
            u84 = u19
        end
        v81:GetMarkerReachedSignal("leftFootImpact"):Connect(function() --[[ Line: 308 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u84
                [3] = u6
                [4] = u82
                [5] = u80
            --]]
            local v85 = u84
            local v86 = {
                ["position"] = u82
            }
            u6:playSound(u5.fromList(unpack(v85)), v86)
            u80:playScreenShakeEffect(u82, {
                ["magnitude"] = 0.5
            })
        end)
        v81:GetMarkerReachedSignal("rightFootImpact"):Connect(function() --[[ Line: 318 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u84
                [3] = u6
                [4] = u82
                [5] = u80
            --]]
            local v87 = u84
            local v88 = {
                ["position"] = u82
            }
            u6:playSound(u5.fromList(unpack(v87)), v88)
            u80:playScreenShakeEffect(u82, {
                ["magnitude"] = 0.5
            })
        end)
    end
end
function u32.onEnterSpawningState(u89) --[[ Line: 330 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u14
        [3] = u13
        [4] = u30
        [5] = u6
        [6] = u27
    --]]
    if not (u89.gameEntity and u89.gameEntity.Parent) then
        return nil
    end
    local v90 = u4:playAnimation(u89.gameEntity, u14:getAssetId(u13.GOLEM_BOSS_SPAWN), {
        ["looped"] = false
    })
    task.delay(0.5, function() --[[ Line: 339 ]]
        --[[
        Upvalues:
            [1] = u89
            [2] = u30
        --]]
        if not u89.gameEntity or (not u89.gameEntity.Parent or u89.isDead) then
            return nil
        end
        u30:showStatefulEntity(u89.gameEntity)
    end)
    if v90 then
        v90:GetMarkerReachedSignal("spawnComplete"):Connect(function() --[[ Line: 346 ]]
            --[[
            Upvalues:
                [1] = u89
                [2] = u30
                [3] = u6
                [4] = u27
            --]]
            if not u89.gameEntity or (not u89.gameEntity.Parent or u89.isDead) then
                return nil
            end
            local v91 = u30:getGameEntityCFrame(u89.gameEntity).Position
            u6:playSound(u27.TITAN_IDLE_SPAWN, {
                ["position"] = v91
            })
            u89:playScreenShakeEffect(v91, {
                ["magnitude"] = 4
            })
        end)
    end
end
function u32.onEnterIdleState(p92) --[[ Line: 361 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u14
        [3] = u13
    --]]
    if not p92.gameEntity or (not p92.gameEntity.Parent or p92.isDead) then
        return nil
    end
    u4:playAnimation(p92.gameEntity, u14:getAssetId(u13.GOLEM_BOSS_IDLE), {
        ["looped"] = true
    })
end
function u32.onEnterRotatingState(u93) --[[ Line: 369 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u14
        [3] = u13
        [4] = u24
        [5] = u5
        [6] = u19
        [7] = u6
    --]]
    if not u93.gameEntity or (not u93.gameEntity.Parent or u93.isDead) then
        return nil
    end
    local v94 = u4:playAnimation(u93.gameEntity, u14:getAssetId(u13.GOLEM_BOSS_MOVE), {
        ["looped"] = true
    })
    if v94 then
        local u95 = u93.gameEntity:GetPivot().Position + u24
        v94:GetMarkerReachedSignal("leftFootImpact"):Connect(function() --[[ Line: 379 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u19
                [3] = u6
                [4] = u95
                [5] = u93
            --]]
            local v96 = u19
            local v97 = {
                ["position"] = u95
            }
            u6:playSound(u5.fromList(unpack(v96)), v97)
            u93:playScreenShakeEffect(u95, {
                ["magnitude"] = 0.5
            })
        end)
        v94:GetMarkerReachedSignal("rightFootImpact"):Connect(function() --[[ Line: 389 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u19
                [3] = u6
                [4] = u95
                [5] = u93
            --]]
            local v98 = u19
            local v99 = {
                ["position"] = u95
            }
            u6:playSound(u5.fromList(unpack(v98)), v99)
            u93:playScreenShakeEffect(u95, {
                ["magnitude"] = 0.5
            })
        end)
    end
end
function u32.playScreenShakeEffect(p100, p101, p102) --[[ Line: 401 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u20
        [3] = u9
        [4] = u7
    --]]
    if not (p100.gameEntity and p100.gameEntity.Parent) then
        return nil
    end
    local v103 = u30:localPlayerDistanceFromEntity(p100.gameEntity)
    if v103 ~= 0 and (v103 == v103 and v103) then
        v103 = v103 <= u20
    end
    if v103 ~= 0 and (v103 == v103 and v103) then
        local v104 = u9.LocalPlayer.Character
        if v104 ~= nil then
            v104 = v104:GetPivot().Position
        end
        if not v104 then
            return nil
        end
        local v105 = (v104 - p101).Unit
        u7.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), v105, p102)
    end
end
function u32.onStateExit(_, _) --[[ Line: 425 ]] end
function u32.onEntityDamaged(_, _, _) --[[ Line: 427 ]] end
function u32.onEntityDeath(u106) --[[ Line: 429 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u12
        [3] = u30
        [4] = u7
        [5] = u4
        [6] = u14
        [7] = u13
        [8] = u6
        [9] = u27
    --]]
    u106.isDead = true
    if not (u106.gameEntity and u106.gameEntity.Parent) then
        return nil
    end
    local v107 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
    local v108 = {
        ["app"] = u12
    }
    local v109 = u106.entityUUID
    v108.appId = "StatefulEntityHpBarBillboard_" .. tostring(v109)
    v107:closeApp(v108)
    local u110 = u30:getGameEntityCFrame(u106.gameEntity).Position
    task.spawn(function() --[[ Line: 443 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        local v111 = 0
        while v111 <= 4 do
            v111 = v111 + 1
            u7.Controllers.GolemBossController:hideAllBlockDangerIndicators()
            task.wait(0.5)
        end
    end)
    task.delay(0.8, function() --[[ Line: 455 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u106
            [3] = u14
            [4] = u13
            [5] = u6
            [6] = u27
            [7] = u110
        --]]
        local u112 = u4:playAnimation(u106.gameEntity, u14:getAssetId(u13.GOLEM_BOSS_DEATH), {
            ["looped"] = false
        })
        if u112 then
            u112:GetMarkerReachedSignal("bodyImpact"):Connect(function() --[[ Line: 461 ]]
                --[[
                Upvalues:
                    [1] = u112
                    [2] = u106
                    [3] = u6
                    [4] = u27
                    [5] = u110
                --]]
                u112:AdjustSpeed(0)
                local v113 = u106.serverInstance
                if v113 ~= nil then
                    v113 = v113:GetAttribute("BossType")
                end
                if v113 == "SpiritGolem" then
                    local v114 = {
                        ["position"] = u110
                    }
                    u6:playSound(u27.SPIRIT_TITAN_DEATH_2, v114)
                elseif v113 == "VoidGolem" then
                    local v115 = {
                        ["position"] = u110
                    }
                    u6:playSound(u27.VOID_TITAN_DEATH_2, v115)
                else
                    local v116 = {
                        ["position"] = u110
                    }
                    u6:playSound(u27.TITAN_DEATH_2, v116)
                end
                u106:playScreenShakeEffect(u110, {
                    ["magnitude"] = 4
                })
            end)
        end
    end)
    local v117 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
    local v118 = u106.entityUUID
    v117:closeApp("StatefulEntityHpBarBillboard_" .. tostring(v118))
    task.delay(5, function() --[[ Line: 493 ]]
        --[[
        Upvalues:
            [1] = u106
        --]]
        local v119 = u106.gameEntity
        if v119 ~= nil then
            v119 = v119:Destroy()
        end
        return v119
    end)
end
function u32.convertLayersIntoDangerPositions(_, p120) --[[ Line: 501 ]]
    local v121 = {}
    for _, v122 in p120 do
        for _, v123 in v122 do
            table.insert(v121, v123)
        end
    end
    return v121
end
function u32.getGolemModel(p124) --[[ Line: 510 ]]
    return p124.gameEntity
end
return {
    ["GolemBossClient"] = u32
}