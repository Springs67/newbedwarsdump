-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local StatefulEntityHpBarBillboard = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golem-boss", "golem-boss-constants");
local GOLEM_CLIENT_SOUND_DELAY = v3.GOLEM_CLIENT_SOUND_DELAY;
local GOLEM_HAMMER_RAISE_DURATION = v3.GOLEM_HAMMER_RAISE_DURATION;
local GOLEM_TURN_DURATION = v3.GOLEM_TURN_DURATION;
local GolemBossAction = v3.GolemBossAction;
local GolemBossState = v3.GolemBossState;
local GROUND_Y_OFFSET = v3.GROUND_Y_OFFSET;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatefulEntityTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag;
local StatefulEntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local GolemBossClient = RuntimeLib.import(script, script.Parent, "golem-boss-client").GolemBossClient;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 34, Name: __tostring
        return "BhaaBossClient";
    end,

    __index = GolemBossClient
});
u4.__index = u4;

function u4.new(...) -- Line: 40
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, ...) -- Line: 44
    -- upvalues: GolemBossClient (copy)
    GolemBossClient.constructor(p6, ...);
end;

function u4.createGameEntity(p7, p8) -- Line: 47
    -- upvalues: ReplicatedStorage (copy), StatefulEntityUtil (copy), StatefulEntityTag (copy), Workspace (copy), CollectionService (copy)
    local v9 = ReplicatedStorage.Assets.Misc.Bhaa:Clone();
    v9:WaitForChild("RootPart").Anchored = true;
    StatefulEntityUtil:setEntityIgnoreQuery(v9);
    StatefulEntityUtil:setClientEntityNotCollidable(v9);
    v9:PivotTo(p8 + Vector3.new(0, 1, 0));
    p7.gameEntity = v9;
    p7.gameEntity:AddTag("GameEntity_" .. StatefulEntityTag.BHAA);
    StatefulEntityUtil:hideStatefulEntity(p7.gameEntity);
    v9.Parent = Workspace;
    CollectionService:AddTag(v9, "Bhaa");
    p7:registerClientGameEntity(v9);
end;

function u4.onStateEnter(p10, p11) -- Line: 67
    -- upvalues: GolemBossState (copy), StatefulEntityUtil (copy)
    if not p10.gameEntity or (not p10.gameEntity.Parent or p10.isDead) then
        return nil;
    end;

    if p11 == GolemBossState.SPAWNING then
        StatefulEntityUtil:showStatefulEntity(p10.gameEntity);
        p10:onEnterSpawningState();
    end;

    if p11 == GolemBossState.IDLE then
        p10:onEnterIdleState();
    end;

    if p11 == GolemBossState.ROTATING then
        p10:onEnterRotatingState();
    end;

    if p11 == GolemBossState.PATROL then
        p10:onEnterIdleState();
    end;
end;

function u4.handleActionRequest(u12, p13, p14) -- Line: 86
    -- upvalues: GolemBossAction (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), StatefulEntityUtil (copy), GOLEM_TURN_DURATION (copy)
    if not u12.gameEntity or (not u12.gameEntity.Parent or u12.isDead) then
        return nil;
    end;

    if p13 == GolemBossAction.FIST_SLAM then
        u12:handleFistSlamActionRequest(p14);

        return;
    end;

    if p13 == GolemBossAction.HAMMER_SLAM then
        u12:handleHammerSlamActionRequest(p14);

        return;
    end;

    if p13 == GolemBossAction.PILLAR_SUMMON then
        u12:handlePillarSummonActionRequest(p14);

        return;
    end;

    if p13 == GolemBossAction.SKORP_SUMMON then
        AnimationUtil:playAnimation(u12.gameEntity, GameAnimationUtil:getAssetId(AnimationType.BHAA_SUMMON));

        return;
    end;

    if p13 == GolemBossAction.PATROL_TURN then
        StatefulEntityUtil:rotateTo(u12.gameEntity, p14.turnPosition, GOLEM_TURN_DURATION);
        local u15 = AnimationUtil:playAnimation(u12.gameEntity, GameAnimationUtil:getAssetId(AnimationType.BHAA_MOVEMENT), {
            looped = true
        });
        task.delay(1.8, function() -- Line: 111
            -- upvalues: u15 (copy), u12 (copy)
            local v16 = u15;

            if v16 ~= nil then
                v16:Stop();
            end;

            u12:onEnterIdleState();
        end);
    end;
end;

function u4.onEnterIdleState(p17) -- Line: 120
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    if not p17.gameEntity or (not p17.gameEntity.Parent or p17.isDead) then
        return nil;
    end;

    local track = p17.track;

    if track ~= nil then
        track:Stop();
    end;

    p17.track = AnimationUtil:playAnimation(p17.gameEntity, GameAnimationUtil:getAssetId(AnimationType.BHAA_IDLE), {
        looped = true
    });
end;

function u4.swing(p18, p19) -- Line: 132
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    if not p18.gameEntity or (not p18.gameEntity.Parent or p18.isDead) then
        return nil;
    end;

    local v20 = AnimationUtil:playAnimation(p18.gameEntity, GameAnimationUtil:getAssetId(AnimationType.ANUBIS_ATTACK));

    if v20 ~= nil then
        v20:AdjustSpeed(0.25);
    end;
end;

function u4.handleFistSlamActionRequest(u21, u22) -- Line: 142
    -- upvalues: StatefulEntityUtil (copy), GOLEM_TURN_DURATION (copy), GOLEM_CLIENT_SOUND_DELAY (copy), SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), KnitClient (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy)
    if not u21.gameEntity or (not u21.gameEntity.Parent or u21.isDead) then
        return nil;
    end;

    StatefulEntityUtil:rotateTo(u21.gameEntity, u22.slamPosition, GOLEM_TURN_DURATION):andThen(function() -- Line: 147
        -- upvalues: GOLEM_CLIENT_SOUND_DELAY (ref), SoundManager (ref), GameSound (ref), u22 (copy), AnimationUtil (ref), u21 (copy), GameAnimationUtil (ref), AnimationType (ref), KnitClient (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        task.delay(GOLEM_CLIENT_SOUND_DELAY, function() -- Line: 149
            -- upvalues: SoundManager (ref), GameSound (ref), u22 (ref)
            SoundManager:playSound(GameSound.BHAA_GRUNT_1, {
                position = u22.slamPosition
            });
        end);
        local u23 = AnimationUtil:playAnimation(u21.gameEntity, GameAnimationUtil:getAssetId(AnimationType.BHAA_ATTACK));

        if u23 ~= nil then
            u23:AdjustSpeed(0.5);
        end;

        KnitClient.Controllers.GolemBossController:showDangerIndicators(u21:convertLayersIntoDangerPositions(u22.dangerBlockPositions));

        if u23 then
            task.delay(1, function() -- Line: 162
                -- upvalues: u23 (copy), KnitClient (ref), u22 (ref), u21 (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
                local v24 = u23;

                if v24 ~= nil then
                    v24:AdjustSpeed(1);
                end;

                KnitClient.Controllers.GolemBossController:playShockwaveEffect(u22.dangerBlockPositions, nil, nil, u21.serverInstance);
                local v25 = ReplicatedStorage.Assets.Effects.GolemBossOverheadSlam:Clone();
                v25.Position = u22.slamPosition;

                local function _(p26) -- Line: 173
                    -- upvalues: u22 (ref)
                    if p26:IsA("BasePart") then
                        p26.Position = u22.slamPosition;
                    end;
                end;

                for i, child in v25:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("BasePart") then
                        child.Position = u22.slamPosition;
                    end;
                end;

                v25.Parent = Workspace;
                EffectUtil:playEffects({ v25 }, nil, {
                    destroyAfterSec = 2.5
                });
                u21:playScreenShakeEffect(u22.slamPosition, {
                    magnitude = 2
                });
            end);
        end;
    end);
end;

function u4.handleHammerSlamActionRequest(u27, u28) -- Line: 194
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), GROUND_Y_OFFSET (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy)
    if not (u27.gameEntity and u27.gameEntity.Parent) then
        return nil;
    end;

    local v29 = AnimationUtil:playAnimation(u27.gameEntity, GameAnimationUtil:getAssetId(AnimationType.BHAA_ROCKWAVE));

    if v29 ~= nil then
        v29:AdjustSpeed(0.7);
    end;

    if v29 then
        local u30 = u27.gameEntity:GetPivot().Position + GROUND_Y_OFFSET;
        SoundManager:playSound(GameSound.BHAA_GRUNT_2, {
            position = u30
        });
        task.delay(0.5, function() -- Line: 214
            -- upvalues: KnitClient (ref), u27 (copy), u28 (copy)
            KnitClient.Controllers.GolemBossController:showDangerIndicators(u27:convertLayersIntoDangerPositions(u28.dangerBlockPositions));
        end);
        task.delay(1.5, function() -- Line: 218
            -- upvalues: u27 (copy), ReplicatedStorage (ref), u30 (copy), Workspace (ref), EffectUtil (ref), KnitClient (ref), u28 (copy)
            if u27.gameEntity then
                local v31 = ReplicatedStorage.Assets.Effects.GolemBossGroundSlam:Clone();
                v31.Position = u30;
                v31.Parent = Workspace;
                EffectUtil:playEffects({ v31 }, nil, {
                    sizeMultiplier = 4,
                    destroyAfterSec = 2.5
                });
                u27:playScreenShakeEffect(u30, {
                    cycles = 20,
                    magnitude = 2
                });
            end;

            KnitClient.Controllers.GolemBossController:playShockwaveEffect(u28.dangerBlockPositions, nil, nil, u27.serverInstance);
        end);
    end;
end;

function u4.handlePillarSummonActionRequest(u32, u33) -- Line: 238
    -- upvalues: KnitClient (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), StatefulEntityUtil (copy), SoundManager (copy), GameSound (copy), GOLEM_HAMMER_RAISE_DURATION (copy), RandomUtil (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy)
    if not u32.gameEntity or (not u32.gameEntity.Parent or u32.isDead) then
        return nil;
    end;

    KnitClient.Controllers.GolemBossController:showDangerIndicators(u32:convertLayersIntoDangerPositions(u33.dangerBlockPositions));
    local v34 = AnimationUtil:playAnimation(u32.gameEntity, GameAnimationUtil:getAssetId(AnimationType.BHAA_ROCKSPIKE));

    if v34 ~= nil then
        v34:AdjustSpeed(1);
    end;

    if v34 then
        local Position = StatefulEntityUtil:getGameEntityCFrame(u32.gameEntity).Position;
        local serverInstance = u32.serverInstance;

        if serverInstance ~= nil then
            serverInstance = serverInstance:GetAttribute("BossType");
        end;

        SoundManager:playSound(GameSound.BHAA_SPIKE_WARMUP, {
            position = Position
        });
        task.delay(GOLEM_HAMMER_RAISE_DURATION, function() -- Line: 260
            -- upvalues: u32 (copy), KnitClient (ref), u33 (copy), RandomUtil (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
            if not u32.gameEntity or (not u32.gameEntity.Parent or u32.isDead) then
                return nil;
            end;

            KnitClient.Controllers.GolemBossController:playShockwaveEffect(u33.dangerBlockPositions, nil, nil, u32.serverInstance);

            if u33.pillarSummonLocations then
                u32:playScreenShakeEffect(RandomUtil.fromList(unpack(u33.pillarSummonLocations)), {
                    magnitude = 1
                });
                local pillarSummonLocations = u33.pillarSummonLocations;

                local function v37(p35) -- Line: 275
                    -- upvalues: ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
                    local v36 = ReplicatedStorage.Assets.Effects.GolemBossGroundSlam:Clone();
                    v36.Position = p35;
                    v36.Parent = Workspace;
                    EffectUtil:playEffects({ v36 }, nil, {
                        sizeMultiplier = 1.5,
                        destroyAfterSec = 2.5
                    });
                    SoundManager:playSound(GameSound.BHAA_SPIKE, {
                        position = p35
                    });
                end;

                for i, v in pillarSummonLocations do
                    v37(v, i - 1, pillarSummonLocations);
                end;
            end;

            if u33.pillarSummonLocations then
                u32:handleLegSpike(u33.pillarSummonLocations);
            end;
        end);
    end;
end;

function u4.onEnterSpawningState(u38) -- Line: 298
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), StatefulEntityUtil (copy), Players (copy), SoundManager (copy), GameSound (copy)
    if not (u38.gameEntity and u38.gameEntity.Parent) then
        return nil;
    end;

    local v39 = AnimationUtil:playAnimation(u38.gameEntity, GameAnimationUtil:getAssetId(AnimationType.BHAA_SPAWN), {
        looped = false
    });

    if v39 ~= nil then
        v39:AdjustSpeed(0.4);
    end;

    task.delay(0.5, function() -- Line: 311
        -- upvalues: u38 (copy), StatefulEntityUtil (ref)
        if not u38.gameEntity or (not u38.gameEntity.Parent or u38.isDead) then
            return nil;
        end;

        StatefulEntityUtil:showStatefulEntity(u38.gameEntity);
    end);

    if v39 then
        task.delay(1, function() -- Line: 318
            -- upvalues: u38 (copy), StatefulEntityUtil (ref), Players (ref), SoundManager (ref), GameSound (ref)
            if not u38.gameEntity or (not u38.gameEntity.Parent or u38.isDead) then
                return nil;
            end;

            local Position = StatefulEntityUtil:getGameEntityCFrame(u38.gameEntity).Position;
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;

                if Character ~= nil then
                    Character = Character.Position;
                end;
            end;

            if Character then
                Character = (Players.LocalPlayer.Character.PrimaryPart.Position - Position).Magnitude < 350;
            end;

            if Character then
                SoundManager:playSound(GameSound.BHAA_SPAWN);
            end;

            u38:playScreenShakeEffect(Position, {
                magnitude = 4
            });
        end);
    end;
end;

function u4.onEnterRotatingState(p40) -- Line: 345
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    if not p40.gameEntity or (not p40.gameEntity.Parent or p40.isDead) then
        return nil;
    end;

    local track = p40.track;

    if track ~= nil then
        track:Stop();
    end;

    p40.track = AnimationUtil:playAnimation(p40.gameEntity, GameAnimationUtil:getAssetId(AnimationType.BHAA_MOVEMENT), {
        looped = true
    });
end;

function u4.onEntityDeath(u41) -- Line: 357
    -- upvalues: Flamework (copy), StatefulEntityHpBarBillboard (copy), StatefulEntityUtil (copy), KnitClient (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    u41.isDead = true;

    if not (u41.gameEntity and u41.gameEntity.Parent) then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp({
        app = StatefulEntityHpBarBillboard,
        appId = "StatefulEntityHpBarBillboard_" .. tostring(u41.entityUUID)
    });
    local Position = StatefulEntityUtil:getGameEntityCFrame(u41.gameEntity).Position;
    task.spawn(function() -- Line: 371
        -- upvalues: KnitClient (ref)
        local v42 = 0;

        while v42 <= 4 do
            v42 = v42 + 1;
            KnitClient.Controllers.GolemBossController:hideAllBlockDangerIndicators();
            task.wait(0.5);
        end;
    end);
    task.delay(0.8, function() -- Line: 383
        -- upvalues: AnimationUtil (ref), u41 (copy), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), Position (copy)
        local u43 = AnimationUtil:playAnimation(u41.gameEntity, GameAnimationUtil:getAssetId(AnimationType.BHAA_DEATH), {
            looped = false
        });

        if u43 then
            task.delay(2, function() -- Line: 389
                -- upvalues: u43 (copy), u41 (ref), SoundManager (ref), GameSound (ref), Position (ref)
                u43:AdjustSpeed(0);
                local serverInstance = u41.serverInstance;

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

                u41:playScreenShakeEffect(Position, {
                    magnitude = 4
                });
            end);
        end;
    end);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("StatefulEntityHpBarBillboard_" .. tostring(u41.entityUUID));
    task.delay(5, function() -- Line: 421
        -- upvalues: u41 (copy)
        local gameEntity = u41.gameEntity;

        if gameEntity ~= nil then
            gameEntity = gameEntity:Destroy();
        end;

        return gameEntity;
    end);
end;

function u4.handleLegSpike(p44, p45) -- Line: 429
    -- upvalues: ReplicatedStorage (copy), RandomUtil (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy), RuntimeLib (copy), TweenService (copy)
    local function u56(p46) -- Line: 430
        -- upvalues: ReplicatedStorage (ref), RandomUtil (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref), RuntimeLib (ref), TweenService (ref)
        local v47 = ReplicatedStorage.Assets.Effects.BhaaSpike:GetChildren();
        local u48 = RandomUtil.fromList(unpack(v47)):Clone();
        u48.Size = u48.Size * 0.75;
        local u49 = Vector3.FromNormalId(Enum.NormalId.Top) * (u48.Size.Y / 2 - 1);
        local u50 = Vector3.FromNormalId(Enum.NormalId.Bottom) * (u48.Size.Y / 2);
        local u51 = CFrame.new(p46);
        u48.Anchored = true;
        u48:PivotTo(u51 + u50);
        u48.Parent = Workspace;
        local v52 = ReplicatedStorage.Assets.Effects.DustLandEffect:Clone();
        v52:PivotTo(u51);
        v52.Parent = Workspace;
        local v53 = EffectUtil:enableInstanceEffect(v52);
        SoundManager:playSound(GameSound.FALLING_ROCKS, {
            volumeMultiplier = 2,
            rollOffMaxDistance = 150,
            position = u51.Position
        });
        task.wait(1);
        v53:DoCleaning();
        RuntimeLib.Promise.defer(function() -- Line: 461
            -- upvalues: SoundManager (ref), GameSound (ref), u51 (copy), TweenService (ref), u48 (copy), u49 (copy), u50 (copy)
            SoundManager:playSound(GameSound.SPIKE_ERUPT, {
                volumeMultiplier = 2,
                rollOffMaxDistance = 150,
                position = u51.Position
            });
            local v54 = TweenService:Create(u48, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false), {
                CFrame = u51 + u49
            });
            v54:Play();
            v54.Completed:Wait();
            task.wait(0.7);
            local v55 = TweenService:Create(u48, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false), {
                CFrame = u51 + u50
            });
            v55:Play();
            v55.Completed:Wait();
            u48:Destroy();
        end);
    end;

    local function _(u57) -- Line: 482
        -- upvalues: u56 (copy)
        task.spawn(function() -- Line: 483
            -- upvalues: u56 (ref), u57 (copy)
            u56(u57);
        end);
    end;

    for i, v in p45 do
        local _ = i - 1;
        task.spawn(function() -- Line: 483
            -- upvalues: u56 (copy), v (copy)
            u56(v);
        end);
    end;
end;

return {
    BhaaBossClient = u4
};