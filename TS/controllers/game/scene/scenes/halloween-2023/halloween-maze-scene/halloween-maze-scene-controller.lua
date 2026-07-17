-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Lighting = v5.Lighting;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local SoundService = v5.SoundService;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ModelSkybox = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "viewport-portal-magic", "model-skybox", "model-skybox").ModelSkybox;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local DamageType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
local default3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SceneKey = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey;
local MazeRoleName = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "types", "maze").MazeRoleName;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseSceneController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "base-scene-controller").BaseSceneController;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 41, Name: __tostring
        return "HalloweenMazeSceneController";
    end,

    __index = BaseSceneController
});
u7.__index = u7;

function u7.new(...) -- Line: 47
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 51
    -- upvalues: BaseSceneController (copy), SceneKey (copy), u3 (copy), u6 (copy)
    BaseSceneController.constructor(p9, SceneKey.HALLOWEEN_MAZE);
    p9.Name = "HalloweenMazeSceneController";
    p9.sceneMaid = u3.new();
    p9.roleChanged = u6.new();
    p9.mazeEntryCutsceneComplete = u6.new();
    p9.lightingSetup = false;
    p9.lightingSetupComplete = u6.new();
end;

function u7.KnitStart(p10) -- Line: 60
    -- upvalues: BaseSceneController (copy)
    BaseSceneController.KnitStart(p10);
end;

function u7.onSceneLoadingScreenStart(p11) -- Line: 63
    -- upvalues: KnitClient (copy), AnimationType (copy), GameSound (copy)
    KnitClient.Controllers.PreloadController:runPreload({
        animations = {
            AnimationType.LARGE_FALL_1,
            AnimationType.LARGE_FALL_2,
            AnimationType.LARGE_FALL_3,
            AnimationType.RIFT_REVIVE
        },
        sounds = { GameSound.MAZE_FALL_INTO_CAVE }
    });
    p11:setupLighting();
    p11:setupSoundAmbience();
end;

function u7.onSceneStart(u12) -- Line: 71
    -- upvalues: default (copy), ReplicatedStorage (copy), Workspace (copy), scaleModel (copy), CollectionService (copy), u4 (copy), Players (copy), ModelSkybox (copy), WatchCharacter (copy), WatchCollectionTag (copy), default3 (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), KnitClient2 (copy), RunService (copy), DamageType (copy), default2 (copy), InQuad (copy)
    if u12.sceneAssets == nil then
        default.Error("No scene assets for halloween maze scene");

        return nil;
    end;

    u12.keeper = ReplicatedStorage.Assets.Misc.GraveKeeper:Clone();
    u12.keeper.Parent = Workspace;

    for _, descendant in u12.keeper:GetDescendants() do
        if descendant:IsA("BasePart") then
            descendant.LocalTransparencyModifier = 1;
        end;
    end;

    u12.sceneMaid:GiveTask(function() -- Line: 84
        -- upvalues: u12 (copy)
        local keeper = u12.keeper;

        if keeper ~= nil then
            keeper:Destroy();
        end;

        u12.keeper = nil;
    end);
    local u13 = u12.sceneAssets.Maze:Clone();
    u13.Name = "SmallMaze";
    u13.Parent = Workspace;
    scaleModel(u13, 0.01);
    local Position = u12.sceneAssets.SmallClonePosition.Position;
    u13:PivotTo(CFrame.new(Position));
    CollectionService:AddTag(u12.sceneAssets.SmallClonePosition, "MazeInteractionPart");
    u12.smallMaze = u13;
    u12.bigMaze = u12.sceneAssets.Maze;
    u12.sceneMaid:GiveTask(u12.mazeEntryCutsceneComplete:Connect(function() -- Line: 100
        -- upvalues: u4 (ref), u13 (copy)
        u4("Highlight", {
            Enabled = true,
            FillTransparency = 0.5,
            OutlineTransparency = 0,
            DepthMode = Enum.HighlightDepthMode.Occluded,
            FillColor = Color3.fromRGB(0, 255, 238),
            OutlineColor = Color3.fromRGB(255, 255, 255)
        }).Parent = u13;
    end));
    u12:checkMazeRole();
    u12.sceneMaid:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("MazeRole"):Connect(function() -- Line: 112
        -- upvalues: u12 (copy)
        u12:checkMazeRole();
    end));

    for _, child in u13.Finish:GetChildren() do
        if child:IsA("Sound") then
            child:Destroy();
        end;
    end;

    u12.sceneMaid:GiveTask(function() -- Line: 121
        -- upvalues: u12 (copy)
        local smallMaze = u12.smallMaze;

        if smallMaze ~= nil then
            smallMaze:Destroy();
        end;

        u12.smallMaze = nil;
    end);
    u12.sceneMaid:GiveTask(function() -- Line: 128
        -- upvalues: u12 (copy)
        local bigMaze = u12.bigMaze;

        if bigMaze ~= nil then
            bigMaze:Destroy();
        end;

        u12.bigMaze = nil;
    end);
    u12.skybox = ModelSkybox.new(Position);
    u12.skybox.pos = u12.sceneAssets.Maze:GetPivot().Position;
    u12.sceneMaid:GiveTask(function() -- Line: 137
        -- upvalues: u12 (copy)
        local skybox = u12.skybox;

        if skybox ~= nil then
            skybox:destroy();
        end;
    end);
    u12.sceneMaid:GiveTask(WatchCharacter(function(p14, u15) -- Line: 143
        -- upvalues: u12 (copy)
        task.delay(5, function() -- Line: 144
            -- upvalues: u12 (ref), u15 (copy)
            local skybox = u12.skybox;

            if skybox ~= nil then
                skybox:trackCharacter(u15);
            end;
        end);
    end));
    u12.sceneMaid:GiveTask(WatchCollectionTag("ActiveMazeBoss", function(p16) -- Line: 151
        if p16:IsA("BasePart") then
            p16.Transparency = 1;
        end;
    end));
    default3.Client:WaitFor("PlayEntryCutscene"):andThen(function(p17) -- Line: 156
        -- upvalues: u12 (copy)
        u12.sceneMaid:GiveTask(p17:Connect(function(p18) -- Line: 157
            -- upvalues: u12 (ref)
            u12:playEntryCutscene(p18);
        end));
    end);
    default3.Client:WaitFor("ReappearInCaveAnimation"):andThen(function(p19) -- Line: 161
        -- upvalues: u12 (copy), AnimationUtil (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref)
        u12.sceneMaid:GiveTask(p19:Connect(function(p20) -- Line: 162
            -- upvalues: AnimationUtil (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref)
            AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.RIFT_REVIVE), {});
        end));
    end);
    default3.Client:WaitFor("StartEndMazeCutscene"):andThen(function(p21) -- Line: 166
        -- upvalues: u12 (copy), default (ref), Workspace (ref)
        u12.sceneMaid:GiveTask(p21:Connect(function(p22) -- Line: 167
            -- upvalues: default (ref), u12 (ref), Workspace (ref)
            default.Debug("Starting end maze cutscene");
            u12:fade(function() -- Line: 170
                -- upvalues: Workspace (ref)
                Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
                Workspace.CurrentCamera.CFrame = CFrame.lookAt(Vector3.new(48, 69.727, 84.603), Vector3.new(88, 50.487, 46));
            end);
            task.delay(3, function() -- Line: 174
                -- upvalues: u12 (ref), Workspace (ref)
                u12:fade(function() -- Line: 176
                    -- upvalues: Workspace (ref)
                    Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
                    Workspace.CurrentCamera.CFrame = CFrame.lookAt(Vector3.new(34, 68.639, 62), Vector3.new(104, 58.374, 60));
                end);
                task.delay(3, function() -- Line: 180
                    -- upvalues: Workspace (ref)
                    Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
                end);
            end);
        end));
    end);
    default3.Client:WaitFor("GravekeeperDeath"):andThen(function(p23) -- Line: 186
        -- upvalues: u12 (copy), Workspace (ref), GameAnimationUtil (ref), AnimationType (ref), AnimationUtil (ref), SoundManager (ref), GameSound (ref), Players (ref), KnitClient2 (ref), RunService (ref), DamageType (ref), default2 (ref), InQuad (ref)
        u12.sceneMaid:GiveTask(p23:Connect(function(u24) -- Line: 187
            -- upvalues: u12 (ref), Workspace (ref), GameAnimationUtil (ref), AnimationType (ref), AnimationUtil (ref), SoundManager (ref), GameSound (ref), Players (ref), KnitClient2 (ref), RunService (ref), DamageType (ref), default2 (ref), InQuad (ref)
            if u12.keeper == nil then
                return nil;
            end;

            u12.keeper:PivotTo(u24.spot.CFrame);
            u12.keeper.Parent = Workspace;

            for _, descendant in u12.keeper:GetDescendants() do
                if descendant:IsA("BasePart") then
                    descendant.LocalTransparencyModifier = 0;
                end;
            end;

            local Humanoid = u12.keeper:FindFirstChild("Humanoid");

            if Humanoid ~= nil then
                Humanoid = Humanoid:FindFirstChild("Animator");
            end;

            local v25 = AnimationUtil:playAnimation(Humanoid, (GameAnimationUtil:getAssetId(AnimationType.KEEPER_SPAWN)));
            SoundManager:playSound(GameSound.KEEPER_SUMMON, {
                rollOffMaxDistance = 100,
                rollOffMinDistance = 30,
                position = u24.spot.CFrame.Position
            });
            local u26 = SoundManager:playSound(GameSound.KEEPER_LOOP, {
                rollOffMaxDistance = 100,
                rollOffMinDistance = 30,
                position = u24.spot.CFrame.Position
            });
            local u27;

            if u24.target == Players.LocalPlayer then
                u27 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    moveSpeedMultiplier = 0
                });
                RunService:BindToRenderStep("graveyardkeeper-death-vis", Enum.RenderPriority.Last.Value - 1, function() -- Line: 222
                    -- upvalues: Players (ref)
                    local Character = Players.LocalPlayer.Character;

                    if Character ~= nil then
                        local function _(p28) -- Line: 226
                            if p28:IsA("BasePart") then
                                p28.LocalTransparencyModifier = 0;
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
                Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
                task.spawn(function() -- Line: 238
                    -- upvalues: RunService (ref), u24 (copy), Workspace (ref)
                    RunService.Heartbeat:Wait();
                    Workspace.CurrentCamera.CFrame = CFrame.lookAt(u24.spot.Position + Vector3.new(0, 6, -15), u24.spot.Position + Vector3.new(0, 6, 0));
                end);
            else
                u27 = nil;
            end;

            if v25 and v25 ~= nil then
                v25.Stopped:Connect(function() -- Line: 252
                    -- upvalues: AnimationUtil (ref), Humanoid (copy), GameAnimationUtil (ref), AnimationType (ref), RunService (ref), u27 (ref), SoundManager (ref), GameSound (ref), u24 (copy), Players (ref), KnitClient2 (ref), DamageType (ref), u12 (ref), default2 (ref), InQuad (ref), u26 (copy), Workspace (ref)
                    local u29 = AnimationUtil:playAnimation(Humanoid, GameAnimationUtil:getAssetId(AnimationType.KEEPER_ATTACK));
                    local u30 = nil;
                    u30 = RunService.Heartbeat:Connect(function() -- Line: 255
                        -- upvalues: u29 (copy), u30 (ref), u27 (ref), SoundManager (ref), GameSound (ref), u24 (ref), Players (ref), KnitClient2 (ref), DamageType (ref)
                        if u29 then
                            local v31 = u29;

                            if v31 ~= nil then
                                v31 = v31.TimePosition;
                            end;

                            local v32 = u29;

                            if v32 ~= nil then
                                v32 = v32.Length;
                            end;

                            if v32 * 0.1 < v31 then
                                u30:Disconnect();

                                if u27 ~= nil then
                                    u27.Destroy();
                                end;

                                SoundManager:playSound(GameSound.KEEPER_ATTACK, {
                                    rollOffMaxDistance = 100,
                                    volumeMultiplier = 1.5,
                                    rollOffMinDistance = 30,
                                    position = u24.spot.CFrame.Position
                                });

                                if u24.target == Players.LocalPlayer then
                                    KnitClient2.Controllers.DamageController:requestSelfDeath(DamageType.SWORD);
                                end;
                            end;
                        else
                            u30:Disconnect();
                        end;
                    end);

                    if u29 ~= nil then
                        u29.Stopped:Connect(function() -- Line: 286
                            -- upvalues: AnimationUtil (ref), Humanoid (ref), GameAnimationUtil (ref), AnimationType (ref), u12 (ref), u24 (ref), default2 (ref), InQuad (ref), u26 (ref), Workspace (ref), RunService (ref)
                            AnimationUtil:playAnimation(Humanoid, GameAnimationUtil:getAssetId(AnimationType.KEEPER_IDLE));
                            task.delay(1.5, function() -- Line: 288
                                -- upvalues: u12 (ref), u24 (ref), default2 (ref), InQuad (ref), u26 (ref), Workspace (ref), RunService (ref)
                                default2(1, InQuad, function(p33) -- Line: 289
                                    -- upvalues: u12 (ref)
                                    local keeper = u12.keeper;

                                    if keeper ~= nil then
                                        keeper:PivotTo(CFrame.new(p33));
                                    end;
                                end, u24.spot.Position, u24.spot.Position + Vector3.new(0, -20, 0)):Wait();
                                local v34 = u26;

                                if v34 ~= nil then
                                    v34:Stop();
                                end;

                                if u12.keeper then
                                    for _, descendant in u12.keeper:GetDescendants() do
                                        if descendant:IsA("BasePart") then
                                            descendant.LocalTransparencyModifier = 1;
                                        end;
                                    end;
                                end;

                                Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
                                RunService:UnbindFromRenderStep("graveyardkeeper-death-vis");
                            end);
                        end);
                    end;
                end);
            end;
        end));
    end);
end;

function u7.onSceneShutdown(p35) -- Line: 322
    p35.sceneMaid:DoCleaning();
end;

function u7.fade(p36, p37) -- Line: 325
    -- upvalues: Lighting (copy), u4 (copy), default2 (copy), InQuad (copy)
    local u38 = Lighting:FindFirstChildOfClass("ColorCorrectionEffect") or u4("ColorCorrectionEffect", {
        Parent = Lighting
    });
    default2(0.5, InQuad, function(p39) -- Line: 329
        -- upvalues: u38 (copy)
        u38.TintColor = p39;
    end, Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 0, 0)):Wait();
    p37();
    default2(0.5, InQuad, function(p40) -- Line: 333
        -- upvalues: u38 (copy)
        u38.TintColor = p40;
    end, Color3.fromRGB(0, 0, 0), Color3.fromRGB(255, 255, 255)):Wait();
end;

function u7.checkMazeRole(u41) -- Line: 337
    -- upvalues: Players (copy), MazeRoleName (copy)
    local u42 = Players.LocalPlayer:GetAttribute("MazeRole");

    if u42 ~= nil then
        u41.mazeEntryCutsceneComplete:Connect(function() -- Line: 340
            -- upvalues: u42 (copy), MazeRoleName (ref), u41 (copy)
            if u42 == MazeRoleName.ILLUMINATOR then
                task.spawn(function() -- Line: 353
                    -- upvalues: u41 (ref)
                    if u41.bigMaze then
                        for _, descendant in u41.bigMaze:GetDescendants() do
                            if descendant:IsA("BasePart") then
                                descendant.Transparency = 1;
                                task.wait();
                            end;
                        end;
                    end;
                end);

                return;
            end;

            task.spawn(function() -- Line: 342
                -- upvalues: u41 (ref)
                if u41.smallMaze then
                    for _, descendant in u41.smallMaze:GetDescendants() do
                        if descendant:IsA("BasePart") then
                            descendant.Transparency = 1;
                            task.wait();
                        end;
                    end;
                end;
            end);
        end);
    end;

    if u42 ~= nil then
        u41.roleChanged:Fire(u42);
    end;
end;

function u7.setupLighting(p43) -- Line: 370
    -- upvalues: KnitClient2 (copy), u4 (copy), Lighting (copy)
    p43.sceneMaid:GiveTask(KnitClient2.Controllers.LightingController.skyModifier:addModifier(
        100,
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
    p43.sceneMaid:GiveTask(KnitClient2.Controllers.LightingController.lightingModifier:addModifier(100, {
        Brightness = 0.1,
        ClockTime = 14,
        GeographicLatitude = -30,
        Ambient = Color3.fromRGB(69, 65, 76),
        ColorShift_Bottom = Color3.fromRGB(127, 71, 71),
        ColorShift_Top = Color3.fromRGB(131, 115, 177),
        OutdoorAmbient = Color3.fromRGB(61, 65, 76)
    }));
    p43.sceneMaid:GiveTask(KnitClient2.Controllers.LightingController:getAtmosphereModifier():addModifier(100, {
        Density = 0.48,
        Offset = 0,
        Glare = 1,
        Haze = 10,
        Color = Color3.fromRGB(54, 53, 65),
        Decay = Color3.fromRGB(34, 45, 47)
    }));
    p43.sceneMaid:GiveTask(KnitClient2.Controllers.LightingController.sunRayModifier:addModifier(100, {
        Intensity = 0.005,
        Spread = 0.4,
        Enabled = false
    }));
    p43.sceneMaid:GiveTask(KnitClient2.Controllers.LightingController.colorCorrectionModifier:addModifier(100, {
        Brightness = -0.05,
        Contrast = 0.1,
        Saturation = -0.05,
        TintColor = Color3.fromRGB(255, 255, 255)
    }));
    p43.sceneMaid:GiveTask(KnitClient2.Controllers.LightingController.skyModifier:addModifier(100, {
        CelestialBodiesShown = false
    }));
    p43.sceneMaid:GiveTask(u4("DepthOfFieldEffect", {
        Name = "HalloweenMazeDepthOfField",
        FarIntensity = 0.75,
        FocusDistance = 20,
        InFocusRadius = 20,
        NearIntensity = 0,
        Parent = Lighting
    }));
    p43.lightingSetup = true;
    p43.lightingSetupComplete:Fire();
end;

function u7.setupSoundAmbience(p44) -- Line: 428
    -- upvalues: KnitClient2 (copy), GameSound (copy), SoundService (copy), SoundManager (copy)
    p44.sceneMaid:GiveTask(KnitClient2.Controllers.FootstepsController.footstepModifier:addModifier({
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
    SoundService.AmbientReverb = Enum.ReverbType.StoneRoom;
    p44.sceneMaid:GiveTask(function() -- Line: 438
        -- upvalues: SoundService (ref)
        SoundService.AmbientReverb = Enum.ReverbType.NoReverb;
    end);
    local u45 = SoundManager:playSound(GameSound.CAVE_AMBIENCE, {
        looped = true
    });
    p44.sceneMaid:GiveTask(function() -- Line: 444
        -- upvalues: u45 (copy)
        local v46 = u45;

        if v46 ~= nil then
            v46:Stop();
        end;
    end);
end;

function u7.playEntryCutscene(u47, u48) -- Line: 451
    -- upvalues: Workspace (copy), u3 (copy), Players (copy), AnimationType (copy), GameAnimationUtil (copy), RandomUtil (copy), SoundManager (copy), GameSound (copy), TweenService (copy)
    local CurrentCamera = Workspace.CurrentCamera;

    if not (CurrentCamera and u47.sceneAssets) then
        return nil;
    end;

    local u49 = u3.new();
    local illuminators = u48.illuminators;

    local function v53(p50) -- Line: 460
        -- upvalues: Players (ref), u49 (copy)
        local v51 = Players:GetPlayerByUserId(p50);

        if v51 ~= nil then
            v51 = v51.Character;
        end;

        if not v51 then
            return nil;
        end;

        local function _(u52) -- Line: 471
            -- upvalues: u49 (ref)
            if u52:IsA("BasePart") then
                u52.LocalTransparencyModifier = 1;
                u49:GiveTask(function() -- Line: 474
                    -- upvalues: u52 (copy)
                    u52.LocalTransparencyModifier = 0;
                end);
            end;
        end;

        for i, descendant in v51:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.LocalTransparencyModifier = 1;
                u49:GiveTask(function() -- Line: 474
                    -- upvalues: descendant (copy)
                    descendant.LocalTransparencyModifier = 0;
                end);
            end;
        end;
    end;

    for i, v in illuminators do
        v53(v, i - 1, illuminators);
    end;

    local CameraType = CurrentCamera.CameraType;
    local CFrame2 = CurrentCamera.CFrame;
    local FieldOfView = CurrentCamera.FieldOfView;
    CurrentCamera.CameraType = Enum.CameraType.Scriptable;
    local MazeControllerFallingCam = u47.sceneAssets.EntryCutscene.MazeControllerFallingCam;
    local MiniMazeZoomCam = u47.sceneAssets.EntryCutscene.MiniMazeZoomCam;
    local u54 = { AnimationType.LARGE_FALL_1, AnimationType.LARGE_FALL_2, AnimationType.LARGE_FALL_3 };

    local function u62(u55, p56) -- Line: 494
        -- upvalues: u3 (ref), Workspace (ref), GameAnimationUtil (ref), RandomUtil (ref), u54 (copy), SoundManager (ref), GameSound (ref), u49 (copy)
        local v57 = u3.new();
        u55.Archivable = true;
        v57:GiveTask(function() -- Line: 498
            -- upvalues: u55 (copy)
            u55.Archivable = false;
        end);
        local u58 = u55:Clone();

        if u58.PrimaryPart then
            u58.PrimaryPart.Anchored = false;
            u58.PrimaryPart.CanCollide = false;
        end;

        local function _(p59) -- Line: 508
            if p59:IsA("BasePart") then
                p59.LocalTransparencyModifier = 1;
            end;
        end;

        for i, descendant in u58:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.LocalTransparencyModifier = 1;
            end;
        end;

        local v60 = CFrame;
        local Position = u58:GetPrimaryPartCFrame().Position;
        local Position2 = u58:GetPrimaryPartCFrame().Position;
        u58:PivotTo(v60.lookAt(Position, Position2 + (p56 or Vector3.new(0, 0, -5))));
        u58.Parent = Workspace;
        v57:GiveTask(u58);
        u58:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(GameAnimationUtil:getAnimation(RandomUtil.fromList(unpack(u54)))):Play();
        task.delay(0.2, function() -- Line: 529
            -- upvalues: u58 (copy)
            local function _(p61) -- Line: 531
                if p61:IsA("BasePart") then
                    p61.LocalTransparencyModifier = 0;
                end;
            end;

            for i, descendant in u58:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    descendant.LocalTransparencyModifier = 0;
                end;
            end;
        end);
        task.delay(0.5, function() -- Line: 540
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.MAZE_FALL_INTO_CAVE, {
                volumeMultiplier = 0.8
            });
        end);
        u49:GiveTask(v57);

        return v57;
    end;

    task.spawn(function() -- Line: 548
        -- upvalues: u47 (copy), CurrentCamera (copy), MazeControllerFallingCam (copy), u48 (copy), Players (ref), u62 (copy), TweenService (ref), MiniMazeZoomCam (copy), CameraType (copy), CFrame2 (copy), FieldOfView (copy), u49 (copy)
        if not u47.lightingSetup then
            u47.lightingSetupComplete:Wait();
        end;

        CurrentCamera.CFrame = MazeControllerFallingCam.CFrame;
        task.wait(3);

        local function _(p63) -- Line: 557
            -- upvalues: Players (ref), u62 (ref)
            local v64 = Players:GetPlayerByUserId(p63);
            local v65 = not v64;

            if not v65 then
                local v66;

                if v64 == nil then
                    v66 = v64;
                else
                    v66 = v64.Character;
                end;

                v65 = not v66;
            end;

            if v65 then
                return nil;
            end;

            u62(v64.Character, Vector3.new(5, 0, 0));
            task.wait(1);
        end;

        for i, v in u48.illuminators do
            local _ = i - 1;
            local v67 = Players:GetPlayerByUserId(v);
            local v68 = not v67;

            if not v68 then
                local v69;

                if v67 == nil then
                    v69 = v67;
                else
                    v69 = v67.Character;
                end;

                v68 = not v69;
            end;

            if not v68 then
                u62(v67.Character, Vector3.new(5, 0, 0));
                task.wait(1);
            end;
        end;

        task.wait(2);
        local v70 = TweenService:Create(CurrentCamera, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            CFrame = MiniMazeZoomCam.CFrame
        });
        v70:Play();
        TweenService:Create(CurrentCamera, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            FieldOfView = 60
        }):Play();
        u47.sceneMaid:GiveTask(v70.Completed:Connect(function() -- Line: 585
            -- upvalues: CameraType (ref), CurrentCamera (ref), CFrame2 (ref), FieldOfView (ref), u47 (ref), u49 (ref)
            task.wait(5);
            print("RESTORING CAMERA: " .. tostring(CameraType));
            CurrentCamera.CameraType = CameraType;
            CurrentCamera.CFrame = CFrame2;
            CurrentCamera.FieldOfView = FieldOfView;
            u47.mazeEntryCutsceneComplete:Fire();
            u47:fade(function() -- Line: 592
                -- upvalues: u49 (ref)
                u49:DoCleaning();
            end);
        end));
    end);
end;

KnitClient.CreateController(u7.new());

return nil;