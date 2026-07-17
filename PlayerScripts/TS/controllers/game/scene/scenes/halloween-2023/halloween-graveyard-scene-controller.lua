-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local RunService = v6.RunService;
local TweenService = v6.TweenService;
local Workspace = v6.Workspace;
local u7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local HalloweenEventEnvironment = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "games", "halloween-event", "ambient", "halloween-event-environment").HalloweenEventEnvironment;
local FadeUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "fade", "fade-util").FadeUtil;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SceneKey = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local BaseSceneController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-scene-controller").BaseSceneController;
local ClueDiscovered = RuntimeLib.import(script, script.Parent.Parent.Parent, "ui", "clue-discovered").ClueDiscovered;
local ClueHud = RuntimeLib.import(script, script.Parent.Parent.Parent, "ui", "clue-hud").ClueHud;
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 63, Name: __tostring
        return "HalloweenGraveyardSceneController";
    end,

    __index = BaseSceneController
});
u8.__index = u8;

function u8.new(...) -- Line: 69
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 73
    -- upvalues: BaseSceneController (copy), SceneKey (copy), default (copy), u3 (copy), u7 (copy)
    BaseSceneController.constructor(p10, SceneKey.HALLOWEEN_GRAVEYARD);
    p10.Name = "HalloweenGraveyardScene";
    p10.remotes = default.Client:GetNamespace("HalloweenGraveyard");
    p10.entryCutscenePoints = {
        bossCameraPos = CFrame.new(),
        bossCameraLookAt = CFrame.new(),
        gateCameraPos = CFrame.new(),
        gateCameraLookAt = CFrame.new()
    };
    p10.exitCutscenePoints = {
        digCameraPos = CFrame.new(),
        digCameraLookAt = CFrame.new()
    };
    p10.sceneMaid = u3.new();
    p10.sceneSignals = {
        clueDiscoveredSignal = u7.new()
    };
    p10.cluesDiscovered = {};
end;

function u8.KnitStart(p11) -- Line: 93
    -- upvalues: BaseSceneController (copy)
    BaseSceneController.KnitStart(p11);
end;

function u8.onSceneLoadingScreenStart(p12) -- Line: 96
    -- upvalues: KnitClient (copy), AnimationType (copy), GameSound (copy)
    KnitClient.Controllers.PreloadController:runPreload({
        animations = { AnimationType.KEEPER_SPAWN, AnimationType.KEEPER_ATTACK, AnimationType.KEEPER_WALK },
        sounds = { GameSound.KEEPER_SUMMON }
    });
    p12:setupEnvironment();
    p12:startAudioLoops();
end;

function u8.onSceneStart(p13) -- Line: 104
    -- upvalues: u5 (copy), ClueHud (copy), Players (copy)
    p13:parseCutscenePoints();
    p13:handleServerEvents();
    p13:setupGateButton();
    p13:setupGravePrompts();
    p13:setupClueRegions();
    p13.cludHudTree = u5.mount(u5.createElement(ClueHud, {
        clueDiscoveredSignal = p13.sceneSignals.clueDiscoveredSignal
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
end;

function u8.onSceneShutdown(p14) -- Line: 115
    -- upvalues: u5 (copy)
    p14.sceneMaid:DoCleaning();

    if p14.clueDiscoveredTree then
        u5.unmount(p14.clueDiscoveredTree);
    end;

    if p14.cludHudTree then
        u5.unmount(p14.cludHudTree);
    end;
end;

function u8.setupEnvironment(p15) -- Line: 125
    -- upvalues: KnitClient (copy), HalloweenEventEnvironment (copy)
    KnitClient.Controllers.EnvironmentController:setupEnvironment(HalloweenEventEnvironment);
end;

function u8.cleanupEnvironment(p16) -- Line: 128
    -- upvalues: KnitClient (copy)
    KnitClient.Controllers.EnvironmentController:cleanupEnvironment();
end;

function u8.startAudioLoops(p17) -- Line: 131
    -- upvalues: SoundManager (copy), GameSound (copy)
    local u18 = SoundManager:playSound(GameSound.GRAVEYARD_AMBIENCE_LOOP, {
        looped = true
    });
    p17.sceneMaid:GiveTask(function() -- Line: 136
        -- upvalues: u18 (copy)
        local v19 = u18;

        if v19 ~= nil then
            v19:Stop();
        end;

        local v20 = u18;

        if v20 ~= nil then
            v20:Destroy();
        end;
    end);
    local u21 = SoundManager:playSound(GameSound.GRAVEYARD_MUSIC_LOOP, {
        looped = true
    });
    p17.sceneMaid:GiveTask(function() -- Line: 150
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
end;

function u8.parseCutscenePoints(p24) -- Line: 161
    p24.entryCutscenePoints.gateCameraPos = p24.sceneAssets.Assets.Cutscenes.EntryCutscene.GateCameraPos.CFrame;
    p24.entryCutscenePoints.gateCameraLookAt = p24.sceneAssets.Assets.Cutscenes.EntryCutscene.GateCameraLookAt.CFrame;
    p24.entryCutscenePoints.bossCameraPos = p24.sceneAssets.Assets.Cutscenes.EntryCutscene.BossCameraPos.CFrame;
    p24.entryCutscenePoints.bossCameraLookAt = p24.sceneAssets.Assets.Cutscenes.EntryCutscene.BossCameraLookAt.CFrame;
    p24.exitCutscenePoints.digCameraPos = p24.sceneAssets.Assets.Cutscenes.ExitCutscene.DigCameraPos.CFrame;
    p24.exitCutscenePoints.digCameraLookAt = p24.sceneAssets.Assets.Cutscenes.ExitCutscene.DigCameraLookAt.CFrame;
end;

function u8.handleServerEvents(u25) -- Line: 172
    u25.remotes:OnEvent("GateOpenSuccess", function() -- Line: 174
        -- upvalues: u25 (copy)
        u25:openGate();
    end);
    u25.remotes:OnEvent("GraveDigResult", function(p26) -- Line: 178
        -- upvalues: u25 (copy)
        if p26.success then
            u25:onGraveDigSuccess(p26.player, p26.grave);

            return;
        end;

        u25:onGraveDigFail(p26.player);
    end);
    u25.remotes:OnEvent("ClueDiscovered", function(p27) -- Line: 185
        -- upvalues: u25 (copy)
        u25:onClueDiscovered(p27, false);
    end);
end;

function u8.setupGateButton(u28) -- Line: 189
    -- upvalues: KnitClient2 (copy)
    local sceneAssets = u28.sceneAssets;

    if sceneAssets ~= nil then
        sceneAssets = sceneAssets.Assets.GateButton.Button;
    end;

    if not sceneAssets then
        return nil;
    end;

    u28.gatePrompt = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
        ActionText = "Open Gate",
        MaxActivationDistance = 8,
        HoldDuration = 2,
        RequiresLineOfSight = false,
        Parent = sceneAssets
    });
    local u29 = nil;
    u29 = u28.gatePrompt.Triggered:Connect(function() -- Line: 207
        -- upvalues: u28 (copy), u29 (ref)
        u28.remotes:Get("GateOpenRequest"):SendToServer();
        u29:Disconnect();

        if u28.gatePrompt then
            u28.gatePrompt:Destroy();
        end;
    end);
end;

function u8.openGate(p30) -- Line: 216
    -- upvalues: TweenService (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), AnimationType (copy)
    if p30.gatePrompt then
        p30.gatePrompt:Destroy();
    end;

    local sceneAssets = p30.sceneAssets;

    if sceneAssets ~= nil then
        sceneAssets = sceneAssets.Assets.Entrance.EntranceGateLeft.Hinge;
    end;

    if not sceneAssets then
        return nil;
    end;

    local sceneAssets2 = p30.sceneAssets;

    if sceneAssets2 ~= nil then
        sceneAssets2 = sceneAssets2.Assets.Entrance.EntranceGateRight.Hinge;
    end;

    if not sceneAssets2 then
        return nil;
    end;

    local v31 = sceneAssets.CFrame * CFrame.Angles(0, 1.0471975511965976, 0);
    local v32 = sceneAssets2.CFrame * CFrame.Angles(0, -1.0471975511965976, 0);
    local v33 = TweenInfo.new(4, Enum.EasingStyle.Sine);
    TweenService:Create(sceneAssets, v33, {
        CFrame = v31
    }):Play();
    TweenService:Create(sceneAssets2, v33, {
        CFrame = v32
    }):Play();
    SoundManager:playSound(GameSound.GATE_OPENING);
    p30:entryCutscene();
    KnitClient.Controllers.PreloadController:runPreload({
        animations = { AnimationType.GRAVEYARD_DIG, AnimationType.GRAVEYARD_JUMP },
        sounds = { GameSound.WEREWOLF_HEARTBEAT, GameSound.KEEPER_ROAR, GameSound.KEEPER_ATTACK }
    });
end;

function u8.setupGravePrompts(u34) -- Line: 260
    -- upvalues: KnitClient2 (copy)
    local sceneAssets = u34.sceneAssets;

    if sceneAssets ~= nil then
        sceneAssets = sceneAssets.Assets.Graveyard:GetChildren();
    end;

    if not sceneAssets then
        return nil;
    end;

    local function v37(u35) -- Line: 270
        -- upvalues: KnitClient2 (ref), u34 (copy)
        local v36 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ActionText = "Dig Grave",
            MaxActivationDistance = 10,
            HoldDuration = 1,
            RequiresLineOfSight = false,
            Parent = u35.Bed.ProximityPrompt
        });

        if u34.digPrompts then
            table.insert(u34.digPrompts, v36);
            local _ = #u34.digPrompts;
        else
            u34.digPrompts = { v36 };
            local _ = u34.digPrompts;
        end;

        v36.Triggered:Connect(function() -- Line: 286
            -- upvalues: u34 (ref), u35 (copy)
            u34.remotes:Get("GraveDigRequest"):SendToServer({
                grave = u35
            });
        end);
    end;

    for i, v in sceneAssets do
        v37(v, i - 1, sceneAssets);
    end;
end;

function u8.setupClueRegions(u38) -- Line: 296
    -- upvalues: u4 (copy), Players (copy), u5 (copy), ClueDiscovered (copy)
    local sceneAssets = u38.sceneAssets;

    if sceneAssets ~= nil then
        sceneAssets = sceneAssets.Assets.Clues:GetChildren();
    end;

    if not sceneAssets then
        return nil;
    end;

    local function v44(p39) -- Line: 305
        -- upvalues: u4 (ref), Players (ref), u38 (copy)
        local u40 = p39:GetAttribute("Symbol");

        if u40 == "" or not u40 then
            return nil;
        end;

        local u41 = u4("Part", {
            Anchored = true,
            CanCollide = false,
            CanQuery = false,
            CanTouch = true,
            Size = Vector3.new(50, 40, 50),
            Transparency = 1,
            Position = p39.Position,
            Parent = p39
        });
        local u42 = nil;
        u42 = u41.Touched:Connect(function(p43) -- Line: 322
            -- upvalues: Players (ref), u38 (ref), u40 (copy), u42 (ref), u41 (copy)
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;
            end;

            if p43 ~= Character then
                return nil;
            end;

            if table.find(u38.cluesDiscovered, u40) ~= nil then
                return nil;
            end;

            table.insert(u38.cluesDiscovered, u40);
            u42:Disconnect();
            u41:Destroy();
            u38:onClueDiscovered(u40, true);
        end);
    end;

    for i, v in sceneAssets do
        v44(v, i - 1, sceneAssets);
    end;

    u38.clueDiscoveredTree = u5.mount(u5.createElement(ClueDiscovered, {
        clueDiscoveredSignal = u38.sceneSignals.clueDiscoveredSignal
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
end;

function u8.onClueDiscovered(p45, p46, p47) -- Line: 350
    -- upvalues: SoundManager (copy), GameSound (copy)
    SoundManager:playSound(GameSound.CLUE_DISCOVERED);

    if p47 then
        p45.remotes:Get("FoundClue"):SendToServer(p46);
    end;

    p45.sceneSignals.clueDiscoveredSignal:Fire(p46);
end;

function u8.entryCutscene(u48) -- Line: 357
    -- upvalues: RunService (copy), Players (copy), Workspace (copy), TweenService (copy), ReplicatedStorage (copy), GameAnimationUtil (copy), AnimationType (copy), AnimationUtil (copy), SoundManager (copy), GameSound (copy), FadeUtil (copy)
    RunService:BindToRenderStep("graveyard-player-vis", Enum.RenderPriority.Last.Value - 1, function() -- Line: 359
        -- upvalues: Players (ref)
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            local function _(p49) -- Line: 363
                if p49:IsA("BasePart") then
                    p49.LocalTransparencyModifier = 0;
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
    local v50 = TweenService:Create(CurrentCamera, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        CFrame = CFrame.lookAt(u48.entryCutscenePoints.gateCameraPos.Position, u48.entryCutscenePoints.gateCameraLookAt.Position)
    });
    v50:Play();
    local u51 = nil;
    local u52 = nil;
    u52 = v50.Completed:Connect(function() -- Line: 390
        -- upvalues: u52 (ref), TweenService (ref), CurrentCamera (copy), u48 (copy), u51 (ref), ReplicatedStorage (ref), GameAnimationUtil (ref), AnimationType (ref), Workspace (ref), AnimationUtil (ref), SoundManager (ref), GameSound (ref)
        u52:Disconnect();
        local v53 = TweenService:Create(CurrentCamera, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            CFrame = CFrame.lookAt(u48.entryCutscenePoints.bossCameraPos.Position, u48.entryCutscenePoints.bossCameraLookAt.Position)
        });
        v53:Play();
        local u54 = nil;
        u54 = v53.Completed:Connect(function() -- Line: 398
            -- upvalues: u54 (ref), u48 (ref), u51 (ref), ReplicatedStorage (ref), GameAnimationUtil (ref), AnimationType (ref), Workspace (ref), TweenService (ref), AnimationUtil (ref), SoundManager (ref), GameSound (ref)
            u54:Disconnect();
            local v55 = u48.entryCutscenePoints.bossCameraLookAt.Position - Vector3.new(0, 50, 0);
            u51 = ReplicatedStorage.Assets.Misc.GraveKeeper:Clone();
            u51:PivotTo(CFrame.new(v55));
            local Humanoid = u51:FindFirstChild("Humanoid");

            if Humanoid ~= nil then
                Humanoid = Humanoid:FindFirstChild("Animator");
            end;

            local v56 = GameAnimationUtil:getAssetId(AnimationType.KEEPER_SPAWN);
            u51.Parent = Workspace;
            local PrimaryPart = u51.PrimaryPart;
            local v57 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
            local v58 = {};
            local Position = u48.entryCutscenePoints.bossCameraLookAt.Position;
            local v59 = u51:GetExtentsSize().Y / 2;
            local v60 = Vector3.new(0, v59, 0);
            v58.CFrame = CFrame.new(Position + v60);
            TweenService:Create(PrimaryPart, v57, v58):Play();
            AnimationUtil:playAnimation(Humanoid, v56);
            SoundManager:playSound(GameSound.KEEPER_SUMMON);
            u48:applySceneScreenShake();
        end);
    end);
    task.delay(8, function() -- Line: 428
        -- upvalues: FadeUtil (ref), CurrentCamera (copy), CameraType (copy), CFrame2 (copy), u51 (ref), RunService (ref)
        FadeUtil:fade(0.5, 1, 0.5);
        task.delay(1, function() -- Line: 430
            -- upvalues: CurrentCamera (ref), CameraType (ref), CFrame2 (ref)
            CurrentCamera.CameraType = CameraType;
            CurrentCamera.CFrame = CFrame2;
        end);
        task.delay(0.6, function() -- Line: 434
            -- upvalues: u51 (ref), RunService (ref)
            local v61 = u51;

            if v61 ~= nil then
                v61:Destroy();
            end;

            RunService:UnbindFromRenderStep("graveyard-player-vis");
        end);
    end);
end;

function u8.onGraveDigSuccess(p62, u63, p64) -- Line: 443
    -- upvalues: RunService (copy), Players (copy), FadeUtil (copy), Workspace (copy), ReplicatedStorage (copy), WeldUtil (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    RunService:BindToRenderStep("graveyard-dig-vis", Enum.RenderPriority.Last.Value - 1, function() -- Line: 445
        -- upvalues: Players (ref)
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            local function _(p65) -- Line: 449
                if p65:IsA("BasePart") then
                    p65.LocalTransparencyModifier = 0;
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

    if u63 ~= Players.LocalPlayer then
        FadeUtil:fade(0.12, 0.75, 0.12);
    end;

    if p62.digPrompts then
        local function _(p66) -- Line: 466
            return p66:Destroy();
        end;

        for i, v in p62.digPrompts do
            local _ = i - 1;
            v:Destroy();
        end;
    end;

    local CurrentCamera = Workspace.CurrentCamera;

    if u63.Character and CurrentCamera then
        local CameraType = CurrentCamera.CameraType;
        local CFrame2 = CurrentCamera.CFrame;
        CurrentCamera.CameraType = Enum.CameraType.Scriptable;
        CurrentCamera.CFrame = CFrame.lookAt(p62.exitCutscenePoints.digCameraPos.Position, p64:GetPivot().Position or p62.exitCutscenePoints.digCameraLookAt.Position);
        ReplicatedStorage.Assets.Misc.Shovel:Clone().Parent = u63.Character;
        WeldUtil:weldCharacterAccessories(u63.Character);
        local u67 = AnimationUtil:playAnimation(u63, GameAnimationUtil:getAssetId(AnimationType.GRAVEYARD_DIG));
        SoundManager:playSound(GameSound.PIRATE_SHOVEL_DIG, {
            playbackSpeedMultiplier = 0.9
        });
        task.delay(4, function() -- Line: 489
            -- upvalues: u67 (copy), AnimationUtil (ref), u63 (copy), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), FadeUtil (ref), CurrentCamera (copy), CameraType (copy), CFrame2 (copy), RunService (ref)
            local v68 = u67;

            if v68 ~= nil then
                v68:Stop();
            end;

            local v69 = AnimationUtil:playAnimation(u63, GameAnimationUtil:getAssetId(AnimationType.GRAVEYARD_JUMP));
            SoundManager:playSound(GameSound.DUCK_JUMP, {
                playbackSpeedMultiplier = 1
            });

            if v69 ~= nil then
                v69 = v69.Length;
            end;

            task.delay(v69 == nil and 3 or v69, function() -- Line: 507
                -- upvalues: FadeUtil (ref), CurrentCamera (ref), CameraType (ref), CFrame2 (ref), RunService (ref)
                FadeUtil:fade(0.05, 2, 0.05):andThen(function() -- Line: 509
                    -- upvalues: CurrentCamera (ref), CameraType (ref), CFrame2 (ref)
                    CurrentCamera.CameraType = CameraType;
                    CurrentCamera.CFrame = CFrame2;
                end);
                task.delay(0.15000000000000002, function() -- Line: 514
                    -- upvalues: RunService (ref)
                    RunService:UnbindFromRenderStep("graveyard-dig-vis");
                end);
            end);
        end);
    end;
end;

function u8.onGraveDigFail(p70, p71) -- Line: 537
    -- upvalues: Players (copy), ReplicatedStorage (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy)
    if p71 == Players.LocalPlayer and p70.digPrompts then
        local function _(p72) -- Line: 541
            return p72:Destroy();
        end;

        for i, v in p70.digPrompts do
            local _ = i - 1;
            v:Destroy();
        end;
    end;

    local u73 = ReplicatedStorage.Assets.Effects.DigFail:Clone();
    u73.Anchored = true;
    local Character = p71.Character;

    if Character ~= nil then
        Character = Character:FindFirstChild("LeftFoot");
    end;

    if Character then
        u73.Position = Character.Position;
    end;

    u73.Parent = p70.sceneAssets;
    task.delay(4.2, function() -- Line: 561
        -- upvalues: EffectUtil (ref), u73 (copy), SoundManager (ref), GameSound (ref)
        EffectUtil:playEffects({ u73 }, nil);
        SoundManager:playSound(GameSound.HALLOWEEN_BOSS_RUNE_EXPLODE, {
            rollOffMaxDistance = 100,
            rollOffMinDistance = 30,
            position = u73.Position
        });
    end);
end;

function u8.applySceneScreenShake(p74) -- Line: 570
    -- upvalues: KnitClient (copy)
    KnitClient.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -4, 0), {
        cycles = 16,
        duration = 2,
        magnitude = 0.8
    });
end;

KnitClient.CreateController(u8.new());

return nil;