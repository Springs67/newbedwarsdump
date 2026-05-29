local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.GameQueryUtil
local u6 = v3.SoundManager
local u7 = v3.WatchCollectionTag
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = v8.Promise
local u12 = v8.Signal
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u14 = v13.InQuad
local u15 = v13.Linear
local u16 = v13.OutCubic
local u17 = v13.OutExpo
local u18 = v13.OutQuint
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v23 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u24 = v23.CollectionService
local u25 = v23.Players
local u26 = v23.ReplicatedStorage
local u27 = v23.RunService
local u28 = v23.SoundService
local u29 = v23.TweenService
local u30 = v23.Workspace
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u32 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u33 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "fade", "fade-util").FadeUtil
local u34 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u35 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u38 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u39 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u40 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType
local u41 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v42 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "constants", "halloween-2024-scene-constants")
local u43 = v42.Halloween2024BossAction
local u44 = v42.Halloween2024BossConfigs
local u45 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey
local u46 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u47 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u48 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u49 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "effect", "ui", "image-overlay").ImageOverlay
local u50 = v1.import(script, script.Parent.Parent.Parent, "base-scene-controller").BaseSceneController
local u51 = v1.import(script, script.Parent, "environments", "stage-3-environment").HW_STAGE_3_ENVIRONMENT
local u52 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 57 ]]
        return "Halloween2024Stage3SceneController"
    end,
    ["__index"] = u50
})
u52.__index = u52
function u52.new(...) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u52
    --]]
    local v53 = u52
    local v54 = setmetatable({}, v53)
    return v54:constructor(...) or v54
end
function u52.constructor(p55) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u50
        [2] = u45
    --]]
    u50.constructor(p55, u45.HALLOWEEN_2024_STAGE_3)
    p55.Name = "Halloween2024Stage3Scene"
    p55.musicTracks = {}
    p55.caveAmbience = nil
end
function u52.KnitStart(p56) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u50
    --]]
    u50.KnitStart(p56)
end
function u52.onSceneLoadingScreenStart(_) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u36
        [3] = u46
    --]]
    u9.Controllers.PreloadController:runPreload({
        ["animations"] = {
            u36.LARGE_FALL_1,
            u36.SPIDER_QUEEN_LANDING,
            u36.SPIDER_QUEEN_IDLE,
            u36.SPIDER_QUEEN_WEB_CAST_SKY,
            u36.SPIDER_QUEEN_WEB_SPRAY,
            u36.SWORD_SWING_1,
            u36.SWORD_SWING_2,
            u36.HEAVENLY_SWORD_CHARGE
        },
        ["sounds"] = { u46.SPIDER_QUEEN_BOSS_MUSIC, u46.LIGHT_SWORD_ATTACK, u46.INFERNAL_SWORD_ATTACK }
    })
end
function u52.onSceneStart(u57) --[[ Line: 82 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u12
        [3] = u19
        [4] = u21
        [5] = u49
        [6] = u39
        [7] = u44
        [8] = u25
        [9] = u6
        [10] = u46
        [11] = u41
        [12] = u33
        [13] = u7
        [14] = u38
        [15] = u10
        [16] = u4
        [17] = u37
        [18] = u36
        [19] = u34
        [20] = u40
        [21] = u2
        [22] = u35
        [23] = u31
        [24] = u15
    --]]
    u57:setupEnvironment()
    u57:setupSoundAmbience()
    u57:listenForBossActions()
    if u30.CurrentCamera then
        u30.CurrentCamera.CameraType = Enum.CameraType.Custom
    end
    u57.localPlayerStunnedSignal = u12.new()
    u57.stunnedMaid = u19.new()
    u57.stunnedPlayersMaid = {}
    u57.localPlayerStunnedSignal:Connect(function(p58) --[[ Line: 92 ]]
        --[[
        Upvalues:
            [1] = u57
            [2] = u21
            [3] = u49
            [4] = u39
            [5] = u44
            [6] = u25
            [7] = u6
            [8] = u46
        --]]
        if p58 and u57.stunnedMaid then
            local v59 = u57:disableLocalPlayerActions()
            u57.stunnedMaid:GiveTask(v59)
            local u60 = u21.mount(u21.createElement(u49, {
                ["FrameTransparency"] = 0.5,
                ["Image"] = u39.COB_WEB_FRAME,
                ["FadeOutDelay"] = u44.WEB_PULL_DURATION - 1
            }), u25.LocalPlayer:WaitForChild("PlayerGui"))
            u6:playSound(u46.LASSO_HIT)
            u57.stunnedMaid:GiveTask(function() --[[ Line: 102 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u60
                --]]
                u21.unmount(u60)
            end)
        else
            local v61 = u57.stunnedMaid
            if v61 ~= nil then
                v61:DoCleaning()
            end
        end
    end)
    u41.Client:GetNamespace("Halloween2024Remotes"):Get("EnteredBossFight"):Connect(function() --[[ Line: 112 ]]
        --[[
        Upvalues:
            [1] = u57
            [2] = u33
            [3] = u6
            [4] = u46
        --]]
        if u57.caveAmbience then
            u57.caveAmbience:Stop()
            u57.caveAmbience:Destroy()
        end
        u33:fade(0.1, 0.5, 0.3)
        u6:playSound(u46.WEREWOLF_HEARTBEAT, {
            ["volumeMultiplier"] = 5
        })
    end)
    u7("SpiderBoss", function(u62) --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u46
            [3] = u57
            [4] = u38
            [5] = u10
            [6] = u4
            [7] = u37
            [8] = u36
        --]]
        local v63 = u6:playModifiableSound(u46.HALLOWEEN_BOSS_AMBIENT_LOOP, {
            ["fadeInTime"] = 10,
            ["looped"] = true,
            ["volumeMultiplier"] = 0.55
        })
        if v63 then
            local v64 = u57.musicTracks
            table.insert(v64, v63)
        end
        local v65 = u6:playModifiableSound(u46.SPIDER_QUEEN_BOSS_MUSIC, {
            ["fadeInTime"] = 6,
            ["looped"] = true
        })
        if v65 then
            local v66 = u57.musicTracks
            table.insert(v66, v65)
        end
        local u67 = u38:getEntity(u62)
        task.delay(1.5, function() --[[ Line: 141 ]]
            --[[
            Upvalues:
                [1] = u67
                [2] = u10
                [3] = u4
            --]]
            if u67 then
                u10.Controllers.BossBarController:mountEntityBossBar(u67, {
                    ["DisplayName"] = "Spider Queen",
                    ["Gradient"] = ColorSequence.new(u4.hexColor(14695102), u4.hexColor(16283135))
                })
            end
        end)
        local v68 = u62:WaitForChild("Humanoid"):WaitForChild("Animator")
        local v69 = u37:playAnimation(v68, u36.SPIDER_QUEEN_IDLE, {
            ["looped"] = true
        })
        if v69 then
            v69.Priority = Enum.AnimationPriority.Idle
        end
        u37:playAnimation(v68, u36.LARGE_FALL_1, {
            ["looped"] = false
        })
        task.delay(0.45, function() --[[ Line: 159 ]]
            --[[
            Upvalues:
                [1] = u67
                [2] = u6
                [3] = u46
                [4] = u62
            --]]
            if u67 then
                local v70 = u6
                local v71 = u46.BLOCK_KICKER_KIT_STOMP
                local v72 = {}
                local v73 = u62:FindFirstChildWhichIsA("BasePart")
                if v73 ~= nil then
                    v73 = v73.Position
                end
                v72.position = v73
                v72.volumeMultiplier = 3
                v72.rollOffMaxDistance = 400
                v72.rollOffMinDistance = 60
                v72.looped = false
                v70:playSound(v71, v72)
            end
        end)
    end)
    local u74 = nil
    local u75 = nil
    u34.On(function(p76, _, _, _, _, _, _, _, _, _, _, _, _, _) --[[ Line: 190 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u57
            [3] = u75
            [4] = u74
        --]]
        if p76:GetAttribute("MonsterType") ~= u40.HALLOWEEN_SPIDER_BOSS then
            return nil
        end
        local v77 = u57:getBossModel()
        if v77 ~= nil then
            v77 = v77:GetPivot()
        end
        u75 = v77
        local v78 = u74
        if v78 then
            local v79 = u74
            if v79 ~= nil then
                v79 = v79.Name
            end
            v78 = v79 == p76.Name
        end
        if v78 then
            return nil
        end
        u74 = p76:Clone()
    end)
    u41.Client:Get("EntityDeathEvent"):Connect(function(p80) --[[ Line: 213 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u74
            [3] = u75
            [4] = u30
            [5] = u57
            [6] = u2
            [7] = u35
            [8] = u37
            [9] = u36
            [10] = u6
            [11] = u46
        --]]
        if p80.entityInstance:GetAttribute("MonsterType") ~= u40.HALLOWEEN_SPIDER_BOSS then
            return nil
        end
        if not u74 then
            return nil
        end
        if u75 then
            u74:PivotTo(u75)
        end
        u74.Parent = u30
        u57:disableMusic()
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u35.BOSS_BAR)
        local v81 = u74:FindFirstChild("Humanoid")
        if v81 ~= nil then
            v81 = v81:FindFirstChild("Animator")
        end
        if v81 then
            u37:playAnimation(v81, u36.SPIDER_QUEEN_IDLE, {
                ["fadeInTime"] = 0.02
            })
            local v82 = u37:playAnimation(v81, u36.SPIDER_QUEEN_DEATH, {
                ["looped"] = false
            })
            if v82 ~= nil then
                v82.Stopped:Connect(function() --[[ Line: 241 ]]
                    --[[
                    Upvalues:
                        [1] = u74
                    --]]
                    local v83 = u74
                    if v83 ~= nil then
                        v83:Destroy()
                    end
                end)
            end
        end
        u6:playSound(u46.DEATH_FINAL, {
            ["volumeMultiplier"] = 5
        })
        u6:playSound(u46.SPIDER_QUEEN_BOSS_DEATH)
    end)
    u41.Client:Get("SpiderQueenSlash"):Connect(function(p84) --[[ Line: 254 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u15
        --]]
        local u85 = p84.indicatorModel:FindFirstChild("Union")
        local u86 = p84.indicatorModel:FindFirstChild("Base")
        if not (u85 and u86) then
            return nil
        end
        u85.Transparency = 0.9
        u86.Transparency = 0.9
        local _ = u85.Size
        u31(2.5, u15, function(p87) --[[ Line: 263 ]]
            --[[
            Upvalues:
                [1] = u85
                [2] = u86
            --]]
            local v88 = u85
            local v89 = u86.Size.X * p87
            local v90 = u86.Size.Y * p87
            local v91 = u86.Size.Z * p87
            v88.Size = Vector3.new(v89, v90, v91)
            local v92 = u85
            local v93 = CFrame.new
            local v94 = u85.Size.Z / 2
            v92.PivotOffset = v93((Vector3.new(0, 0, v94)))
            u85:GetPivot()
            u85:PivotTo(u86:GetPivot())
        end, 0, 1)
        task.delay(3, function() --[[ Line: 269 ]]
            --[[
            Upvalues:
                [1] = u85
                [2] = u86
            --]]
            u85.Transparency = 1
            u86.Transparency = 1
        end)
    end)
end
function u52.onSceneShutdown(_) --[[ Line: 275 ]] end
function u52.disableMusic(p95) --[[ Line: 277 ]]
    for v96, v97 in p95.musicTracks do
        local _ = v96 - 1
        v97:Stop()
        v97:Destroy()
    end
end
function u52.setupEnvironment(_) --[[ Line: 287 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u51
    --]]
    u9.Controllers.EnvironmentController:setupEnvironment(u51)
end
function u52.setupSoundAmbience(p98) --[[ Line: 290 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u6
        [3] = u46
        [4] = u10
    --]]
    u28.AmbientReverb = Enum.ReverbType.Cave
    local v99 = u6:playModifiableSound(u46.CAVE_AMBIENCE, {
        ["volumeMultiplier"] = 1.2,
        ["looped"] = true
    })
    p98.caveAmbience = v99
    local v100 = p98.musicTracks
    table.insert(v100, v99)
    local v101 = u10.Controllers.FootstepsController.footstepModifier
    local v102 = {
        ["soundConfig"] = {
            ["walk"] = {
                u46.FOOTSTEP_CAVES_1,
                u46.FOOTSTEP_CAVES_2,
                u46.FOOTSTEP_CAVES_3,
                u46.FOOTSTEP_CAVES_4
            },
            ["run"] = {
                u46.FOOTSTEP_CAVES_1,
                u46.FOOTSTEP_CAVES_2,
                u46.FOOTSTEP_CAVES_3,
                u46.FOOTSTEP_CAVES_4
            }
        }
    }
    v101:addModifier(v102)
end
function u52.listenForBossActions(u103) --[[ Line: 307 ]]
    --[[
    Upvalues:
        [1] = u41
    --]]
    u41.Client:WaitFor("Halloween2024EventBossAction"):expect():Connect(function(p104) --[[ Line: 308 ]]
        --[[
        Upvalues:
            [1] = u103
        --]]
        u103:routeBossAction(p104.action, p104.actionData)
    end)
end
function u52.handleWebDeploy(u105, p106) --[[ Line: 312 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u37
        [3] = u36
        [4] = u44
        [5] = u6
        [6] = u46
        [7] = u30
        [8] = u5
        [9] = u20
        [10] = u39
        [11] = u29
    --]]
    local u107 = u19.new()
    local v108 = u105:getBossModel()
    if not v108 then
        return nil
    end
    local v109 = v108.PrimaryPart
    local v110 = v108:FindFirstChildWhichIsA("Humanoid")
    local v111
    if v110 == nil then
        v111 = v110
    else
        v111 = v110:FindFirstChildWhichIsA("Animator")
    end
    if not (v110 and v111) then
        return nil
    end
    u37:playAnimation(v111, u36.SPIDER_QUEEN_WEB_SPRAY, {
        ["fadeInTime"] = 0.1,
        ["looped"] = false,
        ["speed"] = 4 / u44.WEB_PULL_DELAY
    })
    u6:playSound(u46.SPIDER_WEB_BRIDGE_FIRE, {
        ["rollOffMaxDistance"] = 400,
        ["volumeMultiplier"] = 2,
        ["position"] = v109:GetPivot().Position
    })
    local v112 = RaycastParams.new()
    v112.FilterType = Enum.RaycastFilterType.Include
    v112:AddToFilter(u30.Terrain)
    local v113 = u5:raycast(v109.Position + Vector3.new(0, 10, 0), Vector3.new(0, -100, 0), v112)
    if not v113 then
        return nil
    end
    local v114 = p106.webSegments
    local v115 = 360 / v114
    local v116 = (v115 + p106.additionalViewAngle) / 2
    local v117 = math.rad(v116)
    local u118 = math.tan(v117) * p106.pullDistance * 2
    local v119 = false
    local v120 = 0
    while true do
        if v119 then
            v120 = v120 + 2
        else
            v119 = true
        end
        if v120 >= v114 then
            task.delay(u44.WEB_PULL_DELAY + 1, function() --[[ Line: 496 ]]
                --[[
                Upvalues:
                    [1] = u107
                --]]
                u107:DoCleaning()
            end)
            return
        end
        local v121 = CFrame.Angles
        local v122 = v120 * v115 + p106.angleOffset
        local v123 = v121(0, math.rad(v122), 0):VectorToWorldSpace(v109.CFrame.LookVector)
        local v124 = v113.Position + v123 * p106.pullDistance
        local v125 = v113.Position
        local v126 = v123 * (p106.pullDistance + 1)
        local u127 = CFrame.new(v124, v125 + v126)
        local u128 = CFrame.new(v109.Position, u127.Position)
        local v129 = CFrame.new(v113.Position + Vector3.new(0, 1, 0), u127.Position + Vector3.new(0, 1, 0))
        local v130 = u20("Part", {
            ["Name"] = "indicatorBasePart",
            ["Size"] = Vector3.new(1, 1, 1),
            ["Transparency"] = 1,
            ["Anchored"] = true,
            ["CanCollide"] = false,
            ["Parent"] = u30,
            ["CFrame"] = v129
        })
        u107:GiveTask(v130)
        local v131 = u20("Part", {
            ["Name"] = "webBasePart",
            ["Size"] = Vector3.new(1, 1, 1),
            ["Transparency"] = 1,
            ["Anchored"] = true,
            ["CanCollide"] = false,
            ["Parent"] = u30,
            ["CFrame"] = u128
        })
        u107:GiveTask(v131)
        local v132 = u20("Part", {
            ["Name"] = "indicatorPart",
            ["Size"] = Vector3.new(1, 1, 1),
            ["Transparency"] = 1,
            ["Anchored"] = true,
            ["CanCollide"] = false,
            ["Parent"] = u30,
            ["CFrame"] = v129
        })
        u107:GiveTask(v132)
        local u133 = u20("Part", {
            ["Name"] = "webPart",
            ["Size"] = Vector3.new(1, 1, 1),
            ["Transparency"] = 1,
            ["Anchored"] = true,
            ["CanCollide"] = false,
            ["Parent"] = u30,
            ["CFrame"] = u128
        })
        u107:GiveTask(u133)
        local v134 = u20("Attachment", {
            ["Orientation"] = Vector3.new(0, 0, 90),
            ["Parent"] = v130
        })
        u107:GiveTask(v134)
        local v135 = u20("Attachment", {
            ["Orientation"] = Vector3.new(0, 0, 90),
            ["Parent"] = v131
        })
        u107:GiveTask(v135)
        local v136 = u20("Attachment", {
            ["Orientation"] = Vector3.new(0, 0, 90),
            ["Parent"] = v132
        })
        u107:GiveTask(v136)
        local v137 = u20("Attachment", {
            ["Orientation"] = Vector3.new(0, 0, 90),
            ["Parent"] = u133
        })
        local u138 = u20("Beam", {
            ["FaceCamera"] = false,
            ["Width1"] = 0,
            ["TextureSpeed"] = 0,
            ["Parent"] = v130,
            ["Attachment0"] = v134,
            ["Attachment1"] = v136,
            ["Color"] = ColorSequence.new(Color3.fromRGB(255, 100, 100)),
            ["TextureMode"] = Enum.TextureMode.Stretch,
            ["Transparency"] = NumberSequence.new(0.25)
        })
        u107:GiveTask(u138)
        local u139 = u20("Beam", {
            ["FaceCamera"] = false,
            ["Width1"] = 0,
            ["TextureSpeed"] = 0,
            ["Parent"] = u133,
            ["Attachment0"] = v135,
            ["Attachment1"] = v137,
            ["Texture"] = u39.WEB_FLAT,
            ["TextureMode"] = Enum.TextureMode.Stretch,
            ["Transparency"] = NumberSequence.new(0.25)
        })
        u107:GiveTask(u139)
        u29:Create(v132, TweenInfo.new(u44.WEB_PULL_DELAY, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            ["CFrame"] = u127 + Vector3.new(0, 1, 0)
        }):Play()
        u29:Create(u138, TweenInfo.new(u44.WEB_PULL_DELAY, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            ["Width1"] = u118
        }):Play()
        task.delay(u44.WEB_PULL_DELAY - 1, function() --[[ Line: 466 ]]
            --[[
            Upvalues:
                [1] = u105
                [2] = u138
                [3] = u29
                [4] = u133
                [5] = u127
                [6] = u139
                [7] = u118
            --]]
            u105:fadeBeam(u138, 1, "OUT")
            local v140 = {
                ["CFrame"] = u127
            }
            u29:Create(u133, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), v140):Play()
            local v141 = {
                ["Width1"] = u118
            }
            u29:Create(u139, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), v141):Play()
        end)
        task.delay(u44.WEB_PULL_DELAY, function() --[[ Line: 477 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u133
                [3] = u128
                [4] = u139
                [5] = u105
                [6] = u6
                [7] = u46
            --]]
            local v142 = {
                ["CFrame"] = u128
            }
            u29:Create(u133, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), v142):Play()
            u29:Create(u139, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
                ["Width1"] = 0
            }):Play()
            local v143 = u105:getBossModel()
            if v143 then
                u6:playSound(u46.SPIDER_WEB_BLOCK_CREATED, {
                    ["rollOffMaxDistance"] = 250,
                    ["position"] = v143:GetPivot().Position
                })
            end
        end)
    end
end
function u52.handleWebPull(u144, p145) --[[ Line: 500 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u20
        [3] = u39
        [4] = u25
        [5] = u6
        [6] = u46
        [7] = u21
        [8] = u44
    --]]
    local u146 = u19.new()
    local v147 = u144:getBossModel()
    local v148
    if v147 == nil then
        v148 = v147
    else
        v148 = v147.PrimaryPart
    end
    if not (v147 and v148) then
        return nil
    end
    for _, u149 in p145.targets do
        local v150 = u149.Character
        if v150 ~= nil then
            v150 = v150.PrimaryPart
        end
        if v150 then
            local v151 = u20("Attachment", {
                ["Parent"] = v150
            })
            u146:GiveTask(v151)
            local v152 = u20("Attachment", {
                ["Parent"] = v148
            })
            u146:GiveTask(v152)
            u146:GiveTask((u20("Beam", {
                ["FaceCamera"] = true,
                ["TextureSpeed"] = 0.5,
                ["Parent"] = v150,
                ["Attachment0"] = v151,
                ["Attachment1"] = v152,
                ["Texture"] = u39.WEB_FLAT,
                ["TextureMode"] = Enum.TextureMode.Stretch,
                ["Transparency"] = NumberSequence.new(0)
            })))
            if u149 == u25.LocalPlayer then
                local v153 = u144.localPlayerStunnedSignal
                if v153 ~= nil then
                    v153:Fire(true)
                end
            end
            u146:GiveTask(function() --[[ Line: 545 ]]
                --[[
                Upvalues:
                    [1] = u144
                --]]
                local v154 = u144.localPlayerStunnedSignal
                if v154 ~= nil then
                    v154:Fire(false)
                end
            end)
            u6:playSound(u46.BOW_DRAW, {
                ["rollOffMinDistance"] = 150,
                ["rollOffMaxDistance"] = 300,
                ["position"] = v150.Position
            })
            if u149 ~= u25.LocalPlayer then
                local v155 = u21
                local v156 = u21.createElement("BillboardGui", {
                    ["StudsOffset"] = Vector3.new(0, 2, 0),
                    ["AlwaysOnTop"] = true,
                    ["Size"] = UDim2.fromOffset(100, 100)
                }, { u21.createElement("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["Image"] = u39.BOW_ARROW_ICON_SOLID
                    }) })
                local v157 = u149.Character
                if v157 ~= nil then
                    v157 = v157.PrimaryPart
                end
                local u158 = v155.mount(v156, v157)
                local v159 = u144.stunnedMaid
                if v159 ~= nil then
                    v159:GiveTask(function() --[[ Line: 576 ]]
                        --[[
                        Upvalues:
                            [1] = u21
                            [2] = u158
                        --]]
                        u21.unmount(u158)
                    end)
                end
            end
            local v160 = u144.stunnedPlayersMaid
            if v160 ~= nil then
                v160[u149.UserId] = u146
            end
            u146:GiveTask(function() --[[ Line: 586 ]]
                --[[
                Upvalues:
                    [1] = u144
                    [2] = u149
                --]]
                local v161 = u144.stunnedPlayersMaid
                if v161 ~= nil then
                    local v162 = v161[u149.UserId]
                    if v162 ~= nil then
                        v162:DoCleaning()
                    end
                end
                local v163 = u144.stunnedPlayersMaid
                if v163 ~= nil then
                    v163[u149.UserId] = nil
                end
            end)
        end
    end
    u146:GiveTask(task.delay(u44.WEB_PULL_DURATION, function() --[[ Line: 602 ]]
        --[[
        Upvalues:
            [1] = u146
        --]]
        u146:DoCleaning()
    end))
end
function u52.handleWebRelease(p164, p165) --[[ Line: 606 ]]
    local v166 = p165.player.UserId
    local v167 = p164.stunnedPlayersMaid
    if v167 ~= nil then
        local v168 = v167[v166]
        if v168 ~= nil then
            v168:DoCleaning()
        end
    end
    local v169 = p164.stunnedPlayersMaid
    if v169 ~= nil then
        v169[v166] = nil
    end
end
function u52.handleWebShoot(p170, p171) --[[ Line: 620 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u46
        [3] = u25
        [4] = u31
        [5] = u18
    --]]
    local u172 = p170:getBossModel()
    if not u172 then
        return nil
    end
    local u173 = u172:GetPivot()
    u6:playSound(u46.SPIDER_WEB_BRIDGE_IMPACT, {
        ["rollOffMaxDistance"] = 400,
        ["volumeMultiplier"] = 2,
        ["position"] = u172:GetPivot().Position
    })
    local v174 = u25:GetPlayerByUserId(p171.targetUserId)
    if v174 ~= nil then
        v174 = v174.Character
        if v174 ~= nil then
            v174 = v174:GetPivot()
        end
    end
    if v174 then
        u31(0.5, u18, function(p175) --[[ Line: 643 ]]
            --[[
            Upvalues:
                [1] = u172
            --]]
            u172:PivotTo(p175)
        end, u172:GetPivot(), CFrame.new(u172:GetPivot().Position, v174.Position))
    end
    task.delay(1, function() --[[ Line: 648 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u18
            [3] = u172
            [4] = u173
        --]]
        u31(0.5, u18, function(p176) --[[ Line: 649 ]]
            --[[
            Upvalues:
                [1] = u172
            --]]
            u172:PivotTo(p176)
        end, u172:GetPivot(), u173)
    end)
end
function u52.handleLegSpike(p177, u178) --[[ Line: 654 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u30
        [3] = u47
        [4] = u6
        [5] = u46
        [6] = u11
        [7] = u9
        [8] = u29
    --]]
    if not p177:getBossModel() then
        return nil
    end
    local function v188(p179) --[[ Line: 659 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u30
            [3] = u47
            [4] = u6
            [5] = u46
            [6] = u178
            [7] = u11
            [8] = u9
            [9] = u29
        --]]
        local u180 = u26.Assets.Misc.SpiderQueenSpike:Clone()
        u180.Size = u180.Size * 0.75
        local u181 = Vector3.FromNormalId(Enum.NormalId.Top) * (u180.Size.Y / 2 - 1)
        local u182 = Vector3.FromNormalId(Enum.NormalId.Bottom) * (u180.Size.Y / 2)
        local u183 = CFrame.new(p179.Position) * CFrame.Angles(0, 0, 3.141592653589793)
        u180.Anchored = true
        u180:PivotTo(u183 + u182)
        u180.Parent = u30
        local v184 = u26.Assets.Effects.DustLandEffect:Clone()
        v184:PivotTo(u183)
        v184.Parent = u30
        local v185 = u47:enableInstanceEffect(v184)
        u6:playSound(u46.FALLING_ROCKS, {
            ["volumeMultiplier"] = 2,
            ["rollOffMaxDistance"] = 150,
            ["position"] = u183.Position
        })
        task.wait(u178.spikeDelaySec)
        v185:DoCleaning()
        u11.defer(function() --[[ Line: 690 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u46
                [3] = u183
                [4] = u9
                [5] = u29
                [6] = u180
                [7] = u181
                [8] = u182
            --]]
            u6:playSound(u46.SPIKE_ERUPT, {
                ["volumeMultiplier"] = 2,
                ["rollOffMaxDistance"] = 150,
                ["position"] = u183.Position
            })
            u9.Controllers.ScreenShakeController:shake(u183.Position, u183.Position, {
                ["magnitude"] = 2.5
            })
            local v186 = u29:Create(u180, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false), {
                ["CFrame"] = u183 + u181
            })
            v186:Play()
            v186.Completed:Wait()
            task.wait(0.7)
            local v187 = u29:Create(u180, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false), {
                ["CFrame"] = u183 + u182
            })
            v187:Play()
            v187.Completed:Wait()
            u180:Destroy()
        end)
    end
    for v189, v190 in u178.spawns do
        local _ = v189 - 1
        v188(v190)
    end
end
function u52.handleRelocation(p191, p192) --[[ Line: 721 ]]
    --[[
    Upvalues:
        [1] = u37
        [2] = u36
        [3] = u19
        [4] = u29
        [5] = u44
        [6] = u30
        [7] = u20
        [8] = u39
        [9] = u6
        [10] = u46
        [11] = u10
        [12] = u26
        [13] = u47
    --]]
    local u193 = p191:getBossModel()
    if not u193 then
        return nil
    end
    local v194 = u193:FindFirstChildWhichIsA("Humanoid")
    local u195
    if v194 == nil then
        u195 = v194
    else
        u195 = v194:FindFirstChildWhichIsA("Animator")
    end
    if not (v194 and u195) then
        return nil
    end
    if not u193.PrimaryPart then
        return nil
    end
    u37:playAnimation(u195, u36.SPIDER_QUEEN_WEB_CAST_SKY, {
        ["looped"] = false
    })
    local u196 = u19.new()
    local u197 = {}
    local v198 = u193:GetDescendants()
    local function v200(p199) --[[ Line: 745 ]]
        --[[
        Upvalues:
            [1] = u197
            [2] = u29
            [3] = u44
        --]]
        if p199:IsA("BasePart") then
            u197[p199] = p199.Transparency
            u29:Create(p199, TweenInfo.new(u44.RELOCATE_ASCEND_DURATION), {
                ["Transparency"] = 1
            }):Play()
        end
    end
    for v201, v202 in v198 do
        v200(v202, v201 - 1, v198)
    end
    local v203 = u193:FindFirstChild("RightGripAttachment", true)
    if v203 then
        local v204 = {
            ["Name"] = "WebPart",
            ["Anchored"] = true,
            ["Size"] = Vector3.new(1, 1, 1),
            ["Parent"] = u30
        }
        local v205 = u193:GetPivot()
        local v206 = u44.RELOCATE_Y_HEIGHT_OFFSET
        v204.CFrame = v205 + Vector3.new(0, v206, 0)
        v204.CanCollide = false
        v204.Transparency = 1
        local v207 = u20("Part", v204)
        u196:GiveTask(v207)
        local v208 = u20("Attachment", {
            ["Parent"] = v207
        })
        u196:GiveTask(v208)
        local v209 = u20("Beam", {
            ["FaceCamera"] = true,
            ["TextureSpeed"] = 0.5,
            ["Parent"] = v207,
            ["Attachment0"] = v208,
            ["Attachment1"] = v203,
            ["Texture"] = u39.WEB_FLAT,
            ["TextureMode"] = Enum.TextureMode.Stretch,
            ["Transparency"] = NumberSequence.new(0)
        })
        u196:GiveTask(v209)
        p191:fadeBeam(v209, u44.RELOCATE_ASCEND_DURATION, "OUT")
    end
    u6:playSound(u46.SPIDER_WEB_BLOCK_CREATED, {
        ["rollOffMinDistance"] = 150,
        ["rollOffMaxDistance"] = 300,
        ["position"] = u193:GetPivot().Position
    })
    local v210 = u44.RELOCATE_STOMP_DAMAGE_RADIUS
    local v211 = {}
    local v212 = p192.position
    v211.CFrame = CFrame.new(v212 + Vector3.new(0, 0.375, 0)) * CFrame.Angles(0, 0, 1.5707963267948966)
    v211.Anchored = true
    v211.CanCollide = false
    v211.CanQuery = false
    v211.Shape = Enum.PartType.Cylinder
    local v213 = v210 * 2
    local v214 = v210 * 2
    v211.Size = Vector3.new(0.75, v213, v214)
    v211.Material = Enum.Material.ForceField
    v211.Transparency = 0.2
    v211.Color = Color3.fromRGB(255, 41, 0)
    v211.Parent = u30
    local u215 = u20("Part", v211)
    u196:GiveTask(u215)
    local u216 = u215:Clone()
    u216.Material = Enum.Material.Neon
    u216.Size = Vector3.new(0.6, 0, 0)
    u216.Transparency = 0.6
    u216.Parent = u30
    u196:GiveTask(u216)
    u29:Create(u216, TweenInfo.new(u44.RELOCATE_ASCEND_DURATION + u44.RELOCATE_STOMP_DELAY), {
        ["Size"] = u215.Size
    }):Play()
    task.delay(u44.RELOCATE_ASCEND_DURATION + u44.RELOCATE_STOMP_DELAY - 1, function() --[[ Line: 828 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u44
            [3] = u197
            [4] = u37
            [5] = u195
            [6] = u36
            [7] = u216
            [8] = u215
            [9] = u193
            [10] = u6
            [11] = u46
            [12] = u10
            [13] = u26
            [14] = u30
            [15] = u47
            [16] = u196
        --]]
        local function v219(p217, p218) --[[ Line: 829 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u44
            --]]
            u29:Create(p218, TweenInfo.new(u44.RELOCATE_STOMP_DELAY, Enum.EasingStyle.Exponential), {
                ["Transparency"] = p217
            }):Play()
        end
        for v220, v221 in u197 do
            v219(v221, v220, u197)
        end
        u37:playAnimation(u195, u36.SPIDER_QUEEN_LANDING, {
            ["looped"] = false
        })
        task.delay(u44.RELOCATE_STOMP_DELAY, function() --[[ Line: 841 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u216
                [3] = u215
            --]]
            u29:Create(u216, TweenInfo.new(1, Enum.EasingStyle.Exponential), {
                ["Transparency"] = 1
            }):Play()
            u29:Create(u215, TweenInfo.new(1, Enum.EasingStyle.Exponential), {
                ["Transparency"] = 1
            }):Play()
        end)
        task.delay(1, function() --[[ Line: 849 ]]
            --[[
            Upvalues:
                [1] = u193
                [2] = u6
                [3] = u46
                [4] = u10
                [5] = u26
                [6] = u30
                [7] = u47
                [8] = u196
            --]]
            local v222 = u193:GetPivot().Position
            u6:playSound(u46.SPIKE_ERUPT, {
                ["rollOffMinDistance"] = 150,
                ["rollOffMaxDistance"] = 300,
                ["position"] = v222
            })
            u10.Controllers.ScreenShakeController:shake(v222, Vector3.new(0, -1, 0), {
                ["zMagnitude"] = 2,
                ["magnitude"] = 2,
                ["cycles"] = 3,
                ["duration"] = 0.18
            })
            local v223 = u26.Assets.Effects.Explosion:Clone()
            local v224 = select(2, u193:GetBoundingBox()).Y / 2
            local v225 = Vector3.new(0, v224, 0)
            v223:PivotTo(CFrame.new(v222 - v225))
            v223.Parent = u30
            u47:playEffects(v223:GetChildren(), nil, {
                ["destroyAfterSec"] = 1,
                ["sizeMultiplier"] = 3
            })
            u196:DoCleaning()
        end)
    end)
end
function u52.handleSlice(p226, p227) --[[ Line: 875 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u31
        [3] = u18
        [4] = u26
        [5] = u48
        [6] = u16
        [7] = u37
        [8] = u36
        [9] = u6
        [10] = u46
        [11] = u41
    --]]
    local u228 = p226:getBossModel()
    if not u228 then
        return nil
    end
    local u229 = u228:GetPivot()
    local v230 = u25:GetPlayerByUserId(p227.targetUserId)
    if v230 ~= nil then
        v230 = v230.Character
        if v230 ~= nil then
            v230 = v230:GetPivot()
        end
    end
    if v230 then
        u31(0.5, u18, function(p231) --[[ Line: 892 ]]
            --[[
            Upvalues:
                [1] = u228
            --]]
            u228:PivotTo(p231)
        end, u228:GetPivot(), CFrame.new(u228:GetPivot().Position, v230.Position))
    end
    task.delay(0.5, function() --[[ Line: 896 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u228
            [3] = u48
            [4] = u31
            [5] = u16
            [6] = u37
            [7] = u36
            [8] = u6
            [9] = u46
            [10] = u25
            [11] = u41
            [12] = u18
            [13] = u229
        --]]
        local u232 = u26.Assets.Misc.SpiderQueenSlice:Clone()
        u232.Handle.Size = u232.Handle.Size * 5.5
        local v233 = u228:FindFirstChild("Humanoid")
        if v233 then
            v233:AddAccessory(u232)
        end
        u48:weldCharacterAccessories(u228)
        u31(0.6, u16, function(p234) --[[ Line: 905 ]]
            --[[
            Upvalues:
                [1] = u232
            --]]
            for v235, v236 in u232:GetDescendants() do
                local _ = v235 - 1
                if v236:IsA("BasePart") then
                    v236.Transparency = p234
                elseif v236:IsA("Decal") then
                    v236.Transparency = p234
                end
            end
        end, 1, 0)
        local v237 = u37:playAnimation(u228:WaitForChild("Humanoid"):WaitForChild("Animator"), u36.SPIDER_BOSS_SPIN, {
            ["speed"] = 0.7
        })
        local v238 = u6
        local v239 = u46.SCYTHE_SPIN_1
        local v240 = {}
        local v241 = u228:FindFirstChildWhichIsA("BasePart")
        if v241 ~= nil then
            v241 = v241.Position
        end
        v240.position = v241
        v240.volumeMultiplier = 3
        v240.rollOffMaxDistance = 400
        v240.rollOffMinDistance = 60
        v240.looped = false
        v238:playSound(v239, v240)
        local u242 = false
        local u244 = u232.Handle.Touched:Connect(function(p243) --[[ Line: 937 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u242
                [3] = u41
            --]]
            if u25.LocalPlayer.Character and p243:IsDescendantOf(u25.LocalPlayer.Character) then
                if u242 then
                    return nil
                end
                u242 = true
                u41.Client:Get("HitSpiderSword"):SendToServer()
            end
        end)
        local u245 = nil
        if v237 ~= nil then
            v237 = v237.Stopped:Once(function() --[[ Line: 950 ]]
                --[[
                Upvalues:
                    [1] = u244
                    [2] = u245
                    [3] = u31
                    [4] = u16
                    [5] = u232
                    [6] = u18
                    [7] = u228
                    [8] = u229
                --]]
                u244:Disconnect()
                local v246 = u245
                if v246 ~= nil then
                    v246:Disconnect()
                end
                u31(0.6, u16, function(p247) --[[ Line: 957 ]]
                    --[[
                    Upvalues:
                        [1] = u232
                    --]]
                    for v248, v249 in u232:GetDescendants() do
                        local _ = v248 - 1
                        if v249:IsA("BasePart") then
                            v249.Transparency = p247
                        elseif v249:IsA("Decal") then
                            v249.Transparency = p247
                        end
                    end
                end, 0, 1)
                u31(0.5, u18, function(p250) --[[ Line: 971 ]]
                    --[[
                    Upvalues:
                        [1] = u228
                    --]]
                    u228:PivotTo(p250)
                end, u228:GetPivot(), u229)
                task.delay(0.8, function() --[[ Line: 974 ]]
                    --[[
                    Upvalues:
                        [1] = u232
                    --]]
                    u232:Destroy()
                end)
            end)
        end
    end)
end
function u52.fadeOutBoss(p251) --[[ Line: 982 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u44
    --]]
    local v252 = p251:getBossModel()
    if not v252 then
        return nil
    end
    local u253 = {}
    local v254 = v252:GetDescendants()
    local function v256(p255) --[[ Line: 989 ]]
        --[[
        Upvalues:
            [1] = u253
            [2] = u29
            [3] = u44
        --]]
        if p255:IsA("BasePart") then
            u253[p255] = p255.Transparency
            u29:Create(p255, TweenInfo.new(u44.RELOCATE_ASCEND_DURATION), {
                ["Transparency"] = 1
            }):Play()
        end
    end
    for v257, v258 in v254 do
        v256(v258, v257 - 1, v254)
    end
    return function() --[[ Line: 1003 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u44
            [3] = u253
        --]]
        local function v261(p259, p260) --[[ Line: 1004 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u44
            --]]
            u29:Create(p260, TweenInfo.new(u44.RELOCATE_STOMP_DELAY, Enum.EasingStyle.Exponential), {
                ["Transparency"] = p259
            }):Play()
        end
        for v262, v263 in u253 do
            v261(v263, v262, u253)
        end
    end
end
function u52.handleVoidGame(p264, _) --[[ Line: 1015 ]]
    --[[
    Upvalues:
        [1] = u44
        [2] = u37
        [3] = u36
        [4] = u29
        [5] = u24
        [6] = u6
        [7] = u46
        [8] = u31
        [9] = u17
    --]]
    local u265 = p264:getBossModel()
    if not u265 then
        return nil
    end
    local u266 = u265:WaitForChild("Humanoid"):WaitForChild("Animator")
    local v267 = u44.FOG_RAISE_DURATION
    local v268 = u44.FOG_RAISED_HOLD_DURATION
    local v269 = u44.FOG_LOWER_DURATION
    local u270 = p264:fadeOutBoss()
    u37:playAnimation(u266, u36.SPIDER_QUEEN_WEB_CAST_SKY, {
        ["looped"] = false
    })
    local u271 = u265:GetPivot()
    local v272 = u29
    local v273 = u265.PrimaryPart
    local v274 = TweenInfo.new(u44.RELOCATE_ASCEND_DURATION, Enum.EasingStyle.Exponential, Enum.EasingDirection.In)
    local v275 = {}
    local v276 = u44.RELOCATE_Y_HEIGHT_OFFSET
    v275.CFrame = u271 + Vector3.new(0, v276, 0)
    v272:Create(v273, v274, v275):Play()
    local u277 = {}
    local v278 = u24:GetTagged("WebPlatform")
    local function v286(u279) --[[ Line: 1042 ]]
        --[[
        Upvalues:
            [1] = u277
            [2] = u44
            [3] = u6
            [4] = u46
            [5] = u31
            [6] = u17
        --]]
        if not u279:IsA("Model") then
            return nil
        end
        local v280 = u277
        table.insert(v280, u279)
        local v281 = u279:GetPivot().Position
        local v282 = u279:GetPivot().Position
        local v283 = u44.FOG_PLATFORM_START_HEIGHT - 3
        local v284 = v282 - Vector3.new(0, v283, 0)
        u6:playSound(u46.SPIDER_WEB_BLOCK_CREATED, {
            ["rollOffMaxDistance"] = 400,
            ["volumeMultiplier"] = 5,
            ["position"] = v284
        })
        u31(2, u17, function(p285) --[[ Line: 1058 ]]
            --[[
            Upvalues:
                [1] = u279
            --]]
            u279:PivotTo(CFrame.new(p285))
        end, v281, v284)
    end
    for v287, v288 in v278 do
        v286(v288, v287 - 1, v278)
    end
    task.delay(v267 + v268 + v269, function() --[[ Line: 1066 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u46
            [3] = u31
            [4] = u17
            [5] = u277
            [6] = u265
            [7] = u271
            [8] = u270
            [9] = u37
            [10] = u266
            [11] = u36
        --]]
        local function v292(u289) --[[ Line: 1067 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u46
                [3] = u31
                [4] = u17
            --]]
            local v290 = u289:GetPivot()
            u6:playSound(u46.SPIDER_WEB_BLOCK_CREATED, {
                ["rollOffMaxDistance"] = 400,
                ["volumeMultiplier"] = 5,
                ["position"] = v290.Position
            })
            u31(1, u17, function(p291) --[[ Line: 1075 ]]
                --[[
                Upvalues:
                    [1] = u289
                --]]
                u289:PivotTo(p291)
            end, v290, v290 + Vector3.new(0, 60, 0))
            task.delay(1.1, function() --[[ Line: 1080 ]]
                --[[
                Upvalues:
                    [1] = u289
                --]]
                u289:Destroy()
            end)
        end
        for v293, v294 in u277 do
            v292(v294, v293 - 1, u277)
        end
        u265:PivotTo(u271)
        local v295 = u270
        if v295 ~= nil then
            v295()
        end
        u37:playAnimation(u266, u36.SPIDER_QUEEN_LANDING, {
            ["looped"] = false
        })
        task.delay(0.45, function() --[[ Line: 1096 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u46
                [3] = u265
            --]]
            local v296 = u6
            local v297 = u46.BLOCK_KICKER_KIT_STOMP
            local v298 = {}
            local v299 = u265:FindFirstChildWhichIsA("BasePart")
            if v299 ~= nil then
                v299 = v299.Position
            end
            v298.position = v299
            v298.volumeMultiplier = 3
            v298.rollOffMaxDistance = 400
            v298.rollOffMinDistance = 60
            v298.looped = false
            v296:playSound(v297, v298)
        end)
    end)
end
function u52.routeBossAction(p300, p301, p302) --[[ Line: 1114 ]]
    --[[
    Upvalues:
        [1] = u43
    --]]
    if p301 == u43.WEB_PULL then
        p300:handleWebPull(p302)
        return
    elseif p301 == u43.WEB_DEPLOY then
        p300:handleWebDeploy(p302)
        return
    elseif p301 == u43.WEB_SHOOT then
        p300:handleWebShoot(p302)
        return
    elseif p301 == u43.WEB_RELEASE then
        p300:handleWebRelease(p302)
        return
    elseif p301 == u43.LEG_SPIKE then
        p300:handleLegSpike(p302)
        return
    elseif p301 == u43.RELOCATE then
        p300:handleRelocation(p302)
        return
    elseif p301 == u43.SLICE then
        p300:handleSlice(p302)
        return
    elseif p301 == u43.VOID_GAME then
        p300:handleVoidGame(p302)
        return
    elseif p301 == u43.SLASH then
        p300:handleSlash(p302)
    end
end
function u52.disableLocalPlayerActions(_) --[[ Line: 1154 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u32
    --]]
    local v303 = u19.new()
    v303:GiveTask(u32.SwordSwing:connect(function(p304) --[[ Line: 1156 ]]
        p304:setCancelled(true)
    end))
    v303:GiveTask(u32.StartLaunchProjectile:connect(function(p305) --[[ Line: 1159 ]]
        p305:setCancelled(true)
    end))
    v303:GiveTask(u32.BeginProjectileTargeting:connect(function(p306) --[[ Line: 1162 ]]
        p306:setCancelled(true)
    end))
    v303:GiveTask(u32.StartConsuming:connect(function(p307) --[[ Line: 1165 ]]
        p307:setCancelled(true)
    end))
    return v303
end
function u52.fadeBeam(_, u308, u309, u310) --[[ Line: 1170 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u27
    --]]
    local u311 = u19.new()
    local u312 = 0
    u311:GiveTask(u27.Heartbeat:Connect(function(p313) --[[ Line: 1173 ]]
        --[[
        Upvalues:
            [1] = u312
            [2] = u309
            [3] = u311
            [4] = u310
            [5] = u308
        --]]
        u312 = u312 + p313
        if u309 <= u312 then
            u311:DoCleaning()
            return nil
        end
        local v314
        if u310 == "IN" then
            v314 = 1 - u312 / u309
        else
            v314 = u312 / u309
        end
        u308.Transparency = NumberSequence.new(v314)
    end))
end
function u52.getBossModel(_) --[[ Line: 1183 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v315 = u24:GetTagged("SpiderBoss")
    if #v315 == 0 then
        return nil
    else
        return v315[1]
    end
end
function u52.handleSlash(p316, _) --[[ Line: 1190 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u48
        [3] = u37
        [4] = u36
        [5] = u30
        [6] = u31
        [7] = u14
        [8] = u22
        [9] = u6
        [10] = u46
    --]]
    print("SLASH!")
    local v317 = p316:getBossModel()
    if not v317 then
        return nil
    end
    local u318 = u26.Assets.Misc.LongSpiderQueenSlice:Clone()
    task.delay(5, function() --[[ Line: 1198 ]]
        --[[
        Upvalues:
            [1] = u318
        --]]
        local v319 = u318
        if v319 ~= nil then
            v319:Destroy()
        end
    end)
    local v320 = v317:FindFirstChild("Humanoid")
    if v320 then
        v320:AddAccessory(u318)
    end
    u48:weldCharacterAccessories(v317)
    local u321
    if v320 == nil then
        u321 = v320
    else
        u321 = v320:FindFirstChildWhichIsA("Animator")
    end
    if not (v320 and u321) then
        return nil
    end
    local u322 = v317.PrimaryPart
    if not u322 then
        return nil
    end
    local v323 = u37:playAnimation(u321, u36.HEAVENLY_SWORD_CHARGE, {
        ["looped"] = false
    })
    v323 = v323
    if v323 ~= nil then
        local v324 = v323.Length
    end
    print(v324)
    v323 = v323
    if v323 then
        v323 = v323
        local v325
        if v323 == nil then
            v325 = v323
        else
            v325 = v323.Length
        end
        local v326 = v325 > 0
    end
    if v326 then
        local v327 = v323
        if v327 ~= nil then
            v327:AdjustSpeed(v323.Length / 3)
        end
        task.wait(2.5)
        local u328 = u37:playAnimation(u321, u36.SWORD_SWING_1, {
            ["looped"] = false
        })
        local u329 = u26.Assets.Effects.SpiderQueenSlashWave:Clone()
        u329.Parent = u30
        local v330 = u322.CFrame
        local v331 = CFrame.Angles(0, 0, 0.7853981633974483)
        u329:PivotTo((v330 - Vector3.new(5, 0, 5)) * v331)
        local v332 = u322.CFrame
        local v333 = u322.CFrame.LookVector * 200
        local v334 = CFrame.Angles(0, 0, 0.7853981633974483)
        local v335 = (v332 + v333 - Vector3.new(90, 0, 90)) * v334
        u31(0.2, u14, function(p336) --[[ Line: 1258 ]]
            --[[
            Upvalues:
                [1] = u329
                [2] = u22
            --]]
            u329:PivotTo(p336)
            u22(u329, 1.05)
        end, u329.PrimaryPart.CFrame, v335)
        task.delay(0.2, function() --[[ Line: 1262 ]]
            --[[
            Upvalues:
                [1] = u329
            --]]
            u329:Destroy()
        end)
        u6:playSound(u46.LIGHT_SWORD_ATTACK, {
            ["position"] = nil,
            ["rollOffMaxDistance"] = 220
        })
        local v337 = u328
        if v337 ~= nil then
            v337:AdjustSpeed(0.5)
        end
        task.delay(1.35, function() --[[ Line: 1273 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u30
                [3] = u322
                [4] = u31
                [5] = u14
                [6] = u22
                [7] = u6
                [8] = u46
                [9] = u328
                [10] = u37
                [11] = u321
                [12] = u36
            --]]
            local u338 = u26.Assets.Effects.SpiderQueenSlashWave:Clone()
            u338.Parent = u30
            local v339 = u322.CFrame
            local v340 = CFrame.Angles(0, 0, -0.7853981633974483)
            u338:PivotTo((v339 + Vector3.new(5, 0, 5)) * v340)
            local v341 = u322.CFrame
            local v342 = u322.CFrame.LookVector * 200
            local v343 = CFrame.Angles(0, 0, -0.7853981633974483)
            local v344 = (v341 + v342 + Vector3.new(90, 0, 90)) * v343
            u31(0.2, u14, function(p345) --[[ Line: 1286 ]]
                --[[
                Upvalues:
                    [1] = u338
                    [2] = u22
                --]]
                u338:PivotTo(p345)
                u22(u338, 1.05)
            end, u338.PrimaryPart.CFrame, v344)
            task.delay(0.2, function() --[[ Line: 1290 ]]
                --[[
                Upvalues:
                    [1] = u338
                --]]
                u338:Destroy()
            end)
            u6:playSound(u46.INFERNAL_SWORD_ATTACK, {
                ["position"] = nil,
                ["rollOffMaxDistance"] = 220
            })
            u328 = u37:playAnimation(u321, u36.SWORD_SWING_2, {
                ["looped"] = false
            })
            local v346 = u328
            if v346 ~= nil then
                v346:AdjustSpeed(0.6)
            end
        end)
    end
end
u9.CreateController(u52.new())
return nil