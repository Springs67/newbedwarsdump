local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.SoundService
local u13 = v10.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-stage-config").HalloweenStageConfig
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = v1.import(script, script.Parent.Parent.Parent, "base-scene-controller").BaseSceneController
local u19 = v1.import(script, script.Parent.Parent.Parent, "ui", "halloween-quest-tracker").HalloweenQuestTracker
local u20 = v1.import(script, script.Parent, "environments", "stage-1-environment").STAGE_1_ENVIRONMENT
local u21 = { u17.SPEAR_STAB_1, u17.SPEAR_STAB_2, u17.SPEAR_STAB_3 }
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 40 ]]
        return "Halloween2024Stage1SceneController"
    end,
    ["__index"] = u18
})
u22.__index = u22
function u22.new(...) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u16
        [3] = u8
    --]]
    u18.constructor(p25, u16.HALLOWEEN_2024_STAGE_1)
    p25.Name = "Halloween2024Stage1Scene"
    p25.exitCutscenePoints = {
        ["playerPositions"] = {},
        ["cameraPos"] = CFrame.new(),
        ["cameraLookAt"] = CFrame.new()
    }
    p25.sceneMaid = u8.new()
end
function u22.KnitStart(p26) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    u18.KnitStart(p26)
end
function u22.onSceneLoadingScreenStart(_) --[[ Line: 63 ]] end
function u22.onSceneStart(u27) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u21
        [3] = u4
        [4] = u7
        [5] = u17
        [6] = u15
        [7] = u14
        [8] = u13
        [9] = u9
        [10] = u19
        [11] = u11
    --]]
    local v28 = {
        ["sounds"] = u21
    }
    u6.Controllers.PreloadController:runPreload(v28)
    u27:setupEnvironment()
    u27:setupAmbientSounds()
    u4("SpearGuard", function(p29) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u17
        --]]
        if not p29:IsA("Model") then
            return nil
        end
        u7.Controllers.FootstepsController:hookCharacter(nil, p29, {
            ["volume"] = 3,
            ["rollOffMaxDistance"] = 100,
            ["walk"] = {
                u17.BLOCK_GRASS_FOOTSTEP_1,
                u17.BLOCK_GRASS_FOOTSTEP_2,
                u17.BLOCK_GRASS_FOOTSTEP_3,
                u17.BLOCK_GRASS_FOOTSTEP_4
            },
            ["run"] = {
                u17.BLOCK_GRASS_FOOTSTEP_1,
                u17.BLOCK_GRASS_FOOTSTEP_2,
                u17.BLOCK_GRASS_FOOTSTEP_3,
                u17.BLOCK_GRASS_FOOTSTEP_4
            }
        })
    end)
    u15.Client:GetNamespace("Halloween2024Remotes"):Get("Stage1StartExitCutscene"):Connect(function(_) --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:exitCutscene()
    end)
    u27.exitCutscenePoints.cameraLookAt = u27.sceneAssets.Assets.Cutscene.ExitCutscene.CameraLookAt.CFrame
    u27.exitCutscenePoints.cameraPos = u27.sceneAssets.Assets.Cutscene.ExitCutscene.CameraPos.CFrame
    for v30, v31 in u27.sceneAssets.Assets.Cutscene.ExitCutscene.PlayerPositions:GetChildren() do
        local _ = v30 - 1
        if v31 then
            local v32 = u27.exitCutscenePoints.playerPositions
            local v33 = v31.CFrame
            table.insert(v32, v33)
        end
    end
    local v34 = {
        {
            ["completed"] = false,
            ["description"] = "Mine crystals to open the gate.",
            ["currentProgress"] = 0,
            ["totalProgress"] = u14.STAGE1_CRYSTAL_AMOUNT
        }
    }
    local v35 = u13.CurrentCamera
    if v35 ~= nil then
        v35 = v35.ViewportSize.Y
    end
    local v36 = v35 == nil and 374 or v35
    local u37 = u9.mount(u9.createElement(u19, {
        ["CurrentTasks"] = v34,
        ["ScreenSizeY"] = v36
    }), u11.LocalPlayer:WaitForChild("PlayerGui"))
    u27.sceneMaid:GiveTask(function() --[[ Line: 120 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u37
        --]]
        u9.unmount(u37)
    end)
end
function u22.onSceneShutdown(p38) --[[ Line: 124 ]]
    p38.sceneMaid:DoCleaning()
end
function u22.setupEnvironment(_) --[[ Line: 127 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u20
    --]]
    u6.Controllers.EnvironmentController:setupEnvironment(u20)
end
function u22.setupAmbientSounds(p39) --[[ Line: 130 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u3
        [3] = u17
    --]]
    local _ = u12.AmbientReverb
    u12.AmbientReverb = Enum.ReverbType.Forest
    p39.sceneMaid:GiveTask(function() --[[ Line: 133 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12.AmbientReverb = Enum.ReverbType.NoReverb
    end)
    local u40 = u3:playSound(u17.GRAVEYARD_AMBIENCE_LOOP, {
        ["looped"] = true
    })
    p39.sceneMaid:GiveTask(function() --[[ Line: 140 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        local v41 = u40
        if v41 ~= nil then
            v41:Stop()
        end
        local v42 = u40
        if v42 ~= nil then
            v42:Destroy()
        end
    end)
    local u43 = u3:playSound(u17.GRAVEYARD_MUSIC_LOOP, {
        ["looped"] = true
    })
    p39.sceneMaid:GiveTask(function() --[[ Line: 154 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        local v44 = u43
        if v44 ~= nil then
            v44:Stop()
        end
        local v45 = u43
        if v45 ~= nil then
            v45:Destroy()
        end
    end)
end
function u22.exitCutscene(_) --[[ Line: 165 ]] end
u6.CreateController(u22.new())
return nil