-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local StatefulEntityHpBarBillboard = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local getCurrentStatefulEntitySkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-skin-theme-meta").getCurrentStatefulEntitySkinMeta;
local StatefulEntityType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-type").StatefulEntityType;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golem-boss", "golem-boss-constants");
local GOLEM_CLIENT_SOUND_DELAY = v3.GOLEM_CLIENT_SOUND_DELAY;
local GOLEM_FOOTSTEP_SOUNDS = v3.GOLEM_FOOTSTEP_SOUNDS;
local GOLEM_SCREEN_SHAKE_THRESHOLD = v3.GOLEM_SCREEN_SHAKE_THRESHOLD;
local GOLEM_TURN_DURATION = v3.GOLEM_TURN_DURATION;
local GolemBossAction = v3.GolemBossAction;
local GolemBossState = v3.GolemBossState;
local GROUND_Y_OFFSET = v3.GROUND_Y_OFFSET;
local SpiritGolemBossConstants = v3.SpiritGolemBossConstants;
local VoidGolemBossConstants = v3.VoidGolemBossConstants;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatefulEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity").StatefulEntity;
local StatefulEntityTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag;
local StatefulEntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 39, Name: __tostring
        return "GolemBossClient";
    end,

    __index = StatefulEntity
});
u4.__index = u4;

function u4.new(...) -- Line: 45
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, p7, p8, p9) -- Line: 49
    -- upvalues: StatefulEntity (copy), GolemBossState (copy), StatefulEntityTag (copy)
    StatefulEntity.constructor(p6, GolemBossState.SPAWNING, StatefulEntityTag.GOLEM_BOSS, p7, p8);
    p6.isDead = false;
    p6.serverInstance = p9;
    p6:createEntityHealthbar();
end;

function u4.createEntityHealthbar(p10) -- Line: 56
    -- upvalues: Flamework (copy), StatefulEntityHpBarBillboard (copy)
    if p10.gameEntity and p10.serverInstance then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            app = StatefulEntityHpBarBillboard,
            appId = "StatefulEntityHpBarBillboard_" .. tostring(p10.entityUUID)
        }, {
            hpBarOffset = Vector3.new(0, 6.5, 0),
            gameEntity = p10.gameEntity,
            serverInstance = p10.serverInstance
        }, nil, p10.gameEntity);
    end;
end;

function u4.createGameEntity(p11, p12) -- Line: 68
    -- upvalues: getCurrentStatefulEntitySkinMeta (copy), StatefulEntityType (copy), StatefulEntityUtil (copy), StatefulEntityTag (copy), Workspace (copy)
    local v13 = getCurrentStatefulEntitySkinMeta(StatefulEntityType.GOLEM_BOSS).model:Clone();
    v13:WaitForChild("RootPart").Anchored = true;
    StatefulEntityUtil:setEntityIgnoreQuery(v13);
    StatefulEntityUtil:setClientEntityNotCollidable(v13);
    v13:PivotTo(p12);
    p11.gameEntity = v13;
    p11.gameEntity:AddTag("GameEntity_" .. StatefulEntityTag.GOLEM_BOSS);
    StatefulEntityUtil:hideStatefulEntity(p11.gameEntity);
    v13.Parent = Workspace;
    p11:registerClientGameEntity(v13);
end;

function u4.handleActionRequest(p14, p15, p16) -- Line: 84
    -- upvalues: GolemBossAction (copy)
    if not p14.gameEntity or (not p14.gameEntity.Parent or p14.isDead) then
        return nil;
    end;

    if p15 == GolemBossAction.FIST_SLAM then
        p14:handleFistSlamActionRequest(p16);

        return;
    end;

    if p15 == GolemBossAction.HAMMER_SLAM then
        p14:handleHammerSlamActionRequest(p16);

        return;
    end;

    if p15 == GolemBossAction.PILLAR_SUMMON then
        p14:handlePillarSummonActionRequest(p16);

        return;
    end;

    if p15 == GolemBossAction.PATROL_TURN then
        p14:handlePatrolTurnActionRequest(p16);
    end;
end;

function u4.handlePatrolTurnActionRequest(p17, p18) -- Line: 103
    -- upvalues: StatefulEntityUtil (copy), GOLEM_TURN_DURATION (copy)
    if not p17.gameEntity or (not p17.gameEntity.Parent or p17.isDead) then
        return nil;
    end;

    StatefulEntityUtil:rotateTo(p17.gameEntity, p18.turnPosition, GOLEM_TURN_DURATION);
end;

function u4.handleFistSlamActionRequest(u19, u20) -- Line: 110
    -- upvalues: StatefulEntityUtil (copy), GOLEM_TURN_DURATION (copy), GOLEM_CLIENT_SOUND_DELAY (copy), SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), KnitClient (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy)
    if not u19.gameEntity or (not u19.gameEntity.Parent or u19.isDead) then
        return nil;
    end;

    StatefulEntityUtil:rotateTo(u19.gameEntity, u20.slamPosition, GOLEM_TURN_DURATION):andThen(function() -- Line: 115
        -- upvalues: GOLEM_CLIENT_SOUND_DELAY (ref), SoundManager (ref), GameSound (ref), u20 (copy), AnimationUtil (ref), u19 (copy), GameAnimationUtil (ref), AnimationType (ref), KnitClient (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        task.delay(GOLEM_CLIENT_SOUND_DELAY, function() -- Line: 117
            -- upvalues: SoundManager (ref), GameSound (ref), u20 (ref)
            SoundManager:playSound(GameSound.TITAN_HAMMER_SLAM, {
                position = u20.slamPosition
            });
        end);
        local v21 = AnimationUtil:playAnimation(u19.gameEntity, GameAnimationUtil:getAssetId(AnimationType.GOLEM_BOSS_FIST_SLAM), {
            looped = false
        });
        KnitClient.Controllers.GolemBossController:showDangerIndicators(u19:convertLayersIntoDangerPositions(u20.dangerBlockPositions));

        if v21 then
            v21:GetMarkerReachedSignal("fistImpact"):Connect(function() -- Line: 128
                -- upvalues: KnitClient (ref), u20 (ref), u19 (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
                KnitClient.Controllers.GolemBossController:playShockwaveEffect(u20.dangerBlockPositions, nil, nil, u19.serverInstance);
                local v22 = ReplicatedStorage.Assets.Effects.GolemBossOverheadSlam:Clone();
                v22.Position = u20.slamPosition;

                local function _(p23) -- Line: 135
                    -- upvalues: u20 (ref)
                    if p23:IsA("BasePart") then
                        p23.Position = u20.slamPosition;
                    end;
                end;

                for i, child in v22:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("BasePart") then
                        child.Position = u20.slamPosition;
                    end;
                end;

                v22.Parent = Workspace;
                EffectUtil:playEffects({ v22 }, nil, {
                    destroyAfterSec = 2.5
                });
                u19:playScreenShakeEffect(u20.slamPosition, {
                    magnitude = 2
                });
            end);
        end;
    end);
end;

function u4.handleHammerSlamActionRequest(u24, u25) -- Line: 156
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), GROUND_Y_OFFSET (copy), GOLEM_CLIENT_SOUND_DELAY (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), KnitClient (copy)
    if not (u24.gameEntity and u24.gameEntity.Parent) then
        return nil;
    end;

    local u26 = AnimationUtil:playAnimation(u24.gameEntity, GameAnimationUtil:getAssetId(AnimationType.GOLEM_BOSS_HAMMER_SLAM), {
        looped = false
    });

    if u26 then
        local u27 = u24.gameEntity:GetPivot().Position + GROUND_Y_OFFSET;
        task.delay(GOLEM_CLIENT_SOUND_DELAY, function() -- Line: 166
            -- upvalues: u24 (copy), SoundManager (ref), GameSound (ref), u27 (copy)
            local serverInstance = u24.serverInstance;

            if serverInstance ~= nil then
                serverInstance = serverInstance:GetAttribute("BossType");
            end;

            if serverInstance == "SpiritGolem" then
                SoundManager:playSound(GameSound.SPIRIT_TITAN_HAMMER_SLAM, {
                    position = u27
                });

                return;
            end;

            if serverInstance == "VoidGolem" then
                SoundManager:playSound(GameSound.VOID_TITAN_HAMMER_SLAM, {
                    position = u27
                });

                return;
            end;

            SoundManager:playSound(GameSound.TITAN_HAMMER_SLAM, {
                position = u27
            });
        end);
        u26:GetMarkerReachedSignal("slamImpact"):Connect(function() -- Line: 186
            -- upvalues: u24 (copy), ReplicatedStorage (ref), u27 (copy), Workspace (ref), EffectUtil (ref), u26 (copy), KnitClient (ref), u25 (copy)
            if u24.gameEntity then
                local v28 = ReplicatedStorage.Assets.Effects.GolemBossGroundSlam:Clone();
                v28.Position = u27;
                v28.Parent = Workspace;
                EffectUtil:playEffects({ v28 }, nil, {
                    sizeMultiplier = 4,
                    destroyAfterSec = 2.5
                });
                u24:playScreenShakeEffect(u27, {
                    cycles = 20,
                    magnitude = 2
                });
            end;

            u26:AdjustSpeed(0);
            KnitClient.Controllers.GolemBossController:showDangerIndicators(u24:convertLayersIntoDangerPositions(u25.dangerBlockPositions));
            KnitClient.Controllers.GolemBossController:playShockwaveEffect(u25.dangerBlockPositions, nil, nil, u24.serverInstance);
        end);
    end;
end;

function u4.handlePillarSummonActionRequest(u29, u30) -- Line: 210
    -- upvalues: KnitClient (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), StatefulEntityUtil (copy), SoundManager (copy), GameSound (copy), RandomUtil (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy)
    if not u29.gameEntity or (not u29.gameEntity.Parent or u29.isDead) then
        return nil;
    end;

    KnitClient.Controllers.GolemBossController:showDangerIndicators(u29:convertLayersIntoDangerPositions(u30.dangerBlockPositions));

    if AnimationUtil:playAnimation(u29.gameEntity, GameAnimationUtil:getAssetId(AnimationType.GOLEM_BOSS_HAMMER_RAISE), {
        looped = false
    }) then
        local Position = StatefulEntityUtil:getGameEntityCFrame(u29.gameEntity).Position;
        local serverInstance = u29.serverInstance;

        if serverInstance ~= nil then
            serverInstance = serverInstance:GetAttribute("BossType");
        end;

        if serverInstance == "SpiritGolem" then
            SoundManager:playSound(GameSound.SPIRIT_TITAN_SUMMON_PILLARS, {
                position = Position
            });
        elseif serverInstance == "VoidGolem" then
            SoundManager:playSound(GameSound.VOID_TITAN_SUMMON_PILLARS, {
                position = Position
            });
        else
            SoundManager:playSound(GameSound.TITAN_SUMMON_PILLARS, {
                position = Position
            });
        end;

        task.delay(0.5, function() -- Line: 240
            -- upvalues: u30 (copy), RandomUtil (ref), u29 (copy), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), KnitClient (ref)
            if u30.pillarSummonLocations then
                u29:playScreenShakeEffect(RandomUtil.fromList(unpack(u30.pillarSummonLocations)), {
                    magnitude = 1
                });
                local pillarSummonLocations = u30.pillarSummonLocations;

                local function v33(p31) -- Line: 248
                    -- upvalues: ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
                    local v32 = ReplicatedStorage.Assets.Effects.GolemBossGroundSlam:Clone();
                    v32.Position = p31;
                    v32.Parent = Workspace;
                    EffectUtil:playEffects({ v32 }, nil, {
                        sizeMultiplier = 1.5,
                        destroyAfterSec = 2.5
                    });
                end;

                for i, v in pillarSummonLocations do
                    v33(v, i - 1, pillarSummonLocations);
                end;
            end;

            KnitClient.Controllers.GolemBossController:playShockwaveEffect(u30.dangerBlockPositions, nil, true, u29.serverInstance);
        end);
    end;
end;

function u4.onStateEnter(p34, p35) -- Line: 266
    -- upvalues: GolemBossState (copy)
    if not p34.gameEntity or (not p34.gameEntity.Parent or p34.isDead) then
        return nil;
    end;

    if p35 == GolemBossState.SPAWNING then
        p34:onEnterSpawningState();
    end;

    if p35 == GolemBossState.IDLE then
        p34:onEnterIdleState();
    end;

    if p35 == GolemBossState.ROTATING then
        p34:onEnterRotatingState();
    end;

    if p35 == GolemBossState.PATROL then
        p34:onEnterPatrolState();
    end;
end;

function u4.onEnterPatrolState(u36) -- Line: 284
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), GROUND_Y_OFFSET (copy), SpiritGolemBossConstants (copy), VoidGolemBossConstants (copy), GOLEM_FOOTSTEP_SOUNDS (copy), RandomUtil (copy), SoundManager (copy)
    if not u36.gameEntity or (not u36.gameEntity.Parent or u36.isDead) then
        return nil;
    end;

    local v37 = AnimationUtil:playAnimation(u36.gameEntity, GameAnimationUtil:getAssetId(AnimationType.GOLEM_BOSS_MOVE), {
        looped = true
    });

    if v37 then
        local u38 = u36.gameEntity:GetPivot().Position + GROUND_Y_OFFSET;
        local serverInstance = u36.serverInstance;

        if serverInstance ~= nil then
            serverInstance = serverInstance:GetAttribute("BossType");
        end;

        local u39;

        if serverInstance == "SpiritGolem" then
            u39 = SpiritGolemBossConstants.SPIRIT_GOLEM_FOOTSTEP_SOUNDS;
        elseif serverInstance == "VoidGolem" then
            u39 = VoidGolemBossConstants.VOID_GOLEM_FOOTSTEP_SOUNDS;
        else
            u39 = GOLEM_FOOTSTEP_SOUNDS;
        end;

        v37:GetMarkerReachedSignal("leftFootImpact"):Connect(function() -- Line: 308
            -- upvalues: RandomUtil (ref), u39 (ref), SoundManager (ref), u38 (copy), u36 (copy)
            SoundManager:playSound(RandomUtil.fromList(unpack(u39)), {
                position = u38
            });
            u36:playScreenShakeEffect(u38, {
                magnitude = 0.5
            });
        end);
        v37:GetMarkerReachedSignal("rightFootImpact"):Connect(function() -- Line: 318
            -- upvalues: RandomUtil (ref), u39 (ref), SoundManager (ref), u38 (copy), u36 (copy)
            SoundManager:playSound(RandomUtil.fromList(unpack(u39)), {
                position = u38
            });
            u36:playScreenShakeEffect(u38, {
                magnitude = 0.5
            });
        end);
    end;
end;

function u4.onEnterSpawningState(u40) -- Line: 330
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), StatefulEntityUtil (copy), SoundManager (copy), GameSound (copy)
    if not (u40.gameEntity and u40.gameEntity.Parent) then
        return nil;
    end;

    local v41 = AnimationUtil:playAnimation(u40.gameEntity, GameAnimationUtil:getAssetId(AnimationType.GOLEM_BOSS_SPAWN), {
        looped = false
    });
    task.delay(0.5, function() -- Line: 339
        -- upvalues: u40 (copy), StatefulEntityUtil (ref)
        if not u40.gameEntity or (not u40.gameEntity.Parent or u40.isDead) then
            return nil;
        end;

        StatefulEntityUtil:showStatefulEntity(u40.gameEntity);
    end);

    if v41 then
        v41:GetMarkerReachedSignal("spawnComplete"):Connect(function() -- Line: 346
            -- upvalues: u40 (copy), StatefulEntityUtil (ref), SoundManager (ref), GameSound (ref)
            if not u40.gameEntity or (not u40.gameEntity.Parent or u40.isDead) then
                return nil;
            end;

            local Position = StatefulEntityUtil:getGameEntityCFrame(u40.gameEntity).Position;
            SoundManager:playSound(GameSound.TITAN_IDLE_SPAWN, {
                position = Position
            });
            u40:playScreenShakeEffect(Position, {
                magnitude = 4
            });
        end);
    end;
end;

function u4.onEnterIdleState(p42) -- Line: 361
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    if not p42.gameEntity or (not p42.gameEntity.Parent or p42.isDead) then
        return nil;
    end;

    AnimationUtil:playAnimation(p42.gameEntity, GameAnimationUtil:getAssetId(AnimationType.GOLEM_BOSS_IDLE), {
        looped = true
    });
end;

function u4.onEnterRotatingState(u43) -- Line: 369
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), GROUND_Y_OFFSET (copy), RandomUtil (copy), GOLEM_FOOTSTEP_SOUNDS (copy), SoundManager (copy)
    if not u43.gameEntity or (not u43.gameEntity.Parent or u43.isDead) then
        return nil;
    end;

    local v44 = AnimationUtil:playAnimation(u43.gameEntity, GameAnimationUtil:getAssetId(AnimationType.GOLEM_BOSS_MOVE), {
        looped = true
    });

    if v44 then
        local u45 = u43.gameEntity:GetPivot().Position + GROUND_Y_OFFSET;
        v44:GetMarkerReachedSignal("leftFootImpact"):Connect(function() -- Line: 379
            -- upvalues: RandomUtil (ref), GOLEM_FOOTSTEP_SOUNDS (ref), SoundManager (ref), u45 (copy), u43 (copy)
            SoundManager:playSound(RandomUtil.fromList(unpack(GOLEM_FOOTSTEP_SOUNDS)), {
                position = u45
            });
            u43:playScreenShakeEffect(u45, {
                magnitude = 0.5
            });
        end);
        v44:GetMarkerReachedSignal("rightFootImpact"):Connect(function() -- Line: 389
            -- upvalues: RandomUtil (ref), GOLEM_FOOTSTEP_SOUNDS (ref), SoundManager (ref), u45 (copy), u43 (copy)
            SoundManager:playSound(RandomUtil.fromList(unpack(GOLEM_FOOTSTEP_SOUNDS)), {
                position = u45
            });
            u43:playScreenShakeEffect(u45, {
                magnitude = 0.5
            });
        end);
    end;
end;

function u4.playScreenShakeEffect(p46, p47, p48) -- Line: 401
    -- upvalues: StatefulEntityUtil (copy), GOLEM_SCREEN_SHAKE_THRESHOLD (copy), Players (copy), KnitClient (copy)
    if not (p46.gameEntity and p46.gameEntity.Parent) then
        return nil;
    end;

    local v49 = StatefulEntityUtil:localPlayerDistanceFromEntity(p46.gameEntity);

    if v49 ~= 0 and (v49 == v49 and v49) then
        v49 = v49 <= GOLEM_SCREEN_SHAKE_THRESHOLD;
    end;

    if v49 ~= 0 and (v49 == v49 and v49) then
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:GetPivot().Position;
        end;

        if not Character then
            return nil;
        end;

        KnitClient.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), (Character - p47).Unit, p48);
    end;
end;

function u4.onStateExit(p50, p51) -- Line: 425
end;

function u4.onEntityDamaged(p52, p53, p54) -- Line: 427
end;

function u4.onEntityDeath(u55) -- Line: 429
    -- upvalues: Flamework (copy), StatefulEntityHpBarBillboard (copy), StatefulEntityUtil (copy), KnitClient (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    u55.isDead = true;

    if not (u55.gameEntity and u55.gameEntity.Parent) then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp({
        app = StatefulEntityHpBarBillboard,
        appId = "StatefulEntityHpBarBillboard_" .. tostring(u55.entityUUID)
    });
    local Position = StatefulEntityUtil:getGameEntityCFrame(u55.gameEntity).Position;
    task.spawn(function() -- Line: 443
        -- upvalues: KnitClient (ref)
        local v56 = 0;

        while v56 <= 4 do
            v56 = v56 + 1;
            KnitClient.Controllers.GolemBossController:hideAllBlockDangerIndicators();
            task.wait(0.5);
        end;
    end);
    task.delay(0.8, function() -- Line: 455
        -- upvalues: AnimationUtil (ref), u55 (copy), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), Position (copy)
        local u57 = AnimationUtil:playAnimation(u55.gameEntity, GameAnimationUtil:getAssetId(AnimationType.GOLEM_BOSS_DEATH), {
            looped = false
        });

        if u57 then
            u57:GetMarkerReachedSignal("bodyImpact"):Connect(function() -- Line: 461
                -- upvalues: u57 (copy), u55 (ref), SoundManager (ref), GameSound (ref), Position (ref)
                u57:AdjustSpeed(0);
                local serverInstance = u55.serverInstance;

                if serverInstance ~= nil then
                    serverInstance = serverInstance:GetAttribute("BossType");
                end;

                if serverInstance == "SpiritGolem" then
                    SoundManager:playSound(GameSound.SPIRIT_TITAN_DEATH_2, {
                        position = Position
                    });
                elseif serverInstance == "VoidGolem" then
                    SoundManager:playSound(GameSound.VOID_TITAN_DEATH_2, {
                        position = Position
                    });
                else
                    SoundManager:playSound(GameSound.TITAN_DEATH_2, {
                        position = Position
                    });
                end;

                u55:playScreenShakeEffect(Position, {
                    magnitude = 4
                });
            end);
        end;
    end);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("StatefulEntityHpBarBillboard_" .. tostring(u55.entityUUID));
    task.delay(5, function() -- Line: 493
        -- upvalues: u55 (copy)
        local gameEntity = u55.gameEntity;

        if gameEntity ~= nil then
            gameEntity = gameEntity:Destroy();
        end;

        return gameEntity;
    end);
end;

function u4.convertLayersIntoDangerPositions(p58, p59) -- Line: 501
    local v60 = {};

    for _, v in p59 do
        for _, v4 in v do
            table.insert(v60, v4);
        end;
    end;

    return v60;
end;

function u4.getGolemModel(p61) -- Line: 510
    return p61.gameEntity;
end;

return {
    GolemBossClient = u4
};