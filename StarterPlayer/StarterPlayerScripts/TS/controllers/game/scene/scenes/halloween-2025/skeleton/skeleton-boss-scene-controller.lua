local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.GameQueryUtil
local u5 = v2.SoundManager
local u6 = v2.WatchCollectionTag
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u11 = v10.InQuad
local u12 = v10.Linear
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.CollectionService
local u17 = v15.Players
local u18 = v15.ReplicatedStorage
local u19 = v15.RunService
local u20 = v15.SoundService
local u21 = v15.TweenService
local u22 = v15.Workspace
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u24 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "games", "halloween-event", "ambient", "halloween-event-environment").HalloweenEventEnvironment
local u25 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "effect", "vignette", "vignette-meta").VignetteType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "constants", "skeleton-boss-scene-constants").SkeletonBossAction
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "math-util").MathUtil
local u37 = v1.import(script, script.Parent.Parent.Parent.Parent, "base-scene-controller").BaseSceneController
local u38 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 43 ]]
        return "SkeletonBossSceneController"
    end,
    ["__index"] = u37
})
u38.__index = u38
function u38.new(...) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u38
    --]]
    local v39 = u38
    local v40 = setmetatable({}, v39)
    return v40:constructor(...) or v40
end
function u38.constructor(p41) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u37
        [2] = u33
        [3] = u13
    --]]
    u37.constructor(p41, u33.SKELETON_BOSS)
    p41.Name = "SkeletonBossSceneController"
    p41.sceneMaid = u13.new()
    p41.sceneLightingModifiers = {}
    p41.musicTracks = {}
    p41.lastHitBoneObstacleTime = -1
    p41.actionStateVariables = {
        ["reviveStateData"] = nil,
        ["randomWalkAnimationMaid"] = nil
    }
end
function u38.KnitStart(p42) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u37
    --]]
    u37.KnitStart(p42)
end
function u38.onSceneLoadingScreenStart(p43) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u19
    --]]
    u9.Controllers.PreloadController:runPreload({
        ["animations"] = {},
        ["sounds"] = {}
    })
    if not u19:IsStudio() then
        p43:setupSoundAmbience()
        p43:setupSceneLighting()
    end
end
function u38.onSceneStart(u44) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u6
        [3] = u28
        [4] = u9
        [5] = u3
        [6] = u5
        [7] = u34
        [8] = u27
        [9] = u26
        [10] = u31
        [11] = u30
        [12] = u8
        [13] = u29
        [14] = u18
        [15] = u22
        [16] = u25
        [17] = u35
        [18] = u14
        [19] = u23
        [20] = u11
    --]]
    if u19:IsStudio() then
        u44:setupSoundAmbience()
        u44:setupSceneLighting()
    end
    u6("SkeletonBoss", function(u45) --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u9
            [3] = u3
            [4] = u5
            [5] = u34
            [6] = u27
            [7] = u26
        --]]
        task.delay(1.5, function() --[[ Line: 85 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u45
                [3] = u9
                [4] = u3
            --]]
            local v46 = u28:getEntity(u45)
            if v46 then
                u9.Controllers.BossBarController:mountEntityBossBar(v46, {
                    ["DisplayName"] = "MARROW",
                    ["Gradient"] = ColorSequence.new(u3.hexColor(62207), u3.hexColor(4456334))
                })
            end
        end)
        local v47 = u5
        local v48 = u34.HALLOWEEN_BOSS_SPAWN
        local v49 = {}
        local v50 = u45:FindFirstChildWhichIsA("BasePart")
        if v50 ~= nil then
            v50 = v50.Position
        end
        v49.position = v50
        v49.rollOffMaxDistance = 400
        v49.rollOffMinDistance = 60
        v47:playSound(v48, v49)
        local v51 = u45:WaitForChild("Humanoid"):WaitForChild("Animator")
        local v52 = u27:playAnimation(v51, u26.SKELETON_IDLE, {
            ["looped"] = true
        })
        if v52 then
            v52.Priority = Enum.AnimationPriority.Idle
        end
        u27:playAnimation(v51, u26.WARLOCK_ENTER_SCENE)
    end)
    u31.Client:Get("EntityDeathEvent"):Connect(function(p53) --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u8
            [3] = u29
            [4] = u18
            [5] = u22
        --]]
        if p53.entityInstance:GetAttribute("MonsterType") ~= u30.HALLOWEEN_SKELETON_BOSS then
            return nil
        end
        local v54 = p53.entityInstance:GetPivot().Position
        u8.Controllers.RewardController:spawnRewards({
            {
                ["title"] = u29.SKELETON_SLAYER
            }
        }, {
            ["location"] = v54
        })
        local v55 = u18.Assets.Misc.CryptRewards:FindFirstChildWhichIsA("Model"):Clone()
        v55.Parent = u22
        v55:PivotTo(CFrame.new(v54))
        v55.PrimaryPart.Velocity = Vector3.new(0, 55, 0)
    end)
    u31.Client:GetNamespace("Halloween2025Remotes"):Get("SkeletonBossGasCloudCurse"):Connect(function(p56) --[[ Line: 133 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u5
            [3] = u34
            [4] = u9
            [5] = u25
        --]]
        local v57 = p56 - u22:GetServerTimeNow()
        if v57 > 0 then
            u5:playSound(u34.CURSE_INFLICT)
            u9.Controllers.VignetteController:createVignette(u25.POISON_SPLASH)
            task.delay(v57, function() --[[ Line: 139 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u25
                --]]
                u9.Controllers.VignetteController:destroyVignette(u25.POISON_SPLASH)
            end)
        end
    end)
    u6("SkeletonBossGasCloud", function(u58) --[[ Line: 144 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u34
            [3] = u18
            [4] = u22
            [5] = u35
        --]]
        local u59 = u5:playSound(u34.CURSE_ACTIVATE, {
            ["rollOffMinDistance"] = 60,
            ["rollOffMaxDistance"] = 100,
            ["parent"] = u58
        })
        local v60 = u18.Assets.Effects.Potion.PoisonSplashPotion:Clone()
        v60:PivotTo(u58:GetPivot())
        v60.Parent = u22
        u35:playEffects({ v60 }, nil, {
            ["destroyAfterSec"] = 3
        })
        local u61 = u18.Assets.Effects.SkeletonKit_Smoke:Clone()
        u61.Smoke.Size = NumberSequence.new(18)
        u61:PivotTo(CFrame.new(u58:GetPivot().Position))
        u61.Parent = u22
        u61.Smoke:Emit(10)
        local u62 = u5:playSound(u34.SKELETON_KIT_SMOKE_LOOP, {
            ["rollOffMinDistance"] = 50,
            ["rollOffMaxDistance"] = 85,
            ["volumeMultiplier"] = 2.2,
            ["looped"] = true,
            ["parent"] = u58
        })
        local v63 = u58:GetAttribute("Duration")
        if v63 ~= nil then
            task.delay(v63, function() --[[ Line: 173 ]]
                --[[
                Upvalues:
                    [1] = u58
                    [2] = u61
                    [3] = u59
                    [4] = u62
                --]]
                u58:Destroy()
                u61:Destroy()
                u59:Destroy()
                u62:Destroy()
            end)
        end
    end)
    u6("SkeletonPlatform", function(u64) --[[ Line: 181 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u23
            [3] = u11
            [4] = u5
            [5] = u34
            [6] = u18
            [7] = u22
            [8] = u35
        --]]
        u14("Highlight", {
            ["FillTransparency"] = 0.5,
            ["OutlineTransparency"] = 0,
            ["Parent"] = u64,
            ["OutlineColor"] = Color3.fromRGB(69, 255, 227),
            ["FillColor"] = Color3.fromRGB(69, 255, 227),
            ["DepthMode"] = Enum.HighlightDepthMode.Occluded
        })
        local u65 = u64.CFrame
        local u66 = u64.CFrame + Vector3.new(0, 15, 0)
        u23(0.3, u11, function(p67) --[[ Line: 196 ]]
            --[[
            Upvalues:
                [1] = u64
                [2] = u66
                [3] = u65
            --]]
            u64.CFrame = u66:Lerp(u65, p67)
        end)
        u23(0.3, u11, function(p68) --[[ Line: 200 ]]
            --[[
            Upvalues:
                [1] = u64
            --]]
            u64.Transparency = p68
        end, 1, 0)
        u5:playSound(u34.ENDURANCE_ROCK_HIT_1, {
            ["rollOffMaxDistance"] = 330,
            ["rollOffMinDistance"] = 125,
            ["volumeMultiplier"] = 1.3,
            ["position"] = u64.Position
        })
        task.delay(9.75, function() --[[ Line: 211 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u64
                [3] = u22
                [4] = u35
                [5] = u5
                [6] = u34
            --]]
            local v69 = u18.Assets.Effects.HalloweenExplosion:Clone()
            v69.Position = u64.Position
            v69.Parent = u22
            u35:playEffects({ v69 }, nil, {
                ["destroyAfterSec"] = 3,
                ["sizeMultiplier"] = 2
            })
            u5:playSound(u34.ENDURANCE_ROCK_HIT_3, {
                ["rollOffMaxDistance"] = 330,
                ["rollOffMinDistance"] = 125,
                ["volumeMultiplier"] = 1.3,
                ["position"] = u64.Position
            })
        end)
    end)
    u31.Client:GetNamespace("Halloween2025Remotes"):Get("SkeletonBossAction"):Connect(function(p70) --[[ Line: 227 ]]
        --[[
        Upvalues:
            [1] = u44
        --]]
        u44:routeBossAction(p70.action, p70.actionData)
    end)
end
function u38.onSceneShutdown(u71) --[[ Line: 233 ]]
    u71.sceneMaid:DoCleaning()
    u71.sceneMaid:GiveTask(function() --[[ Line: 235 ]]
        --[[
        Upvalues:
            [1] = u71
        --]]
        for v72, v73 in u71.musicTracks do
            local _ = v72 - 1
            v73:Destroy()
        end
    end)
end
function u38.setupSoundAmbience(u74) --[[ Line: 245 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u5
        [3] = u34
    --]]
    local u75 = u20.AmbientReverb
    u20.AmbientReverb = Enum.ReverbType.Forest
    u74.sceneMaid:GiveTask(function() --[[ Line: 248 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u75
        --]]
        u20.AmbientReverb = u75
    end)
    local v76 = u5:playModifiableSound(u34.HALLOWEEN_BOSS_AMBIENT_LOOP, {
        ["fadeInTime"] = 10,
        ["looped"] = true,
        ["volumeMultiplier"] = 0.7
    })
    if v76 then
        local v77 = u74.musicTracks
        table.insert(v77, v76)
    end
    task.delay(10, function() --[[ Line: 259 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u34
            [3] = u74
        --]]
        local v78 = u5:playModifiableSound(u34.HALLOWEEN_2022_BOSS_MUSIC, {
            ["fadeInTime"] = 6,
            ["looped"] = true
        })
        if v78 then
            local v79 = u74.musicTracks
            table.insert(v79, v78)
        end
    end)
end
function u38.handleHeadBounce(p80, p81) --[[ Line: 269 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v82 = u16:GetTagged("SkeletonBoss")[1]
    if v82 then
        local v83 = p81.state
        if v83 == "dissassemble" then
            local v84 = p81.dissassemble
            if v84 ~= nil then
                v84 = v84.duration
            end
            if v84 == 0 or (v84 ~= v84 or not v84) then
                return nil
            end
            p80:headBounceDissassemble(v82, p81.dissassemble.duration)
            return
        elseif v83 == "launch" then
            local v85 = p81.launch
            if v85 ~= nil then
                v85 = v85.landingPosition
            end
            local v86 = not v85
            if not v86 then
                local v87 = p81.launch
                if v87 ~= nil then
                    v87 = v87.duration
                end
                if v87 == 0 then
                    v87 = false
                elseif v87 ~= v87 then
                    v87 = false
                end
                v86 = not v87
                if not v86 then
                    local v88 = p81.launch
                    if v88 ~= nil then
                        v88 = v88.radius
                    end
                    if v88 == 0 then
                        v88 = false
                    elseif v88 ~= v88 then
                        v88 = false
                    end
                    v86 = not v88
                end
            end
            if v86 then
                return nil
            end
            p80:headBounceLaunch(p81.launch.landingPosition, p81.launch.radius, p81.launch.duration)
            return
        elseif v83 == "landed" then
            local v89 = p81.landed
            if v89 ~= nil then
                v89 = v89.landingPosition
            end
            if not v89 then
                return nil
            end
            p80:headBounceLandedEffect(v82, p81.landed.landingPosition)
            return
        elseif v83 == "reassemble" then
            local v90 = p81.reassemble
            if v90 ~= nil then
                v90 = v90.duration
            end
            if v90 == 0 or (v90 ~= v90 or not v90) then
                return nil
            end
            p80:headBounceReassemble(v82, p81.reassemble.duration)
        end
    else
        return nil
    end
end
function u38.headBounceDissassemble(u91, u92, p93) --[[ Line: 337 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u36
        [3] = u5
        [4] = u34
        [5] = u8
        [6] = u13
        [7] = u19
    --]]
    u92.Archivable = true
    local v94 = 0
    local v95 = {}
    for v96, v97 in u92:GetChildren() do
        local _ = v96 - 1
        if v97:IsA("BasePart") == true then
            v94 = v94 + 1
            v95[v94] = v97
        end
    end
    local v98 = u92:FindFirstChild("3DClothing")
    if v98 ~= nil then
        local v99 = 0
        v98 = {}
        for v100, v101 in v98:GetChildren() do
            local _ = v100 - 1
            if v101:IsA("BasePart") == true then
                v99 = v99 + 1
                v98[v99] = v101
            end
        end
    end
    local u102 = {}
    local u103 = {}
    local u104 = {}
    if v98 ~= nil then
        for v105, v106 in v98 do
            local _ = v105 - 1
            if v106.Name ~= "Head" then
                local v107 = v106:Clone()
                table.insert(u103, v107)
                v107:ClearAllChildren()
                v107.Parent = u22
                v107.Anchored = false
                v107.CanCollide = true
            end
        end
    end
    local function v118(p108) --[[ Line: 394 ]]
        --[[
        Upvalues:
            [1] = u102
            [2] = u104
            [3] = u22
            [4] = u103
            [5] = u36
        --]]
        if p108.Name == "HumanoidRootPart" then
            return nil
        end
        if p108.Name == "Head" then
            return nil
        end
        local v109 = p108:Clone()
        local v110 = u102
        table.insert(v110, v109)
        u104[v109] = p108
        v109:ClearAllChildren()
        v109.Parent = u22
        v109.Anchored = false
        v109.CanCollide = true
        local v111 = nil
        for v112, v113 in u103 do
            local _ = v112 - 1
            if v113.Name == p108.Name == true then
                v111 = v113
                break
            end
        end
        if v111 then
            local v114 = Instance.new("WeldConstraint")
            v114.Part0 = v111
            v114.Part1 = v109
            v114.Parent = v111
        end
        local v115 = u36.randomFloatMaxInclusive(-1, 1)
        local v116 = u36.randomFloatMaxInclusive(0, 1)
        local v117 = u36.randomFloatMaxInclusive
        v109:ApplyImpulse(Vector3.new(v115, v116, v117(-1, 1)).Unit * u36.randomFloatMaxInclusive(20, 32) * v109.Mass)
    end
    for v119, v120 in v95 do
        v118(v120, v119 - 1, v95)
    end
    u5:playSound(u34.SKELETON_KIT_DISASSEMBLE, {
        ["rollOffMaxDistance"] = 300,
        ["rollOffMinDistance"] = 20,
        ["position"] = u92:GetPivot().Position,
        ["parent"] = u92
    })
    u91.actionStateVariables.reviveStateData = {
        ["clonedBodyParts"] = u102,
        ["clonedClothingParts"] = u103,
        ["clonedBodyPartToOriginalMap"] = u104
    }
    local v121 = u92:FindFirstChild("Head")
    local u122
    if u92 == nil then
        u122 = u92
    else
        u122 = u92:FindFirstChild("HumanoidRootPart")
    end
    if v121 and u122 then
        local u123 = v121:Clone()
        u123.Anchored = false
        u123.CanCollide = false
        u123.CanTouch = false
        u123.CanQuery = false
        u123:SetAttribute("NoSuffocation", true)
        u123.Name = "SkeletonKit_HeadClone"
        for v124, v125 in u123:GetChildren() do
            local _ = v124 - 1
            if not v125:IsA("SpecialMesh") then
                v125:Destroy()
            end
        end
        u123.Parent = u22
        u91.actionStateVariables.reviveStateData.head = u123
        local v126 = u92:FindFirstChild("3DClothing")
        if v126 ~= nil then
            v126 = v126:FindFirstChild("Head")
        end
        if v126 then
            local v127 = v126:Clone()
            v127.CanCollide = false
            v127.CanTouch = false
            v127.CanQuery = false
            v127.Parent = u123
            v127.Name = "SkeletonKit_HeadClothingClone"
            u91.actionStateVariables.reviveStateData.headClothing = v127
            local v128 = Instance.new("WeldConstraint")
            v128.Part0 = v127
            v128.Part1 = u123
            v128.Parent = v127
        end
        u92.Archivable = false
        local u129 = {
            ["transparency"] = 1
        }
        u8.Controllers.CharacterTransparencyController:getTransparencyModifier(u92):addModifier(u129)
        if u92 ~= nil then
            u92:SetAttribute("DisableInvisibilityFootstepParticles", true)
        end
        local v130 = u13.new()
        v130:GiveTask(function() --[[ Line: 514 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u92
                [3] = u129
            --]]
            u8.Controllers.CharacterTransparencyController:getTransparencyModifier(u92):removeModifier(u129)
            local v131 = u92
            if v131 ~= nil then
                v131:SetAttribute("DisableInvisibilityFootstepParticles", false)
            end
        end)
        u91.actionStateVariables.reviveStateData.transparencyMaid = v130
        task.wait(p93)
        local u132 = nil
        u132 = u19.Heartbeat:Connect(function(_) --[[ Line: 525 ]]
            --[[
            Upvalues:
                [1] = u92
                [2] = u122
                [3] = u132
                [4] = u91
                [5] = u123
            --]]
            local v133 = u92
            if v133 ~= nil then
                v133 = v133.Parent
            end
            local v134 = v133 == nil
            if not v134 then
                local v135 = u122
                if v135 ~= nil then
                    v135 = v135.Parent
                end
                v134 = v135 == nil or u92.PrimaryPart == nil
            end
            if v134 then
                u132:Disconnect()
                return nil
            end
            local v136 = u122:GetPivot()
            local v137 = u91:getEntityHeightOffset() - u123.Size.Y / 2
            u123:PivotTo(v136 - Vector3.new(0, v137, 0))
        end)
        u91.actionStateVariables.reviveStateData.headFollowMaid = u13.new()
        local v138 = u91.actionStateVariables.reviveStateData.headFollowMaid
        if v138 ~= nil then
            v138:GiveTask(function() --[[ Line: 554 ]]
                --[[
                Upvalues:
                    [1] = u132
                --]]
                u132:Disconnect()
            end)
        end
    end
end
function u38.headBounceLaunch(p139, p140, p141, p142) --[[ Line: 560 ]]
    p139:telegraphCircle(p141, p140, p142)
end
function u38.headBounceLandedEffect(_, p143, p144) --[[ Line: 563 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u22
        [3] = u35
        [4] = u5
        [5] = u34
        [6] = u8
    --]]
    local v145 = u18.Assets.Effects.BlockStompShockwave:Clone()
    v145:PivotTo(CFrame.new(p144))
    v145.Parent = u22
    u35:scaleEffect({ v145 }, 4)
    u35:playEffects({ v145 }, nil, {
        ["destroyAfterSec"] = 3
    })
    u5:playSound(u34.BLOCK_KICKER_KIT_STOMP)
    u8.Controllers.ScreenShakeController:shake(p143:GetPivot().Position, Vector3.new(0, -1, 0), {
        ["magnitude"] = 2,
        ["cycles"] = 9,
        ["duration"] = 0.5,
        ["zMagnitude"] = 0.4
    })
end
function u38.headBounceReassemble(u146, p147, p148) --[[ Line: 579 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u34
        [3] = u23
        [4] = u11
    --]]
    if u146.actionStateVariables.reviveStateData == nil then
        return nil
    end
    local v149 = u146.actionStateVariables.reviveStateData.headFollowMaid
    if v149 ~= nil then
        v149:DoCleaning()
    end
    if u146.actionStateVariables.reviveStateData.head then
        u146.actionStateVariables.reviveStateData.head.CanCollide = false
        u146.actionStateVariables.reviveStateData.head.CanTouch = false
        u146.actionStateVariables.reviveStateData.head.CanQuery = false
        u146.actionStateVariables.reviveStateData.head.Anchored = true
    end
    local v150 = u146.actionStateVariables.reviveStateData.clonedBodyParts
    if v150 ~= nil then
        for v151, v152 in v150 do
            local _ = v151 - 1
            v152.CanCollide = false
            v152.CanTouch = false
            v152.CanQuery = false
            v152.Anchored = true
        end
    end
    local v153 = u146.actionStateVariables.reviveStateData.headFollowMaid
    if v153 ~= nil then
        v153:DoCleaning()
    end
    u5:playSound(u34.SKELETON_KIT_REASSEMBLE, {
        ["rollOffMaxDistance"] = 300,
        ["rollOffMinDistance"] = 20,
        ["position"] = p147:GetPivot().Position,
        ["parent"] = p147
    })
    local u154 = {}
    if u146.actionStateVariables.reviveStateData.head then
        u154[u146.actionStateVariables.reviveStateData.head] = u146.actionStateVariables.reviveStateData.head:GetPivot()
    end
    local v155 = u146.actionStateVariables.reviveStateData.clonedBodyParts
    if v155 ~= nil then
        for v156, v157 in v155 do
            local _ = v156 - 1
            u154[v157] = v157:GetPivot()
        end
    end
    local u158 = p147:FindFirstChild("Head")
    local v166 = u23(p148, u11, function(p159) --[[ Line: 638 ]]
        --[[
        Upvalues:
            [1] = u146
            [2] = u158
            [3] = u154
        --]]
        local v160 = u146.actionStateVariables.reviveStateData
        if v160 ~= nil then
            v160 = v160.head
        end
        local v161 = v160 and u158
        if v161 then
            v161 = u154[u146.actionStateVariables.reviveStateData.head] ~= nil
        end
        if v161 then
            u146.actionStateVariables.reviveStateData.head:PivotTo(u154[u146.actionStateVariables.reviveStateData.head]:Lerp(u158:GetPivot(), p159))
        end
        local v162 = u146.actionStateVariables.reviveStateData.clonedBodyParts
        if v162 ~= nil then
            for v163, v164 in v162 do
                local _ = v163 - 1
                local v165 = u146.actionStateVariables.reviveStateData.clonedBodyPartToOriginalMap
                if v165 ~= nil then
                    v165 = v165[v164]
                end
                if v165 then
                    v164:PivotTo(u154[v164]:Lerp(v165:GetPivot(), p159))
                end
            end
        end
    end, 0, 1):Play()
    task.wait(p148)
    v166:Cancel()
    local v167 = u146.actionStateVariables.reviveStateData.transparencyMaid
    if v167 ~= nil then
        v167:DoCleaning()
    end
    local v168 = u146.actionStateVariables.reviveStateData.head
    if v168 ~= nil then
        v168:Destroy()
    end
    local v169 = u146.actionStateVariables.reviveStateData.clonedBodyParts
    if v169 ~= nil then
        for v170, v171 in v169 do
            local _ = v170 - 1
            v171:Destroy()
        end
    end
    local v172 = u146.actionStateVariables.reviveStateData.clonedClothingParts
    if v172 ~= nil then
        for v173, v174 in v172 do
            local _ = v173 - 1
            v174:Destroy()
        end
    end
    u146.actionStateVariables.reviveStateData = nil
end
function u38.handleRandomWalk(p175, p176) --[[ Line: 708 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u13
        [3] = u14
    --]]
    local v177 = u16:GetTagged("SkeletonBoss")[1]
    if v177 then
        local v178 = v177.Humanoid:FindFirstChildOfClass("Animator")
        if v178 then
            if p176.start then
                local v179 = u13.new()
                local v180 = u14("Animation", {
                    ["AnimationId"] = p176.mode == "run" and "rbxassetid://507767714" or "rbxassetid://507777826"
                })
                v179:GiveTask(v180)
                local u181 = v178:LoadAnimation(v180)
                v179:GiveTask(u181)
                u181.Looped = true
                u181.Priority = Enum.AnimationPriority.Movement
                u181:Play()
                v179:GiveTask(function() --[[ Line: 728 ]]
                    --[[
                    Upvalues:
                        [1] = u181
                    --]]
                    u181:Stop()
                    u181:Destroy()
                end)
                p175.actionStateVariables.randomWalkAnimationMaid = v179
            else
                local v182 = p175.actionStateVariables.randomWalkAnimationMaid
                if v182 ~= nil then
                    v182:DoCleaning()
                end
                p175.actionStateVariables.randomWalkAnimationMaid = nil
            end
        else
            return nil
        end
    else
        return nil
    end
end
function u38.spawnBoneObstacle(u183, p184) --[[ Line: 741 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
        [3] = u22
        [4] = u5
        [5] = u34
        [6] = u18
        [7] = u4
        [8] = u23
        [9] = u12
        [10] = u17
        [11] = u31
    --]]
    local u185 = u13.new()
    local u186 = u14("Model", {
        ["Name"] = "WallModel",
        ["Parent"] = u22
    })
    local v187 = u14("Part", {
        ["Name"] = "WallPart",
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanTouch"] = true,
        ["CanQuery"] = false,
        ["Transparency"] = 1,
        ["Parent"] = u186
    })
    u186.PrimaryPart = v187
    u5:playSound(u34.HALLOWEEN_BOSS_FOG_LOOP, {
        ["rollOffMaxDistance"] = 400,
        ["volumeMultiplier"] = 0.8,
        ["parent"] = v187
    })
    local v188 = p184.travelDirection.X
    local v189 = math.abs(v188)
    local v190 = p184.travelDirection.Y
    local v191 = math.abs(v190)
    local v192 = p184.travelDirection.Z
    local v193 = math.abs(v192)
    local v194 = Vector3.new(v189, v191, v193)
    local v195 = p184.pos1 - p184.pos2
    local v196 = v195.X
    local v197 = math.abs(v196)
    local v198 = v195.Z
    local v199 = math.abs(v198)
    local v200 = Vector3.new(v197, 0, v199)
    local v201 = v200.X == 0 and 0 or 90
    v187.Size = v194 * 3.2 + v200 + Vector3.new(0, 2, 0)
    local v202 = p184.pos1:Lerp(p184.pos2, 0.5)
    local v203 = v187.Size.Y / 2
    local u204 = v202 + Vector3.new(0, v203, 0)
    v187.CFrame = CFrame.new(u204)
    u186:PivotTo(CFrame.new(u204))
    local v205 = false
    local v206 = 0
    while true do
        if v205 then
            v206 = v206 + 1
        else
            v205 = true
        end
        if v206 >= 8 then
            u4:setQueryIgnored(v187, true)
            u4:setQueryIgnored(u186, true)
            local v207 = p184.travelDistance / p184.travelSpeed
            local u208 = u204 + p184.travelDirection * p184.travelDistance
            local u210 = u23(v207, u12, function(p209) --[[ Line: 822 ]]
                --[[
                Upvalues:
                    [1] = u186
                    [2] = u204
                    [3] = u208
                --]]
                u186:PivotTo(CFrame.new(u204:Lerp(u208, p209)))
            end)
            u185:GiveTask(v187.Touched:Connect(function(p211) --[[ Line: 825 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u183
                    [3] = u5
                    [4] = u34
                    [5] = u31
                --]]
                local v212 = u17.LocalPlayer.Character
                if not v212 then
                    return nil
                end
                if not p211:IsDescendantOf(v212) then
                    return nil
                end
                if os.time() - u183.lastHitBoneObstacleTime < 1 then
                    return nil
                end
                u183.lastHitBoneObstacleTime = os.time()
                u5:playSound(u34.SKELETON_ATTACK_1)
                u31.Client:GetNamespace("Halloween2025Remotes"):Get("HitBoneObstacle"):SendToServer()
            end))
            task.spawn(function() --[[ Line: 840 ]]
                --[[
                Upvalues:
                    [1] = u210
                    [2] = u186
                    [3] = u185
                --]]
                u210:Wait()
                u186:Destroy()
                u185:DoCleaning()
            end)
            return
        end
        local v213 = u18.Assets.Misc.Bone:Clone()
        v213.Size = v213.Size * 3
        local v214 = v201 ~= 90 and 0 or v206 * 18
        local v215 = v201 == 90 and 0 or v206 * 18
        v213.Position = u204 + Vector3.new(v214, 0, v215)
        v213.Rotation = Vector3.new(90, 0, v201)
        v213.Parent = v187
        u14("WeldConstraint", {
            ["Part0"] = v187,
            ["Part1"] = v213,
            ["Parent"] = v187
        })
        u4:setQueryIgnored(v213, true)
        local v216 = u18.Assets.Misc.Bone:Clone()
        v216.Size = v216.Size * 3
        local v217 = v201 ~= 90 and 0 or -v206 * 18
        local v218 = v201 == 90 and 0 or -v206 * 18
        v216.Position = u204 + Vector3.new(v217, 0, v218)
        v216.Rotation = Vector3.new(90, 0, v201)
        v216.Parent = v187
        u14("WeldConstraint", {
            ["Part0"] = v187,
            ["Part1"] = v216,
            ["Parent"] = v187
        })
        u4:setQueryIgnored(v216, true)
    end
end
function u38.setupSceneLighting(_) --[[ Line: 846 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u24
    --]]
    u8.Controllers.EnvironmentController:setupEnvironment(u24, 100)
end
function u38.routeBossAction(p219, p220, p221) --[[ Line: 849 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u16
        [3] = u5
        [4] = u34
        [5] = u27
        [6] = u26
    --]]
    if p220 == u32.HEAD_BOUNCE then
        p219:handleHeadBounce(p221)
        return
    elseif p220 == u32.RANDOM_WALK then
        p219:handleRandomWalk(p221)
        return
    elseif p220 == u32.BONE_THROW then
        local v222 = u16:GetTagged("SkeletonBoss")[1]
        if not v222 then
            return nil
        end
        local v223 = v222.Humanoid:FindFirstChildOfClass("Animator")
        if not v223 then
            return nil
        end
        u5:playSound(u34.WITCH_BROOM_DISMOUNT, {
            ["rollOffMinDistance"] = 360,
            ["rollOffMaxDistance"] = 500,
            ["parent"] = v222
        })
        u27:playAnimation(v223, u26.SPEAR_THROW, {
            ["speed"] = 1.2
        })
        return
    elseif p220 == u32.GAS_CLOUD_CURSE then
        local v224 = u16:GetTagged("SkeletonBoss")[1]
        if not v224 then
            return nil
        end
        local v225 = v224.Humanoid:FindFirstChildOfClass("Animator")
        if not v225 then
            return nil
        end
        u27:playAnimation(v225, u26.WAND_CAST, {
            ["speed"] = 1
        })
    elseif p220 == u32.BONE_OBSTACLE then
        if not u16:GetTagged("SkeletonBoss")[1] then
            return nil
        end
        p219:spawnBoneObstacle(p221)
    end
end
function u38.telegraphCircle(_, p226, p227, p228, p229) --[[ Line: 905 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u22
        [3] = u14
        [4] = u21
    --]]
    local v230 = p229 == nil and 0.75 or p229
    local u231 = u13.new()
    local v232 = {}
    local v233 = v230 / 2
    local v234 = Vector3.new(0, v233, 0)
    v232.CFrame = CFrame.new(p227 + v234) * CFrame.Angles(0, 0, 1.5707963267948966)
    v232.Anchored = true
    v232.CanCollide = false
    v232.CanQuery = false
    v232.Shape = Enum.PartType.Cylinder
    local v235 = p226 * 2
    local v236 = p226 * 2
    v232.Size = Vector3.new(v230, v235, v236)
    v232.Material = Enum.Material.ForceField
    v232.Transparency = 0.2
    v232.Color = Color3.fromRGB(255, 41, 0)
    v232.Parent = u22
    local v237 = u14("Part", v232)
    u231:GiveTask(v237)
    local v238 = v237:Clone()
    v238.Material = Enum.Material.Neon
    v238.Size = Vector3.new(0.6, 0, 0)
    v238.Transparency = 0.6
    v238.Parent = u22
    u231:GiveTask(v238)
    local v239 = u21:Create(v238, TweenInfo.new(p228), {
        ["Size"] = v237.Size
    })
    v239.Completed:Connect(function() --[[ Line: 937 ]]
        --[[
        Upvalues:
            [1] = u231
        --]]
        u231:DoCleaning()
    end)
    v239:Play()
end
function u38.getEntityHeightOffset(p240) --[[ Line: 942 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    if p240.entityHeightOffset == nil then
        local v241 = u16:GetTagged("SkeletonBoss")[1]
        if not (v241 and v241.PrimaryPart) then
            return 0
        end
        p240.entityHeightOffset = v241.Humanoid.HipHeight + v241.PrimaryPart.Size.Y / 2
    end
    return p240.entityHeightOffset
end
u8.CreateController(u38.new())
return nil