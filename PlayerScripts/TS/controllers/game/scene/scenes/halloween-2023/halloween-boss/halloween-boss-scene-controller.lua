-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local ViewmodelMode = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "viewmodel", "viewmodel-mode").ViewmodelMode;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local MonsterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SceneKey = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseSceneController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "base-scene-controller").BaseSceneController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "HalloweenBossSceneController";
    end,

    __index = BaseSceneController
});
u4.__index = u4;

function u4.new(...) -- Line: 35
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 39
    -- upvalues: BaseSceneController (copy), SceneKey (copy), u2 (copy)
    BaseSceneController.constructor(p6, SceneKey.HALLOWEEN_BOSS);
    p6.Name = "HalloweenBossSceneController";
    p6.sceneLightingMaid = u2.new();
    p6.sceneLightingModifiers = {};
    p6.musicTracks = {};
    p6.cryptBossSetup = false;
end;

function u4.KnitStart(p7) -- Line: 47
    -- upvalues: BaseSceneController (copy)
    BaseSceneController.KnitStart(p7);
end;

function u4.onSceneLoadingScreenStart(p8) -- Line: 50
    -- upvalues: KnitClient (copy), AnimationType (copy), GameSound (copy)
    KnitClient.Controllers.PreloadController:runPreload({
        animations = {
            AnimationType.HALLOWEEN_BOSS_SPAWN,
            AnimationType.HALLOWEEN_BOSS_IDLE,
            AnimationType.HALLOWEEN_BOSS_DEATH,
            AnimationType.WARLOCK_ENTER_SCENE,
            AnimationType.WARLOCK_CHARGE_UP,
            AnimationType.WARLOCK_FORWARD_CAST,
            AnimationType.WARLOCK_IDLE
        },
        sounds = {
            GameSound.DARK_BOLT_SHOOT,
            GameSound.MAGIC_CIRCLE_SPAWN,
            GameSound.MAGIC_CIRCLE_FLAME_ERUPT,
            GameSound.DEATH_FINAL,
            GameSound.WEREWOLF_HEARTBEAT,
            GameSound.NEW_EMERALD_PICKUP,
            GameSound.EMERALD_GENERATOR_AURA,
            GameSound.GHOST_VACUUM_CATCH,
            GameSound.HALLOWEEN_BOSS_SPAWN
        }
    });
end;

function u4.onSceneStart(u9) -- Line: 56
    -- upvalues: EntityDamageEventZap (copy), MonsterType (copy), default (copy), Workspace (copy), CollectionService (copy), SoundManager (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy), ReplicatedStorage (copy), KnitClient (copy), ViewmodelMode (copy), WatchCollectionTag (copy), EntityUtil (copy), ColorUtil (copy)
    local u10 = nil;
    EntityDamageEventZap.On(function(p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24) -- Line: 58
        -- upvalues: u10 (ref), MonsterType (ref)
        local v25 = u10;

        if v25 then
            local v26 = u10;

            if v26 ~= nil then
                v26 = v26.Name;
            end;

            v25 = v26 == p11.Name;
        end;

        if v25 then
            return nil;
        end;

        if p11:GetAttribute("MonsterType") ~= MonsterType.HALLOWEEN_BOSS then
            return nil;
        end;

        u10 = p11:Clone();
    end);
    default.Client:Get("EntityDeathEvent"):Connect(function(p27) -- Line: 76
        -- upvalues: MonsterType (ref), u10 (ref), Workspace (ref), CollectionService (ref), SoundManager (ref), GameSound (ref), GameAnimationUtil (ref), AnimationType (ref), ReplicatedStorage (ref)
        if p27.entityInstance:GetAttribute("MonsterType") ~= MonsterType.HALLOWEEN_BOSS then
            return nil;
        end;

        if not u10 then
            return nil;
        end;

        u10.Parent = Workspace;
        local u28 = u10:GetPrimaryPartCFrame();
        local entityInstance = p27.entityInstance;
        local u29 = CollectionService:HasTag(entityInstance, "WarlockBoss");

        if CollectionService:HasTag(entityInstance, "CryptBoss") then
            SoundManager:playSound(GameSound.DEATH_FINAL, {
                volumeMultiplier = 5
            });
            local u30 = SoundManager:playSound(GameSound.WEREWOLF_HEARTBEAT, {
                volumeMultiplier = 5,
                looped = true
            });
            task.delay(5, function() -- Line: 97
                -- upvalues: u30 (copy)
                local v31 = u30;

                if v31 ~= nil then
                    v31:Destroy();
                end;
            end);
        end;

        local Humanoid = u10:FindFirstChild("Humanoid");

        if Humanoid ~= nil then
            Humanoid = Humanoid:FindFirstChild("Animator");
        end;

        if Humanoid then
            GameAnimationUtil:playAnimation(Humanoid, AnimationType.HALLOWEEN_BOSS_IDLE, {
                fadeInTime = 0.02
            });
            local v32 = GameAnimationUtil:playAnimation(Humanoid, AnimationType.HALLOWEEN_BOSS_DEATH);

            if v32 ~= nil then
                v32.Stopped:Connect(function() -- Line: 116
                    -- upvalues: u10 (ref), u29 (copy), ReplicatedStorage (ref), u28 (copy), Workspace (ref), SoundManager (ref), GameSound (ref)
                    local v33 = u10;

                    if v33 ~= nil then
                        v33:Destroy();
                    end;

                    if u29 then
                        local v34 = ReplicatedStorage.Assets.Misc.CryptRewards:GetChildren();
                        local v35 = 0;
                        local v36 = 0;

                        for _, v in v34 do
                            if v:IsA("BasePart") then
                                local v37 = v:Clone();
                                v37.Position = u28.Position;
                                v37.Parent = Workspace;
                                local v38 = math.cos(v35) * 55;
                                local v39 = math.sin(v35) * 55;
                                v37.Velocity = Vector3.new(v38, 55, v39);
                                v35 = v35 + 6.283185307179586 / #v34;
                                SoundManager:playSound(GameSound.NEW_EMERALD_PICKUP, {
                                    playbackSpeedMultiplier = 1.1 - v36 * 0.1
                                });
                                v36 = v36 + 1;
                                SoundManager:playSound(GameSound.EMERALD_GENERATOR_AURA, {
                                    rollOffMaxDistance = 120,
                                    rollOffMinDistance = 30,
                                    volumeMultiplier = 1.5,
                                    parent = v37
                                });
                                task.wait(0.15);
                            end;
                        end;

                        task.wait(0.1);
                        SoundManager:playSound(GameSound.GHOST_VACUUM_CATCH, {
                            playbackSpeedMultiplier = 1.1 - v36 * 0.1
                        });
                        local v40 = ReplicatedStorage.Assets.Misc.CryptRewards:FindFirstChildWhichIsA("Model"):Clone();
                        v40.Parent = Workspace;
                        v40:PivotTo(u28);
                        v40.PrimaryPart.Velocity = Vector3.new(0, 55, 0);
                    end;
                end);
            end;
        end;
    end);
    KnitClient.Controllers.ViewmodelController:setViewModelMode(ViewmodelMode.SHOW_ARMS);
    local v41 = SoundManager:playModifiableSound(GameSound.HALLOWEEN_BOSS_AMBIENT_LOOP, {
        fadeInTime = 10,
        looped = true,
        volumeMultiplier = 0.7
    });

    if v41 then
        table.insert(u9.musicTracks, v41);
    end;

    task.delay(10, function() -- Line: 169
        -- upvalues: SoundManager (ref), GameSound (ref), u9 (copy)
        local v42 = SoundManager:playModifiableSound(GameSound.HALLOWEEN_2022_BOSS_MUSIC, {
            fadeInTime = 6,
            looped = true
        });

        if v42 then
            table.insert(u9.musicTracks, v42);
        end;
    end);
    u9:setupSceneLighting();
    WatchCollectionTag("CryptBoss", function(u43) -- Line: 179
        -- upvalues: u9 (copy), EntityUtil (ref), KnitClient (ref), ColorUtil (ref), SoundManager (ref), GameSound (ref), GameAnimationUtil (ref), AnimationType (ref)
        if u9.cryptBossSetup then
            return nil;
        end;

        u9.cryptBossSetup = true;
        task.delay(1.5, function() -- Line: 184
            -- upvalues: EntityUtil (ref), u43 (copy), KnitClient (ref), ColorUtil (ref)
            local v44 = EntityUtil:getEntity(u43);

            if v44 then
                KnitClient.Controllers.BossBarController:mountEntityBossBar(v44, {
                    DisplayName = "CRYPT",
                    Gradient = ColorSequence.new(ColorUtil.hexColor(62207), ColorUtil.hexColor(4456334))
                });
            end;
        end);
        local HALLOWEEN_BOSS_SPAWN = GameSound.HALLOWEEN_BOSS_SPAWN;
        local v45 = {};
        local v46 = u43:FindFirstChildWhichIsA("BasePart");

        if v46 ~= nil then
            v46 = v46.Position;
        end;

        v45.position = v46;
        v45.rollOffMaxDistance = 400;
        v45.rollOffMinDistance = 60;
        SoundManager:playSound(HALLOWEEN_BOSS_SPAWN, v45);
        local Animator = u43:WaitForChild("Humanoid"):WaitForChild("Animator");
        local v47 = GameAnimationUtil:playAnimation(Animator, AnimationType.HALLOWEEN_BOSS_IDLE, {
            looped = true
        });

        if v47 then
            v47.Priority = Enum.AnimationPriority.Idle;
        end;

        GameAnimationUtil:playAnimation(Animator, AnimationType.HALLOWEEN_BOSS_SPAWN);
        u43.Destroying:Once(function() -- Line: 213
            -- upvalues: KnitClient (ref)
            KnitClient.Controllers.BossBarController:unmountBar();
        end);
    end);
    WatchCollectionTag("WarlockBoss", function(u48) -- Line: 217
        -- upvalues: EntityUtil (ref), KnitClient (ref), ColorUtil (ref), SoundManager (ref), GameSound (ref), GameAnimationUtil (ref), AnimationType (ref)
        task.delay(1.5, function() -- Line: 218
            -- upvalues: EntityUtil (ref), u48 (copy), KnitClient (ref), ColorUtil (ref)
            local v49 = EntityUtil:getEntity(u48);

            if v49 then
                KnitClient.Controllers.BossBarController:mountEntityBossBar(v49, {
                    DisplayName = "ELDRIC",
                    Gradient = ColorSequence.new(ColorUtil.hexColor(62207), ColorUtil.hexColor(4456334))
                });
            end;
        end);
        local HALLOWEEN_BOSS_SPAWN = GameSound.HALLOWEEN_BOSS_SPAWN;
        local v50 = {};
        local v51 = u48:FindFirstChildWhichIsA("BasePart");

        if v51 ~= nil then
            v51 = v51.Position;
        end;

        v50.position = v51;
        v50.rollOffMaxDistance = 400;
        v50.rollOffMinDistance = 60;
        SoundManager:playSound(HALLOWEEN_BOSS_SPAWN, v50);
        local Animator = u48:WaitForChild("Humanoid"):WaitForChild("Animator");
        local v52 = GameAnimationUtil:playAnimation(Animator, AnimationType.WARLOCK_IDLE, {
            looped = true
        });

        if v52 then
            v52.Priority = Enum.AnimationPriority.Idle;
        end;

        GameAnimationUtil:playAnimation(Animator, AnimationType.WARLOCK_ENTER_SCENE);
    end);
end;

function u4.onSceneShutdown(p53) -- Line: 249
    p53.sceneLightingMaid:DoCleaning();
end;

function u4.setupSceneLighting(u54) -- Line: 252
    -- upvalues: KnitClient (copy)
    u54.sceneLightingModifiers = {
        KnitClient.Controllers.LightingController.lightingModifier:addModifier(20, {
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
        }),
        KnitClient.Controllers.LightingController.atmosphereModifier:addModifier(20, {
            Density = 0.365,
            Offset = 0.284,
            Glare = 5.85,
            Haze = 0.75,
            Color = Color3.fromRGB(141, 141, 199),
            Decay = Color3.fromRGB(76, 82, 136)
        }),
        KnitClient.Controllers.LightingController.skyModifier:addModifier(
            20,
            {
                CelestialBodiesShown = true,
                MoonAngularSize = 11,
                MoonTextureId = "rbxasset://sky/moon.jpg",
                SkyboxBk = "rbxassetid://10290026331",
                SkyboxDn = "rbxassetid://10290026184",
                SkyboxFt = "rbxassetid://10290026023",
                SkyboxLf = "rbxassetid://10290025786",
                SkyboxRt = "rbxassetid://10290025545",
                SkyboxUp = "rbxassetid://10290025302",
                StarCount = 3000,
                SunAngularSize = 21,
                SunTextureId = "rbxasset://sky/sun.jpg"
            }
        ),
        KnitClient.Controllers.LightingController.colorCorrectionModifier:addModifier(20, {
            Brightness = 0.05,
            Contrast = 0.01,
            Saturation = 0.2,
            TintColor = Color3.fromRGB(255, 255, 255)
        })
    };

    local function _(p55) -- Line: 294
        -- upvalues: u54 (copy)
        return u54.sceneLightingMaid:GiveTask(p55);
    end;

    for i, v in u54.sceneLightingModifiers do
        local _ = i - 1;
        u54.sceneLightingMaid:GiveTask(v);
    end;

    u54.sceneLightingMaid:GiveTask(function() -- Line: 300
        -- upvalues: u54 (copy)
        u54.sceneLightingModifiers = {};
    end);
end;

function u4.disableMusic(p56) -- Line: 304
    -- upvalues: SoundManager (copy)
    for _, v in p56.musicTracks do
        SoundManager:tweenSoundVolume(v, 0, 1.5);
    end;
end;

KnitClient.CreateController(u4.new());

return nil;