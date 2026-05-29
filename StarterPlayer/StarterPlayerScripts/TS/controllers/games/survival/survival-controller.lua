local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.RandomUtil
local u6 = v4.SoundManager
local u7 = v4.WatchCollectionTag
local u8 = v4.WatchPlayer
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u11 = v10.InOutQuad
local u12 = v10.Linear
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u17 = v16.CollectionService
local u18 = v16.Players
local u19 = v16.ReplicatedStorage
local u20 = v16.RunService
local u21 = v16.SoundService
local u22 = v16.Workspace
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u24 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u25 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u26 = v1.import(script, script.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard
local u27 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local v32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta")
local u33 = v32.getQueueMeta
local u34 = v32.QueueMeta
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u38 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "survival-constants").SurvivalConstants
local u39 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "survival-monster-definitions").SurvivalMonsterDefinitions
local u40 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "survival-util").SurvivalUtil
local u41 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "survival-wave-definitions").SurvivalWaveDefinitions
local u42 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u43 = v1.import(script, script.Parent, "ended", "survival-ended-modal").SurvivalEndedModal
local u44 = v1.import(script, script.Parent, "ui", "bar", "survival-ui").SurvivalUi
local u45 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 50 ]]
        return "SurvivalController"
    end,
    ["__index"] = u25
})
u45.__index = u45
function u45.new(...) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u45
    --]]
    local v46 = u45
    local v47 = setmetatable({}, v46)
    return v47:constructor(...) or v47
end
function u45.constructor(p48) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u31
        [3] = u38
        [4] = u6
        [5] = u37
    --]]
    u25.constructor(p48, { u31.SURVIVAL })
    p48.Name = "SurvivalController"
    p48.blockConnections = {}
    p48.health = u38.BASE_BED_HEALTH
    p48.maxHealth = u38.BASE_BED_HEALTH
    p48.wave = 0
    p48.state = 1
    p48.endTime = time() + 30
    p48.lastBedTookDamage = (1 / 0)
    p48.bedAlarmTrack = u6:createSound(u37.BED_ALARM)
    p48.waveTrack = u6:createSound(u37.PENGUIN_SURVIVAL_WAVE_TRACK)
    p48.bossTrack = u6:createSound(u37.PENGUIN_SURVIVAL_BOSS_TRACK)
    p48.intermissionTrack = u6:createSound(u37.PENGUIN_SURVIVAL_INTERMISSION_TRACK)
    p48.bedHealthHooked = false
    p48.count = 0
    p48.finishedClientSetup = false
end
function u45.onGameInit(u49) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u21
        [3] = u9
        [4] = u34
        [5] = u31
        [6] = u27
        [7] = u37
        [8] = u20
        [9] = u40
        [10] = u3
        [11] = u15
        [12] = u44
        [13] = u36
        [14] = u6
        [15] = u41
        [16] = u2
        [17] = u43
        [18] = u17
        [19] = u14
        [20] = u23
        [21] = u11
        [22] = u24
        [23] = u30
        [24] = u22
        [25] = u39
        [26] = u42
        [27] = u13
        [28] = u28
        [29] = u5
        [30] = u29
        [31] = u8
        [32] = u18
        [33] = u35
    --]]
    task.spawn(function() --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u49
            [2] = u19
        --]]
        u49.penguinFolder = u19.Assets.Misc:WaitForChild("PenguinModels")
    end)
    if u49.bedAlarmTrack then
        u49.bedAlarmTrack.Parent = u21
        u49.bedAlarmTrack.Looped = false
    end
    if u49.waveTrack then
        u49.waveTrack.Parent = u21
        u49.waveTrack.Looped = true
        u49.waveTrack.SoundGroup = u9.Controllers.BackgroundMusicController.backgroundMusicGroup
    end
    if u49.intermissionTrack then
        u49.intermissionTrack.Parent = u21
        u49.intermissionTrack.Looped = false
        u49.intermissionTrack.SoundGroup = u9.Controllers.BackgroundMusicController.backgroundMusicGroup
    end
    if u49.bossTrack then
        u49.bossTrack.Parent = u21
        u49.bossTrack.Looped = true
        u49.bossTrack.SoundGroup = u9.Controllers.BackgroundMusicController.backgroundMusicGroup
    end
    u9.Controllers.MatchController:getQueueTypeAsync():andThen(function(p50) --[[ Line: 104 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u31
            [3] = u27
            [4] = u49
            [5] = u9
            [6] = u37
        --]]
        if u34[p50].game ~= u31.SURVIVAL then
            return nil
        end
        u27.changed:connect(function(p51, p52) --[[ Line: 109 ]]
            --[[
            Upvalues:
                [1] = u49
            --]]
            if p51.Settings.backgroundMusicVolumeGame ~= p52.Settings.backgroundMusicVolumeGame then
                local v53 = p51.Settings.backgroundMusicVolumeGame
                if u49.intermissionTrack and u49.waveTrack then
                    u49.intermissionTrack.Volume = v53
                    u49.waveTrack.Volume = v53
                end
            end
        end)
        u9.Controllers.PreloadController:runPreload({
            ["sounds"] = {
                u37.PENGUIN_SURVIVAL_INTERMISSION_TRACK,
                u37.PENGUIN_SURVIVAL_WAVE_TRACK,
                u37.PENGUIN_SURVIVAL_BOSS_TRACK,
                u37.PENGUIN_SURVIVAL_VICTORY_TRACK,
                u37.CLASSIC_ROBLOX_VICTORY_SOUND
            }
        })
    end)
    u20.Heartbeat:Connect(function() --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u49
            [2] = u40
            [3] = u3
            [4] = u15
            [5] = u44
        --]]
        if time() - u49.lastBedTookDamage < 3 and (time() - u49.lastBedTookDamage > 0 and (u49.bedAlarmTrack and not u49.bedAlarmTrack.IsPlaying)) then
            u49.bedAlarmTrack:Play()
        end
        if not u49.bedHealthHooked then
            local v54 = u40.getBed()
            local v55 = v54 and u3:getStore():getBlockData(u3:getBlockPosition(v54.Position))
            if v55 then
                u49.bedHealthHooked = true
                u49:hookBedHealth(v55)
            end
        end
        if u49.tree then
            u49.tree = u15.update(u49.tree, u15.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false,
                ["IgnoreGuiInset"] = false
            }, { u15.createElement(u44, {
                    ["health"] = u49.health,
                    ["maxHealth"] = u49.maxHealth,
                    ["waveCount"] = u49.wave,
                    ["state"] = u49.state,
                    ["endTime"] = u49.endTime
                }) }))
        end
    end)
    u36.Client:Get("SurvivalStateChange"):Connect(function(p56) --[[ Line: 155 ]]
        --[[
        Upvalues:
            [1] = u49
            [2] = u6
            [3] = u37
            [4] = u41
            [5] = u2
            [6] = u43
            [7] = u17
            [8] = u14
            [9] = u23
            [10] = u11
        --]]
        if p56.wave ~= u49.wave then
            u6:playSound(u37.WAVE_UPDATE)
        end
        u49.wave = p56.wave
        u49.state = p56.state
        u49.endTime = p56.endTime
        local v57 = p56.wave
        local v58 = 0
        for _ in u41 do
            v58 = v58 + 1
        end
        local v59 = v57 == v58
        if v59 then
            v59 = p56.state == 0
        end
        if v59 then
            local v60 = u49.waveTrack
            if v60 ~= nil then
                v60:Stop()
            end
            local v61 = u49.bossTrack
            if v61 ~= nil then
                v61:Stop()
            end
            local v62 = u49.intermissionTrack
            if v62 ~= nil then
                v62:Stop()
            end
            u6:playSound(u37.CLASSIC_ROBLOX_VICTORY_SOUND)
            u6:playSound(u37.PENGUIN_SURVIVAL_VICTORY_TRACK)
            local v63 = {
                ["appId"] = "SurvivalEndedModal",
                ["app"] = u43
            }
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v63, {})
            return nil
        elseif u49.state == 2 then
            for _, v64 in u17:GetTagged("Monster") do
                if not v64:FindFirstChildOfClass("Highlight") then
                    u14("Highlight", {
                        ["FillTransparency"] = 0.6,
                        ["OutlineTransparency"] = 0.2,
                        ["DepthMode"] = Enum.HighlightDepthMode.AlwaysOnTop,
                        ["Adornee"] = v64,
                        ["FillColor"] = Color3.fromRGB(255, 217, 0),
                        ["OutlineColor"] = Color3.fromRGB(255, 255, 255),
                        ["Parent"] = v64
                    })
                end
            end
            return
        elseif u49.state == 0 then
            task.spawn(function() --[[ Line: 209 ]]
                --[[
                Upvalues:
                    [1] = u49
                    [2] = u23
                    [3] = u11
                --]]
                local v65 = u49.intermissionTrack
                if v65 ~= nil then
                    v65:Play()
                end
                u23(1, u11, function(p66) --[[ Line: 214 ]]
                    --[[
                    Upvalues:
                        [1] = u49
                    --]]
                    if u49.intermissionTrack then
                        u49.intermissionTrack.Volume = 1 - p66
                    end
                    if u49.waveTrack then
                        u49.waveTrack.Volume = p66
                    end
                end, 1, 0):Wait()
                local v67 = u49.waveTrack
                if v67 ~= nil then
                    v67:Stop()
                end
            end)
        elseif u49.state == 1 then
            local v68 = 0
            for _ in u41 do
                v68 = v68 + 1
            end
            local u69
            if v68 <= u49.wave and u49.wave % v68 == 0 then
                u69 = u49.bossTrack
            else
                u69 = u49.waveTrack
            end
            task.spawn(function() --[[ Line: 236 ]]
                --[[
                Upvalues:
                    [1] = u69
                    [2] = u23
                    [3] = u11
                    [4] = u49
                --]]
                local v70 = u69
                if v70 ~= nil then
                    v70:Play()
                end
                u23(1, u11, function(p71) --[[ Line: 241 ]]
                    --[[
                    Upvalues:
                        [1] = u49
                        [2] = u69
                    --]]
                    if u49.intermissionTrack then
                        u49.intermissionTrack.Volume = p71
                    end
                    if u69 then
                        u69.Volume = 1 - p71
                    end
                end, 1, 0):Wait()
                local v72 = u49.intermissionTrack
                if v72 ~= nil then
                    v72:Stop()
                end
            end)
        end
    end)
    u24.ExplosionEffect:connect(function(p73) --[[ Line: 256 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u19
            [3] = u22
            [4] = u6
            [5] = u37
        --]]
        if p73.explosionType == u30.BOMBER_PENGUIN_EXPLOSION or p73.explosionType == u30.ULTRA_BOMBER_PENGUIN_EXPLOSION then
            local u74 = u19.Assets.Effects.GuidedMissileExplosion:Clone()
            u74.Position = p73.position
            u74.Parent = u22
            u74.Debris1:Emit(5)
            u74.Debris2:Emit(5)
            u74.ExplosionFlames:Emit(50)
            u6:playSound(u37.GUIDED_MISSILE_EXPLOSION, {
                ["rollOffMaxDistance"] = 160,
                ["position"] = p73.position
            })
            task.delay(5, function() --[[ Line: 268 ]]
                --[[
                Upvalues:
                    [1] = u74
                --]]
                u74:Destroy()
            end)
        end
    end)
    u17:GetInstanceAddedSignal("SurvivalPenguin"):Connect(function(u75) --[[ Line: 273 ]]
        --[[
        Upvalues:
            [1] = u49
            [2] = u39
            [3] = u42
            [4] = u13
            [5] = u28
            [6] = u20
            [7] = u6
            [8] = u5
            [9] = u37
            [10] = u29
        --]]
        if u49.penguinFolder == nil then
            return nil
        end
        u75:GetPropertyChangedSignal("PrimaryPart"):Wait()
        local v76 = u75:GetAttribute("MonsterType")
        u49:createEntityHealthbar(u75, Color3.fromRGB(255, 0, 0))
        local u77 = u39[v76]
        if u77 == nil then
            return nil
        end
        local v78 = u49.penguinFolder:WaitForChild(u77.modelName, 3)
        if v78 ~= nil then
            v78 = v78:Clone()
        end
        if not v78 then
            return nil
        end
        local v79 = v78:FindFirstChildOfClass("Humanoid")
        if v79 ~= nil then
            v79:Destroy()
        end
        v78:SetPrimaryPartCFrame(u75:GetPrimaryPartCFrame())
        for _, v80 in v78:GetChildren() do
            if v80:IsA("BasePart") then
                v80.CanCollide = false
                v80.Massless = true
            end
        end
        v78.Parent = u75
        u42:weldPartsWithJoint(u75.PrimaryPart, v78.PrimaryPart, "Motor6D")
        v78.PrimaryPart.Name = "Main"
        for _, v81 in v78:GetChildren() do
            v81.Parent = u75
        end
        v78:Destroy()
        local u82 = u75:WaitForChild("Humanoid")
        local v83 = u82:WaitForChild("Animator")
        local u84 = u13.new()
        local u85 = v83:LoadAnimation(u28:getAnimation(u77.animations.walk))
        u85.Looped = true
        u85.Priority = Enum.AnimationPriority.Movement
        u84:GiveTask(u85)
        local u86 = v83:LoadAnimation(u28:getAnimation(u77.animations.idle))
        u86.Looped = true
        u86.Priority = Enum.AnimationPriority.Idle
        u84:GiveTask(u86)
        local u87 = v83:LoadAnimation(u28:getAnimation(u77.animations.jump))
        u87.Looped = false
        u87.Priority = Enum.AnimationPriority.Action
        u84:GiveTask(u87)
        u84:GiveTask(u20.Heartbeat:Connect(function() --[[ Line: 327 ]]
            --[[
            Upvalues:
                [1] = u82
                [2] = u75
                [3] = u85
                [4] = u86
                [5] = u87
            --]]
            if u82:GetState() == Enum.HumanoidStateType.Running then
                if u75.PrimaryPart.AssemblyLinearVelocity.Magnitude > 10 then
                    u85:AdjustSpeed(u82.WalkSpeed / 16)
                    if not u85.IsPlaying then
                        u85:Play()
                        return
                    end
                else
                    u85:Stop()
                    if not u86.IsPlaying then
                        u86:Play()
                        return
                    end
                end
            elseif (u82:GetState() == Enum.HumanoidStateType.Jumping or u82:GetState() == Enum.HumanoidStateType.Freefall) and not u87.IsPlaying then
                u85:Stop()
                u86:Stop()
                u87:Play()
            end
        end))
        local u88 = time() + math.random(1, 10)
        local u89
        if u77 == nil then
            u89 = u77
        else
            u89 = u77.sounds
            if u89 ~= nil then
                u89 = u89.passive
            end
        end
        u84:GiveTask(u20.Heartbeat:Connect(function() --[[ Line: 356 ]]
            --[[
            Upvalues:
                [1] = u88
                [2] = u6
                [3] = u89
                [4] = u5
                [5] = u37
                [6] = u75
            --]]
            if u88 < time() then
                local v90 = u6
                local v91
                if u89 then
                    local v92 = u5.fromList
                    local v93 = u89.sounds
                    v91 = v92(unpack(v93))
                else
                    v91 = u37.PENGUIN_SQUAWK_1
                end
                v90:playSound(v91, {
                    ["position"] = u75:GetPrimaryPartCFrame().Position
                })
                local v94 = time()
                local v95
                if u89 then
                    v95 = math.random(u89.minInterval, u89.maxInterval)
                else
                    v95 = math.random(1, 150)
                end
                u88 = v94 + v95
            end
        end))
        u84:GiveTask(v83.AnimationPlayed:Connect(function(p96) --[[ Line: 365 ]]
            --[[
            Upvalues:
                [1] = u77
                [2] = u28
                [3] = u75
                [4] = u6
                [5] = u5
                [6] = u37
            --]]
            local v97 = u77.animations.attack
            if v97 ~= 0 and (v97 == v97 and v97) then
                local v98 = p96.Animation
                if v98 ~= nil then
                    v98 = v98.AnimationId
                end
                v97 = v98 == u28:getAssetId(u77.animations.attack)
                if v97 then
                    v97 = u75.PrimaryPart
                end
            end
            if v97 ~= 0 and (v97 == v97 and v97) then
                u6:playSound(u5.fromList(u37.PENGUIN_ATTACK_1, u37.PENGUIN_ATTACK_2, u37.PENGUIN_ATTACK_3), {
                    ["position"] = u75:GetPrimaryPartCFrame().Position
                })
                local v99 = u77
                if v99 ~= nil then
                    v99 = v99.sounds
                    if v99 ~= nil then
                        v99 = v99.attack
                    end
                end
                if v99 then
                    u6:playSound(u5.fromList(unpack(v99)), {
                        ["position"] = u75:GetPrimaryPartCFrame().Position
                    })
                end
            end
        end))
        local u100 = 100
        u84:GiveTask(u75:GetAttributeChangedSignal("Health"):Connect(function() --[[ Line: 397 ]]
            --[[
            Upvalues:
                [1] = u75
                [2] = u100
                [3] = u6
                [4] = u5
                [5] = u37
                [6] = u75
            --]]
            local v101 = u75:GetAttribute("Health")
            if v101 ~= 0 and (v101 == v101 and v101) then
                if v101 < u100 then
                    u6:playSound(u5.fromList(u37.PENGUIN_DAMAGED_5, u37.PENGUIN_DAMAGED_6, u37.PENGUIN_DAMAGED_7), {
                        ["position"] = u75:GetPrimaryPartCFrame().Position
                    })
                end
                u100 = v101
            end
        end))
        local v102 = u29:getEntity(u75)
        local v103 = v102 and v102:getHumanoid()
        if v103 then
            v103.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
        end
        u84:GiveTask(function() --[[ Line: 437 ]]
            --[[
            Upvalues:
                [1] = u75
                [2] = u6
                [3] = u5
                [4] = u37
            --]]
            if u75.PrimaryPart then
                u6:playSound(u5.fromList(u37.PENGUIN_DAMAGED_5, u37.PENGUIN_DAMAGED_6, u37.PENGUIN_DAMAGED_7), {
                    ["position"] = u75:GetPrimaryPartCFrame().Position
                })
            end
        end)
        u84:GiveTask(u75.AncestryChanged:Connect(function() --[[ Line: 444 ]]
            --[[
            Upvalues:
                [1] = u75
                [2] = u84
            --]]
            if not u75:IsDescendantOf(game) then
                u84:DoCleaning()
            end
        end))
    end)
    u8(function(p104, _) --[[ Line: 450 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u9
            [3] = u35
            [4] = u49
        --]]
        if p104 ~= u18.LocalPlayer then
            return nil
        end
        if u9.Controllers.MatchController:getMatchState() ~= u35.RUNNING then
            return nil
        end
        u49:setupClient()
    end)
    u36.Client:WaitFor("MatchStateEvent"):expect():Connect(function(p105, _, _) --[[ Line: 459 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u49
        --]]
        if p105 ~= u35.RUNNING then
            return nil
        end
        u49:setupClient()
    end)
end
function u45.hookBedHealth(u106, u107) --[[ Line: 466 ]]
    --[[
    Upvalues:
        [1] = u40
        [2] = u38
    --]]
    u107:GetAttributeChangedSignal("Health"):Connect(function() --[[ Line: 480 ]]
        --[[
        Upvalues:
            [1] = u107
            [2] = u40
            [3] = u38
            [4] = u106
        --]]
        local v108 = u107:GetAttribute("Health")
        local v109 = u40.getBed():GetAttribute("MaxHealth")
        if v109 == nil then
            v109 = u38.BASE_BED_HEALTH
        end
        if v108 < u106.health then
            u106.lastBedTookDamage = time()
        end
        u106.health = v108
        u106.maxHealth = v109
    end)
    local v110 = u107:GetAttribute("Health")
    local v111 = u40.getBed():GetAttribute("MaxHealth")
    if v111 == nil then
        v111 = u38.BASE_BED_HEALTH
    end
    if v110 < u106.health then
        u106.lastBedTookDamage = time()
    end
    u106.health = v110
    u106.maxHealth = v111
end
function u45.createEntityHealthbar(p112, p113, p114) --[[ Line: 485 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u26
    --]]
    local v115 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
    local v116 = {
        ["app"] = u26
    }
    local v117 = p112.count
    p112.count = p112.count + 1
    v116.appId = "StatefulEntityHpBarBillboard_Penguin" .. tostring(v117)
    v115:openApp(v116, {
        ["hpBarOffset"] = Vector3.new(0, 2, 0),
        ["maxDistance"] = 100,
        ["gameEntity"] = p113,
        ["serverInstance"] = p113,
        ["barColor"] = p114
    }, nil, p113)
end
function u45.setupClient(u118) --[[ Line: 503 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u9
        [3] = u33
        [4] = u7
        [5] = u12
        [6] = u17
        [7] = u15
        [8] = u44
        [9] = u38
        [10] = u18
        [11] = u40
        [12] = u6
        [13] = u37
    --]]
    if u118.finishedClientSetup then
        return nil
    end
    u118.finishedClientSetup = true
    local v119 = u29:getLocalPlayerEntity()
    if v119 ~= nil then
        v119 = v119:getHumanoid()
    end
    if v119 then
        v119.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOn
        v119.NameDisplayDistance = 100
        v119.HealthDisplayDistance = 100
        v119.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
    end
    local v120 = u9.Controllers.MatchController:getQueueType()
    if v120 and u33(v120).classicTexture then
        u7("block", function(u121) --[[ Line: 522 ]]
            --[[
            Upvalues:
                [1] = u118
                [2] = u12
            --]]
            if u121:GetAttribute("PlacedByUserId") ~= 0 then
                local u122 = nil
                u118.blockConnections[u121] = u121:GetAttributeChangedSignal("Health"):Connect(function() --[[ Line: 527 ]]
                    --[[
                    Upvalues:
                        [1] = u121
                        [2] = u122
                        [3] = u12
                    --]]
                    local v123 = u121:GetAttribute("MaxHealth")
                    local v124 = u121:GetAttribute("Health")
                    if u122 == nil then
                        local v125 = 0
                        local v126 = {}
                        for v127, v128 in u121:GetChildren() do
                            local _ = v127 - 1
                            if v128:IsA("Texture") == true then
                                v125 = v125 + 1
                                v126[v125] = v128
                            end
                        end
                        u122 = v126
                    end
                    for _, v129 in u122 do
                        v129.Color3 = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(0, 0, 0), u12(v123 - v124, 0, 1, v123))
                    end
                end)
            end
        end)
        u17:GetInstanceRemovedSignal("block"):Connect(function(p130) --[[ Line: 554 ]]
            --[[
            Upvalues:
                [1] = u118
            --]]
            if u118.blockConnections[p130] then
                u118.blockConnections[p130] = nil
            end
        end)
    end
    local function u131(_) --[[ Line: 564 ]]
        --[[
        Upvalues:
            [1] = u118
            [2] = u15
            [3] = u44
            [4] = u38
            [5] = u18
        --]]
        u118.tree = u15.mount(u15.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u15.createElement(u44, {
                ["health"] = u38.BASE_BED_HEALTH,
                ["maxHealth"] = u38.BASE_BED_HEALTH,
                ["waveCount"] = u118.wave,
                ["endTime"] = u118.endTime,
                ["state"] = u118.state
            }) }), u18.LocalPlayer:FindFirstChildOfClass("PlayerGui"))
    end
    local v132 = u40.getBed()
    if v132 then
        u131(v132)
    else
        u17:GetInstanceAddedSignal("bed:1"):Connect(function(p133) --[[ Line: 581 ]]
            --[[
            Upvalues:
                [1] = u131
            --]]
            u131(p133)
        end)
    end
    u17:GetInstanceRemovedSignal("bed:1"):Connect(function(p134) --[[ Line: 585 ]]
        --[[
        Upvalues:
            [1] = u118
            [2] = u6
            [3] = u37
        --]]
        local v135 = p134:GetAttribute("MaxHealth")
        u118.health = 0
        u118.maxHealth = v135
        u6:playSound(u37.BED_BREAK, {})
    end)
end
u9.CreateController(u45.new())
return nil