-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local ColorUtil = v1.ColorUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "constants", "winter-event-scene-constants");
local BossAction = v4.BossAction;
local BossState = v4.BossState;
local WINTER_BOSS_TAG = v4.WINTER_BOSS_TAG;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u5 = ColorSequence.new(ColorUtil.hexColor(7793650), ColorUtil.hexColor(610681));
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 63, Name: __tostring
        return "WinterBossController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 69
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 73
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "WinterBossController";
    p8.propsDestroyed = false;
end;

function u6.KnitStart(p9) -- Line: 78
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p9);
    p9:listenForBossSpawnRequest();
    p9:listenForBossFightStart();
    p9:listenForBossStateUpdates();
    p9:listenForBossActions();
    p9:listenForBossSpinRequest();
    p9:listenForAxeSpin();
    p9:listenForPenguin();
end;

function u6.listenForPenguin(p10) -- Line: 88
    -- upvalues: default (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    default.Client:Get("BigPenguinAttack"):Connect(function(p11) -- Line: 89
        -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        local PrimaryPart = p11.model.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if PrimaryPart then
            SoundManager:playSound(RandomUtil.fromList(unpack({ GameSound.PENGUIN_ATTACK_1, GameSound.PENGUIN_ATTACK_2, GameSound.PENGUIN_ATTACK_3 })), {
                volumeMultiplier = 0.7,
                rollOffMaxDistance = 110,
                rollOffMinDistance = 50,
                position = PrimaryPart
            });
        end;

        AnimationUtil:playAnimation(p11.model, GameAnimationUtil:getAssetId(AnimationType.BIG_PENGUIN_ATTACK));
    end);
end;

function u6.listenForAxeSpin(u12) -- Line: 106
    -- upvalues: default (copy), ReplicatedStorage (copy), u2 (copy), GameSound (copy), RunService (copy), Workspace (copy)
    default.Client:Get("WinterEventAxeSpin"):Connect(function(u13) -- Line: 107
        -- upvalues: ReplicatedStorage (ref), u12 (copy), u2 (ref), GameSound (ref), RunService (ref), Workspace (ref)
        local u14 = ReplicatedStorage.Assets.Effects.IceHammer:Clone();
        local u15 = 0;
        u14.Parent = u13.part;
        u12:handleEnterAxeSpinState(u13.targetPosition);
        u2("Sound", {
            RollOffMinDistance = 100,
            RollOffMaxDistance = 240,
            Volume = 0.7,
            Playing = true,
            PlaybackSpeed = 1,
            Looped = true,
            SoundId = GameSound.FROST_STORM_LOOP,
            Parent = u13.part
        }):Play();
        local u16 = nil;
        u16 = RunService.Heartbeat:Connect(function(p17) -- Line: 124
            -- upvalues: u13 (copy), Workspace (ref), u12 (ref), u16 (ref), u15 (ref), u14 (copy)
            if u13.part.Parent ~= Workspace then
                u12:showAxe();
                u16:Disconnect();
            end;

            u15 = u15 + p17;
            u14:PivotTo(CFrame.new(u13.part.Position) * CFrame.Angles(1.5707963267948966, 0, u15 * 3 * 3.141592653589793));
        end);
    end);
end;

function u6.listenForBossSpawnRequest(u18) -- Line: 137
    -- upvalues: default (copy), WatchCollectionTag (copy), WINTER_BOSS_TAG (copy)
    default.Client:WaitFor("WinterEventBossSpawned"):expect():Connect(function(p19) -- Line: 139
        -- upvalues: u18 (copy)
        u18.bossAssets = p19.bossAssets;
        u18:spawnBoss();
    end);
    WatchCollectionTag(WINTER_BOSS_TAG, function(p20) -- Line: 144
        -- upvalues: u18 (copy)
        u18.bossServerInstance = p20;
    end);
end;

function u6.listenForBossFightStart(u21) -- Line: 148
    -- upvalues: default (copy)
    default.Client:WaitFor("WinterEventBossFightStart"):expect():Connect(function() -- Line: 149
        -- upvalues: u21 (copy)
        u21:startBossFight();
    end);
end;

function u6.spawnHealthbar(u22) -- Line: 153
    -- upvalues: EntityUtil (copy), KnitClient (copy), u5 (copy)
    task.delay(1.5, function() -- Line: 154
        -- upvalues: u22 (copy), EntityUtil (ref), KnitClient (ref), u5 (ref)
        if not u22.bossServerInstance then
            return nil;
        end;

        local v23 = EntityUtil:getEntity(u22.bossServerInstance);

        if v23 then
            KnitClient.Controllers.BossBarController:mountEntityBossBar(v23, {
                DisplayName = "ADETUNDE",
                Gradient = u5
            });
        end;
    end);
end;

function u6.listenForBossStateUpdates(u24) -- Line: 167
    -- upvalues: default (copy)
    default.Client:WaitFor("WinterEventBossStateUpdate"):expect():Connect(function(p25) -- Line: 168
        -- upvalues: u24 (copy)
        u24:setState(p25.state);
    end);
end;

function u6.listenForBossActions(u26) -- Line: 172
    -- upvalues: default (copy)
    default.Client:WaitFor("WinterEventBossAction"):expect():Connect(function(p27) -- Line: 173
        -- upvalues: u26 (copy)
        u26:routeBossAction(p27.action, p27.actionData);
    end);
end;

function u6.routeBossAction(p28, p29, p30) -- Line: 177
    -- upvalues: BossAction (copy)
    if p29 == BossAction.MOVE then
        p28:handleMoveAction(p30);

        return;
    end;

    if p29 == BossAction.DROP_ICICLES then
        p28:handleDropIciclesAction(p30);

        return;
    end;

    if p29 == BossAction.CREATE_FROST then
        p28:handleCreateFrostAction(p30);

        return;
    end;

    if p29 == BossAction.CREATE_SPIKES then
        p28:handleCreateSpikesAction(p30);

        return;
    end;

    if p29 == BossAction.PULL_TO_CENTER then
        p28:handlePullToCenterAction(p30);

        return;
    end;

    if p29 == BossAction.THROW_AXE then
        p28:handleAxeThrowAction(p30);
    end;
end;

function u6.handleCreateFrostAction(p31, p32) -- Line: 198
end;

function u6.handleCreateSpikesAction(p33, p34) -- Line: 200
end;

function u6.handlePullToCenterAction(p35, p36) -- Line: 202
    p35:pullToCenter(p36.impulse);
end;

function u6.handleMoveAction(u37, u38) -- Line: 206
    -- upvalues: BossState (copy)
    local bossModel = u37.bossModel;

    if bossModel ~= nil then
        bossModel = bossModel.PrimaryPart;
    end;

    if not bossModel then
        return nil;
    end;

    if typeof(u38.position) == "Vector3" then
        u37:moveTo(u38.position, u38.moveSpeed);

        return;
    end;

    local position = u38.position;
    task.spawn(function() -- Line: 220
        -- upvalues: u37 (copy), BossState (ref), u38 (copy), position (copy)
        local function _(p39) -- Line: 221
            -- upvalues: u37 (ref), BossState (ref), u38 (ref)
            if u37.bossState == BossState.DEAD then
                return nil;
            end;

            u37:moveTo(p39, u38.moveSpeed):expect();
        end;

        for i, v in position do
            local _ = i - 1;

            if u37.bossState ~= BossState.DEAD then
                u37:moveTo(v, u38.moveSpeed):expect();
            end;
        end;
    end);
end;

function u6.moveTo(u40, u41, u42) -- Line: 234
    -- upvalues: RuntimeLib (copy), BossState (copy), TweenService (copy)
    return RuntimeLib.Promise.new(function(u43, u44) -- Line: 235
        -- upvalues: u40 (copy), BossState (ref), u41 (copy), u42 (copy), TweenService (ref)
        task.spawn(function() -- Line: 236
            -- upvalues: u40 (ref), u44 (copy), BossState (ref), u41 (ref), u42 (ref), u43 (copy), TweenService (ref)
            local bossModel = u40.bossModel;

            if bossModel ~= nil then
                bossModel = bossModel.PrimaryPart;
            end;

            if not bossModel then
                u44();

                return nil;
            end;

            if u40.bossState == BossState.DEAD then
                u44();

                return nil;
            end;

            local new = CFrame.new;
            local X = u41.X;
            local Y = u40.bossModel:GetPivot().Position.Y;
            local v45 = new((Vector3.new(X, Y, u41.Z)));
            local v46 = { CFrame.lookAt(u40.bossModel:GetPivot().Position, v45.Position):ToEulerAnglesYXZ() };
            local u47 = v45 * CFrame.Angles(0, v46[2], 0);
            local v48 = u40.bossModel:GetPrimaryPartCFrame():Lerp(u47, 0.25);
            local v49 = u47 - u47.Position;
            local v50 = CFrame.new(v48.Position) * v49;
            local v51 = u40:getTravelTweenInfo(v50.Position, u42);

            if v51.Time == 0 then
                u43();

                return nil;
            end;

            local v52 = TweenService:Create(u40.bossModel.PrimaryPart, v51, {
                CFrame = v50
            });
            u40.activeMovementTween = v52;
            v52.Completed:Connect(function() -- Line: 279
                -- upvalues: u40 (ref), u47 (ref), u42 (ref), TweenService (ref), u43 (ref)
                local v53 = u40:getTravelTweenInfo(u47.Position, u42);
                local v54 = TweenService:Create(u40.bossModel.PrimaryPart, v53, {
                    CFrame = u47
                });
                u40.activeMovementTween = v54;
                v54:Play();
                v54.Completed:Wait();
                u43();
            end);
            v52:Play();
        end);
    end);
end;

function u6.getTravelTweenInfo(p55, p56, p57) -- Line: 294
    local v58 = p55:getTravelDuration(p56, p57);

    return TweenInfo.new(v58, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
end;

function u6.getTravelDuration(p59, p60, p61) -- Line: 298
    if not p59.bossModel then
        return 0;
    end;

    local v62 = (p59.bossModel:GetPivot().Position - p60).Magnitude / p61;

    return math.abs(v62);
end;

function u6.handleDropIciclesAction(u63, u64) -- Line: 307
    -- upvalues: BossState (copy)
    task.spawn(function() -- Line: 308
        -- upvalues: u64 (copy), u63 (copy), BossState (ref)
        task.delay(0.3, function() -- Line: 309
            -- upvalues: u64 (ref), u63 (ref), BossState (ref)
            if u64.positions then
                local function _(p65) -- Line: 313
                    -- upvalues: u63 (ref), BossState (ref)
                    if u63.bossState == BossState.DEAD then
                        return nil;
                    end;

                    u63:createIcicle(p65);
                end;

                for i, v in u64.positions do
                    local _ = i - 1;

                    if u63.bossState ~= BossState.DEAD then
                        u63:createIcicle(v);
                    end;
                end;
            end;

            if u64.follow then
                task.spawn(function() -- Line: 328
                    -- upvalues: u64 (ref), u63 (ref), BossState (ref)
                    if not u64.follow then
                        return nil;
                    end;

                    task.wait(1);
                    local v66 = math.ceil(u64.follow.duration / u64.follow.interval);

                    while v66 > 0 and u63.bossState ~= BossState.DEAD do
                        v66 = v66 - 1;

                        local function _(p67) -- Line: 343
                            -- upvalues: u63 (ref)
                            u63:createIcicle(p67:getInstance():GetPivot().Position);
                        end;

                        for i, v in u63:getAlivePlayerEntities() do
                            local _ = i - 1;
                            u63:createIcicle(v:getInstance():GetPivot().Position);
                        end;

                        task.wait(u64.follow.interval);
                    end;
                end);
            end;
        end);
    end);
end;

function u6.createIcicle(u68, p69) -- Line: 357
    -- upvalues: ReplicatedStorage (copy), Workspace (copy)
    local u70 = ReplicatedStorage.Assets.Misc.Icicle:Clone();
    u70.Position = Vector3.new(p69.X, 950, p69.Z);
    u70.CollisionGroup = "IcicleGroup";
    u70.Parent = Workspace;
    u70.Anchored = false;
    local u71 = nil;
    u71 = u70.Touched:Connect(function(p72) -- Line: 367
        -- upvalues: u71 (ref), u68 (copy), u70 (copy)
        u71:Disconnect();
        u68:onIcicleCollision(p72, u70);
        task.delay(0.3, function() -- Line: 371
            -- upvalues: u70 (ref)
            return u70:Destroy();
        end);
    end);
    u68:createIcicleGroundIndicator(u70);

    return u70;
end;

function u6.createIcicleGroundIndicator(p73, p74) -- Line: 379
    -- upvalues: u2 (copy), TweenService (copy)
    if not p73.bossAssets then
        return nil;
    end;

    TweenService:Create(u2("Part", {
        Name = "GroundIndicator",
        Size = Vector3.new(0.1, 5, 5),
        Transparency = 0.3,
        CastShadow = false,
        Orientation = Vector3.new(0, 0, 90),
        Anchored = true,
        CanCollide = false,
        CanTouch = false,
        CanQuery = false,
        Position = Vector3.new(p74.Position.X, p73.bossAssets.Platforms.BossFight.PlatformCenter.Position.Y - 0.2, p74.Position.Z),
        Color = Color3.fromRGB(255, 0, 0),
        Shape = Enum.PartType.Cylinder,
        Parent = p74
    }), TweenInfo.new(2.25, Enum.EasingStyle.Sine), {
        Size = Vector3.new(0.1, 12, 12),
        Transparency = 1
    }):Play();
end;

function u6.onIcicleCollision(p75, p76, p77) -- Line: 415
    -- upvalues: Players (copy), default (copy)
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    if p76.Name ~= "BossFight" and p76:IsDescendantOf(Character) then
        default.Client:Get("WinterEventBossIcicleHit"):SendToServer({
            nearHit = false
        });

        return;
    end;

    p75:playIcicleCollisionEffect(p77.Position);
    p75:checkForIcicleNearHit(p77.Position);
end;

function u6.checkForIcicleNearHit(p78, p79) -- Line: 435
    -- upvalues: Players (copy), default (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    if (p79 - Character).Magnitude <= 15.5 then
        default.Client:Get("WinterEventBossIcicleHit"):SendToServer({
            nearHit = true
        });
    end;
end;

function u6.playIcicleCollisionEffect(p80, p81) -- Line: 454
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), Players (copy), GameSound (copy)
    local v82 = p80:getGroundNormalizedPosition(p81);
    local v83 = ReplicatedStorage.Assets.Effects.SnowDebris:Clone();
    v83.Position = v82;
    v83.Parent = Workspace;
    EffectUtil:playEffects({ v83 }, nil, {
        destroyAfterSec = 1
    });
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:GetPivot().Position;
    end;

    if not Character then
        return nil;
    end;

    if (v82 - Character).Magnitude <= 25 then
        p80:playScreenShake(Vector3.new(0, 0, 0), (Character - v82).Unit);
    end;

    p80:playSound(GameSound.WINTER_BOSS_ICICLE_IMPACT, {
        rollOffMaxDistance = 200,
        volumeMultiplier = 2.5,
        position = v82
    });
end;

function u6.spawnBoss(p84) -- Line: 492
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), BossState (copy)
    p84.bossModel = ReplicatedStorage.Assets.Misc.MinigameMountain.WinterEventBoss:Clone();
    local CFrame2 = p84.bossAssets.Platforms.BossFight.BossSpawn.CFrame;
    local v85 = p84.bossModel:GetExtentsSize().Y / 2;
    local v86 = CFrame2 + Vector3.new(0, v85, 0);
    p84.bossModel:PivotTo(v86);
    p84.bossModel.PrimaryPart.Anchored = true;
    p84.bossModel.Parent = Workspace;
    p84:setState(BossState.FROZEN);
    p84:spawnBossCube(v86);
end;

function u6.startBossFight(p87) -- Line: 505
    p87:playSpawnAnimation();
    p87:spawnHealthbar();
    p87:startBossTrack();
end;

function u6.playSpawnAnimation(u88) -- Line: 513
    if not u88.bossAnimation then
        return nil;
    end;

    u88.bossAnimation:AdjustSpeed(1);

    if not u88.bossCube then
        return nil;
    end;

    local u89 = u88.bossCube:GetChildren();
    task.delay(1.5, function() -- Line: 525
        -- upvalues: u88 (copy), u89 (copy)
        local bossCube = u88.bossCube;

        if bossCube ~= nil then
            bossCube = bossCube:GetPivot().Position;
        end;

        if bossCube then
            u88:playCubeExplosionEffect(bossCube);
        end;

        local function v94(p90) -- Line: 536
            local v91 = math.random(-200, 200);
            local v92 = math.random(300, 400);
            local v93 = Vector3.new(v91, v92, math.random(-200, 200)) * p90.Mass;
            p90.Anchored = false;
            p90:ApplyImpulse(v93);
        end;

        for i, v in u89 do
            v94(v, i - 1, u89);
        end;
    end);
end;

function u6.spawnBossCube(p95, p96) -- Line: 548
    -- upvalues: ReplicatedStorage (copy), Workspace (copy)
    p95.bossCube = ReplicatedStorage.Assets.Misc.IceBlock:Clone();
    p95.bossCube:PivotTo(p96);
    p95.bossCube.Parent = Workspace;
end;

function u6.playCubeExplosionEffect(p97, p98) -- Line: 553
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), GameSound (copy)
    local v99 = ReplicatedStorage.Assets.Effects.IceBreakEffect:Clone();
    v99.Position = p98;
    v99.Transparency = 1;
    v99.Parent = Workspace;
    EffectUtil:playEffects({ v99 }, nil, {
        destroyAfterSec = 0.75
    });
    p97:playScreenShake(Vector3.new(0, 0, 0), Vector3.new(0, -25, 0), {
        magnitude = 2
    });
    p97:playSound(GameSound.WINTER_BOSS_ICE_BREAK, {
        volumeMultiplier = 12,
        position = p98
    });
end;

function u6.startBossTrack(p100) -- Line: 577
    -- upvalues: GameSound (copy)
    p100.bossTrack = p100:playSound(GameSound.WINTER_BOSS_TRACK, {
        looped = true
    });
end;

function u6.stopBossTrack(p101) -- Line: 582
    if p101.bossTrack then
        p101.bossTrack:Stop();
    end;
end;

function u6.setState(p102, p103) -- Line: 587
    local bossState = p102.bossState;

    if bossState ~= 0 and (bossState == bossState and bossState) then
        p102:onStateExit(p102.bossState);
    end;

    p102.bossState = p103;
    p102:onStateEnter(p102.bossState);
end;

function u6.onStateEnter(p104, p105) -- Line: 596
    -- upvalues: BossState (copy)
    if p105 == BossState.FROZEN then
        p104:handleEnterFrozenState();
    end;

    if p105 == BossState.IDLE then
        p104:handleEnterIdleState();
    end;

    if p105 == BossState.SUMMON_ICICLES then
        p104:handleEnterSummonIciclesState();
    end;

    if p105 == BossState.MOVING then
        p104:handleEnterMovingState();
    end;

    if p105 == BossState.SPIN then
        p104:handleEnterSpinState();
    end;

    if p105 == BossState.DASH_ATTACK then
        p104:handleEnterDashAttackState();
    end;

    if p105 == BossState.SUMMON_SLAM then
        p104:handleEnterSummonSlamState();
    end;

    if p105 == BossState.DEAD then
        p104:handleEnterDeadState();
    end;

    if p105 == BossState.CHARGE then
        p104:handleEnterChargeState();
    end;

    if p105 == BossState.SUMMON_PENGUIN then
        p104:handleEnterSummonPenguinState();
    end;

    if p105 ~= BossState.SPIN then
        p104:clearSpinTarget();
    end;
end;

function u6.onStateExit(p106, p107) -- Line: 631
    -- upvalues: BossState (copy)
    if p107 == BossState.SPIN then
        p106:handleExitSpinState();
    end;

    if p107 == BossState.DASH_ATTACK then
        p106:handleExitDashAttackState();
    end;
end;

function u6.handleEnterFrozenState(p108) -- Line: 639
    -- upvalues: AnimationType (copy)
    if not p108.bossModel then
        return nil;
    end;

    p108:playBossAnimation(AnimationType.WINTER_BOSS_SPAWN, false);
    p108.bossAnimation:AdjustSpeed(0);
end;

function u6.handleEnterIdleState(p109) -- Line: 647
    -- upvalues: AnimationType (copy)
    if not p109.bossModel then
        return nil;
    end;

    p109:playBossAnimation(AnimationType.WINTER_BOSS_IDLE, true);
end;

function u6.handleEnterMovingState(p110) -- Line: 653
    -- upvalues: AnimationType (copy)
    if not p110.bossModel then
        return nil;
    end;

    p110:playBossAnimation(AnimationType.WINTER_BOSS_RUN, true);
end;

function u6.handleEnterSpinState(p111) -- Line: 659
    -- upvalues: AnimationType (copy)
    if not p111.bossModel then
        return nil;
    end;

    p111:playBossAnimation(AnimationType.WINTER_BOSS_SPIN, true);
    p111:toggleSpinTrailEffect(true);
    p111:toggleSpinSoundEffect(true);
end;

function u6.handleExitSpinState(p112) -- Line: 667
    p112:toggleSpinTrailEffect(false);
    p112:toggleSpinSoundEffect(false);
end;

function u6.toggleSpinSoundEffect(p113, p114) -- Line: 671
    -- upvalues: u2 (copy), GameSound (copy)
    if not p113.bossModel then
        return nil;
    end;

    if p113.bossSpinSoundEffect then
        p113.bossSpinSoundEffect.Playing = p114;

        return;
    end;

    local UpperTorso = p113.bossModel:WaitForChild("UpperTorso");

    if not UpperTorso then
        return nil;
    end;

    p113.bossSpinSoundEffect = u2("Sound", {
        Looped = true,
        Volume = 1.5,
        RollOffMaxDistance = 150,
        SoundId = GameSound.WINTER_BOSS_SPIN_LOOP,
        Playing = p114,
        Parent = UpperTorso
    });
end;

function u6.toggleSpinTrailEffect(p115, p116) -- Line: 696
    if not p115.bossModel then
        return nil;
    end;

    local ice_hammer = p115.bossModel:FindFirstChild("ice_hammer");

    if ice_hammer ~= nil then
        ice_hammer = ice_hammer:FindFirstChild("Handle");

        if ice_hammer ~= nil then
            ice_hammer = ice_hammer:FindFirstChild("AxeInnerTrail");
        end;
    end;

    if not ice_hammer then
        return nil;
    end;

    local ice_hammer2 = p115.bossModel:FindFirstChild("ice_hammer");

    if ice_hammer2 ~= nil then
        ice_hammer2 = ice_hammer2:FindFirstChild("Handle");

        if ice_hammer2 ~= nil then
            ice_hammer2 = ice_hammer2:FindFirstChild("AxeOuterTrail");
        end;
    end;

    if not ice_hammer2 then
        return nil;
    end;

    ice_hammer.Enabled = p116;
    ice_hammer2.Enabled = p116;
end;

function u6.handleEnterDashAttackState(p117) -- Line: 727
    -- upvalues: AnimationType (copy), GameSound (copy)
    if not p117.bossModel then
        return nil;
    end;

    p117:playBossAnimation(AnimationType.WINTER_BOSS_DASH_ATTACK, false);
    p117:toggleDashAttackTrailEffect(true);
    p117:playSound(GameSound.WINTER_BOSS_DASH_ATTACK, {
        rollOffMaxDistance = 500,
        volumeMultiplier = 15,
        position = p117.bossModel:GetPivot().Position
    });
end;

function u6.handleExitDashAttackState(p118) -- Line: 742
    p118:toggleDashAttackTrailEffect(false);
end;

function u6.toggleDashAttackTrailEffect(p119, p120) -- Line: 745
    if not p119.bossModel then
        return nil;
    end;

    local UpperTorso = p119.bossModel:FindFirstChild("UpperTorso");

    if UpperTorso ~= nil then
        UpperTorso = UpperTorso:FindFirstChild("InnerTrail");
    end;

    if not UpperTorso then
        return nil;
    end;

    local UpperTorso2 = p119.bossModel:FindFirstChild("UpperTorso");

    if UpperTorso2 ~= nil then
        UpperTorso2 = UpperTorso2:FindFirstChild("OuterTrail");
    end;

    if not UpperTorso2 then
        return nil;
    end;

    UpperTorso.Enabled = p120;
    UpperTorso2.Enabled = p120;
end;

function u6.handleEnterSummonSlamState(u121) -- Line: 770
    -- upvalues: AnimationType (copy)
    if not u121.bossModel then
        return nil;
    end;

    task.delay(1, function() -- Line: 775
        -- upvalues: u121 (copy), AnimationType (ref)
        u121:playBossAnimation(AnimationType.WINTER_BOSS_SLAM_AXE, false);
        task.delay(0.75, function() -- Line: 778
            -- upvalues: u121 (ref)
            u121.bossAnimation:AdjustSpeed(0);
            task.delay(0.3, function() -- Line: 780
                -- upvalues: u121 (ref)
                u121.bossAnimation:AdjustSpeed(1);
                task.delay(0.35, function() -- Line: 782
                    -- upvalues: u121 (ref)
                    u121.bossAnimation:AdjustSpeed(0);
                    u121:playSlamSummonEffect();
                end);
            end);
        end);
    end);
end;

function u6.handleEnterSummonPenguinState(p122) -- Line: 790
    -- upvalues: AnimationType (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy)
    if not p122.bossModel then
        return nil;
    end;

    p122:playBossAnimation(AnimationType.WINTER_BOSS_RAISE_AXE, false);
    task.delay(0.5, function() -- Line: 795
        -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref)
        SoundManager:playSound(RandomUtil.fromList(unpack({ GameSound.PENGUIN_ATTACK_1, GameSound.PENGUIN_ATTACK_2, GameSound.PENGUIN_ATTACK_3 })));
    end);
end;

function u6.pullToCenter(p123, p124) -- Line: 799
    -- upvalues: Players (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    Character:ApplyImpulse(p124);
end;

function u6.playSlamSummonEffect(u125) -- Line: 811
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), GameSound (copy)
    if not u125.bossAssets then
        return nil;
    end;

    local v126 = u125:getGroundNormalizedPosition(u125.bossAssets.Platforms.BossFight.PlatformCenter.Position);
    local v127 = ReplicatedStorage.Assets.Effects.BossSwirl:Clone();
    v127.Position = v126;
    v127.Parent = Workspace;
    EffectUtil:playEffects({ v127 }, nil, {
        destroyAfterSec = 4,
        sizeMultiplier = 1.5
    });
    u125:playScreenShake(Vector3.new(0, 0, 0), Vector3.new(0, -50, 0), {
        duration = 0.3,
        cycles = 8,
        magnitude = 4
    });
    u125:playSound(GameSound.WINTER_BOSS_AXE_SLAM, {
        position = nil,
        volumeMultiplier = 5
    });

    if not u125.propsDestroyed then
        task.delay(3, function() -- Line: 847
            -- upvalues: u125 (copy), GameSound (ref)
            u125:playSound(GameSound.WINTER_BOSS_DEBRIS_FALL, {
                position = nil,
                volumeMultiplier = 5
            });
        end);
        u125.propsDestroyed = true;
    end;
end;

function u6.handleEnterSummonIciclesState(p128) -- Line: 857
    -- upvalues: AnimationType (copy)
    if not p128.bossModel then
        return nil;
    end;

    p128:playBossAnimation(AnimationType.WINTER_BOSS_RAISE_AXE, false);
end;

function u6.handleAxeThrowAction(u129, u130) -- Line: 863
    -- upvalues: AnimationType (copy), ReplicatedStorage (copy), Workspace (copy), TweenService (copy), SoundManager (copy), GameSound (copy)
    u129:createIndicator(u130.position, 1);
    local bossModel = u129.bossModel;

    if bossModel ~= nil then
        bossModel = bossModel:GetPivot().Position;
    end;

    local u131 = bossModel;

    if not u131 then
        return nil;
    end;

    local v132 = CFrame.new(u131, u130.position);
    local bossModel2 = u129.bossModel;

    if bossModel2 ~= nil then
        bossModel2:PivotTo(v132);
    end;

    u129:playBossAnimation(AnimationType.WINTER_BOSS_THROW, false, 0.5);
    local bossModel3 = u129.bossModel;

    if bossModel3 ~= nil then
        bossModel3 = bossModel3:WaitForChild("ice_hammer", 3);

        if bossModel3 ~= nil then
            bossModel3 = bossModel3:WaitForChild("Handle", 3);
        end;
    end;

    local u133 = ReplicatedStorage.Assets.Effects.IceHammer:Clone();
    local u134 = nil;
    local bossAnimation = u129.bossAnimation;

    if bossAnimation ~= nil then
        bossAnimation = bossAnimation:GetMarkerReachedSignal("throw"):Connect(function() -- Line: 892
            -- upvalues: u134 (ref), u129 (copy), u131 (ref), bossModel3 (copy), u133 (copy), Workspace (ref), TweenService (ref), u130 (copy), SoundManager (ref), GameSound (ref)
            local v135 = u134;

            if v135 ~= nil then
                v135:Disconnect();
            end;

            local bossModel4 = u129.bossModel;

            if bossModel4 ~= nil then
                bossModel4 = bossModel4:GetPivot().Position;
            end;

            u131 = bossModel4;

            if bossModel3 and (u133 and u131) then
                bossModel3.Archivable = true;
                u133.Anchored = true;
                u133.Parent = Workspace;
                u133:PivotTo(bossModel3:GetPivot());
                u129.axeClone = u133;
                u129:hideAxe();
                local v136 = TweenService:Create(u133, TweenInfo.new(0.2), {
                    CFrame = CFrame.new(u130.position, u131) * CFrame.Angles(3.141592653589793, -1.5707963267948966, 0.7853981633974483)
                });
                v136:Play();
                v136.Completed:Connect(function() -- Line: 918
                    -- upvalues: SoundManager (ref), GameSound (ref), u130 (ref)
                    SoundManager:playSound(GameSound.JUGGERNAUT_GROUND_SMASH, {
                        rollOffMaxDistance = 220,
                        position = u130.position
                    });
                end);
            end;
        end);
    end;
end;

function u6.handleEnterChargeState(u137) -- Line: 929
    -- upvalues: AnimationType (copy), AnimationUtil (copy), GameAnimationUtil (copy)
    u137:playBossAnimation(AnimationType.WINTER_BOSS_RUN, true);
    local bossModel = u137.bossModel;

    if bossModel ~= nil then
        bossModel = bossModel:FindFirstChild("Humanoid");

        if bossModel ~= nil then
            bossModel = bossModel:FindFirstChild("Animator");
        end;
    end;

    if bossModel then
        local u138 = AnimationUtil:playAnimation(bossModel, GameAnimationUtil:getAssetId(AnimationType.CHARGE_SHIELD_CHARGE), {
            looped = true
        });
        task.delay(0.5, function() -- Line: 943
            -- upvalues: u138 (copy)
            local v139 = u138;

            if v139 ~= nil then
                v139:Stop();
            end;

            local v140 = u138;

            if v140 ~= nil then
                v140:Destroy();
            end;
        end);
    end;

    task.delay(0.5, function() -- Line: 954
        -- upvalues: u137 (copy), AnimationType (ref)
        local bossAnimation = u137.bossAnimation;

        if bossAnimation ~= nil then
            bossAnimation:Stop();
        end;

        u137:playBossAnimation(AnimationType.WINTER_BOSS_IDLE, true);
        local axeClone = u137.axeClone;

        if axeClone ~= nil then
            axeClone:Destroy();
        end;

        u137.axeClone = nil;
        u137:showAxe();
    end);
end;

function u6.handleEnterAxeSpinState(u141, p142) -- Line: 968
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local bossModel = u141.bossModel;

    if bossModel ~= nil then
        bossModel = bossModel:FindFirstChild("Humanoid");

        if bossModel ~= nil then
            bossModel = bossModel:FindFirstChild("Animator");
        end;
    end;

    local bossModel2 = u141.bossModel;

    if bossModel2 ~= nil then
        bossModel2 = bossModel2.PrimaryPart;

        if bossModel2 ~= nil then
            bossModel2 = bossModel2.Position;
        end;
    end;

    if not (bossModel and bossModel2) then
        return nil;
    end;

    local bossModel3 = u141.bossModel;

    if bossModel3 ~= nil then
        bossModel3:PivotTo(CFrame.new(bossModel2, p142));
    end;

    local u143 = AnimationUtil:playAnimation(bossModel, GameAnimationUtil:getAssetId(AnimationType.WINTER_BOSS_SPIN_AXE), {
        looped = false
    });

    if u143 then
        u143:GetMarkerReachedSignal("hold"):Connect(function() -- Line: 996
            -- upvalues: u143 (copy)
            u143:AdjustSpeed(0);
        end);
    end;

    task.delay(0.5, function() -- Line: 1000
        -- upvalues: u141 (copy)
        u141:hideAxe();
    end);
    task.delay(3.5, function() -- Line: 1003
        -- upvalues: u143 (copy), AnimationUtil (ref), bossModel (copy), GameAnimationUtil (ref), AnimationType (ref)
        local v144 = u143;

        if v144 ~= nil then
            v144:Stop();
        end;

        local v145 = u143;

        if v145 ~= nil then
            v145:Destroy();
        end;

        AnimationUtil:playAnimation(bossModel, GameAnimationUtil:getAssetId(AnimationType.HARPOON_RETURN), {
            looped = false
        });
    end);
end;

function u6.handleEnterDeadState(u146) -- Line: 1017
    -- upvalues: AnimationType (copy)
    if not u146.bossModel then
        return nil;
    end;

    local PrimaryPart = u146.bossModel.PrimaryPart;

    if PrimaryPart then
        PrimaryPart.CanCollide = false;
    end;

    if u146.bossAnimation then
        u146.bossAnimation:Stop();
    end;

    if u146.activeMovementTween and u146.activeMovementTween.PlaybackState == Enum.PlaybackState.Playing then
        u146.activeMovementTween:Pause();
        u146.activeMovementTween:Destroy();
    end;

    u146:toggleSpinSoundEffect(false);
    u146:stopBossTrack();
    u146:playScreenShake(Vector3.new(0, 0, 0), Vector3.new(0, -30, 0), {
        magnitude = 3.5
    });
    u146:playBossAnimation(AnimationType.WINTER_BOSS_DEATH, false);
    task.delay(2.75, function() -- Line: 1046
        -- upvalues: u146 (copy)
        u146:playScreenShake(Vector3.new(0, 0, 0), Vector3.new(0, -30, 0), {
            magnitude = 3.5
        });
        u146.bossAnimation:AdjustSpeed(0);
    end);
end;

function u6.playBossAnimation(p147, p148, p149, p150) -- Line: 1054
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy)
    if p149 == nil then
        p149 = false;
    end;

    local v151 = p150 == nil and 1 or p150;

    if not p147.bossModel then
        return nil;
    end;

    local Humanoid = p147.bossModel:FindFirstChild("Humanoid");

    if Humanoid ~= nil then
        Humanoid = Humanoid:FindFirstChild("Animator");
    end;

    if not Humanoid then
        return nil;
    end;

    if p147.bossAnimation and p147.bossAnimation.IsPlaying then
        p147.bossAnimation:Stop();
    end;

    p147.bossAnimation = AnimationUtil:playAnimation(Humanoid, GameAnimationUtil:getAssetId(p148), {
        looped = p149
    });
    local bossAnimation = p147.bossAnimation;

    if bossAnimation ~= nil then
        bossAnimation:AdjustSpeed(v151);
    end;
end;

function u6.getAlivePlayerEntities(p152) -- Line: 1083
    -- upvalues: EntityUtil (copy), RuntimeLib (copy), PlayerEntity (copy)
    local u153 = {};

    local function _(p154) -- Line: 1086
        -- upvalues: EntityUtil (ref), RuntimeLib (ref), PlayerEntity (ref), u153 (copy)
        local v155 = EntityUtil:getEntity(p154);

        if RuntimeLib.instanceof(v155, PlayerEntity) then
            table.insert(u153, v155);
        end;
    end;

    for i, v in EntityUtil:getAliveEntityInstances() do
        local _ = i - 1;
        local v156 = EntityUtil:getEntity(v);

        if RuntimeLib.instanceof(v156, PlayerEntity) then
            table.insert(u153, v156);
        end;
    end;

    return u153;
end;

function u6.playScreenShake(p157, p158, p159, p160) -- Line: 1097
    -- upvalues: KnitClient (copy)
    KnitClient.Controllers.ScreenShakeController:shake(p158, p159, p160);
end;

function u6.playSound(p161, p162, p163) -- Line: 1100
    -- upvalues: SoundManager (copy)
    return SoundManager:playModifiableSound(p162, p163);
end;

function u6.getGroundNormalizedPosition(p164, p165) -- Line: 1103
    return Vector3.new(p165.X, 786, p165.Z);
end;

function u6.listenForBossSpinRequest(u166) -- Line: 1106
    -- upvalues: default (copy)
    default.Client:Get("WinterEventBossSpin"):Connect(function(p167) -- Line: 1107
        -- upvalues: u166 (copy)
        u166:markSpinTarget(p167.target);
    end);
end;

function u6.markSpinTarget(p168, p169) -- Line: 1111
    -- upvalues: Players (copy), u2 (copy), ColorUtil (copy)
    if p169 == Players.LocalPlayer then
        return nil;
    end;

    p168:clearSpinTarget();
    local Character = p169.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    p168.spinTargetMark = u2("BillboardGui", {
        ResetOnSpawn = false,
        AlwaysOnTop = true,
        Parent = Character,
        Size = UDim2.fromScale(3, 3),
        Children = { u2("ImageLabel", {
                ImageTransparency = 0.25,
                BackgroundTransparency = 1,
                Image = "rbxassetid://16830265561",
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.new(1.5, 0, 1.5, 0),
                ImageColor3 = ColorUtil.WHITE
            }) }
    });
end;

function u6.clearSpinTarget(p170) -- Line: 1140
    local spinTargetMark = p170.spinTargetMark;

    if spinTargetMark ~= nil then
        spinTargetMark:Destroy();
    end;

    p170.spinTargetMark = nil;
end;

function u6.createIndicator(p171, p172, p173) -- Line: 1147
    -- upvalues: u2 (copy), Workspace (copy), TweenService (copy)
    if not p171.bossAssets then
        return nil;
    end;

    TweenService:Create(u2("Part", {
        Name = "GroundIndicator",
        Size = Vector3.new(0.1, 1, 1),
        Transparency = 0.3,
        CastShadow = false,
        Orientation = Vector3.new(0, 0, 90),
        Anchored = true,
        CanCollide = false,
        CanTouch = false,
        CanQuery = false,
        Position = Vector3.new(p172.X, p171.bossAssets.Platforms.BossFight.PlatformCenter.Position.Y - 0.2, p172.Z),
        Color = Color3.fromRGB(255, 0, 0),
        Shape = Enum.PartType.Cylinder,
        Parent = Workspace
    }), TweenInfo.new(p173 == nil and 2.25 or p173, Enum.EasingStyle.Sine), {
        Size = Vector3.new(0.1, 30, 30),
        Transparency = 1
    }):Play();
end;

function u6.hideAxe(p174) -- Line: 1186
    local bossModel = p174.bossModel;

    if bossModel ~= nil then
        bossModel = bossModel:WaitForChild("ice_hammer", 3);

        if bossModel ~= nil then
            bossModel = bossModel:WaitForChild("Handle", 3);
        end;
    end;

    if bossModel then
        bossModel.Transparency = 1;

        local function _(p175) -- Line: 1198
            if p175:IsA("MeshPart") then
                p175.Transparency = 1;
            end;
        end;

        for i, descendant in bossModel:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("MeshPart") then
                descendant.Transparency = 1;
            end;
        end;
    end;
end;

function u6.showAxe(p176) -- Line: 1208
    local bossModel = p176.bossModel;

    if bossModel ~= nil then
        bossModel = bossModel:WaitForChild("ice_hammer", 3);

        if bossModel ~= nil then
            bossModel = bossModel:WaitForChild("Handle", 3);
        end;
    end;

    if bossModel then
        bossModel.Transparency = 0;

        local function _(p177) -- Line: 1220
            if p177:IsA("MeshPart") then
                p177.Transparency = 0;
            end;
        end;

        for i, descendant in bossModel:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("MeshPart") then
                descendant.Transparency = 0;
            end;
        end;
    end;
end;

KnitClient.CreateController(u6.new());

return nil;