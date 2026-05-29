local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.SoundManager
local u5 = v3.WatchCollectionTag
local u6 = v3.WatchPlayerCharacter
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Lighting
local u14 = v12.Players
local u15 = v12.ReplicatedStorage
local u16 = v12.RunService
local u17 = v12.SoundService
local u18 = v12.TweenService
local u19 = v12.Workspace
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "definitions", "prod-animations").ProdAnimations
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u27 = v1.import(script, script.Parent.Parent.Parent.Parent, "base-scene-controller").BaseSceneController
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 35 ]]
        return "HalloweenObbySceneController"
    end,
    ["__index"] = u27
})
u28.__index = u28
function u28.new(...) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u23
        [3] = u22
        [4] = u10
    --]]
    u27.constructor(p31, u23.HALLOWEEN_OBBY)
    p31.Name = "HalloweenObbyScene"
    p31.remotes = u22.Client:GetNamespace("HalloweenObby")
    p31.sceneMaid = u10.new()
    p31.sceneLightingMaid = u10.new()
end
function u28.KnitStart(p32) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    u27.KnitStart(p32)
end
function u28.onSceneLoadingScreenStart(u33) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u20
        [3] = u25
        [4] = u6
        [5] = u14
        [6] = u19
        [7] = u11
    --]]
    u8.Controllers.PreloadController:runPreload({
        ["animations"] = { u20.CLIMB_ROPE },
        ["sounds"] = { u25.GATE_OPENING, u25.ROLLING_BOULDER_LOOP }
    })
    u33:setupLighting()
    u33:setupAmbienceSounds()
    u33.sceneMaid:GiveTask(u6(u14.LocalPlayer, function(_) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u33
            [3] = u11
        --]]
        local v34 = {
            ["Name"] = "HalloweenObbyDepthOfField",
            ["InFocusRadius"] = 80,
            ["Parent"] = u19.CurrentCamera
        }
        u33.sceneMaid:GiveTask(u11("DepthOfFieldEffect", v34))
    end))
end
function u28.onSceneStart(p35) --[[ Line: 71 ]]
    p35:setupEntryGate()
    p35:setupFallingObjects()
    p35:setupBridgeTest()
    p35:setupRollingObjects()
    p35:setupWinArea()
end
function u28.onSceneShutdown(p36) --[[ Line: 83 ]]
    p36:cleanupLighting()
    p36.sceneMaid:DoCleaning()
end
function u28.setupAmbienceSounds(p37) --[[ Line: 87 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u9
        [3] = u25
        [4] = u4
    --]]
    u17.AmbientReverb = Enum.ReverbType.Cave
    p37.sceneMaid:GiveTask(function() --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17.AmbientReverb = Enum.ReverbType.NoReverb
    end)
    local v38 = p37.sceneMaid
    local v39 = u9.Controllers.FootstepsController.footstepModifier
    local v40 = {
        ["soundConfig"] = {
            ["walk"] = {
                u25.FOOTSTEP_CAVES_1,
                u25.FOOTSTEP_CAVES_2,
                u25.FOOTSTEP_CAVES_3,
                u25.FOOTSTEP_CAVES_4
            },
            ["run"] = {
                u25.FOOTSTEP_CAVES_1,
                u25.FOOTSTEP_CAVES_2,
                u25.FOOTSTEP_CAVES_3,
                u25.FOOTSTEP_CAVES_4
            }
        }
    }
    v38:GiveTask(v39:addModifier(v40))
    local u41 = u4:playSound(u25.CAVE_AMBIENCE, {
        ["looped"] = true
    })
    p37.sceneMaid:GiveTask(function() --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        local v42 = u41
        if v42 ~= nil then
            v42:Stop()
        end
        local v43 = u41
        if v43 ~= nil then
            v43:Destroy()
        end
    end)
end
function u28.animateGateOpen(_, p44, p45) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u25
        [3] = u18
    --]]
    local v46 = p44:FindFirstChild("GateLeft")
    if v46 ~= nil then
        v46 = v46.PrimaryPart
    end
    local v47 = p44:FindFirstChild("GateRight")
    if v47 ~= nil then
        v47 = v47.PrimaryPart
    end
    u4:playSound(u25.GATE_OPENING)
    if v46 then
        local v48 = u18
        local v49 = p45 == nil and 2 or p45
        v48:Create(v46, TweenInfo.new(v49), {
            ["CFrame"] = v46.CFrame * CFrame.Angles(0, 1.5707963267948966, 0)
        }):Play()
    end
    if v47 then
        local v50 = u18
        local v51 = p45 == nil and 2 or p45
        v50:Create(v47, TweenInfo.new(v51), {
            ["CFrame"] = v47.CFrame * CFrame.Angles(0, -1.5707963267948966, 0)
        }):Play()
    end
end
function u28.setupLighting(p52) --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u11
        [3] = u13
    --]]
    p52.sceneLightingMaid:GiveTask(u9.Controllers.LightingController.lightingModifier:addModifier(20, {
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
    }))
    p52.sceneLightingMaid:GiveTask(u9.Controllers.LightingController.atmosphereModifier:addModifier(20, {
        ["Density"] = 0.365,
        ["Offset"] = 0.284,
        ["Glare"] = 5.85,
        ["Haze"] = 0.75,
        ["Color"] = Color3.fromRGB(141, 141, 199),
        ["Decay"] = Color3.fromRGB(76, 82, 136)
    }))
    p52.sceneLightingMaid:GiveTask(u9.Controllers.LightingController.skyModifier:addModifier(20, {
        ["StarCount"] = 0,
        ["SkyboxUp"] = "rbxassetid://10290025302",
        ["MoonTextureId"] = "rbxasset://sky/moon.jpg",
        ["SkyboxBk"] = "rbxassetid://10290026331",
        ["CelestialBodiesShown"] = false,
        ["SkyboxDn"] = "rbxassetid://10290026184",
        ["SkyboxLf"] = "rbxassetid://10290025786",
        ["SunTextureId"] = "",
        ["SunAngularSize"] = 21,
        ["SkyboxFt"] = "rbxassetid://10290026023",
        ["SkyboxRt"] = "rbxassetid://10290025545",
        ["MoonAngularSize"] = 11
    }))
    p52.sceneLightingMaid:GiveTask(u9.Controllers.LightingController.colorCorrectionModifier:addModifier(20, {
        ["Brightness"] = 0.05,
        ["Contrast"] = 0.01,
        ["Saturation"] = 0.2,
        ["TintColor"] = Color3.fromRGB(255, 255, 255)
    }))
    local u53 = u11("BloomEffect", {
        ["Enabled"] = true,
        ["Intensity"] = 1,
        ["Size"] = 31,
        ["Threshold"] = 1.894,
        ["Parent"] = u13
    })
    p52.sceneLightingMaid:GiveTask(function() --[[ Line: 209 ]] end)
end
function u28.cleanupLighting(p54) --[[ Line: 213 ]]
    p54.sceneLightingMaid:DoCleaning()
end
function u28.setupFallingObjects(p55) --[[ Line: 216 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u4
        [3] = u25
        [4] = u14
        [5] = u9
        [6] = u15
        [7] = u19
        [8] = u26
    --]]
    local v60 = u24.ProjectileHit:connect(function(p56) --[[ Line: 217 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u25
            [3] = u14
            [4] = u9
            [5] = u15
            [6] = u19
            [7] = u26
        --]]
        if p56:isCancelled() then
            return nil
        end
        local v57 = p56.hitData.hitCFrame
        if p56.projectileType ~= "halloween_obby_falling_object" then
            return nil
        end
        u4:playSound(u25.STOMPER_HIT, {
            ["position"] = v57.Position
        })
        local v58 = u14.LocalPlayer.Character
        if v58 ~= nil then
            v58 = (v58:GetPrimaryPartCFrame().Position - v57.Position).Magnitude
        end
        if v58 ~= 0 and (v58 == v58 and v58) then
            v58 = v58 < 20
        end
        if v58 ~= 0 and (v58 == v58 and v58) then
            u9.Controllers.ScreenShakeController:shake(v57.Position, Vector3.new(0, -1, 0))
        end
        local u59 = u15.Assets.Effects.Stomper:Clone()
        if not u59.PrimaryPart then
            return nil
        end
        u59.PrimaryPart.Position = v57.Position
        u59.Parent = u19
        u26:playEffects({ u59 }, nil)
        task.delay(0.5, function() --[[ Line: 254 ]]
            --[[
            Upvalues:
                [1] = u59
            --]]
            u59:Destroy()
        end)
    end)
    p55.sceneMaid:GiveTask(v60)
end
function u28.setupRollingObjects(u61) --[[ Line: 260 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u10
        [3] = u4
        [4] = u25
    --]]
    local v67 = u5("ActiveRollingObject", function(p62) --[[ Line: 261 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u61
            [3] = u4
            [4] = u25
        --]]
        local v63 = p62:WaitForChild("Boulder")
        p62.PrimaryPart = v63
        local u64 = u10.new()
        u61.sceneMaid:GiveTask(u64)
        local u65 = u4:playSound(u25.ROLLING_BOULDER_LOOP, {
            ["looped"] = true,
            ["volumeMultiplier"] = 1.3,
            ["rollOffMinDistance"] = 50,
            ["rollOffMaxDistance"] = 200,
            ["parent"] = v63
        })
        u64:GiveTask(function() --[[ Line: 273 ]]
            --[[
            Upvalues:
                [1] = u65
            --]]
            local v66 = u65
            if v66 ~= nil then
                v66:Destroy()
            end
        end)
        u61.sceneMaid:GiveTask(p62.Destroying:Connect(function() --[[ Line: 299 ]]
            --[[
            Upvalues:
                [1] = u64
            --]]
            u64:DoCleaning()
        end))
    end)
    u61.sceneMaid:GiveTask(v67)
end
function u28.setupEntryGate(u68) --[[ Line: 305 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u19
        [3] = u16
        [4] = u14
        [5] = u18
    --]]
    local u69 = u68.sceneAssets
    if u69 ~= nil then
        u69 = u69.EntryGate
    end
    if u69 then
        local v70 = u69.EntryGate.GateLeft.Poles.OpenGatePrompt
        if not v70 then
            return nil
        end
        u9.Controllers.ProximityPromptController:createProximityPrompt({
            ["ActionText"] = "Start Obby",
            ["ObjectText"] = "Get Ready!",
            ["HoldDuration"] = 2,
            ["MaxActivationDistance"] = 12,
            ["RequiresLineOfSight"] = false,
            ["Parent"] = v70
        }).Triggered:Connect(function(_) --[[ Line: 324 ]]
            --[[
            Upvalues:
                [1] = u68
            --]]
            u68.remotes:Get("ActivateObbyScene"):SendToServer()
        end)
        u68.remotes:Get("ObbyActivatedScene"):Connect(function() --[[ Line: 327 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u16
                [3] = u14
                [4] = u18
                [5] = u69
                [6] = u68
            --]]
            local u71 = u19.CurrentCamera
            if not u71 then
                return nil
            end
            u16:BindToRenderStep("obby-player-vis", Enum.RenderPriority.Last.Value - 1, function() --[[ Line: 333 ]]
                --[[
                Upvalues:
                    [1] = u14
                --]]
                local v72 = u14.LocalPlayer.Character
                if v72 ~= nil then
                    for v73, v74 in v72:GetDescendants() do
                        local _ = v73 - 1
                        if v74:IsA("BasePart") then
                            v74.LocalTransparencyModifier = 0
                        end
                    end
                end
            end)
            local u75 = u71.CameraType
            u71.CameraType = Enum.CameraType.Scriptable
            local v76 = u18:Create(u71, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                ["CFrame"] = u69.EntryCutscene.GateCameraPos.CFrame
            })
            v76:Play()
            u68:animateGateOpen(u69.EntryGate)
            local u77 = nil
            u77 = v76.Completed:Connect(function() --[[ Line: 357 ]]
                --[[
                Upvalues:
                    [1] = u77
                    [2] = u69
                    [3] = u18
                    [4] = u71
                --]]
                u77:Disconnect()
                local v78 = u69.EntryCutscene.FogRisingCameraPos
                local v79 = u18:Create(u71, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    ["CFrame"] = v78.CFrame
                })
                v79:Play()
                local u80 = nil
                u80 = v79.Completed:Connect(function() --[[ Line: 365 ]]
                    --[[
                    Upvalues:
                        [1] = u80
                    --]]
                    u80:Disconnect()
                end)
            end)
            task.delay(5, function() --[[ Line: 370 ]]
                --[[
                Upvalues:
                    [1] = u71
                    [2] = u75
                    [3] = u16
                --]]
                u71.CameraType = u75
                u16:UnbindFromRenderStep("obby-player-vis")
            end)
        end)
    end
end
function u28.setupBridgeTest(u81) --[[ Line: 377 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u9
        [3] = u2
    --]]
    local v86 = u5("obby_bridge_test_evaluator", function(p82) --[[ Line: 378 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u81
            [3] = u2
        --]]
        u9.Controllers.ProximityPromptController:createProximityPrompt({
            ["ActionText"] = "Open Gate",
            ["ObjectText"] = "Locked Gate",
            ["HoldDuration"] = 2,
            ["MaxActivationDistance"] = 12,
            ["RequiresLineOfSight"] = false,
            ["Parent"] = p82
        }).Triggered:Connect(function(_) --[[ Line: 388 ]]
            --[[
            Upvalues:
                [1] = u81
                [2] = u2
            --]]
            u81.remotes:Get("EvaluateBridgeTest"):CallServerAsync():andThen(function(p83) --[[ Line: 390 ]]
                --[[
                Upvalues:
                    [1] = u2
                --]]
                if not p83 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        ["message"] = "Can\'t open the gate. I should check the bridge for clues"
                    })
                end
            end)
        end)
        u81.remotes:Get("BridgeTestSuccess"):Connect(function() --[[ Line: 400 ]]
            --[[
            Upvalues:
                [1] = u81
            --]]
            local v84 = u81.sceneAssets
            if v84 ~= nil then
                v84 = v84.BridgeTestSection.BridgeLeftGate
            end
            local v85 = u81.sceneAssets
            if v85 ~= nil then
                v85 = v85.BridgeTestSection.BridgeRightGate
            end
            if v84 and v85 then
                u81:animateGateOpen(v84)
                u81:animateGateOpen(v85)
            end
        end)
    end)
    u81.sceneMaid:GiveTask(v86)
end
function u28.setupWinArea(p87) --[[ Line: 419 ]]
    local v88 = p87.sceneAssets
    if v88 ~= nil then
        v88 = v88.WinningRoom
    end
    if not v88 then
        return nil
    end
    p87:setupEscapeRope()
end
function u28.setupEscapeRope(u89) --[[ Line: 430 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u2
        [3] = u10
        [4] = u19
        [5] = u18
        [6] = u14
        [7] = u11
        [8] = u21
        [9] = u20
    --]]
    local u90 = u89.sceneAssets
    if u90 ~= nil then
        u90 = u90.WinningRoom
    end
    if not u90 then
        return nil
    end
    local u91 = u90.Rope
    local v92 = {
        ["ActionText"] = "Escape!",
        ["ObjectText"] = "Rope",
        ["HoldDuration"] = 2,
        ["MaxActivationDistance"] = 12,
        ["RequiresLineOfSight"] = false,
        ["Parent"] = u91.ProximityPrompt
    }
    local v93 = u9.Controllers.ProximityPromptController:createProximityPrompt(v92)
    u89.sceneMaid:GiveTask(v93.Triggered:Connect(function(_) --[[ Line: 449 ]]
        --[[
        Upvalues:
            [1] = u89
            [2] = u2
        --]]
        u89.remotes:Get("AttemptEscapeObby"):CallServerAsync():andThen(function(p94) --[[ Line: 451 ]]
            --[[
            Upvalues:
                [1] = u2
            --]]
            if not p94 then
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = "Not all explorers are in the ending room!"
                })
            end
        end)
    end))
    u89.remotes:Get("EscapeObby"):Connect(function(u95) --[[ Line: 461 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u89
            [3] = u19
            [4] = u18
            [5] = u90
            [6] = u14
            [7] = u91
            [8] = u11
            [9] = u21
            [10] = u20
        --]]
        local u96 = u10.new()
        u89.sceneMaid:GiveTask(u96)
        local u97 = u19.CurrentCamera
        if not u97 then
            return nil
        end
        local u98 = u97.CameraType
        local u99 = u97.FieldOfView
        u97.CameraType = Enum.CameraType.Scriptable
        local v100 = u18:Create(u97, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            ["CFrame"] = u90.EscapeCutscene.ClimbingRope.CFrame
        })
        u18:Create(u97, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            ["FieldOfView"] = 35
        })
        v100:Play()
        u96:GiveTask((v100.Completed:Connect(function() --[[ Line: 479 ]]
            --[[
            Upvalues:
                [1] = u95
                [2] = u14
                [3] = u96
                [4] = u19
                [5] = u91
                [6] = u11
                [7] = u21
                [8] = u20
                [9] = u18
            --]]
            task.spawn(function() --[[ Line: 480 ]]
                --[[
                Upvalues:
                    [1] = u95
                    [2] = u14
                    [3] = u96
                    [4] = u19
                    [5] = u91
                    [6] = u11
                    [7] = u21
                    [8] = u20
                    [9] = u18
                --]]
                local v101 = u95.winningPlayers
                local function v112(p102) --[[ Line: 483 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                        [2] = u96
                    --]]
                    local u103 = u14:GetPlayerByUserId(p102)
                    if u103 ~= nil then
                        local v104 = u103.Character
                        if v104 ~= nil then
                            for v105, v106 in v104:GetDescendants() do
                                local _ = v105 - 1
                                if v106:IsA("BasePart") and v106.Transparency == 0 then
                                    v106.Transparency = 1
                                    v106:SetAttribute("CameraHidden", true)
                                end
                            end
                        end
                    end
                    u96:GiveTask(function() --[[ Line: 501 ]]
                        --[[
                        Upvalues:
                            [1] = u103
                        --]]
                        local v107 = u103
                        if v107 ~= nil then
                            local v108 = v107.Character
                            if v108 ~= nil then
                                for v109, v110 in v108:GetDescendants() do
                                    local _ = v109 - 1
                                    local v111 = v110:IsA("BasePart")
                                    if v111 then
                                        if v110.Name == "HumanoidRootPart" then
                                            v111 = false
                                        else
                                            v111 = v110:GetAttribute("CameraHidden")
                                        end
                                    end
                                    if v111 ~= 0 and (v111 == v111 and (v111 ~= "" and v111)) then
                                        v110.Transparency = 0
                                    end
                                end
                            end
                        end
                    end)
                end
                for v113, v114 in v101 do
                    v112(v114, v113 - 1, v101)
                end
                local v115 = u95.winningPlayers
                local function v127(p116) --[[ Line: 524 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                        [2] = u19
                        [3] = u91
                        [4] = u96
                        [5] = u11
                        [6] = u21
                        [7] = u20
                        [8] = u18
                    --]]
                    local u117 = u14:GetPlayerByUserId(p116)
                    local v118 = not u117
                    if not v118 then
                        local v119
                        if u117 == nil then
                            v119 = u117
                        else
                            v119 = u117.Character
                        end
                        v118 = not v119
                    end
                    if v118 then
                        return nil
                    end
                    u117.Character.Archivable = true
                    local u120 = u117.Character:Clone()
                    for v121, v122 in u120:GetDescendants() do
                        local _ = v121 - 1
                        if v122:IsA("BasePart") and v122.Name ~= "HumanoidRootPart" then
                            v122.Transparency = 0
                        end
                    end
                    u120.Parent = u19
                    local v123 = u91.Position
                    local v124 = -u91.Size.X / 2 - 1
                    local v125 = Vector3.new(v124, 15, 0)
                    u120:PivotTo(CFrame.new(v123 - v125) * CFrame.Angles(0, 1.5707963267948966, 0))
                    u96:GiveTask(function() --[[ Line: 557 ]]
                        --[[
                        Upvalues:
                            [1] = u120
                            [2] = u117
                        --]]
                        u120:Destroy()
                        if u117.Character then
                            u117.Character.Archivable = false
                        end
                    end)
                    local v126 = u120:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(u11("Animation", {
                        ["AnimationId"] = u21[u20.CLIMB_ROPE]
                    }))
                    v126.Looped = true
                    v126:Play()
                    if u120.PrimaryPart then
                        u18:Create(u120.PrimaryPart, TweenInfo.new(7), {
                            ["CFrame"] = u120:GetPrimaryPartCFrame() + Vector3.new(0, 40, 0)
                        }):Play()
                    end
                    task.wait(1)
                end
                for v128, v129 in v115 do
                    v127(v129, v128 - 1, v115)
                end
            end)
        end)))
        task.delay(8, function() --[[ Line: 593 ]]
            --[[
            Upvalues:
                [1] = u97
                [2] = u98
                [3] = u99
                [4] = u96
            --]]
            u97.CameraType = u98
            u97.FieldOfView = u99
            u96:DoCleaning()
        end)
    end)
end
u8.CreateController(u28.new())
return nil