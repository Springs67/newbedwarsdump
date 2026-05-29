local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local v9 = v7.ReplicatedStorage
local u10 = v7.RunService
local u11 = v7.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "target-dummy", "target-dummy-constants")
local u16 = v15.TARGET_DUMMY_RANGED_DAMAGE_DELAY
local u17 = v15.TargetDummyAction
local u18 = v15.TargetDummyState
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity").StatefulEntity
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u25 = u13.TARGET_DUMMY_SOLO_ATTACK
local u26 = u13.TARGET_DUMMY_SPIN_ATTACK
local u27 = {
    v9.Assets.Misc.TargetDummyTier1,
    v9.Assets.Misc.TargetDummyTier2,
    v9.Assets.Misc.TargetDummyTier3,
    v9.Assets.Misc.TargetDummyTier4
}
local u28 = v9.Assets.Misc.TargetDummyRangedAttack
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 41 ]]
        return "TargetDummyClient"
    end,
    ["__index"] = u21
})
u29.__index = u29
function u29.new(...) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32, p33, p34, p35, p36, p37) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u18
        [3] = u22
        [4] = u27
        [5] = u23
        [6] = u11
        [7] = u4
        [8] = u14
        [9] = u13
    --]]
    u21.constructor(p32, u18.SPAWNING, u22.TARGET_DUMMY, p33, p34)
    p32.rotationBeingInterpolated = false
    p32.currentTierIndex = -1
    p32.currentTierIndex = p36
    local v38 = u27[p32.currentTierIndex + 1]:Clone()
    u23:setEntityIgnoreQuery(v38)
    v38:PivotTo(p33)
    p32.serverInstance = p35
    p32.gameEntity = v38
    local v39 = p32.gameEntity:FindFirstChild("Root")
    if v39 ~= nil then
        v39 = v39:FindFirstChild("rig")
    end
    p32.animateRig = v39
    p32.spawnPosition = p33.Position
    v38.Parent = u11
    p32.teamId = p37
    u4:playAnimation(p32.animateRig, u14:getAssetId(u13.TARGET_DUMMY_SPAWN), {
        ["looped"] = false
    })
    p32:createEntityHealthbar()
end
function u29.createEntityHealthbar(p40) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u8
        [3] = u24
        [4] = u2
        [5] = u12
    --]]
    if p40.gameEntity and p40.serverInstance then
        local v41
        if u19.getGamePlayer(u8.LocalPlayer):getTeamId() == p40.teamId then
            v41 = u24.mcGreen
        else
            v41 = u24.mcRed
        end
        local v42 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
        local v43 = {
            ["app"] = u12
        }
        local v44 = p40.entityUUID
        v43.appId = "StatefulEntityHpBarBillboard_" .. tostring(v44)
        v42:openApp(v43, {
            ["hpBarOffset"] = Vector3.new(0, 7, 0),
            ["gameEntity"] = p40.gameEntity,
            ["serverInstance"] = p40.serverInstance,
            ["barColor"] = v41
        }, nil, p40.gameEntity)
    end
end
function u29.createGameEntity(p45, _) --[[ Line: 94 ]]
    p45:onHeartbeat()
end
function u29.onEntityDamaged(p46, _, _) --[[ Line: 97 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u20
    --]]
    if not p46.gameEntity then
        return nil
    end
    local v47 = {
        ["rollOffMaxDistance"] = 20,
        ["position"] = p46.gameEntity:GetPivot().Position
    }
    u5:playSound(u20.TARGET_DUMMY_DAMAGED, v47)
end
function u29.onEntityDeath(u48) --[[ Line: 110 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u14
        [3] = u13
        [4] = u2
    --]]
    local v49 = u4:playAnimation(u48.gameEntity, u14:getAssetId(u13.TARGET_DUMMY_DEATH), {
        ["looped"] = false
    })
    if v49 ~= nil then
        v49.Stopped:Connect(function() --[[ Line: 118 ]]
            --[[
            Upvalues:
                [1] = u48
            --]]
            local v50 = u48.gameEntity
            if v50 ~= nil then
                v50 = v50:Destroy()
            end
            return v50
        end)
    end
    task.delay(3, function() --[[ Line: 128 ]]
        --[[
        Upvalues:
            [1] = u48
        --]]
        if u48.gameEntity and u48.gameEntity.Parent then
            u48.gameEntity:Destroy()
        end
    end)
    local v51 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
    local v52 = u48.entityUUID
    v51:closeApp("StatefulEntityHpBarBillboard_" .. tostring(v52))
end
function u29.onStateEnter(p53, p54) --[[ Line: 136 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    if p54 == u18.SPAWNING then
        p53:onEnterSpawningState()
    end
end
function u29.onStateExit(_, _) --[[ Line: 141 ]] end
function u29.handleActionRequest(p55, p56, p57) --[[ Line: 143 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u17
    --]]
    if p55.animateRig ~= nil and p57.targetPosition ~= nil then
        u23:rotateTo(p55.animateRig, p57.targetPosition, 0.5)
    end
    if p56 == u17.ALERT then
        p55:handleAlertActionRequest(p57.targetPlayer)
        return
    elseif p56 == u17.SPIN_ATTACK then
        p55:handleSpinAttackActionRequest()
        return
    elseif p56 == u17.SOLO_ATTACK then
        p55:handleSoloAttackActionRequest()
        return
    elseif p56 == u17.RANGED_ATTACK then
        p55:handleRangedAttackActionRequest(p57)
    elseif p56 == u17.REMOVE_TARGET then
        p55.currentTarget = nil
    end
end
function u29.handleAlertActionRequest(p58, p59) --[[ Line: 162 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u14
        [3] = u13
        [4] = u5
        [5] = u20
        [6] = u19
        [7] = u8
    --]]
    if not (p58.gameEntity and p58.gameEntity.Parent) then
        return nil
    end
    local v60 = p58.gameEntity:GetPivot().Position
    if p58.animateRig == nil then
        return nil
    end
    u4:playAnimation(p58.animateRig, u14:getAssetId(u13.TARGET_DUMMY_ALERT), {
        ["looped"] = false
    })
    local u61 = u5:playSound(u20.TARGET_DUMMY_ALERT, {
        ["rollOffMaxDistance"] = 120,
        ["volumeMultiplier"] = 1.2,
        ["looped"] = true,
        ["position"] = v60
    })
    task.delay(6, function() --[[ Line: 179 ]]
        --[[
        Upvalues:
            [1] = u61
        --]]
        u61:Stop()
    end)
    if u19.getGamePlayer(u8.LocalPlayer):getTeamId() ~= p58.teamId then
        return nil
    end
    if p59 then
        p58:highlightPlayer(p59)
    end
end
function u29.highlightPlayer(_, p62) --[[ Line: 190 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u24
    --]]
    local v63 = p62.Character
    local u64 = u6("Highlight", {
        ["FillTransparency"] = 0.7,
        ["OutlineTransparency"] = 0.2,
        ["Parent"] = nil,
        ["FillColor"] = u24.mcRed,
        ["OutlineColor"] = u24.mcRed,
        ["DepthMode"] = Enum.HighlightDepthMode.AlwaysOnTop
    })
    u64.Parent = v63
    u64.Enabled = true
    task.delay(6, function() --[[ Line: 203 ]]
        --[[
        Upvalues:
            [1] = u64
        --]]
        u64.Enabled = false
        u64:Destroy()
    end)
end
function u29.handleSoloAttackActionRequest(p65) --[[ Line: 208 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u14
        [3] = u25
        [4] = u5
        [5] = u20
    --]]
    if not (p65.gameEntity and p65.gameEntity.Parent) then
        return nil
    end
    local v66 = p65.gameEntity:GetPivot().Position
    if p65.animateRig == nil then
        return nil
    end
    u4:playAnimation(p65.animateRig, u14:getAssetId(u25), {
        ["looped"] = false
    })
    u5:playSound(u20.TARGET_DUMMY_SOLO_ATTACK, {
        ["position"] = v66
    })
end
function u29.handleSpinAttackActionRequest(p67) --[[ Line: 223 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u14
        [3] = u26
        [4] = u5
        [5] = u20
    --]]
    if not (p67.gameEntity and p67.gameEntity.Parent) then
        return nil
    end
    local v68 = p67.gameEntity:GetPivot().Position
    if p67.animateRig == nil then
        return nil
    end
    u4:playAnimation(p67.animateRig, u14:getAssetId(u26), {
        ["looped"] = false
    })
    u5:playSound(u20.TARGET_DUMMY_SPIN_ATTACK, {
        ["position"] = v68
    })
end
function u29.handleRangedAttackActionRequest(u69, p70) --[[ Line: 238 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u20
        [3] = u4
        [4] = u14
        [5] = u13
        [6] = u16
        [7] = u28
        [8] = u11
    --]]
    if not (u69.gameEntity and u69.gameEntity.Parent) then
        return nil
    end
    u5:playSound(u20.TARGET_DUMMY_SWORD_SPAWN, {
        ["rollOffMaxDistance"] = 80,
        ["position"] = u69.spawnPosition
    })
    local u71 = p70.targetPlayer.Character
    if u71 ~= nil then
        u71 = u71.PrimaryPart
    end
    if not u71 then
        return nil
    end
    if u69.animateRig ~= nil then
        u4:playAnimation(u69.animateRig, u14:getAssetId(u13.TARGET_DUMMY_RANGED_ATTACK), {
            ["looped"] = false
        })
    end
    local v72 = math.random(0, 360)
    local v73 = math.cos(v72) * 8
    local v74 = math.sin(v72) * 8
    local u75 = Vector3.new(v73, 15, v74) + u71.Position
    task.delay(u16, function() --[[ Line: 269 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u11
            [3] = u75
            [4] = u69
            [5] = u71
        --]]
        local v76 = u28:Clone()
        v76.Parent = u11
        v76:PivotTo(CFrame.new(u75))
        v76.Anchored = true
        u69:performRangedAttack(v76, u75, u71)
    end)
end
function u29.performRangedAttack(_, u77, p78, p79) --[[ Line: 277 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u20
    --]]
    local u80 = u5:playSound(u20.TARGET_DUMMY_RANGED_ATTACK_FLY, {
        ["rollOffMaxDistance"] = 80,
        ["looped"] = true,
        ["position"] = p79.Position
    })
    local v81 = 0
    while v81 < 1 do
        v81 = v81 + 0.15
        local v82 = p79.Position
        local v83 = p78:Lerp(v82, v81)
        u77.CFrame = CFrame.new(v83, v82)
        u77.CFrame = u77.CFrame * CFrame.Angles(1.5707963267948966, 0, 0)
        task.wait()
    end
    u5:playSound(u20.TARGET_DUMMY_RANGED_ATTACK_LAND, {
        ["rollOffMaxDistance"] = 80,
        ["position"] = p79.Position
    })
    task.delay(1, function() --[[ Line: 300 ]]
        --[[
        Upvalues:
            [1] = u80
            [2] = u77
        --]]
        u80:Stop()
        u77:Destroy()
    end)
end
function u29.onEnterSpawningState(p84) --[[ Line: 306 ]]
    if not (p84.gameEntity and p84.gameEntity.Parent) then
        return nil
    end
    if p84.animateRig == nil then
        return nil
    end
end
function u29.onHeartbeat(u85) --[[ Line: 314 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u23
        [3] = u4
        [4] = u14
        [5] = u13
    --]]
    u85.deathMaid:GiveTask(u10.Heartbeat:Connect(function(_) --[[ Line: 315 ]]
        --[[
        Upvalues:
            [1] = u85
            [2] = u23
            [3] = u4
            [4] = u14
            [5] = u13
        --]]
        if not (u85.gameEntity and u85.gameEntity.Parent) then
            return nil
        end
        if not u85.currentTarget then
            return nil
        end
        local v86 = u85.currentTarget:GetPivot().Position
        u23:rotateTo(u85.gameEntity, v86)
        if u85.animateRig == nil then
            return nil
        end
        u4:playAnimation(u85.animateRig, u14:getAssetId(u13.TARGET_DUMMY_DEATH), {
            ["looped"] = false
        })
    end))
end
function u29.getGameEntity(p87) --[[ Line: 333 ]]
    return p87.gameEntity
end
return {
    ["TargetDummyClient"] = u29
}