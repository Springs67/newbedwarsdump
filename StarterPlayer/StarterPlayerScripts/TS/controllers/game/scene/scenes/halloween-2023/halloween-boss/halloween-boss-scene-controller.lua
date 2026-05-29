local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.SoundManager
local u5 = v2.WatchCollectionTag
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.CollectionService
local u10 = v8.ReplicatedStorage
local u11 = v8.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "viewmodel", "viewmodel-mode").ViewmodelMode
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent, "base-scene-controller").BaseSceneController
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "HalloweenBossSceneController"
    end,
    ["__index"] = u21
})
u22.__index = u22
function u22.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u19
        [3] = u7
    --]]
    u21.constructor(p25, u19.HALLOWEEN_BOSS)
    p25.Name = "HalloweenBossSceneController"
    p25.sceneLightingMaid = u7.new()
    p25.sceneLightingModifiers = {}
    p25.musicTracks = {}
    p25.cryptBossSetup = false
end
function u22.KnitStart(p26) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.KnitStart(p26)
end
function u22.onSceneLoadingScreenStart(_) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u14
        [3] = u20
    --]]
    u6.Controllers.PreloadController:runPreload({
        ["animations"] = {
            u14.HALLOWEEN_BOSS_SPAWN,
            u14.HALLOWEEN_BOSS_IDLE,
            u14.HALLOWEEN_BOSS_DEATH,
            u14.WARLOCK_ENTER_SCENE,
            u14.WARLOCK_CHARGE_UP,
            u14.WARLOCK_FORWARD_CAST,
            u14.WARLOCK_IDLE
        },
        ["sounds"] = {
            u20.DARK_BOLT_SHOOT,
            u20.MAGIC_CIRCLE_SPAWN,
            u20.MAGIC_CIRCLE_FLAME_ERUPT,
            u20.DEATH_FINAL,
            u20.WEREWOLF_HEARTBEAT,
            u20.NEW_EMERALD_PICKUP,
            u20.EMERALD_GENERATOR_AURA,
            u20.GHOST_VACUUM_CATCH,
            u20.HALLOWEEN_BOSS_SPAWN
        }
    })
end
function u22.onSceneStart(u27) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u17
        [3] = u18
        [4] = u11
        [5] = u9
        [6] = u4
        [7] = u20
        [8] = u15
        [9] = u14
        [10] = u10
        [11] = u6
        [12] = u12
        [13] = u5
        [14] = u16
        [15] = u3
    --]]
    local u28 = nil
    u13.On(function(p29, _, _, _, _, _, _, _, _, _, _, _, _, _) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u17
        --]]
        local v30 = u28
        if v30 then
            local v31 = u28
            if v31 ~= nil then
                v31 = v31.Name
            end
            v30 = v31 == p29.Name
        end
        if v30 then
            return nil
        end
        if p29:GetAttribute("MonsterType") ~= u17.HALLOWEEN_BOSS then
            return nil
        end
        u28 = p29:Clone()
    end)
    u18.Client:Get("EntityDeathEvent"):Connect(function(p32) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u28
            [3] = u11
            [4] = u9
            [5] = u4
            [6] = u20
            [7] = u15
            [8] = u14
            [9] = u10
        --]]
        if p32.entityInstance:GetAttribute("MonsterType") ~= u17.HALLOWEEN_BOSS then
            return nil
        end
        if not u28 then
            return nil
        end
        u28.Parent = u11
        local u33 = u28:GetPrimaryPartCFrame()
        local v34 = p32.entityInstance
        local u35 = u9:HasTag(v34, "WarlockBoss")
        if u9:HasTag(v34, "CryptBoss") then
            u4:playSound(u20.DEATH_FINAL, {
                ["volumeMultiplier"] = 5
            })
            local u36 = u4:playSound(u20.WEREWOLF_HEARTBEAT, {
                ["volumeMultiplier"] = 5,
                ["looped"] = true
            })
            task.delay(5, function() --[[ Line: 97 ]]
                --[[
                Upvalues:
                    [1] = u36
                --]]
                local v37 = u36
                if v37 ~= nil then
                    v37:Destroy()
                end
            end)
        end
        local v38 = u28:FindFirstChild("Humanoid")
        if v38 ~= nil then
            v38 = v38:FindFirstChild("Animator")
        end
        if v38 then
            u15:playAnimation(v38, u14.HALLOWEEN_BOSS_IDLE, {
                ["fadeInTime"] = 0.02
            })
            local v39 = u15:playAnimation(v38, u14.HALLOWEEN_BOSS_DEATH)
            if v39 ~= nil then
                v39.Stopped:Connect(function() --[[ Line: 116 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                        [2] = u35
                        [3] = u10
                        [4] = u33
                        [5] = u11
                        [6] = u4
                        [7] = u20
                    --]]
                    local v40 = u28
                    if v40 ~= nil then
                        v40:Destroy()
                    end
                    if u35 then
                        local v41 = u10.Assets.Misc.CryptRewards:GetChildren()
                        local v42 = 0
                        local v43 = 0
                        for _, v44 in v41 do
                            if v44:IsA("BasePart") then
                                local v45 = v44:Clone()
                                v45.Position = u33.Position
                                v45.Parent = u11
                                local v46 = math.cos(v42) * 55
                                local v47 = math.sin(v42) * 55
                                v45.Velocity = Vector3.new(v46, 55, v47)
                                v42 = v42 + 6.283185307179586 / #v41
                                u4:playSound(u20.NEW_EMERALD_PICKUP, {
                                    ["playbackSpeedMultiplier"] = 1.1 - v43 * 0.1
                                })
                                v43 = v43 + 1
                                u4:playSound(u20.EMERALD_GENERATOR_AURA, {
                                    ["rollOffMaxDistance"] = 120,
                                    ["rollOffMinDistance"] = 30,
                                    ["volumeMultiplier"] = 1.5,
                                    ["parent"] = v45
                                })
                                task.wait(0.15)
                            end
                        end
                        task.wait(0.1)
                        u4:playSound(u20.GHOST_VACUUM_CATCH, {
                            ["playbackSpeedMultiplier"] = 1.1 - v43 * 0.1
                        })
                        local v48 = u10.Assets.Misc.CryptRewards:FindFirstChildWhichIsA("Model"):Clone()
                        v48.Parent = u11
                        v48:PivotTo(u33)
                        v48.PrimaryPart.Velocity = Vector3.new(0, 55, 0)
                    end
                end)
            end
        end
    end)
    u6.Controllers.ViewmodelController:setViewModelMode(u12.SHOW_ARMS)
    local v49 = u4:playModifiableSound(u20.HALLOWEEN_BOSS_AMBIENT_LOOP, {
        ["fadeInTime"] = 10,
        ["looped"] = true,
        ["volumeMultiplier"] = 0.7
    })
    if v49 then
        local v50 = u27.musicTracks
        table.insert(v50, v49)
    end
    task.delay(10, function() --[[ Line: 169 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u20
            [3] = u27
        --]]
        local v51 = u4:playModifiableSound(u20.HALLOWEEN_2022_BOSS_MUSIC, {
            ["fadeInTime"] = 6,
            ["looped"] = true
        })
        if v51 then
            local v52 = u27.musicTracks
            table.insert(v52, v51)
        end
    end)
    u27:setupSceneLighting()
    u5("CryptBoss", function(u53) --[[ Line: 179 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u16
            [3] = u6
            [4] = u3
            [5] = u4
            [6] = u20
            [7] = u15
            [8] = u14
        --]]
        if u27.cryptBossSetup then
            return nil
        end
        u27.cryptBossSetup = true
        task.delay(1.5, function() --[[ Line: 184 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u53
                [3] = u6
                [4] = u3
            --]]
            local v54 = u16:getEntity(u53)
            if v54 then
                u6.Controllers.BossBarController:mountEntityBossBar(v54, {
                    ["DisplayName"] = "CRYPT",
                    ["Gradient"] = ColorSequence.new(u3.hexColor(62207), u3.hexColor(4456334))
                })
            end
        end)
        local v55 = u4
        local v56 = u20.HALLOWEEN_BOSS_SPAWN
        local v57 = {}
        local v58 = u53:FindFirstChildWhichIsA("BasePart")
        if v58 ~= nil then
            v58 = v58.Position
        end
        v57.position = v58
        v57.rollOffMaxDistance = 400
        v57.rollOffMinDistance = 60
        v55:playSound(v56, v57)
        local v59 = u53:WaitForChild("Humanoid"):WaitForChild("Animator")
        local v60 = u15:playAnimation(v59, u14.HALLOWEEN_BOSS_IDLE, {
            ["looped"] = true
        })
        if v60 then
            v60.Priority = Enum.AnimationPriority.Idle
        end
        u15:playAnimation(v59, u14.HALLOWEEN_BOSS_SPAWN)
        u53.Destroying:Once(function() --[[ Line: 213 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            u6.Controllers.BossBarController:unmountBar()
        end)
    end)
    u5("WarlockBoss", function(u61) --[[ Line: 217 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u6
            [3] = u3
            [4] = u4
            [5] = u20
            [6] = u15
            [7] = u14
        --]]
        task.delay(1.5, function() --[[ Line: 218 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u61
                [3] = u6
                [4] = u3
            --]]
            local v62 = u16:getEntity(u61)
            if v62 then
                u6.Controllers.BossBarController:mountEntityBossBar(v62, {
                    ["DisplayName"] = "ELDRIC",
                    ["Gradient"] = ColorSequence.new(u3.hexColor(62207), u3.hexColor(4456334))
                })
            end
        end)
        local v63 = u4
        local v64 = u20.HALLOWEEN_BOSS_SPAWN
        local v65 = {}
        local v66 = u61:FindFirstChildWhichIsA("BasePart")
        if v66 ~= nil then
            v66 = v66.Position
        end
        v65.position = v66
        v65.rollOffMaxDistance = 400
        v65.rollOffMinDistance = 60
        v63:playSound(v64, v65)
        local v67 = u61:WaitForChild("Humanoid"):WaitForChild("Animator")
        local v68 = u15:playAnimation(v67, u14.WARLOCK_IDLE, {
            ["looped"] = true
        })
        if v68 then
            v68.Priority = Enum.AnimationPriority.Idle
        end
        u15:playAnimation(v67, u14.WARLOCK_ENTER_SCENE)
    end)
end
function u22.onSceneShutdown(p69) --[[ Line: 249 ]]
    p69.sceneLightingMaid:DoCleaning()
end
function u22.setupSceneLighting(u70) --[[ Line: 252 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u70.sceneLightingModifiers = {
        u6.Controllers.LightingController.lightingModifier:addModifier(20, {
            ["Brightness"] = 15,
            ["EnvironmentDiffuseScale"] = 0,
            ["EnvironmentSpecularScale"] = 1,
            ["GlobalShadows"] = true,
            ["ShadowSoftness"] = 0.43,
            ["TimeOfDay"] = "00:00:00",
            ["GeographicLatitude"] = 223,
            ["ExposureCompensation"] = 0,
            ["ClockTime"] = 0,
            ["Ambient"] = Color3.fromRGB(31, 30, 44),
            ["ColorShift_Bottom"] = Color3.fromRGB(255, 255, 255),
            ["ColorShift_Top"] = Color3.fromRGB(69, 78, 255),
            ["OutdoorAmbient"] = Color3.fromRGB(40, 46, 54)
        }),
        u6.Controllers.LightingController.atmosphereModifier:addModifier(20, {
            ["Density"] = 0.365,
            ["Offset"] = 0.284,
            ["Glare"] = 5.85,
            ["Haze"] = 0.75,
            ["Color"] = Color3.fromRGB(141, 141, 199),
            ["Decay"] = Color3.fromRGB(76, 82, 136)
        }),
        u6.Controllers.LightingController.skyModifier:addModifier(20, {
            ["CelestialBodiesShown"] = true,
            ["MoonAngularSize"] = 11,
            ["MoonTextureId"] = "rbxasset://sky/moon.jpg",
            ["SkyboxBk"] = "rbxassetid://10290026331",
            ["SkyboxDn"] = "rbxassetid://10290026184",
            ["SkyboxFt"] = "rbxassetid://10290026023",
            ["SkyboxLf"] = "rbxassetid://10290025786",
            ["SkyboxRt"] = "rbxassetid://10290025545",
            ["SkyboxUp"] = "rbxassetid://10290025302",
            ["StarCount"] = 3000,
            ["SunAngularSize"] = 21,
            ["SunTextureId"] = "rbxasset://sky/sun.jpg"
        }),
        u6.Controllers.LightingController.colorCorrectionModifier:addModifier(20, {
            ["Brightness"] = 0.05,
            ["Contrast"] = 0.01,
            ["Saturation"] = 0.2,
            ["TintColor"] = Color3.fromRGB(255, 255, 255)
        })
    }
    for v71, v72 in u70.sceneLightingModifiers do
        local _ = v71 - 1
        u70.sceneLightingMaid:GiveTask(v72)
    end
    u70.sceneLightingMaid:GiveTask(function() --[[ Line: 300 ]]
        --[[
        Upvalues:
            [1] = u70
        --]]
        u70.sceneLightingModifiers = {}
    end)
end
function u22.disableMusic(p73) --[[ Line: 304 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    for _, v74 in p73.musicTracks do
        u4:tweenSoundVolume(v74, 0, 1.5)
    end
end
u6.CreateController(u22.new())
return nil