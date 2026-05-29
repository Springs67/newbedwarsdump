local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.RandomUtil
local u6 = v3.SoundManager
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.RunService
local u9 = v7.Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-skin-theme-meta").getCurrentStatefulEntitySkinMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-type").StatefulEntityType
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "diamond-guardian", "diamond-guardian-constants")
local u16 = v15.DiamondGuardianAction
local u17 = v15.DiamondGuardianState
local u18 = v15.GUARDIAN_TURN_DURATION
local u19 = v15.GUARDIAN_TURN_RATE
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity").StatefulEntity
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil
local u24 = { u11.DIAMOND_GUARDIAN_ATTACK_1 }
local u25 = { u20.GUARDIAN_HIT_1, u20.GUARDIAN_HIT_2, u20.GUARDIAN_HIT_3 }
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 35 ]]
        return "DiamondGuardianClient"
    end,
    ["__index"] = u21
})
u26.__index = u26
function u26.new(...) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(p29, p30, p31, p32) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u17
        [3] = u22
    --]]
    u21.constructor(p29, u17.SPAWNING, u22.DIAMOND_GUARDIAN, p30, p31)
    p29.rotationBeingInterpolated = false
    p29.isFlashing = false
    p29.serverInstance = p32
    p29:createEntityHealthbar()
end
function u26.createEntityHealthbar(p33) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u10
    --]]
    if p33.gameEntity and p33.serverInstance then
        local v34 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
        local v35 = {
            ["app"] = u10
        }
        local v36 = p33.entityUUID
        v35.appId = "StatefulEntityHpBarBillboard_" .. tostring(v36)
        v34:openApp(v35, {
            ["hpBarOffset"] = Vector3.new(0, 3.5, 0),
            ["gameEntity"] = p33.gameEntity,
            ["serverInstance"] = p33.serverInstance
        }, nil, p33.gameEntity)
    end
end
function u26.createGameEntity(p37, p38) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
        [3] = u23
        [4] = u22
        [5] = u9
    --]]
    local v39 = u13(u14.DIAMOND_GUARDIAN).model:Clone()
    u23:setEntityIgnoreQuery(v39)
    u23:setClientEntityNotCollidable(v39)
    v39:PivotTo(p38)
    p37.gameEntity = v39
    p37.gameEntity:AddTag("GameEntity_" .. u22.DIAMOND_GUARDIAN)
    v39.Parent = u9
    p37:onHeartbeat()
    p37:registerClientGameEntity(v39)
end
function u26.onEntityDamaged(p40, _, _) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u25
        [3] = u6
    --]]
    if not p40.gameEntity then
        return nil
    end
    local v41 = u25
    u6:playSound(u5.fromList(unpack(v41)), {
        ["rollOffMaxDistance"] = 20,
        ["position"] = p40.gameEntity:GetPivot().Position
    })
    p40:playEntityFlashEffect()
end
function u26.onEntityDeath(u42) --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u12
        [3] = u11
        [4] = u2
    --]]
    local v43 = u4:playAnimation(u42.gameEntity, u12:getAssetId(u11.DIAMOND_GUARDIAN_DEATH), {
        ["looped"] = false
    })
    if v43 ~= nil then
        v43.Stopped:Connect(function() --[[ Line: 101 ]]
            --[[
            Upvalues:
                [1] = u42
            --]]
            local v44 = u42.gameEntity
            if v44 ~= nil then
                v44 = v44:Destroy()
            end
            return v44
        end)
    end
    task.delay(3, function() --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        if u42.gameEntity and u42.gameEntity.Parent then
            u42.gameEntity:Destroy()
        end
    end)
    local v45 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
    local v46 = u42.entityUUID
    v45:closeApp("StatefulEntityHpBarBillboard_" .. tostring(v46))
end
function u26.onStateEnter(p47, p48) --[[ Line: 119 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    if p48 == u17.IDLE then
        p47:onEnterIdleState()
    end
end
function u26.onStateExit(_, _) --[[ Line: 124 ]] end
function u26.handleActionRequest(p49, p50, p51) --[[ Line: 126 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    if p50 == u16.MOVE then
        p49:handleMoveActionRequest(p51)
        return
    elseif p50 == u16.FOLLOW_ATTACK then
        p49:handleFollowAttackActionRequest(p51)
        return
    elseif p50 == u16.ATTACK then
        p49:handleAttackActionRequest()
    elseif p50 == u16.REMOVE_TARGET then
        p49.currentTarget = nil
    end
end
function u26.handleMoveActionRequest(p52, p53) --[[ Line: 139 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u12
        [3] = u11
        [4] = u23
        [5] = u19
    --]]
    if not (p52.gameEntity and p52.gameEntity.Parent) then
        return nil
    end
    u4:playAnimation(p52.gameEntity, u12:getAssetId(u11.DIAMOND_GUARDIAN_MOVE), {
        ["looped"] = true
    })
    u23:clientMoveTo(p52.gameEntity, p53.targetPosition, p53.moveSpeed, u19, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
end
function u26.handleFollowAttackActionRequest(u54, p55) --[[ Line: 148 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u19
        [3] = u18
        [4] = u4
        [5] = u12
        [6] = u11
        [7] = u6
        [8] = u20
    --]]
    if not (u54.gameEntity and u54.gameEntity.Parent) then
        return nil
    end
    u54.currentTarget = p55.targetEntityInstance
    u23:clientMoveTo(u54.gameEntity, p55.targetPosition, p55.moveSpeed, u19, Enum.EasingStyle.Sine, Enum.EasingDirection.Out):andThen(function() --[[ Line: 154 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u23
            [3] = u18
        --]]
        if not u54.gameEntity then
            return nil
        end
        local v56 = u54.currentTarget
        if v56 ~= nil then
            v56 = v56:GetPivot().Position
        end
        if not v56 then
            return nil
        end
        u54.rotationBeingInterpolated = true
        u23:rotateTo(u54.gameEntity, v56, u18):andThen(function() --[[ Line: 168 ]]
            --[[
            Upvalues:
                [1] = u54
            --]]
            u54.rotationBeingInterpolated = false
            return u54.rotationBeingInterpolated
        end)
    end)
    u4:playAnimation(u54.gameEntity, u12:getAssetId(u11.DIAMOND_GUARDIAN_MOVE), {
        ["looped"] = true
    })
    task.delay(0.2, function() --[[ Line: 180 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u4
            [3] = u6
            [4] = u20
        --]]
        if not (u54.gameEntity and u54.gameEntity.Parent) then
            return nil
        end
        local v57 = u54.gameEntity:GetPivot().Position
        u4:playAnimation(u54.gameEntity, u54:getRandomAttackAnimation(), {
            ["looped"] = false
        })
        u6:playSound(u20.GUARDIAN_ATTACK, {
            ["position"] = v57
        })
    end)
end
function u26.handleAttackActionRequest(p58) --[[ Line: 193 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u20
    --]]
    if not (p58.gameEntity and p58.gameEntity.Parent) then
        return nil
    end
    local v59 = p58.gameEntity:GetPivot().Position
    u4:playAnimation(p58.gameEntity, p58:getRandomAttackAnimation(), {
        ["looped"] = false
    })
    u6:playSound(u20.GUARDIAN_ATTACK, {
        ["position"] = v59
    })
end
function u26.onEnterIdleState(p60) --[[ Line: 205 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u12
        [3] = u11
    --]]
    if not (p60.gameEntity and p60.gameEntity.Parent) then
        return nil
    end
    u4:playAnimation(p60.gameEntity, u12:getAssetId(u11.DIAMOND_GUARDIAN_IDLE), {
        ["looped"] = true
    })
end
function u26.onHeartbeat(u61) --[[ Line: 213 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u23
    --]]
    u61.deathMaid:GiveTask(u8.Heartbeat:Connect(function(_) --[[ Line: 214 ]]
        --[[
        Upvalues:
            [1] = u61
            [2] = u23
        --]]
        if not (u61.gameEntity and u61.gameEntity.Parent) then
            return nil
        end
        if not u61.currentTarget then
            return nil
        end
        if u61.rotationBeingInterpolated then
            return nil
        end
        local v62 = u61.currentTarget:GetPivot().Position
        u23:rotateTo(u61.gameEntity, v62)
    end))
end
function u26.playEntityFlashEffect(u63) --[[ Line: 230 ]]
    if u63.isFlashing then
        return nil
    end
    u63.isFlashing = true
    task.spawn(function() --[[ Line: 235 ]]
        --[[
        Upvalues:
            [1] = u63
        --]]
        if not (u63.gameEntity and u63.gameEntity.Parent) then
            return nil
        end
        local u64 = u63.gameEntity:WaitForChild("GuardianMesh")
        local u65 = u63.gameEntity:WaitForChild("NeonMesh")
        local u66 = u64.TextureID
        local u67 = u64.Material
        local u68 = u65.Color
        local u69 = u65.Transparency
        u64.TextureID = ""
        u64.Material = Enum.Material.Neon
        u64.Color = Color3.fromRGB(255, 255, 255)
        u65.Color = Color3.fromRGB(255, 255, 255)
        u65.Transparency = 0.65
        task.delay(0.1, function() --[[ Line: 252 ]]
            --[[
            Upvalues:
                [1] = u64
                [2] = u66
                [3] = u67
                [4] = u65
                [5] = u68
                [6] = u69
                [7] = u63
            --]]
            u64.TextureID = u66
            u64.Material = u67
            u65.Color = u68
            u65.Transparency = u69
            u63.isFlashing = false
        end)
    end)
end
function u26.getRandomAttackAnimation(_) --[[ Line: 263 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u24
        [3] = u12
    --]]
    local v70 = u24
    return u12:getAssetId((u5.fromList(unpack(v70))))
end
return {
    ["DiamondGuardianClient"] = u26
}