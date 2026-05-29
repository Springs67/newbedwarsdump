local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.ColorUtil
local u5 = v2.RandomUtil
local u6 = v2.SoundManager
local u7 = v2.WatchCollectionTag
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.RunService
local u14 = v10.TweenService
local u15 = v10.Workspace
local u16 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "constants", "winter-event-scene-constants")
local u23 = v22.BossAction
local u24 = v22.BossState
local u25 = v22.WINTER_BOSS_TAG
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u28 = ColorSequence.new(u4.hexColor(7793650), u4.hexColor(610681))
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 63 ]]
        return "WinterBossController"
    end,
    ["__index"] = u16
})
u29.__index = u29
function u29.new(...) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p32)
    p32.Name = "WinterBossController"
    p32.propsDestroyed = false
end
function u29.KnitStart(p33) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.KnitStart(p33)
    p33:listenForBossSpawnRequest()
    p33:listenForBossFightStart()
    p33:listenForBossStateUpdates()
    p33:listenForBossActions()
    p33:listenForBossSpinRequest()
    p33:listenForAxeSpin()
    p33:listenForPenguin()
end
function u29.listenForPenguin(_) --[[ Line: 88 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u6
        [3] = u5
        [4] = u26
        [5] = u3
        [6] = u18
        [7] = u17
    --]]
    u21.Client:Get("BigPenguinAttack"):Connect(function(p34) --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u5
            [3] = u26
            [4] = u3
            [5] = u18
            [6] = u17
        --]]
        local v35 = p34.model.PrimaryPart
        if v35 ~= nil then
            v35 = v35.Position
        end
        if v35 then
            local v36 = u6
            local v37 = u5.fromList
            local v38 = { u26.PENGUIN_ATTACK_1, u26.PENGUIN_ATTACK_2, u26.PENGUIN_ATTACK_3 }
            v36:playSound(v37(unpack(v38)), {
                ["volumeMultiplier"] = 0.7,
                ["rollOffMaxDistance"] = 110,
                ["rollOffMinDistance"] = 50,
                ["position"] = v35
            })
        end
        u3:playAnimation(p34.model, u18:getAssetId(u17.BIG_PENGUIN_ATTACK))
    end)
end
function u29.listenForAxeSpin(u39) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u12
        [3] = u9
        [4] = u26
        [5] = u13
        [6] = u15
    --]]
    u21.Client:Get("WinterEventAxeSpin"):Connect(function(u40) --[[ Line: 107 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u39
            [3] = u9
            [4] = u26
            [5] = u13
            [6] = u15
        --]]
        local u41 = u12.Assets.Effects.IceHammer:Clone()
        local u42 = 0
        u41.Parent = u40.part
        u39:handleEnterAxeSpinState(u40.targetPosition)
        u9("Sound", {
            ["RollOffMinDistance"] = 100,
            ["RollOffMaxDistance"] = 240,
            ["Volume"] = 0.7,
            ["Playing"] = true,
            ["PlaybackSpeed"] = 1,
            ["Looped"] = true,
            ["SoundId"] = u26.FROST_STORM_LOOP,
            ["Parent"] = u40.part
        }):Play()
        local u43 = nil
        u43 = u13.Heartbeat:Connect(function(p44) --[[ Line: 124 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u15
                [3] = u39
                [4] = u43
                [5] = u42
                [6] = u41
            --]]
            if u40.part.Parent ~= u15 then
                u39:showAxe()
                u43:Disconnect()
            end
            u42 = u42 + p44
            u41:PivotTo(CFrame.new(u40.part.Position) * CFrame.Angles(1.5707963267948966, 0, u42 * 3 * 3.141592653589793))
        end)
    end)
end
function u29.listenForBossSpawnRequest(u45) --[[ Line: 137 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u7
        [3] = u25
    --]]
    u21.Client:WaitFor("WinterEventBossSpawned"):expect():Connect(function(p46) --[[ Line: 139 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        u45.bossAssets = p46.bossAssets
        u45:spawnBoss()
    end)
    u7(u25, function(p47) --[[ Line: 144 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        u45.bossServerInstance = p47
    end)
end
function u29.listenForBossFightStart(u48) --[[ Line: 148 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.Client:WaitFor("WinterEventBossFightStart"):expect():Connect(function() --[[ Line: 149 ]]
        --[[
        Upvalues:
            [1] = u48
        --]]
        u48:startBossFight()
    end)
end
function u29.spawnHealthbar(u49) --[[ Line: 153 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u8
        [3] = u28
    --]]
    task.delay(1.5, function() --[[ Line: 154 ]]
        --[[
        Upvalues:
            [1] = u49
            [2] = u20
            [3] = u8
            [4] = u28
        --]]
        if not u49.bossServerInstance then
            return nil
        end
        local v50 = u20:getEntity(u49.bossServerInstance)
        if v50 then
            local v51 = {
                ["DisplayName"] = "ADETUNDE",
                ["Gradient"] = u28
            }
            u8.Controllers.BossBarController:mountEntityBossBar(v50, v51)
        end
    end)
end
function u29.listenForBossStateUpdates(u52) --[[ Line: 167 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.Client:WaitFor("WinterEventBossStateUpdate"):expect():Connect(function(p53) --[[ Line: 168 ]]
        --[[
        Upvalues:
            [1] = u52
        --]]
        u52:setState(p53.state)
    end)
end
function u29.listenForBossActions(u54) --[[ Line: 172 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.Client:WaitFor("WinterEventBossAction"):expect():Connect(function(p55) --[[ Line: 173 ]]
        --[[
        Upvalues:
            [1] = u54
        --]]
        u54:routeBossAction(p55.action, p55.actionData)
    end)
end
function u29.routeBossAction(p56, p57, p58) --[[ Line: 177 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    if p57 == u23.MOVE then
        p56:handleMoveAction(p58)
        return
    elseif p57 == u23.DROP_ICICLES then
        p56:handleDropIciclesAction(p58)
        return
    elseif p57 == u23.CREATE_FROST then
        p56:handleCreateFrostAction(p58)
        return
    elseif p57 == u23.CREATE_SPIKES then
        p56:handleCreateSpikesAction(p58)
        return
    elseif p57 == u23.PULL_TO_CENTER then
        p56:handlePullToCenterAction(p58)
    elseif p57 == u23.THROW_AXE then
        p56:handleAxeThrowAction(p58)
    end
end
function u29.handleCreateFrostAction(_, _) --[[ Line: 198 ]] end
function u29.handleCreateSpikesAction(_, _) --[[ Line: 200 ]] end
function u29.handlePullToCenterAction(p59, p60) --[[ Line: 202 ]]
    p59:pullToCenter(p60.impulse)
end
function u29.handleMoveAction(u61, u62) --[[ Line: 206 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v63 = u61.bossModel
    if v63 ~= nil then
        v63 = v63.PrimaryPart
    end
    if v63 then
        local v64 = u62.position
        if typeof(v64) == "Vector3" then
            u61:moveTo(u62.position, u62.moveSpeed)
        else
            local u65 = u62.position
            task.spawn(function() --[[ Line: 220 ]]
                --[[
                Upvalues:
                    [1] = u61
                    [2] = u24
                    [3] = u62
                    [4] = u65
                --]]
                for v66, v67 in u65 do
                    local _ = v66 - 1
                    if u61.bossState ~= u24.DEAD then
                        u61:moveTo(v67, u62.moveSpeed):expect()
                    end
                end
            end)
        end
    else
        return nil
    end
end
function u29.moveTo(u68, u69, u70) --[[ Line: 234 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u24
        [3] = u14
    --]]
    return u1.Promise.new(function(u71, u72) --[[ Line: 235 ]]
        --[[
        Upvalues:
            [1] = u68
            [2] = u24
            [3] = u69
            [4] = u70
            [5] = u14
        --]]
        task.spawn(function() --[[ Line: 236 ]]
            --[[
            Upvalues:
                [1] = u68
                [2] = u72
                [3] = u24
                [4] = u69
                [5] = u70
                [6] = u71
                [7] = u14
            --]]
            local v73 = u68.bossModel
            if v73 ~= nil then
                v73 = v73.PrimaryPart
            end
            if not v73 then
                u72()
                return nil
            end
            if u68.bossState == u24.DEAD then
                u72()
                return nil
            end
            local v74 = CFrame.new
            local v75 = u69.X
            local v76 = u68.bossModel:GetPivot().Position.Y
            local v77 = u69.Z
            local v78 = v74((Vector3.new(v75, v76, v77)))
            local v79 = { CFrame.lookAt(u68.bossModel:GetPivot().Position, v78.Position):ToEulerAnglesYXZ() }
            local u80 = v78 * CFrame.Angles(0, v79[2], 0)
            local v81 = u68.bossModel:GetPrimaryPartCFrame():Lerp(u80, 0.25)
            local v82 = u80 - u80.Position
            local v83 = CFrame.new(v81.Position) * v82
            local v84 = u68:getTravelTweenInfo(v83.Position, u70)
            if v84.Time == 0 then
                u71()
                return nil
            end
            local v85 = u14:Create(u68.bossModel.PrimaryPart, v84, {
                ["CFrame"] = v83
            })
            u68.activeMovementTween = v85
            v85.Completed:Connect(function() --[[ Line: 279 ]]
                --[[
                Upvalues:
                    [1] = u68
                    [2] = u80
                    [3] = u70
                    [4] = u14
                    [5] = u71
                --]]
                local v86 = u68:getTravelTweenInfo(u80.Position, u70)
                local v87 = {
                    ["CFrame"] = u80
                }
                local v88 = u14:Create(u68.bossModel.PrimaryPart, v86, v87)
                u68.activeMovementTween = v88
                v88:Play()
                v88.Completed:Wait()
                u71()
            end)
            v85:Play()
        end)
    end)
end
function u29.getTravelTweenInfo(p89, p90, p91) --[[ Line: 294 ]]
    local v92 = p89:getTravelDuration(p90, p91)
    return TweenInfo.new(v92, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
end
function u29.getTravelDuration(p93, p94, p95) --[[ Line: 298 ]]
    if not p93.bossModel then
        return 0
    end
    local v96 = (p93.bossModel:GetPivot().Position - p94).Magnitude / p95
    return math.abs(v96)
end
function u29.handleDropIciclesAction(u97, u98) --[[ Line: 307 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    task.spawn(function() --[[ Line: 308 ]]
        --[[
        Upvalues:
            [1] = u98
            [2] = u97
            [3] = u24
        --]]
        task.delay(0.3, function() --[[ Line: 309 ]]
            --[[
            Upvalues:
                [1] = u98
                [2] = u97
                [3] = u24
            --]]
            if u98.positions then
                for v99, v100 in u98.positions do
                    local _ = v99 - 1
                    if u97.bossState ~= u24.DEAD then
                        u97:createIcicle(v100)
                    end
                end
            end
            if u98.follow then
                task.spawn(function() --[[ Line: 328 ]]
                    --[[
                    Upvalues:
                        [1] = u98
                        [2] = u97
                        [3] = u24
                    --]]
                    if not u98.follow then
                        return nil
                    end
                    task.wait(1)
                    local v101 = u98.follow.duration / u98.follow.interval
                    local v102 = math.ceil(v101)
                    while v102 > 0 and u97.bossState ~= u24.DEAD do
                        v102 = v102 - 1
                        for v103, v104 in u97:getAlivePlayerEntities() do
                            local _ = v103 - 1
                            u97:createIcicle(v104:getInstance():GetPivot().Position)
                        end
                        task.wait(u98.follow.interval)
                    end
                end)
            end
        end)
    end)
end
function u29.createIcicle(u105, p106) --[[ Line: 357 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u15
    --]]
    local u107 = u12.Assets.Misc.Icicle:Clone()
    local v108 = p106.X
    local v109 = p106.Z
    u107.Position = Vector3.new(v108, 950, v109)
    u107.CollisionGroup = "IcicleGroup"
    u107.Parent = u15
    u107.Anchored = false
    local u110 = nil
    u110 = u107.Touched:Connect(function(p111) --[[ Line: 367 ]]
        --[[
        Upvalues:
            [1] = u110
            [2] = u105
            [3] = u107
        --]]
        u110:Disconnect()
        u105:onIcicleCollision(p111, u107)
        task.delay(0.3, function() --[[ Line: 371 ]]
            --[[
            Upvalues:
                [1] = u107
            --]]
            return u107:Destroy()
        end)
    end)
    u105:createIcicleGroundIndicator(u107)
    return u107
end
function u29.createIcicleGroundIndicator(p112, p113) --[[ Line: 379 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u14
    --]]
    if not p112.bossAssets then
        return nil
    end
    local v114 = u9
    local v115 = {
        ["Name"] = "GroundIndicator",
        ["Size"] = Vector3.new(0.1, 5, 5),
        ["Transparency"] = 0.3,
        ["CastShadow"] = false,
        ["Orientation"] = Vector3.new(0, 0, 90),
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanTouch"] = false,
        ["CanQuery"] = false
    }
    local v116 = p113.Position.X
    local v117 = p112.bossAssets.Platforms.BossFight.PlatformCenter.Position.Y - 0.2
    local v118 = p113.Position.Z
    v115.Position = Vector3.new(v116, v117, v118)
    v115.Color = Color3.fromRGB(255, 0, 0)
    v115.Shape = Enum.PartType.Cylinder
    v115.Parent = p113
    u14:Create(v114("Part", v115), TweenInfo.new(2.25, Enum.EasingStyle.Sine), {
        ["Size"] = Vector3.new(0.1, 12, 12),
        ["Transparency"] = 1
    }):Play()
end
function u29.onIcicleCollision(p119, p120, p121) --[[ Line: 415 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u21
    --]]
    local v122 = u11.LocalPlayer.Character
    if v122 then
        if p120.Name == "BossFight" or not p120:IsDescendantOf(v122) then
            p119:playIcicleCollisionEffect(p121.Position)
            p119:checkForIcicleNearHit(p121.Position)
        else
            u21.Client:Get("WinterEventBossIcicleHit"):SendToServer({
                ["nearHit"] = false
            })
        end
    else
        return nil
    end
end
function u29.checkForIcicleNearHit(_, p123) --[[ Line: 435 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u21
    --]]
    local v124 = u11.LocalPlayer.Character
    if v124 ~= nil then
        v124 = v124.PrimaryPart
        if v124 ~= nil then
            v124 = v124.Position
        end
    end
    if not v124 then
        return nil
    end
    if (p123 - v124).Magnitude <= 15.5 then
        u21.Client:Get("WinterEventBossIcicleHit"):SendToServer({
            ["nearHit"] = true
        })
    end
end
function u29.playIcicleCollisionEffect(p125, p126) --[[ Line: 454 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u15
        [3] = u27
        [4] = u11
        [5] = u26
    --]]
    local v127 = p125:getGroundNormalizedPosition(p126)
    local v128 = u12.Assets.Effects.SnowDebris:Clone()
    v128.Position = v127
    v128.Parent = u15
    u27:playEffects({ v128 }, nil, {
        ["destroyAfterSec"] = 1
    })
    local v129 = u11.LocalPlayer.Character
    if v129 ~= nil then
        v129 = v129:GetPivot().Position
    end
    if not v129 then
        return nil
    end
    if (v127 - v129).Magnitude <= 25 then
        p125:playScreenShake(Vector3.new(0, 0, 0), (v129 - v127).Unit)
    end
    p125:playSound(u26.WINTER_BOSS_ICICLE_IMPACT, {
        ["rollOffMaxDistance"] = 200,
        ["volumeMultiplier"] = 2.5,
        ["position"] = v127
    })
end
function u29.spawnBoss(p130) --[[ Line: 492 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u15
        [3] = u24
    --]]
    p130.bossModel = u12.Assets.Misc.MinigameMountain.WinterEventBoss:Clone()
    local v131 = p130.bossAssets.Platforms.BossFight.BossSpawn.CFrame
    local v132 = p130.bossModel:GetExtentsSize().Y / 2
    local v133 = v131 + Vector3.new(0, v132, 0)
    p130.bossModel:PivotTo(v133)
    p130.bossModel.PrimaryPart.Anchored = true
    p130.bossModel.Parent = u15
    p130:setState(u24.FROZEN)
    p130:spawnBossCube(v133)
end
function u29.startBossFight(p134) --[[ Line: 505 ]]
    p134:playSpawnAnimation()
    p134:spawnHealthbar()
    p134:startBossTrack()
end
function u29.playSpawnAnimation(u135) --[[ Line: 513 ]]
    if not u135.bossAnimation then
        return nil
    end
    u135.bossAnimation:AdjustSpeed(1)
    if not u135.bossCube then
        return nil
    end
    local u136 = u135.bossCube:GetChildren()
    task.delay(1.5, function() --[[ Line: 525 ]]
        --[[
        Upvalues:
            [1] = u135
            [2] = u136
        --]]
        local v137 = u135.bossCube
        if v137 ~= nil then
            v137 = v137:GetPivot().Position
        end
        if v137 then
            u135:playCubeExplosionEffect(v137)
        end
        local function v143(p138) --[[ Line: 536 ]]
            local v139 = math.random(-200, 200)
            local v140 = math.random(300, 400)
            local v141 = math.random
            local v142 = Vector3.new(v139, v140, v141(-200, 200)) * p138.Mass
            p138.Anchored = false
            p138:ApplyImpulse(v142)
        end
        for v144, v145 in u136 do
            v143(v145, v144 - 1, u136)
        end
    end)
end
function u29.spawnBossCube(p146, p147) --[[ Line: 548 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u15
    --]]
    p146.bossCube = u12.Assets.Misc.IceBlock:Clone()
    p146.bossCube:PivotTo(p147)
    p146.bossCube.Parent = u15
end
function u29.playCubeExplosionEffect(p148, p149) --[[ Line: 553 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u15
        [3] = u27
        [4] = u26
    --]]
    local v150 = u12.Assets.Effects.IceBreakEffect:Clone()
    v150.Position = p149
    v150.Transparency = 1
    v150.Parent = u15
    u27:playEffects({ v150 }, nil, {
        ["destroyAfterSec"] = 0.75
    })
    p148:playScreenShake(Vector3.new(0, 0, 0), Vector3.new(0, -25, 0), {
        ["magnitude"] = 2
    })
    p148:playSound(u26.WINTER_BOSS_ICE_BREAK, {
        ["volumeMultiplier"] = 12,
        ["position"] = p149
    })
end
function u29.startBossTrack(p151) --[[ Line: 577 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    p151.bossTrack = p151:playSound(u26.WINTER_BOSS_TRACK, {
        ["looped"] = true
    })
end
function u29.stopBossTrack(p152) --[[ Line: 582 ]]
    if p152.bossTrack then
        p152.bossTrack:Stop()
    end
end
function u29.setState(p153, p154) --[[ Line: 587 ]]
    local v155 = p153.bossState
    if v155 ~= 0 and (v155 == v155 and v155) then
        p153:onStateExit(p153.bossState)
    end
    p153.bossState = p154
    p153:onStateEnter(p153.bossState)
end
function u29.onStateEnter(p156, p157) --[[ Line: 596 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    if p157 == u24.FROZEN then
        p156:handleEnterFrozenState()
    end
    if p157 == u24.IDLE then
        p156:handleEnterIdleState()
    end
    if p157 == u24.SUMMON_ICICLES then
        p156:handleEnterSummonIciclesState()
    end
    if p157 == u24.MOVING then
        p156:handleEnterMovingState()
    end
    if p157 == u24.SPIN then
        p156:handleEnterSpinState()
    end
    if p157 == u24.DASH_ATTACK then
        p156:handleEnterDashAttackState()
    end
    if p157 == u24.SUMMON_SLAM then
        p156:handleEnterSummonSlamState()
    end
    if p157 == u24.DEAD then
        p156:handleEnterDeadState()
    end
    if p157 == u24.CHARGE then
        p156:handleEnterChargeState()
    end
    if p157 == u24.SUMMON_PENGUIN then
        p156:handleEnterSummonPenguinState()
    end
    if p157 ~= u24.SPIN then
        p156:clearSpinTarget()
    end
end
function u29.onStateExit(p158, p159) --[[ Line: 631 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    if p159 == u24.SPIN then
        p158:handleExitSpinState()
    end
    if p159 == u24.DASH_ATTACK then
        p158:handleExitDashAttackState()
    end
end
function u29.handleEnterFrozenState(p160) --[[ Line: 639 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    if not p160.bossModel then
        return nil
    end
    p160:playBossAnimation(u17.WINTER_BOSS_SPAWN, false)
    p160.bossAnimation:AdjustSpeed(0)
end
function u29.handleEnterIdleState(p161) --[[ Line: 647 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    if not p161.bossModel then
        return nil
    end
    p161:playBossAnimation(u17.WINTER_BOSS_IDLE, true)
end
function u29.handleEnterMovingState(p162) --[[ Line: 653 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    if not p162.bossModel then
        return nil
    end
    p162:playBossAnimation(u17.WINTER_BOSS_RUN, true)
end
function u29.handleEnterSpinState(p163) --[[ Line: 659 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    if not p163.bossModel then
        return nil
    end
    p163:playBossAnimation(u17.WINTER_BOSS_SPIN, true)
    p163:toggleSpinTrailEffect(true)
    p163:toggleSpinSoundEffect(true)
end
function u29.handleExitSpinState(p164) --[[ Line: 667 ]]
    p164:toggleSpinTrailEffect(false)
    p164:toggleSpinSoundEffect(false)
end
function u29.toggleSpinSoundEffect(p165, p166) --[[ Line: 671 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u26
    --]]
    if p165.bossModel then
        if p165.bossSpinSoundEffect then
            p165.bossSpinSoundEffect.Playing = p166
        else
            local v167 = p165.bossModel:WaitForChild("UpperTorso")
            if not v167 then
                return nil
            end
            p165.bossSpinSoundEffect = u9("Sound", {
                ["Looped"] = true,
                ["Volume"] = 1.5,
                ["RollOffMaxDistance"] = 150,
                ["SoundId"] = u26.WINTER_BOSS_SPIN_LOOP,
                ["Playing"] = p166,
                ["Parent"] = v167
            })
        end
    else
        return nil
    end
end
function u29.toggleSpinTrailEffect(p168, p169) --[[ Line: 696 ]]
    if not p168.bossModel then
        return nil
    end
    local v170 = p168.bossModel:FindFirstChild("ice_hammer")
    if v170 ~= nil then
        v170 = v170:FindFirstChild("Handle")
        if v170 ~= nil then
            v170 = v170:FindFirstChild("AxeInnerTrail")
        end
    end
    if not v170 then
        return nil
    end
    local v171 = p168.bossModel:FindFirstChild("ice_hammer")
    if v171 ~= nil then
        v171 = v171:FindFirstChild("Handle")
        if v171 ~= nil then
            v171 = v171:FindFirstChild("AxeOuterTrail")
        end
    end
    if not v171 then
        return nil
    end
    v170.Enabled = p169
    v171.Enabled = p169
end
function u29.handleEnterDashAttackState(p172) --[[ Line: 727 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u26
    --]]
    if not p172.bossModel then
        return nil
    end
    p172:playBossAnimation(u17.WINTER_BOSS_DASH_ATTACK, false)
    p172:toggleDashAttackTrailEffect(true)
    p172:playSound(u26.WINTER_BOSS_DASH_ATTACK, {
        ["rollOffMaxDistance"] = 500,
        ["volumeMultiplier"] = 15,
        ["position"] = p172.bossModel:GetPivot().Position
    })
end
function u29.handleExitDashAttackState(p173) --[[ Line: 742 ]]
    p173:toggleDashAttackTrailEffect(false)
end
function u29.toggleDashAttackTrailEffect(p174, p175) --[[ Line: 745 ]]
    if not p174.bossModel then
        return nil
    end
    local v176 = p174.bossModel:FindFirstChild("UpperTorso")
    if v176 ~= nil then
        v176 = v176:FindFirstChild("InnerTrail")
    end
    if not v176 then
        return nil
    end
    local v177 = p174.bossModel:FindFirstChild("UpperTorso")
    if v177 ~= nil then
        v177 = v177:FindFirstChild("OuterTrail")
    end
    if not v177 then
        return nil
    end
    v176.Enabled = p175
    v177.Enabled = p175
end
function u29.handleEnterSummonSlamState(u178) --[[ Line: 770 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    if not u178.bossModel then
        return nil
    end
    task.delay(1, function() --[[ Line: 775 ]]
        --[[
        Upvalues:
            [1] = u178
            [2] = u17
        --]]
        u178:playBossAnimation(u17.WINTER_BOSS_SLAM_AXE, false)
        task.delay(0.75, function() --[[ Line: 778 ]]
            --[[
            Upvalues:
                [1] = u178
            --]]
            u178.bossAnimation:AdjustSpeed(0)
            task.delay(0.3, function() --[[ Line: 780 ]]
                --[[
                Upvalues:
                    [1] = u178
                --]]
                u178.bossAnimation:AdjustSpeed(1)
                task.delay(0.35, function() --[[ Line: 782 ]]
                    --[[
                    Upvalues:
                        [1] = u178
                    --]]
                    u178.bossAnimation:AdjustSpeed(0)
                    u178:playSlamSummonEffect()
                end)
            end)
        end)
    end)
end
function u29.handleEnterSummonPenguinState(p179) --[[ Line: 790 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u6
        [3] = u5
        [4] = u26
    --]]
    if not p179.bossModel then
        return nil
    end
    p179:playBossAnimation(u17.WINTER_BOSS_RAISE_AXE, false)
    task.delay(0.5, function() --[[ Line: 795 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u5
            [3] = u26
        --]]
        local v180 = u6
        local v181 = u5.fromList
        local v182 = { u26.PENGUIN_ATTACK_1, u26.PENGUIN_ATTACK_2, u26.PENGUIN_ATTACK_3 }
        v180:playSound(v181(unpack(v182)))
    end)
end
function u29.pullToCenter(_, p183) --[[ Line: 799 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v184 = u11.LocalPlayer.Character
    if v184 ~= nil then
        v184 = v184.PrimaryPart
    end
    if not v184 then
        return nil
    end
    v184:ApplyImpulse(p183)
end
function u29.playSlamSummonEffect(u185) --[[ Line: 811 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u15
        [3] = u27
        [4] = u26
    --]]
    if not u185.bossAssets then
        return nil
    end
    local v186 = u185:getGroundNormalizedPosition(u185.bossAssets.Platforms.BossFight.PlatformCenter.Position)
    local v187 = u12.Assets.Effects.BossSwirl:Clone()
    v187.Position = v186
    v187.Parent = u15
    u27:playEffects({ v187 }, nil, {
        ["destroyAfterSec"] = 4,
        ["sizeMultiplier"] = 1.5
    })
    u185:playScreenShake(Vector3.new(0, 0, 0), Vector3.new(0, -50, 0), {
        ["duration"] = 0.3,
        ["cycles"] = 8,
        ["magnitude"] = 4
    })
    u185:playSound(u26.WINTER_BOSS_AXE_SLAM, {
        ["position"] = nil,
        ["volumeMultiplier"] = 5
    })
    if not u185.propsDestroyed then
        task.delay(3, function() --[[ Line: 847 ]]
            --[[
            Upvalues:
                [1] = u185
                [2] = u26
            --]]
            u185:playSound(u26.WINTER_BOSS_DEBRIS_FALL, {
                ["position"] = nil,
                ["volumeMultiplier"] = 5
            })
        end)
        u185.propsDestroyed = true
    end
end
function u29.handleEnterSummonIciclesState(p188) --[[ Line: 857 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    if not p188.bossModel then
        return nil
    end
    p188:playBossAnimation(u17.WINTER_BOSS_RAISE_AXE, false)
end
function u29.handleAxeThrowAction(u189, u190) --[[ Line: 863 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u12
        [3] = u15
        [4] = u14
        [5] = u6
        [6] = u26
    --]]
    u189:createIndicator(u190.position, 1)
    local u191 = u189.bossModel
    if u191 ~= nil then
        u191 = u191:GetPivot().Position
    end
    if not u191 then
        return nil
    end
    local v192 = CFrame.new(u191, u190.position)
    local v193 = u189.bossModel
    if v193 ~= nil then
        v193:PivotTo(v192)
    end
    u189:playBossAnimation(u17.WINTER_BOSS_THROW, false, 0.5)
    local u194 = u189.bossModel
    if u194 ~= nil then
        u194 = u194:WaitForChild("ice_hammer", 3)
        if u194 ~= nil then
            u194 = u194:WaitForChild("Handle", 3)
        end
    end
    local u195 = u12.Assets.Effects.IceHammer:Clone()
    local u196 = nil
    local v197 = u189.bossAnimation
    if v197 ~= nil then
        v197 = v197:GetMarkerReachedSignal("throw"):Connect(function() --[[ Line: 892 ]]
            --[[
            Upvalues:
                [1] = u196
                [2] = u189
                [3] = u191
                [4] = u194
                [5] = u195
                [6] = u15
                [7] = u14
                [8] = u190
                [9] = u6
                [10] = u26
            --]]
            local v198 = u196
            if v198 ~= nil then
                v198:Disconnect()
            end
            local v199 = u189.bossModel
            if v199 ~= nil then
                v199 = v199:GetPivot().Position
            end
            u191 = v199
            if u194 and (u195 and u191) then
                u194.Archivable = true
                u195.Anchored = true
                u195.Parent = u15
                u195:PivotTo(u194:GetPivot())
                u189.axeClone = u195
                u189:hideAxe()
                local v200 = u14:Create(u195, TweenInfo.new(0.2), {
                    ["CFrame"] = CFrame.new(u190.position, u191) * CFrame.Angles(3.141592653589793, -1.5707963267948966, 0.7853981633974483)
                })
                v200:Play()
                v200.Completed:Connect(function() --[[ Line: 918 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u26
                        [3] = u190
                    --]]
                    u6:playSound(u26.JUGGERNAUT_GROUND_SMASH, {
                        ["rollOffMaxDistance"] = 220,
                        ["position"] = u190.position
                    })
                end)
            end
        end)
    end
end
function u29.handleEnterChargeState(u201) --[[ Line: 929 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u3
        [3] = u18
    --]]
    u201:playBossAnimation(u17.WINTER_BOSS_RUN, true)
    local v202 = u201.bossModel
    if v202 ~= nil then
        v202 = v202:FindFirstChild("Humanoid")
        if v202 ~= nil then
            v202 = v202:FindFirstChild("Animator")
        end
    end
    if v202 then
        local u203 = u3:playAnimation(v202, u18:getAssetId(u17.CHARGE_SHIELD_CHARGE), {
            ["looped"] = true
        })
        task.delay(0.5, function() --[[ Line: 943 ]]
            --[[
            Upvalues:
                [1] = u203
            --]]
            local v204 = u203
            if v204 ~= nil then
                v204:Stop()
            end
            local v205 = u203
            if v205 ~= nil then
                v205:Destroy()
            end
        end)
    end
    task.delay(0.5, function() --[[ Line: 954 ]]
        --[[
        Upvalues:
            [1] = u201
            [2] = u17
        --]]
        local v206 = u201.bossAnimation
        if v206 ~= nil then
            v206:Stop()
        end
        u201:playBossAnimation(u17.WINTER_BOSS_IDLE, true)
        local v207 = u201.axeClone
        if v207 ~= nil then
            v207:Destroy()
        end
        u201.axeClone = nil
        u201:showAxe()
    end)
end
function u29.handleEnterAxeSpinState(u208, p209) --[[ Line: 968 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u18
        [3] = u17
    --]]
    local u210 = u208.bossModel
    if u210 ~= nil then
        u210 = u210:FindFirstChild("Humanoid")
        if u210 ~= nil then
            u210 = u210:FindFirstChild("Animator")
        end
    end
    local v211 = u208.bossModel
    if v211 ~= nil then
        v211 = v211.PrimaryPart
        if v211 ~= nil then
            v211 = v211.Position
        end
    end
    if not (u210 and v211) then
        return nil
    end
    local v212 = u208.bossModel
    if v212 ~= nil then
        v212:PivotTo(CFrame.new(v211, p209))
    end
    local u213 = u3:playAnimation(u210, u18:getAssetId(u17.WINTER_BOSS_SPIN_AXE), {
        ["looped"] = false
    })
    if u213 then
        u213:GetMarkerReachedSignal("hold"):Connect(function() --[[ Line: 996 ]]
            --[[
            Upvalues:
                [1] = u213
            --]]
            u213:AdjustSpeed(0)
        end)
    end
    task.delay(0.5, function() --[[ Line: 1000 ]]
        --[[
        Upvalues:
            [1] = u208
        --]]
        u208:hideAxe()
    end)
    task.delay(3.5, function() --[[ Line: 1003 ]]
        --[[
        Upvalues:
            [1] = u213
            [2] = u3
            [3] = u210
            [4] = u18
            [5] = u17
        --]]
        local v214 = u213
        if v214 ~= nil then
            v214:Stop()
        end
        local v215 = u213
        if v215 ~= nil then
            v215:Destroy()
        end
        u3:playAnimation(u210, u18:getAssetId(u17.HARPOON_RETURN), {
            ["looped"] = false
        })
    end)
end
function u29.handleEnterDeadState(u216) --[[ Line: 1017 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    if not u216.bossModel then
        return nil
    end
    local v217 = u216.bossModel.PrimaryPart
    if v217 then
        v217.CanCollide = false
    end
    if u216.bossAnimation then
        u216.bossAnimation:Stop()
    end
    if u216.activeMovementTween and u216.activeMovementTween.PlaybackState == Enum.PlaybackState.Playing then
        u216.activeMovementTween:Pause()
        u216.activeMovementTween:Destroy()
    end
    u216:toggleSpinSoundEffect(false)
    u216:stopBossTrack()
    u216:playScreenShake(Vector3.new(0, 0, 0), Vector3.new(0, -30, 0), {
        ["magnitude"] = 3.5
    })
    u216:playBossAnimation(u17.WINTER_BOSS_DEATH, false)
    task.delay(2.75, function() --[[ Line: 1046 ]]
        --[[
        Upvalues:
            [1] = u216
        --]]
        u216:playScreenShake(Vector3.new(0, 0, 0), Vector3.new(0, -30, 0), {
            ["magnitude"] = 3.5
        })
        u216.bossAnimation:AdjustSpeed(0)
    end)
end
function u29.playBossAnimation(p218, p219, p220, p221) --[[ Line: 1054 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u18
    --]]
    if p220 == nil then
        p220 = false
    end
    local v222 = p221 == nil and 1 or p221
    if not p218.bossModel then
        return nil
    end
    local v223 = p218.bossModel:FindFirstChild("Humanoid")
    if v223 ~= nil then
        v223 = v223:FindFirstChild("Animator")
    end
    if not v223 then
        return nil
    end
    if p218.bossAnimation and p218.bossAnimation.IsPlaying then
        p218.bossAnimation:Stop()
    end
    p218.bossAnimation = u3:playAnimation(v223, u18:getAssetId(p219), {
        ["looped"] = p220
    })
    local v224 = p218.bossAnimation
    if v224 ~= nil then
        v224:AdjustSpeed(v222)
    end
end
function u29.getAlivePlayerEntities(_) --[[ Line: 1083 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u1
        [3] = u19
    --]]
    local v225 = {}
    for v226, v227 in u20:getAliveEntityInstances() do
        local _ = v226 - 1
        local v228 = u20:getEntity(v227)
        if u1.instanceof(v228, u19) then
            table.insert(v225, v228)
        end
    end
    return v225
end
function u29.playScreenShake(_, p229, p230, p231) --[[ Line: 1097 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.Controllers.ScreenShakeController:shake(p229, p230, p231)
end
function u29.playSound(_, p232, p233) --[[ Line: 1100 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    return u6:playModifiableSound(p232, p233)
end
function u29.getGroundNormalizedPosition(_, p234) --[[ Line: 1103 ]]
    local v235 = p234.X
    local v236 = p234.Z
    return Vector3.new(v235, 786, v236)
end
function u29.listenForBossSpinRequest(u237) --[[ Line: 1106 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.Client:Get("WinterEventBossSpin"):Connect(function(p238) --[[ Line: 1107 ]]
        --[[
        Upvalues:
            [1] = u237
        --]]
        u237:markSpinTarget(p238.target)
    end)
end
function u29.markSpinTarget(p239, p240) --[[ Line: 1111 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u9
        [3] = u4
    --]]
    if p240 == u11.LocalPlayer then
        return nil
    end
    p239:clearSpinTarget()
    local v241 = p240.Character
    if v241 ~= nil then
        v241 = v241.PrimaryPart
    end
    if not v241 then
        return nil
    end
    local v242 = u9
    local v243 = {
        ["ResetOnSpawn"] = false,
        ["AlwaysOnTop"] = true,
        ["Parent"] = v241,
        ["Size"] = UDim2.fromScale(3, 3),
        ["Children"] = { u9("ImageLabel", {
                ["ImageTransparency"] = 0.25,
                ["BackgroundTransparency"] = 1,
                ["Image"] = "rbxassetid://16830265561",
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.new(1.5, 0, 1.5, 0),
                ["ImageColor3"] = u4.WHITE
            }) }
    }
    p239.spinTargetMark = v242("BillboardGui", v243)
end
function u29.clearSpinTarget(p244) --[[ Line: 1140 ]]
    local v245 = p244.spinTargetMark
    if v245 ~= nil then
        v245:Destroy()
    end
    p244.spinTargetMark = nil
end
function u29.createIndicator(p246, p247, p248) --[[ Line: 1147 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u15
        [3] = u14
    --]]
    local v249 = p248 == nil and 2.25 or p248
    if not p246.bossAssets then
        return nil
    end
    local v250 = u9
    local v251 = {
        ["Name"] = "GroundIndicator",
        ["Size"] = Vector3.new(0.1, 1, 1),
        ["Transparency"] = 0.3,
        ["CastShadow"] = false,
        ["Orientation"] = Vector3.new(0, 0, 90),
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanTouch"] = false,
        ["CanQuery"] = false
    }
    local v252 = p247.X
    local v253 = p246.bossAssets.Platforms.BossFight.PlatformCenter.Position.Y - 0.2
    local v254 = p247.Z
    v251.Position = Vector3.new(v252, v253, v254)
    v251.Color = Color3.fromRGB(255, 0, 0)
    v251.Shape = Enum.PartType.Cylinder
    v251.Parent = u15
    u14:Create(v250("Part", v251), TweenInfo.new(v249, Enum.EasingStyle.Sine), {
        ["Size"] = Vector3.new(0.1, 30, 30),
        ["Transparency"] = 1
    }):Play()
end
function u29.hideAxe(p255) --[[ Line: 1186 ]]
    local v256 = p255.bossModel
    if v256 ~= nil then
        v256 = v256:WaitForChild("ice_hammer", 3)
        if v256 ~= nil then
            v256 = v256:WaitForChild("Handle", 3)
        end
    end
    if v256 then
        v256.Transparency = 1
        for v257, v258 in v256:GetDescendants() do
            local _ = v257 - 1
            if v258:IsA("MeshPart") then
                v258.Transparency = 1
            end
        end
    end
end
function u29.showAxe(p259) --[[ Line: 1208 ]]
    local v260 = p259.bossModel
    if v260 ~= nil then
        v260 = v260:WaitForChild("ice_hammer", 3)
        if v260 ~= nil then
            v260 = v260:WaitForChild("Handle", 3)
        end
    end
    if v260 then
        v260.Transparency = 0
        for v261, v262 in v260:GetDescendants() do
            local _ = v261 - 1
            if v262:IsA("MeshPart") then
                v262.Transparency = 0
            end
        end
    end
end
u8.CreateController(u29.new())
return nil