local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.RandomUtil
local u6 = v3.SoundManager
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.CollectionService
local u10 = v8.Players
local u11 = v8.ReplicatedStorage
local u12 = v8.TweenService
local u13 = v8.Workspace
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local v17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golem-boss", "golem-boss-constants")
local u18 = v17.GOLEM_CLIENT_SOUND_DELAY
local u19 = v17.GOLEM_HAMMER_RAISE_DURATION
local u20 = v17.GOLEM_TURN_DURATION
local u21 = v17.GolemBossAction
local u22 = v17.GolemBossState
local u23 = v17.GROUND_Y_OFFSET
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u28 = u1.import(script, script.Parent, "golem-boss-client").GolemBossClient
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 34 ]]
        return "BhaaBossClient"
    end,
    ["__index"] = u28
})
u29.__index = u29
function u29.new(...) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32, ...) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    u28.constructor(p32, ...)
end
function u29.createGameEntity(p33, p34) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u26
        [3] = u25
        [4] = u13
        [5] = u9
    --]]
    local v35 = u11.Assets.Misc.Bhaa:Clone()
    v35:WaitForChild("RootPart").Anchored = true
    u26:setEntityIgnoreQuery(v35)
    u26:setClientEntityNotCollidable(v35)
    v35:PivotTo(p34 + Vector3.new(0, 1, 0))
    p33.gameEntity = v35
    p33.gameEntity:AddTag("GameEntity_" .. u25.BHAA)
    u26:hideStatefulEntity(p33.gameEntity)
    v35.Parent = u13
    u9:AddTag(v35, "Bhaa")
    p33:registerClientGameEntity(v35)
end
function u29.onStateEnter(p36, p37) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u26
    --]]
    if not p36.gameEntity or (not p36.gameEntity.Parent or p36.isDead) then
        return nil
    end
    if p37 == u22.SPAWNING then
        u26:showStatefulEntity(p36.gameEntity)
        p36:onEnterSpawningState()
    end
    if p37 == u22.IDLE then
        p36:onEnterIdleState()
    end
    if p37 == u22.ROTATING then
        p36:onEnterRotatingState()
    end
    if p37 == u22.PATROL then
        p36:onEnterIdleState()
    end
end
function u29.handleActionRequest(u38, p39, p40) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u4
        [3] = u16
        [4] = u15
        [5] = u26
        [6] = u20
    --]]
    if u38.gameEntity and (u38.gameEntity.Parent and not u38.isDead) then
        if p39 == u21.FIST_SLAM then
            u38:handleFistSlamActionRequest(p40)
            return
        elseif p39 == u21.HAMMER_SLAM then
            u38:handleHammerSlamActionRequest(p40)
            return
        elseif p39 == u21.PILLAR_SUMMON then
            u38:handlePillarSummonActionRequest(p40)
            return
        elseif p39 == u21.SKORP_SUMMON then
            u4:playAnimation(u38.gameEntity, u16:getAssetId(u15.BHAA_SUMMON))
        elseif p39 == u21.PATROL_TURN then
            u26:rotateTo(u38.gameEntity, p40.turnPosition, u20)
            local u41 = u4:playAnimation(u38.gameEntity, u16:getAssetId(u15.BHAA_MOVEMENT), {
                ["looped"] = true
            })
            task.delay(1.8, function() --[[ Line: 111 ]]
                --[[
                Upvalues:
                    [1] = u41
                    [2] = u38
                --]]
                local v42 = u41
                if v42 ~= nil then
                    v42:Stop()
                end
                u38:onEnterIdleState()
            end)
        end
    else
        return nil
    end
end
function u29.onEnterIdleState(p43) --[[ Line: 120 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u16
        [3] = u15
    --]]
    if not p43.gameEntity or (not p43.gameEntity.Parent or p43.isDead) then
        return nil
    end
    local v44 = p43.track
    if v44 ~= nil then
        v44:Stop()
    end
    p43.track = u4:playAnimation(p43.gameEntity, u16:getAssetId(u15.BHAA_IDLE), {
        ["looped"] = true
    })
end
function u29.swing(p45, _) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u16
        [3] = u15
    --]]
    if not p45.gameEntity or (not p45.gameEntity.Parent or p45.isDead) then
        return nil
    end
    local v46 = u4:playAnimation(p45.gameEntity, u16:getAssetId(u15.ANUBIS_ATTACK))
    if v46 ~= nil then
        v46:AdjustSpeed(0.25)
    end
end
function u29.handleFistSlamActionRequest(u47, u48) --[[ Line: 142 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u20
        [3] = u18
        [4] = u6
        [5] = u24
        [6] = u4
        [7] = u16
        [8] = u15
        [9] = u7
        [10] = u11
        [11] = u13
        [12] = u27
    --]]
    if not u47.gameEntity or (not u47.gameEntity.Parent or u47.isDead) then
        return nil
    end
    u26:rotateTo(u47.gameEntity, u48.slamPosition, u20):andThen(function() --[[ Line: 147 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u6
            [3] = u24
            [4] = u48
            [5] = u4
            [6] = u47
            [7] = u16
            [8] = u15
            [9] = u7
            [10] = u11
            [11] = u13
            [12] = u27
        --]]
        task.delay(u18, function() --[[ Line: 149 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u24
                [3] = u48
            --]]
            u6:playSound(u24.BHAA_GRUNT_1, {
                ["position"] = u48.slamPosition
            })
        end)
        local u49 = u4:playAnimation(u47.gameEntity, u16:getAssetId(u15.BHAA_ATTACK))
        if u49 ~= nil then
            u49:AdjustSpeed(0.5)
        end
        u7.Controllers.GolemBossController:showDangerIndicators(u47:convertLayersIntoDangerPositions(u48.dangerBlockPositions))
        if u49 then
            task.delay(1, function() --[[ Line: 162 ]]
                --[[
                Upvalues:
                    [1] = u49
                    [2] = u7
                    [3] = u48
                    [4] = u47
                    [5] = u11
                    [6] = u13
                    [7] = u27
                --]]
                local v50 = u49
                if v50 ~= nil then
                    v50:AdjustSpeed(1)
                end
                u7.Controllers.GolemBossController:playShockwaveEffect(u48.dangerBlockPositions, nil, nil, u47.serverInstance)
                local v51 = u11.Assets.Effects.GolemBossOverheadSlam:Clone()
                v51.Position = u48.slamPosition
                for v52, v53 in v51:GetChildren() do
                    local _ = v52 - 1
                    if v53:IsA("BasePart") then
                        v53.Position = u48.slamPosition
                    end
                end
                v51.Parent = u13
                u27:playEffects({ v51 }, nil, {
                    ["destroyAfterSec"] = 2.5
                })
                u47:playScreenShakeEffect(u48.slamPosition, {
                    ["magnitude"] = 2
                })
            end)
        end
    end)
end
function u29.handleHammerSlamActionRequest(u54, u55) --[[ Line: 194 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u16
        [3] = u15
        [4] = u23
        [5] = u6
        [6] = u24
        [7] = u7
        [8] = u11
        [9] = u13
        [10] = u27
    --]]
    if not (u54.gameEntity and u54.gameEntity.Parent) then
        return nil
    end
    local v56 = u4:playAnimation(u54.gameEntity, u16:getAssetId(u15.BHAA_ROCKWAVE))
    if v56 ~= nil then
        v56:AdjustSpeed(0.7)
    end
    if v56 then
        local u57 = u54.gameEntity:GetPivot().Position + u23
        u6:playSound(u24.BHAA_GRUNT_2, {
            ["position"] = u57
        })
        task.delay(0.5, function() --[[ Line: 214 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u54
                [3] = u55
            --]]
            u7.Controllers.GolemBossController:showDangerIndicators(u54:convertLayersIntoDangerPositions(u55.dangerBlockPositions))
        end)
        task.delay(1.5, function() --[[ Line: 218 ]]
            --[[
            Upvalues:
                [1] = u54
                [2] = u11
                [3] = u57
                [4] = u13
                [5] = u27
                [6] = u7
                [7] = u55
            --]]
            if u54.gameEntity then
                local v58 = u11.Assets.Effects.GolemBossGroundSlam:Clone()
                v58.Position = u57
                v58.Parent = u13
                u27:playEffects({ v58 }, nil, {
                    ["sizeMultiplier"] = 4,
                    ["destroyAfterSec"] = 2.5
                })
                u54:playScreenShakeEffect(u57, {
                    ["cycles"] = 20,
                    ["magnitude"] = 2
                })
            end
            u7.Controllers.GolemBossController:playShockwaveEffect(u55.dangerBlockPositions, nil, nil, u54.serverInstance)
        end)
    end
end
function u29.handlePillarSummonActionRequest(u59, u60) --[[ Line: 238 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u16
        [4] = u15
        [5] = u26
        [6] = u6
        [7] = u24
        [8] = u19
        [9] = u5
        [10] = u11
        [11] = u13
        [12] = u27
    --]]
    if not u59.gameEntity or (not u59.gameEntity.Parent or u59.isDead) then
        return nil
    end
    u7.Controllers.GolemBossController:showDangerIndicators(u59:convertLayersIntoDangerPositions(u60.dangerBlockPositions))
    local v61 = u4:playAnimation(u59.gameEntity, u16:getAssetId(u15.BHAA_ROCKSPIKE))
    if v61 ~= nil then
        v61:AdjustSpeed(1)
    end
    if v61 then
        local v62 = u26:getGameEntityCFrame(u59.gameEntity).Position
        local v63 = u59.serverInstance
        if v63 ~= nil then
            v63 = v63:GetAttribute("BossType")
        end
        u6:playSound(u24.BHAA_SPIKE_WARMUP, {
            ["position"] = v62
        })
        task.delay(u19, function() --[[ Line: 260 ]]
            --[[
            Upvalues:
                [1] = u59
                [2] = u7
                [3] = u60
                [4] = u5
                [5] = u11
                [6] = u13
                [7] = u27
                [8] = u6
                [9] = u24
            --]]
            if not u59.gameEntity or (not u59.gameEntity.Parent or u59.isDead) then
                return nil
            end
            u7.Controllers.GolemBossController:playShockwaveEffect(u60.dangerBlockPositions, nil, nil, u59.serverInstance)
            if u60.pillarSummonLocations then
                local v64 = u5.fromList
                local v65 = u60.pillarSummonLocations
                u59:playScreenShakeEffect(v64(unpack(v65)), {
                    ["magnitude"] = 1
                })
                local v66 = u60.pillarSummonLocations
                local function v69(p67) --[[ Line: 275 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u13
                        [3] = u27
                        [4] = u6
                        [5] = u24
                    --]]
                    local v68 = u11.Assets.Effects.GolemBossGroundSlam:Clone()
                    v68.Position = p67
                    v68.Parent = u13
                    u27:playEffects({ v68 }, nil, {
                        ["sizeMultiplier"] = 1.5,
                        ["destroyAfterSec"] = 2.5
                    })
                    u6:playSound(u24.BHAA_SPIKE, {
                        ["position"] = p67
                    })
                end
                for v70, v71 in v66 do
                    v69(v71, v70 - 1, v66)
                end
            end
            if u60.pillarSummonLocations then
                u59:handleLegSpike(u60.pillarSummonLocations)
            end
        end)
    end
end
function u29.onEnterSpawningState(u72) --[[ Line: 298 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u16
        [3] = u15
        [4] = u26
        [5] = u10
        [6] = u6
        [7] = u24
    --]]
    if not (u72.gameEntity and u72.gameEntity.Parent) then
        return nil
    end
    local v73 = u4:playAnimation(u72.gameEntity, u16:getAssetId(u15.BHAA_SPAWN), {
        ["looped"] = false
    })
    if v73 ~= nil then
        v73:AdjustSpeed(0.4)
    end
    task.delay(0.5, function() --[[ Line: 311 ]]
        --[[
        Upvalues:
            [1] = u72
            [2] = u26
        --]]
        if not u72.gameEntity or (not u72.gameEntity.Parent or u72.isDead) then
            return nil
        end
        u26:showStatefulEntity(u72.gameEntity)
    end)
    if v73 then
        task.delay(1, function() --[[ Line: 318 ]]
            --[[
            Upvalues:
                [1] = u72
                [2] = u26
                [3] = u10
                [4] = u6
                [5] = u24
            --]]
            if not u72.gameEntity or (not u72.gameEntity.Parent or u72.isDead) then
                return nil
            end
            local v74 = u26:getGameEntityCFrame(u72.gameEntity).Position
            local v75 = u10.LocalPlayer.Character
            if v75 ~= nil then
                v75 = v75.PrimaryPart
                if v75 ~= nil then
                    v75 = v75.Position
                end
            end
            if v75 then
                v75 = (u10.LocalPlayer.Character.PrimaryPart.Position - v74).Magnitude < 350
            end
            if v75 then
                u6:playSound(u24.BHAA_SPAWN)
            end
            u72:playScreenShakeEffect(v74, {
                ["magnitude"] = 4
            })
        end)
    end
end
function u29.onEnterRotatingState(p76) --[[ Line: 345 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u16
        [3] = u15
    --]]
    if not p76.gameEntity or (not p76.gameEntity.Parent or p76.isDead) then
        return nil
    end
    local v77 = p76.track
    if v77 ~= nil then
        v77:Stop()
    end
    p76.track = u4:playAnimation(p76.gameEntity, u16:getAssetId(u15.BHAA_MOVEMENT), {
        ["looped"] = true
    })
end
function u29.onEntityDeath(u78) --[[ Line: 357 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u14
        [3] = u26
        [4] = u7
        [5] = u4
        [6] = u16
        [7] = u15
        [8] = u6
        [9] = u24
    --]]
    u78.isDead = true
    if not (u78.gameEntity and u78.gameEntity.Parent) then
        return nil
    end
    local v79 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
    local v80 = {
        ["app"] = u14
    }
    local v81 = u78.entityUUID
    v80.appId = "StatefulEntityHpBarBillboard_" .. tostring(v81)
    v79:closeApp(v80)
    local u82 = u26:getGameEntityCFrame(u78.gameEntity).Position
    task.spawn(function() --[[ Line: 371 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        local v83 = 0
        while v83 <= 4 do
            v83 = v83 + 1
            u7.Controllers.GolemBossController:hideAllBlockDangerIndicators()
            task.wait(0.5)
        end
    end)
    task.delay(0.8, function() --[[ Line: 383 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u78
            [3] = u16
            [4] = u15
            [5] = u6
            [6] = u24
            [7] = u82
        --]]
        local u84 = u4:playAnimation(u78.gameEntity, u16:getAssetId(u15.BHAA_DEATH), {
            ["looped"] = false
        })
        if u84 then
            task.delay(2, function() --[[ Line: 389 ]]
                --[[
                Upvalues:
                    [1] = u84
                    [2] = u78
                    [3] = u6
                    [4] = u24
                    [5] = u82
                --]]
                u84:AdjustSpeed(0)
                local v85 = u78.serverInstance
                if v85 ~= nil then
                    v85 = v85:GetAttribute("BossType")
                end
                if v85 == "SpiritGolem" then
                    local v86 = {
                        ["position"] = u82
                    }
                    u6:playSound(u24.SPIRIT_TITAN_DEATH_2, v86)
                elseif v85 == "VoidGolem" then
                    local v87 = {
                        ["position"] = u82
                    }
                    u6:playSound(u24.VOID_TITAN_DEATH_2, v87)
                else
                    local v88 = {
                        ["position"] = u82
                    }
                    u6:playSound(u24.TITAN_DEATH_2, v88)
                end
                u78:playScreenShakeEffect(u82, {
                    ["magnitude"] = 4
                })
            end)
        end
    end)
    local v89 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
    local v90 = u78.entityUUID
    v89:closeApp("StatefulEntityHpBarBillboard_" .. tostring(v90))
    task.delay(5, function() --[[ Line: 421 ]]
        --[[
        Upvalues:
            [1] = u78
        --]]
        local v91 = u78.gameEntity
        if v91 ~= nil then
            v91 = v91:Destroy()
        end
        return v91
    end)
end
function u29.handleLegSpike(_, p92) --[[ Line: 429 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
        [3] = u13
        [4] = u27
        [5] = u6
        [6] = u24
        [7] = u1
        [8] = u12
    --]]
    local function u103(p93) --[[ Line: 430 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u5
            [3] = u13
            [4] = u27
            [5] = u6
            [6] = u24
            [7] = u1
            [8] = u12
        --]]
        local v94 = u11.Assets.Effects.BhaaSpike:GetChildren()
        local u95 = u5.fromList(unpack(v94)):Clone()
        u95.Size = u95.Size * 0.75
        local u96 = Vector3.FromNormalId(Enum.NormalId.Top) * (u95.Size.Y / 2 - 1)
        local u97 = Vector3.FromNormalId(Enum.NormalId.Bottom) * (u95.Size.Y / 2)
        local u98 = CFrame.new(p93)
        u95.Anchored = true
        u95:PivotTo(u98 + u97)
        u95.Parent = u13
        local v99 = u11.Assets.Effects.DustLandEffect:Clone()
        v99:PivotTo(u98)
        v99.Parent = u13
        local v100 = u27:enableInstanceEffect(v99)
        u6:playSound(u24.FALLING_ROCKS, {
            ["volumeMultiplier"] = 2,
            ["rollOffMaxDistance"] = 150,
            ["position"] = u98.Position
        })
        task.wait(1)
        v100:DoCleaning()
        u1.Promise.defer(function() --[[ Line: 461 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u24
                [3] = u98
                [4] = u12
                [5] = u95
                [6] = u96
                [7] = u97
            --]]
            u6:playSound(u24.SPIKE_ERUPT, {
                ["volumeMultiplier"] = 2,
                ["rollOffMaxDistance"] = 150,
                ["position"] = u98.Position
            })
            local v101 = u12:Create(u95, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false), {
                ["CFrame"] = u98 + u96
            })
            v101:Play()
            v101.Completed:Wait()
            task.wait(0.7)
            local v102 = u12:Create(u95, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false), {
                ["CFrame"] = u98 + u97
            })
            v102:Play()
            v102.Completed:Wait()
            u95:Destroy()
        end)
    end
    for v104, u105 in p92 do
        local _ = v104 - 1
        task.spawn(function() --[[ Line: 483 ]]
            --[[
            Upvalues:
                [1] = u103
                [2] = u105
            --]]
            u103(u105)
        end)
    end
end
return {
    ["BhaaBossClient"] = u29
}