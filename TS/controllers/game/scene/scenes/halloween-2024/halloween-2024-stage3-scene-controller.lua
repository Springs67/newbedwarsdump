-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local Promise = v2.Promise;
local Signal = v2.Signal;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InQuad = v3.InQuad;
local Linear = v3.Linear;
local OutCubic = v3.OutCubic;
local OutExpo = v3.OutExpo;
local OutQuint = v3.OutQuint;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v7.CollectionService;
local Players = v7.Players;
local ReplicatedStorage = v7.ReplicatedStorage;
local RunService = v7.RunService;
local SoundService = v7.SoundService;
local TweenService = v7.TweenService;
local Workspace = v7.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local FadeUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "fade", "fade-util").FadeUtil;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local MonsterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local v8 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "constants", "halloween-2024-scene-constants");
local Halloween2024BossAction = v8.Halloween2024BossAction;
local Halloween2024BossConfigs = v8.Halloween2024BossConfigs;
local SceneKey = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local ImageOverlay = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "effect", "ui", "image-overlay").ImageOverlay;
local BaseSceneController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-scene-controller").BaseSceneController;
local HW_STAGE_3_ENVIRONMENT = RuntimeLib.import(script, script.Parent, "environments", "stage-3-environment").HW_STAGE_3_ENVIRONMENT;
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 57, Name: __tostring
        return "Halloween2024Stage3SceneController";
    end,

    __index = BaseSceneController
});
u9.__index = u9;

function u9.new(...) -- Line: 63
    -- upvalues: u9 (ref)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11) -- Line: 67
    -- upvalues: BaseSceneController (copy), SceneKey (copy)
    BaseSceneController.constructor(p11, SceneKey.HALLOWEEN_2024_STAGE_3);
    p11.Name = "Halloween2024Stage3Scene";
    p11.musicTracks = {};
    p11.caveAmbience = nil;
end;

function u9.KnitStart(p12) -- Line: 73
    -- upvalues: BaseSceneController (copy)
    BaseSceneController.KnitStart(p12);
end;

function u9.onSceneLoadingScreenStart(p13) -- Line: 76
    -- upvalues: KnitClient (copy), AnimationType (copy), GameSound (copy)
    KnitClient.Controllers.PreloadController:runPreload({
        animations = {
            AnimationType.LARGE_FALL_1,
            AnimationType.SPIDER_QUEEN_LANDING,
            AnimationType.SPIDER_QUEEN_IDLE,
            AnimationType.SPIDER_QUEEN_WEB_CAST_SKY,
            AnimationType.SPIDER_QUEEN_WEB_SPRAY,
            AnimationType.SWORD_SWING_1,
            AnimationType.SWORD_SWING_2,
            AnimationType.HEAVENLY_SWORD_CHARGE
        },
        sounds = { GameSound.SPIDER_QUEEN_BOSS_MUSIC, GameSound.LIGHT_SWORD_ATTACK, GameSound.INFERNAL_SWORD_ATTACK }
    });
end;

function u9.onSceneStart(u14) -- Line: 82
    -- upvalues: Workspace (copy), Signal (copy), u4 (copy), u6 (copy), ImageOverlay (copy), BedwarsImageId (copy), Halloween2024BossConfigs (copy), Players (copy), SoundManager (copy), GameSound (copy), default2 (copy), FadeUtil (copy), WatchCollectionTag (copy), EntityUtil (copy), KnitClient2 (copy), ColorUtil (copy), GameAnimationUtil (copy), AnimationType (copy), EntityDamageEventZap (copy), MonsterType (copy), Flamework (copy), BedwarsAppIds (copy), default (copy), Linear (copy)
    u14:setupEnvironment();
    u14:setupSoundAmbience();
    u14:listenForBossActions();

    if Workspace.CurrentCamera then
        Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
    end;

    u14.localPlayerStunnedSignal = Signal.new();
    u14.stunnedMaid = u4.new();
    u14.stunnedPlayersMaid = {};
    u14.localPlayerStunnedSignal:Connect(function(p15) -- Line: 92
        -- upvalues: u14 (copy), u6 (ref), ImageOverlay (ref), BedwarsImageId (ref), Halloween2024BossConfigs (ref), Players (ref), SoundManager (ref), GameSound (ref)
        if not (p15 and u14.stunnedMaid) then
            local stunnedMaid = u14.stunnedMaid;

            if stunnedMaid ~= nil then
                stunnedMaid:DoCleaning();
            end;

            return;
        end;

        local v16 = u14:disableLocalPlayerActions();
        u14.stunnedMaid:GiveTask(v16);
        local u17 = u6.mount(u6.createElement(ImageOverlay, {
            FrameTransparency = 0.5,
            Image = BedwarsImageId.COB_WEB_FRAME,
            FadeOutDelay = Halloween2024BossConfigs.WEB_PULL_DURATION - 1
        }), Players.LocalPlayer:WaitForChild("PlayerGui"));
        SoundManager:playSound(GameSound.LASSO_HIT);
        u14.stunnedMaid:GiveTask(function() -- Line: 102
            -- upvalues: u6 (ref), u17 (copy)
            u6.unmount(u17);
        end);
    end);
    default2.Client:GetNamespace("Halloween2024Remotes"):Get("EnteredBossFight"):Connect(function() -- Line: 112
        -- upvalues: u14 (copy), FadeUtil (ref), SoundManager (ref), GameSound (ref)
        if u14.caveAmbience then
            u14.caveAmbience:Stop();
            u14.caveAmbience:Destroy();
        end;

        FadeUtil:fade(0.1, 0.5, 0.3);
        SoundManager:playSound(GameSound.WEREWOLF_HEARTBEAT, {
            volumeMultiplier = 5
        });
    end);
    WatchCollectionTag("SpiderBoss", function(u18) -- Line: 123
        -- upvalues: SoundManager (ref), GameSound (ref), u14 (copy), EntityUtil (ref), KnitClient2 (ref), ColorUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        local v19 = SoundManager:playModifiableSound(GameSound.HALLOWEEN_BOSS_AMBIENT_LOOP, {
            fadeInTime = 10,
            looped = true,
            volumeMultiplier = 0.55
        });

        if v19 then
            table.insert(u14.musicTracks, v19);
        end;

        local v20 = SoundManager:playModifiableSound(GameSound.SPIDER_QUEEN_BOSS_MUSIC, {
            fadeInTime = 6,
            looped = true
        });

        if v20 then
            table.insert(u14.musicTracks, v20);
        end;

        local u21 = EntityUtil:getEntity(u18);
        task.delay(1.5, function() -- Line: 141
            -- upvalues: u21 (copy), KnitClient2 (ref), ColorUtil (ref)
            if u21 then
                KnitClient2.Controllers.BossBarController:mountEntityBossBar(u21, {
                    DisplayName = "Spider Queen",
                    Gradient = ColorSequence.new(ColorUtil.hexColor(14695102), ColorUtil.hexColor(16283135))
                });
            end;
        end);
        local Animator = u18:WaitForChild("Humanoid"):WaitForChild("Animator");
        local v22 = GameAnimationUtil:playAnimation(Animator, AnimationType.SPIDER_QUEEN_IDLE, {
            looped = true
        });

        if v22 then
            v22.Priority = Enum.AnimationPriority.Idle;
        end;

        GameAnimationUtil:playAnimation(Animator, AnimationType.LARGE_FALL_1, {
            looped = false
        });
        task.delay(0.45, function() -- Line: 159
            -- upvalues: u21 (copy), SoundManager (ref), GameSound (ref), u18 (copy)
            if u21 then
                local BLOCK_KICKER_KIT_STOMP = GameSound.BLOCK_KICKER_KIT_STOMP;
                local v23 = {};
                local v24 = u18:FindFirstChildWhichIsA("BasePart");

                if v24 ~= nil then
                    v24 = v24.Position;
                end;

                v23.position = v24;
                v23.volumeMultiplier = 3;
                v23.rollOffMaxDistance = 400;
                v23.rollOffMinDistance = 60;
                v23.looped = false;
                SoundManager:playSound(BLOCK_KICKER_KIT_STOMP, v23);
            end;
        end);
    end);
    local u25 = nil;
    local u26 = nil;
    EntityDamageEventZap.On(function(p27, p28, p29, p30, p31, p32, p33, p34, p35, p36, p37, p38, p39, p40) -- Line: 190
        -- upvalues: MonsterType (ref), u14 (copy), u26 (ref), u25 (ref)
        if p27:GetAttribute("MonsterType") ~= MonsterType.HALLOWEEN_SPIDER_BOSS then
            return nil;
        end;

        local v41 = u14:getBossModel();

        if v41 ~= nil then
            v41 = v41:GetPivot();
        end;

        u26 = v41;
        local v42 = u25;

        if v42 then
            local v43 = u25;

            if v43 ~= nil then
                v43 = v43.Name;
            end;

            v42 = v43 == p27.Name;
        end;

        if v42 then
            return nil;
        end;

        u25 = p27:Clone();
    end);
    default2.Client:Get("EntityDeathEvent"):Connect(function(p44) -- Line: 213
        -- upvalues: MonsterType (ref), u25 (ref), u26 (ref), Workspace (ref), u14 (copy), Flamework (ref), BedwarsAppIds (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref)
        if p44.entityInstance:GetAttribute("MonsterType") ~= MonsterType.HALLOWEEN_SPIDER_BOSS then
            return nil;
        end;

        if not u25 then
            return nil;
        end;

        if u26 then
            u25:PivotTo(u26);
        end;

        u25.Parent = Workspace;
        u14:disableMusic();
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.BOSS_BAR);
        local Humanoid = u25:FindFirstChild("Humanoid");

        if Humanoid ~= nil then
            Humanoid = Humanoid:FindFirstChild("Animator");
        end;

        if Humanoid then
            GameAnimationUtil:playAnimation(Humanoid, AnimationType.SPIDER_QUEEN_IDLE, {
                fadeInTime = 0.02
            });
            local v45 = GameAnimationUtil:playAnimation(Humanoid, AnimationType.SPIDER_QUEEN_DEATH, {
                looped = false
            });

            if v45 ~= nil then
                v45.Stopped:Connect(function() -- Line: 241
                    -- upvalues: u25 (ref)
                    local v46 = u25;

                    if v46 ~= nil then
                        v46:Destroy();
                    end;
                end);
            end;
        end;

        SoundManager:playSound(GameSound.DEATH_FINAL, {
            volumeMultiplier = 5
        });
        SoundManager:playSound(GameSound.SPIDER_QUEEN_BOSS_DEATH);
    end);
    default2.Client:Get("SpiderQueenSlash"):Connect(function(p47) -- Line: 254
        -- upvalues: default (ref), Linear (ref)
        local Union = p47.indicatorModel:FindFirstChild("Union");
        local Base = p47.indicatorModel:FindFirstChild("Base");

        if not (Union and Base) then
            return nil;
        end;

        Union.Transparency = 0.9;
        Base.Transparency = 0.9;
        local _ = Union.Size;
        default(2.5, Linear, function(p48) -- Line: 263
            -- upvalues: Union (copy), Base (copy)
            Union.Size = Vector3.new(Base.Size.X * p48, Base.Size.Y * p48, Base.Size.Z * p48);
            Union.PivotOffset = CFrame.new((Vector3.new(0, 0, Union.Size.Z / 2)));
            Union:GetPivot();
            Union:PivotTo(Base:GetPivot());
        end, 0, 1);
        task.delay(3, function() -- Line: 269
            -- upvalues: Union (copy), Base (copy)
            Union.Transparency = 1;
            Base.Transparency = 1;
        end);
    end);
end;

function u9.onSceneShutdown(p49) -- Line: 275
end;

function u9.disableMusic(p50) -- Line: 277
    local function _(p51) -- Line: 279
        p51:Stop();
        p51:Destroy();
    end;

    for i, v in p50.musicTracks do
        local _ = i - 1;
        v:Stop();
        v:Destroy();
    end;
end;

function u9.setupEnvironment(p52) -- Line: 287
    -- upvalues: KnitClient (copy), HW_STAGE_3_ENVIRONMENT (copy)
    KnitClient.Controllers.EnvironmentController:setupEnvironment(HW_STAGE_3_ENVIRONMENT);
end;

function u9.setupSoundAmbience(p53) -- Line: 290
    -- upvalues: SoundService (copy), SoundManager (copy), GameSound (copy), KnitClient2 (copy)
    SoundService.AmbientReverb = Enum.ReverbType.Cave;
    local v54 = SoundManager:playModifiableSound(GameSound.CAVE_AMBIENCE, {
        volumeMultiplier = 1.2,
        looped = true
    });
    p53.caveAmbience = v54;
    table.insert(p53.musicTracks, v54);
    KnitClient2.Controllers.FootstepsController.footstepModifier:addModifier({
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
    });
end;

function u9.listenForBossActions(u55) -- Line: 307
    -- upvalues: default2 (copy)
    default2.Client:WaitFor("Halloween2024EventBossAction"):expect():Connect(function(p56) -- Line: 308
        -- upvalues: u55 (copy)
        u55:routeBossAction(p56.action, p56.actionData);
    end);
end;

function u9.handleWebDeploy(u57, p58) -- Line: 312
    -- upvalues: u4 (copy), GameAnimationUtil (copy), AnimationType (copy), Halloween2024BossConfigs (copy), SoundManager (copy), GameSound (copy), Workspace (copy), GameQueryUtil (copy), u5 (copy), BedwarsImageId (copy), TweenService (copy)
    local u59 = u4.new();
    local v60 = u57:getBossModel();

    if not v60 then
        return nil;
    end;

    local PrimaryPart = v60.PrimaryPart;
    local v61 = v60:FindFirstChildWhichIsA("Humanoid");
    local v62;

    if v61 == nil then
        v62 = v61;
    else
        v62 = v61:FindFirstChildWhichIsA("Animator");
    end;

    if not (v61 and v62) then
        return nil;
    end;

    GameAnimationUtil:playAnimation(v62, AnimationType.SPIDER_QUEEN_WEB_SPRAY, {
        fadeInTime = 0.1,
        looped = false,
        speed = 4 / Halloween2024BossConfigs.WEB_PULL_DELAY
    });
    SoundManager:playSound(GameSound.SPIDER_WEB_BRIDGE_FIRE, {
        rollOffMaxDistance = 400,
        volumeMultiplier = 2,
        position = PrimaryPart:GetPivot().Position
    });
    local v63 = RaycastParams.new();
    v63.FilterType = Enum.RaycastFilterType.Include;
    v63:AddToFilter(Workspace.Terrain);
    local v64 = GameQueryUtil:raycast(PrimaryPart.Position + Vector3.new(0, 10, 0), Vector3.new(0, -100, 0), v63);

    if not v64 then
        return nil;
    end;

    local webSegments = p58.webSegments;
    local v65 = 360 / webSegments;
    local v66 = math.rad((v65 + p58.additionalViewAngle) / 2);
    local u67 = math.tan(v66) * p58.pullDistance * 2;
    local v68 = false;
    local v69 = 0;

    while true do
        if v68 then
            v69 = v69 + 2;
        else
            v68 = true;
        end;

        if v69 >= webSegments then
            task.delay(Halloween2024BossConfigs.WEB_PULL_DELAY + 1, function() -- Line: 496
                -- upvalues: u59 (copy)
                u59:DoCleaning();
            end);

            return;
        end;

        local v70 = CFrame.Angles(0, math.rad(v69 * v65 + p58.angleOffset), 0):VectorToWorldSpace(PrimaryPart.CFrame.LookVector);
        local u71 = CFrame.new(v64.Position + v70 * p58.pullDistance, v64.Position + v70 * (p58.pullDistance + 1));
        local u72 = CFrame.new(PrimaryPart.Position, u71.Position);
        local v73 = CFrame.new(v64.Position + Vector3.new(0, 1, 0), u71.Position + Vector3.new(0, 1, 0));
        local v74 = u5("Part", {
            Name = "indicatorBasePart",
            Size = Vector3.new(1, 1, 1),
            Transparency = 1,
            Anchored = true,
            CanCollide = false,
            Parent = Workspace,
            CFrame = v73
        });
        u59:GiveTask(v74);
        local v75 = u5("Part", {
            Name = "webBasePart",
            Size = Vector3.new(1, 1, 1),
            Transparency = 1,
            Anchored = true,
            CanCollide = false,
            Parent = Workspace,
            CFrame = u72
        });
        u59:GiveTask(v75);
        local v76 = u5("Part", {
            Name = "indicatorPart",
            Size = Vector3.new(1, 1, 1),
            Transparency = 1,
            Anchored = true,
            CanCollide = false,
            Parent = Workspace,
            CFrame = v73
        });
        u59:GiveTask(v76);
        local u77 = u5("Part", {
            Name = "webPart",
            Size = Vector3.new(1, 1, 1),
            Transparency = 1,
            Anchored = true,
            CanCollide = false,
            Parent = Workspace,
            CFrame = u72
        });
        u59:GiveTask(u77);
        local v78 = u5("Attachment", {
            Orientation = Vector3.new(0, 0, 90),
            Parent = v74
        });
        u59:GiveTask(v78);
        local v79 = u5("Attachment", {
            Orientation = Vector3.new(0, 0, 90),
            Parent = v75
        });
        u59:GiveTask(v79);
        local v80 = u5("Attachment", {
            Orientation = Vector3.new(0, 0, 90),
            Parent = v76
        });
        u59:GiveTask(v80);
        local v81 = u5("Attachment", {
            Orientation = Vector3.new(0, 0, 90),
            Parent = u77
        });
        local u82 = u5("Beam", {
            FaceCamera = false,
            Width1 = 0,
            TextureSpeed = 0,
            Parent = v74,
            Attachment0 = v78,
            Attachment1 = v80,
            Color = ColorSequence.new(Color3.fromRGB(255, 100, 100)),
            TextureMode = Enum.TextureMode.Stretch,
            Transparency = NumberSequence.new(0.25)
        });
        u59:GiveTask(u82);
        local u83 = u5("Beam", {
            FaceCamera = false,
            Width1 = 0,
            TextureSpeed = 0,
            Parent = u77,
            Attachment0 = v79,
            Attachment1 = v81,
            Texture = BedwarsImageId.WEB_FLAT,
            TextureMode = Enum.TextureMode.Stretch,
            Transparency = NumberSequence.new(0.25)
        });
        u59:GiveTask(u83);
        TweenService:Create(v76, TweenInfo.new(Halloween2024BossConfigs.WEB_PULL_DELAY, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            CFrame = u71 + Vector3.new(0, 1, 0)
        }):Play();
        TweenService:Create(u82, TweenInfo.new(Halloween2024BossConfigs.WEB_PULL_DELAY, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            Width1 = u67
        }):Play();
        task.delay(Halloween2024BossConfigs.WEB_PULL_DELAY - 1, function() -- Line: 466
            -- upvalues: u57 (copy), u82 (copy), TweenService (ref), u77 (copy), u71 (copy), u83 (copy), u67 (copy)
            u57:fadeBeam(u82, 1, "OUT");
            TweenService:Create(u77, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
                CFrame = u71
            }):Play();
            TweenService:Create(u83, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
                Width1 = u67
            }):Play();
        end);
        task.delay(Halloween2024BossConfigs.WEB_PULL_DELAY, function() -- Line: 477
            -- upvalues: TweenService (ref), u77 (copy), u72 (copy), u83 (copy), u57 (copy), SoundManager (ref), GameSound (ref)
            TweenService:Create(u77, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
                CFrame = u72
            }):Play();
            TweenService:Create(u83, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
                Width1 = 0
            }):Play();
            local v84 = u57:getBossModel();

            if v84 then
                SoundManager:playSound(GameSound.SPIDER_WEB_BLOCK_CREATED, {
                    rollOffMaxDistance = 250,
                    position = v84:GetPivot().Position
                });
            end;
        end);
    end;
end;

function u9.handleWebPull(u85, p86) -- Line: 500
    -- upvalues: u4 (copy), u5 (copy), BedwarsImageId (copy), Players (copy), SoundManager (copy), GameSound (copy), u6 (copy), Halloween2024BossConfigs (copy)
    local u87 = u4.new();
    local v88 = u85:getBossModel();
    local v89;

    if v88 == nil then
        v89 = v88;
    else
        v89 = v88.PrimaryPart;
    end;

    if not (v88 and v89) then
        return nil;
    end;

    for _, v in p86.targets do
        local Character = v.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        if Character then
            local v90 = u5("Attachment", {
                Parent = Character
            });
            u87:GiveTask(v90);
            local v91 = u5("Attachment", {
                Parent = v89
            });
            u87:GiveTask(v91);
            u87:GiveTask((u5("Beam", {
                FaceCamera = true,
                TextureSpeed = 0.5,
                Parent = Character,
                Attachment0 = v90,
                Attachment1 = v91,
                Texture = BedwarsImageId.WEB_FLAT,
                TextureMode = Enum.TextureMode.Stretch,
                Transparency = NumberSequence.new(0)
            })));

            if v == Players.LocalPlayer then
                local localPlayerStunnedSignal = u85.localPlayerStunnedSignal;

                if localPlayerStunnedSignal ~= nil then
                    localPlayerStunnedSignal:Fire(true);
                end;
            end;

            u87:GiveTask(function() -- Line: 545
                -- upvalues: u85 (copy)
                local localPlayerStunnedSignal = u85.localPlayerStunnedSignal;

                if localPlayerStunnedSignal ~= nil then
                    localPlayerStunnedSignal:Fire(false);
                end;
            end);
            SoundManager:playSound(GameSound.BOW_DRAW, {
                rollOffMinDistance = 150,
                rollOffMaxDistance = 300,
                position = Character.Position
            });

            if v ~= Players.LocalPlayer then
                local v92 = u6.createElement("BillboardGui", {
                    StudsOffset = Vector3.new(0, 2, 0),
                    AlwaysOnTop = true,
                    Size = UDim2.fromOffset(100, 100)
                }, { u6.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(1, 1),
                        Image = BedwarsImageId.BOW_ARROW_ICON_SOLID
                    }) });
                local Character2 = v.Character;

                if Character2 ~= nil then
                    Character2 = Character2.PrimaryPart;
                end;

                local u93 = u6.mount(v92, Character2);
                local stunnedMaid = u85.stunnedMaid;

                if stunnedMaid ~= nil then
                    stunnedMaid:GiveTask(function() -- Line: 576
                        -- upvalues: u6 (ref), u93 (copy)
                        u6.unmount(u93);
                    end);
                end;
            end;

            local stunnedPlayersMaid = u85.stunnedPlayersMaid;

            if stunnedPlayersMaid ~= nil then
                stunnedPlayersMaid[v.UserId] = u87;
            end;

            u87:GiveTask(function() -- Line: 586
                -- upvalues: u85 (copy), v (copy)
                local stunnedPlayersMaid2 = u85.stunnedPlayersMaid;

                if stunnedPlayersMaid2 ~= nil then
                    local v94 = stunnedPlayersMaid2[v.UserId];

                    if v94 ~= nil then
                        v94:DoCleaning();
                    end;
                end;

                local stunnedPlayersMaid3 = u85.stunnedPlayersMaid;

                if stunnedPlayersMaid3 ~= nil then
                    stunnedPlayersMaid3[v.UserId] = nil;
                end;
            end);
        end;
    end;

    u87:GiveTask(task.delay(Halloween2024BossConfigs.WEB_PULL_DURATION, function() -- Line: 602
        -- upvalues: u87 (copy)
        u87:DoCleaning();
    end));
end;

function u9.handleWebRelease(p95, p96) -- Line: 606
    local UserId = p96.player.UserId;
    local stunnedPlayersMaid = p95.stunnedPlayersMaid;

    if stunnedPlayersMaid ~= nil then
        local v97 = stunnedPlayersMaid[UserId];

        if v97 ~= nil then
            v97:DoCleaning();
        end;
    end;

    local stunnedPlayersMaid2 = p95.stunnedPlayersMaid;

    if stunnedPlayersMaid2 ~= nil then
        stunnedPlayersMaid2[UserId] = nil;
    end;
end;

function u9.handleWebShoot(p98, p99) -- Line: 620
    -- upvalues: SoundManager (copy), GameSound (copy), Players (copy), default (copy), OutQuint (copy)
    local u100 = p98:getBossModel();

    if not u100 then
        return nil;
    end;

    local u101 = u100:GetPivot();
    SoundManager:playSound(GameSound.SPIDER_WEB_BRIDGE_IMPACT, {
        rollOffMaxDistance = 400,
        volumeMultiplier = 2,
        position = u100:GetPivot().Position
    });
    local v102 = Players:GetPlayerByUserId(p99.targetUserId);

    if v102 ~= nil then
        v102 = v102.Character;

        if v102 ~= nil then
            v102 = v102:GetPivot();
        end;
    end;

    if v102 then
        default(0.5, OutQuint, function(p103) -- Line: 643
            -- upvalues: u100 (copy)
            u100:PivotTo(p103);
        end, u100:GetPivot(), CFrame.new(u100:GetPivot().Position, v102.Position));
    end;

    task.delay(1, function() -- Line: 648
        -- upvalues: default (ref), OutQuint (ref), u100 (copy), u101 (copy)
        default(0.5, OutQuint, function(p104) -- Line: 649
            -- upvalues: u100 (ref)
            u100:PivotTo(p104);
        end, u100:GetPivot(), u101);
    end);
end;

function u9.handleLegSpike(p105, u106) -- Line: 654
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy), Promise (copy), KnitClient (copy), TweenService (copy)
    if not p105:getBossModel() then
        return nil;
    end;

    local function u116(p107) -- Line: 659
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref), u106 (copy), Promise (ref), KnitClient (ref), TweenService (ref)
        local u108 = ReplicatedStorage.Assets.Misc.SpiderQueenSpike:Clone();
        u108.Size = u108.Size * 0.75;
        local u109 = Vector3.FromNormalId(Enum.NormalId.Top) * (u108.Size.Y / 2 - 1);
        local u110 = Vector3.FromNormalId(Enum.NormalId.Bottom) * (u108.Size.Y / 2);
        local u111 = CFrame.new(p107.Position) * CFrame.Angles(0, 0, 3.141592653589793);
        u108.Anchored = true;
        u108:PivotTo(u111 + u110);
        u108.Parent = Workspace;
        local v112 = ReplicatedStorage.Assets.Effects.DustLandEffect:Clone();
        v112:PivotTo(u111);
        v112.Parent = Workspace;
        local v113 = EffectUtil:enableInstanceEffect(v112);
        SoundManager:playSound(GameSound.FALLING_ROCKS, {
            volumeMultiplier = 2,
            rollOffMaxDistance = 150,
            position = u111.Position
        });
        task.wait(u106.spikeDelaySec);
        v113:DoCleaning();
        Promise.defer(function() -- Line: 690
            -- upvalues: SoundManager (ref), GameSound (ref), u111 (ref), KnitClient (ref), TweenService (ref), u108 (copy), u109 (copy), u110 (copy)
            SoundManager:playSound(GameSound.SPIKE_ERUPT, {
                volumeMultiplier = 2,
                rollOffMaxDistance = 150,
                position = u111.Position
            });
            KnitClient.Controllers.ScreenShakeController:shake(u111.Position, u111.Position, {
                magnitude = 2.5
            });
            local v114 = TweenService:Create(u108, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false), {
                CFrame = u111 + u109
            });
            v114:Play();
            v114.Completed:Wait();
            task.wait(0.7);
            local v115 = TweenService:Create(u108, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false), {
                CFrame = u111 + u110
            });
            v115:Play();
            v115.Completed:Wait();
            u108:Destroy();
        end);
    end;

    local function _(p117) -- Line: 714
        -- upvalues: u116 (copy)
        u116(p117);
    end;

    for i, v in u106.spawns do
        local _ = i - 1;
        u116(v);
    end;
end;

function u9.handleRelocation(p118, p119) -- Line: 721
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy), u4 (copy), TweenService (copy), Halloween2024BossConfigs (copy), Workspace (copy), u5 (copy), BedwarsImageId (copy), SoundManager (copy), GameSound (copy), KnitClient2 (copy), ReplicatedStorage (copy), EffectUtil (copy)
    local u120 = p118:getBossModel();

    if not u120 then
        return nil;
    end;

    local v121 = u120:FindFirstChildWhichIsA("Humanoid");
    local u122;

    if v121 == nil then
        u122 = v121;
    else
        u122 = v121:FindFirstChildWhichIsA("Animator");
    end;

    if not (v121 and u122) then
        return nil;
    end;

    if not u120.PrimaryPart then
        return nil;
    end;

    GameAnimationUtil:playAnimation(u122, AnimationType.SPIDER_QUEEN_WEB_CAST_SKY, {
        looped = false
    });
    local u123 = u4.new();
    local u124 = {};
    local v125 = u120:GetDescendants();

    local function v127(p126) -- Line: 745
        -- upvalues: u124 (copy), TweenService (ref), Halloween2024BossConfigs (ref)
        if p126:IsA("BasePart") then
            u124[p126] = p126.Transparency;
            TweenService:Create(p126, TweenInfo.new(Halloween2024BossConfigs.RELOCATE_ASCEND_DURATION), {
                Transparency = 1
            }):Play();
        end;
    end;

    for i, v in v125 do
        v127(v, i - 1, v125);
    end;

    local RightGripAttachment = u120:FindFirstChild("RightGripAttachment", true);

    if RightGripAttachment then
        local v128 = u5("Part", {
            Name = "WebPart",
            Anchored = true,
            Size = Vector3.new(1, 1, 1),
            Parent = Workspace,
            CFrame = u120:GetPivot() + Vector3.new(0, Halloween2024BossConfigs.RELOCATE_Y_HEIGHT_OFFSET, 0),
            CanCollide = false,
            Transparency = 1
        });
        u123:GiveTask(v128);
        local v129 = u5("Attachment", {
            Parent = v128
        });
        u123:GiveTask(v129);
        local v130 = u5("Beam", {
            FaceCamera = true,
            TextureSpeed = 0.5,
            Parent = v128,
            Attachment0 = v129,
            Attachment1 = RightGripAttachment,
            Texture = BedwarsImageId.WEB_FLAT,
            TextureMode = Enum.TextureMode.Stretch,
            Transparency = NumberSequence.new(0)
        });
        u123:GiveTask(v130);
        p118:fadeBeam(v130, Halloween2024BossConfigs.RELOCATE_ASCEND_DURATION, "OUT");
    end;

    SoundManager:playSound(GameSound.SPIDER_WEB_BLOCK_CREATED, {
        rollOffMinDistance = 150,
        rollOffMaxDistance = 300,
        position = u120:GetPivot().Position
    });
    local RELOCATE_STOMP_DAMAGE_RADIUS = Halloween2024BossConfigs.RELOCATE_STOMP_DAMAGE_RADIUS;
    local u131 = u5("Part", {
        CFrame = CFrame.new(p119.position + Vector3.new(0, 0.375, 0)) * CFrame.Angles(0, 0, 1.5707963267948966),
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        Shape = Enum.PartType.Cylinder,
        Size = Vector3.new(0.75, RELOCATE_STOMP_DAMAGE_RADIUS * 2, RELOCATE_STOMP_DAMAGE_RADIUS * 2),
        Material = Enum.Material.ForceField,
        Transparency = 0.2,
        Color = Color3.fromRGB(255, 41, 0),
        Parent = Workspace
    });
    u123:GiveTask(u131);
    local u132 = u131:Clone();
    u132.Material = Enum.Material.Neon;
    u132.Size = Vector3.new(0.6, 0, 0);
    u132.Transparency = 0.6;
    u132.Parent = Workspace;
    u123:GiveTask(u132);
    TweenService:Create(u132, TweenInfo.new(Halloween2024BossConfigs.RELOCATE_ASCEND_DURATION + Halloween2024BossConfigs.RELOCATE_STOMP_DELAY), {
        Size = u131.Size
    }):Play();
    task.delay(Halloween2024BossConfigs.RELOCATE_ASCEND_DURATION + Halloween2024BossConfigs.RELOCATE_STOMP_DELAY - 1, function() -- Line: 828
        -- upvalues: TweenService (ref), Halloween2024BossConfigs (ref), u124 (copy), GameAnimationUtil (ref), u122 (copy), AnimationType (ref), u132 (copy), u131 (copy), u120 (copy), SoundManager (ref), GameSound (ref), KnitClient2 (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), u123 (copy)
        local function v135(p133, p134) -- Line: 829
            -- upvalues: TweenService (ref), Halloween2024BossConfigs (ref)
            TweenService:Create(p134, TweenInfo.new(Halloween2024BossConfigs.RELOCATE_STOMP_DELAY, Enum.EasingStyle.Exponential), {
                Transparency = p133
            }):Play();
        end;

        for i, v in u124 do
            v135(v, i, u124);
        end;

        GameAnimationUtil:playAnimation(u122, AnimationType.SPIDER_QUEEN_LANDING, {
            looped = false
        });
        task.delay(Halloween2024BossConfigs.RELOCATE_STOMP_DELAY, function() -- Line: 841
            -- upvalues: TweenService (ref), u132 (ref), u131 (ref)
            TweenService:Create(u132, TweenInfo.new(1, Enum.EasingStyle.Exponential), {
                Transparency = 1
            }):Play();
            TweenService:Create(u131, TweenInfo.new(1, Enum.EasingStyle.Exponential), {
                Transparency = 1
            }):Play();
        end);
        task.delay(1, function() -- Line: 849
            -- upvalues: u120 (ref), SoundManager (ref), GameSound (ref), KnitClient2 (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), u123 (ref)
            local Position = u120:GetPivot().Position;
            SoundManager:playSound(GameSound.SPIKE_ERUPT, {
                rollOffMinDistance = 150,
                rollOffMaxDistance = 300,
                position = Position
            });
            KnitClient2.Controllers.ScreenShakeController:shake(Position, Vector3.new(0, -1, 0), {
                zMagnitude = 2,
                magnitude = 2,
                cycles = 3,
                duration = 0.18
            });
            local v136 = ReplicatedStorage.Assets.Effects.Explosion:Clone();
            local v137 = select(2, u120:GetBoundingBox()).Y / 2;
            local v138 = Vector3.new(0, v137, 0);
            v136:PivotTo(CFrame.new(Position - v138));
            v136.Parent = Workspace;
            EffectUtil:playEffects(v136:GetChildren(), nil, {
                destroyAfterSec = 1,
                sizeMultiplier = 3
            });
            u123:DoCleaning();
        end);
    end);
end;

function u9.handleSlice(p139, p140) -- Line: 875
    -- upvalues: Players (copy), default (copy), OutQuint (copy), ReplicatedStorage (copy), WeldUtil (copy), OutCubic (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), default2 (copy)
    local u141 = p139:getBossModel();

    if not u141 then
        return nil;
    end;

    local u142 = u141:GetPivot();
    local v143 = Players:GetPlayerByUserId(p140.targetUserId);

    if v143 ~= nil then
        v143 = v143.Character;

        if v143 ~= nil then
            v143 = v143:GetPivot();
        end;
    end;

    if v143 then
        default(0.5, OutQuint, function(p144) -- Line: 892
            -- upvalues: u141 (copy)
            u141:PivotTo(p144);
        end, u141:GetPivot(), CFrame.new(u141:GetPivot().Position, v143.Position));
    end;

    task.delay(0.5, function() -- Line: 896
        -- upvalues: ReplicatedStorage (ref), u141 (copy), WeldUtil (ref), default (ref), OutCubic (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), Players (ref), default2 (ref), OutQuint (ref), u142 (copy)
        local u145 = ReplicatedStorage.Assets.Misc.SpiderQueenSlice:Clone();
        u145.Handle.Size = u145.Handle.Size * 5.5;
        local Humanoid = u141:FindFirstChild("Humanoid");

        if Humanoid then
            Humanoid:AddAccessory(u145);
        end;

        WeldUtil:weldCharacterAccessories(u141);
        default(0.6, OutCubic, function(u146) -- Line: 905
            -- upvalues: u145 (copy)
            local function _(p147) -- Line: 907
                -- upvalues: u146 (copy)
                if p147:IsA("BasePart") then
                    p147.Transparency = u146;

                    return;
                end;

                if p147:IsA("Decal") then
                    p147.Transparency = u146;
                end;
            end;

            for i, descendant in u145:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    descendant.Transparency = u146;
                elseif descendant:IsA("Decal") then
                    descendant.Transparency = u146;
                end;
            end;
        end, 1, 0);
        local v148 = GameAnimationUtil:playAnimation(u141:WaitForChild("Humanoid"):WaitForChild("Animator"), AnimationType.SPIDER_BOSS_SPIN, {
            speed = 0.7
        });
        local SCYTHE_SPIN_1 = GameSound.SCYTHE_SPIN_1;
        local v149 = {};
        local v150 = u141:FindFirstChildWhichIsA("BasePart");

        if v150 ~= nil then
            v150 = v150.Position;
        end;

        v149.position = v150;
        v149.volumeMultiplier = 3;
        v149.rollOffMaxDistance = 400;
        v149.rollOffMinDistance = 60;
        v149.looped = false;
        SoundManager:playSound(SCYTHE_SPIN_1, v149);
        local u151 = false;
        local u153 = u145.Handle.Touched:Connect(function(p152) -- Line: 937
            -- upvalues: Players (ref), u151 (ref), default2 (ref)
            if Players.LocalPlayer.Character and p152:IsDescendantOf(Players.LocalPlayer.Character) then
                if u151 then
                    return nil;
                end;

                u151 = true;
                default2.Client:Get("HitSpiderSword"):SendToServer();
            end;
        end);
        local u154 = nil;

        if v148 ~= nil then
            v148 = v148.Stopped:Once(function() -- Line: 950
                -- upvalues: u153 (copy), u154 (ref), default (ref), OutCubic (ref), u145 (copy), OutQuint (ref), u141 (ref), u142 (ref)
                u153:Disconnect();
                local v155 = u154;

                if v155 ~= nil then
                    v155:Disconnect();
                end;

                default(0.6, OutCubic, function(u156) -- Line: 957
                    -- upvalues: u145 (ref)
                    local function _(p157) -- Line: 959
                        -- upvalues: u156 (copy)
                        if p157:IsA("BasePart") then
                            p157.Transparency = u156;

                            return;
                        end;

                        if p157:IsA("Decal") then
                            p157.Transparency = u156;
                        end;
                    end;

                    for i, descendant in u145:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("BasePart") then
                            descendant.Transparency = u156;
                        elseif descendant:IsA("Decal") then
                            descendant.Transparency = u156;
                        end;
                    end;
                end, 0, 1);
                default(0.5, OutQuint, function(p158) -- Line: 971
                    -- upvalues: u141 (ref)
                    u141:PivotTo(p158);
                end, u141:GetPivot(), u142);
                task.delay(0.8, function() -- Line: 974
                    -- upvalues: u145 (ref)
                    u145:Destroy();
                end);
            end);
        end;
    end);
end;

function u9.fadeOutBoss(p159) -- Line: 982
    -- upvalues: TweenService (copy), Halloween2024BossConfigs (copy)
    local v160 = p159:getBossModel();

    if not v160 then
        return nil;
    end;

    local u161 = {};
    local v162 = v160:GetDescendants();

    local function v164(p163) -- Line: 989
        -- upvalues: u161 (copy), TweenService (ref), Halloween2024BossConfigs (ref)
        if p163:IsA("BasePart") then
            u161[p163] = p163.Transparency;
            TweenService:Create(p163, TweenInfo.new(Halloween2024BossConfigs.RELOCATE_ASCEND_DURATION), {
                Transparency = 1
            }):Play();
        end;
    end;

    for i, v in v162 do
        v164(v, i - 1, v162);
    end;

    return function() -- Line: 1003
        -- upvalues: TweenService (ref), Halloween2024BossConfigs (ref), u161 (copy)
        local function v167(p165, p166) -- Line: 1004
            -- upvalues: TweenService (ref), Halloween2024BossConfigs (ref)
            TweenService:Create(p166, TweenInfo.new(Halloween2024BossConfigs.RELOCATE_STOMP_DELAY, Enum.EasingStyle.Exponential), {
                Transparency = p165
            }):Play();
        end;

        for i, v in u161 do
            v167(v, i, u161);
        end;
    end;
end;

function u9.handleVoidGame(p168, p169) -- Line: 1015
    -- upvalues: Halloween2024BossConfigs (copy), GameAnimationUtil (copy), AnimationType (copy), TweenService (copy), CollectionService (copy), SoundManager (copy), GameSound (copy), default (copy), OutExpo (copy)
    local u170 = p168:getBossModel();

    if not u170 then
        return nil;
    end;

    local Animator = u170:WaitForChild("Humanoid"):WaitForChild("Animator");
    local FOG_RAISE_DURATION = Halloween2024BossConfigs.FOG_RAISE_DURATION;
    local FOG_RAISED_HOLD_DURATION = Halloween2024BossConfigs.FOG_RAISED_HOLD_DURATION;
    local FOG_LOWER_DURATION = Halloween2024BossConfigs.FOG_LOWER_DURATION;
    local u171 = p168:fadeOutBoss();
    GameAnimationUtil:playAnimation(Animator, AnimationType.SPIDER_QUEEN_WEB_CAST_SKY, {
        looped = false
    });
    local u172 = u170:GetPivot();
    TweenService:Create(u170.PrimaryPart, TweenInfo.new(Halloween2024BossConfigs.RELOCATE_ASCEND_DURATION, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
        CFrame = u172 + Vector3.new(0, Halloween2024BossConfigs.RELOCATE_Y_HEIGHT_OFFSET, 0)
    }):Play();
    local u173 = {};
    local v174 = CollectionService:GetTagged("WebPlatform");

    local function v178(u175) -- Line: 1042
        -- upvalues: u173 (copy), Halloween2024BossConfigs (ref), SoundManager (ref), GameSound (ref), default (ref), OutExpo (ref)
        if not u175:IsA("Model") then
            return nil;
        end;

        table.insert(u173, u175);
        local Position = u175:GetPivot().Position;
        local v176 = u175:GetPivot().Position - Vector3.new(0, Halloween2024BossConfigs.FOG_PLATFORM_START_HEIGHT - 3, 0);
        SoundManager:playSound(GameSound.SPIDER_WEB_BLOCK_CREATED, {
            rollOffMaxDistance = 400,
            volumeMultiplier = 5,
            position = v176
        });
        default(2, OutExpo, function(p177) -- Line: 1058
            -- upvalues: u175 (copy)
            u175:PivotTo(CFrame.new(p177));
        end, Position, v176);
    end;

    for i, v in v174 do
        v178(v, i - 1, v174);
    end;

    task.delay(FOG_RAISE_DURATION + FOG_RAISED_HOLD_DURATION + FOG_LOWER_DURATION, function() -- Line: 1066
        -- upvalues: SoundManager (ref), GameSound (ref), default (ref), OutExpo (ref), u173 (copy), u170 (copy), u172 (copy), u171 (copy), GameAnimationUtil (ref), Animator (copy), AnimationType (ref)
        local function v182(u179) -- Line: 1067
            -- upvalues: SoundManager (ref), GameSound (ref), default (ref), OutExpo (ref)
            local v180 = u179:GetPivot();
            SoundManager:playSound(GameSound.SPIDER_WEB_BLOCK_CREATED, {
                rollOffMaxDistance = 400,
                volumeMultiplier = 5,
                position = v180.Position
            });
            default(1, OutExpo, function(p181) -- Line: 1075
                -- upvalues: u179 (copy)
                u179:PivotTo(p181);
            end, v180, v180 + Vector3.new(0, 60, 0));
            task.delay(1.1, function() -- Line: 1080
                -- upvalues: u179 (copy)
                u179:Destroy();
            end);
        end;

        for i, v in u173 do
            v182(v, i - 1, u173);
        end;

        u170:PivotTo(u172);
        local v183 = u171;

        if v183 ~= nil then
            v183();
        end;

        GameAnimationUtil:playAnimation(Animator, AnimationType.SPIDER_QUEEN_LANDING, {
            looped = false
        });
        task.delay(0.45, function() -- Line: 1096
            -- upvalues: SoundManager (ref), GameSound (ref), u170 (ref)
            local BLOCK_KICKER_KIT_STOMP = GameSound.BLOCK_KICKER_KIT_STOMP;
            local v184 = {};
            local v185 = u170:FindFirstChildWhichIsA("BasePart");

            if v185 ~= nil then
                v185 = v185.Position;
            end;

            v184.position = v185;
            v184.volumeMultiplier = 3;
            v184.rollOffMaxDistance = 400;
            v184.rollOffMinDistance = 60;
            v184.looped = false;
            SoundManager:playSound(BLOCK_KICKER_KIT_STOMP, v184);
        end);
    end);
end;

function u9.routeBossAction(p186, p187, p188) -- Line: 1114
    -- upvalues: Halloween2024BossAction (copy)
    if p187 == Halloween2024BossAction.WEB_PULL then
        p186:handleWebPull(p188);

        return;
    end;

    if p187 == Halloween2024BossAction.WEB_DEPLOY then
        p186:handleWebDeploy(p188);

        return;
    end;

    if p187 == Halloween2024BossAction.WEB_SHOOT then
        p186:handleWebShoot(p188);

        return;
    end;

    if p187 == Halloween2024BossAction.WEB_RELEASE then
        p186:handleWebRelease(p188);

        return;
    end;

    if p187 == Halloween2024BossAction.LEG_SPIKE then
        p186:handleLegSpike(p188);

        return;
    end;

    if p187 == Halloween2024BossAction.RELOCATE then
        p186:handleRelocation(p188);

        return;
    end;

    if p187 == Halloween2024BossAction.SLICE then
        p186:handleSlice(p188);

        return;
    end;

    if p187 == Halloween2024BossAction.VOID_GAME then
        p186:handleVoidGame(p188);

        return;
    end;

    if p187 ~= Halloween2024BossAction.SLASH then
        return;
    end;

    p186:handleSlash(p188);
end;

function u9.disableLocalPlayerActions(p189) -- Line: 1154
    -- upvalues: u4 (copy), ClientSyncEvents (copy)
    local v190 = u4.new();
    v190:GiveTask(ClientSyncEvents.SwordSwing:connect(function(p191) -- Line: 1156
        p191:setCancelled(true);
    end));
    v190:GiveTask(ClientSyncEvents.StartLaunchProjectile:connect(function(p192) -- Line: 1159
        p192:setCancelled(true);
    end));
    v190:GiveTask(ClientSyncEvents.BeginProjectileTargeting:connect(function(p193) -- Line: 1162
        p193:setCancelled(true);
    end));
    v190:GiveTask(ClientSyncEvents.StartConsuming:connect(function(p194) -- Line: 1165
        p194:setCancelled(true);
    end));

    return v190;
end;

function u9.fadeBeam(p195, u196, u197, u198) -- Line: 1170
    -- upvalues: u4 (copy), RunService (copy)
    local u199 = u4.new();
    local u200 = 0;
    u199:GiveTask(RunService.Heartbeat:Connect(function(p201) -- Line: 1173
        -- upvalues: u200 (ref), u197 (copy), u199 (copy), u198 (copy), u196 (copy)
        u200 = u200 + p201;

        if u197 <= u200 then
            u199:DoCleaning();

            return nil;
        end;

        local v202;

        if u198 == "IN" then
            v202 = 1 - u200 / u197;
        else
            v202 = u200 / u197;
        end;

        u196.Transparency = NumberSequence.new(v202);
    end));
end;

function u9.getBossModel(p203) -- Line: 1183
    -- upvalues: CollectionService (copy)
    local v204 = CollectionService:GetTagged("SpiderBoss");

    if #v204 == 0 then
        return nil;
    end;

    return v204[1];
end;

function u9.handleSlash(p205, p206) -- Line: 1190
    -- upvalues: ReplicatedStorage (copy), WeldUtil (copy), GameAnimationUtil (copy), AnimationType (copy), Workspace (copy), default (copy), InQuad (copy), scaleModel (copy), SoundManager (copy), GameSound (copy)
    print("SLASH!");
    local v207 = p205:getBossModel();

    if not v207 then
        return nil;
    end;

    local u208 = ReplicatedStorage.Assets.Misc.LongSpiderQueenSlice:Clone();
    task.delay(5, function() -- Line: 1198
        -- upvalues: u208 (copy)
        local v209 = u208;

        if v209 ~= nil then
            v209:Destroy();
        end;
    end);
    local Humanoid = v207:FindFirstChild("Humanoid");

    if Humanoid then
        Humanoid:AddAccessory(u208);
    end;

    WeldUtil:weldCharacterAccessories(v207);
    local u210;

    if Humanoid == nil then
        u210 = Humanoid;
    else
        u210 = Humanoid:FindFirstChildWhichIsA("Animator");
    end;

    if not (Humanoid and u210) then
        return nil;
    end;

    local PrimaryPart = v207.PrimaryPart;

    if not PrimaryPart then
        return nil;
    end;

    local v211 = GameAnimationUtil:playAnimation(u210, AnimationType.HEAVENLY_SWORD_CHARGE, {
        looped = false
    });
    v211 = v211;
    local v212;

    if v211 ~= nil then
        v212 = v211.Length;
    end;

    print(v212);
    v211 = v211;
    local v213;

    if v211 then
        v211 = v211;
        local v214;

        if v211 == nil then
            v214 = v211;
        else
            v214 = v211.Length;
        end;

        v213 = v214 > 0;
    end;

    if v213 then
        local v215 = v211;

        if v215 ~= nil then
            v215:AdjustSpeed(v211.Length / 3);
        end;

        task.wait(2.5);
        local u216 = GameAnimationUtil:playAnimation(u210, AnimationType.SWORD_SWING_1, {
            looped = false
        });
        local u217 = ReplicatedStorage.Assets.Effects.SpiderQueenSlashWave:Clone();
        u217.Parent = Workspace;
        local CFrame2 = PrimaryPart.CFrame;
        local v218 = CFrame.Angles(0, 0, 0.7853981633974483);
        u217:PivotTo((CFrame2 - Vector3.new(5, 0, 5)) * v218);
        local CFrame3 = PrimaryPart.CFrame;
        local v219 = PrimaryPart.CFrame.LookVector * 200;
        local v220 = CFrame.Angles(0, 0, 0.7853981633974483);
        default(0.2, InQuad, function(p221) -- Line: 1258
            -- upvalues: u217 (copy), scaleModel (ref)
            u217:PivotTo(p221);
            scaleModel(u217, 1.05);
        end, u217.PrimaryPart.CFrame, (CFrame3 + v219 - Vector3.new(90, 0, 90)) * v220);
        task.delay(0.2, function() -- Line: 1262
            -- upvalues: u217 (copy)
            u217:Destroy();
        end);
        SoundManager:playSound(GameSound.LIGHT_SWORD_ATTACK, {
            position = nil,
            rollOffMaxDistance = 220
        });
        local v222 = u216;

        if v222 ~= nil then
            v222:AdjustSpeed(0.5);
        end;

        task.delay(1.35, function() -- Line: 1273
            -- upvalues: ReplicatedStorage (ref), Workspace (ref), PrimaryPart (copy), default (ref), InQuad (ref), scaleModel (ref), SoundManager (ref), GameSound (ref), u216 (ref), GameAnimationUtil (ref), u210 (copy), AnimationType (ref)
            local u223 = ReplicatedStorage.Assets.Effects.SpiderQueenSlashWave:Clone();
            u223.Parent = Workspace;
            local CFrame4 = PrimaryPart.CFrame;
            local v224 = CFrame.Angles(0, 0, -0.7853981633974483);
            u223:PivotTo((CFrame4 + Vector3.new(5, 0, 5)) * v224);
            local CFrame5 = PrimaryPart.CFrame;
            local v225 = PrimaryPart.CFrame.LookVector * 200;
            local v226 = CFrame.Angles(0, 0, -0.7853981633974483);
            default(0.2, InQuad, function(p227) -- Line: 1286
                -- upvalues: u223 (copy), scaleModel (ref)
                u223:PivotTo(p227);
                scaleModel(u223, 1.05);
            end, u223.PrimaryPart.CFrame, (CFrame5 + v225 + Vector3.new(90, 0, 90)) * v226);
            task.delay(0.2, function() -- Line: 1290
                -- upvalues: u223 (copy)
                u223:Destroy();
            end);
            SoundManager:playSound(GameSound.INFERNAL_SWORD_ATTACK, {
                position = nil,
                rollOffMaxDistance = 220
            });
            u216 = GameAnimationUtil:playAnimation(u210, AnimationType.SWORD_SWING_2, {
                looped = false
            });
            local v228 = u216;

            if v228 ~= nil then
                v228:AdjustSpeed(0.6);
            end;
        end);
    end;
end;

KnitClient.CreateController(u9.new());

return nil;