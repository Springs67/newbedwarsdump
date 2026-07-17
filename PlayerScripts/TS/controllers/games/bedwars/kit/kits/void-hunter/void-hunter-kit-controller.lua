-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
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
local Workspace = v6.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local VoidHunterKitBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "void-hunter", "void-hunter-kit-balance").VoidHunterKitBalance;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local VoidHunterMarkDurationUI = RuntimeLib.import(script, script.Parent, "ui", "void-hunter-mark-duration-ui").VoidHunterMarkDurationUI;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "VoidHunterKitController";
    end,

    __index = BaseKitController
});
u7.__index = u7;

function u7.new(...) -- Line: 44
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 48
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), GameSound (copy), BedwarsImageId (copy), u3 (copy)
    BaseKitController.constructor(p9, BedwarsKit.VOID_HUNTER, {
        sounds = {
            GameSound.VOID_HUNTER_PROJECTILE_FIRE_1,
            GameSound.VOID_HUNTER_PROJECTILE_FIRE_2,
            GameSound.VOID_HUNTER_PROJECTILE_FIRE_3,
            GameSound.VOID_HUNTER_PROJECTILE_HIT_1,
            GameSound.VOID_HUNTER_PROJECTILE_HIT_2,
            GameSound.VOID_HUNTER_PROJECTILE_HIT_3,
            GameSound.VOID_HUNTER_CHASING_LOOP,
            GameSound.VOID_HUNTER_DETONATE_1,
            GameSound.VOID_HUNTER_DETONATE_2
        },
        imageIds = {
            BedwarsImageId.VOID_HUNTER_DETONATE_ABILITY_ICON,
            BedwarsImageId.VOID_HUNTER_PROJECTILE_ABILITY_ICON,
            BedwarsImageId.VOID_HUNTER_MARKED_STATUS_EFFECT_ICON,
            BedwarsImageId.VOID_HUNTER_CHASING_STATUS_EFFECT_ICON
        },
        animations = {}
    });
    p9.Name = "VoidHunterKitController";
    p9.beamTransparencyNumberSequence_transparent = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0.8), NumberSequenceKeypoint.new(1, 1) });
    p9.beamTransparencyNumberSequence_opaque = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1) });
    p9.speedMaid = u3.new();
    p9.entityMarkEffectsMaidMap = {};
    p9.aimMaid = u3.new();
    p9.initialized = false;
    p9.hasValidAim = false;
    p9.kitMaid = u3.new();
    p9.markDurationUIMaid = u3.new();
    p9.chasingMaid = u3.new();
    p9.defaultProjectileFireSounds = { GameSound.VOID_HUNTER_PROJECTILE_FIRE_1, GameSound.VOID_HUNTER_PROJECTILE_FIRE_2, GameSound.VOID_HUNTER_PROJECTILE_FIRE_3 };
    p9.defaultProjectileHitSounds = { GameSound.VOID_HUNTER_PROJECTILE_HIT_1, GameSound.VOID_HUNTER_PROJECTILE_HIT_2, GameSound.VOID_HUNTER_PROJECTILE_HIT_3 };
    p9.defaultDetonateSounds = { GameSound.VOID_HUNTER_DETONATE_1, GameSound.VOID_HUNTER_DETONATE_2 };
end;

function u7.KnitStart(p10) -- Line: 69
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p10);
end;

function u7.onKitLocalActivated(p11, p12) -- Line: 72
end;

function u7.onKitLocalDeactivated(p13) -- Line: 74
end;

function u7.onKitReplicationActivated(u14, p15) -- Line: 76
    -- upvalues: ClientSyncEvents (copy), StatusEffectType (copy), Players (copy), KnitClient (copy), VoidHunterKitBalance (copy), GameSound (copy), KnitClient2 (copy), BedwarsKitSkinMeta (copy), SoundManager (copy), default (copy), EntityUtil (copy), Flamework (copy), AbilityId (copy)
    ClientSyncEvents.StatusEffectAdded:connect(function(p16) -- Line: 78
        -- upvalues: StatusEffectType (ref), Players (ref), u14 (copy), KnitClient (ref), VoidHunterKitBalance (ref), GameSound (ref), KnitClient2 (ref), BedwarsKitSkinMeta (ref), SoundManager (ref)
        if p16.statusEffect ~= StatusEffectType.VOID_HUNTER_BOOSTED then
            return nil;
        end;

        local v17 = Players:GetPlayerFromCharacter(p16.entityInstance);

        if not v17 then
            return nil;
        end;

        if v17 ~= Players.LocalPlayer then
            return nil;
        end;

        u14.speedMaid:DoCleaning();
        local v18 = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
            moveSpeedMultiplier = VoidHunterKitBalance.SPEED_BOOST_MULTIPLIER
        });
        u14.speedMaid:GiveTask(v18);
        u14.chasingMaid:DoCleaning();
        local VOID_HUNTER_CHASING_LOOP = GameSound.VOID_HUNTER_CHASING_LOOP;
        local Character = v17.Character;

        if Character then
            local v19 = BedwarsKitSkinMeta[KnitClient2.Controllers.KitSkinController:getKitSkin(Character)];

            if v19.skoll then
                VOID_HUNTER_CHASING_LOOP = v19.skoll.chasingLoopSound;
            end;
        end;

        local v20 = SoundManager:playSound(VOID_HUNTER_CHASING_LOOP, {
            looped = true
        });
        u14.chasingMaid:GiveTask(v20);
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p21) -- Line: 111
        -- upvalues: StatusEffectType (ref), Players (ref), u14 (copy)
        if p21.statusEffect ~= StatusEffectType.VOID_HUNTER_BOOSTED then
            return nil;
        end;

        local v22 = Players:GetPlayerFromCharacter(p21.entityInstance);

        if not v22 then
            return nil;
        end;

        if v22 ~= Players.LocalPlayer then
            return nil;
        end;

        u14.speedMaid:DoCleaning();
        u14.chasingMaid:DoCleaning();
    end);
    default.Client:Get("VoidHunter_TargetMarked"):Connect(function(p23) -- Line: 126
        -- upvalues: EntityUtil (ref), Players (ref), u14 (copy), Flamework (ref), AbilityId (ref)
        local v24 = EntityUtil:getPlayerFromEntityInstance(p23.targetEntityInstance);

        if (p23.userPlayer == Players.LocalPlayer or v24 == Players.LocalPlayer) and p23.targetEntityInstance then
            u14:markTarget(p23.userPlayer, p23.targetEntityInstance, p23.serverStartTime, p23.serverEndTime);
        end;

        if p23.userPlayer == Players.LocalPlayer then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.VOID_HUNTER_DETONATE, nil);
        end;
    end);
    default.Client:Get("VoidHunter_TargetMarkRemoved"):Connect(function(p25) -- Line: 139
        -- upvalues: EntityUtil (ref), Players (ref), u14 (copy), Flamework (ref), AbilityId (ref)
        local v26 = EntityUtil:getPlayerFromEntityInstance(p25.targetEntityInstance);

        if (p25.userPlayer == Players.LocalPlayer or v26 == Players.LocalPlayer) and p25.targetEntityInstance then
            u14:removeMark(p25.userPlayer, p25.targetEntityInstance);
        end;

        if p25.userPlayer == Players.LocalPlayer then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(AbilityId.VOID_HUNTER_DETONATE);
        end;
    end);
    default.Client:Get("VoidHunter_TargetDetonated"):Connect(function(p27) -- Line: 152
        -- upvalues: u14 (copy)
        u14:detonateMark(p27.userPlayer, p27.targetEntityInstance);
    end);
    default.Client:Get("VoidHunter_MarkAbilityUsed"):Connect(function(p28) -- Line: 156
        -- upvalues: u14 (copy)
        u14:useMarkAbility(p28.userPlayer, p28.originPosition, p28.direction, p28.startTime, p28.uuid, p28.targetEntityInstance);
    end);
end;

function u7.onKitReplicationDeactivated(p29) -- Line: 160
end;

function u7.onInnateAbilityEnabled(p30, p31, p32) -- Line: 162
end;

function u7.onAbilityUsed(p33, p34, p35) -- Line: 164
    -- upvalues: EntityUtil (copy), Players (copy), AbilityId (copy), Workspace (copy), KnitClient (copy), default (copy)
    local v36 = EntityUtil:getPlayerFromEntityInstance(p35.userCharacter);

    if not v36 then
        return nil;
    end;

    if v36 ~= Players.LocalPlayer then
        return nil;
    end;

    if p35.ability == AbilityId.VOID_HUNTER_MARK then
        local Position = p34.PrimaryPart.Position;

        if not Position then
            return nil;
        end;

        local LookVector = Workspace.CurrentCamera.CFrame.LookVector;

        if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 1 then
            LookVector = Vector3.new(LookVector.X, LookVector.Y + 0.35, LookVector.Z);
        end;

        if not LookVector then
            return nil;
        end;

        default.Client:Get("VoidHunter_MarkAbilityRequest"):SendToServer({
            originPosition = Position,
            direction = LookVector
        });
    end;
end;

function u7.useMarkAbility(p37, p38, p39, p40, u41, u42, u43) -- Line: 190
    -- upvalues: u3 (copy), ReplicatedStorage (copy), KnitClient2 (copy), BedwarsKitSkinMeta (copy), SoundManager (copy), RandomUtil (copy), Workspace (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), default (copy), RunService (copy), VoidHunterKitBalance (copy)
    local u44 = u3.new();
    local VoidHunter_WolfProjectile = ReplicatedStorage.Assets.Misc.VoidHunter_WolfProjectile;
    local defaultProjectileFireSounds = p37.defaultProjectileFireSounds;
    local Character = p38.Character;

    if Character then
        local v45 = BedwarsKitSkinMeta[KnitClient2.Controllers.KitSkinController:getKitSkin(Character)];

        if v45.skoll then
            VoidHunter_WolfProjectile = v45.skoll.wolfModel;
            defaultProjectileFireSounds = v45.skoll.projectileFireSounds;
        end;
    end;

    SoundManager:playSound(RandomUtil.fromList(unpack(defaultProjectileFireSounds)), {
        position = p39
    });
    local u46 = VoidHunter_WolfProjectile:Clone();
    u46:PivotTo(CFrame.new(p39, p39 + p40));
    u46.Parent = Workspace;
    u44:GiveTask(function() -- Line: 215
        -- upvalues: u46 (copy)
        u46:Destroy();
    end);
    AnimationUtil:playAnimation(u46.Pivot.WolfRig.AnimationController.Animator, GameAnimationUtil:getAssetId(AnimationType.VOID_HUNTER_WOLF_IDLE), {
        looped = true
    });
    local u48 = default.Client:Get("VoidHunter_ProjectileTargetFound"):Connect(function(p47) -- Line: 231
        -- upvalues: u42 (copy), u43 (ref)
        if p47.uuid ~= u42 then
            return nil;
        end;

        u43 = p47.targetEntityInstance;
    end);
    u44:GiveTask(function() -- Line: 237
        -- upvalues: u48 (copy)
        u48:Disconnect();
    end);
    local u56 = RunService.Heartbeat:Connect(function(p49) -- Line: 242
        -- upvalues: Workspace (ref), u41 (copy), VoidHunterKitBalance (ref), u44 (copy), u46 (copy), u43 (ref)
        if Workspace:GetServerTimeNow() - u41 > VoidHunterKitBalance.MARK_PROJECTILE_DURATION then
            u44:DoCleaning();

            return nil;
        end;

        local _ = u46:GetPivot().Position;
        local Unit = u46:GetPivot().LookVector.Unit;

        if u43 ~= nil then
            local Unit2 = (u43.PrimaryPart.Position - u46:GetPivot().Position).Unit;
            local v50 = Unit:Dot(Unit2);
            local v51 = math.acos(v50);
            local v52 = math.deg(v51);
            local v53 = math.min(v52, VoidHunterKitBalance.MARK_PROJECTILE_ANGLE_LIMIT_DEGREES_PER_SECOND * p49);

            if Unit ~= Unit2 and v52 > 1 then
                Unit = Unit:Lerp(Unit2, v53 / v52).Unit;
            end;
        end;

        local v54 = VoidHunterKitBalance.MARK_PROJECTILE_SPEED * p49;
        local v55 = u46:GetPivot().Position + Unit * v54;
        u46:PivotTo(CFrame.new(v55, v55 + Unit * v54));
    end);
    u44:GiveTask(function() -- Line: 284
        -- upvalues: u56 (copy)
        u56:Disconnect();
    end);
    local u61 = default.Client:Get("VoidHunter_ProjectileHit"):Connect(function(p57) -- Line: 288
        -- upvalues: u42 (copy), u46 (copy), KnitClient2 (ref), BedwarsKitSkinMeta (ref), ReplicatedStorage (ref), Workspace (ref), u44 (copy)
        if p57.uuid ~= u42 then
            return nil;
        end;

        local Position = u46:GetPivot().Position;
        local hitEntityInstance = p57.hitEntityInstance;

        if hitEntityInstance ~= nil then
            hitEntityInstance = hitEntityInstance.PrimaryPart;
        end;

        if hitEntityInstance then
            Position = p57.hitEntityInstance.PrimaryPart.Position;
        end;

        local v58 = BedwarsKitSkinMeta[KnitClient2.Controllers.KitSkinController:getKitSkin(p57.hitEntityInstance)];
        local v59;

        if v58.skoll then
            v59 = v58.skoll.hitEffectColor;
        else
            v59 = nil;
        end;

        local u60 = ReplicatedStorage.Assets.Effects.VoidHunterProjectileHitParticles:Clone();

        if v59 then
            u60.Color = v59;
        end;

        u60:PivotTo(CFrame.new(Position));
        u60.Parent = Workspace;
        u60.ParticleEmitter:Emit(60);
        task.delay(5, function() -- Line: 315
            -- upvalues: u60 (copy)
            u60:Destroy();
        end);
        u44:DoCleaning();
    end);
    u44:GiveTask(function() -- Line: 360
        -- upvalues: u61 (copy)
        u61:Disconnect();
    end);
end;

function u7.markTarget(p62, p63, p64, p65, p66) -- Line: 364
    -- upvalues: EntityUtil (copy), KnitClient2 (copy), BedwarsKitSkinMeta (copy), SoundManager (copy), RandomUtil (copy), u3 (copy), u4 (copy), Players (copy), ReplicatedStorage (copy), WeldUtil (copy), KnitClient (copy), Flamework (copy), u5 (copy), VoidHunterMarkDurationUI (copy)
    local v67 = EntityUtil:getPlayerFromEntityInstance(p64);
    local PrimaryPart = p64.PrimaryPart;

    if not PrimaryPart then
        return nil;
    end;

    local defaultProjectileHitSounds = p62.defaultProjectileHitSounds;
    local v68 = nil;
    local Character = p63.Character;

    if Character then
        local v69 = BedwarsKitSkinMeta[KnitClient2.Controllers.KitSkinController:getKitSkin(Character)];

        if v69.skoll then
            defaultProjectileHitSounds = v69.skoll.projectileHitSounds;
            v68 = v69.skoll.markEffectColor;
        end;
    end;

    SoundManager:playSound(RandomUtil.fromList(unpack(defaultProjectileHitSounds)), {
        position = PrimaryPart.Position
    });
    local v70 = p62.entityMarkEffectsMaidMap[p64];

    if not v70 then
        v70 = u3.new();
        p62.entityMarkEffectsMaidMap[p64] = v70;
    end;

    local v71 = PrimaryPart:FindFirstChild("VoidHunter_MarkTrailAttachment1") or u4("Attachment", {
        Name = "VoidHunter_MarkTrailAttachment1",
        Position = Vector3.new(0, -0.5, 0),
        Parent = PrimaryPart
    });
    local v72 = PrimaryPart:FindFirstChild("VoidHunter_MarkTrailAttachment2") or u4("Attachment", {
        Name = "VoidHunter_MarkTrailAttachment2",
        Position = Vector3.new(0, 0.5, 0),
        Parent = PrimaryPart
    });
    local VoidHunter_MarkTrail = PrimaryPart:FindFirstChild("VoidHunter_MarkTrail");

    if not VoidHunter_MarkTrail then
        if v67 == Players.LocalPlayer then
            VoidHunter_MarkTrail = u4("Trail", {
                Name = "VoidHunter_MarkTrail",
                Lifetime = 999999999999,
                Attachment0 = v71,
                Attachment1 = v72,
                Parent = PrimaryPart,
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(79, 74, 77)), ColorSequenceKeypoint.new(1, Color3.fromRGB(156, 140, 148)) }),
                Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.6), NumberSequenceKeypoint.new(1, 0.6) })
            });
        else
            VoidHunter_MarkTrail = u4("Trail", {
                Name = "VoidHunter_MarkTrail",
                Lifetime = 999999999999,
                Attachment0 = v71,
                Attachment1 = v72,
                Parent = PrimaryPart,
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(84, 10, 43)), ColorSequenceKeypoint.new(1, Color3.fromRGB(163, 77, 115)) })
            });
        end;
    end;

    VoidHunter_MarkTrail.Enabled = true;
    v70:GiveTask(function() -- Line: 442
        -- upvalues: VoidHunter_MarkTrail (ref)
        if VoidHunter_MarkTrail and VoidHunter_MarkTrail.Parent ~= nil then
            VoidHunter_MarkTrail:Destroy();
        end;
    end);
    local VoidHunterMarkParticles = PrimaryPart:FindFirstChild("VoidHunterMarkParticles");

    if not VoidHunterMarkParticles then
        VoidHunterMarkParticles = ReplicatedStorage.Assets.Misc.VoidHunterMarkParticles:Clone();
        VoidHunterMarkParticles.Anchored = false;
        VoidHunterMarkParticles:PivotTo(CFrame.new(PrimaryPart.Position));
        VoidHunterMarkParticles.Parent = PrimaryPart;
        WeldUtil:weldParts(VoidHunterMarkParticles, PrimaryPart);
    end;

    local ParticleEmitter = VoidHunterMarkParticles:FindFirstChild("ParticleEmitter");

    if ParticleEmitter then
        if v68 then
            ParticleEmitter.Color = ColorSequence.new(v68);
        end;

        local v73 = KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0;

        if v67 == Players.LocalPlayer and v73 then
            ParticleEmitter.Enabled = false;
        else
            ParticleEmitter.Enabled = true;
        end;
    end;

    v70:GiveTask(function() -- Line: 468
        -- upvalues: ParticleEmitter (copy)
        if ParticleEmitter then
            ParticleEmitter.Enabled = false;
        end;
    end);

    if p63 == Players.LocalPlayer then
        local u74 = u4("Highlight", {
            Name = "VoidHunterHighlight",
            FillTransparency = 0.5,
            OutlineTransparency = 1,
            Parent = p64,
            FillColor = Color3.fromRGB(207, 0, 38),
            DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        });
        v70:GiveTask(function() -- Line: 483
            -- upvalues: u74 (copy)
            return u74:Destroy();
        end);
    end;

    if p63 == Players.LocalPlayer then
        p62.markDurationUIMaid:DoCleaning();
        local v75 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u5.createElement(VoidHunterMarkDurationUI, {
            HideOnComplete = true,
            Size = UDim2.fromScale(0.3, 0.03),
            StartTime = p65,
            EndTime = p66,
            ProgressBarConfig = {
                Flip = true,
                GradientRotation = 0,
                BarGradient = ColorSequence.new(Color3.fromRGB(184, 46, 82), Color3.fromRGB(140, 36, 36))
            }
        }));
        p62.markDurationUIMaid:GiveTask(v75);
    end;
end;

function u7.removeMark(p76, p77, p78) -- Line: 506
    -- upvalues: Players (copy)
    if p77 == Players.LocalPlayer then
        p76.speedMaid:DoCleaning();
        p76.chasingMaid:DoCleaning();
    end;

    local v79 = p76.entityMarkEffectsMaidMap[p78];

    if not v79 then
        return nil;
    end;

    v79:DoCleaning();

    if p77 == Players.LocalPlayer then
        p76.markDurationUIMaid:DoCleaning();
    end;
end;

function u7.detonateMark(p80, p81, p82) -- Line: 524
    -- upvalues: KnitClient2 (copy), BedwarsKitSkinMeta (copy), SoundManager (copy), RandomUtil (copy), ReplicatedStorage (copy), Workspace (copy)
    local PrimaryPart = p82.PrimaryPart;

    if not PrimaryPart then
        return nil;
    end;

    local defaultDetonateSounds = p80.defaultDetonateSounds;
    local v83 = nil;
    local Character = p81.Character;

    if Character then
        local v84 = BedwarsKitSkinMeta[KnitClient2.Controllers.KitSkinController:getKitSkin(Character)];

        if v84.skoll then
            defaultDetonateSounds = v84.skoll.detonateSounds;
            v83 = v84.skoll.detonateEffectColor;
        end;
    end;

    SoundManager:playSound(RandomUtil.fromList(unpack(defaultDetonateSounds)), {
        position = PrimaryPart.Position
    });
    local u85 = ReplicatedStorage.Assets.Effects.VoidHunterDetonateParticles:Clone();

    if v83 then
        u85.Color = v83;
    end;

    u85:PivotTo(CFrame.new(PrimaryPart.Position));
    u85.Parent = Workspace;
    u85.ParticleEmitter:Emit(120);
    task.delay(5, function() -- Line: 552
        -- upvalues: u85 (copy)
        u85:Destroy();
    end);
end;

function u7.setTransparencyOfWolfProjectile(u86, p87, u88) -- Line: 556
    if p87 ~= nil then
        local Pivot = p87:FindFirstChild("Pivot");

        if Pivot ~= nil then
            local function _(p89) -- Line: 563
                -- upvalues: u88 (copy)
                if p89:IsA("MeshPart") then
                    p89.Transparency = u88 and 0.6 or 0;
                end;
            end;

            for i, child in Pivot:GetChildren() do
                local _ = i - 1;

                if child:IsA("MeshPart") then
                    child.Transparency = u88 and 0.6 or 0;
                end;
            end;
        end;
    end;

    if p87 ~= nil then
        local Pivot = p87:FindFirstChild("Pivot");

        if Pivot ~= nil then
            local Head2 = Pivot:FindFirstChild("Head2");

            if Head2 ~= nil then
                local function _(p90) -- Line: 581
                    -- upvalues: u88 (copy), u86 (copy)
                    if p90:IsA("Beam") then
                        local v91;

                        if u88 then
                            v91 = u86.beamTransparencyNumberSequence_transparent;
                        else
                            v91 = u86.beamTransparencyNumberSequence_opaque;
                        end;

                        p90.Transparency = v91;
                    end;
                end;

                for i, child in Head2:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("Beam") then
                        local v92;

                        if u88 then
                            v92 = u86.beamTransparencyNumberSequence_transparent;
                        else
                            v92 = u86.beamTransparencyNumberSequence_opaque;
                        end;

                        child.Transparency = v92;
                    end;
                end;
            end;
        end;
    end;
end;

KnitClient.CreateController(u7.new());

return nil;