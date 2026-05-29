local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.DeviceUtil
local u5 = v2.RandomUtil
local u6 = v2.SoundManager
local u7 = v2.WatchCollectionTag
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.CollectionService
local u17 = v15.Players
local u18 = v15.ReplicatedStorage
local u19 = v15.SoundService
local u20 = v15.TweenService
local u21 = v15.Workspace
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u24 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "fade", "fade-util").FadeUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-stage-config").HalloweenStageConfig
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u33 = v1.import(script, script.Parent.Parent.Parent.Parent, "base-scene-controller").BaseSceneController
local u34 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "halloween-quest-tracker").HalloweenQuestTracker
local u35 = v1.import(script, script.Parent.Parent.Parent, "halloween-2024", "environments", "halloween-stage2-environment").STAGE_2_ENVRIONMENT
local u36 = { u32.SPIDER_ATTACK_1, u32.SPIDER_ATTACK_2, u32.SPIDER_ATTACK_3 }
local u37 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 47 ]]
        return "Halloween2025Stage2SceneController"
    end,
    ["__index"] = u33
})
u37.__index = u37
function u37.new(...) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u37
    --]]
    local v38 = u37
    local v39 = setmetatable({}, v38)
    return v39:constructor(...) or v39
end
function u37.constructor(p40) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u33
        [2] = u31
        [3] = u12
    --]]
    u33.constructor(p40, u31.HALLOWEEN_2025_STAGE_2)
    p40.Name = "Halloween2025Stage2Scene"
    p40.sceneMaid = u12.new()
end
function u37.KnitStart(p41) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    u33.KnitStart(p41)
end
function u37.onSceneLoadingScreenStart(_) --[[ Line: 65 ]] end
function u37.onSceneStart(u42) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u35
        [3] = u7
        [4] = u6
        [5] = u32
        [6] = u23
        [7] = u17
        [8] = u16
        [9] = u30
        [10] = u3
        [11] = u26
        [12] = u25
        [13] = u18
        [14] = u21
        [15] = u20
        [16] = u5
        [17] = u27
        [18] = u14
        [19] = u34
        [20] = u36
    --]]
    u42:setupSoundAmbience()
    u42:setUpDoorPrompt()
    u9.Controllers.EnvironmentController:setupEnvironment(u35)
    u7("hanging", function(p43) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u32
        --]]
        local v44 = p43.PrimaryPart
        if v44 ~= nil then
            v44 = v44.Position
        end
        if v44 then
            u6:playSound(u32.SKELETON_EMERGE, {
                ["position"] = v44
            })
        end
    end)
    u23.ProjectileHit:connect(function(p45) --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u16
            [3] = u6
            [4] = u32
        --]]
        if p45:isCancelled() then
            return nil
        end
        local v46 = p45.shooter
        if v46 ~= nil then
            v46 = v46:getInstance()
        end
        local v47 = v46 == u17.LocalPlayer.Character
        if v47 then
            v47 = p45.hitData.part
            if v47 then
                v47 = u16:HasTag(p45.hitData.part, "FloatingRock")
            end
        end
        if v47 then
            u6:playSound(u32.ROCK_CRUMBLE_2)
        end
    end)
    u30.Client:Get("HangingSkeletonAttack"):Connect(function(p48) --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u26
            [3] = u25
            [4] = u6
            [5] = u32
        --]]
        local v49 = p48.target.PrimaryPart
        if v49 ~= nil then
            v49 = v49.Position
        end
        local v50 = p48.guardian.PrimaryPart
        if v50 ~= nil then
            v50 = v50.Position
        end
        if not (v49 and v50) then
            return nil
        end
        local v51 = v49 * Vector3.new(1, 0, 1)
        local v52 = v50.Y
        local v53 = Vector3.new(0, v52, 0)
        p48.guardian.PrimaryPart.CFrame = CFrame.new(v50, v51 + v53)
        u3:playAnimation(p48.guardian, u26:getAssetId(u25.GREAT_HAMMER_SWING_1))
        u6:playSound(u32.SKELETON_ATTACK_1, {
            ["position"] = v50
        })
    end)
    u30.Client:Get("FloatingRockHit"):Connect(function(p54) --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        if p54.target then
            u42:rockFallAnimation(p54.rock, p54.target)
        else
            u42:rockShakeAnimation(p54.rock)
        end
    end)
    u30.Client:Get("SpiderCacoonHit"):Connect(function(p55) --[[ Line: 137 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u21
        --]]
        local v56 = p55.position
        if v56 then
            local u57 = u18.Assets.Effects.SpiderWebDebris:Clone()
            u57.Parent = u21
            u57:PivotTo(CFrame.new(v56))
            for v58, v59 in u57:GetChildren() do
                local _ = v58 - 1
                if v59:IsA("Part") or v59:IsA("MeshPart") then
                    v59.Anchored = false
                end
            end
            task.delay(2, function() --[[ Line: 152 ]]
                --[[
                Upvalues:
                    [1] = u57
                --]]
                u57:Destroy()
            end)
        end
    end)
    u23.ProjectileHit:connect(function(p60) --[[ Line: 157 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u16
            [3] = u6
            [4] = u32
        --]]
        if p60:isCancelled() then
            return nil
        end
        local v61 = p60.shooter
        if v61 ~= nil then
            v61 = v61:getInstance()
        end
        local v62 = v61 == u17.LocalPlayer.Character
        if v62 then
            v62 = p60.hitData.part
            if v62 then
                v62 = u16:HasTag(p60.hitData.part, "FloatingRock")
            end
        end
        if v62 then
            u6:playSound(u32.ROCK_CRUMBLE_2)
        end
    end)
    u30.Client:Get("SpiderEggBreak"):Connect(function(p63) --[[ Line: 173 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u21
            [3] = u6
            [4] = u32
        --]]
        local u64 = u18.Assets.Effects.EggExplosion:Clone()
        u64.Parent = u21
        u64.Position = p63.position
        u6:playSound(u32.GLUE_ENCHANT_02, {
            ["rollOffMaxDistance"] = 220,
            ["volumeMultiplier"] = 2,
            ["position"] = p63.position
        })
        for v65, v66 in u64:GetDescendants() do
            local _ = v65 - 1
            if v66:IsA("ParticleEmitter") then
                v66:Emit(30)
            end
        end
        task.delay(0.7, function() --[[ Line: 191 ]]
            --[[
            Upvalues:
                [1] = u64
            --]]
            u64:Destroy()
        end)
    end)
    u30.Client:Get("SpiderGuardianAction"):Connect(function(u67) --[[ Line: 195 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u3
            [3] = u26
            [4] = u25
            [5] = u6
            [6] = u32
            [7] = u42
            [8] = u9
        --]]
        local v68 = u67.target
        if v68 ~= nil then
            v68 = v68.PrimaryPart
            if v68 ~= nil then
                v68 = v68.Position
            end
        end
        if v68 then
            v68 = u67.guardian.PrimaryPart
            if v68 ~= nil then
                v68 = v68.Position
            end
        end
        if v68 then
            local v69 = u20
            local v70 = u67.guardian.PrimaryPart
            local v71 = TweenInfo.new(0.3)
            local v72 = {}
            local v73 = u67.guardian.PrimaryPart.Position
            local v74 = u67.target.PrimaryPart.Position
            local v75 = u67.guardian.PrimaryPart.Position.Y
            local v76 = Vector3.new(0, v75, 0)
            v72.CFrame = CFrame.new(v73, v74 * Vector3.new(1, 0, 1) + v76)
            v69:Create(v70, v71, v72):Play()
        end
        local v77 = u67.action
        if v77 == "MELEE" then
            u3:playAnimation(u67.guardian, u26:getAssetId(u25.WARRIOR_SPIDER_ATTACK_1))
            local v78 = u6
            local v79 = u32.SPIDER_ATTACK_2
            local v80 = {}
            local v81 = u67.guardian.PrimaryPart
            if v81 ~= nil then
                v81 = v81.Position
            end
            v80.position = v81
            v80.volumeMultiplier = 1
            v80.rollOffMaxDistance = 220
            v80.rollOffMinDistance = 110
            v78:playSound(v79, v80)
        elseif v77 == "RANGE" then
            if u67.target then
                u42:rangeAttackAnimation(u67.guardian, u67.target)
                return
            end
        elseif v77 == "ABILITY" then
            local v82 = u6
            local v83 = u32.SPIDER_ATTACK_3
            local v84 = {}
            local v85 = u67.guardian.PrimaryPart
            if v85 ~= nil then
                v85 = v85.Position
            end
            v84.position = v85
            v84.volumeMultiplier = 1
            v84.rollOffMaxDistance = 220
            v84.rollOffMinDistance = 110
            v82:playSound(v83, v84)
            u3:playAnimation(u67.guardian, u26:getAssetId(u25.WARRIOR_SPIDER_ATTACK_2))
            task.delay(1, function() --[[ Line: 264 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u67
                --]]
                u9.Controllers.ScreenShakeController:shake(u67.guardian.PrimaryPart.Position, Vector3.new(0, -1, 0), {
                    ["magnitude"] = 1,
                    ["cycles"] = 4,
                    ["duration"] = 0.3
                })
            end)
            return
        end
    end)
    u30.Client:Get("StageTwoGateOpen"):Connect(function() --[[ Line: 275 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        u42:gateOpenCutScene()
    end)
    u7("FloatingRock", function(u86) --[[ Line: 279 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u6
            [3] = u5
            [4] = u32
            [5] = u18
        --]]
        task.spawn(function() --[[ Line: 280 ]]
            --[[
            Upvalues:
                [1] = u86
                [2] = u21
                [3] = u6
                [4] = u5
                [5] = u32
                [6] = u18
            --]]
            task.wait(math.random() * 20)
            while true do
                local v87 = task.wait(math.random() * 5 + 20)
                if v87 ~= 0 and (v87 == v87 and v87) then
                    v87 = u86:IsDescendantOf(u21)
                end
                if v87 == 0 or (v87 ~= v87 or not v87) then
                    return
                end
                local v88 = u6
                local v89 = u5.fromList
                local v90 = { u32.ROCK_CRUMBLE_1, u32.ROCK_CRUMBLE_2, u32.ROCK_CRUMBLE_3 }
                v88:playSound(v89(unpack(v90)), {
                    ["volumeMultiplier"] = 0.5,
                    ["rollOffMaxDistance"] = 110,
                    ["rollOffMinDistance"] = 50,
                    ["position"] = u86.Position
                })
                local u91 = u18.Assets.Effects.FallingRockEffect:Clone()
                u91:PivotTo(u86.CFrame)
                u91.Parent = u21
                for v92, v93 in u91:GetChildren() do
                    local _ = v92 - 1
                    if v93:IsA("Part") or v93:IsA("WedgePart") then
                        v93.Anchored = false
                    end
                end
                task.delay(2, function() --[[ Line: 308 ]]
                    --[[
                    Upvalues:
                        [1] = u91
                    --]]
                    u91:Destroy()
                end)
            end
        end)
    end)
    u7("SpitterSpider", function(p94) --[[ Line: 314 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        local v95 = p94:GetAttribute("StringAttached")
        if v95 ~= 0 and (v95 == v95 and (v95 ~= "" and v95)) then
            local v96 = u18.Assets.Effects.SpiderString:Clone()
            local v97 = p94.PrimaryPart
            if v97 ~= nil then
                v97 = v97.Position
            end
            if not v97 then
                return nil
            end
            v96.Position = v97 + Vector3.new(0, 4, 0)
            v96.Parent = p94
        end
    end)
    local v98 = {
        {
            ["completed"] = false,
            ["description"] = "Collect and place Crystals on the Door",
            ["currentProgress"] = 0,
            ["totalProgress"] = u27.STAGE2_CRYSTAL_AMOUNT
        }
    }
    local v99 = u21.CurrentCamera
    if v99 ~= nil then
        v99 = v99.ViewportSize.Y
    end
    local v100 = v99 == nil and 374 or v99
    local u101 = u14.mount(u14.createElement(u34, {
        ["CurrentTasks"] = v98,
        ["ScreenSizeY"] = v100
    }), u17.LocalPlayer:WaitForChild("PlayerGui"))
    u42.sceneMaid:GiveTask(function() --[[ Line: 351 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u101
        --]]
        u14.unmount(u101)
    end)
    u30.Client:Get("WarriorSpiderAttack"):Connect(function(p102) --[[ Line: 354 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u5
            [3] = u36
            [4] = u3
            [5] = u26
            [6] = u25
        --]]
        local v103 = p102.model.PrimaryPart
        if v103 ~= nil then
            v103 = v103.Position
        end
        if v103 then
            local v104 = u36
            u6:playSound(u5.fromList(unpack(v104)), {
                ["volumeMultiplier"] = 0.7,
                ["rollOffMaxDistance"] = 110,
                ["rollOffMinDistance"] = 50,
                ["position"] = v103
            })
        end
        u3:playAnimation(p102.model, u26:getAssetId(u25.WARRIOR_SPIDER_ATTACK_1))
    end)
    u30.Client:Get("EntityDeathEvent"):Connect(function(p105) --[[ Line: 370 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u26
            [3] = u25
            [4] = u6
            [5] = u32
        --]]
        if u16:HasTag(p105.entityInstance, "door-guardian") then
            u26:playAnimation(p105.entityInstance, u25.SPIDER_GUARD_DEATH)
            u6:playSound(u32.SPIDER_GUARD_DEATH, {
                ["volumeMultiplier"] = 1.5
            })
        end
        if u16:HasTag(p105.entityInstance, "WoodBox") then
            u6:playSound(u32.LASER_PICKAXE_WOOD_BREAK_4, {
                ["volumeMultiplier"] = 1,
                ["rollOffMaxDistance"] = 110,
                ["rollOffMinDistance"] = 50,
                ["position"] = p105.cframe.Position
            })
            if p105.entityInstance.PrimaryPart then
                p105.entityInstance.PrimaryPart.Transparency = 1
                p105.entityInstance.PrimaryPart.CanCollide = false
                for v106, v107 in p105.entityInstance.PrimaryPart:GetDescendants() do
                    local _ = v106 - 1
                    if v107:IsA("Part") then
                        local v108 = math.random()
                        local v109 = math.random()
                        local v110 = math.random
                        v107:ApplyImpulse((Vector3.new(v108, v109, v110())))
                    end
                end
            end
        end
    end)
end
function u37.onSceneShutdown(p111) --[[ Line: 400 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    p111.sceneMaid:DoCleaning()
    u9.Controllers.TreasureChestController:cleanUp()
end
function u37.setupSoundAmbience(p112) --[[ Line: 404 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u6
        [3] = u32
        [4] = u10
    --]]
    local u113 = u19.AmbientReverb
    u19.AmbientReverb = Enum.ReverbType.Cave
    p112.sceneMaid:GiveTask(function() --[[ Line: 407 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u113
        --]]
        u19.AmbientReverb = u113
    end)
    local u114 = u6:playModifiableSound(u32.CAVE_AMBIENCE, {
        ["volumeMultiplier"] = 1.3,
        ["looped"] = true
    })
    p112.sceneMaid:GiveTask(function() --[[ Line: 415 ]]
        --[[
        Upvalues:
            [1] = u114
        --]]
        u114:Stop()
        u114:Destroy()
    end)
    local v115 = u10.Controllers.FootstepsController.footstepModifier
    local v116 = {
        ["soundConfig"] = {
            ["walk"] = {
                u32.FOOTSTEP_CAVES_1,
                u32.FOOTSTEP_CAVES_2,
                u32.FOOTSTEP_CAVES_3,
                u32.FOOTSTEP_CAVES_4
            },
            ["run"] = {
                u32.FOOTSTEP_CAVES_1,
                u32.FOOTSTEP_CAVES_2,
                u32.FOOTSTEP_CAVES_3,
                u32.FOOTSTEP_CAVES_4
            }
        }
    }
    v115:addModifier(v116)
end
function u37.setUpDoorPrompt(p117) --[[ Line: 427 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u10
        [3] = u4
        [4] = u28
        [5] = u29
        [6] = u30
    --]]
    local v118 = u16:GetTagged("Door")
    if #v118 == 0 then
        return nil
    end
    local u119 = v118[1]
    if u119:IsA("Part") then
        p117.door = u119
    end
    local v120 = u119:FindFirstChildOfClass("Folder")
    local u121 = {}
    if v120 ~= nil then
        for v122, v123 in v120:GetChildren() do
            local _ = v122 - 1
            if v123:IsA("MeshPart") then
                table.insert(u121, v123)
            end
        end
    end
    local u124 = 0
    u119:GetAttributeChangedSignal("CrystalCount"):Connect(function() --[[ Line: 452 ]]
        --[[
        Upvalues:
            [1] = u119
            [2] = u121
            [3] = u124
        --]]
        local v125 = u119:GetAttribute("CrystalCount")
        local v126 = 100 - v125
        local v127 = math.max(0, v126) / 5.555555555555555
        local v128 = math.floor(v127)
        while v128 < #u121 and (#u121 ~= 1 or v125 >= 100) do
            local v129 = #u121
            local v130 = u121[v129]
            u121[v129] = nil
            if v130 then
                v130.Material = Enum.Material.Neon
                v130.Transparency = 0
            end
        end
        u124 = v125
    end)
    u10.Controllers.ProximityPromptController:createProximityPrompt({
        ["ActionText"] = "Put in Crystals",
        ["RequiresLineOfSight"] = false,
        ["MaxActivationDistance"] = 20,
        ["Parent"] = u119,
        ["ClickablePrompt"] = u4.isMobileControls()
    }).Triggered:Connect(function(p131) --[[ Line: 480 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u29
            [3] = u30
        --]]
        if not u28.hasEnough(p131, u29.CRYSTAL_ORE, 1) then
            return nil
        end
        u30.Client:Get("TurnInCrystalRequest"):CallServer()
    end)
end
function u37.rockFallAnimation(u132, u133, u134) --[[ Line: 487 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u13
        [3] = u32
        [4] = u6
        [5] = u17
        [6] = u9
    --]]
    local v135 = u133.Position - u134
    u20:Create(u133, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
        ["CFrame"] = u133.CFrame - v135
    }):Play()
    u13("Sound", {
        ["RollOffMinDistance"] = 110,
        ["RollOffMaxDistance"] = 220,
        ["Volume"] = 2,
        ["Playing"] = true,
        ["SoundId"] = u32.ROCK_CRUMBLE_1,
        ["Parent"] = u133
    })
    task.delay(0.3, function() --[[ Line: 502 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u32
            [3] = u134
        --]]
        local v136 = {
            ["volumeMultiplier"] = 1,
            ["rollOffMaxDistance"] = 220,
            ["rollOffMinDistance"] = 110,
            ["position"] = u134
        }
        u6:playSound(u32.JUGGERNAUT_GROUND_SMASH, v136)
    end)
    local v137 = u17.LocalPlayer.Character
    if v137 ~= nil then
        v137 = v137.PrimaryPart
        if v137 ~= nil then
            v137 = v137.Position
        end
    end
    if v137 and (u134 - v137).Magnitude < 25 then
        task.delay(0.4, function() --[[ Line: 519 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u134
            --]]
            u9.Controllers.ScreenShakeController:shake(u134, Vector3.new(0, -1, 0), {
                ["magnitude"] = 1,
                ["cycles"] = 4,
                ["duration"] = 0.3
            })
        end)
    end
    task.delay(8, function() --[[ Line: 527 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u32
            [3] = u134
            [4] = u132
            [5] = u133
        --]]
        local v138 = {
            ["volumeMultiplier"] = 1,
            ["rollOffMaxDistance"] = 220,
            ["rollOffMinDistance"] = 110,
            ["fadeOutTime"] = 1,
            ["position"] = u134
        }
        local u139 = u6:playSound(u32.ROCK_RUMBLE, v138)
        task.delay(2, function() --[[ Line: 535 ]]
            --[[
            Upvalues:
                [1] = u139
            --]]
            u139:Destroy()
        end)
        u132:rockShakeAnimation(u133, true)
    end)
end
function u37.rockShakeAnimation(_, u140, p141) --[[ Line: 541 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u21
        [3] = u6
        [4] = u32
        [5] = u20
    --]]
    local u142 = u140.Position
    local u143 = u140:GetAttribute("HP")
    local u144 = 0
    local v145 = math.random()
    local v146 = math.random
    local u147 = Vector3.new(v145, 0, v146())
    local u148 = 1
    if p141 then
        task.delay(2, function() --[[ Line: 548 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u140
                [3] = u21
                [4] = u6
                [5] = u32
            --]]
            local u149 = u18.Assets.Effects.BrokenRockEffect:Clone()
            local v150 = u140.CFrame
            local v151 = u140.Size.Y / 2 - 3
            u149:PivotTo(v150 + Vector3.new(0, v151, 0))
            u149.Parent = u21
            local v152 = u149.PrimaryPart
            if v152 ~= nil then
                local v153 = v152:FindFirstChildOfClass("Folder")
                if v153 ~= nil then
                    v153:Destroy()
                end
            end
            u6:playSound(u32.MINER_STONE_BREAK, {
                ["volumeMultiplier"] = 1,
                ["rollOffMaxDistance"] = 220,
                ["rollOffMinDistance"] = 110,
                ["position"] = u140.Position
            })
            task.delay(2, function() --[[ Line: 568 ]]
                --[[
                Upvalues:
                    [1] = u149
                --]]
                u149:Destroy()
            end)
        end)
    else
        local u154 = u18.Assets.Effects.FallingRockEffect:Clone()
        u154:PivotTo(u140.CFrame)
        u154.Parent = u21
        for v155, v156 in u154:GetChildren() do
            local _ = v155 - 1
            if v156:IsA("Part") or v156:IsA("WedgePart") then
                v156.Anchored = false
            end
        end
        task.delay(2, function() --[[ Line: 585 ]]
            --[[
            Upvalues:
                [1] = u154
            --]]
            u154:Destroy()
        end)
    end
    task.spawn(function() --[[ Line: 589 ]]
        --[[
        Upvalues:
            [1] = u144
            [2] = u140
            [3] = u143
            [4] = u20
            [5] = u147
            [6] = u148
            [7] = u142
        --]]
        while u144 < 4 and u140:GetAttribute("HP") == u143 do
            u20:Create(u140, TweenInfo.new(0.1), {
                ["Position"] = u142 + u147 * u148
            }):Play()
            u148 = u148 * -0.8
            task.wait(0.15)
            u144 = u144 + 1
        end
        local v157 = {
            ["Position"] = u142
        }
        u20:Create(u140, TweenInfo.new(0.2), v157):Play()
    end)
end
function u37.rangeAttackAnimation(_, u158, u159) --[[ Line: 612 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u3
        [3] = u26
        [4] = u25
        [5] = u6
        [6] = u32
        [7] = u21
        [8] = u22
        [9] = u11
        [10] = u13
    --]]
    local v160 = u158.PrimaryPart
    if v160 ~= nil then
        v160 = v160.Position
    end
    local v161 = u159.PrimaryPart
    if v161 ~= nil then
        v161 = v161.Position
    end
    local v162 = u18.Assets.Effects.spider_web_lasso
    u3:playAnimation(u158, u26:getAssetId(u25.SPIDER_GUARD_SHOOT))
    u6:playSound(u32.SPITTER_SPIDER_SHOOT, {
        ["volumeMultiplier"] = 1,
        ["rollOffMaxDistance"] = 220,
        ["rollOffMinDistance"] = 110,
        ["position"] = v160
    })
    if v162 and (v160 and v161) then
        local v163 = (v161 - v160).Unit
        local u164 = v160 + v163 * 6
        local v165 = v161 - v163 * 6
        local u166 = v162:Clone()
        u166.Parent = u21
        u166:PivotTo(CFrame.new(u164, v165))
        u22(0.2, u11, function(p167) --[[ Line: 641 ]]
            --[[
            Upvalues:
                [1] = u166
            --]]
            u166:PivotTo(p167)
        end, u166.PrimaryPart.CFrame, CFrame.new(v165, v161))
        u6:playSound(u32.SPITTER_SPIDER_WEB_IMPACT, {
            ["volumeMultiplier"] = 1,
            ["rollOffMaxDistance"] = 220,
            ["rollOffMinDistance"] = 110,
            ["position"] = v160
        })
        task.delay(0.2, function() --[[ Line: 650 ]]
            --[[
            Upvalues:
                [1] = u166
                [2] = u159
                [3] = u164
                [4] = u13
                [5] = u3
                [6] = u158
                [7] = u26
                [8] = u25
            --]]
            u166.PrimaryPart.Anchored = false
            local v168 = u159.PrimaryPart
            if v168 ~= nil then
                v168 = v168.Position
            end
            if not v168 then
                return nil
            end
            u166:PivotTo(CFrame.new(v168, u164) * CFrame.Angles(0, 3.141592653589793, 0))
            u13("WeldConstraint", {
                ["Part0"] = u166.PrimaryPart,
                ["Part1"] = u159.PrimaryPart,
                ["Parent"] = u166
            })
            task.delay(1, function() --[[ Line: 669 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u158
                    [3] = u26
                    [4] = u25
                    [5] = u166
                --]]
                u3:playAnimation(u158, u26:getAssetId(u25.SPIDER_GUARD_PULL))
                u166:Destroy()
            end)
        end)
    end
end
function u37.gateOpenCutScene(u169) --[[ Line: 676 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u20
        [3] = u24
        [4] = u6
        [5] = u32
        [6] = u22
        [7] = u11
    --]]
    local v170 = u169.door
    if v170 ~= nil then
        v170 = v170:WaitForChild("CameraPosition", 3)
    end
    local v171 = u169.door
    if v171 ~= nil then
        v171 = v171:WaitForChild("Main", 3)
    end
    if not (v170 and v171) then
        return nil
    end
    local u172 = u21.CurrentCamera
    if not u172 then
        return nil
    end
    local u173 = u172.CameraType
    local _ = u172.CFrame
    u172.CameraType = Enum.CameraType.Scriptable
    u20:Create(u172, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        ["CFrame"] = CFrame.lookAt(v170.Position, v171.Position)
    }):Play()
    task.delay(5, function() --[[ Line: 704 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u172
            [3] = u173
        --]]
        u24:fade(0.5, 1, 0.5)
        task.delay(3, function() --[[ Line: 706 ]]
            --[[
            Upvalues:
                [1] = u172
                [2] = u173
            --]]
            u172.CameraType = u173
        end)
    end)
    task.delay(2, function() --[[ Line: 710 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u32
            [3] = u22
            [4] = u11
            [5] = u169
        --]]
        local u174 = u6:playSound(u32.ROCK_RUMBLE, {
            ["fadeOutTime"] = 2
        }):getInstance()
        if u174 then
            task.delay(1, function() --[[ Line: 715 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u11
                    [3] = u174
                --]]
                u22(2, u11, function(p175) --[[ Line: 716 ]]
                    --[[
                    Upvalues:
                        [1] = u174
                    --]]
                    u174.Volume = p175
                end, u174.Volume, 0)
            end)
        end
        local u176 = u169.door
        if u176 ~= nil then
            u176 = u176:WaitForChild("LeftSide")
        end
        local u177 = u169.door
        if u177 ~= nil then
            u177 = u177:WaitForChild("RightSide")
        end
        local v178 = u169.door
        if v178 ~= nil then
            v178 = v178:WaitForChild("LeftSideOpenPosition")
        end
        local v179 = u169.door
        if v179 ~= nil then
            v179 = v179:WaitForChild("RightSideOpenPosition")
        end
        if u176 and (u177 and (v178 and v179)) then
            u22(2, u11, function(p180) --[[ Line: 742 ]]
                --[[
                Upvalues:
                    [1] = u176
                --]]
                u176:PivotTo(p180)
            end, u176.CFrame, v178.CFrame)
            u22(2, u11, function(p181) --[[ Line: 745 ]]
                --[[
                Upvalues:
                    [1] = u177
                --]]
                u177:PivotTo(p181)
            end, u177.CFrame, v179.CFrame)
        end
    end)
end
u9.CreateController(u37.new())
return nil