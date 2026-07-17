-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local WatchPlayer = v1.WatchPlayer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InOutQuad = v2.InOutQuad;
local Linear = v2.Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v6.CollectionService;
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local RunService = v6.RunService;
local SoundService = v6.SoundService;
local Workspace = v6.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local StatefulEntityHpBarBillboard = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ExplosionType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta");
local getQueueMeta = v7.getQueueMeta;
local QueueMeta = v7.QueueMeta;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local SurvivalConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "survival-constants").SurvivalConstants;
local SurvivalMonsterDefinitions = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "survival-monster-definitions").SurvivalMonsterDefinitions;
local SurvivalUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "survival-util").SurvivalUtil;
local SurvivalWaveDefinitions = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "survival-wave-definitions").SurvivalWaveDefinitions;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local SurvivalEndedModal = RuntimeLib.import(script, script.Parent, "ended", "survival-ended-modal").SurvivalEndedModal;
local SurvivalUi = RuntimeLib.import(script, script.Parent, "ui", "bar", "survival-ui").SurvivalUi;
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 50, Name: __tostring
        return "SurvivalController";
    end,

    __index = GameKnitController
});
u8.__index = u8;

function u8.new(...) -- Line: 56
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 60
    -- upvalues: GameKnitController (copy), GameType (copy), SurvivalConstants (copy), SoundManager (copy), GameSound (copy)
    GameKnitController.constructor(p10, { GameType.SURVIVAL });
    p10.Name = "SurvivalController";
    p10.blockConnections = {};
    p10.health = SurvivalConstants.BASE_BED_HEALTH;
    p10.maxHealth = SurvivalConstants.BASE_BED_HEALTH;
    p10.wave = 0;
    p10.state = 1;
    p10.endTime = time() + 30;
    p10.lastBedTookDamage = (1 / 0);
    p10.bedAlarmTrack = SoundManager:createSound(GameSound.BED_ALARM);
    p10.waveTrack = SoundManager:createSound(GameSound.PENGUIN_SURVIVAL_WAVE_TRACK);
    p10.bossTrack = SoundManager:createSound(GameSound.PENGUIN_SURVIVAL_BOSS_TRACK);
    p10.intermissionTrack = SoundManager:createSound(GameSound.PENGUIN_SURVIVAL_INTERMISSION_TRACK);
    p10.bedHealthHooked = false;
    p10.count = 0;
    p10.finishedClientSetup = false;
end;

function u8.onGameInit(u11) -- Line: 78
    -- upvalues: ReplicatedStorage (copy), SoundService (copy), KnitClient (copy), QueueMeta (copy), GameType (copy), ClientStore (copy), GameSound (copy), RunService (copy), SurvivalUtil (copy), BlockEngine (copy), u5 (copy), SurvivalUi (copy), default2 (copy), SoundManager (copy), SurvivalWaveDefinitions (copy), Flamework (copy), SurvivalEndedModal (copy), CollectionService (copy), u4 (copy), default (copy), InOutQuad (copy), ClientSyncEvents (copy), ExplosionType (copy), Workspace (copy), SurvivalMonsterDefinitions (copy), WeldUtil (copy), u3 (copy), GameAnimationUtil (copy), RandomUtil (copy), EntityUtil (copy), WatchPlayer (copy), Players (copy), MatchState (copy)
    task.spawn(function() -- Line: 79
        -- upvalues: u11 (copy), ReplicatedStorage (ref)
        u11.penguinFolder = ReplicatedStorage.Assets.Misc:WaitForChild("PenguinModels");
    end);

    if u11.bedAlarmTrack then
        u11.bedAlarmTrack.Parent = SoundService;
        u11.bedAlarmTrack.Looped = false;
    end;

    if u11.waveTrack then
        u11.waveTrack.Parent = SoundService;
        u11.waveTrack.Looped = true;
        u11.waveTrack.SoundGroup = KnitClient.Controllers.BackgroundMusicController.backgroundMusicGroup;
    end;

    if u11.intermissionTrack then
        u11.intermissionTrack.Parent = SoundService;
        u11.intermissionTrack.Looped = false;
        u11.intermissionTrack.SoundGroup = KnitClient.Controllers.BackgroundMusicController.backgroundMusicGroup;
    end;

    if u11.bossTrack then
        u11.bossTrack.Parent = SoundService;
        u11.bossTrack.Looped = true;
        u11.bossTrack.SoundGroup = KnitClient.Controllers.BackgroundMusicController.backgroundMusicGroup;
    end;

    KnitClient.Controllers.MatchController:getQueueTypeAsync():andThen(function(p12) -- Line: 104
        -- upvalues: QueueMeta (ref), GameType (ref), ClientStore (ref), u11 (copy), KnitClient (ref), GameSound (ref)
        if QueueMeta[p12].game ~= GameType.SURVIVAL then
            return nil;
        end;

        ClientStore.changed:connect(function(p13, p14) -- Line: 109
            -- upvalues: u11 (ref)
            if p13.Settings.backgroundMusicVolumeGame ~= p14.Settings.backgroundMusicVolumeGame then
                local backgroundMusicVolumeGame = p13.Settings.backgroundMusicVolumeGame;

                if u11.intermissionTrack and u11.waveTrack then
                    u11.intermissionTrack.Volume = backgroundMusicVolumeGame;
                    u11.waveTrack.Volume = backgroundMusicVolumeGame;
                end;
            end;
        end);
        KnitClient.Controllers.PreloadController:runPreload({
            sounds = {
                GameSound.PENGUIN_SURVIVAL_INTERMISSION_TRACK,
                GameSound.PENGUIN_SURVIVAL_WAVE_TRACK,
                GameSound.PENGUIN_SURVIVAL_BOSS_TRACK,
                GameSound.PENGUIN_SURVIVAL_VICTORY_TRACK,
                GameSound.CLASSIC_ROBLOX_VICTORY_SOUND
            }
        });
    end);
    RunService.Heartbeat:Connect(function() -- Line: 123
        -- upvalues: u11 (copy), SurvivalUtil (ref), BlockEngine (ref), u5 (ref), SurvivalUi (ref)
        if time() - u11.lastBedTookDamage < 3 and (time() - u11.lastBedTookDamage > 0 and (u11.bedAlarmTrack and not u11.bedAlarmTrack.IsPlaying)) then
            u11.bedAlarmTrack:Play();
        end;

        if not u11.bedHealthHooked then
            local v15 = SurvivalUtil.getBed();
            local v16 = v15 and BlockEngine:getStore():getBlockData(BlockEngine:getBlockPosition(v15.Position));

            if v16 then
                u11.bedHealthHooked = true;
                u11:hookBedHealth(v16);
            end;
        end;

        if u11.tree then
            u11.tree = u5.update(u11.tree, u5.createElement("ScreenGui", {
                ResetOnSpawn = false,
                IgnoreGuiInset = false
            }, { u5.createElement(SurvivalUi, {
                    health = u11.health,
                    maxHealth = u11.maxHealth,
                    waveCount = u11.wave,
                    state = u11.state,
                    endTime = u11.endTime
                }) }));
        end;
    end);
    default2.Client:Get("SurvivalStateChange"):Connect(function(p17) -- Line: 155
        -- upvalues: u11 (copy), SoundManager (ref), GameSound (ref), SurvivalWaveDefinitions (ref), Flamework (ref), SurvivalEndedModal (ref), CollectionService (ref), u4 (ref), default (ref), InOutQuad (ref)
        if p17.wave ~= u11.wave then
            SoundManager:playSound(GameSound.WAVE_UPDATE);
        end;

        u11.wave = p17.wave;
        u11.state = p17.state;
        u11.endTime = p17.endTime;
        local v18 = 0;

        for _ in SurvivalWaveDefinitions do
            v18 = v18 + 1;
        end;

        if p17.wave == v18 and p17.state == 0 then
            local waveTrack = u11.waveTrack;

            if waveTrack ~= nil then
                waveTrack:Stop();
            end;

            local bossTrack = u11.bossTrack;

            if bossTrack ~= nil then
                bossTrack:Stop();
            end;

            local intermissionTrack = u11.intermissionTrack;

            if intermissionTrack ~= nil then
                intermissionTrack:Stop();
            end;

            SoundManager:playSound(GameSound.CLASSIC_ROBLOX_VICTORY_SOUND);
            SoundManager:playSound(GameSound.PENGUIN_SURVIVAL_VICTORY_TRACK);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                appId = "SurvivalEndedModal",
                app = SurvivalEndedModal
            }, {});

            return nil;
        end;

        if u11.state == 2 then
            for _, v in CollectionService:GetTagged("Monster") do
                if not v:FindFirstChildOfClass("Highlight") then
                    u4("Highlight", {
                        FillTransparency = 0.6,
                        OutlineTransparency = 0.2,
                        DepthMode = Enum.HighlightDepthMode.AlwaysOnTop,
                        Adornee = v,
                        FillColor = Color3.fromRGB(255, 217, 0),
                        OutlineColor = Color3.fromRGB(255, 255, 255),
                        Parent = v
                    });
                end;
            end;

            return;
        end;

        if u11.state == 0 then
            task.spawn(function() -- Line: 209
                -- upvalues: u11 (ref), default (ref), InOutQuad (ref)
                local intermissionTrack = u11.intermissionTrack;

                if intermissionTrack ~= nil then
                    intermissionTrack:Play();
                end;

                default(1, InOutQuad, function(p19) -- Line: 214
                    -- upvalues: u11 (ref)
                    if u11.intermissionTrack then
                        u11.intermissionTrack.Volume = 1 - p19;
                    end;

                    if u11.waveTrack then
                        u11.waveTrack.Volume = p19;
                    end;
                end, 1, 0):Wait();
                local waveTrack = u11.waveTrack;

                if waveTrack ~= nil then
                    waveTrack:Stop();
                end;
            end);

            return;
        end;

        if u11.state == 1 then
            local v20 = 0;

            for _ in SurvivalWaveDefinitions do
                v20 = v20 + 1;
            end;

            local u21;

            if v20 <= u11.wave and u11.wave % v20 == 0 then
                u21 = u11.bossTrack;
            else
                u21 = u11.waveTrack;
            end;

            task.spawn(function() -- Line: 236
                -- upvalues: u21 (copy), default (ref), InOutQuad (ref), u11 (ref)
                local v22 = u21;

                if v22 ~= nil then
                    v22:Play();
                end;

                default(1, InOutQuad, function(p23) -- Line: 241
                    -- upvalues: u11 (ref), u21 (ref)
                    if u11.intermissionTrack then
                        u11.intermissionTrack.Volume = p23;
                    end;

                    if u21 then
                        u21.Volume = 1 - p23;
                    end;
                end, 1, 0):Wait();
                local intermissionTrack = u11.intermissionTrack;

                if intermissionTrack ~= nil then
                    intermissionTrack:Stop();
                end;
            end);
        end;
    end);
    ClientSyncEvents.ExplosionEffect:connect(function(p24) -- Line: 256
        -- upvalues: ExplosionType (ref), ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref)
        if p24.explosionType == ExplosionType.BOMBER_PENGUIN_EXPLOSION or p24.explosionType == ExplosionType.ULTRA_BOMBER_PENGUIN_EXPLOSION then
            local u25 = ReplicatedStorage.Assets.Effects.GuidedMissileExplosion:Clone();
            u25.Position = p24.position;
            u25.Parent = Workspace;
            u25.Debris1:Emit(5);
            u25.Debris2:Emit(5);
            u25.ExplosionFlames:Emit(50);
            SoundManager:playSound(GameSound.GUIDED_MISSILE_EXPLOSION, {
                rollOffMaxDistance = 160,
                position = p24.position
            });
            task.delay(5, function() -- Line: 268
                -- upvalues: u25 (copy)
                u25:Destroy();
            end);
        end;
    end);
    CollectionService:GetInstanceAddedSignal("SurvivalPenguin"):Connect(function(u26) -- Line: 273
        -- upvalues: u11 (copy), SurvivalMonsterDefinitions (ref), WeldUtil (ref), u3 (ref), GameAnimationUtil (ref), RunService (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref), EntityUtil (ref)
        if u11.penguinFolder == nil then
            return nil;
        end;

        u26:GetPropertyChangedSignal("PrimaryPart"):Wait();
        local v27 = u26:GetAttribute("MonsterType");
        u11:createEntityHealthbar(u26, Color3.fromRGB(255, 0, 0));
        local u28 = SurvivalMonsterDefinitions[v27];

        if u28 == nil then
            return nil;
        end;

        local v29 = u11.penguinFolder:WaitForChild(u28.modelName, 3);

        if v29 ~= nil then
            v29 = v29:Clone();
        end;

        if not v29 then
            return nil;
        end;

        local v30 = v29:FindFirstChildOfClass("Humanoid");

        if v30 ~= nil then
            v30:Destroy();
        end;

        v29:SetPrimaryPartCFrame(u26:GetPrimaryPartCFrame());

        for _, child in v29:GetChildren() do
            if child:IsA("BasePart") then
                child.CanCollide = false;
                child.Massless = true;
            end;
        end;

        v29.Parent = u26;
        WeldUtil:weldPartsWithJoint(u26.PrimaryPart, v29.PrimaryPart, "Motor6D");
        v29.PrimaryPart.Name = "Main";

        for _, child in v29:GetChildren() do
            child.Parent = u26;
        end;

        v29:Destroy();
        local Humanoid = u26:WaitForChild("Humanoid");
        local Animator = Humanoid:WaitForChild("Animator");
        local u31 = u3.new();
        local u32 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(u28.animations.walk));
        u32.Looped = true;
        u32.Priority = Enum.AnimationPriority.Movement;
        u31:GiveTask(u32);
        local u33 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(u28.animations.idle));
        u33.Looped = true;
        u33.Priority = Enum.AnimationPriority.Idle;
        u31:GiveTask(u33);
        local u34 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(u28.animations.jump));
        u34.Looped = false;
        u34.Priority = Enum.AnimationPriority.Action;
        u31:GiveTask(u34);
        u31:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 327
            -- upvalues: Humanoid (copy), u26 (copy), u32 (copy), u33 (copy), u34 (copy)
            if Humanoid:GetState() == Enum.HumanoidStateType.Running then
                if u26.PrimaryPart.AssemblyLinearVelocity.Magnitude > 10 then
                    u32:AdjustSpeed(Humanoid.WalkSpeed / 16);

                    if not u32.IsPlaying then
                        u32:Play();
                    end;
                else
                    u32:Stop();

                    if not u33.IsPlaying then
                        u33:Play();
                    end;
                end;
            elseif (Humanoid:GetState() == Enum.HumanoidStateType.Jumping or Humanoid:GetState() == Enum.HumanoidStateType.Freefall) and not u34.IsPlaying then
                u32:Stop();
                u33:Stop();
                u34:Play();
            end;
        end));
        local u35 = time() + math.random(1, 10);
        local u36;

        if u28 == nil then
            u36 = u28;
        else
            u36 = u28.sounds;

            if u36 ~= nil then
                u36 = u36.passive;
            end;
        end;

        u31:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 356
            -- upvalues: u35 (ref), SoundManager (ref), u36 (copy), RandomUtil (ref), GameSound (ref), u26 (copy)
            if u35 < time() then
                local v37;

                if u36 then
                    v37 = RandomUtil.fromList(unpack(u36.sounds));
                else
                    v37 = GameSound.PENGUIN_SQUAWK_1;
                end;

                SoundManager:playSound(v37, {
                    position = u26:GetPrimaryPartCFrame().Position
                });
                local v38 = time();
                local v39;

                if u36 then
                    v39 = math.random(u36.minInterval, u36.maxInterval);
                else
                    v39 = math.random(1, 150);
                end;

                u35 = v38 + v39;
            end;
        end));
        u31:GiveTask(Animator.AnimationPlayed:Connect(function(p40) -- Line: 365
            -- upvalues: u28 (copy), GameAnimationUtil (ref), u26 (copy), SoundManager (ref), RandomUtil (ref), GameSound (ref)
            local attack = u28.animations.attack;

            if attack ~= 0 and (attack == attack and attack) then
                local Animation = p40.Animation;

                if Animation ~= nil then
                    Animation = Animation.AnimationId;
                end;

                attack = Animation == GameAnimationUtil:getAssetId(u28.animations.attack) and u26.PrimaryPart;
            end;

            if attack ~= 0 and (attack == attack and attack) then
                SoundManager:playSound(RandomUtil.fromList(GameSound.PENGUIN_ATTACK_1, GameSound.PENGUIN_ATTACK_2, GameSound.PENGUIN_ATTACK_3), {
                    position = u26:GetPrimaryPartCFrame().Position
                });
                local v41 = u28;

                if v41 ~= nil then
                    v41 = v41.sounds;

                    if v41 ~= nil then
                        v41 = v41.attack;
                    end;
                end;

                if v41 then
                    SoundManager:playSound(RandomUtil.fromList(unpack(v41)), {
                        position = u26:GetPrimaryPartCFrame().Position
                    });
                end;
            end;
        end));
        local u42 = 100;
        u31:GiveTask(u26:GetAttributeChangedSignal("Health"):Connect(function() -- Line: 397
            -- upvalues: u26 (copy), u42 (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref), u26 (copy)
            local v43 = u26:GetAttribute("Health");

            if v43 ~= 0 and (v43 == v43 and v43) then
                if v43 < u42 then
                    SoundManager:playSound(RandomUtil.fromList(GameSound.PENGUIN_DAMAGED_5, GameSound.PENGUIN_DAMAGED_6, GameSound.PENGUIN_DAMAGED_7), {
                        position = u26:GetPrimaryPartCFrame().Position
                    });
                end;

                u42 = v43;
            end;
        end));
        local v44 = EntityUtil:getEntity(u26);
        local v45 = v44 and v44:getHumanoid();

        if v45 then
            v45.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff;
        end;

        u31:GiveTask(function() -- Line: 437
            -- upvalues: u26 (copy), SoundManager (ref), RandomUtil (ref), GameSound (ref)
            if u26.PrimaryPart then
                SoundManager:playSound(RandomUtil.fromList(GameSound.PENGUIN_DAMAGED_5, GameSound.PENGUIN_DAMAGED_6, GameSound.PENGUIN_DAMAGED_7), {
                    position = u26:GetPrimaryPartCFrame().Position
                });
            end;
        end);
        u31:GiveTask(u26.AncestryChanged:Connect(function() -- Line: 444
            -- upvalues: u26 (copy), u31 (copy)
            if not u26:IsDescendantOf(game) then
                u31:DoCleaning();
            end;
        end));
    end);
    WatchPlayer(function(p46, p47) -- Line: 450
        -- upvalues: Players (ref), KnitClient (ref), MatchState (ref), u11 (copy)
        if p46 ~= Players.LocalPlayer then
            return nil;
        end;

        if KnitClient.Controllers.MatchController:getMatchState() ~= MatchState.RUNNING then
            return nil;
        end;

        u11:setupClient();
    end);
    default2.Client:WaitFor("MatchStateEvent"):expect():Connect(function(p48, p49, p50) -- Line: 459
        -- upvalues: MatchState (ref), u11 (copy)
        if p48 ~= MatchState.RUNNING then
            return nil;
        end;

        u11:setupClient();
    end);
end;

function u8.hookBedHealth(u51, u52) -- Line: 466
    -- upvalues: SurvivalUtil (copy), SurvivalConstants (copy)
    local function _() -- Line: 467
        -- upvalues: u52 (copy), SurvivalUtil (ref), SurvivalConstants (ref), u51 (copy)
        local v53 = u52:GetAttribute("Health");
        local v54 = SurvivalUtil.getBed():GetAttribute("MaxHealth");

        if v54 == nil then
            v54 = SurvivalConstants.BASE_BED_HEALTH;
        end;

        if v53 < u51.health then
            u51.lastBedTookDamage = time();
        end;

        u51.health = v53;
        u51.maxHealth = v54;
    end;

    u52:GetAttributeChangedSignal("Health"):Connect(function() -- Line: 480
        -- upvalues: u52 (copy), SurvivalUtil (ref), SurvivalConstants (ref), u51 (copy)
        local v55 = u52:GetAttribute("Health");
        local v56 = SurvivalUtil.getBed():GetAttribute("MaxHealth");

        if v56 == nil then
            v56 = SurvivalConstants.BASE_BED_HEALTH;
        end;

        if v55 < u51.health then
            u51.lastBedTookDamage = time();
        end;

        u51.health = v55;
        u51.maxHealth = v56;
    end);
    local v57 = u52:GetAttribute("Health");
    local v58 = SurvivalUtil.getBed():GetAttribute("MaxHealth");

    if v58 == nil then
        v58 = SurvivalConstants.BASE_BED_HEALTH;
    end;

    if v57 < u51.health then
        u51.lastBedTookDamage = time();
    end;

    u51.health = v57;
    u51.maxHealth = v58;
end;

function u8.createEntityHealthbar(p59, p60, p61) -- Line: 485
    -- upvalues: Flamework (copy), StatefulEntityHpBarBillboard (copy)
    local v62 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
    local v63 = {
        app = StatefulEntityHpBarBillboard
    };
    local count = p59.count;
    p59.count = p59.count + 1;
    v63.appId = "StatefulEntityHpBarBillboard_Penguin" .. tostring(count);
    v62:openApp(v63, {
        hpBarOffset = Vector3.new(0, 2, 0),
        maxDistance = 100,
        gameEntity = p60,
        serverInstance = p60,
        barColor = p61
    }, nil, p60);
end;

function u8.setupClient(u64) -- Line: 503
    -- upvalues: EntityUtil (copy), KnitClient (copy), getQueueMeta (copy), WatchCollectionTag (copy), Linear (copy), CollectionService (copy), u5 (copy), SurvivalUi (copy), SurvivalConstants (copy), Players (copy), SurvivalUtil (copy), SoundManager (copy), GameSound (copy)
    if u64.finishedClientSetup then
        return nil;
    end;

    u64.finishedClientSetup = true;
    local v65 = EntityUtil:getLocalPlayerEntity();

    if v65 ~= nil then
        v65 = v65:getHumanoid();
    end;

    if v65 then
        v65.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOn;
        v65.NameDisplayDistance = 100;
        v65.HealthDisplayDistance = 100;
        v65.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer;
    end;

    local v66 = KnitClient.Controllers.MatchController:getQueueType();

    if v66 and getQueueMeta(v66).classicTexture then
        WatchCollectionTag("block", function(u67) -- Line: 522
            -- upvalues: u64 (copy), Linear (ref)
            if u67:GetAttribute("PlacedByUserId") ~= 0 then
                local u68 = nil;
                u64.blockConnections[u67] = u67:GetAttributeChangedSignal("Health"):Connect(function() -- Line: 527
                    -- upvalues: u67 (copy), u68 (ref), Linear (ref)
                    local v69 = u67:GetAttribute("MaxHealth");
                    local v70 = u67:GetAttribute("Health");

                    if u68 == nil then
                        local function _(p71) -- Line: 532
                            return p71:IsA("Texture");
                        end;

                        local v72 = 0;
                        local v73 = {};

                        for i, child in u67:GetChildren() do
                            local _ = i - 1;

                            if child:IsA("Texture") == true then
                                v72 = v72 + 1;
                                v73[v72] = child;
                            end;
                        end;

                        u68 = v73;
                    end;

                    for _, v in u68 do
                        v.Color3 = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(0, 0, 0), Linear(v69 - v70, 0, 1, v69));
                    end;
                end);
            end;
        end);
        CollectionService:GetInstanceRemovedSignal("block"):Connect(function(p74) -- Line: 554
            -- upvalues: u64 (copy)
            if u64.blockConnections[p74] then
                u64.blockConnections[p74] = nil;
            end;
        end);
    end;

    local function u76(p75) -- Line: 564
        -- upvalues: u64 (copy), u5 (ref), SurvivalUi (ref), SurvivalConstants (ref), Players (ref)
        u64.tree = u5.mount(u5.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u5.createElement(SurvivalUi, {
                health = SurvivalConstants.BASE_BED_HEALTH,
                maxHealth = SurvivalConstants.BASE_BED_HEALTH,
                waveCount = u64.wave,
                endTime = u64.endTime,
                state = u64.state
            }) }), Players.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
    end;

    local v77 = SurvivalUtil.getBed();

    if v77 then
        u76(v77);
    else
        CollectionService:GetInstanceAddedSignal("bed:1"):Connect(function(p78) -- Line: 581
            -- upvalues: u76 (copy)
            u76(p78);
        end);
    end;

    CollectionService:GetInstanceRemovedSignal("bed:1"):Connect(function(p79) -- Line: 585
        -- upvalues: u64 (copy), SoundManager (ref), GameSound (ref)
        local v80 = p79:GetAttribute("MaxHealth");
        u64.health = 0;
        u64.maxHealth = v80;
        SoundManager:playSound(GameSound.BED_BREAK, {});
    end);
end;

KnitClient.CreateController(u8.new());

return nil;