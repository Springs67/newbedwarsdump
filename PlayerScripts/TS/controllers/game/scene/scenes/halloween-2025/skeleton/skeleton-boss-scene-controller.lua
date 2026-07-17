-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InQuad = v3.InQuad;
local Linear = v3.Linear;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v6.CollectionService;
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local RunService = v6.RunService;
local SoundService = v6.SoundService;
local TweenService = v6.TweenService;
local Workspace = v6.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local HalloweenEventEnvironment = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "games", "halloween-event", "ambient", "halloween-event-environment").HalloweenEventEnvironment;
local VignetteType = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "effect", "vignette", "vignette-meta").VignetteType;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local TitleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
local MonsterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SkeletonBossAction = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "constants", "skeleton-boss-scene-constants").SkeletonBossAction;
local SceneKey = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local MathUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "math-util").MathUtil;
local BaseSceneController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "base-scene-controller").BaseSceneController;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 43, Name: __tostring
        return "SkeletonBossSceneController";
    end,

    __index = BaseSceneController
});
u7.__index = u7;

function u7.new(...) -- Line: 49
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 53
    -- upvalues: BaseSceneController (copy), SceneKey (copy), u4 (copy)
    BaseSceneController.constructor(p9, SceneKey.SKELETON_BOSS);
    p9.Name = "SkeletonBossSceneController";
    p9.sceneMaid = u4.new();
    p9.sceneLightingModifiers = {};
    p9.musicTracks = {};
    p9.lastHitBoneObstacleTime = -1;
    p9.actionStateVariables = {
        reviveStateData = nil,
        randomWalkAnimationMaid = nil
    };
end;

function u7.KnitStart(p10) -- Line: 65
    -- upvalues: BaseSceneController (copy)
    BaseSceneController.KnitStart(p10);
end;

function u7.onSceneLoadingScreenStart(p11) -- Line: 68
    -- upvalues: KnitClient2 (copy), RunService (copy)
    KnitClient2.Controllers.PreloadController:runPreload({
        animations = {},
        sounds = {}
    });

    if not RunService:IsStudio() then
        p11:setupSoundAmbience();
        p11:setupSceneLighting();
    end;
end;

function u7.onSceneStart(u12) -- Line: 78
    -- upvalues: RunService (copy), WatchCollectionTag (copy), EntityUtil (copy), KnitClient2 (copy), ColorUtil (copy), SoundManager (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy), default2 (copy), MonsterType (copy), KnitClient (copy), TitleType (copy), ReplicatedStorage (copy), Workspace (copy), VignetteType (copy), EffectUtil (copy), u5 (copy), default (copy), InQuad (copy)
    if RunService:IsStudio() then
        u12:setupSoundAmbience();
        u12:setupSceneLighting();
    end;

    WatchCollectionTag("SkeletonBoss", function(u13) -- Line: 84
        -- upvalues: EntityUtil (ref), KnitClient2 (ref), ColorUtil (ref), SoundManager (ref), GameSound (ref), GameAnimationUtil (ref), AnimationType (ref)
        task.delay(1.5, function() -- Line: 85
            -- upvalues: EntityUtil (ref), u13 (copy), KnitClient2 (ref), ColorUtil (ref)
            local v14 = EntityUtil:getEntity(u13);

            if v14 then
                KnitClient2.Controllers.BossBarController:mountEntityBossBar(v14, {
                    DisplayName = "MARROW",
                    Gradient = ColorSequence.new(ColorUtil.hexColor(62207), ColorUtil.hexColor(4456334))
                });
            end;
        end);
        local HALLOWEEN_BOSS_SPAWN = GameSound.HALLOWEEN_BOSS_SPAWN;
        local v15 = {};
        local v16 = u13:FindFirstChildWhichIsA("BasePart");

        if v16 ~= nil then
            v16 = v16.Position;
        end;

        v15.position = v16;
        v15.rollOffMaxDistance = 400;
        v15.rollOffMinDistance = 60;
        SoundManager:playSound(HALLOWEEN_BOSS_SPAWN, v15);
        local Animator = u13:WaitForChild("Humanoid"):WaitForChild("Animator");
        local v17 = GameAnimationUtil:playAnimation(Animator, AnimationType.SKELETON_IDLE, {
            looped = true
        });

        if v17 then
            v17.Priority = Enum.AnimationPriority.Idle;
        end;

        GameAnimationUtil:playAnimation(Animator, AnimationType.WARLOCK_ENTER_SCENE);
    end);
    default2.Client:Get("EntityDeathEvent"):Connect(function(p18) -- Line: 116
        -- upvalues: MonsterType (ref), KnitClient (ref), TitleType (ref), ReplicatedStorage (ref), Workspace (ref)
        if p18.entityInstance:GetAttribute("MonsterType") ~= MonsterType.HALLOWEEN_SKELETON_BOSS then
            return nil;
        end;

        local Position = p18.entityInstance:GetPivot().Position;
        KnitClient.Controllers.RewardController:spawnRewards({
            {
                title = TitleType.SKELETON_SLAYER
            }
        }, {
            location = Position
        });
        local v19 = ReplicatedStorage.Assets.Misc.CryptRewards:FindFirstChildWhichIsA("Model"):Clone();
        v19.Parent = Workspace;
        v19:PivotTo(CFrame.new(Position));
        v19.PrimaryPart.Velocity = Vector3.new(0, 55, 0);
    end);
    default2.Client:GetNamespace("Halloween2025Remotes"):Get("SkeletonBossGasCloudCurse"):Connect(function(p20) -- Line: 133
        -- upvalues: Workspace (ref), SoundManager (ref), GameSound (ref), KnitClient2 (ref), VignetteType (ref)
        local v21 = p20 - Workspace:GetServerTimeNow();

        if v21 > 0 then
            SoundManager:playSound(GameSound.CURSE_INFLICT);
            KnitClient2.Controllers.VignetteController:createVignette(VignetteType.POISON_SPLASH);
            task.delay(v21, function() -- Line: 139
                -- upvalues: KnitClient2 (ref), VignetteType (ref)
                KnitClient2.Controllers.VignetteController:destroyVignette(VignetteType.POISON_SPLASH);
            end);
        end;
    end);
    WatchCollectionTag("SkeletonBossGasCloud", function(u22) -- Line: 144
        -- upvalues: SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        local u23 = SoundManager:playSound(GameSound.CURSE_ACTIVATE, {
            rollOffMinDistance = 60,
            rollOffMaxDistance = 100,
            parent = u22
        });
        local v24 = ReplicatedStorage.Assets.Effects.Potion.PoisonSplashPotion:Clone();
        v24:PivotTo(u22:GetPivot());
        v24.Parent = Workspace;
        EffectUtil:playEffects({ v24 }, nil, {
            destroyAfterSec = 3
        });
        local u25 = ReplicatedStorage.Assets.Effects.SkeletonKit_Smoke:Clone();
        u25.Smoke.Size = NumberSequence.new(18);
        u25:PivotTo(CFrame.new(u22:GetPivot().Position));
        u25.Parent = Workspace;
        u25.Smoke:Emit(10);
        local u26 = SoundManager:playSound(GameSound.SKELETON_KIT_SMOKE_LOOP, {
            rollOffMinDistance = 50,
            rollOffMaxDistance = 85,
            volumeMultiplier = 2.2,
            looped = true,
            parent = u22
        });
        local v27 = u22:GetAttribute("Duration");

        if v27 ~= nil then
            task.delay(v27, function() -- Line: 173
                -- upvalues: u22 (copy), u25 (copy), u23 (copy), u26 (copy)
                u22:Destroy();
                u25:Destroy();
                u23:Destroy();
                u26:Destroy();
            end);
        end;
    end);
    WatchCollectionTag("SkeletonPlatform", function(u28) -- Line: 181
        -- upvalues: u5 (ref), default (ref), InQuad (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        u5("Highlight", {
            FillTransparency = 0.5,
            OutlineTransparency = 0,
            Parent = u28,
            OutlineColor = Color3.fromRGB(69, 255, 227),
            FillColor = Color3.fromRGB(69, 255, 227),
            DepthMode = Enum.HighlightDepthMode.Occluded
        });
        local CFrame2 = u28.CFrame;
        local u29 = u28.CFrame + Vector3.new(0, 15, 0);
        default(0.3, InQuad, function(p30) -- Line: 196
            -- upvalues: u28 (copy), u29 (copy), CFrame2 (copy)
            u28.CFrame = u29:Lerp(CFrame2, p30);
        end);
        default(0.3, InQuad, function(p31) -- Line: 200
            -- upvalues: u28 (copy)
            u28.Transparency = p31;
        end, 1, 0);
        SoundManager:playSound(GameSound.ENDURANCE_ROCK_HIT_1, {
            rollOffMaxDistance = 330,
            rollOffMinDistance = 125,
            volumeMultiplier = 1.3,
            position = u28.Position
        });
        task.delay(9.75, function() -- Line: 211
            -- upvalues: ReplicatedStorage (ref), u28 (copy), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
            local v32 = ReplicatedStorage.Assets.Effects.HalloweenExplosion:Clone();
            v32.Position = u28.Position;
            v32.Parent = Workspace;
            EffectUtil:playEffects({ v32 }, nil, {
                destroyAfterSec = 3,
                sizeMultiplier = 2
            });
            SoundManager:playSound(GameSound.ENDURANCE_ROCK_HIT_3, {
                rollOffMaxDistance = 330,
                rollOffMinDistance = 125,
                volumeMultiplier = 1.3,
                position = u28.Position
            });
        end);
    end);
    default2.Client:GetNamespace("Halloween2025Remotes"):Get("SkeletonBossAction"):Connect(function(p33) -- Line: 227
        -- upvalues: u12 (copy)
        u12:routeBossAction(p33.action, p33.actionData);
    end);
end;

function u7.onSceneShutdown(u34) -- Line: 233
    u34.sceneMaid:DoCleaning();
    u34.sceneMaid:GiveTask(function() -- Line: 235
        -- upvalues: u34 (copy)
        local function _(p35) -- Line: 237
            return p35:Destroy();
        end;

        for i, v in u34.musicTracks do
            local _ = i - 1;
            v:Destroy();
        end;
    end);
end;

function u7.setupSoundAmbience(u36) -- Line: 245
    -- upvalues: SoundService (copy), SoundManager (copy), GameSound (copy)
    local AmbientReverb = SoundService.AmbientReverb;
    SoundService.AmbientReverb = Enum.ReverbType.Forest;
    u36.sceneMaid:GiveTask(function() -- Line: 248
        -- upvalues: SoundService (ref), AmbientReverb (copy)
        SoundService.AmbientReverb = AmbientReverb;
    end);
    local v37 = SoundManager:playModifiableSound(GameSound.HALLOWEEN_BOSS_AMBIENT_LOOP, {
        fadeInTime = 10,
        looped = true,
        volumeMultiplier = 0.7
    });

    if v37 then
        table.insert(u36.musicTracks, v37);
    end;

    task.delay(10, function() -- Line: 259
        -- upvalues: SoundManager (ref), GameSound (ref), u36 (copy)
        local v38 = SoundManager:playModifiableSound(GameSound.HALLOWEEN_2022_BOSS_MUSIC, {
            fadeInTime = 6,
            looped = true
        });

        if v38 then
            table.insert(u36.musicTracks, v38);
        end;
    end);
end;

function u7.handleHeadBounce(p39, p40) -- Line: 269
    -- upvalues: CollectionService (copy)
    local v41 = CollectionService:GetTagged("SkeletonBoss")[1];

    if not v41 then
        return nil;
    end;

    local state = p40.state;

    if state == "dissassemble" then
        local dissassemble = p40.dissassemble;

        if dissassemble ~= nil then
            dissassemble = dissassemble.duration;
        end;

        if dissassemble == 0 or (dissassemble ~= dissassemble or not dissassemble) then
            return nil;
        end;

        p39:headBounceDissassemble(v41, p40.dissassemble.duration);

        return;
    end;

    if state == "launch" then
        local launch = p40.launch;

        if launch ~= nil then
            launch = launch.landingPosition;
        end;

        local v42 = not launch;

        if not v42 then
            local launch2 = p40.launch;

            if launch2 ~= nil then
                launch2 = launch2.duration;
            end;

            if launch2 == 0 then
                launch2 = false;
            elseif launch2 ~= launch2 then
                launch2 = false;
            end;

            v42 = not launch2;

            if not v42 then
                local launch3 = p40.launch;

                if launch3 ~= nil then
                    launch3 = launch3.radius;
                end;

                if launch3 == 0 then
                    launch3 = false;
                elseif launch3 ~= launch3 then
                    launch3 = false;
                end;

                v42 = not launch3;
            end;
        end;

        if v42 then
            return nil;
        end;

        p39:headBounceLaunch(p40.launch.landingPosition, p40.launch.radius, p40.launch.duration);

        return;
    end;

    if state == "landed" then
        local landed = p40.landed;

        if landed ~= nil then
            landed = landed.landingPosition;
        end;

        if not landed then
            return nil;
        end;

        p39:headBounceLandedEffect(v41, p40.landed.landingPosition);

        return;
    end;

    if state ~= "reassemble" then
        return;
    end;

    local reassemble = p40.reassemble;

    if reassemble ~= nil then
        reassemble = reassemble.duration;
    end;

    if reassemble == 0 or (reassemble ~= reassemble or not reassemble) then
        return nil;
    end;

    p39:headBounceReassemble(v41, p40.reassemble.duration);
end;

function u7.headBounceDissassemble(u43, u44, p45) -- Line: 337
    -- upvalues: Workspace (copy), MathUtil (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), u4 (copy), RunService (copy)
    u44.Archivable = true;

    local function _(p46) -- Line: 341
        return p46:IsA("BasePart");
    end;

    local v47 = 0;
    local v48 = {};

    for i, child in u44:GetChildren() do
        local _ = i - 1;

        if child:IsA("BasePart") == true then
            v47 = v47 + 1;
            v48[v47] = child;
        end;
    end;

    local v49 = u44:FindFirstChild("3DClothing");

    if v49 ~= nil then
        local function _(p50) -- Line: 358
            return p50:IsA("BasePart");
        end;

        local v51 = 0;
        v49 = {};

        for i, child in v49:GetChildren() do
            local _ = i - 1;

            if child:IsA("BasePart") == true then
                v51 = v51 + 1;
                v49[v51] = child;
            end;
        end;
    end;

    local u52 = {};
    local u53 = {};
    local u54 = {};

    if v49 ~= nil then
        local function _(p55) -- Line: 379
            -- upvalues: u53 (copy), Workspace (ref)
            if p55.Name == "Head" then
                return nil;
            end;

            local v56 = p55:Clone();
            table.insert(u53, v56);
            v56:ClearAllChildren();
            v56.Parent = Workspace;
            v56.Anchored = false;
            v56.CanCollide = true;
        end;

        for i, v in v49 do
            local _ = i - 1;

            if v.Name ~= "Head" then
                local v57 = v:Clone();
                table.insert(u53, v57);
                v57:ClearAllChildren();
                v57.Parent = Workspace;
                v57.Anchored = false;
                v57.CanCollide = true;
            end;
        end;
    end;

    local function v64(u58) -- Line: 394
        -- upvalues: u52 (copy), u54 (copy), Workspace (ref), u53 (copy), MathUtil (ref)
        if u58.Name == "HumanoidRootPart" then
            return nil;
        end;

        if u58.Name == "Head" then
            return nil;
        end;

        local v59 = u58:Clone();
        table.insert(u52, v59);
        u54[v59] = u58;
        v59:ClearAllChildren();
        v59.Parent = Workspace;
        v59.Anchored = false;
        v59.CanCollide = true;

        local function _(p60) -- Line: 411
            -- upvalues: u58 (copy)
            return p60.Name == u58.Name;
        end;

        local v61 = nil;

        for i, v in u53 do
            local _ = i - 1;

            if v.Name == u58.Name == true then
                v61 = v;
                break;
            end;
        end;

        if v61 then
            local WeldConstraint = Instance.new("WeldConstraint");
            WeldConstraint.Part0 = v61;
            WeldConstraint.Part1 = v59;
            WeldConstraint.Parent = v61;
        end;

        local v62 = MathUtil.randomFloatMaxInclusive(-1, 1);
        local v63 = MathUtil.randomFloatMaxInclusive(0, 1);
        v59:ApplyImpulse(Vector3.new(v62, v63, MathUtil.randomFloatMaxInclusive(-1, 1)).Unit * MathUtil.randomFloatMaxInclusive(20, 32) * v59.Mass);
    end;

    for i, v in v48 do
        v64(v, i - 1, v48);
    end;

    SoundManager:playSound(GameSound.SKELETON_KIT_DISASSEMBLE, {
        rollOffMaxDistance = 300,
        rollOffMinDistance = 20,
        position = u44:GetPivot().Position,
        parent = u44
    });
    u43.actionStateVariables.reviveStateData = {
        clonedBodyParts = u52,
        clonedClothingParts = u53,
        clonedBodyPartToOriginalMap = u54
    };
    local Head = u44:FindFirstChild("Head");
    local u65;

    if u44 == nil then
        u65 = u44;
    else
        u65 = u44:FindFirstChild("HumanoidRootPart");
    end;

    if Head and u65 then
        local u66 = Head:Clone();
        u66.Anchored = false;
        u66.CanCollide = false;
        u66.CanTouch = false;
        u66.CanQuery = false;
        u66:SetAttribute("NoSuffocation", true);
        u66.Name = "SkeletonKit_HeadClone";

        local function _(p67) -- Line: 469
            if p67:IsA("SpecialMesh") then
                return nil;
            end;

            p67:Destroy();
        end;

        for i, child in u66:GetChildren() do
            local _ = i - 1;

            if not child:IsA("SpecialMesh") then
                child:Destroy();
            end;
        end;

        u66.Parent = Workspace;
        u43.actionStateVariables.reviveStateData.head = u66;
        local v68 = u44:FindFirstChild("3DClothing");

        if v68 ~= nil then
            v68 = v68:FindFirstChild("Head");
        end;

        if v68 then
            local v69 = v68:Clone();
            v69.CanCollide = false;
            v69.CanTouch = false;
            v69.CanQuery = false;
            v69.Parent = u66;
            v69.Name = "SkeletonKit_HeadClothingClone";
            u43.actionStateVariables.reviveStateData.headClothing = v69;
            local WeldConstraint = Instance.new("WeldConstraint");
            WeldConstraint.Part0 = v69;
            WeldConstraint.Part1 = u66;
            WeldConstraint.Parent = v69;
        end;

        u44.Archivable = false;
        local u70 = {
            transparency = 1
        };
        KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(u44):addModifier(u70);

        if u44 ~= nil then
            u44:SetAttribute("DisableInvisibilityFootstepParticles", true);
        end;

        local v71 = u4.new();
        v71:GiveTask(function() -- Line: 514
            -- upvalues: KnitClient (ref), u44 (copy), u70 (copy)
            KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(u44):removeModifier(u70);
            local v72 = u44;

            if v72 ~= nil then
                v72:SetAttribute("DisableInvisibilityFootstepParticles", false);
            end;
        end);
        u43.actionStateVariables.reviveStateData.transparencyMaid = v71;
        task.wait(p45);
        local u73 = nil;
        u73 = RunService.Heartbeat:Connect(function(p74) -- Line: 525
            -- upvalues: u44 (copy), u65 (copy), u73 (ref), u43 (copy), u66 (copy)
            local v75 = u44;

            if v75 ~= nil then
                v75 = v75.Parent;
            end;

            local v76 = v75 == nil;

            if not v76 then
                local v77 = u65;

                if v77 ~= nil then
                    v77 = v77.Parent;
                end;

                v76 = v77 == nil or u44.PrimaryPart == nil;
            end;

            if v76 then
                u73:Disconnect();

                return nil;
            end;

            local v78 = u65:GetPivot();
            local v79 = u43:getEntityHeightOffset() - u66.Size.Y / 2;
            u66:PivotTo(v78 - Vector3.new(0, v79, 0));
        end);
        u43.actionStateVariables.reviveStateData.headFollowMaid = u4.new();
        local headFollowMaid = u43.actionStateVariables.reviveStateData.headFollowMaid;

        if headFollowMaid ~= nil then
            headFollowMaid:GiveTask(function() -- Line: 554
                -- upvalues: u73 (ref)
                u73:Disconnect();
            end);
        end;
    end;
end;

function u7.headBounceLaunch(p80, p81, p82, p83) -- Line: 560
    p80:telegraphCircle(p82, p81, p83);
end;

function u7.headBounceLandedEffect(p84, p85, p86) -- Line: 563
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy), KnitClient (copy)
    local v87 = ReplicatedStorage.Assets.Effects.BlockStompShockwave:Clone();
    v87:PivotTo(CFrame.new(p86));
    v87.Parent = Workspace;
    EffectUtil:scaleEffect({ v87 }, 4);
    EffectUtil:playEffects({ v87 }, nil, {
        destroyAfterSec = 3
    });
    SoundManager:playSound(GameSound.BLOCK_KICKER_KIT_STOMP);
    KnitClient.Controllers.ScreenShakeController:shake(p85:GetPivot().Position, Vector3.new(0, -1, 0), {
        magnitude = 2,
        cycles = 9,
        duration = 0.5,
        zMagnitude = 0.4
    });
end;

function u7.headBounceReassemble(u88, p89, p90) -- Line: 579
    -- upvalues: SoundManager (copy), GameSound (copy), default (copy), InQuad (copy)
    if u88.actionStateVariables.reviveStateData == nil then
        return nil;
    end;

    local headFollowMaid = u88.actionStateVariables.reviveStateData.headFollowMaid;

    if headFollowMaid ~= nil then
        headFollowMaid:DoCleaning();
    end;

    if u88.actionStateVariables.reviveStateData.head then
        u88.actionStateVariables.reviveStateData.head.CanCollide = false;
        u88.actionStateVariables.reviveStateData.head.CanTouch = false;
        u88.actionStateVariables.reviveStateData.head.CanQuery = false;
        u88.actionStateVariables.reviveStateData.head.Anchored = true;
    end;

    local clonedBodyParts = u88.actionStateVariables.reviveStateData.clonedBodyParts;

    if clonedBodyParts ~= nil then
        local function _(p91) -- Line: 597
            p91.CanCollide = false;
            p91.CanTouch = false;
            p91.CanQuery = false;
            p91.Anchored = true;
        end;

        for i, v in clonedBodyParts do
            local _ = i - 1;
            v.CanCollide = false;
            v.CanTouch = false;
            v.CanQuery = false;
            v.Anchored = true;
        end;
    end;

    local headFollowMaid2 = u88.actionStateVariables.reviveStateData.headFollowMaid;

    if headFollowMaid2 ~= nil then
        headFollowMaid2:DoCleaning();
    end;

    SoundManager:playSound(GameSound.SKELETON_KIT_REASSEMBLE, {
        rollOffMaxDistance = 300,
        rollOffMinDistance = 20,
        position = p89:GetPivot().Position,
        parent = p89
    });
    local u92 = {};

    if u88.actionStateVariables.reviveStateData.head then
        u92[u88.actionStateVariables.reviveStateData.head] = u88.actionStateVariables.reviveStateData.head:GetPivot();
    end;

    local clonedBodyParts2 = u88.actionStateVariables.reviveStateData.clonedBodyParts;

    if clonedBodyParts2 ~= nil then
        local function _(p93) -- Line: 628
            -- upvalues: u92 (copy)
            u92[p93] = p93:GetPivot();
        end;

        for i, v in clonedBodyParts2 do
            local _ = i - 1;
            u92[v] = v:GetPivot();
        end;
    end;

    local Head = p89:FindFirstChild("Head");
    local v96 = default(p90, InQuad, function(u94) -- Line: 638
        -- upvalues: u88 (copy), Head (copy), u92 (copy)
        local reviveStateData = u88.actionStateVariables.reviveStateData;

        if reviveStateData ~= nil then
            reviveStateData = reviveStateData.head;
        end;

        if reviveStateData and Head and u92[u88.actionStateVariables.reviveStateData.head] ~= nil then
            u88.actionStateVariables.reviveStateData.head:PivotTo(u92[u88.actionStateVariables.reviveStateData.head]:Lerp(Head:GetPivot(), u94));
        end;

        local clonedBodyParts3 = u88.actionStateVariables.reviveStateData.clonedBodyParts;

        if clonedBodyParts3 ~= nil then
            local function _(p95) -- Line: 660
                -- upvalues: u88 (ref), u92 (ref), u94 (copy)
                local clonedBodyPartToOriginalMap = u88.actionStateVariables.reviveStateData.clonedBodyPartToOriginalMap;

                if clonedBodyPartToOriginalMap ~= nil then
                    clonedBodyPartToOriginalMap = clonedBodyPartToOriginalMap[p95];
                end;

                if clonedBodyPartToOriginalMap then
                    p95:PivotTo(u92[p95]:Lerp(clonedBodyPartToOriginalMap:GetPivot(), u94));
                end;
            end;

            for i, v in clonedBodyParts3 do
                local _ = i - 1;
                local clonedBodyPartToOriginalMap = u88.actionStateVariables.reviveStateData.clonedBodyPartToOriginalMap;

                if clonedBodyPartToOriginalMap ~= nil then
                    clonedBodyPartToOriginalMap = clonedBodyPartToOriginalMap[v];
                end;

                if clonedBodyPartToOriginalMap then
                    v:PivotTo(u92[v]:Lerp(clonedBodyPartToOriginalMap:GetPivot(), u94));
                end;
            end;
        end;
    end, 0, 1):Play();
    task.wait(p90);
    v96:Cancel();
    local transparencyMaid = u88.actionStateVariables.reviveStateData.transparencyMaid;

    if transparencyMaid ~= nil then
        transparencyMaid:DoCleaning();
    end;

    local head = u88.actionStateVariables.reviveStateData.head;

    if head ~= nil then
        head:Destroy();
    end;

    local clonedBodyParts3 = u88.actionStateVariables.reviveStateData.clonedBodyParts;

    if clonedBodyParts3 ~= nil then
        local function _(p97) -- Line: 690
            return p97:Destroy();
        end;

        for i, v in clonedBodyParts3 do
            local _ = i - 1;
            v:Destroy();
        end;
    end;

    local clonedClothingParts = u88.actionStateVariables.reviveStateData.clonedClothingParts;

    if clonedClothingParts ~= nil then
        local function _(p98) -- Line: 699
            return p98:Destroy();
        end;

        for i, v in clonedClothingParts do
            local _ = i - 1;
            v:Destroy();
        end;
    end;

    u88.actionStateVariables.reviveStateData = nil;
end;

function u7.handleRandomWalk(p99, p100) -- Line: 708
    -- upvalues: CollectionService (copy), u4 (copy), u5 (copy)
    local v101 = CollectionService:GetTagged("SkeletonBoss")[1];

    if not v101 then
        return nil;
    end;

    local v102 = v101.Humanoid:FindFirstChildOfClass("Animator");

    if not v102 then
        return nil;
    end;

    if not p100.start then
        local randomWalkAnimationMaid = p99.actionStateVariables.randomWalkAnimationMaid;

        if randomWalkAnimationMaid ~= nil then
            randomWalkAnimationMaid:DoCleaning();
        end;

        p99.actionStateVariables.randomWalkAnimationMaid = nil;

        return;
    end;

    local v103 = u4.new();
    local v104 = u5("Animation", {
        AnimationId = p100.mode == "run" and "rbxassetid://507767714" or "rbxassetid://507777826"
    });
    v103:GiveTask(v104);
    local u105 = v102:LoadAnimation(v104);
    v103:GiveTask(u105);
    u105.Looped = true;
    u105.Priority = Enum.AnimationPriority.Movement;
    u105:Play();
    v103:GiveTask(function() -- Line: 728
        -- upvalues: u105 (copy)
        u105:Stop();
        u105:Destroy();
    end);
    p99.actionStateVariables.randomWalkAnimationMaid = v103;
end;

function u7.spawnBoneObstacle(u106, p107) -- Line: 741
    -- upvalues: u4 (copy), u5 (copy), Workspace (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), GameQueryUtil (copy), default (copy), Linear (copy), Players (copy), default2 (copy)
    local u108 = u4.new();
    local u109 = u5("Model", {
        Name = "WallModel",
        Parent = Workspace
    });
    local v110 = u5("Part", {
        Name = "WallPart",
        Anchored = true,
        CanCollide = false,
        CanTouch = true,
        CanQuery = false,
        Transparency = 1,
        Parent = u109
    });
    u109.PrimaryPart = v110;
    SoundManager:playSound(GameSound.HALLOWEEN_BOSS_FOG_LOOP, {
        rollOffMaxDistance = 400,
        volumeMultiplier = 0.8,
        parent = v110
    });
    local v111 = math.abs(p107.travelDirection.X);
    local v112 = math.abs(p107.travelDirection.Y);
    local v113 = math.abs(p107.travelDirection.Z);
    local v114 = Vector3.new(v111, v112, v113);
    local v115 = p107.pos1 - p107.pos2;
    local v116 = math.abs(v115.X);
    local v117 = math.abs(v115.Z);
    local v118 = Vector3.new(v116, 0, v117);
    local v119 = v118.X == 0 and 0 or 90;
    v110.Size = v114 * 3.2 + v118 + Vector3.new(0, 2, 0);
    local u120 = p107.pos1:Lerp(p107.pos2, 0.5) + Vector3.new(0, v110.Size.Y / 2, 0);
    v110.CFrame = CFrame.new(u120);
    u109:PivotTo(CFrame.new(u120));
    local v121 = false;
    local v122 = 0;

    while true do
        if v121 then
            v122 = v122 + 1;
        else
            v121 = true;
        end;

        if v122 >= 8 then
            GameQueryUtil:setQueryIgnored(v110, true);
            GameQueryUtil:setQueryIgnored(u109, true);
            local u123 = u120 + p107.travelDirection * p107.travelDistance;
            local u125 = default(p107.travelDistance / p107.travelSpeed, Linear, function(p124) -- Line: 822
                -- upvalues: u109 (copy), u120 (copy), u123 (copy)
                u109:PivotTo(CFrame.new(u120:Lerp(u123, p124)));
            end);
            u108:GiveTask(v110.Touched:Connect(function(p126) -- Line: 825
                -- upvalues: Players (ref), u106 (copy), SoundManager (ref), GameSound (ref), default2 (ref)
                local Character = Players.LocalPlayer.Character;

                if not Character then
                    return nil;
                end;

                if not p126:IsDescendantOf(Character) then
                    return nil;
                end;

                if os.time() - u106.lastHitBoneObstacleTime < 1 then
                    return nil;
                end;

                u106.lastHitBoneObstacleTime = os.time();
                SoundManager:playSound(GameSound.SKELETON_ATTACK_1);
                default2.Client:GetNamespace("Halloween2025Remotes"):Get("HitBoneObstacle"):SendToServer();
            end));
            task.spawn(function() -- Line: 840
                -- upvalues: u125 (copy), u109 (copy), u108 (copy)
                u125:Wait();
                u109:Destroy();
                u108:DoCleaning();
            end);

            return;
        end;

        local v127 = ReplicatedStorage.Assets.Misc.Bone:Clone();
        v127.Size = v127.Size * 3;
        v127.Position = u120 + Vector3.new(v119 ~= 90 and 0 or v122 * 18, 0, v119 == 90 and 0 or v122 * 18);
        v127.Rotation = Vector3.new(90, 0, v119);
        v127.Parent = v110;
        u5("WeldConstraint", {
            Part0 = v110,
            Part1 = v127,
            Parent = v110
        });
        GameQueryUtil:setQueryIgnored(v127, true);
        local v128 = ReplicatedStorage.Assets.Misc.Bone:Clone();
        v128.Size = v128.Size * 3;
        v128.Position = u120 + Vector3.new(v119 ~= 90 and 0 or -v122 * 18, 0, v119 == 90 and 0 or -v122 * 18);
        v128.Rotation = Vector3.new(90, 0, v119);
        v128.Parent = v110;
        u5("WeldConstraint", {
            Part0 = v110,
            Part1 = v128,
            Parent = v110
        });
        GameQueryUtil:setQueryIgnored(v128, true);
    end;
end;

function u7.setupSceneLighting(p129) -- Line: 846
    -- upvalues: KnitClient (copy), HalloweenEventEnvironment (copy)
    KnitClient.Controllers.EnvironmentController:setupEnvironment(HalloweenEventEnvironment, 100);
end;

function u7.routeBossAction(p130, p131, p132) -- Line: 849
    -- upvalues: SkeletonBossAction (copy), CollectionService (copy), SoundManager (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy)
    if p131 == SkeletonBossAction.HEAD_BOUNCE then
        p130:handleHeadBounce(p132);

        return;
    end;

    if p131 == SkeletonBossAction.RANDOM_WALK then
        p130:handleRandomWalk(p132);

        return;
    end;

    if p131 == SkeletonBossAction.BONE_THROW then
        local v133 = CollectionService:GetTagged("SkeletonBoss")[1];

        if not v133 then
            return nil;
        end;

        local v134 = v133.Humanoid:FindFirstChildOfClass("Animator");

        if not v134 then
            return nil;
        end;

        SoundManager:playSound(GameSound.WITCH_BROOM_DISMOUNT, {
            rollOffMinDistance = 360,
            rollOffMaxDistance = 500,
            parent = v133
        });
        GameAnimationUtil:playAnimation(v134, AnimationType.SPEAR_THROW, {
            speed = 1.2
        });

        return;
    end;

    if p131 ~= SkeletonBossAction.GAS_CLOUD_CURSE then
        if p131 == SkeletonBossAction.BONE_OBSTACLE then
            if not CollectionService:GetTagged("SkeletonBoss")[1] then
                return nil;
            end;

            p130:spawnBoneObstacle(p132);
        end;

        return;
    end;

    local v135 = CollectionService:GetTagged("SkeletonBoss")[1];

    if not v135 then
        return nil;
    end;

    local v136 = v135.Humanoid:FindFirstChildOfClass("Animator");

    if not v136 then
        return nil;
    end;

    GameAnimationUtil:playAnimation(v136, AnimationType.WAND_CAST, {
        speed = 1
    });
end;

function u7.telegraphCircle(p137, p138, p139, p140, p141) -- Line: 905
    -- upvalues: u4 (copy), Workspace (copy), u5 (copy), TweenService (copy)
    local v142 = p141 == nil and 0.75 or p141;
    local u143 = u4.new();
    local v144 = {};
    local v145 = Vector3.new(0, v142 / 2, 0);
    v144.CFrame = CFrame.new(p139 + v145) * CFrame.Angles(0, 0, 1.5707963267948966);
    v144.Anchored = true;
    v144.CanCollide = false;
    v144.CanQuery = false;
    v144.Shape = Enum.PartType.Cylinder;
    v144.Size = Vector3.new(v142, p138 * 2, p138 * 2);
    v144.Material = Enum.Material.ForceField;
    v144.Transparency = 0.2;
    v144.Color = Color3.fromRGB(255, 41, 0);
    v144.Parent = Workspace;
    local v146 = u5("Part", v144);
    u143:GiveTask(v146);
    local v147 = v146:Clone();
    v147.Material = Enum.Material.Neon;
    v147.Size = Vector3.new(0.6, 0, 0);
    v147.Transparency = 0.6;
    v147.Parent = Workspace;
    u143:GiveTask(v147);
    local v148 = TweenService:Create(v147, TweenInfo.new(p140), {
        Size = v146.Size
    });
    v148.Completed:Connect(function() -- Line: 937
        -- upvalues: u143 (copy)
        u143:DoCleaning();
    end);
    v148:Play();
end;

function u7.getEntityHeightOffset(p149) -- Line: 942
    -- upvalues: CollectionService (copy)
    if p149.entityHeightOffset == nil then
        local v150 = CollectionService:GetTagged("SkeletonBoss")[1];

        if not (v150 and v150.PrimaryPart) then
            return 0;
        end;

        p149.entityHeightOffset = v150.Humanoid.HipHeight + v150.PrimaryPart.Size.Y / 2;
    end;

    return p149.entityHeightOffset;
end;

KnitClient.CreateController(u7.new());

return nil;