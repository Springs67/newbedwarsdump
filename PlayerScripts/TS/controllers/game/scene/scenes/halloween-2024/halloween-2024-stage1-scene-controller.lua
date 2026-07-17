-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local SoundService = v5.SoundService;
local Workspace = v5.Workspace;
local HalloweenStageConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-stage-config").HalloweenStageConfig;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SceneKey = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseSceneController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-scene-controller").BaseSceneController;
local HalloweenQuestTracker = RuntimeLib.import(script, script.Parent.Parent.Parent, "ui", "halloween-quest-tracker").HalloweenQuestTracker;
local STAGE_1_ENVIRONMENT = RuntimeLib.import(script, script.Parent, "environments", "stage-1-environment").STAGE_1_ENVIRONMENT;
local u6 = { GameSound.SPEAR_STAB_1, GameSound.SPEAR_STAB_2, GameSound.SPEAR_STAB_3 };
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 40, Name: __tostring
        return "Halloween2024Stage1SceneController";
    end,

    __index = BaseSceneController
});
u7.__index = u7;

function u7.new(...) -- Line: 46
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 50
    -- upvalues: BaseSceneController (copy), SceneKey (copy), u3 (copy)
    BaseSceneController.constructor(p9, SceneKey.HALLOWEEN_2024_STAGE_1);
    p9.Name = "Halloween2024Stage1Scene";
    p9.exitCutscenePoints = {
        playerPositions = {},
        cameraPos = CFrame.new(),
        cameraLookAt = CFrame.new()
    };
    p9.sceneMaid = u3.new();
end;

function u7.KnitStart(p10) -- Line: 60
    -- upvalues: BaseSceneController (copy)
    BaseSceneController.KnitStart(p10);
end;

function u7.onSceneLoadingScreenStart(p11) -- Line: 63
end;

function u7.onSceneStart(u12) -- Line: 65
    -- upvalues: KnitClient (copy), u6 (copy), WatchCollectionTag (copy), KnitClient2 (copy), GameSound (copy), default (copy), HalloweenStageConfig (copy), Workspace (copy), u4 (copy), HalloweenQuestTracker (copy), Players (copy)
    KnitClient.Controllers.PreloadController:runPreload({
        sounds = u6
    });
    u12:setupEnvironment();
    u12:setupAmbientSounds();
    WatchCollectionTag("SpearGuard", function(p13) -- Line: 71
        -- upvalues: KnitClient2 (ref), GameSound (ref)
        if not p13:IsA("Model") then
            return nil;
        end;

        KnitClient2.Controllers.FootstepsController:hookCharacter(nil, p13, {
            volume = 3,
            rollOffMaxDistance = 100,
            walk = {
                GameSound.BLOCK_GRASS_FOOTSTEP_1,
                GameSound.BLOCK_GRASS_FOOTSTEP_2,
                GameSound.BLOCK_GRASS_FOOTSTEP_3,
                GameSound.BLOCK_GRASS_FOOTSTEP_4
            },
            run = {
                GameSound.BLOCK_GRASS_FOOTSTEP_1,
                GameSound.BLOCK_GRASS_FOOTSTEP_2,
                GameSound.BLOCK_GRASS_FOOTSTEP_3,
                GameSound.BLOCK_GRASS_FOOTSTEP_4
            }
        });
    end);
    default.Client:GetNamespace("Halloween2024Remotes"):Get("Stage1StartExitCutscene"):Connect(function(p14) -- Line: 82
        -- upvalues: u12 (copy)
        u12:exitCutscene();
    end);
    u12.exitCutscenePoints.cameraLookAt = u12.sceneAssets.Assets.Cutscene.ExitCutscene.CameraLookAt.CFrame;
    u12.exitCutscenePoints.cameraPos = u12.sceneAssets.Assets.Cutscene.ExitCutscene.CameraPos.CFrame;

    local function _(p15) -- Line: 88
        -- upvalues: u12 (copy)
        if not p15 then
            return nil;
        end;

        table.insert(u12.exitCutscenePoints.playerPositions, p15.CFrame);
    end;

    for i, child in u12.sceneAssets.Assets.Cutscene.ExitCutscene.PlayerPositions:GetChildren() do
        local _ = i - 1;

        if child then
            table.insert(u12.exitCutscenePoints.playerPositions, child.CFrame);
        end;
    end;

    local v16 = {
        {
            completed = false,
            description = "Mine crystals to open the gate.",
            currentProgress = 0,
            totalProgress = HalloweenStageConfig.STAGE1_CRYSTAL_AMOUNT
        }
    };
    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera ~= nil then
        CurrentCamera = CurrentCamera.ViewportSize.Y;
    end;

    local u17 = u4.mount(u4.createElement(HalloweenQuestTracker, {
        CurrentTasks = v16,
        ScreenSizeY = CurrentCamera == nil and 374 or CurrentCamera
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    u12.sceneMaid:GiveTask(function() -- Line: 120
        -- upvalues: u4 (ref), u17 (copy)
        u4.unmount(u17);
    end);
end;

function u7.onSceneShutdown(p18) -- Line: 124
    p18.sceneMaid:DoCleaning();
end;

function u7.setupEnvironment(p19) -- Line: 127
    -- upvalues: KnitClient (copy), STAGE_1_ENVIRONMENT (copy)
    KnitClient.Controllers.EnvironmentController:setupEnvironment(STAGE_1_ENVIRONMENT);
end;

function u7.setupAmbientSounds(p20) -- Line: 130
    -- upvalues: SoundService (copy), SoundManager (copy), GameSound (copy)
    local _ = SoundService.AmbientReverb;
    SoundService.AmbientReverb = Enum.ReverbType.Forest;
    p20.sceneMaid:GiveTask(function() -- Line: 133
        -- upvalues: SoundService (ref)
        SoundService.AmbientReverb = Enum.ReverbType.NoReverb;
    end);
    local u21 = SoundManager:playSound(GameSound.GRAVEYARD_AMBIENCE_LOOP, {
        looped = true
    });
    p20.sceneMaid:GiveTask(function() -- Line: 140
        -- upvalues: u21 (copy)
        local v22 = u21;

        if v22 ~= nil then
            v22:Stop();
        end;

        local v23 = u21;

        if v23 ~= nil then
            v23:Destroy();
        end;
    end);
    local u24 = SoundManager:playSound(GameSound.GRAVEYARD_MUSIC_LOOP, {
        looped = true
    });
    p20.sceneMaid:GiveTask(function() -- Line: 154
        -- upvalues: u24 (copy)
        local v25 = u24;

        if v25 ~= nil then
            v25:Stop();
        end;

        local v26 = u24;

        if v26 ~= nil then
            v26:Destroy();
        end;
    end);
end;

function u7.exitCutscene(p27) -- Line: 165
end;

KnitClient.CreateController(u7.new());

return nil;