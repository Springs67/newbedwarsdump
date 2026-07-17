-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local WatchPlayerCharacter = v1.WatchPlayerCharacter;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v5.Lighting;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local SoundService = v5.SoundService;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local ProdAnimations = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "definitions", "prod-animations").ProdAnimations;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SceneKey = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey;
local SharedSyncEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local BaseSceneController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "base-scene-controller").BaseSceneController;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 35, Name: __tostring
        return "HalloweenObbySceneController";
    end,

    __index = BaseSceneController
});
u6.__index = u6;

function u6.new(...) -- Line: 41
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 45
    -- upvalues: BaseSceneController (copy), SceneKey (copy), default (copy), u3 (copy)
    BaseSceneController.constructor(p8, SceneKey.HALLOWEEN_OBBY);
    p8.Name = "HalloweenObbyScene";
    p8.remotes = default.Client:GetNamespace("HalloweenObby");
    p8.sceneMaid = u3.new();
    p8.sceneLightingMaid = u3.new();
end;

function u6.KnitStart(p9) -- Line: 52
    -- upvalues: BaseSceneController (copy)
    BaseSceneController.KnitStart(p9);
end;

function u6.onSceneLoadingScreenStart(u10) -- Line: 55
    -- upvalues: KnitClient (copy), AnimationType (copy), GameSound (copy), WatchPlayerCharacter (copy), Players (copy), Workspace (copy), u4 (copy)
    KnitClient.Controllers.PreloadController:runPreload({
        animations = { AnimationType.CLIMB_ROPE },
        sounds = { GameSound.GATE_OPENING, GameSound.ROLLING_BOULDER_LOOP }
    });
    u10:setupLighting();
    u10:setupAmbienceSounds();
    u10.sceneMaid:GiveTask(WatchPlayerCharacter(Players.LocalPlayer, function(p11) -- Line: 62
        -- upvalues: Workspace (ref), u10 (copy), u4 (ref)
        u10.sceneMaid:GiveTask(u4("DepthOfFieldEffect", {
            Name = "HalloweenObbyDepthOfField",
            InFocusRadius = 80,
            Parent = Workspace.CurrentCamera
        }));
    end));
end;

function u6.onSceneStart(p12) -- Line: 71
    p12:setupEntryGate();
    p12:setupFallingObjects();
    p12:setupBridgeTest();
    p12:setupRollingObjects();
    p12:setupWinArea();
end;

function u6.onSceneShutdown(p13) -- Line: 83
    p13:cleanupLighting();
    p13.sceneMaid:DoCleaning();
end;

function u6.setupAmbienceSounds(p14) -- Line: 87
    -- upvalues: SoundService (copy), KnitClient2 (copy), GameSound (copy), SoundManager (copy)
    SoundService.AmbientReverb = Enum.ReverbType.Cave;
    p14.sceneMaid:GiveTask(function() -- Line: 89
        -- upvalues: SoundService (ref)
        SoundService.AmbientReverb = Enum.ReverbType.NoReverb;
    end);
    p14.sceneMaid:GiveTask(KnitClient2.Controllers.FootstepsController.footstepModifier:addModifier({
        soundConfig = {
            walk = {
                GameSound.FOOTSTEP_CAVES_1,
                GameSound.FOOTSTEP_CAVES_2,
                GameSound.FOOTSTEP_CAVES_3,
                GameSound.FOOTSTEP_CAVES_4
            },
            run = {
                GameSound.FOOTSTEP_CAVES_1,
                GameSound.FOOTSTEP_CAVES_2,
                GameSound.FOOTSTEP_CAVES_3,
                GameSound.FOOTSTEP_CAVES_4
            }
        }
    }));
    local u15 = SoundManager:playSound(GameSound.CAVE_AMBIENCE, {
        looped = true
    });
    p14.sceneMaid:GiveTask(function() -- Line: 102
        -- upvalues: u15 (copy)
        local v16 = u15;

        if v16 ~= nil then
            v16:Stop();
        end;

        local v17 = u15;

        if v17 ~= nil then
            v17:Destroy();
        end;
    end);
end;

function u6.animateGateOpen(p18, p19, p20) -- Line: 113
    -- upvalues: SoundManager (copy), GameSound (copy), TweenService (copy)
    local GateLeft = p19:FindFirstChild("GateLeft");

    if GateLeft ~= nil then
        GateLeft = GateLeft.PrimaryPart;
    end;

    local GateRight = p19:FindFirstChild("GateRight");

    if GateRight ~= nil then
        GateRight = GateRight.PrimaryPart;
    end;

    SoundManager:playSound(GameSound.GATE_OPENING);

    if GateLeft then
        TweenService:Create(GateLeft, TweenInfo.new(p20 == nil and 2 or p20), {
            CFrame = GateLeft.CFrame * CFrame.Angles(0, 1.5707963267948966, 0)
        }):Play();
    end;

    if GateRight then
        TweenService:Create(GateRight, TweenInfo.new(p20 == nil and 2 or p20), {
            CFrame = GateRight.CFrame * CFrame.Angles(0, -1.5707963267948966, 0)
        }):Play();
    end;
end;

function u6.setupLighting(p21) -- Line: 154
    -- upvalues: KnitClient2 (copy), u4 (copy), Lighting (copy)
    p21.sceneLightingMaid:GiveTask(KnitClient2.Controllers.LightingController.lightingModifier:addModifier(20, {
        Brightness = 15,
        EnvironmentDiffuseScale = 0,
        EnvironmentSpecularScale = 1,
        GlobalShadows = true,
        ShadowSoftness = 0.43,
        TimeOfDay = "00:00:00",
        GeographicLatitude = 223,
        ExposureCompensation = 0,
        ClockTime = 0,
        Ambient = Color3.fromRGB(31, 30, 44),
        ColorShift_Bottom = Color3.fromRGB(255, 255, 255),
        ColorShift_Top = Color3.fromRGB(69, 78, 255),
        OutdoorAmbient = Color3.fromRGB(40, 46, 54)
    }));
    p21.sceneLightingMaid:GiveTask(KnitClient2.Controllers.LightingController.atmosphereModifier:addModifier(20, {
        Density = 0.365,
        Offset = 0.284,
        Glare = 5.85,
        Haze = 0.75,
        Color = Color3.fromRGB(141, 141, 199),
        Decay = Color3.fromRGB(76, 82, 136)
    }));
    p21.sceneLightingMaid:GiveTask(KnitClient2.Controllers.LightingController.skyModifier:addModifier(
        20,
        {
            StarCount = 0,
            SkyboxUp = "rbxassetid://10290025302",
            MoonTextureId = "rbxasset://sky/moon.jpg",
            SkyboxBk = "rbxassetid://10290026331",
            CelestialBodiesShown = false,
            SkyboxDn = "rbxassetid://10290026184",
            SkyboxLf = "rbxassetid://10290025786",
            SunTextureId = "",
            SunAngularSize = 21,
            SkyboxFt = "rbxassetid://10290026023",
            SkyboxRt = "rbxassetid://10290025545",
            MoonAngularSize = 11
        }
    ));
    p21.sceneLightingMaid:GiveTask(KnitClient2.Controllers.LightingController.colorCorrectionModifier:addModifier(20, {
        Brightness = 0.05,
        Contrast = 0.01,
        Saturation = 0.2,
        TintColor = Color3.fromRGB(255, 255, 255)
    }));
    local u22 = u4("BloomEffect", {
        Enabled = true,
        Intensity = 1,
        Size = 31,
        Threshold = 1.894,
        Parent = Lighting
    });
    p21.sceneLightingMaid:GiveTask(function() -- Line: 209
    end);
end;

function u6.cleanupLighting(p23) -- Line: 213
    p23.sceneLightingMaid:DoCleaning();
end;

function u6.setupFallingObjects(p24) -- Line: 216
    -- upvalues: SharedSyncEvents (copy), SoundManager (copy), GameSound (copy), Players (copy), KnitClient2 (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy)
    local v27 = SharedSyncEvents.ProjectileHit:connect(function(p25) -- Line: 217
        -- upvalues: SoundManager (ref), GameSound (ref), Players (ref), KnitClient2 (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        if p25:isCancelled() then
            return nil;
        end;

        local hitCFrame = p25.hitData.hitCFrame;

        if p25.projectileType ~= "halloween_obby_falling_object" then
            return nil;
        end;

        SoundManager:playSound(GameSound.STOMPER_HIT, {
            position = hitCFrame.Position
        });
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = (Character:GetPrimaryPartCFrame().Position - hitCFrame.Position).Magnitude;
        end;

        if Character ~= 0 and (Character == Character and Character) then
            Character = Character < 20;
        end;

        if Character ~= 0 and (Character == Character and Character) then
            KnitClient2.Controllers.ScreenShakeController:shake(hitCFrame.Position, Vector3.new(0, -1, 0));
        end;

        local u26 = ReplicatedStorage.Assets.Effects.Stomper:Clone();

        if not u26.PrimaryPart then
            return nil;
        end;

        u26.PrimaryPart.Position = hitCFrame.Position;
        u26.Parent = Workspace;
        EffectUtil:playEffects({ u26 }, nil);
        task.delay(0.5, function() -- Line: 254
            -- upvalues: u26 (copy)
            u26:Destroy();
        end);
    end);
    p24.sceneMaid:GiveTask(v27);
end;

function u6.setupRollingObjects(u28) -- Line: 260
    -- upvalues: WatchCollectionTag (copy), u3 (copy), SoundManager (copy), GameSound (copy)
    local v33 = WatchCollectionTag("ActiveRollingObject", function(p29) -- Line: 261
        -- upvalues: u3 (ref), u28 (copy), SoundManager (ref), GameSound (ref)
        local Boulder = p29:WaitForChild("Boulder");
        p29.PrimaryPart = Boulder;
        local u30 = u3.new();
        u28.sceneMaid:GiveTask(u30);
        local u31 = SoundManager:playSound(GameSound.ROLLING_BOULDER_LOOP, {
            looped = true,
            volumeMultiplier = 1.3,
            rollOffMinDistance = 50,
            rollOffMaxDistance = 200,
            parent = Boulder
        });
        u30:GiveTask(function() -- Line: 273
            -- upvalues: u31 (copy)
            local v32 = u31;

            if v32 ~= nil then
                v32:Destroy();
            end;
        end);
        u28.sceneMaid:GiveTask(p29.Destroying:Connect(function() -- Line: 299
            -- upvalues: u30 (copy)
            u30:DoCleaning();
        end));
    end);
    u28.sceneMaid:GiveTask(v33);
end;

function u6.setupEntryGate(u34) -- Line: 305
    -- upvalues: KnitClient2 (copy), Workspace (copy), RunService (copy), Players (copy), TweenService (copy)
    local sceneAssets = u34.sceneAssets;

    if sceneAssets ~= nil then
        sceneAssets = sceneAssets.EntryGate;
    end;

    if sceneAssets then
        local OpenGatePrompt = sceneAssets.EntryGate.GateLeft.Poles.OpenGatePrompt;

        if not OpenGatePrompt then
            return nil;
        end;

        KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ActionText = "Start Obby",
            ObjectText = "Get Ready!",
            HoldDuration = 2,
            MaxActivationDistance = 12,
            RequiresLineOfSight = false,
            Parent = OpenGatePrompt
        }).Triggered:Connect(function(p35) -- Line: 324
            -- upvalues: u34 (copy)
            u34.remotes:Get("ActivateObbyScene"):SendToServer();
        end);
        u34.remotes:Get("ObbyActivatedScene"):Connect(function() -- Line: 327
            -- upvalues: Workspace (ref), RunService (ref), Players (ref), TweenService (ref), sceneAssets (copy), u34 (copy)
            local CurrentCamera = Workspace.CurrentCamera;

            if not CurrentCamera then
                return nil;
            end;

            RunService:BindToRenderStep("obby-player-vis", Enum.RenderPriority.Last.Value - 1, function() -- Line: 333
                -- upvalues: Players (ref)
                local Character = Players.LocalPlayer.Character;

                if Character ~= nil then
                    local function _(p36) -- Line: 337
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
            local CameraType = CurrentCamera.CameraType;
            CurrentCamera.CameraType = Enum.CameraType.Scriptable;
            local v37 = TweenService:Create(CurrentCamera, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                CFrame = sceneAssets.EntryCutscene.GateCameraPos.CFrame
            });
            v37:Play();
            u34:animateGateOpen(sceneAssets.EntryGate);
            local u38 = nil;
            u38 = v37.Completed:Connect(function() -- Line: 357
                -- upvalues: u38 (ref), sceneAssets (ref), TweenService (ref), CurrentCamera (copy)
                u38:Disconnect();
                local FogRisingCameraPos = sceneAssets.EntryCutscene.FogRisingCameraPos;
                local v39 = TweenService:Create(CurrentCamera, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    CFrame = FogRisingCameraPos.CFrame
                });
                v39:Play();
                local u40 = nil;
                u40 = v39.Completed:Connect(function() -- Line: 365
                    -- upvalues: u40 (ref)
                    u40:Disconnect();
                end);
            end);
            task.delay(5, function() -- Line: 370
                -- upvalues: CurrentCamera (copy), CameraType (copy), RunService (ref)
                CurrentCamera.CameraType = CameraType;
                RunService:UnbindFromRenderStep("obby-player-vis");
            end);
        end);
    end;
end;

function u6.setupBridgeTest(u41) -- Line: 377
    -- upvalues: WatchCollectionTag (copy), KnitClient2 (copy), Flamework (copy)
    local v45 = WatchCollectionTag("obby_bridge_test_evaluator", function(p42) -- Line: 378
        -- upvalues: KnitClient2 (ref), u41 (copy), Flamework (ref)
        KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ActionText = "Open Gate",
            ObjectText = "Locked Gate",
            HoldDuration = 2,
            MaxActivationDistance = 12,
            RequiresLineOfSight = false,
            Parent = p42
        }).Triggered:Connect(function(p43) -- Line: 388
            -- upvalues: u41 (ref), Flamework (ref)
            u41.remotes:Get("EvaluateBridgeTest"):CallServerAsync():andThen(function(p44) -- Line: 390
                -- upvalues: Flamework (ref)
                if not p44 then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        message = "Can\'t open the gate. I should check the bridge for clues"
                    });
                end;
            end);
        end);
        u41.remotes:Get("BridgeTestSuccess"):Connect(function() -- Line: 400
            -- upvalues: u41 (ref)
            local sceneAssets = u41.sceneAssets;

            if sceneAssets ~= nil then
                sceneAssets = sceneAssets.BridgeTestSection.BridgeLeftGate;
            end;

            local sceneAssets2 = u41.sceneAssets;

            if sceneAssets2 ~= nil then
                sceneAssets2 = sceneAssets2.BridgeTestSection.BridgeRightGate;
            end;

            if sceneAssets and sceneAssets2 then
                u41:animateGateOpen(sceneAssets);
                u41:animateGateOpen(sceneAssets2);
            end;
        end);
    end);
    u41.sceneMaid:GiveTask(v45);
end;

function u6.setupWinArea(p46) -- Line: 419
    local sceneAssets = p46.sceneAssets;

    if sceneAssets ~= nil then
        sceneAssets = sceneAssets.WinningRoom;
    end;

    if not sceneAssets then
        return nil;
    end;

    p46:setupEscapeRope();
end;

function u6.setupEscapeRope(u47) -- Line: 430
    -- upvalues: KnitClient2 (copy), Flamework (copy), u3 (copy), Workspace (copy), TweenService (copy), Players (copy), u4 (copy), ProdAnimations (copy), AnimationType (copy)
    local sceneAssets = u47.sceneAssets;

    if sceneAssets ~= nil then
        sceneAssets = sceneAssets.WinningRoom;
    end;

    if not sceneAssets then
        return nil;
    end;

    local Rope = sceneAssets.Rope;
    local v48 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
        ActionText = "Escape!",
        ObjectText = "Rope",
        HoldDuration = 2,
        MaxActivationDistance = 12,
        RequiresLineOfSight = false,
        Parent = Rope.ProximityPrompt
    });
    u47.sceneMaid:GiveTask(v48.Triggered:Connect(function(p49) -- Line: 449
        -- upvalues: u47 (copy), Flamework (ref)
        u47.remotes:Get("AttemptEscapeObby"):CallServerAsync():andThen(function(p50) -- Line: 451
            -- upvalues: Flamework (ref)
            if not p50 then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "Not all explorers are in the ending room!"
                });
            end;
        end);
    end));
    u47.remotes:Get("EscapeObby"):Connect(function(u51) -- Line: 461
        -- upvalues: u3 (ref), u47 (copy), Workspace (ref), TweenService (ref), sceneAssets (copy), Players (ref), Rope (copy), u4 (ref), ProdAnimations (ref), AnimationType (ref)
        local u52 = u3.new();
        u47.sceneMaid:GiveTask(u52);
        local CurrentCamera = Workspace.CurrentCamera;

        if not CurrentCamera then
            return nil;
        end;

        local CameraType = CurrentCamera.CameraType;
        local FieldOfView = CurrentCamera.FieldOfView;
        CurrentCamera.CameraType = Enum.CameraType.Scriptable;
        local v53 = TweenService:Create(CurrentCamera, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            CFrame = sceneAssets.EscapeCutscene.ClimbingRope.CFrame
        });
        TweenService:Create(CurrentCamera, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            FieldOfView = 35
        });
        v53:Play();
        u52:GiveTask((v53.Completed:Connect(function() -- Line: 479
            -- upvalues: u51 (copy), Players (ref), u52 (copy), Workspace (ref), Rope (ref), u4 (ref), ProdAnimations (ref), AnimationType (ref), TweenService (ref)
            task.spawn(function() -- Line: 480
                -- upvalues: u51 (ref), Players (ref), u52 (ref), Workspace (ref), Rope (ref), u4 (ref), ProdAnimations (ref), AnimationType (ref), TweenService (ref)
                local winningPlayers = u51.winningPlayers;

                local function v61(p54) -- Line: 483
                    -- upvalues: Players (ref), u52 (ref)
                    local u55 = Players:GetPlayerByUserId(p54);

                    if u55 ~= nil then
                        local Character = u55.Character;

                        if Character ~= nil then
                            local function _(p56) -- Line: 490
                                if p56:IsA("BasePart") and p56.Transparency == 0 then
                                    p56.Transparency = 1;
                                    p56:SetAttribute("CameraHidden", true);
                                end;
                            end;

                            for i, descendant in Character:GetDescendants() do
                                local _ = i - 1;

                                if descendant:IsA("BasePart") and descendant.Transparency == 0 then
                                    descendant.Transparency = 1;
                                    descendant:SetAttribute("CameraHidden", true);
                                end;
                            end;
                        end;
                    end;

                    u52:GiveTask(function() -- Line: 501
                        -- upvalues: u55 (copy)
                        local v57 = u55;

                        if v57 ~= nil then
                            local Character = v57.Character;

                            if Character ~= nil then
                                local function _(p58) -- Line: 507
                                    local v59 = p58:IsA("BasePart");

                                    if v59 then
                                        if p58.Name == "HumanoidRootPart" then
                                            v59 = false;
                                        else
                                            v59 = p58:GetAttribute("CameraHidden");
                                        end;
                                    end;

                                    if v59 ~= 0 and (v59 == v59 and (v59 ~= "" and v59)) then
                                        p58.Transparency = 0;
                                    end;
                                end;

                                for i, descendant in Character:GetDescendants() do
                                    local _ = i - 1;
                                    local v60 = descendant:IsA("BasePart");

                                    if v60 then
                                        if descendant.Name == "HumanoidRootPart" then
                                            v60 = false;
                                        else
                                            v60 = descendant:GetAttribute("CameraHidden");
                                        end;
                                    end;

                                    if v60 ~= 0 and (v60 == v60 and (v60 ~= "" and v60)) then
                                        descendant.Transparency = 0;
                                    end;
                                end;
                            end;
                        end;
                    end);
                end;

                for i, v in winningPlayers do
                    v61(v, i - 1, winningPlayers);
                end;

                local winningPlayers2 = u51.winningPlayers;

                local function v70(p62) -- Line: 524
                    -- upvalues: Players (ref), Workspace (ref), Rope (ref), u52 (ref), u4 (ref), ProdAnimations (ref), AnimationType (ref), TweenService (ref)
                    local u63 = Players:GetPlayerByUserId(p62);
                    local v64 = not u63;

                    if not v64 then
                        local v65;

                        if u63 == nil then
                            v65 = u63;
                        else
                            v65 = u63.Character;
                        end;

                        v64 = not v65;
                    end;

                    if v64 then
                        return nil;
                    end;

                    u63.Character.Archivable = true;
                    local u66 = u63.Character:Clone();

                    local function _(p67) -- Line: 542
                        if p67:IsA("BasePart") and p67.Name ~= "HumanoidRootPart" then
                            p67.Transparency = 0;
                        end;
                    end;

                    for i, descendant in u66:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" then
                            descendant.Transparency = 0;
                        end;
                    end;

                    u66.Parent = Workspace;
                    local Position = Rope.Position;
                    local v68 = Vector3.new(-Rope.Size.X / 2 - 1, 15, 0);
                    u66:PivotTo(CFrame.new(Position - v68) * CFrame.Angles(0, 1.5707963267948966, 0));
                    u52:GiveTask(function() -- Line: 557
                        -- upvalues: u66 (copy), u63 (copy)
                        u66:Destroy();

                        if u63.Character then
                            u63.Character.Archivable = false;
                        end;
                    end);
                    local v69 = u66:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(u4("Animation", {
                        AnimationId = ProdAnimations[AnimationType.CLIMB_ROPE]
                    }));
                    v69.Looped = true;
                    v69:Play();

                    if u66.PrimaryPart then
                        TweenService:Create(u66.PrimaryPart, TweenInfo.new(7), {
                            CFrame = u66:GetPrimaryPartCFrame() + Vector3.new(0, 40, 0)
                        }):Play();
                    end;

                    task.wait(1);
                end;

                for i, v in winningPlayers2 do
                    v70(v, i - 1, winningPlayers2);
                end;
            end);
        end)));
        task.delay(8, function() -- Line: 593
            -- upvalues: CurrentCamera (copy), CameraType (copy), FieldOfView (copy), u52 (copy)
            CurrentCamera.CameraType = CameraType;
            CurrentCamera.FieldOfView = FieldOfView;
            u52:DoCleaning();
        end);
    end);
end;

KnitClient.CreateController(u6.new());

return nil;