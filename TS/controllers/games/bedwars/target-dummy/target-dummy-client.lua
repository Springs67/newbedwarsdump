-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local StatefulEntityHpBarBillboard = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "target-dummy", "target-dummy-constants");
local TARGET_DUMMY_RANGED_DAMAGE_DELAY = v4.TARGET_DUMMY_RANGED_DAMAGE_DELAY;
local TargetDummyAction = v4.TargetDummyAction;
local TargetDummyState = v4.TargetDummyState;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatefulEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity").StatefulEntity;
local StatefulEntityTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag;
local StatefulEntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local TARGET_DUMMY_SOLO_ATTACK = AnimationType.TARGET_DUMMY_SOLO_ATTACK;
local TARGET_DUMMY_SPIN_ATTACK = AnimationType.TARGET_DUMMY_SPIN_ATTACK;
local u5 = {
    ReplicatedStorage.Assets.Misc.TargetDummyTier1,
    ReplicatedStorage.Assets.Misc.TargetDummyTier2,
    ReplicatedStorage.Assets.Misc.TargetDummyTier3,
    ReplicatedStorage.Assets.Misc.TargetDummyTier4
};
local TargetDummyRangedAttack = ReplicatedStorage.Assets.Misc.TargetDummyRangedAttack;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 41, Name: __tostring
        return "TargetDummyClient";
    end,

    __index = StatefulEntity
});
u6.__index = u6;

function u6.new(...) -- Line: 47
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, p9, p10, p11, p12, p13) -- Line: 51
    -- upvalues: StatefulEntity (copy), TargetDummyState (copy), StatefulEntityTag (copy), u5 (copy), StatefulEntityUtil (copy), Workspace (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    StatefulEntity.constructor(p8, TargetDummyState.SPAWNING, StatefulEntityTag.TARGET_DUMMY, p9, p10);
    p8.rotationBeingInterpolated = false;
    p8.currentTierIndex = -1;
    p8.currentTierIndex = p12;
    local v14 = u5[p8.currentTierIndex + 1]:Clone();
    StatefulEntityUtil:setEntityIgnoreQuery(v14);
    v14:PivotTo(p9);
    p8.serverInstance = p11;
    p8.gameEntity = v14;
    local Root = p8.gameEntity:FindFirstChild("Root");

    if Root ~= nil then
        Root = Root:FindFirstChild("rig");
    end;

    p8.animateRig = Root;
    p8.spawnPosition = p9.Position;
    v14.Parent = Workspace;
    p8.teamId = p13;
    AnimationUtil:playAnimation(p8.animateRig, GameAnimationUtil:getAssetId(AnimationType.TARGET_DUMMY_SPAWN), {
        looped = false
    });
    p8:createEntityHealthbar();
end;

function u6.createEntityHealthbar(p15) -- Line: 79
    -- upvalues: GamePlayerUtil (copy), Players (copy), Theme (copy), Flamework (copy), StatefulEntityHpBarBillboard (copy)
    if p15.gameEntity and p15.serverInstance then
        local v16;

        if GamePlayerUtil.getGamePlayer(Players.LocalPlayer):getTeamId() == p15.teamId then
            v16 = Theme.mcGreen;
        else
            v16 = Theme.mcRed;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            app = StatefulEntityHpBarBillboard,
            appId = "StatefulEntityHpBarBillboard_" .. tostring(p15.entityUUID)
        }, {
            hpBarOffset = Vector3.new(0, 7, 0),
            gameEntity = p15.gameEntity,
            serverInstance = p15.serverInstance,
            barColor = v16
        }, nil, p15.gameEntity);
    end;
end;

function u6.createGameEntity(p17, p18) -- Line: 94
    p17:onHeartbeat();
end;

function u6.onEntityDamaged(p19, p20, p21) -- Line: 97
    -- upvalues: SoundManager (copy), GameSound (copy)
    if not p19.gameEntity then
        return nil;
    end;

    local Position = p19.gameEntity:GetPivot().Position;
    SoundManager:playSound(GameSound.TARGET_DUMMY_DAMAGED, {
        rollOffMaxDistance = 20,
        position = Position
    });
end;

function u6.onEntityDeath(u22) -- Line: 110
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), Flamework (copy)
    local v23 = AnimationUtil:playAnimation(u22.gameEntity, GameAnimationUtil:getAssetId(AnimationType.TARGET_DUMMY_DEATH), {
        looped = false
    });

    if v23 ~= nil then
        v23.Stopped:Connect(function() -- Line: 118
            -- upvalues: u22 (copy)
            local gameEntity = u22.gameEntity;

            if gameEntity ~= nil then
                gameEntity = gameEntity:Destroy();
            end;

            return gameEntity;
        end);
    end;

    task.delay(3, function() -- Line: 128
        -- upvalues: u22 (copy)
        if u22.gameEntity and u22.gameEntity.Parent then
            u22.gameEntity:Destroy();
        end;
    end);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("StatefulEntityHpBarBillboard_" .. tostring(u22.entityUUID));
end;

function u6.onStateEnter(p24, p25) -- Line: 136
    -- upvalues: TargetDummyState (copy)
    if p25 == TargetDummyState.SPAWNING then
        p24:onEnterSpawningState();
    end;
end;

function u6.onStateExit(p26, p27) -- Line: 141
end;

function u6.handleActionRequest(p28, p29, p30) -- Line: 143
    -- upvalues: StatefulEntityUtil (copy), TargetDummyAction (copy)
    if p28.animateRig ~= nil and p30.targetPosition ~= nil then
        StatefulEntityUtil:rotateTo(p28.animateRig, p30.targetPosition, 0.5);
    end;

    if p29 == TargetDummyAction.ALERT then
        p28:handleAlertActionRequest(p30.targetPlayer);

        return;
    end;

    if p29 == TargetDummyAction.SPIN_ATTACK then
        p28:handleSpinAttackActionRequest();

        return;
    end;

    if p29 == TargetDummyAction.SOLO_ATTACK then
        p28:handleSoloAttackActionRequest();

        return;
    end;

    if p29 == TargetDummyAction.RANGED_ATTACK then
        p28:handleRangedAttackActionRequest(p30);

        return;
    end;

    if p29 == TargetDummyAction.REMOVE_TARGET then
        p28.currentTarget = nil;
    end;
end;

function u6.handleAlertActionRequest(p31, p32) -- Line: 162
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), GamePlayerUtil (copy), Players (copy)
    if not (p31.gameEntity and p31.gameEntity.Parent) then
        return nil;
    end;

    local Position = p31.gameEntity:GetPivot().Position;

    if p31.animateRig == nil then
        return nil;
    end;

    AnimationUtil:playAnimation(p31.animateRig, GameAnimationUtil:getAssetId(AnimationType.TARGET_DUMMY_ALERT), {
        looped = false
    });
    local u33 = SoundManager:playSound(GameSound.TARGET_DUMMY_ALERT, {
        rollOffMaxDistance = 120,
        volumeMultiplier = 1.2,
        looped = true,
        position = Position
    });
    task.delay(6, function() -- Line: 179
        -- upvalues: u33 (copy)
        u33:Stop();
    end);

    if GamePlayerUtil.getGamePlayer(Players.LocalPlayer):getTeamId() ~= p31.teamId then
        return nil;
    end;

    if p32 then
        p31:highlightPlayer(p32);
    end;
end;

function u6.highlightPlayer(p34, p35) -- Line: 190
    -- upvalues: u2 (copy), Theme (copy)
    local Character = p35.Character;
    local u36 = u2("Highlight", {
        FillTransparency = 0.7,
        OutlineTransparency = 0.2,
        Parent = nil,
        FillColor = Theme.mcRed,
        OutlineColor = Theme.mcRed,
        DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    });
    u36.Parent = Character;
    u36.Enabled = true;
    task.delay(6, function() -- Line: 203
        -- upvalues: u36 (copy)
        u36.Enabled = false;
        u36:Destroy();
    end);
end;

function u6.handleSoloAttackActionRequest(p37) -- Line: 208
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), TARGET_DUMMY_SOLO_ATTACK (copy), SoundManager (copy), GameSound (copy)
    if not (p37.gameEntity and p37.gameEntity.Parent) then
        return nil;
    end;

    local Position = p37.gameEntity:GetPivot().Position;

    if p37.animateRig == nil then
        return nil;
    end;

    AnimationUtil:playAnimation(p37.animateRig, GameAnimationUtil:getAssetId(TARGET_DUMMY_SOLO_ATTACK), {
        looped = false
    });
    SoundManager:playSound(GameSound.TARGET_DUMMY_SOLO_ATTACK, {
        position = Position
    });
end;

function u6.handleSpinAttackActionRequest(p38) -- Line: 223
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), TARGET_DUMMY_SPIN_ATTACK (copy), SoundManager (copy), GameSound (copy)
    if not (p38.gameEntity and p38.gameEntity.Parent) then
        return nil;
    end;

    local Position = p38.gameEntity:GetPivot().Position;

    if p38.animateRig == nil then
        return nil;
    end;

    AnimationUtil:playAnimation(p38.animateRig, GameAnimationUtil:getAssetId(TARGET_DUMMY_SPIN_ATTACK), {
        looped = false
    });
    SoundManager:playSound(GameSound.TARGET_DUMMY_SPIN_ATTACK, {
        position = Position
    });
end;

function u6.handleRangedAttackActionRequest(u39, p40) -- Line: 238
    -- upvalues: SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), TARGET_DUMMY_RANGED_DAMAGE_DELAY (copy), TargetDummyRangedAttack (copy), Workspace (copy)
    if not (u39.gameEntity and u39.gameEntity.Parent) then
        return nil;
    end;

    SoundManager:playSound(GameSound.TARGET_DUMMY_SWORD_SPAWN, {
        rollOffMaxDistance = 80,
        position = u39.spawnPosition
    });
    local Character = p40.targetPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    if u39.animateRig ~= nil then
        AnimationUtil:playAnimation(u39.animateRig, GameAnimationUtil:getAssetId(AnimationType.TARGET_DUMMY_RANGED_ATTACK), {
            looped = false
        });
    end;

    local v41 = math.random(0, 360);
    local v42 = math.cos(v41) * 8;
    local v43 = math.sin(v41) * 8;
    local u44 = Vector3.new(v42, 15, v43) + Character.Position;
    task.delay(TARGET_DUMMY_RANGED_DAMAGE_DELAY, function() -- Line: 269
        -- upvalues: TargetDummyRangedAttack (ref), Workspace (ref), u44 (copy), u39 (copy), Character (copy)
        local v45 = TargetDummyRangedAttack:Clone();
        v45.Parent = Workspace;
        v45:PivotTo(CFrame.new(u44));
        v45.Anchored = true;
        u39:performRangedAttack(v45, u44, Character);
    end);
end;

function u6.performRangedAttack(p46, u47, p48, p49) -- Line: 277
    -- upvalues: SoundManager (copy), GameSound (copy)
    local u50 = SoundManager:playSound(GameSound.TARGET_DUMMY_RANGED_ATTACK_FLY, {
        rollOffMaxDistance = 80,
        looped = true,
        position = p49.Position
    });
    local v51 = 0;

    while v51 < 1 do
        v51 = v51 + 0.15;
        local Position = p49.Position;
        local v52 = p48:Lerp(Position, v51);
        u47.CFrame = CFrame.new(v52, Position);
        u47.CFrame = u47.CFrame * CFrame.Angles(1.5707963267948966, 0, 0);
        task.wait();
    end;

    SoundManager:playSound(GameSound.TARGET_DUMMY_RANGED_ATTACK_LAND, {
        rollOffMaxDistance = 80,
        position = p49.Position
    });
    task.delay(1, function() -- Line: 300
        -- upvalues: u50 (copy), u47 (copy)
        u50:Stop();
        u47:Destroy();
    end);
end;

function u6.onEnterSpawningState(p53) -- Line: 306
    if not (p53.gameEntity and p53.gameEntity.Parent) then
        return nil;
    end;

    if p53.animateRig == nil then
        return nil;
    end;
end;

function u6.onHeartbeat(u54) -- Line: 314
    -- upvalues: RunService (copy), StatefulEntityUtil (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    u54.deathMaid:GiveTask(RunService.Heartbeat:Connect(function(p55) -- Line: 315
        -- upvalues: u54 (copy), StatefulEntityUtil (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        if not (u54.gameEntity and u54.gameEntity.Parent) then
            return nil;
        end;

        if not u54.currentTarget then
            return nil;
        end;

        local Position = u54.currentTarget:GetPivot().Position;
        StatefulEntityUtil:rotateTo(u54.gameEntity, Position);

        if u54.animateRig == nil then
            return nil;
        end;

        AnimationUtil:playAnimation(u54.animateRig, GameAnimationUtil:getAssetId(AnimationType.TARGET_DUMMY_DEATH), {
            looped = false
        });
    end));
end;

function u6.getGameEntity(p56) -- Line: 333
    return p56.gameEntity;
end;

return {
    TargetDummyClient = u6
};