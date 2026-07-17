-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local StatefulEntityHpBarBillboard = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local getCurrentStatefulEntitySkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-skin-theme-meta").getCurrentStatefulEntitySkinMeta;
local StatefulEntityType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-type").StatefulEntityType;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "diamond-guardian", "diamond-guardian-constants");
local DiamondGuardianAction = v3.DiamondGuardianAction;
local DiamondGuardianState = v3.DiamondGuardianState;
local GUARDIAN_TURN_DURATION = v3.GUARDIAN_TURN_DURATION;
local GUARDIAN_TURN_RATE = v3.GUARDIAN_TURN_RATE;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatefulEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity").StatefulEntity;
local StatefulEntityTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag;
local StatefulEntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil;
local u4 = { AnimationType.DIAMOND_GUARDIAN_ATTACK_1 };
local u5 = { GameSound.GUARDIAN_HIT_1, GameSound.GUARDIAN_HIT_2, GameSound.GUARDIAN_HIT_3 };
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 35, Name: __tostring
        return "DiamondGuardianClient";
    end,

    __index = StatefulEntity
});
u6.__index = u6;

function u6.new(...) -- Line: 41
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, p9, p10, p11) -- Line: 45
    -- upvalues: StatefulEntity (copy), DiamondGuardianState (copy), StatefulEntityTag (copy)
    StatefulEntity.constructor(p8, DiamondGuardianState.SPAWNING, StatefulEntityTag.DIAMOND_GUARDIAN, p9, p10);
    p8.rotationBeingInterpolated = false;
    p8.isFlashing = false;
    p8.serverInstance = p11;
    p8:createEntityHealthbar();
end;

function u6.createEntityHealthbar(p12) -- Line: 53
    -- upvalues: Flamework (copy), StatefulEntityHpBarBillboard (copy)
    if p12.gameEntity and p12.serverInstance then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            app = StatefulEntityHpBarBillboard,
            appId = "StatefulEntityHpBarBillboard_" .. tostring(p12.entityUUID)
        }, {
            hpBarOffset = Vector3.new(0, 3.5, 0),
            gameEntity = p12.gameEntity,
            serverInstance = p12.serverInstance
        }, nil, p12.gameEntity);
    end;
end;

function u6.createGameEntity(p13, p14) -- Line: 65
    -- upvalues: getCurrentStatefulEntitySkinMeta (copy), StatefulEntityType (copy), StatefulEntityUtil (copy), StatefulEntityTag (copy), Workspace (copy)
    local v15 = getCurrentStatefulEntitySkinMeta(StatefulEntityType.DIAMOND_GUARDIAN).model:Clone();
    StatefulEntityUtil:setEntityIgnoreQuery(v15);
    StatefulEntityUtil:setClientEntityNotCollidable(v15);
    v15:PivotTo(p14);
    p13.gameEntity = v15;
    p13.gameEntity:AddTag("GameEntity_" .. StatefulEntityTag.DIAMOND_GUARDIAN);
    v15.Parent = Workspace;
    p13:onHeartbeat();
    p13:registerClientGameEntity(v15);
end;

function u6.onEntityDamaged(p16, p17, p18) -- Line: 79
    -- upvalues: RandomUtil (copy), u5 (copy), SoundManager (copy)
    if not p16.gameEntity then
        return nil;
    end;

    SoundManager:playSound(RandomUtil.fromList(unpack(u5)), {
        rollOffMaxDistance = 20,
        position = p16.gameEntity:GetPivot().Position
    });
    p16:playEntityFlashEffect();
end;

function u6.onEntityDeath(u19) -- Line: 93
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), Flamework (copy)
    local v20 = AnimationUtil:playAnimation(u19.gameEntity, GameAnimationUtil:getAssetId(AnimationType.DIAMOND_GUARDIAN_DEATH), {
        looped = false
    });

    if v20 ~= nil then
        v20.Stopped:Connect(function() -- Line: 101
            -- upvalues: u19 (copy)
            local gameEntity = u19.gameEntity;

            if gameEntity ~= nil then
                gameEntity = gameEntity:Destroy();
            end;

            return gameEntity;
        end);
    end;

    task.delay(3, function() -- Line: 111
        -- upvalues: u19 (copy)
        if u19.gameEntity and u19.gameEntity.Parent then
            u19.gameEntity:Destroy();
        end;
    end);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("StatefulEntityHpBarBillboard_" .. tostring(u19.entityUUID));
end;

function u6.onStateEnter(p21, p22) -- Line: 119
    -- upvalues: DiamondGuardianState (copy)
    if p22 == DiamondGuardianState.IDLE then
        p21:onEnterIdleState();
    end;
end;

function u6.onStateExit(p23, p24) -- Line: 124
end;

function u6.handleActionRequest(p25, p26, p27) -- Line: 126
    -- upvalues: DiamondGuardianAction (copy)
    if p26 == DiamondGuardianAction.MOVE then
        p25:handleMoveActionRequest(p27);

        return;
    end;

    if p26 == DiamondGuardianAction.FOLLOW_ATTACK then
        p25:handleFollowAttackActionRequest(p27);

        return;
    end;

    if p26 == DiamondGuardianAction.ATTACK then
        p25:handleAttackActionRequest();

        return;
    end;

    if p26 == DiamondGuardianAction.REMOVE_TARGET then
        p25.currentTarget = nil;
    end;
end;

function u6.handleMoveActionRequest(p28, p29) -- Line: 139
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), StatefulEntityUtil (copy), GUARDIAN_TURN_RATE (copy)
    if not (p28.gameEntity and p28.gameEntity.Parent) then
        return nil;
    end;

    AnimationUtil:playAnimation(p28.gameEntity, GameAnimationUtil:getAssetId(AnimationType.DIAMOND_GUARDIAN_MOVE), {
        looped = true
    });
    StatefulEntityUtil:clientMoveTo(p28.gameEntity, p29.targetPosition, p29.moveSpeed, GUARDIAN_TURN_RATE, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
end;

function u6.handleFollowAttackActionRequest(u30, p31) -- Line: 148
    -- upvalues: StatefulEntityUtil (copy), GUARDIAN_TURN_RATE (copy), GUARDIAN_TURN_DURATION (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    if not (u30.gameEntity and u30.gameEntity.Parent) then
        return nil;
    end;

    u30.currentTarget = p31.targetEntityInstance;
    StatefulEntityUtil:clientMoveTo(u30.gameEntity, p31.targetPosition, p31.moveSpeed, GUARDIAN_TURN_RATE, Enum.EasingStyle.Sine, Enum.EasingDirection.Out):andThen(function() -- Line: 154
        -- upvalues: u30 (copy), StatefulEntityUtil (ref), GUARDIAN_TURN_DURATION (ref)
        if not u30.gameEntity then
            return nil;
        end;

        local currentTarget = u30.currentTarget;

        if currentTarget ~= nil then
            currentTarget = currentTarget:GetPivot().Position;
        end;

        if not currentTarget then
            return nil;
        end;

        u30.rotationBeingInterpolated = true;
        StatefulEntityUtil:rotateTo(u30.gameEntity, currentTarget, GUARDIAN_TURN_DURATION):andThen(function() -- Line: 168
            -- upvalues: u30 (ref)
            u30.rotationBeingInterpolated = false;

            return u30.rotationBeingInterpolated;
        end);
    end);
    AnimationUtil:playAnimation(u30.gameEntity, GameAnimationUtil:getAssetId(AnimationType.DIAMOND_GUARDIAN_MOVE), {
        looped = true
    });
    task.delay(0.2, function() -- Line: 180
        -- upvalues: u30 (copy), AnimationUtil (ref), SoundManager (ref), GameSound (ref)
        if not (u30.gameEntity and u30.gameEntity.Parent) then
            return nil;
        end;

        local Position = u30.gameEntity:GetPivot().Position;
        AnimationUtil:playAnimation(u30.gameEntity, u30:getRandomAttackAnimation(), {
            looped = false
        });
        SoundManager:playSound(GameSound.GUARDIAN_ATTACK, {
            position = Position
        });
    end);
end;

function u6.handleAttackActionRequest(p32) -- Line: 193
    -- upvalues: AnimationUtil (copy), SoundManager (copy), GameSound (copy)
    if not (p32.gameEntity and p32.gameEntity.Parent) then
        return nil;
    end;

    local Position = p32.gameEntity:GetPivot().Position;
    AnimationUtil:playAnimation(p32.gameEntity, p32:getRandomAttackAnimation(), {
        looped = false
    });
    SoundManager:playSound(GameSound.GUARDIAN_ATTACK, {
        position = Position
    });
end;

function u6.onEnterIdleState(p33) -- Line: 205
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    if not (p33.gameEntity and p33.gameEntity.Parent) then
        return nil;
    end;

    AnimationUtil:playAnimation(p33.gameEntity, GameAnimationUtil:getAssetId(AnimationType.DIAMOND_GUARDIAN_IDLE), {
        looped = true
    });
end;

function u6.onHeartbeat(u34) -- Line: 213
    -- upvalues: RunService (copy), StatefulEntityUtil (copy)
    u34.deathMaid:GiveTask(RunService.Heartbeat:Connect(function(p35) -- Line: 214
        -- upvalues: u34 (copy), StatefulEntityUtil (ref)
        if not (u34.gameEntity and u34.gameEntity.Parent) then
            return nil;
        end;

        if not u34.currentTarget then
            return nil;
        end;

        if u34.rotationBeingInterpolated then
            return nil;
        end;

        local Position = u34.currentTarget:GetPivot().Position;
        StatefulEntityUtil:rotateTo(u34.gameEntity, Position);
    end));
end;

function u6.playEntityFlashEffect(u36) -- Line: 230
    if u36.isFlashing then
        return nil;
    end;

    u36.isFlashing = true;
    task.spawn(function() -- Line: 235
        -- upvalues: u36 (copy)
        if not (u36.gameEntity and u36.gameEntity.Parent) then
            return nil;
        end;

        local GuardianMesh = u36.gameEntity:WaitForChild("GuardianMesh");
        local NeonMesh = u36.gameEntity:WaitForChild("NeonMesh");
        local TextureID = GuardianMesh.TextureID;
        local Material = GuardianMesh.Material;
        local Color = NeonMesh.Color;
        local Transparency = NeonMesh.Transparency;
        GuardianMesh.TextureID = "";
        GuardianMesh.Material = Enum.Material.Neon;
        GuardianMesh.Color = Color3.fromRGB(255, 255, 255);
        NeonMesh.Color = Color3.fromRGB(255, 255, 255);
        NeonMesh.Transparency = 0.65;
        task.delay(0.1, function() -- Line: 252
            -- upvalues: GuardianMesh (copy), TextureID (copy), Material (copy), NeonMesh (copy), Color (copy), Transparency (copy), u36 (ref)
            GuardianMesh.TextureID = TextureID;
            GuardianMesh.Material = Material;
            NeonMesh.Color = Color;
            NeonMesh.Transparency = Transparency;
            u36.isFlashing = false;
        end);
    end);
end;

function u6.getRandomAttackAnimation(p37) -- Line: 263
    -- upvalues: RandomUtil (copy), u4 (copy), GameAnimationUtil (copy)
    return GameAnimationUtil:getAssetId((RandomUtil.fromList(unpack(u4))));
end;

return {
    DiamondGuardianClient = u6
};