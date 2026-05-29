local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local u6 = v2.WatchCharacter
local u7 = v2.WatchCollectionTag
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u17 = v16.CollectionService
local u18 = v16.Lighting
local u19 = v16.Players
local u20 = v16.ReplicatedStorage
local u21 = v16.RunService
local u22 = v16.SoundService
local u23 = v16.TweenService
local u24 = v16.Workspace
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u27 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "viewport-portal-magic", "model-skybox", "model-skybox").ModelSkybox
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "types", "maze").MazeRoleName
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u35 = v1.import(script, script.Parent.Parent.Parent.Parent, "base-scene-controller").BaseSceneController
local u36 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 41 ]]
        return "HalloweenMazeSceneController"
    end,
    ["__index"] = u35
})
u36.__index = u36
function u36.new(...) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u36
    --]]
    local v37 = u36
    local v38 = setmetatable({}, v37)
    return v38:constructor(...) or v38
end
function u36.constructor(p39) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u35
        [2] = u32
        [3] = u13
        [4] = u25
    --]]
    u35.constructor(p39, u32.HALLOWEEN_MAZE)
    p39.Name = "HalloweenMazeSceneController"
    p39.sceneMaid = u13.new()
    p39.roleChanged = u25.new()
    p39.mazeEntryCutsceneComplete = u25.new()
    p39.lightingSetup = false
    p39.lightingSetupComplete = u25.new()
end
function u36.KnitStart(p40) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u35
    --]]
    u35.KnitStart(p40)
end
function u36.onSceneLoadingScreenStart(p41) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u28
        [3] = u34
    --]]
    u9.Controllers.PreloadController:runPreload({
        ["animations"] = {
            u28.LARGE_FALL_1,
            u28.LARGE_FALL_2,
            u28.LARGE_FALL_3,
            u28.RIFT_REVIVE
        },
        ["sounds"] = { u34.MAZE_FALL_INTO_CAVE }
    })
    p41:setupLighting()
    p41:setupSoundAmbience()
end
function u36.onSceneStart(u42) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u20
        [3] = u24
        [4] = u15
        [5] = u17
        [6] = u14
        [7] = u19
        [8] = u27
        [9] = u6
        [10] = u7
        [11] = u31
        [12] = u3
        [13] = u29
        [14] = u28
        [15] = u5
        [16] = u34
        [17] = u10
        [18] = u21
        [19] = u30
        [20] = u26
        [21] = u11
    --]]
    if u42.sceneAssets == nil then
        u12.Error("No scene assets for halloween maze scene")
        return nil
    end
    u42.keeper = u20.Assets.Misc.GraveKeeper:Clone()
    u42.keeper.Parent = u24
    for _, v43 in u42.keeper:GetDescendants() do
        if v43:IsA("BasePart") then
            v43.LocalTransparencyModifier = 1
        end
    end
    u42.sceneMaid:GiveTask(function() --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        local v44 = u42.keeper
        if v44 ~= nil then
            v44:Destroy()
        end
        u42.keeper = nil
    end)
    local u45 = u42.sceneAssets.Maze:Clone()
    u45.Name = "SmallMaze"
    u45.Parent = u24
    u15(u45, 0.01)
    local v46 = u42.sceneAssets.SmallClonePosition.Position
    u45:PivotTo(CFrame.new(v46))
    u17:AddTag(u42.sceneAssets.SmallClonePosition, "MazeInteractionPart")
    u42.smallMaze = u45
    u42.bigMaze = u42.sceneAssets.Maze
    u42.sceneMaid:GiveTask(u42.mazeEntryCutsceneComplete:Connect(function() --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u45
        --]]
        u14("Highlight", {
            ["Enabled"] = true,
            ["FillTransparency"] = 0.5,
            ["OutlineTransparency"] = 0,
            ["DepthMode"] = Enum.HighlightDepthMode.Occluded,
            ["FillColor"] = Color3.fromRGB(0, 255, 238),
            ["OutlineColor"] = Color3.fromRGB(255, 255, 255)
        }).Parent = u45
    end))
    u42:checkMazeRole()
    u42.sceneMaid:GiveTask(u19.LocalPlayer:GetAttributeChangedSignal("MazeRole"):Connect(function() --[[ Line: 112 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        u42:checkMazeRole()
    end))
    for _, v47 in u45.Finish:GetChildren() do
        if v47:IsA("Sound") then
            v47:Destroy()
        end
    end
    u42.sceneMaid:GiveTask(function() --[[ Line: 121 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        local v48 = u42.smallMaze
        if v48 ~= nil then
            v48:Destroy()
        end
        u42.smallMaze = nil
    end)
    u42.sceneMaid:GiveTask(function() --[[ Line: 128 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        local v49 = u42.bigMaze
        if v49 ~= nil then
            v49:Destroy()
        end
        u42.bigMaze = nil
    end)
    u42.skybox = u27.new(v46)
    u42.skybox.pos = u42.sceneAssets.Maze:GetPivot().Position
    u42.sceneMaid:GiveTask(function() --[[ Line: 137 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        local v50 = u42.skybox
        if v50 ~= nil then
            v50:destroy()
        end
    end)
    u42.sceneMaid:GiveTask(u6(function(_, u51) --[[ Line: 143 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        task.delay(5, function() --[[ Line: 144 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u51
            --]]
            local v52 = u42.skybox
            if v52 ~= nil then
                v52:trackCharacter(u51)
            end
        end)
    end))
    u42.sceneMaid:GiveTask(u7("ActiveMazeBoss", function(p53) --[[ Line: 151 ]]
        if p53:IsA("BasePart") then
            p53.Transparency = 1
        end
    end))
    u31.Client:WaitFor("PlayEntryCutscene"):andThen(function(p54) --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        u42.sceneMaid:GiveTask(p54:Connect(function(p55) --[[ Line: 157 ]]
            --[[
            Upvalues:
                [1] = u42
            --]]
            u42:playEntryCutscene(p55)
        end))
    end)
    u31.Client:WaitFor("ReappearInCaveAnimation"):andThen(function(p56) --[[ Line: 161 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u3
            [3] = u19
            [4] = u29
            [5] = u28
        --]]
        u42.sceneMaid:GiveTask(p56:Connect(function(_) --[[ Line: 162 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u19
                [3] = u29
                [4] = u28
            --]]
            u3:playAnimation(u19.LocalPlayer, u29:getAssetId(u28.RIFT_REVIVE), {})
        end))
    end)
    u31.Client:WaitFor("StartEndMazeCutscene"):andThen(function(p57) --[[ Line: 166 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u12
            [3] = u24
        --]]
        u42.sceneMaid:GiveTask(p57:Connect(function(_) --[[ Line: 167 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u42
                [3] = u24
            --]]
            u12.Debug("Starting end maze cutscene")
            u42:fade(function() --[[ Line: 170 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                u24.CurrentCamera.CameraType = Enum.CameraType.Scriptable
                u24.CurrentCamera.CFrame = CFrame.lookAt(Vector3.new(48, 69.727, 84.603), Vector3.new(88, 50.487, 46))
            end)
            task.delay(3, function() --[[ Line: 174 ]]
                --[[
                Upvalues:
                    [1] = u42
                    [2] = u24
                --]]
                u42:fade(function() --[[ Line: 176 ]]
                    --[[
                    Upvalues:
                        [1] = u24
                    --]]
                    u24.CurrentCamera.CameraType = Enum.CameraType.Scriptable
                    u24.CurrentCamera.CFrame = CFrame.lookAt(Vector3.new(34, 68.639, 62), Vector3.new(104, 58.374, 60))
                end)
                task.delay(3, function() --[[ Line: 180 ]]
                    --[[
                    Upvalues:
                        [1] = u24
                    --]]
                    u24.CurrentCamera.CameraType = Enum.CameraType.Custom
                end)
            end)
        end))
    end)
    u31.Client:WaitFor("GravekeeperDeath"):andThen(function(p58) --[[ Line: 186 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u24
            [3] = u29
            [4] = u28
            [5] = u3
            [6] = u5
            [7] = u34
            [8] = u19
            [9] = u10
            [10] = u21
            [11] = u30
            [12] = u26
            [13] = u11
        --]]
        u42.sceneMaid:GiveTask(p58:Connect(function(u59) --[[ Line: 187 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u24
                [3] = u29
                [4] = u28
                [5] = u3
                [6] = u5
                [7] = u34
                [8] = u19
                [9] = u10
                [10] = u21
                [11] = u30
                [12] = u26
                [13] = u11
            --]]
            if u42.keeper == nil then
                return nil
            end
            u42.keeper:PivotTo(u59.spot.CFrame)
            u42.keeper.Parent = u24
            for _, v60 in u42.keeper:GetDescendants() do
                if v60:IsA("BasePart") then
                    v60.LocalTransparencyModifier = 0
                end
            end
            local u61 = u42.keeper:FindFirstChild("Humanoid")
            if u61 ~= nil then
                u61 = u61:FindFirstChild("Animator")
            end
            local v62 = u3:playAnimation(u61, (u29:getAssetId(u28.KEEPER_SPAWN)))
            u5:playSound(u34.KEEPER_SUMMON, {
                ["rollOffMaxDistance"] = 100,
                ["rollOffMinDistance"] = 30,
                ["position"] = u59.spot.CFrame.Position
            })
            local u63 = u5:playSound(u34.KEEPER_LOOP, {
                ["rollOffMaxDistance"] = 100,
                ["rollOffMinDistance"] = 30,
                ["position"] = u59.spot.CFrame.Position
            })
            local u64
            if u59.target == u19.LocalPlayer then
                u64 = u10.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    ["moveSpeedMultiplier"] = 0
                })
                u21:BindToRenderStep("graveyardkeeper-death-vis", Enum.RenderPriority.Last.Value - 1, function() --[[ Line: 222 ]]
                    --[[
                    Upvalues:
                        [1] = u19
                    --]]
                    local v65 = u19.LocalPlayer.Character
                    if v65 ~= nil then
                        for v66, v67 in v65:GetDescendants() do
                            local _ = v66 - 1
                            if v67:IsA("BasePart") then
                                v67.LocalTransparencyModifier = 0
                            end
                        end
                    end
                end)
                u24.CurrentCamera.CameraType = Enum.CameraType.Scriptable
                task.spawn(function() --[[ Line: 238 ]]
                    --[[
                    Upvalues:
                        [1] = u21
                        [2] = u59
                        [3] = u24
                    --]]
                    u21.Heartbeat:Wait()
                    local v68 = CFrame
                    local v69 = u59.spot.Position + Vector3.new(0, 6, -15)
                    local v70 = u59.spot.Position
                    u24.CurrentCamera.CFrame = v68.lookAt(v69, v70 + Vector3.new(0, 6, 0))
                end)
            else
                u64 = nil
            end
            if v62 and v62 ~= nil then
                v62.Stopped:Connect(function() --[[ Line: 252 ]]
                    --[[
                    Upvalues:
                        [1] = u3
                        [2] = u61
                        [3] = u29
                        [4] = u28
                        [5] = u21
                        [6] = u64
                        [7] = u5
                        [8] = u34
                        [9] = u59
                        [10] = u19
                        [11] = u10
                        [12] = u30
                        [13] = u42
                        [14] = u26
                        [15] = u11
                        [16] = u63
                        [17] = u24
                    --]]
                    local u71 = u3:playAnimation(u61, u29:getAssetId(u28.KEEPER_ATTACK))
                    local u72 = nil
                    u72 = u21.Heartbeat:Connect(function() --[[ Line: 255 ]]
                        --[[
                        Upvalues:
                            [1] = u71
                            [2] = u72
                            [3] = u64
                            [4] = u5
                            [5] = u34
                            [6] = u59
                            [7] = u19
                            [8] = u10
                            [9] = u30
                        --]]
                        if u71 then
                            local v73 = u71
                            if v73 ~= nil then
                                v73 = v73.TimePosition
                            end
                            local v74 = u71
                            if v74 ~= nil then
                                v74 = v74.Length
                            end
                            if v74 * 0.1 < v73 then
                                u72:Disconnect()
                                if u64 ~= nil then
                                    u64.Destroy()
                                end
                                u5:playSound(u34.KEEPER_ATTACK, {
                                    ["rollOffMaxDistance"] = 100,
                                    ["volumeMultiplier"] = 1.5,
                                    ["rollOffMinDistance"] = 30,
                                    ["position"] = u59.spot.CFrame.Position
                                })
                                if u59.target == u19.LocalPlayer then
                                    u10.Controllers.DamageController:requestSelfDeath(u30.SWORD)
                                    return
                                end
                            end
                        else
                            u72:Disconnect()
                        end
                    end)
                    if u71 ~= nil then
                        u71.Stopped:Connect(function() --[[ Line: 286 ]]
                            --[[
                            Upvalues:
                                [1] = u3
                                [2] = u61
                                [3] = u29
                                [4] = u28
                                [5] = u42
                                [6] = u59
                                [7] = u26
                                [8] = u11
                                [9] = u63
                                [10] = u24
                                [11] = u21
                            --]]
                            u3:playAnimation(u61, u29:getAssetId(u28.KEEPER_IDLE))
                            task.delay(1.5, function() --[[ Line: 288 ]]
                                --[[
                                Upvalues:
                                    [1] = u42
                                    [2] = u59
                                    [3] = u26
                                    [4] = u11
                                    [5] = u63
                                    [6] = u24
                                    [7] = u21
                                --]]
                                u26(1, u11, function(p75) --[[ Line: 289 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u42
                                    --]]
                                    local v76 = u42.keeper
                                    if v76 ~= nil then
                                        v76:PivotTo(CFrame.new(p75))
                                    end
                                end, u59.spot.Position, u59.spot.Position + Vector3.new(0, -20, 0)):Wait()
                                local v77 = u63
                                if v77 ~= nil then
                                    v77:Stop()
                                end
                                if u42.keeper then
                                    for _, v78 in u42.keeper:GetDescendants() do
                                        if v78:IsA("BasePart") then
                                            v78.LocalTransparencyModifier = 1
                                        end
                                    end
                                end
                                u24.CurrentCamera.CameraType = Enum.CameraType.Custom
                                u21:UnbindFromRenderStep("graveyardkeeper-death-vis")
                            end)
                        end)
                    end
                end)
            end
        end))
    end)
end
function u36.onSceneShutdown(p79) --[[ Line: 322 ]]
    p79.sceneMaid:DoCleaning()
end
function u36.fade(_, p80) --[[ Line: 325 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u14
        [3] = u26
        [4] = u11
    --]]
    local u81 = u18:FindFirstChildOfClass("ColorCorrectionEffect") or u14("ColorCorrectionEffect", {
        ["Parent"] = u18
    })
    u26(0.5, u11, function(p82) --[[ Line: 329 ]]
        --[[
        Upvalues:
            [1] = u81
        --]]
        u81.TintColor = p82
    end, Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 0, 0)):Wait()
    p80()
    u26(0.5, u11, function(p83) --[[ Line: 333 ]]
        --[[
        Upvalues:
            [1] = u81
        --]]
        u81.TintColor = p83
    end, Color3.fromRGB(0, 0, 0), Color3.fromRGB(255, 255, 255)):Wait()
end
function u36.checkMazeRole(u84) --[[ Line: 337 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u33
    --]]
    local u85 = u19.LocalPlayer:GetAttribute("MazeRole")
    if u85 ~= nil then
        u84.mazeEntryCutsceneComplete:Connect(function() --[[ Line: 340 ]]
            --[[
            Upvalues:
                [1] = u85
                [2] = u33
                [3] = u84
            --]]
            if u85 == u33.ILLUMINATOR then
                task.spawn(function() --[[ Line: 353 ]]
                    --[[
                    Upvalues:
                        [1] = u84
                    --]]
                    if u84.bigMaze then
                        for _, v86 in u84.bigMaze:GetDescendants() do
                            if v86:IsA("BasePart") then
                                v86.Transparency = 1
                                task.wait()
                            end
                        end
                    end
                end)
            else
                task.spawn(function() --[[ Line: 342 ]]
                    --[[
                    Upvalues:
                        [1] = u84
                    --]]
                    if u84.smallMaze then
                        for _, v87 in u84.smallMaze:GetDescendants() do
                            if v87:IsA("BasePart") then
                                v87.Transparency = 1
                                task.wait()
                            end
                        end
                    end
                end)
            end
        end)
    end
    if u85 ~= nil then
        u84.roleChanged:Fire(u85)
    end
end
function u36.setupLighting(p88) --[[ Line: 370 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u14
        [3] = u18
    --]]
    p88.sceneMaid:GiveTask(u10.Controllers.LightingController.skyModifier:addModifier(100, {
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
    p88.sceneMaid:GiveTask(u10.Controllers.LightingController.lightingModifier:addModifier(100, {
        ["Brightness"] = 0.1,
        ["ClockTime"] = 14,
        ["GeographicLatitude"] = -30,
        ["Ambient"] = Color3.fromRGB(69, 65, 76),
        ["ColorShift_Bottom"] = Color3.fromRGB(127, 71, 71),
        ["ColorShift_Top"] = Color3.fromRGB(131, 115, 177),
        ["OutdoorAmbient"] = Color3.fromRGB(61, 65, 76)
    }))
    p88.sceneMaid:GiveTask(u10.Controllers.LightingController:getAtmosphereModifier():addModifier(100, {
        ["Density"] = 0.48,
        ["Offset"] = 0,
        ["Glare"] = 1,
        ["Haze"] = 10,
        ["Color"] = Color3.fromRGB(54, 53, 65),
        ["Decay"] = Color3.fromRGB(34, 45, 47)
    }))
    p88.sceneMaid:GiveTask(u10.Controllers.LightingController.sunRayModifier:addModifier(100, {
        ["Intensity"] = 0.005,
        ["Spread"] = 0.4,
        ["Enabled"] = false
    }))
    p88.sceneMaid:GiveTask(u10.Controllers.LightingController.colorCorrectionModifier:addModifier(100, {
        ["Brightness"] = -0.05,
        ["Contrast"] = 0.1,
        ["Saturation"] = -0.05,
        ["TintColor"] = Color3.fromRGB(255, 255, 255)
    }))
    p88.sceneMaid:GiveTask(u10.Controllers.LightingController.skyModifier:addModifier(100, {
        ["CelestialBodiesShown"] = false
    }))
    local v89 = {
        ["Name"] = "HalloweenMazeDepthOfField",
        ["FarIntensity"] = 0.75,
        ["FocusDistance"] = 20,
        ["InFocusRadius"] = 20,
        ["NearIntensity"] = 0,
        ["Parent"] = u18
    }
    p88.sceneMaid:GiveTask(u14("DepthOfFieldEffect", v89))
    p88.lightingSetup = true
    p88.lightingSetupComplete:Fire()
end
function u36.setupSoundAmbience(p90) --[[ Line: 428 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u34
        [3] = u22
        [4] = u5
    --]]
    local v91 = p90.sceneMaid
    local v92 = u10.Controllers.FootstepsController.footstepModifier
    local v93 = {
        ["soundConfig"] = {
            ["walk"] = {
                u34.FOOTSTEP_CAVES_1,
                u34.FOOTSTEP_CAVES_2,
                u34.FOOTSTEP_CAVES_3,
                u34.FOOTSTEP_CAVES_4
            },
            ["run"] = {
                u34.FOOTSTEP_CAVES_1,
                u34.FOOTSTEP_CAVES_2,
                u34.FOOTSTEP_CAVES_3,
                u34.FOOTSTEP_CAVES_4
            }
        }
    }
    v91:GiveTask(v92:addModifier(v93))
    u22.AmbientReverb = Enum.ReverbType.StoneRoom
    p90.sceneMaid:GiveTask(function() --[[ Line: 438 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22.AmbientReverb = Enum.ReverbType.NoReverb
    end)
    local u94 = u5:playSound(u34.CAVE_AMBIENCE, {
        ["looped"] = true
    })
    p90.sceneMaid:GiveTask(function() --[[ Line: 444 ]]
        --[[
        Upvalues:
            [1] = u94
        --]]
        local v95 = u94
        if v95 ~= nil then
            v95:Stop()
        end
    end)
end
function u36.playEntryCutscene(u96, u97) --[[ Line: 451 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u13
        [3] = u19
        [4] = u28
        [5] = u29
        [6] = u4
        [7] = u5
        [8] = u34
        [9] = u23
    --]]
    local u98 = u24.CurrentCamera
    if not (u98 and u96.sceneAssets) then
        return nil
    end
    local u99 = u13.new()
    local v100 = u97.illuminators
    local function v105(p101) --[[ Line: 460 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u99
        --]]
        local v102 = u19:GetPlayerByUserId(p101)
        if v102 ~= nil then
            v102 = v102.Character
        end
        if not v102 then
            return nil
        end
        for v103, u104 in v102:GetDescendants() do
            local _ = v103 - 1
            if u104:IsA("BasePart") then
                u104.LocalTransparencyModifier = 1
                u99:GiveTask(function() --[[ Line: 474 ]]
                    --[[
                    Upvalues:
                        [1] = u104
                    --]]
                    u104.LocalTransparencyModifier = 0
                end)
            end
        end
    end
    for v106, v107 in v100 do
        v105(v107, v106 - 1, v100)
    end
    local u108 = u98.CameraType
    local u109 = u98.CFrame
    local u110 = u98.FieldOfView
    u98.CameraType = Enum.CameraType.Scriptable
    local u111 = u96.sceneAssets.EntryCutscene.MazeControllerFallingCam
    local u112 = u96.sceneAssets.EntryCutscene.MiniMazeZoomCam
    local u113 = { u28.LARGE_FALL_1, u28.LARGE_FALL_2, u28.LARGE_FALL_3 }
    local function u126(u114, p115) --[[ Line: 494 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u24
            [3] = u29
            [4] = u4
            [5] = u113
            [6] = u5
            [7] = u34
            [8] = u99
        --]]
        local v116 = u13.new()
        u114.Archivable = true
        v116:GiveTask(function() --[[ Line: 498 ]]
            --[[
            Upvalues:
                [1] = u114
            --]]
            u114.Archivable = false
        end)
        local u117 = u114:Clone()
        if u117.PrimaryPart then
            u117.PrimaryPart.Anchored = false
            u117.PrimaryPart.CanCollide = false
        end
        for v118, v119 in u117:GetDescendants() do
            local _ = v118 - 1
            if v119:IsA("BasePart") then
                v119.LocalTransparencyModifier = 1
            end
        end
        local v120 = CFrame
        local v121 = u117:GetPrimaryPartCFrame().Position
        local v122 = u117:GetPrimaryPartCFrame().Position
        u117:PivotTo(v120.lookAt(v121, v122 + (p115 or Vector3.new(0, 0, -5))))
        u117.Parent = u24
        v116:GiveTask(u117)
        local v123 = u113
        u117:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(u29:getAnimation(u4.fromList(unpack(v123)))):Play()
        task.delay(0.2, function() --[[ Line: 529 ]]
            --[[
            Upvalues:
                [1] = u117
            --]]
            for v124, v125 in u117:GetDescendants() do
                local _ = v124 - 1
                if v125:IsA("BasePart") then
                    v125.LocalTransparencyModifier = 0
                end
            end
        end)
        task.delay(0.5, function() --[[ Line: 540 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u34
            --]]
            u5:playSound(u34.MAZE_FALL_INTO_CAVE, {
                ["volumeMultiplier"] = 0.8
            })
        end)
        u99:GiveTask(v116)
        return v116
    end
    task.spawn(function() --[[ Line: 548 ]]
        --[[
        Upvalues:
            [1] = u96
            [2] = u98
            [3] = u111
            [4] = u97
            [5] = u19
            [6] = u126
            [7] = u23
            [8] = u112
            [9] = u108
            [10] = u109
            [11] = u110
            [12] = u99
        --]]
        if not u96.lightingSetup then
            u96.lightingSetupComplete:Wait()
        end
        u98.CFrame = u111.CFrame
        task.wait(3)
        for v127, v128 in u97.illuminators do
            local _ = v127 - 1
            local v129 = u19:GetPlayerByUserId(v128)
            local v130 = not v129
            if not v130 then
                local v131
                if v129 == nil then
                    v131 = v129
                else
                    v131 = v129.Character
                end
                v130 = not v131
            end
            if not v130 then
                u126(v129.Character, Vector3.new(5, 0, 0))
                task.wait(1)
            end
        end
        task.wait(2)
        local v132 = u23:Create(u98, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            ["CFrame"] = u112.CFrame
        })
        v132:Play()
        u23:Create(u98, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            ["FieldOfView"] = 60
        }):Play()
        u96.sceneMaid:GiveTask(v132.Completed:Connect(function() --[[ Line: 585 ]]
            --[[
            Upvalues:
                [1] = u108
                [2] = u98
                [3] = u109
                [4] = u110
                [5] = u96
                [6] = u99
            --]]
            task.wait(5)
            local v133 = u108
            print("RESTORING CAMERA: " .. tostring(v133))
            u98.CameraType = u108
            u98.CFrame = u109
            u98.FieldOfView = u110
            u96.mazeEntryCutsceneComplete:Fire()
            u96:fade(function() --[[ Line: 592 ]]
                --[[
                Upvalues:
                    [1] = u99
                --]]
                u99:DoCleaning()
            end)
        end))
    end)
end
u9.CreateController(u36.new())
return nil