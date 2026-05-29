local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.ReplicatedStorage
local u14 = v11.RunService
local u15 = v11.TweenService
local u16 = v11.Workspace
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "games", "halloween-event", "ambient", "halloween-event-environment").HalloweenEventEnvironment
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "fade", "fade-util").FadeUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u27 = v1.import(script, script.Parent.Parent.Parent, "base-scene-controller").BaseSceneController
local u28 = v1.import(script, script.Parent.Parent.Parent, "ui", "clue-discovered").ClueDiscovered
local u29 = v1.import(script, script.Parent.Parent.Parent, "ui", "clue-hud").ClueHud
local u30 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 63 ]]
        return "HalloweenGraveyardSceneController"
    end,
    ["__index"] = u27
})
u30.__index = u30
function u30.new(...) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    local v31 = u30
    local v32 = setmetatable({}, v31)
    return v32:constructor(...) or v32
end
function u30.constructor(p33) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u23
        [3] = u22
        [4] = u8
        [5] = u17
    --]]
    u27.constructor(p33, u23.HALLOWEEN_GRAVEYARD)
    p33.Name = "HalloweenGraveyardScene"
    p33.remotes = u22.Client:GetNamespace("HalloweenGraveyard")
    p33.entryCutscenePoints = {
        ["bossCameraPos"] = CFrame.new(),
        ["bossCameraLookAt"] = CFrame.new(),
        ["gateCameraPos"] = CFrame.new(),
        ["gateCameraLookAt"] = CFrame.new()
    }
    p33.exitCutscenePoints = {
        ["digCameraPos"] = CFrame.new(),
        ["digCameraLookAt"] = CFrame.new()
    }
    p33.sceneMaid = u8.new()
    p33.sceneSignals = {
        ["clueDiscoveredSignal"] = u17.new()
    }
    p33.cluesDiscovered = {}
end
function u30.KnitStart(p34) --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    u27.KnitStart(p34)
end
function u30.onSceneLoadingScreenStart(p35) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u20
        [3] = u24
    --]]
    u6.Controllers.PreloadController:runPreload({
        ["animations"] = { u20.KEEPER_SPAWN, u20.KEEPER_ATTACK, u20.KEEPER_WALK },
        ["sounds"] = { u24.KEEPER_SUMMON }
    })
    p35:setupEnvironment()
    p35:startAudioLoops()
end
function u30.onSceneStart(p36) --[[ Line: 104 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u29
        [3] = u12
    --]]
    p36:parseCutscenePoints()
    p36:handleServerEvents()
    p36:setupGateButton()
    p36:setupGravePrompts()
    p36:setupClueRegions()
    p36.cludHudTree = u10.mount(u10.createElement(u29, {
        ["clueDiscoveredSignal"] = p36.sceneSignals.clueDiscoveredSignal
    }), u12.LocalPlayer:WaitForChild("PlayerGui"))
end
function u30.onSceneShutdown(p37) --[[ Line: 115 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    p37.sceneMaid:DoCleaning()
    if p37.clueDiscoveredTree then
        u10.unmount(p37.clueDiscoveredTree)
    end
    if p37.cludHudTree then
        u10.unmount(p37.cludHudTree)
    end
end
function u30.setupEnvironment(_) --[[ Line: 125 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u18
    --]]
    u6.Controllers.EnvironmentController:setupEnvironment(u18)
end
function u30.cleanupEnvironment(_) --[[ Line: 128 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.Controllers.EnvironmentController:cleanupEnvironment()
end
function u30.startAudioLoops(p38) --[[ Line: 131 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u24
    --]]
    local u39 = u4:playSound(u24.GRAVEYARD_AMBIENCE_LOOP, {
        ["looped"] = true
    })
    p38.sceneMaid:GiveTask(function() --[[ Line: 136 ]]
        --[[
        Upvalues:
            [1] = u39
        --]]
        local v40 = u39
        if v40 ~= nil then
            v40:Stop()
        end
        local v41 = u39
        if v41 ~= nil then
            v41:Destroy()
        end
    end)
    local u42 = u4:playSound(u24.GRAVEYARD_MUSIC_LOOP, {
        ["looped"] = true
    })
    p38.sceneMaid:GiveTask(function() --[[ Line: 150 ]]
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
end
function u30.parseCutscenePoints(p45) --[[ Line: 161 ]]
    p45.entryCutscenePoints.gateCameraPos = p45.sceneAssets.Assets.Cutscenes.EntryCutscene.GateCameraPos.CFrame
    p45.entryCutscenePoints.gateCameraLookAt = p45.sceneAssets.Assets.Cutscenes.EntryCutscene.GateCameraLookAt.CFrame
    p45.entryCutscenePoints.bossCameraPos = p45.sceneAssets.Assets.Cutscenes.EntryCutscene.BossCameraPos.CFrame
    p45.entryCutscenePoints.bossCameraLookAt = p45.sceneAssets.Assets.Cutscenes.EntryCutscene.BossCameraLookAt.CFrame
    p45.exitCutscenePoints.digCameraPos = p45.sceneAssets.Assets.Cutscenes.ExitCutscene.DigCameraPos.CFrame
    p45.exitCutscenePoints.digCameraLookAt = p45.sceneAssets.Assets.Cutscenes.ExitCutscene.DigCameraLookAt.CFrame
end
function u30.handleServerEvents(u46) --[[ Line: 172 ]]
    u46.remotes:OnEvent("GateOpenSuccess", function() --[[ Line: 174 ]]
        --[[
        Upvalues:
            [1] = u46
        --]]
        u46:openGate()
    end)
    u46.remotes:OnEvent("GraveDigResult", function(p47) --[[ Line: 178 ]]
        --[[
        Upvalues:
            [1] = u46
        --]]
        if p47.success then
            u46:onGraveDigSuccess(p47.player, p47.grave)
        else
            u46:onGraveDigFail(p47.player)
        end
    end)
    u46.remotes:OnEvent("ClueDiscovered", function(p48) --[[ Line: 185 ]]
        --[[
        Upvalues:
            [1] = u46
        --]]
        u46:onClueDiscovered(p48, false)
    end)
end
function u30.setupGateButton(u49) --[[ Line: 189 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v50 = u49.sceneAssets
    if v50 ~= nil then
        v50 = v50.Assets.GateButton.Button
    end
    if not v50 then
        return nil
    end
    u49.gatePrompt = u7.Controllers.ProximityPromptController:createProximityPrompt({
        ["ActionText"] = "Open Gate",
        ["MaxActivationDistance"] = 8,
        ["HoldDuration"] = 2,
        ["RequiresLineOfSight"] = false,
        ["Parent"] = v50
    })
    local u51 = nil
    u51 = u49.gatePrompt.Triggered:Connect(function() --[[ Line: 207 ]]
        --[[
        Upvalues:
            [1] = u49
            [2] = u51
        --]]
        u49.remotes:Get("GateOpenRequest"):SendToServer()
        u51:Disconnect()
        if u49.gatePrompt then
            u49.gatePrompt:Destroy()
        end
    end)
end
function u30.openGate(p52) --[[ Line: 216 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u4
        [3] = u24
        [4] = u6
        [5] = u20
    --]]
    if p52.gatePrompt then
        p52.gatePrompt:Destroy()
    end
    local v53 = p52.sceneAssets
    if v53 ~= nil then
        v53 = v53.Assets.Entrance.EntranceGateLeft.Hinge
    end
    if not v53 then
        return nil
    end
    local v54 = p52.sceneAssets
    if v54 ~= nil then
        v54 = v54.Assets.Entrance.EntranceGateRight.Hinge
    end
    if not v54 then
        return nil
    end
    local v55 = v53.CFrame * CFrame.Angles(0, 1.0471975511965976, 0)
    local v56 = v54.CFrame * CFrame.Angles(0, -1.0471975511965976, 0)
    local v57 = TweenInfo.new(4, Enum.EasingStyle.Sine)
    u15:Create(v53, v57, {
        ["CFrame"] = v55
    }):Play()
    u15:Create(v54, v57, {
        ["CFrame"] = v56
    }):Play()
    u4:playSound(u24.GATE_OPENING)
    p52:entryCutscene()
    u6.Controllers.PreloadController:runPreload({
        ["animations"] = { u20.GRAVEYARD_DIG, u20.GRAVEYARD_JUMP },
        ["sounds"] = { u24.WEREWOLF_HEARTBEAT, u24.KEEPER_ROAR, u24.KEEPER_ATTACK }
    })
end
function u30.setupGravePrompts(u58) --[[ Line: 260 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v59 = u58.sceneAssets
    if v59 ~= nil then
        v59 = v59.Assets.Graveyard:GetChildren()
    end
    if not v59 then
        return nil
    end
    local function v64(u60) --[[ Line: 270 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u58
        --]]
        local v61 = u7.Controllers.ProximityPromptController:createProximityPrompt({
            ["ActionText"] = "Dig Grave",
            ["MaxActivationDistance"] = 10,
            ["HoldDuration"] = 1,
            ["RequiresLineOfSight"] = false,
            ["Parent"] = u60.Bed.ProximityPrompt
        })
        if u58.digPrompts then
            local v62 = u58.digPrompts
            table.insert(v62, v61)
            local _ = #u58.digPrompts
        else
            u58.digPrompts = { v61 }
            local _ = u58.digPrompts
        end
        v61.Triggered:Connect(function() --[[ Line: 286 ]]
            --[[
            Upvalues:
                [1] = u58
                [2] = u60
            --]]
            local v63 = {
                ["grave"] = u60
            }
            u58.remotes:Get("GraveDigRequest"):SendToServer(v63)
        end)
    end
    for v65, v66 in v59 do
        v64(v66, v65 - 1, v59)
    end
end
function u30.setupClueRegions(u67) --[[ Line: 296 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u12
        [3] = u10
        [4] = u28
    --]]
    local v68 = u67.sceneAssets
    if v68 ~= nil then
        v68 = v68.Assets.Clues:GetChildren()
    end
    if not v68 then
        return nil
    end
    local function v77(p69) --[[ Line: 305 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u12
            [3] = u67
        --]]
        local u70 = p69:GetAttribute("Symbol")
        if u70 == "" or not u70 then
            return nil
        end
        local u71 = u9("Part", {
            ["Anchored"] = true,
            ["CanCollide"] = false,
            ["CanQuery"] = false,
            ["CanTouch"] = true,
            ["Size"] = Vector3.new(50, 40, 50),
            ["Transparency"] = 1,
            ["Position"] = p69.Position,
            ["Parent"] = p69
        })
        local u72 = nil
        u72 = u71.Touched:Connect(function(p73) --[[ Line: 322 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u67
                [3] = u70
                [4] = u72
                [5] = u71
            --]]
            local v74 = u12.LocalPlayer.Character
            if v74 ~= nil then
                v74 = v74.PrimaryPart
            end
            if p73 ~= v74 then
                return nil
            end
            if table.find(u67.cluesDiscovered, u70) ~= nil then
                return nil
            end
            local v75 = u67.cluesDiscovered
            local v76 = u70
            table.insert(v75, v76)
            u72:Disconnect()
            u71:Destroy()
            u67:onClueDiscovered(u70, true)
        end)
    end
    for v78, v79 in v68 do
        v77(v79, v78 - 1, v68)
    end
    u67.clueDiscoveredTree = u10.mount(u10.createElement(u28, {
        ["clueDiscoveredSignal"] = u67.sceneSignals.clueDiscoveredSignal
    }), u12.LocalPlayer:WaitForChild("PlayerGui"))
end
function u30.onClueDiscovered(p80, p81, p82) --[[ Line: 350 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u24
    --]]
    u4:playSound(u24.CLUE_DISCOVERED)
    if p82 then
        p80.remotes:Get("FoundClue"):SendToServer(p81)
    end
    p80.sceneSignals.clueDiscoveredSignal:Fire(p81)
end
function u30.entryCutscene(u83) --[[ Line: 357 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u12
        [3] = u16
        [4] = u15
        [5] = u13
        [6] = u21
        [7] = u20
        [8] = u3
        [9] = u4
        [10] = u24
        [11] = u19
    --]]
    u14:BindToRenderStep("graveyard-player-vis", Enum.RenderPriority.Last.Value - 1, function() --[[ Line: 359 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        local v84 = u12.LocalPlayer.Character
        if v84 ~= nil then
            for v85, v86 in v84:GetDescendants() do
                local _ = v85 - 1
                if v86:IsA("BasePart") then
                    v86.LocalTransparencyModifier = 0
                end
            end
        end
    end)
    local u87 = u16.CurrentCamera
    if not u87 then
        return nil
    end
    local u88 = u87.CameraType
    local u89 = u87.CFrame
    u87.CameraType = Enum.CameraType.Scriptable
    local v90 = u15:Create(u87, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        ["CFrame"] = CFrame.lookAt(u83.entryCutscenePoints.gateCameraPos.Position, u83.entryCutscenePoints.gateCameraLookAt.Position)
    })
    v90:Play()
    local u91 = nil
    local u92 = nil
    u92 = v90.Completed:Connect(function() --[[ Line: 390 ]]
        --[[
        Upvalues:
            [1] = u92
            [2] = u15
            [3] = u87
            [4] = u83
            [5] = u91
            [6] = u13
            [7] = u21
            [8] = u20
            [9] = u16
            [10] = u3
            [11] = u4
            [12] = u24
        --]]
        u92:Disconnect()
        local v93 = u15:Create(u87, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            ["CFrame"] = CFrame.lookAt(u83.entryCutscenePoints.bossCameraPos.Position, u83.entryCutscenePoints.bossCameraLookAt.Position)
        })
        v93:Play()
        local u94 = nil
        u94 = v93.Completed:Connect(function() --[[ Line: 398 ]]
            --[[
            Upvalues:
                [1] = u94
                [2] = u83
                [3] = u91
                [4] = u13
                [5] = u21
                [6] = u20
                [7] = u16
                [8] = u15
                [9] = u3
                [10] = u4
                [11] = u24
            --]]
            u94:Disconnect()
            local v95 = u83.entryCutscenePoints.bossCameraLookAt.Position - Vector3.new(0, 50, 0)
            u91 = u13.Assets.Misc.GraveKeeper:Clone()
            u91:PivotTo(CFrame.new(v95))
            local v96 = u91:FindFirstChild("Humanoid")
            if v96 ~= nil then
                v96 = v96:FindFirstChild("Animator")
            end
            local v97 = u21:getAssetId(u20.KEEPER_SPAWN)
            u91.Parent = u16
            local v98 = u15
            local v99 = u91.PrimaryPart
            local v100 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            local v101 = {}
            local v102 = u83.entryCutscenePoints.bossCameraLookAt.Position
            local v103 = u91:GetExtentsSize().Y / 2
            local v104 = Vector3.new(0, v103, 0)
            v101.CFrame = CFrame.new(v102 + v104)
            v98:Create(v99, v100, v101):Play()
            u3:playAnimation(v96, v97)
            u4:playSound(u24.KEEPER_SUMMON)
            u83:applySceneScreenShake()
        end)
    end)
    task.delay(8, function() --[[ Line: 428 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u87
            [3] = u88
            [4] = u89
            [5] = u91
            [6] = u14
        --]]
        u19:fade(0.5, 1, 0.5)
        task.delay(1, function() --[[ Line: 430 ]]
            --[[
            Upvalues:
                [1] = u87
                [2] = u88
                [3] = u89
            --]]
            u87.CameraType = u88
            u87.CFrame = u89
        end)
        task.delay(0.6, function() --[[ Line: 434 ]]
            --[[
            Upvalues:
                [1] = u91
                [2] = u14
            --]]
            local v105 = u91
            if v105 ~= nil then
                v105:Destroy()
            end
            u14:UnbindFromRenderStep("graveyard-player-vis")
        end)
    end)
end
function u30.onGraveDigSuccess(p106, u107, p108) --[[ Line: 443 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u12
        [3] = u19
        [4] = u16
        [5] = u13
        [6] = u26
        [7] = u3
        [8] = u21
        [9] = u20
        [10] = u4
        [11] = u24
    --]]
    u14:BindToRenderStep("graveyard-dig-vis", Enum.RenderPriority.Last.Value - 1, function() --[[ Line: 445 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        local v109 = u12.LocalPlayer.Character
        if v109 ~= nil then
            for v110, v111 in v109:GetDescendants() do
                local _ = v110 - 1
                if v111:IsA("BasePart") then
                    v111.LocalTransparencyModifier = 0
                end
            end
        end
    end)
    if u107 ~= u12.LocalPlayer then
        u19:fade(0.12, 0.75, 0.12)
    end
    if p106.digPrompts then
        for v112, v113 in p106.digPrompts do
            local _ = v112 - 1
            v113:Destroy()
        end
    end
    local u114 = u16.CurrentCamera
    if u107.Character and u114 then
        local u115 = u114.CameraType
        local u116 = u114.CFrame
        u114.CameraType = Enum.CameraType.Scriptable
        u114.CFrame = CFrame.lookAt(p106.exitCutscenePoints.digCameraPos.Position, p108:GetPivot().Position or p106.exitCutscenePoints.digCameraLookAt.Position)
        u13.Assets.Misc.Shovel:Clone().Parent = u107.Character
        u26:weldCharacterAccessories(u107.Character)
        local u117 = u3:playAnimation(u107, u21:getAssetId(u20.GRAVEYARD_DIG))
        u4:playSound(u24.PIRATE_SHOVEL_DIG, {
            ["playbackSpeedMultiplier"] = 0.9
        })
        task.delay(4, function() --[[ Line: 489 ]]
            --[[
            Upvalues:
                [1] = u117
                [2] = u3
                [3] = u107
                [4] = u21
                [5] = u20
                [6] = u4
                [7] = u24
                [8] = u19
                [9] = u114
                [10] = u115
                [11] = u116
                [12] = u14
            --]]
            local v118 = u117
            if v118 ~= nil then
                v118:Stop()
            end
            local v119 = u3:playAnimation(u107, u21:getAssetId(u20.GRAVEYARD_JUMP))
            u4:playSound(u24.DUCK_JUMP, {
                ["playbackSpeedMultiplier"] = 1
            })
            if v119 ~= nil then
                v119 = v119.Length
            end
            local v120 = v119 == nil and 3 or v119
            task.delay(v120, function() --[[ Line: 507 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u114
                    [3] = u115
                    [4] = u116
                    [5] = u14
                --]]
                u19:fade(0.05, 2, 0.05):andThen(function() --[[ Line: 509 ]]
                    --[[
                    Upvalues:
                        [1] = u114
                        [2] = u115
                        [3] = u116
                    --]]
                    u114.CameraType = u115
                    u114.CFrame = u116
                end)
                task.delay(0.15000000000000002, function() --[[ Line: 514 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                    --]]
                    u14:UnbindFromRenderStep("graveyard-dig-vis")
                end)
            end)
        end)
    end
end
function u30.onGraveDigFail(p121, p122) --[[ Line: 537 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
        [3] = u25
        [4] = u4
        [5] = u24
    --]]
    if p122 == u12.LocalPlayer and p121.digPrompts then
        for v123, v124 in p121.digPrompts do
            local _ = v123 - 1
            v124:Destroy()
        end
    end
    local u125 = u13.Assets.Effects.DigFail:Clone()
    u125.Anchored = true
    local v126 = p122.Character
    if v126 ~= nil then
        v126 = v126:FindFirstChild("LeftFoot")
    end
    if v126 then
        u125.Position = v126.Position
    end
    u125.Parent = p121.sceneAssets
    task.delay(4.2, function() --[[ Line: 561 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u125
            [3] = u4
            [4] = u24
        --]]
        u25:playEffects({ u125 }, nil)
        u4:playSound(u24.HALLOWEEN_BOSS_RUNE_EXPLODE, {
            ["rollOffMaxDistance"] = 100,
            ["rollOffMinDistance"] = 30,
            ["position"] = u125.Position
        })
    end)
end
function u30.applySceneScreenShake(_) --[[ Line: 570 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -4, 0), {
        ["cycles"] = 16,
        ["duration"] = 2,
        ["magnitude"] = 0.8
    })
end
u6.CreateController(u30.new())
return nil