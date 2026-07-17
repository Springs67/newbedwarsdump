-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v6.CollectionService;
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local SoundService = v6.SoundService;
local TweenService = v6.TweenService;
local Workspace = v6.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local FadeUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "fade", "fade-util").FadeUtil;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local HalloweenStageConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-stage-config").HalloweenStageConfig;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SceneKey = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseSceneController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "base-scene-controller").BaseSceneController;
local HalloweenQuestTracker = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "halloween-quest-tracker").HalloweenQuestTracker;
local STAGE_2_ENVRIONMENT = RuntimeLib.import(script, script.Parent.Parent.Parent, "halloween-2024", "environments", "halloween-stage2-environment").STAGE_2_ENVRIONMENT;
local u7 = { GameSound.SPIDER_ATTACK_1, GameSound.SPIDER_ATTACK_2, GameSound.SPIDER_ATTACK_3 };
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 47, Name: __tostring
        return "Halloween2025Stage2SceneController";
    end,

    __index = BaseSceneController
});
u8.__index = u8;

function u8.new(...) -- Line: 53
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 57
    -- upvalues: BaseSceneController (copy), SceneKey (copy), u3 (copy)
    BaseSceneController.constructor(p10, SceneKey.HALLOWEEN_2025_STAGE_2);
    p10.Name = "Halloween2025Stage2Scene";
    p10.sceneMaid = u3.new();
end;

function u8.KnitStart(p11) -- Line: 62
    -- upvalues: BaseSceneController (copy)
    BaseSceneController.KnitStart(p11);
end;

function u8.onSceneLoadingScreenStart(p12) -- Line: 65
end;

function u8.onSceneStart(u13) -- Line: 67
    -- upvalues: KnitClient (copy), STAGE_2_ENVRIONMENT (copy), WatchCollectionTag (copy), SoundManager (copy), GameSound (copy), ClientSyncEvents (copy), Players (copy), CollectionService (copy), default2 (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), ReplicatedStorage (copy), Workspace (copy), TweenService (copy), RandomUtil (copy), HalloweenStageConfig (copy), u5 (copy), HalloweenQuestTracker (copy), u7 (copy)
    u13:setupSoundAmbience();
    u13:setUpDoorPrompt();
    KnitClient.Controllers.EnvironmentController:setupEnvironment(STAGE_2_ENVRIONMENT);
    WatchCollectionTag("hanging", function(p14) -- Line: 71
        -- upvalues: SoundManager (ref), GameSound (ref)
        local PrimaryPart = p14.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if PrimaryPart then
            SoundManager:playSound(GameSound.SKELETON_EMERGE, {
                position = PrimaryPart
            });
        end;
    end);
    ClientSyncEvents.ProjectileHit:connect(function(p15) -- Line: 83
        -- upvalues: Players (ref), CollectionService (ref), SoundManager (ref), GameSound (ref)
        if p15:isCancelled() then
            return nil;
        end;

        local shooter = p15.shooter;

        if shooter ~= nil then
            shooter = shooter:getInstance();
        end;

        local v16 = shooter == Players.LocalPlayer.Character and (p15.hitData.part and CollectionService:HasTag(p15.hitData.part, "FloatingRock"));

        if v16 then
            SoundManager:playSound(GameSound.ROCK_CRUMBLE_2);
        end;
    end);
    default2.Client:Get("HangingSkeletonAttack"):Connect(function(p17) -- Line: 99
        -- upvalues: AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref)
        local PrimaryPart = p17.target.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        local PrimaryPart2 = p17.guardian.PrimaryPart;

        if PrimaryPart2 ~= nil then
            PrimaryPart2 = PrimaryPart2.Position;
        end;

        if not (PrimaryPart and PrimaryPart2) then
            return nil;
        end;

        local v18 = Vector3.new(0, PrimaryPart2.Y, 0);
        p17.guardian.PrimaryPart.CFrame = CFrame.new(PrimaryPart2, PrimaryPart * Vector3.new(1, 0, 1) + v18);
        AnimationUtil:playAnimation(p17.guardian, GameAnimationUtil:getAssetId(AnimationType.GREAT_HAMMER_SWING_1));
        SoundManager:playSound(GameSound.SKELETON_ATTACK_1, {
            position = PrimaryPart2
        });
    end);
    default2.Client:Get("FloatingRockHit"):Connect(function(p19) -- Line: 130
        -- upvalues: u13 (copy)
        if p19.target then
            u13:rockFallAnimation(p19.rock, p19.target);

            return;
        end;

        u13:rockShakeAnimation(p19.rock);
    end);
    default2.Client:Get("SpiderCacoonHit"):Connect(function(p20) -- Line: 137
        -- upvalues: ReplicatedStorage (ref), Workspace (ref)
        local position = p20.position;

        if position then
            local u21 = ReplicatedStorage.Assets.Effects.SpiderWebDebris:Clone();
            u21.Parent = Workspace;
            u21:PivotTo(CFrame.new(position));

            local function _(p22) -- Line: 144
                if p22:IsA("Part") or p22:IsA("MeshPart") then
                    p22.Anchored = false;
                end;
            end;

            for i, child in u21:GetChildren() do
                local _ = i - 1;

                if child:IsA("Part") or child:IsA("MeshPart") then
                    child.Anchored = false;
                end;
            end;

            task.delay(2, function() -- Line: 152
                -- upvalues: u21 (copy)
                u21:Destroy();
            end);
        end;
    end);
    ClientSyncEvents.ProjectileHit:connect(function(p23) -- Line: 157
        -- upvalues: Players (ref), CollectionService (ref), SoundManager (ref), GameSound (ref)
        if p23:isCancelled() then
            return nil;
        end;

        local shooter = p23.shooter;

        if shooter ~= nil then
            shooter = shooter:getInstance();
        end;

        local v24 = shooter == Players.LocalPlayer.Character and (p23.hitData.part and CollectionService:HasTag(p23.hitData.part, "FloatingRock"));

        if v24 then
            SoundManager:playSound(GameSound.ROCK_CRUMBLE_2);
        end;
    end);
    default2.Client:Get("SpiderEggBreak"):Connect(function(p25) -- Line: 173
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref)
        local u26 = ReplicatedStorage.Assets.Effects.EggExplosion:Clone();
        u26.Parent = Workspace;
        u26.Position = p25.position;
        SoundManager:playSound(GameSound.GLUE_ENCHANT_02, {
            rollOffMaxDistance = 220,
            volumeMultiplier = 2,
            position = p25.position
        });

        local function _(p27) -- Line: 183
            if p27:IsA("ParticleEmitter") then
                p27:Emit(30);
            end;
        end;

        for i, descendant in u26:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ParticleEmitter") then
                descendant:Emit(30);
            end;
        end;

        task.delay(0.7, function() -- Line: 191
            -- upvalues: u26 (copy)
            u26:Destroy();
        end);
    end);
    default2.Client:Get("SpiderGuardianAction"):Connect(function(u28) -- Line: 195
        -- upvalues: TweenService (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), u13 (copy), KnitClient (ref)
        local target = u28.target;

        if target ~= nil then
            target = target.PrimaryPart;

            if target ~= nil then
                target = target.Position;
            end;
        end;

        if target then
            target = u28.guardian.PrimaryPart;

            if target ~= nil then
                target = target.Position;
            end;
        end;

        if target then
            local PrimaryPart = u28.guardian.PrimaryPart;
            local v29 = TweenInfo.new(0.3);
            local v30 = {};
            local Position = u28.guardian.PrimaryPart.Position;
            local Position2 = u28.target.PrimaryPart.Position;
            local v31 = Vector3.new(0, u28.guardian.PrimaryPart.Position.Y, 0);
            v30.CFrame = CFrame.new(Position, Position2 * Vector3.new(1, 0, 1) + v31);
            TweenService:Create(PrimaryPart, v29, v30):Play();
        end;

        local action = u28.action;

        if action ~= "MELEE" then
            if action == "RANGE" then
                if u28.target then
                    u13:rangeAttackAnimation(u28.guardian, u28.target);

                    return;
                end;
            elseif action == "ABILITY" then
                local SPIDER_ATTACK_3 = GameSound.SPIDER_ATTACK_3;
                local v32 = {};
                local PrimaryPart = u28.guardian.PrimaryPart;

                if PrimaryPart ~= nil then
                    PrimaryPart = PrimaryPart.Position;
                end;

                v32.position = PrimaryPart;
                v32.volumeMultiplier = 1;
                v32.rollOffMaxDistance = 220;
                v32.rollOffMinDistance = 110;
                SoundManager:playSound(SPIDER_ATTACK_3, v32);
                AnimationUtil:playAnimation(u28.guardian, GameAnimationUtil:getAssetId(AnimationType.WARRIOR_SPIDER_ATTACK_2));
                task.delay(1, function() -- Line: 264
                    -- upvalues: KnitClient (ref), u28 (copy)
                    KnitClient.Controllers.ScreenShakeController:shake(u28.guardian.PrimaryPart.Position, Vector3.new(0, -1, 0), {
                        magnitude = 1,
                        cycles = 4,
                        duration = 0.3
                    });
                end);

                return;
            end;

            return;
        end;

        AnimationUtil:playAnimation(u28.guardian, GameAnimationUtil:getAssetId(AnimationType.WARRIOR_SPIDER_ATTACK_1));
        local SPIDER_ATTACK_2 = GameSound.SPIDER_ATTACK_2;
        local v33 = {};
        local PrimaryPart = u28.guardian.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        v33.position = PrimaryPart;
        v33.volumeMultiplier = 1;
        v33.rollOffMaxDistance = 220;
        v33.rollOffMinDistance = 110;
        SoundManager:playSound(SPIDER_ATTACK_2, v33);
    end);
    default2.Client:Get("StageTwoGateOpen"):Connect(function() -- Line: 275
        -- upvalues: u13 (copy)
        u13:gateOpenCutScene();
    end);
    WatchCollectionTag("FloatingRock", function(u34) -- Line: 279
        -- upvalues: Workspace (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref), ReplicatedStorage (ref)
        task.spawn(function() -- Line: 280
            -- upvalues: u34 (copy), Workspace (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref), ReplicatedStorage (ref)
            task.wait(math.random() * 20);

            while true do
                local v35 = task.wait(math.random() * 5 + 20);

                if v35 ~= 0 and (v35 == v35 and v35) then
                    v35 = u34:IsDescendantOf(Workspace);
                end;

                if v35 == 0 or (v35 ~= v35 or not v35) then
                    return;
                end;

                SoundManager:playSound(RandomUtil.fromList(unpack({ GameSound.ROCK_CRUMBLE_1, GameSound.ROCK_CRUMBLE_2, GameSound.ROCK_CRUMBLE_3 })), {
                    volumeMultiplier = 0.5,
                    rollOffMaxDistance = 110,
                    rollOffMinDistance = 50,
                    position = u34.Position
                });
                local u36 = ReplicatedStorage.Assets.Effects.FallingRockEffect:Clone();
                u36:PivotTo(u34.CFrame);
                u36.Parent = Workspace;

                local function _(p37) -- Line: 300
                    if p37:IsA("Part") or p37:IsA("WedgePart") then
                        p37.Anchored = false;
                    end;
                end;

                for i, child in u36:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("Part") or child:IsA("WedgePart") then
                        child.Anchored = false;
                    end;
                end;

                task.delay(2, function() -- Line: 308
                    -- upvalues: u36 (copy)
                    u36:Destroy();
                end);
            end;
        end);
    end);
    WatchCollectionTag("SpitterSpider", function(p38) -- Line: 314
        -- upvalues: ReplicatedStorage (ref)
        local v39 = p38:GetAttribute("StringAttached");

        if v39 ~= 0 and (v39 == v39 and (v39 ~= "" and v39)) then
            local v40 = ReplicatedStorage.Assets.Effects.SpiderString:Clone();
            local PrimaryPart = p38.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart.Position;
            end;

            if not PrimaryPart then
                return nil;
            end;

            v40.Position = PrimaryPart + Vector3.new(0, 4, 0);
            v40.Parent = p38;
        end;
    end);
    local v41 = {
        {
            completed = false,
            description = "Collect and place Crystals on the Door",
            currentProgress = 0,
            totalProgress = HalloweenStageConfig.STAGE2_CRYSTAL_AMOUNT
        }
    };
    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera ~= nil then
        CurrentCamera = CurrentCamera.ViewportSize.Y;
    end;

    local u42 = u5.mount(u5.createElement(HalloweenQuestTracker, {
        CurrentTasks = v41,
        ScreenSizeY = CurrentCamera == nil and 374 or CurrentCamera
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    u13.sceneMaid:GiveTask(function() -- Line: 351
        -- upvalues: u5 (ref), u42 (copy)
        u5.unmount(u42);
    end);
    default2.Client:Get("WarriorSpiderAttack"):Connect(function(p43) -- Line: 354
        -- upvalues: SoundManager (ref), RandomUtil (ref), u7 (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        local PrimaryPart = p43.model.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if PrimaryPart then
            SoundManager:playSound(RandomUtil.fromList(unpack(u7)), {
                volumeMultiplier = 0.7,
                rollOffMaxDistance = 110,
                rollOffMinDistance = 50,
                position = PrimaryPart
            });
        end;

        AnimationUtil:playAnimation(p43.model, GameAnimationUtil:getAssetId(AnimationType.WARRIOR_SPIDER_ATTACK_1));
    end);
    default2.Client:Get("EntityDeathEvent"):Connect(function(p44) -- Line: 370
        -- upvalues: CollectionService (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref)
        if CollectionService:HasTag(p44.entityInstance, "door-guardian") then
            GameAnimationUtil:playAnimation(p44.entityInstance, AnimationType.SPIDER_GUARD_DEATH);
            SoundManager:playSound(GameSound.SPIDER_GUARD_DEATH, {
                volumeMultiplier = 1.5
            });
        end;

        if CollectionService:HasTag(p44.entityInstance, "WoodBox") then
            SoundManager:playSound(GameSound.LASER_PICKAXE_WOOD_BREAK_4, {
                volumeMultiplier = 1,
                rollOffMaxDistance = 110,
                rollOffMinDistance = 50,
                position = p44.cframe.Position
            });

            if p44.entityInstance.PrimaryPart then
                p44.entityInstance.PrimaryPart.Transparency = 1;
                p44.entityInstance.PrimaryPart.CanCollide = false;

                local function _(p45) -- Line: 388
                    if p45:IsA("Part") then
                        local v46 = math.random();
                        local v47 = math.random();
                        p45:ApplyImpulse((Vector3.new(v46, v47, math.random())));
                    end;
                end;

                for i, descendant in p44.entityInstance.PrimaryPart:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("Part") then
                        local v48 = math.random();
                        local v49 = math.random();
                        descendant:ApplyImpulse((Vector3.new(v48, v49, math.random())));
                    end;
                end;
            end;
        end;
    end);
end;

function u8.onSceneShutdown(p50) -- Line: 400
    -- upvalues: KnitClient (copy)
    p50.sceneMaid:DoCleaning();
    KnitClient.Controllers.TreasureChestController:cleanUp();
end;

function u8.setupSoundAmbience(p51) -- Line: 404
    -- upvalues: SoundService (copy), SoundManager (copy), GameSound (copy), KnitClient2 (copy)
    local AmbientReverb = SoundService.AmbientReverb;
    SoundService.AmbientReverb = Enum.ReverbType.Cave;
    p51.sceneMaid:GiveTask(function() -- Line: 407
        -- upvalues: SoundService (ref), AmbientReverb (copy)
        SoundService.AmbientReverb = AmbientReverb;
    end);
    local u52 = SoundManager:playModifiableSound(GameSound.CAVE_AMBIENCE, {
        volumeMultiplier = 1.3,
        looped = true
    });
    p51.sceneMaid:GiveTask(function() -- Line: 415
        -- upvalues: u52 (copy)
        u52:Stop();
        u52:Destroy();
    end);
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

function u8.setUpDoorPrompt(p53) -- Line: 427
    -- upvalues: CollectionService (copy), KnitClient2 (copy), DeviceUtil (copy), InventoryUtil (copy), ItemType (copy), default2 (copy)
    local v54 = CollectionService:GetTagged("Door");

    if #v54 == 0 then
        return nil;
    end;

    local u55 = v54[1];

    if u55:IsA("Part") then
        p53.door = u55;
    end;

    local v56 = u55:FindFirstChildOfClass("Folder");
    local u57 = {};

    if v56 ~= nil then
        local function _(p58) -- Line: 441
            -- upvalues: u57 (copy)
            if p58:IsA("MeshPart") then
                table.insert(u57, p58);
            end;
        end;

        for i, child in v56:GetChildren() do
            local _ = i - 1;

            if child:IsA("MeshPart") then
                table.insert(u57, child);
            end;
        end;
    end;

    local u59 = 0;
    u55:GetAttributeChangedSignal("CrystalCount"):Connect(function() -- Line: 452
        -- upvalues: u55 (copy), u57 (copy), u59 (ref)
        local v60 = u55:GetAttribute("CrystalCount");
        local v61 = math.max(0, 100 - v60) / 5.555555555555555;

        while math.floor(v61) < #u57 and (#u57 ~= 1 or v60 >= 100) do
            local v62 = #u57;
            local v63 = u57[v62];
            u57[v62] = nil;

            if v63 then
                v63.Material = Enum.Material.Neon;
                v63.Transparency = 0;
            end;
        end;

        u59 = v60;
    end);
    KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
        ActionText = "Put in Crystals",
        RequiresLineOfSight = false,
        MaxActivationDistance = 20,
        Parent = u55,
        ClickablePrompt = DeviceUtil.isMobileControls()
    }).Triggered:Connect(function(p64) -- Line: 480
        -- upvalues: InventoryUtil (ref), ItemType (ref), default2 (ref)
        if not InventoryUtil.hasEnough(p64, ItemType.CRYSTAL_ORE, 1) then
            return nil;
        end;

        default2.Client:Get("TurnInCrystalRequest"):CallServer();
    end);
end;

function u8.rockFallAnimation(u65, u66, u67) -- Line: 487
    -- upvalues: TweenService (copy), u4 (copy), GameSound (copy), SoundManager (copy), Players (copy), KnitClient (copy)
    local v68 = u66.Position - u67;
    TweenService:Create(u66, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
        CFrame = u66.CFrame - v68
    }):Play();
    u4("Sound", {
        RollOffMinDistance = 110,
        RollOffMaxDistance = 220,
        Volume = 2,
        Playing = true,
        SoundId = GameSound.ROCK_CRUMBLE_1,
        Parent = u66
    });
    task.delay(0.3, function() -- Line: 502
        -- upvalues: SoundManager (ref), GameSound (ref), u67 (copy)
        SoundManager:playSound(GameSound.JUGGERNAUT_GROUND_SMASH, {
            volumeMultiplier = 1,
            rollOffMaxDistance = 220,
            rollOffMinDistance = 110,
            position = u67
        });
    end);
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if Character and (u67 - Character).Magnitude < 25 then
        task.delay(0.4, function() -- Line: 519
            -- upvalues: KnitClient (ref), u67 (copy)
            KnitClient.Controllers.ScreenShakeController:shake(u67, Vector3.new(0, -1, 0), {
                magnitude = 1,
                cycles = 4,
                duration = 0.3
            });
        end);
    end;

    task.delay(8, function() -- Line: 527
        -- upvalues: SoundManager (ref), GameSound (ref), u67 (copy), u65 (copy), u66 (copy)
        local u69 = SoundManager:playSound(GameSound.ROCK_RUMBLE, {
            volumeMultiplier = 1,
            rollOffMaxDistance = 220,
            rollOffMinDistance = 110,
            fadeOutTime = 1,
            position = u67
        });
        task.delay(2, function() -- Line: 535
            -- upvalues: u69 (copy)
            u69:Destroy();
        end);
        u65:rockShakeAnimation(u66, true);
    end);
end;

function u8.rockShakeAnimation(p70, u71, p72) -- Line: 541
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), GameSound (copy), TweenService (copy)
    local Position = u71.Position;
    local u73 = u71:GetAttribute("HP");
    local u74 = 0;
    local v75 = math.random();
    local u76 = Vector3.new(v75, 0, math.random());
    local u77 = 1;

    if p72 then
        task.delay(2, function() -- Line: 548
            -- upvalues: ReplicatedStorage (ref), u71 (copy), Workspace (ref), SoundManager (ref), GameSound (ref)
            local u78 = ReplicatedStorage.Assets.Effects.BrokenRockEffect:Clone();
            u78:PivotTo(u71.CFrame + Vector3.new(0, u71.Size.Y / 2 - 3, 0));
            u78.Parent = Workspace;
            local PrimaryPart = u78.PrimaryPart;

            if PrimaryPart ~= nil then
                local v79 = PrimaryPart:FindFirstChildOfClass("Folder");

                if v79 ~= nil then
                    v79:Destroy();
                end;
            end;

            SoundManager:playSound(GameSound.MINER_STONE_BREAK, {
                volumeMultiplier = 1,
                rollOffMaxDistance = 220,
                rollOffMinDistance = 110,
                position = u71.Position
            });
            task.delay(2, function() -- Line: 568
                -- upvalues: u78 (copy)
                u78:Destroy();
            end);
        end);
    else
        local u80 = ReplicatedStorage.Assets.Effects.FallingRockEffect:Clone();
        u80:PivotTo(u71.CFrame);
        u80.Parent = Workspace;

        local function _(p81) -- Line: 577
            if p81:IsA("Part") or p81:IsA("WedgePart") then
                p81.Anchored = false;
            end;
        end;

        for i, child in u80:GetChildren() do
            local _ = i - 1;

            if child:IsA("Part") or child:IsA("WedgePart") then
                child.Anchored = false;
            end;
        end;

        task.delay(2, function() -- Line: 585
            -- upvalues: u80 (copy)
            u80:Destroy();
        end);
    end;

    task.spawn(function() -- Line: 589
        -- upvalues: u74 (ref), u71 (copy), u73 (copy), TweenService (ref), u76 (copy), u77 (ref), Position (copy)
        while u74 < 4 and u71:GetAttribute("HP") == u73 do
            TweenService:Create(u71, TweenInfo.new(0.1), {
                Position = Position + u76 * u77
            }):Play();
            u77 = u77 * -0.8;
            task.wait(0.15);
            u74 = u74 + 1;
        end;

        TweenService:Create(u71, TweenInfo.new(0.2), {
            Position = Position
        }):Play();
    end);
end;

function u8.rangeAttackAnimation(p82, u83, u84) -- Line: 612
    -- upvalues: ReplicatedStorage (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), Workspace (copy), default (copy), InQuad (copy), u4 (copy)
    local PrimaryPart = u83.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.Position;
    end;

    local PrimaryPart2 = u84.PrimaryPart;

    if PrimaryPart2 ~= nil then
        PrimaryPart2 = PrimaryPart2.Position;
    end;

    local spider_web_lasso = ReplicatedStorage.Assets.Effects.spider_web_lasso;
    AnimationUtil:playAnimation(u83, GameAnimationUtil:getAssetId(AnimationType.SPIDER_GUARD_SHOOT));
    SoundManager:playSound(GameSound.SPITTER_SPIDER_SHOOT, {
        volumeMultiplier = 1,
        rollOffMaxDistance = 220,
        rollOffMinDistance = 110,
        position = PrimaryPart
    });

    if spider_web_lasso and (PrimaryPart and PrimaryPart2) then
        local Unit = (PrimaryPart2 - PrimaryPart).Unit;
        local u85 = PrimaryPart + Unit * 6;
        local v86 = PrimaryPart2 - Unit * 6;
        local u87 = spider_web_lasso:Clone();
        u87.Parent = Workspace;
        u87:PivotTo(CFrame.new(u85, v86));
        default(0.2, InQuad, function(p88) -- Line: 641
            -- upvalues: u87 (copy)
            u87:PivotTo(p88);
        end, u87.PrimaryPart.CFrame, CFrame.new(v86, PrimaryPart2));
        SoundManager:playSound(GameSound.SPITTER_SPIDER_WEB_IMPACT, {
            volumeMultiplier = 1,
            rollOffMaxDistance = 220,
            rollOffMinDistance = 110,
            position = PrimaryPart
        });
        task.delay(0.2, function() -- Line: 650
            -- upvalues: u87 (copy), u84 (copy), u85 (copy), u4 (ref), AnimationUtil (ref), u83 (copy), GameAnimationUtil (ref), AnimationType (ref)
            u87.PrimaryPart.Anchored = false;
            local PrimaryPart3 = u84.PrimaryPart;

            if PrimaryPart3 ~= nil then
                PrimaryPart3 = PrimaryPart3.Position;
            end;

            if not PrimaryPart3 then
                return nil;
            end;

            u87:PivotTo(CFrame.new(PrimaryPart3, u85) * CFrame.Angles(0, 3.141592653589793, 0));
            u4("WeldConstraint", {
                Part0 = u87.PrimaryPart,
                Part1 = u84.PrimaryPart,
                Parent = u87
            });
            task.delay(1, function() -- Line: 669
                -- upvalues: AnimationUtil (ref), u83 (ref), GameAnimationUtil (ref), AnimationType (ref), u87 (ref)
                AnimationUtil:playAnimation(u83, GameAnimationUtil:getAssetId(AnimationType.SPIDER_GUARD_PULL));
                u87:Destroy();
            end);
        end);
    end;
end;

function u8.gateOpenCutScene(u89) -- Line: 676
    -- upvalues: Workspace (copy), TweenService (copy), FadeUtil (copy), SoundManager (copy), GameSound (copy), default (copy), InQuad (copy)
    local door = u89.door;

    if door ~= nil then
        door = door:WaitForChild("CameraPosition", 3);
    end;

    local door2 = u89.door;

    if door2 ~= nil then
        door2 = door2:WaitForChild("Main", 3);
    end;

    if not (door and door2) then
        return nil;
    end;

    local CurrentCamera = Workspace.CurrentCamera;

    if not CurrentCamera then
        return nil;
    end;

    local CameraType = CurrentCamera.CameraType;
    local _ = CurrentCamera.CFrame;
    CurrentCamera.CameraType = Enum.CameraType.Scriptable;
    TweenService:Create(CurrentCamera, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        CFrame = CFrame.lookAt(door.Position, door2.Position)
    }):Play();
    task.delay(5, function() -- Line: 704
        -- upvalues: FadeUtil (ref), CurrentCamera (copy), CameraType (copy)
        FadeUtil:fade(0.5, 1, 0.5);
        task.delay(3, function() -- Line: 706
            -- upvalues: CurrentCamera (ref), CameraType (ref)
            CurrentCamera.CameraType = CameraType;
        end);
    end);
    task.delay(2, function() -- Line: 710
        -- upvalues: SoundManager (ref), GameSound (ref), default (ref), InQuad (ref), u89 (copy)
        local u90 = SoundManager:playSound(GameSound.ROCK_RUMBLE, {
            fadeOutTime = 2
        }):getInstance();

        if u90 then
            task.delay(1, function() -- Line: 715
                -- upvalues: default (ref), InQuad (ref), u90 (copy)
                default(2, InQuad, function(p91) -- Line: 716
                    -- upvalues: u90 (ref)
                    u90.Volume = p91;
                end, u90.Volume, 0);
            end);
        end;

        local door3 = u89.door;

        if door3 ~= nil then
            door3 = door3:WaitForChild("LeftSide");
        end;

        local door4 = u89.door;

        if door4 ~= nil then
            door4 = door4:WaitForChild("RightSide");
        end;

        local door5 = u89.door;

        if door5 ~= nil then
            door5 = door5:WaitForChild("LeftSideOpenPosition");
        end;

        local door6 = u89.door;

        if door6 ~= nil then
            door6 = door6:WaitForChild("RightSideOpenPosition");
        end;

        if door3 and (door4 and (door5 and door6)) then
            default(2, InQuad, function(p92) -- Line: 742
                -- upvalues: door3 (copy)
                door3:PivotTo(p92);
            end, door3.CFrame, door5.CFrame);
            default(2, InQuad, function(p93) -- Line: 745
                -- upvalues: door4 (copy)
                door4:PivotTo(p93);
            end, door4.CFrame, door6.CFrame);
        end;
    end);
end;

KnitClient.CreateController(u8.new());

return nil;