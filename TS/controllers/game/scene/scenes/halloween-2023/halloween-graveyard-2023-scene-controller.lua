-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v6.Players;
local RunService = v6.RunService;
local TweenService = v6.TweenService;
local Workspace = v6.Workspace;
local u7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local HalloweenEventEnvironment = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "games", "halloween-event", "ambient", "halloween-event-environment").HalloweenEventEnvironment;
local FadeUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "fade", "fade-util").FadeUtil;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local v8 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "constants", "halloween-graveyard-2023-scene-constants");
local CandleColorsPair = v8.CandleColorsPair;
local CandleOctavePair = v8.CandleOctavePair;
local SceneKey = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseSceneController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-scene-controller").BaseSceneController;
local CandlesDiscovered = RuntimeLib.import(script, script.Parent.Parent.Parent, "ui", "candles-discovered").CandlesDiscovered;
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 63, Name: __tostring
        return "HalloweenGraveyard2023SceneController";
    end,

    __index = BaseSceneController
});
u9.__index = u9;

function u9.new(...) -- Line: 69
    -- upvalues: u9 (ref)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11) -- Line: 73
    -- upvalues: BaseSceneController (copy), SceneKey (copy), default2 (copy), u3 (copy), u7 (copy)
    BaseSceneController.constructor(p11, SceneKey.HALLOWEEN_GRAVEYARD_2023);
    p11.Name = "HalloweenGraveyard2023Scene";
    p11.remotes = default2.Client:GetNamespace("HalloweenGraveyard2023");
    p11.entryCutscenePoints = {
        altarCameraPos = CFrame.new(),
        altarCameraLookAt = CFrame.new(),
        gateCameraPos = CFrame.new(),
        gateCameraLookAt = CFrame.new()
    };
    p11.exitCutscenePoints = {
        altarCameraPos = CFrame.new(),
        altarCameraLookAt = CFrame.new()
    };
    p11.sceneMaid = u3.new();
    p11.sceneSignals = {
        candlesDiscoveredSignal = u7.new()
    };
end;

function u9.KnitStart(p12) -- Line: 92
    -- upvalues: BaseSceneController (copy)
    BaseSceneController.KnitStart(p12);
end;

function u9.onSceneLoadingScreenStart(p13) -- Line: 95
    -- upvalues: KnitClient (copy), AnimationType (copy), GameSound (copy)
    KnitClient.Controllers.PreloadController:runPreload({
        animations = { AnimationType.HALLOWEEN_ALTAR_JUMP },
        sounds = { GameSound.SKULL_ALTAR, GameSound.GATE_OPENING }
    });
    p13:setupEnvironment();
    p13:startAudioLoops();
end;

function u9.onSceneStart(p14) -- Line: 103
    p14:parseCutscenePoints();
    p14:handleServerEvents();
    p14:setupGateButton();
end;

function u9.onSceneShutdown(p15) -- Line: 112
    -- upvalues: u5 (copy)
    p15.sceneMaid:DoCleaning();

    if p15.candlesDiscoveredTree then
        u5.unmount(p15.candlesDiscoveredTree);
    end;
end;

function u9.setupEnvironment(p16) -- Line: 119
    -- upvalues: KnitClient (copy), HalloweenEventEnvironment (copy)
    KnitClient.Controllers.EnvironmentController:setupEnvironment(HalloweenEventEnvironment);
end;

function u9.cleanupEnvironment(p17) -- Line: 122
    -- upvalues: KnitClient (copy)
    KnitClient.Controllers.EnvironmentController:cleanupEnvironment();
end;

function u9.startAudioLoops(p18) -- Line: 125
    -- upvalues: SoundManager (copy), GameSound (copy)
    local u19 = SoundManager:playSound(GameSound.GRAVEYARD_AMBIENCE_LOOP, {
        looped = true
    });
    p18.sceneMaid:GiveTask(function() -- Line: 130
        -- upvalues: u19 (copy)
        local v20 = u19;

        if v20 ~= nil then
            v20:Stop();
        end;

        local v21 = u19;

        if v21 ~= nil then
            v21:Destroy();
        end;
    end);
    local u22 = SoundManager:playSound(GameSound.GRAVEYARD_MUSIC_LOOP, {
        looped = true
    });
    p18.sceneMaid:GiveTask(function() -- Line: 144
        -- upvalues: u22 (copy)
        local v23 = u22;

        if v23 ~= nil then
            v23:Stop();
        end;

        local v24 = u22;

        if v24 ~= nil then
            v24:Destroy();
        end;
    end);
end;

function u9.parseCutscenePoints(p25) -- Line: 155
    p25.entryCutscenePoints.gateCameraPos = p25.sceneAssets.Assets.Cutscenes.EntryCutscene.GateCameraPos.CFrame;
    p25.entryCutscenePoints.gateCameraLookAt = p25.sceneAssets.Assets.Cutscenes.EntryCutscene.GateCameraLookAt.CFrame;
    p25.entryCutscenePoints.altarCameraPos = p25.sceneAssets.Assets.Cutscenes.EntryCutscene.AltarCameraPos.CFrame;
    p25.entryCutscenePoints.altarCameraLookAt = p25.sceneAssets.Assets.Cutscenes.EntryCutscene.AltarCameraLookAt.CFrame;
    p25.exitCutscenePoints.altarCameraPos = p25.sceneAssets.Assets.Cutscenes.ExitCutscene.AltarCameraPos.CFrame;
    p25.exitCutscenePoints.altarCameraLookAt = p25.sceneAssets.Assets.Cutscenes.ExitCutscene.AltarCameraLookAt.CFrame;
end;

function u9.handleServerEvents(u26) -- Line: 165
    u26.remotes:OnEvent("GateOpenSuccess", function() -- Line: 167
        -- upvalues: u26 (copy)
        u26:openGate();
    end);
    u26.remotes:OnEvent("CandleColorCheck", function() -- Line: 170
        -- upvalues: u26 (copy)
        u26:check();
    end);
    u26.remotes:OnEvent("PuzzleSolved", function() -- Line: 173
        -- upvalues: u26 (copy)
        u26:exitCutscene();
    end);
    u26.remotes:OnEvent("CandleDiscovered", function(p27) -- Line: 176
        -- upvalues: u26 (copy)
        u26.sceneSignals.candlesDiscoveredSignal:Fire(p27.candleCount);
    end);
end;

function u9.showCandlesDiscoveredUI(p28) -- Line: 180
    -- upvalues: u5 (copy), CandlesDiscovered (copy), Players (copy)
    p28.candlesDiscoveredTree = u5.mount(u5.createElement(CandlesDiscovered, {
        candlesDiscoveredSignal = p28.sceneSignals.candlesDiscoveredSignal
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
end;

function u9.setupGateButton(u29) -- Line: 186
    -- upvalues: KnitClient2 (copy)
    local sceneAssets = u29.sceneAssets;

    if sceneAssets ~= nil then
        sceneAssets = sceneAssets.Assets.GateButton.Button;
    end;

    if not sceneAssets then
        return nil;
    end;

    u29.gatePrompt = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
        ActionText = "Open Gate",
        MaxActivationDistance = 8,
        HoldDuration = 2,
        RequiresLineOfSight = false,
        Parent = sceneAssets
    });
    local u30 = nil;
    u30 = u29.gatePrompt.Triggered:Connect(function() -- Line: 204
        -- upvalues: u29 (copy), u30 (ref)
        u29.remotes:Get("GateOpenRequest"):SendToServer();
        u30:Disconnect();

        if u29.gatePrompt then
            u29.gatePrompt:Destroy();
        end;
    end);
end;

function u9.openGate(p31) -- Line: 213
    -- upvalues: TweenService (copy), SoundManager (copy), GameSound (copy)
    if p31.gatePrompt then
        p31.gatePrompt:Destroy();
    end;

    local sceneAssets = p31.sceneAssets;

    if sceneAssets ~= nil then
        sceneAssets = sceneAssets.Assets.Entrance.EntranceGateLeft.Hinge;
    end;

    if not sceneAssets then
        return nil;
    end;

    local sceneAssets2 = p31.sceneAssets;

    if sceneAssets2 ~= nil then
        sceneAssets2 = sceneAssets2.Assets.Entrance.EntranceGateRight.Hinge;
    end;

    if not sceneAssets2 then
        return nil;
    end;

    local v32 = sceneAssets.CFrame * CFrame.Angles(0, 1.0471975511965976, 0);
    local v33 = sceneAssets2.CFrame * CFrame.Angles(0, -1.0471975511965976, 0);
    local v34 = TweenInfo.new(4, Enum.EasingStyle.Sine);
    TweenService:Create(sceneAssets, v34, {
        CFrame = v32
    }):Play();
    TweenService:Create(sceneAssets2, v34, {
        CFrame = v33
    }):Play();
    SoundManager:playSound(GameSound.GATE_OPENING);
    p31:entryCutscene();
end;

function u9.entryCutscene(u35) -- Line: 253
    -- upvalues: RunService (copy), Players (copy), Workspace (copy), TweenService (copy), GameAnimationUtil (copy), AnimationType (copy), AnimationUtil (copy), FadeUtil (copy)
    RunService:BindToRenderStep("graveyard-player-vis", Enum.RenderPriority.Last.Value - 1, function() -- Line: 255
        -- upvalues: Players (ref)
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            local function _(p36) -- Line: 259
                if p36:IsA("BasePart") then
                    p36.LocalTransparencyModifier = 0;
                end;
            end;

            for i, descendant in Character:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    descendant.LocalTransparencyModifier = 0;
                end;
            end;
        end;
    end);
    local CurrentCamera = Workspace.CurrentCamera;

    if not CurrentCamera then
        return nil;
    end;

    local CameraType = CurrentCamera.CameraType;
    local CFrame2 = CurrentCamera.CFrame;
    CurrentCamera.CameraType = Enum.CameraType.Scriptable;
    local v37 = TweenService:Create(CurrentCamera, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        CFrame = CFrame.lookAt(u35.entryCutscenePoints.gateCameraPos.Position, u35.entryCutscenePoints.gateCameraLookAt.Position)
    });
    v37:Play();
    local u38 = nil;
    u38 = v37.Completed:Connect(function() -- Line: 284
        -- upvalues: u38 (ref), TweenService (ref), CurrentCamera (copy), u35 (copy), GameAnimationUtil (ref), AnimationType (ref), AnimationUtil (ref)
        u38:Disconnect();
        local v39 = TweenService:Create(CurrentCamera, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            CFrame = CFrame.lookAt(u35.entryCutscenePoints.altarCameraPos.Position, u35.entryCutscenePoints.altarCameraLookAt.Position)
        });
        v39:Play();
        local u40 = nil;
        u40 = v39.Completed:Connect(function() -- Line: 292
            -- upvalues: u35 (ref), TweenService (ref), GameAnimationUtil (ref), AnimationType (ref), AnimationUtil (ref), u40 (ref)
            TweenService:Create(u35.sceneAssets.Assets.Altar.Model.Eyes, TweenInfo.new(1), {
                Color = Color3.fromRGB(200, 0, 0)
            }):Play();
            TweenService:Create(u35.sceneAssets.Assets.Altar.Model.Aura.SurfaceGui.ImageLabel, TweenInfo.new(1), {
                ImageTransparency = 0.8
            }):Play();
            local u41 = AnimationUtil:playAnimation(u35.sceneAssets.Assets.Altar.Model.AnimationController.Animator, GameAnimationUtil:getAssetId(AnimationType.HALLOWEEN_ALTAR_LOOP), {
                looped = true,
                speed = 0.25
            });
            u35.sceneMaid:GiveTask(function() -- Line: 312
                -- upvalues: u41 (copy)
                local v42 = u41;

                if v42 ~= nil then
                    v42:Stop();
                end;

                local v43 = u41;

                if v43 ~= nil then
                    v43:Destroy();
                end;
            end);
            task.delay(1, function() -- Line: 323
                -- upvalues: u35 (ref)
                u35:check();
            end);
            u40:Disconnect();
        end);
    end);
    task.delay(25, function() -- Line: 329
        -- upvalues: FadeUtil (ref), CurrentCamera (copy), CameraType (copy), CFrame2 (copy), RunService (ref), u35 (copy)
        FadeUtil:fade(0.5, 1, 0.5);
        task.delay(1, function() -- Line: 331
            -- upvalues: CurrentCamera (ref), CameraType (ref), CFrame2 (ref)
            CurrentCamera.CameraType = CameraType;
            CurrentCamera.CFrame = CFrame2;
        end);
        task.delay(0.6, function() -- Line: 335
            -- upvalues: RunService (ref)
            RunService:UnbindFromRenderStep("graveyard-player-vis");
        end);
        u35:showCandlesDiscoveredUI();
    end);
end;

function u9.check(u44) -- Line: 341
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy), AnimationUtil (copy), SoundManager (copy), GameSound (copy), CandleColorsPair (copy), TweenService (copy), u4 (copy), CandleOctavePair (copy)
    local v45 = AnimationUtil:playAnimation(u44.sceneAssets.Assets.Altar.Model.AnimationController.Animator, GameAnimationUtil:getAssetId(AnimationType.HALLOWEEN_ALTAR_SKULL_ROTATE), {
        speed = 0.3
    });
    local u46 = u44.sceneAssets.Assets.Altar.Points:GetChildren();

    if not u46 then
        return nil;
    end;

    local u47 = 0;

    if v45 then
        SoundManager:playSound(GameSound.SKULL_ALTAR);
        v45:GetMarkerReachedSignal("altarPoint"):Connect(function(u48) -- Line: 355
            -- upvalues: u46 (copy), CandleColorsPair (ref), TweenService (ref), u44 (copy), u47 (ref), GameSound (ref), SoundManager (ref), u4 (ref), CandleOctavePair (ref)
            local function _(p49) -- Line: 356
                -- upvalues: u48 (copy)
                return p49.Name == u48;
            end;

            local u50 = nil;

            for i, v in u46 do
                local _ = i - 1;

                if v.Name == u48 == true then
                    u50 = v;
                    break;
                end;
            end;

            if not u50 then
                return nil;
            end;

            local v51 = u50:GetAttribute("Color");
            u50.Color = CandleColorsPair[v51];
            task.delay(5, function() -- Line: 374
                -- upvalues: TweenService (ref), u50 (copy)
                TweenService:Create(u50, TweenInfo.new(3), {
                    Color = Color3.fromRGB(54, 7, 3)
                }):Play();
            end);
            local v52 = u44.sceneAssets.Assets.Altar.Candles:GetChildren();
            local v53;

            if v52 then
                local function _(p54) -- Line: 382
                    -- upvalues: u50 (copy)
                    return p54:GetAttribute("AltarPoint") == u50.Name;
                end;

                local v55 = nil;

                for i, v in v52 do
                    local _ = i - 1;

                    if v:GetAttribute("AltarPoint") == u50.Name == true then
                        v55 = v;
                        break;
                    end;
                end;

                local v56;

                if v55 == nil then
                    v56 = v55;
                else
                    v56 = v55:FindFirstChildWhichIsA("Beam");
                end;

                if u50:GetAttribute("CandleColor") == u50:GetAttribute("Color") then
                    if v55 and not v56 then
                        local v57 = u44.sceneAssets.Assets.Extras.Beam:Clone();
                        v57.Parent = v55;
                        v57.Attachment0 = v55.MeshPart.Attachment;
                        v57.Attachment1 = u44.sceneAssets.Assets.Altar.Model.Skull.Attachment;
                        v57.Enabled = true;
                    end;

                    u47 = u47 + 1;
                    v53 = GameSound.HALLOWEEN_BOSS_RUNE_EXPLODE;
                else
                    if v56 ~= nil then
                        v56:Destroy();
                    end;

                    v53 = GameSound.HALLOWEEN_BOSS_HIT;
                end;
            else
                v53 = GameSound.HALLOWEEN_BOSS_HIT;
            end;

            u4("PitchShiftSoundEffect", {
                Parent = SoundManager:playModifiableSound(v53, {
                    rollOffMaxDistance = 100,
                    position = u44.sceneAssets.Assets.Altar.Model.Skull.Position
                }),
                Octave = CandleOctavePair[v51]
            });
        end);
    end;

    task.delay(12, function() -- Line: 430
        -- upvalues: u47 (ref), u44 (copy)
        if u47 < 8 then
            u44:playExplosion();
        end;
    end);
end;

function u9.playExplosion(p58) -- Line: 436
    -- upvalues: SoundManager (copy), GameSound (copy), Workspace (copy), default (copy), Linear (copy), KnitClient (copy)
    SoundManager:playSound(GameSound.HALLOWEEN_BOSS_SPAWN, {
        position = p58.sceneAssets.Assets.Altar.Model.Skull.Position
    });
    local u59 = p58.sceneAssets.Assets.Extras.CurseExplosionEffect:Clone();
    u59.Parent = Workspace;
    u59:PivotTo(p58.sceneAssets.Assets.Altar.Model.Skull.CFrame);
    local u62 = default(1.5, Linear, function(u60) -- Line: 443
        -- upvalues: u59 (copy)
        u59:ScaleTo(80 * u60);
        u59:PivotTo(u59:GetPivot() * CFrame.Angles(0, 0.2617993877991494, 0));

        local function _(p61) -- Line: 450
            -- upvalues: u60 (copy)
            if p61:IsA("BasePart") then
                p61.LocalTransparencyModifier = math.max(0.5, u60);
            end;
        end;

        for i, child in u59:GetChildren() do
            local _ = i - 1;

            if child:IsA("BasePart") then
                child.LocalTransparencyModifier = math.max(0.5, u60);
            end;
        end;
    end);
    task.spawn(function() -- Line: 459
        -- upvalues: u62 (copy), u59 (copy)
        u62:Wait();
        u59:Destroy();
    end);
    KnitClient.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -4, 0), {
        cycles = 16,
        duration = 2,
        magnitude = 0.8
    });
end;

function u9.exitCutscene(u63) -- Line: 469
    -- upvalues: Workspace (copy), KnitClient (copy), FadeUtil (copy), SoundManager (copy), GameSound (copy), TweenService (copy), EntityUtil (copy), RuntimeLib (copy), PlayerEntity (copy), RunService (copy), Players (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local CurrentCamera = Workspace.CurrentCamera;

    if not CurrentCamera then
        return nil;
    end;

    local CameraType = CurrentCamera.CameraType;
    local CFrame2 = CurrentCamera.CFrame;
    CurrentCamera.CameraType = Enum.CameraType.Scriptable;
    KnitClient.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -4, 0), {
        cycles = 24,
        duration = 3,
        magnitude = 0.8
    });
    FadeUtil:fade(0.12, 0.75, 0.12);
    task.delay(0.12, function() -- Line: 485
        -- upvalues: CurrentCamera (copy), u63 (copy), SoundManager (ref), GameSound (ref), TweenService (ref), EntityUtil (ref), RuntimeLib (ref), PlayerEntity (ref), RunService (ref), Players (ref), Workspace (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        CurrentCamera.CFrame = CFrame.lookAt(u63.exitCutscenePoints.altarCameraPos.Position, u63.exitCutscenePoints.altarCameraLookAt.Position);
        local u64 = SoundManager:playModifiableSound(GameSound.ROCK_RUMBLE);

        if u64 then
            u64.PlaybackRegionsEnabled = true;
            u64.PlaybackRegion = NumberRange.new(0, 4);
            task.delay(2, function() -- Line: 491
                -- upvalues: TweenService (ref), u64 (copy)
                TweenService:Create(u64, TweenInfo.new(2), {
                    Volume = 0
                }):Play();
            end);
        end;

        local function _(p65) -- Line: 499
            -- upvalues: EntityUtil (ref)
            return EntityUtil:getEntity(p65);
        end;

        local v66 = 0;
        local v67 = {};

        for i, v in EntityUtil:getAliveEntityInstances() do
            local _ = i - 1;
            local v68 = EntityUtil:getEntity(v);

            if v68 ~= nil then
                v66 = v66 + 1;
                v67[v66] = v68;
            end;
        end;

        local function _(p69) -- Line: 513
            -- upvalues: RuntimeLib (ref), PlayerEntity (ref)
            return RuntimeLib.instanceof(p69, PlayerEntity);
        end;

        local v70 = 0;
        local v71 = {};

        for i, v in v67 do
            local _ = i - 1;

            if RuntimeLib.instanceof(v, PlayerEntity) == true then
                v70 = v70 + 1;
                v71[v70] = v;
            end;
        end;

        local v72 = u63.sceneAssets.Assets.Cutscenes.ExitCutscene.PlayerPositions:GetChildren();
        local v73 = false;
        local v74 = 0;

        while true do
            if v73 then
                v74 = v74 + 1;
            else
                v73 = true;
            end;

            if v74 >= #v71 then
                return;
            end;

            local v75 = v71[v74 + 1];
            local CFrame3 = v72[v74 % #v72 + 1].CFrame;

            if CFrame3 then
                local u76 = v75:getInstance();
                u76.Archivable = true;
                local u77 = u76:Clone();
                u76.Archivable = false;
                local u78 = "graveyard-player-invis-" .. tostring(v74);
                RunService:BindToRenderStep(u78 .. tostring(v74), Enum.RenderPriority.Last.Value - 1, function() -- Line: 550
                    -- upvalues: Players (ref), u76 (copy)
                    local v79 = Players:GetPlayerFromCharacter(u76);

                    if v79 ~= nil then
                        local Character = v79.Character;

                        if Character ~= nil then
                            local function _(p80) -- Line: 557
                                if p80:IsA("BasePart") then
                                    p80.LocalTransparencyModifier = 1;
                                end;
                            end;

                            for i, descendant in Character:GetDescendants() do
                                local _ = i - 1;

                                if descendant:IsA("BasePart") then
                                    descendant.LocalTransparencyModifier = 1;
                                end;
                            end;
                        end;
                    end;
                end);
                task.delay(11.88, function() -- Line: 568
                    -- upvalues: RunService (ref), u78 (copy)
                    RunService:UnbindFromRenderStep(u78);
                end);

                if u77 then
                    u77.Parent = Workspace;
                    u77.PrimaryPart.Anchored = true;
                    u77:PivotTo(CFrame3);
                    u63.sceneMaid:GiveTask(u77);
                    task.delay(v74 * 2 + 1, function() -- Line: 578
                        -- upvalues: AnimationUtil (ref), u77 (copy), GameAnimationUtil (ref), AnimationType (ref), u63 (ref)
                        local u81 = AnimationUtil:playAnimation(u77, GameAnimationUtil:getAssetId(AnimationType.HALLOWEEN_ALTAR_JUMP));

                        if u81 then
                            u81:GetMarkerReachedSignal("pause"):Connect(function() -- Line: 581
                                -- upvalues: u81 (copy)
                                u81:AdjustSpeed(0);
                            end);
                            u63.sceneMaid:GiveTask(function() -- Line: 584
                                -- upvalues: u81 (copy)
                                u81:Stop();
                                u81:Destroy();
                            end);
                        end;
                    end);
                end;
            end;
        end;
    end);
    task.delay(12, function() -- Line: 594
        -- upvalues: FadeUtil (ref), CurrentCamera (copy), CameraType (copy), CFrame2 (copy)
        FadeUtil:fade(0.5, 2, 0.5):andThen(function() -- Line: 596
            -- upvalues: CurrentCamera (ref), CameraType (ref), CFrame2 (ref)
            CurrentCamera.CameraType = CameraType;
            CurrentCamera.CFrame = CFrame2;
        end);
    end);
end;

KnitClient.CreateController(u9.new());

return nil;