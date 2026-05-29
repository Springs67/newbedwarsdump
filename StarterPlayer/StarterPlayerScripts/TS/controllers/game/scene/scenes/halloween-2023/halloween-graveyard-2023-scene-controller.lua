local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Players
local u14 = v12.RunService
local u15 = v12.TweenService
local u16 = v12.Workspace
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u19 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "games", "halloween-event", "ambient", "halloween-event-environment").HalloweenEventEnvironment
local u20 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "fade", "fade-util").FadeUtil
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "constants", "halloween-graveyard-2023-scene-constants")
local u27 = v26.CandleColorsPair
local u28 = v26.CandleOctavePair
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey
local u30 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u31 = u1.import(script, script.Parent.Parent.Parent, "base-scene-controller").BaseSceneController
local u32 = u1.import(script, script.Parent.Parent.Parent, "ui", "candles-discovered").CandlesDiscovered
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 63 ]]
        return "HalloweenGraveyard2023SceneController"
    end,
    ["__index"] = u31
})
u33.__index = u33
function u33.new(...) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    local v34 = u33
    local v35 = setmetatable({}, v34)
    return v35:constructor(...) or v35
end
function u33.constructor(p36) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u29
        [3] = u25
        [4] = u9
        [5] = u17
    --]]
    u31.constructor(p36, u29.HALLOWEEN_GRAVEYARD_2023)
    p36.Name = "HalloweenGraveyard2023Scene"
    p36.remotes = u25.Client:GetNamespace("HalloweenGraveyard2023")
    p36.entryCutscenePoints = {
        ["altarCameraPos"] = CFrame.new(),
        ["altarCameraLookAt"] = CFrame.new(),
        ["gateCameraPos"] = CFrame.new(),
        ["gateCameraLookAt"] = CFrame.new()
    }
    p36.exitCutscenePoints = {
        ["altarCameraPos"] = CFrame.new(),
        ["altarCameraLookAt"] = CFrame.new()
    }
    p36.sceneMaid = u9.new()
    p36.sceneSignals = {
        ["candlesDiscoveredSignal"] = u17.new()
    }
end
function u33.KnitStart(p37) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    u31.KnitStart(p37)
end
function u33.onSceneLoadingScreenStart(p38) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u21
        [3] = u30
    --]]
    u6.Controllers.PreloadController:runPreload({
        ["animations"] = { u21.HALLOWEEN_ALTAR_JUMP },
        ["sounds"] = { u30.SKULL_ALTAR, u30.GATE_OPENING }
    })
    p38:setupEnvironment()
    p38:startAudioLoops()
end
function u33.onSceneStart(p39) --[[ Line: 103 ]]
    p39:parseCutscenePoints()
    p39:handleServerEvents()
    p39:setupGateButton()
end
function u33.onSceneShutdown(p40) --[[ Line: 112 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    p40.sceneMaid:DoCleaning()
    if p40.candlesDiscoveredTree then
        u11.unmount(p40.candlesDiscoveredTree)
    end
end
function u33.setupEnvironment(_) --[[ Line: 119 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u19
    --]]
    u6.Controllers.EnvironmentController:setupEnvironment(u19)
end
function u33.cleanupEnvironment(_) --[[ Line: 122 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.Controllers.EnvironmentController:cleanupEnvironment()
end
function u33.startAudioLoops(p41) --[[ Line: 125 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u30
    --]]
    local u42 = u4:playSound(u30.GRAVEYARD_AMBIENCE_LOOP, {
        ["looped"] = true
    })
    p41.sceneMaid:GiveTask(function() --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        local v43 = u42
        if v43 ~= nil then
            v43:Stop()
        end
        local v44 = u42
        if v44 ~= nil then
            v44:Destroy()
        end
    end)
    local u45 = u4:playSound(u30.GRAVEYARD_MUSIC_LOOP, {
        ["looped"] = true
    })
    p41.sceneMaid:GiveTask(function() --[[ Line: 144 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        local v46 = u45
        if v46 ~= nil then
            v46:Stop()
        end
        local v47 = u45
        if v47 ~= nil then
            v47:Destroy()
        end
    end)
end
function u33.parseCutscenePoints(p48) --[[ Line: 155 ]]
    p48.entryCutscenePoints.gateCameraPos = p48.sceneAssets.Assets.Cutscenes.EntryCutscene.GateCameraPos.CFrame
    p48.entryCutscenePoints.gateCameraLookAt = p48.sceneAssets.Assets.Cutscenes.EntryCutscene.GateCameraLookAt.CFrame
    p48.entryCutscenePoints.altarCameraPos = p48.sceneAssets.Assets.Cutscenes.EntryCutscene.AltarCameraPos.CFrame
    p48.entryCutscenePoints.altarCameraLookAt = p48.sceneAssets.Assets.Cutscenes.EntryCutscene.AltarCameraLookAt.CFrame
    p48.exitCutscenePoints.altarCameraPos = p48.sceneAssets.Assets.Cutscenes.ExitCutscene.AltarCameraPos.CFrame
    p48.exitCutscenePoints.altarCameraLookAt = p48.sceneAssets.Assets.Cutscenes.ExitCutscene.AltarCameraLookAt.CFrame
end
function u33.handleServerEvents(u49) --[[ Line: 165 ]]
    u49.remotes:OnEvent("GateOpenSuccess", function() --[[ Line: 167 ]]
        --[[
        Upvalues:
            [1] = u49
        --]]
        u49:openGate()
    end)
    u49.remotes:OnEvent("CandleColorCheck", function() --[[ Line: 170 ]]
        --[[
        Upvalues:
            [1] = u49
        --]]
        u49:check()
    end)
    u49.remotes:OnEvent("PuzzleSolved", function() --[[ Line: 173 ]]
        --[[
        Upvalues:
            [1] = u49
        --]]
        u49:exitCutscene()
    end)
    u49.remotes:OnEvent("CandleDiscovered", function(p50) --[[ Line: 176 ]]
        --[[
        Upvalues:
            [1] = u49
        --]]
        u49.sceneSignals.candlesDiscoveredSignal:Fire(p50.candleCount)
    end)
end
function u33.showCandlesDiscoveredUI(p51) --[[ Line: 180 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u32
        [3] = u13
    --]]
    p51.candlesDiscoveredTree = u11.mount(u11.createElement(u32, {
        ["candlesDiscoveredSignal"] = p51.sceneSignals.candlesDiscoveredSignal
    }), u13.LocalPlayer:WaitForChild("PlayerGui"))
end
function u33.setupGateButton(u52) --[[ Line: 186 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v53 = u52.sceneAssets
    if v53 ~= nil then
        v53 = v53.Assets.GateButton.Button
    end
    if not v53 then
        return nil
    end
    u52.gatePrompt = u7.Controllers.ProximityPromptController:createProximityPrompt({
        ["ActionText"] = "Open Gate",
        ["MaxActivationDistance"] = 8,
        ["HoldDuration"] = 2,
        ["RequiresLineOfSight"] = false,
        ["Parent"] = v53
    })
    local u54 = nil
    u54 = u52.gatePrompt.Triggered:Connect(function() --[[ Line: 204 ]]
        --[[
        Upvalues:
            [1] = u52
            [2] = u54
        --]]
        u52.remotes:Get("GateOpenRequest"):SendToServer()
        u54:Disconnect()
        if u52.gatePrompt then
            u52.gatePrompt:Destroy()
        end
    end)
end
function u33.openGate(p55) --[[ Line: 213 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u4
        [3] = u30
    --]]
    if p55.gatePrompt then
        p55.gatePrompt:Destroy()
    end
    local v56 = p55.sceneAssets
    if v56 ~= nil then
        v56 = v56.Assets.Entrance.EntranceGateLeft.Hinge
    end
    if not v56 then
        return nil
    end
    local v57 = p55.sceneAssets
    if v57 ~= nil then
        v57 = v57.Assets.Entrance.EntranceGateRight.Hinge
    end
    if not v57 then
        return nil
    end
    local v58 = v56.CFrame * CFrame.Angles(0, 1.0471975511965976, 0)
    local v59 = v57.CFrame * CFrame.Angles(0, -1.0471975511965976, 0)
    local v60 = TweenInfo.new(4, Enum.EasingStyle.Sine)
    u15:Create(v56, v60, {
        ["CFrame"] = v58
    }):Play()
    u15:Create(v57, v60, {
        ["CFrame"] = v59
    }):Play()
    u4:playSound(u30.GATE_OPENING)
    p55:entryCutscene()
end
function u33.entryCutscene(u61) --[[ Line: 253 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
        [3] = u16
        [4] = u15
        [5] = u22
        [6] = u21
        [7] = u3
        [8] = u20
    --]]
    u14:BindToRenderStep("graveyard-player-vis", Enum.RenderPriority.Last.Value - 1, function() --[[ Line: 255 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        local v62 = u13.LocalPlayer.Character
        if v62 ~= nil then
            for v63, v64 in v62:GetDescendants() do
                local _ = v63 - 1
                if v64:IsA("BasePart") then
                    v64.LocalTransparencyModifier = 0
                end
            end
        end
    end)
    local u65 = u16.CurrentCamera
    if not u65 then
        return nil
    end
    local u66 = u65.CameraType
    local u67 = u65.CFrame
    u65.CameraType = Enum.CameraType.Scriptable
    local v68 = u15:Create(u65, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        ["CFrame"] = CFrame.lookAt(u61.entryCutscenePoints.gateCameraPos.Position, u61.entryCutscenePoints.gateCameraLookAt.Position)
    })
    v68:Play()
    local u69 = nil
    u69 = v68.Completed:Connect(function() --[[ Line: 284 ]]
        --[[
        Upvalues:
            [1] = u69
            [2] = u15
            [3] = u65
            [4] = u61
            [5] = u22
            [6] = u21
            [7] = u3
        --]]
        u69:Disconnect()
        local v70 = u15:Create(u65, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            ["CFrame"] = CFrame.lookAt(u61.entryCutscenePoints.altarCameraPos.Position, u61.entryCutscenePoints.altarCameraLookAt.Position)
        })
        v70:Play()
        local u71 = nil
        u71 = v70.Completed:Connect(function() --[[ Line: 292 ]]
            --[[
            Upvalues:
                [1] = u61
                [2] = u15
                [3] = u22
                [4] = u21
                [5] = u3
                [6] = u71
            --]]
            u15:Create(u61.sceneAssets.Assets.Altar.Model.Eyes, TweenInfo.new(1), {
                ["Color"] = Color3.fromRGB(200, 0, 0)
            }):Play()
            u15:Create(u61.sceneAssets.Assets.Altar.Model.Aura.SurfaceGui.ImageLabel, TweenInfo.new(1), {
                ["ImageTransparency"] = 0.8
            }):Play()
            local u72 = u3:playAnimation(u61.sceneAssets.Assets.Altar.Model.AnimationController.Animator, u22:getAssetId(u21.HALLOWEEN_ALTAR_LOOP), {
                ["looped"] = true,
                ["speed"] = 0.25
            })
            u61.sceneMaid:GiveTask(function() --[[ Line: 312 ]]
                --[[
                Upvalues:
                    [1] = u72
                --]]
                local v73 = u72
                if v73 ~= nil then
                    v73:Stop()
                end
                local v74 = u72
                if v74 ~= nil then
                    v74:Destroy()
                end
            end)
            task.delay(1, function() --[[ Line: 323 ]]
                --[[
                Upvalues:
                    [1] = u61
                --]]
                u61:check()
            end)
            u71:Disconnect()
        end)
    end)
    task.delay(25, function() --[[ Line: 329 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u65
            [3] = u66
            [4] = u67
            [5] = u14
            [6] = u61
        --]]
        u20:fade(0.5, 1, 0.5)
        task.delay(1, function() --[[ Line: 331 ]]
            --[[
            Upvalues:
                [1] = u65
                [2] = u66
                [3] = u67
            --]]
            u65.CameraType = u66
            u65.CFrame = u67
        end)
        task.delay(0.6, function() --[[ Line: 335 ]]
            --[[
            Upvalues:
                [1] = u14
            --]]
            u14:UnbindFromRenderStep("graveyard-player-vis")
        end)
        u61:showCandlesDiscoveredUI()
    end)
end
function u33.check(u75) --[[ Line: 341 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u21
        [3] = u3
        [4] = u4
        [5] = u30
        [6] = u27
        [7] = u15
        [8] = u10
        [9] = u28
    --]]
    local v76 = u3:playAnimation(u75.sceneAssets.Assets.Altar.Model.AnimationController.Animator, u22:getAssetId(u21.HALLOWEEN_ALTAR_SKULL_ROTATE), {
        ["speed"] = 0.3
    })
    local u77 = u75.sceneAssets.Assets.Altar.Points:GetChildren()
    if not u77 then
        return nil
    end
    local u78 = 0
    if v76 then
        u4:playSound(u30.SKULL_ALTAR)
        v76:GetMarkerReachedSignal("altarPoint"):Connect(function(p79) --[[ Line: 355 ]]
            --[[
            Upvalues:
                [1] = u77
                [2] = u27
                [3] = u15
                [4] = u75
                [5] = u78
                [6] = u30
                [7] = u4
                [8] = u10
                [9] = u28
            --]]
            local u80 = nil
            for v81, v82 in u77 do
                local _ = v81 - 1
                if v82.Name == p79 == true then
                    u80 = v82
                    break
                end
            end
            if not u80 then
                return nil
            end
            local v83 = u80:GetAttribute("Color")
            u80.Color = u27[v83]
            task.delay(5, function() --[[ Line: 374 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u80
                --]]
                u15:Create(u80, TweenInfo.new(3), {
                    ["Color"] = Color3.fromRGB(54, 7, 3)
                }):Play()
            end)
            local v84 = u75.sceneAssets.Assets.Altar.Candles:GetChildren()
            local v85
            if v84 then
                local v86 = nil
                for v87, v88 in v84 do
                    local _ = v87 - 1
                    if v88:GetAttribute("AltarPoint") == u80.Name == true then
                        v86 = v88
                        break
                    end
                end
                local v89
                if v86 == nil then
                    v89 = v86
                else
                    v89 = v86:FindFirstChildWhichIsA("Beam")
                end
                if u80:GetAttribute("CandleColor") == u80:GetAttribute("Color") then
                    if v86 and not v89 then
                        local v90 = u75.sceneAssets.Assets.Extras.Beam:Clone()
                        v90.Parent = v86
                        v90.Attachment0 = v86.MeshPart.Attachment
                        v90.Attachment1 = u75.sceneAssets.Assets.Altar.Model.Skull.Attachment
                        v90.Enabled = true
                    end
                    u78 = u78 + 1
                    v85 = u30.HALLOWEEN_BOSS_RUNE_EXPLODE
                else
                    if v89 ~= nil then
                        v89:Destroy()
                    end
                    v85 = u30.HALLOWEEN_BOSS_HIT
                end
            else
                v85 = u30.HALLOWEEN_BOSS_HIT
            end
            u10("PitchShiftSoundEffect", {
                ["Parent"] = u4:playModifiableSound(v85, {
                    ["rollOffMaxDistance"] = 100,
                    ["position"] = u75.sceneAssets.Assets.Altar.Model.Skull.Position
                }),
                ["Octave"] = u28[v83]
            })
        end)
    end
    task.delay(12, function() --[[ Line: 430 ]]
        --[[
        Upvalues:
            [1] = u78
            [2] = u75
        --]]
        if u78 < 8 then
            u75:playExplosion()
        end
    end)
end
function u33.playExplosion(p91) --[[ Line: 436 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u30
        [3] = u16
        [4] = u18
        [5] = u8
        [6] = u6
    --]]
    u4:playSound(u30.HALLOWEEN_BOSS_SPAWN, {
        ["position"] = p91.sceneAssets.Assets.Altar.Model.Skull.Position
    })
    local u92 = p91.sceneAssets.Assets.Extras.CurseExplosionEffect:Clone()
    u92.Parent = u16
    u92:PivotTo(p91.sceneAssets.Assets.Altar.Model.Skull.CFrame)
    local u96 = u18(1.5, u8, function(p93) --[[ Line: 443 ]]
        --[[
        Upvalues:
            [1] = u92
        --]]
        u92:ScaleTo(80 * p93)
        u92:PivotTo(u92:GetPivot() * CFrame.Angles(0, 0.2617993877991494, 0))
        for v94, v95 in u92:GetChildren() do
            local _ = v94 - 1
            if v95:IsA("BasePart") then
                v95.LocalTransparencyModifier = math.max(0.5, p93)
            end
        end
    end)
    task.spawn(function() --[[ Line: 459 ]]
        --[[
        Upvalues:
            [1] = u96
            [2] = u92
        --]]
        u96:Wait()
        u92:Destroy()
    end)
    u6.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -4, 0), {
        ["cycles"] = 16,
        ["duration"] = 2,
        ["magnitude"] = 0.8
    })
end
function u33.exitCutscene(u97) --[[ Line: 469 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u6
        [3] = u20
        [4] = u4
        [5] = u30
        [6] = u15
        [7] = u24
        [8] = u1
        [9] = u23
        [10] = u14
        [11] = u13
        [12] = u3
        [13] = u22
        [14] = u21
    --]]
    local u98 = u16.CurrentCamera
    if not u98 then
        return nil
    end
    local u99 = u98.CameraType
    local u100 = u98.CFrame
    u98.CameraType = Enum.CameraType.Scriptable
    u6.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -4, 0), {
        ["cycles"] = 24,
        ["duration"] = 3,
        ["magnitude"] = 0.8
    })
    u20:fade(0.12, 0.75, 0.12)
    task.delay(0.12, function() --[[ Line: 485 ]]
        --[[
        Upvalues:
            [1] = u98
            [2] = u97
            [3] = u4
            [4] = u30
            [5] = u15
            [6] = u24
            [7] = u1
            [8] = u23
            [9] = u14
            [10] = u13
            [11] = u16
            [12] = u3
            [13] = u22
            [14] = u21
        --]]
        u98.CFrame = CFrame.lookAt(u97.exitCutscenePoints.altarCameraPos.Position, u97.exitCutscenePoints.altarCameraLookAt.Position)
        local u101 = u4:playModifiableSound(u30.ROCK_RUMBLE)
        if u101 then
            u101.PlaybackRegionsEnabled = true
            u101.PlaybackRegion = NumberRange.new(0, 4)
            task.delay(2, function() --[[ Line: 491 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u101
                --]]
                u15:Create(u101, TweenInfo.new(2), {
                    ["Volume"] = 0
                }):Play()
            end)
        end
        local v102 = 0
        local v103 = {}
        for v104, v105 in u24:getAliveEntityInstances() do
            local _ = v104 - 1
            local v106 = u24:getEntity(v105)
            if v106 ~= nil then
                v102 = v102 + 1
                v103[v102] = v106
            end
        end
        local v107 = 0
        local v108 = {}
        for v109, v110 in v103 do
            local _ = v109 - 1
            if u1.instanceof(v110, u23) == true then
                v107 = v107 + 1
                v108[v107] = v110
            end
        end
        local v111 = u97.sceneAssets.Assets.Cutscenes.ExitCutscene.PlayerPositions:GetChildren()
        local v112 = false
        local v113 = 0
        while true do
            if v112 then
                v113 = v113 + 1
            else
                v112 = true
            end
            if v113 >= #v108 then
                return
            end
            local v114 = v108[v113 + 1]
            local v115 = v111[v113 % #v111 + 1].CFrame
            if v115 then
                local u116 = v114:getInstance()
                u116.Archivable = true
                local u117 = u116:Clone()
                u116.Archivable = false
                local u118 = "graveyard-player-invis-" .. tostring(v113)
                u14:BindToRenderStep(u118 .. tostring(v113), Enum.RenderPriority.Last.Value - 1, function() --[[ Line: 550 ]]
                    --[[
                    Upvalues:
                        [1] = u13
                        [2] = u116
                    --]]
                    local v119 = u13:GetPlayerFromCharacter(u116)
                    if v119 ~= nil then
                        local v120 = v119.Character
                        if v120 ~= nil then
                            for v121, v122 in v120:GetDescendants() do
                                local _ = v121 - 1
                                if v122:IsA("BasePart") then
                                    v122.LocalTransparencyModifier = 1
                                end
                            end
                        end
                    end
                end)
                task.delay(11.88, function() --[[ Line: 568 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                        [2] = u118
                    --]]
                    u14:UnbindFromRenderStep(u118)
                end)
                if u117 then
                    u117.Parent = u16
                    u117.PrimaryPart.Anchored = true
                    u117:PivotTo(v115)
                    u97.sceneMaid:GiveTask(u117)
                    task.delay(v113 * 2 + 1, function() --[[ Line: 578 ]]
                        --[[
                        Upvalues:
                            [1] = u3
                            [2] = u117
                            [3] = u22
                            [4] = u21
                            [5] = u97
                        --]]
                        local u123 = u3:playAnimation(u117, u22:getAssetId(u21.HALLOWEEN_ALTAR_JUMP))
                        if u123 then
                            u123:GetMarkerReachedSignal("pause"):Connect(function() --[[ Line: 581 ]]
                                --[[
                                Upvalues:
                                    [1] = u123
                                --]]
                                u123:AdjustSpeed(0)
                            end)
                            u97.sceneMaid:GiveTask(function() --[[ Line: 584 ]]
                                --[[
                                Upvalues:
                                    [1] = u123
                                --]]
                                u123:Stop()
                                u123:Destroy()
                            end)
                        end
                    end)
                end
            end
        end
    end)
    task.delay(12, function() --[[ Line: 594 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u98
            [3] = u99
            [4] = u100
        --]]
        u20:fade(0.5, 2, 0.5):andThen(function() --[[ Line: 596 ]]
            --[[
            Upvalues:
                [1] = u98
                [2] = u99
                [3] = u100
            --]]
            u98.CameraType = u99
            u98.CFrame = u100
        end)
    end)
end
u6.CreateController(u33.new())
return nil