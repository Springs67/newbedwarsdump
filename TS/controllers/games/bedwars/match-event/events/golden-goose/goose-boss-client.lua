-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local Linear = v2.Linear;
local OutQuad = v2.OutQuad;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local StatefulEntityHpBarBillboard = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golden-goose", "golden-goose-constants");
local GoldenGooseConstants = v5.GoldenGooseConstants;
local GooseBossAction = v5.GooseBossAction;
local GooseBossState = v5.GooseBossState;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golem-boss", "golem-boss-constants");
local GOLEM_SCREEN_SHAKE_THRESHOLD = v6.GOLEM_SCREEN_SHAKE_THRESHOLD;
local GOLEM_TURN_DURATION = v6.GOLEM_TURN_DURATION;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatefulEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity").StatefulEntity;
local StatefulEntityTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag;
local StatefulEntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u7 = {
    [0] = AnimationType.CRAB_BOSS_CLAW_ATTACK,
    [0.8726646259971648] = AnimationType.CRAB_BOSS_STAB_50,
    [1.5707963267948966] = AnimationType.CRAB_BOSS_STAB_90,
    [2.2689280275926285] = AnimationType.CRAB_BOSS_STAB_130,
    [4.014257279586958] = AnimationType.CRAB_BOSS_STAB_230,
    [4.71238898038469] = AnimationType.CRAB_BOSS_STAB_270,
    [5.410520681182422] = AnimationType.CRAB_BOSS_STAB_310,
    [6.283185307179586] = AnimationType.CRAB_BOSS_CLAW_ATTACK
};
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 54, Name: __tostring
        return "GooseBossClient";
    end,

    __index = StatefulEntity
});
u8.__index = u8;

function u8.new(...) -- Line: 60
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10, p11, p12, p13) -- Line: 64
    -- upvalues: StatefulEntity (copy), GooseBossState (copy), StatefulEntityTag (copy), u3 (copy)
    StatefulEntity.constructor(p10, GooseBossState.SPAWNING, StatefulEntityTag.GOOSE_BOSS, p11, p12);
    p10.isDead = false;
    p10.stateMaid = u3.new();
    p10.activePoisonBlocks = {};
    p10.serverInstance = p13;
    p10:createEntityHealthbar();
end;

function u8.createEntityHealthbar(p14) -- Line: 73
    -- upvalues: Flamework (copy), StatefulEntityHpBarBillboard (copy)
    if p14.gameEntity and p14.serverInstance then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            app = StatefulEntityHpBarBillboard,
            appId = "StatefulEntityHpBarBillboard_" .. tostring(p14.entityUUID)
        }, {
            hpBarOffset = Vector3.new(0, 6.5, 0),
            gameEntity = p14.gameEntity,
            serverInstance = p14.serverInstance
        }, nil, p14.gameEntity);
    end;
end;

function u8.createGameEntity(u15, p16) -- Line: 85
    -- upvalues: ReplicatedStorage (copy), StatefulEntityUtil (copy), Workspace (copy), CollectionService (copy), GameAnimationUtil (copy), AnimationType (copy), RunService (copy)
    local u17 = ReplicatedStorage.Assets.Misc.GooseBoss:Clone();
    u17:WaitForChild("RootPart").Anchored = true;
    StatefulEntityUtil:setEntityIgnoreQuery(u17);
    StatefulEntityUtil:setClientEntityNotCollidable(u17);
    local v18, v19 = u17:GetBoundingBox();
    u17:PivotTo(p16 + Vector3.new(0, (u17.PrimaryPart.CFrame - (v18 - v19 / 2 * Vector3.new(0, 1, 0)).Position).Y, 0));
    u15.gameEntity = u17;
    StatefulEntityUtil:hideStatefulEntity(u15.gameEntity);
    u17.Parent = Workspace;
    CollectionService:AddTag(u17, "VisualGooseBoss");
    u15.gooseModel = ReplicatedStorage.Assets.Misc.GoldenGoose:Clone();
    u15.gooseModel.Parent = Workspace;

    local function _(p20) -- Line: 113
        if p20:IsA("ParticleEmitter") then
            p20.Enabled = false;
        end;

        if p20:IsA("Trail") then
            p20.Enabled = false;
        end;
    end;

    for i, descendant in u15.gooseModel:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant.Enabled = false;
        end;

        if descendant:IsA("Trail") then
            descendant.Enabled = false;
        end;
    end;

    GameAnimationUtil:playAnimation(u15.gooseModel, AnimationType.GOLDEN_GOOSE_IDLE, {
        looped = true
    });
    local u21 = nil;
    u21 = RunService.Heartbeat:Connect(function() -- Line: 128
        -- upvalues: u17 (copy), u15 (copy), u21 (ref)
        local cage_mesh = u17:FindFirstChild("cage_mesh");

        if cage_mesh ~= nil then
            cage_mesh = cage_mesh:FindFirstChild("GoosePosition");
        end;

        if not cage_mesh then
            return nil;
        end;

        local gooseModel = u15.gooseModel;

        if gooseModel ~= nil then
            gooseModel = gooseModel.Parent;
        end;

        if not gooseModel then
            u21:Disconnect();

            return nil;
        end;

        u15.gooseModel:PivotTo(cage_mesh.CFrame);
    end);
    u15.activePoisonBlocks = {};
    u15:registerClientGameEntity(u17);
end;

function u8.handleActionRequest(p22, p23, p24) -- Line: 150
    -- upvalues: GooseBossAction (copy)
    if not p22.gameEntity or (not p22.gameEntity.Parent or p22.isDead) then
        return nil;
    end;

    if p23 == GooseBossAction.FLIP_GROUND then
        p22:handleFlipGroundActionRequest(p24);

        return;
    end;

    if p23 == GooseBossAction.MISSILE_BARRAGE then
        p22:handleBarrage(p24);

        return;
    end;

    if p23 == GooseBossAction.UNBURROW then
        p22:handleUnburrow();

        return;
    end;

    if p23 == GooseBossAction.BASIC_ATTACK then
        p22:handleBasicAttack(p24);
    end;
end;

function u8.handleBasicAttack(p25, p26) -- Line: 166
    -- upvalues: StatefulEntityUtil (copy), u7 (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy)
    if not p25.gameEntity then
        return nil;
    end;

    local Position = p26.target:GetPivot().Position;
    local v27 = StatefulEntityUtil:getEntityFloorCFrame(p25.gameEntity);
    local v28 = Position - v27.Position;
    local v29 = (v27 - v27.Position):Inverse() * v28;
    local v30 = 6.283185307179586 - math.atan2(v29.Z, v29.X) % 6.283185307179586;
    local v31 = nil;

    for i, v in u7 do
        if not v31 or math.abs(i - v30) < math.abs(v31.angle - v30) then
            v31 = {
                angle = i,
                animation = v
            };
        end;
    end;

    if not v31 then
        return nil;
    end;

    local v32;

    if v31.animation == AnimationType.CRAB_BOSS_CLAW_ATTACK then
        v32 = GameSound.CRAB_BOSS_CLAW_ATTACK;
    else
        v32 = GameSound.CRAB_BOSS_STAB_ATTACK;
    end;

    SoundManager:playSound(v32, {
        position = p25.gameEntity:GetPivot().Position
    });
    AnimationUtil:playAnimation(p25.gameEntity, GameAnimationUtil:getAssetId(v31.animation), {
        looped = false
    });
end;

function u8.handleUnburrow(u33) -- Line: 200
    -- upvalues: SoundManager (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), GameSound (copy), StatefulEntityUtil (copy)
    local gameEntity = u33.gameEntity;

    if gameEntity ~= nil then
        gameEntity = gameEntity.Parent;
    end;

    if not gameEntity then
        return nil;
    end;

    if u33.burrowLoop then
        SoundManager:tweenSoundVolume(u33.burrowLoop, 0, 1);
        task.delay(1, function() -- Line: 211
            -- upvalues: u33 (copy)
            local burrowLoop = u33.burrowLoop;

            if burrowLoop ~= nil then
                burrowLoop:Stop();
            end;

            local burrowLoop2 = u33.burrowLoop;

            if burrowLoop2 ~= nil then
                burrowLoop2:Destroy();
            end;
        end);
    end;

    AnimationUtil:playAnimation(u33.gameEntity, GameAnimationUtil:getAssetId(AnimationType.CRAB_BOSS_DIG_UP), {
        looped = false
    });
    SoundManager:playSound(GameSound.CRAB_BOSS_BURROW_OUT, {
        position = u33.gameEntity:GetPivot().Position
    });
    StatefulEntityUtil:showStatefulEntity(u33.gameEntity);
    StatefulEntityUtil:showStatefulEntity(u33.gooseModel);
end;

function u8.handleBarrage(u34, p35) -- Line: 231
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), GoldenGooseConstants (copy)
    AnimationUtil:playAnimation(u34.gameEntity, GameAnimationUtil:getAssetId(AnimationType.CRAB_BOSS_BARRAGE_ATTACK), {
        looped = false
    });

    for _, v in p35.targets do
        local u36 = v[1];

        for _, v3 in v[2] do
            task.delay(GoldenGooseConstants.ACTION_BARRAGE_LAUNCH_TIMES[v3 + 1], function() -- Line: 240
                -- upvalues: u34 (copy), u36 (copy)
                u34:launchMissile(u36);
            end);
        end;
    end;
end;

function u8.launchMissile(p37, u38) -- Line: 246
    -- upvalues: StatefulEntityUtil (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy), default (copy), GoldenGooseConstants (copy), Linear (copy), BLOCK_SIZE (copy)
    if not p37.gameEntity then
        return nil;
    end;

    local u39 = StatefulEntityUtil:getGameEntityCFrame(p37.gameEntity);
    local u40 = u39 * Vector3.new(0, -3, 5);
    SoundManager:playSound(RandomUtil.fromList(GameSound.CRAB_BOSS_LAUNCH_1, GameSound.CRAB_BOSS_LAUNCH_2, GameSound.CRAB_BOSS_LAUNCH_3, GameSound.CRAB_BOSS_LAUNCH_4), {
        position = u40
    });
    local u41 = ReplicatedStorage.Assets.Effects.CrabMissile:Clone();
    u41.Position = u40;
    u41.Parent = Workspace;
    local u42 = (math.random() - 0.5) * 120;
    local u47 = default(GoldenGooseConstants.MISSILE_FLIGHT_TIME_SEC, Linear, function(p43) -- Line: 260
        -- upvalues: u38 (copy), u39 (copy), u42 (copy), BLOCK_SIZE (ref), u40 (copy), u41 (copy)
        local v44 = p43 - 0.5;
        local v45 = math.pow(v44, 2) * math.sign(v44) / 0.5 + 0.5;
        local Position = u38:GetPivot().Position;
        local v46 = (math.sqrt(v45) - v45) / 0.25;
        u41.Position = (u39 - u39.Position) * CFrame.Angles(0, 0, (math.rad(u42))) * Vector3.new(0, v46 * BLOCK_SIZE * 4.5, 0) + u40:Lerp(Position, v45);
    end);
    task.spawn(function() -- Line: 274
        -- upvalues: u47 (copy), SoundManager (ref), RandomUtil (ref), GameSound (ref), u40 (copy), u41 (copy)
        u47:Wait();
        SoundManager:playSound(RandomUtil.fromList(GameSound.CRAB_BOSS_IMPACT_1, GameSound.CRAB_BOSS_IMPACT_2, GameSound.CRAB_BOSS_IMPACT_3, GameSound.CRAB_BOSS_IMPACT_4), {
            position = u40
        });

        local function _(p48) -- Line: 281
            if p48:IsA("ParticleEmitter") then
                p48.Enabled = false;
            end;
        end;

        for i, descendant in u41:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ParticleEmitter") then
                descendant.Enabled = false;
            end;
        end;

        u41.Transparency = 1;
        task.delay(3, function() -- Line: 290
            -- upvalues: u41 (ref)
            u41:Destroy();
        end);
    end);
end;

function u8.handleFlipGroundActionRequest(u49, u50) -- Line: 295
    -- upvalues: StatefulEntityUtil (copy), GOLEM_TURN_DURATION (copy), SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), ReplicatedStorage (copy), Workspace (copy), BlockEngine (copy), BLOCK_SIZE (copy), EffectUtil (copy)
    if not u49.gameEntity or (not u49.gameEntity.Parent or u49.isDead) then
        return nil;
    end;

    StatefulEntityUtil:rotateTo(u49.gameEntity, u50.position, GOLEM_TURN_DURATION):andThen(function() -- Line: 300
        -- upvalues: u49 (copy), SoundManager (ref), GameSound (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), u50 (copy), ReplicatedStorage (ref), Workspace (ref), BlockEngine (ref), BLOCK_SIZE (ref), EffectUtil (ref)
        if u49.isDead or not u49.gameEntity then
            return nil;
        end;

        u49.stateMaid:DoCleaning();
        SoundManager:playSound(GameSound.CRAB_BOSS_FLIP_BUILDUP, {
            position = u49.gameEntity:GetPivot().Position
        });
        local v51 = AnimationUtil:playAnimation(u49.gameEntity, GameAnimationUtil:getAssetId(AnimationType.CRAB_BOSS_FLIP_GROUND), {
            looped = false
        });

        if v51 then
            v51:GetMarkerReachedSignal("digEnd"):Connect(function() -- Line: 315
                -- upvalues: u49 (ref), SoundManager (ref), GameSound (ref), u50 (ref), ReplicatedStorage (ref), Workspace (ref), BlockEngine (ref), BLOCK_SIZE (ref), EffectUtil (ref)
                if not u49.alive then
                    return nil;
                end;

                SoundManager:playSound(GameSound.CRAB_BOSS_FLIP, {
                    position = u50.position
                });

                for _, v in u50.dangerBlockPositions do
                    if u49.activePoisonBlocks[v] == nil then
                        u49.activePoisonBlocks[v] = true;
                        local v52 = ReplicatedStorage.Assets.Effects.CrabPoisonParticle:Clone();
                        v52.Parent = Workspace;
                        u49.deathMaid:GiveTask(v52);
                        v52.Position = BlockEngine:getWorldPosition(v) + Vector3.new(0, BLOCK_SIZE / 2, 0);
                    end;
                end;

                local v53 = ReplicatedStorage.Assets.Effects.GolemBossOverheadSlam:Clone();
                v53.Position = u50.position;

                local function _(p54) -- Line: 339
                    -- upvalues: u50 (ref)
                    if p54:IsA("BasePart") then
                        p54.Position = u50.position;
                    end;
                end;

                for i, child in v53:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("BasePart") then
                        child.Position = u50.position;
                    end;
                end;

                v53.Parent = Workspace;
                EffectUtil:playEffects({ v53 }, nil, {
                    destroyAfterSec = 2.5
                });
                u49:playScreenShakeEffect(u50.position, {
                    magnitude = 2
                });
            end);
        end;
    end);
end;

function u8.onStateEnter(p55, p56) -- Line: 360
    -- upvalues: GooseBossState (copy)
    if not p55.gameEntity or (not p55.gameEntity.Parent or p55.isDead) then
        return nil;
    end;

    if p55.stateMaid then
        p55.stateMaid:DoCleaning();
    end;

    if p56 == GooseBossState.SPAWNING then
        p55:onEnterSpawningState();
    end;

    if p56 == GooseBossState.IDLE then
        p55:onEnterIdleState();
    end;

    if p56 == GooseBossState.UNDERGROUND then
        p55:digUnderground();
    end;

    if p56 == GooseBossState.ROTATING or p56 == GooseBossState.PATROL then
        p55:onEnterRotatingState();
    end;
end;

function u8.digUnderground(u57) -- Line: 381
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), GooseBossState (copy), StatefulEntityUtil (copy)
    if not (u57.gameEntity and u57.gameEntity.Parent) then
        return nil;
    end;

    local v58 = AnimationUtil:playAnimation(u57.gameEntity, GameAnimationUtil:getAssetId(AnimationType.CRAB_BOSS_DIG_DOWN), {
        looped = false
    });
    SoundManager:playSound(GameSound.CRAB_BOSS_BURROW_IN, {
        position = u57.gameEntity:GetPivot().Position
    });
    u57.burrowLoop = SoundManager:playModifiableSound(GameSound.CRAB_BOSS_BURROW_LOOP, {
        looped = true,
        position = u57.gameEntity:GetPivot().Position
    });
    u57.deathMaid:GiveTask(function() -- Line: 395
        -- upvalues: u57 (copy)
        local burrowLoop = u57.burrowLoop;

        if burrowLoop ~= nil then
            burrowLoop:Stop();
        end;
    end);

    if v58 ~= nil then
        v58.Stopped:Once(function() -- Line: 403
            -- upvalues: u57 (copy), GooseBossState (ref), StatefulEntityUtil (ref)
            if not u57.gameEntity or u57.activeState ~= GooseBossState.UNDERGROUND then
                return nil;
            end;

            StatefulEntityUtil:hideStatefulEntity(u57.gameEntity);
            StatefulEntityUtil:hideStatefulEntity(u57.gooseModel);
        end);
    end;
end;

function u8.onEnterSpawningState(u59) -- Line: 412
    -- upvalues: SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), StatefulEntityUtil (copy)
    if not (u59.gameEntity and u59.gameEntity.Parent) then
        return nil;
    end;

    SoundManager:playSound(GameSound.CRAB_BOSS_SPAWN_LOCAL, {
        position = u59.gameEntity:GetPivot().Position
    });
    SoundManager:playSound(GameSound.CRAB_BOSS_SPAWN_GLOBAL, {
        rollOffMinDistance = 300,
        rollOffMaxDistance = 1500,
        volumeMultiplier = 0.75,
        position = u59.gameEntity:GetPivot().Position
    });
    AnimationUtil:playAnimation(u59.gameEntity, GameAnimationUtil:getAssetId(AnimationType.CRAB_BOSS_SPAWN), {
        looped = false
    });
    task.delay(0.5, function() -- Line: 430
        -- upvalues: u59 (copy), StatefulEntityUtil (ref)
        if not u59.gameEntity or (not u59.gameEntity.Parent or u59.isDead) then
            return nil;
        end;

        StatefulEntityUtil:showStatefulEntity(u59.gameEntity);
    end);
end;

function u8.onEnterIdleState(p60) -- Line: 437
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    if not p60.gameEntity or (not p60.gameEntity.Parent or p60.isDead) then
        return nil;
    end;

    AnimationUtil:playAnimation(p60.gameEntity, GameAnimationUtil:getAssetId(AnimationType.CRAB_BOSS_IDLE), {
        looped = true
    });
end;

function u8.onEnterRotatingState(u61) -- Line: 445
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), StatefulEntityUtil (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy)
    if not u61.gameEntity or (not u61.gameEntity.Parent or u61.isDead) then
        return nil;
    end;

    local u62 = AnimationUtil:playAnimation(u61.gameEntity, GameAnimationUtil:getAssetId(AnimationType.CRAB_BOSS_WALK), {
        looped = true
    });
    u61.stateMaid:GiveTask(function() -- Line: 452
        -- upvalues: u62 (copy)
        local v63 = u62;

        if v63 ~= nil then
            v63:Stop();
        end;

        local v64 = u62;

        if v64 ~= nil then
            v64:Destroy();
        end;
    end);

    if u62 then
        u62:GetMarkerReachedSignal("footstep"):Connect(function(p65) -- Line: 464
            -- upvalues: u61 (copy), StatefulEntityUtil (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref)
            if not u61.gameEntity or u61.isDead then
                return nil;
            end;

            local v66 = { 50, 90, 130, 230, 270, 310 };
            local v67 = tonumber(p65);

            if v67 == nil then
                return nil;
            end;

            local v68 = math.rad(v66[v67 + 1]);
            local v69 = StatefulEntityUtil:getEntityFloorCFrame(u61.gameEntity) * (CFrame.Angles(0, v68, 0) * Vector3.new(0, 0, -8));
            SoundManager:playSound(RandomUtil.fromList(GameSound.CRAB_BOSS_FOOTSTEP_1, GameSound.CRAB_BOSS_FOOTSTEP_2, GameSound.CRAB_BOSS_FOOTSTEP_3), {
                position = v69
            });
        end);
    end;
end;

function u8.playScreenShakeEffect(p70, p71, p72) -- Line: 485
    -- upvalues: StatefulEntityUtil (copy), GOLEM_SCREEN_SHAKE_THRESHOLD (copy), Players (copy), KnitClient (copy)
    if not (p70.gameEntity and p70.gameEntity.Parent) then
        return nil;
    end;

    local v73 = StatefulEntityUtil:localPlayerDistanceFromEntity(p70.gameEntity);

    if v73 ~= 0 and (v73 == v73 and v73) then
        v73 = v73 <= GOLEM_SCREEN_SHAKE_THRESHOLD;
    end;

    if v73 ~= 0 and (v73 == v73 and v73) then
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:GetPivot().Position;
        end;

        if not Character then
            return nil;
        end;

        KnitClient.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), (Character - p71).Unit, p72);
    end;
end;

function u8.onStateExit(p74, p75) -- Line: 509
end;

function u8.onEntityDamaged(p76, p77, p78) -- Line: 511
end;

function u8.onEntityDeath(u79) -- Line: 513
    -- upvalues: Flamework (copy), StatefulEntityHpBarBillboard (copy), StatefulEntityUtil (copy), KnitClient (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), Workspace (copy), default (copy), OutQuad (copy), Linear (copy)
    u79.isDead = true;

    if not (u79.gameEntity and u79.gameEntity.Parent) then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp({
        app = StatefulEntityHpBarBillboard,
        appId = "StatefulEntityHpBarBillboard_" .. tostring(u79.entityUUID)
    });
    local _ = StatefulEntityUtil:getGameEntityCFrame(u79.gameEntity).Position;
    task.spawn(function() -- Line: 527
        -- upvalues: KnitClient (ref)
        local v80 = 0;

        while v80 <= 4 do
            v80 = v80 + 1;
            KnitClient.Controllers.GolemBossController:hideAllBlockDangerIndicators();
            task.wait(0.5);
        end;
    end);
    task.spawn(function() -- Line: 538
        -- upvalues: u79 (copy), KnitClient (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), Workspace (ref), default (ref), OutQuad (ref), Linear (ref)
        local serverInstance = u79.serverInstance;

        if serverInstance ~= nil then
            serverInstance = serverInstance:GetAttribute("Despawned");
        end;

        if serverInstance == 0 or (serverInstance ~= serverInstance or (serverInstance == "" or not serverInstance)) then
            serverInstance = KnitClient.Controllers.GooseBossController:isGooseDespawned();
        end;

        if serverInstance ~= 0 and (serverInstance == serverInstance and (serverInstance ~= "" and serverInstance)) then
            local v81 = AnimationUtil:playAnimation(u79.gameEntity, GameAnimationUtil:getAssetId(AnimationType.CRAB_BOSS_DIG_DOWN), {
                looped = false
            });
            local CRAB_BOSS_BURROW_IN = GameSound.CRAB_BOSS_BURROW_IN;
            local v82 = {};
            local gameEntity = u79.gameEntity;

            if gameEntity ~= nil then
                gameEntity = gameEntity:GetPivot().Position;
            end;

            v82.position = gameEntity;
            SoundManager:playSound(CRAB_BOSS_BURROW_IN, v82);

            if v81 ~= nil then
                v81.Stopped:Once(function() -- Line: 563
                    -- upvalues: u79 (ref), Workspace (ref)
                    local gameEntity2 = u79.gameEntity;

                    if gameEntity2 ~= nil then
                        gameEntity2:Destroy();
                    end;

                    local GoldenGoose = Workspace:FindFirstChild("GoldenGoose");

                    if GoldenGoose ~= nil then
                        GoldenGoose:Destroy();
                    end;
                end);
            end;

            task.delay(5, function() -- Line: 575
                -- upvalues: u79 (ref), Workspace (ref)
                local gameEntity2 = u79.gameEntity;

                if gameEntity2 ~= nil then
                    gameEntity2:Destroy();
                end;

                local GoldenGoose = Workspace:FindFirstChild("GoldenGoose");

                if GoldenGoose ~= nil then
                    GoldenGoose:Destroy();
                end;
            end);

            return nil;
        end;

        local u83 = AnimationUtil:playAnimation(u79.gameEntity, GameAnimationUtil:getAssetId(AnimationType.CRAB_BOSS_DEATH), {
            looped = false
        });
        local CRAB_BOSS_DEATH = GameSound.CRAB_BOSS_DEATH;
        local v84 = {};
        local gameEntity = u79.gameEntity;

        if gameEntity ~= nil then
            gameEntity = gameEntity:GetPivot().Position;
        end;

        v84.position = gameEntity;
        SoundManager:playSound(CRAB_BOSS_DEATH, v84);

        if u83 then
            u83:GetMarkerReachedSignal("finish"):Connect(function() -- Line: 602
                -- upvalues: u83 (copy), u79 (ref), default (ref), OutQuad (ref), Linear (ref)
                u83:AdjustSpeed(0);

                if u79.gameEntity then
                    local u85 = {};

                    for _, descendant in u79.gameEntity:GetDescendants() do
                        if descendant:IsA("BasePart") and descendant.Name ~= "cage_mesh" then
                            u85[descendant] = descendant.Transparency;
                        end;
                    end;

                    default(4, OutQuad, function(p86) -- Line: 613
                        -- upvalues: u85 (copy)
                        for i, v in u85 do
                            i.Transparency = v * (1 - p86) + p86;
                        end;
                    end);
                    local cage_mesh = u79.gameEntity:FindFirstChild("cage_mesh");

                    if cage_mesh then
                        task.delay(3, function() -- Line: 620
                            -- upvalues: cage_mesh (copy), default (ref), Linear (ref)
                            local Color = cage_mesh.Color;
                            default(0.5, Linear, function(p87) -- Line: 622
                                -- upvalues: cage_mesh (ref), Color (copy)
                                cage_mesh.Transparency = p87;
                                cage_mesh.Color = Color:Lerp(Color3.fromRGB(255, 215, 0), p87);
                            end);
                        end);

                        return;
                    end;

                    warn("No cage_mesh found in GooseBoss");
                end;
            end);
        end;
    end);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("StatefulEntityHpBarBillboard_" .. tostring(u79.entityUUID));
    task.delay(10, function() -- Line: 638
        -- upvalues: u79 (copy)
        local gameEntity = u79.gameEntity;

        if gameEntity ~= nil then
            gameEntity:Destroy();
        end;
    end);
end;

return {
    GooseBossClient = u8
};