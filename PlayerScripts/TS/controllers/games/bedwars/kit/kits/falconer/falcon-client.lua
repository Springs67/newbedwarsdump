-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local StatefulEntityHpBarBillboard = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "falconer", "falcon-constants");
local AGGRO_SPEED = v4.AGGRO_SPEED;
local ATTACK_RANGE = v4.ATTACK_RANGE;
local FalconState = v4.FalconState;
local MIN_DISTANCE_TO_TELEPORT = v4.MIN_DISTANCE_TO_TELEPORT;
local MIN_MOVE_DISTANCE_TO_TARGET = v4.MIN_MOVE_DISTANCE_TO_TARGET;
local MIN_Y = v4.MIN_Y;
local RECALL_SPEED = v4.RECALL_SPEED;
local SCOUTING_HEIGHT = v4.SCOUTING_HEIGHT;
local SCOUTING_RADIUS = v4.SCOUTING_RADIUS;
local SCOUTING_SPEED = v4.SCOUTING_SPEED;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatefulEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity").StatefulEntity;
local StatefulEntityTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag;
local StatefulEntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil;
local u5 = { GameSound.FALCON_SCREECH, GameSound.FALCON_SCREECH_2, GameSound.FALCON_SCREECH_3 };
local u6 = { GameSound.FALCON_CRY, GameSound.FALCON_CRY_2, GameSound.FALCON_CRY_3 };
local u7 = { GameSound.FALCON_WING_FLAP_1, GameSound.FALCON_WING_FLAP_2, GameSound.FALCON_WING_FLAP_3 };
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 44, Name: __tostring
        return "FalconClient";
    end,

    __index = StatefulEntity
});
u8.__index = u8;

function u8.new(...) -- Line: 50
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10, p11, p12, p13, p14) -- Line: 54
    -- upvalues: StatefulEntity (copy), FalconState (copy), StatefulEntityTag (copy), Players (copy), KnitClient (copy)
    StatefulEntity.constructor(p10, FalconState.SPAWNING, StatefulEntityTag.FALCON, p11, p12);
    p10.lastOwnerPositionPolledTime = 0;
    p10.elapsedTime = 0;
    p10.visible = false;
    p10.entityHealthbarOn = false;
    p10.lastState = FalconState.SPAWNING;
    p10.lastAttackAnimationTime = 0;
    p10.serverInstance = p13;
    p10.owner = p14;
    local v15 = p14:GetAttribute("Team");
    local gameEntity = p10.gameEntity;

    if gameEntity ~= nil then
        gameEntity:SetAttribute("Team", v15);
    end;

    if p10.owner == Players.LocalPlayer then
        KnitClient.Controllers.FalconerController:setFalconReference(p10.serverInstance);
    end;

    p10:setUpAnimationTrack();
end;

function u8.setStrikeZoneEpicenter(p16, p17) -- Line: 75
    p16.strikeZoneEpicenter = p17;
end;

function u8.setTarget(p18, p19) -- Line: 78
    p18.currentTarget = p19;
end;

function u8.setPosition(p20, p21) -- Line: 81
    local gameEntity = p20.gameEntity;

    if gameEntity ~= nil then
        gameEntity:PivotTo(p21);
    end;
end;

function u8.createEntityHealthbar(p22) -- Line: 87
    -- upvalues: Flamework (copy), StatefulEntityHpBarBillboard (copy)
    if p22.entityHealthbarOn then
        return nil;
    end;

    if p22.gameEntity and p22.serverInstance then
        p22.entityHealthbarOn = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            app = StatefulEntityHpBarBillboard,
            appId = "StatefulEntityHpBarBillboard_" .. tostring(p22.entityUUID)
        }, {
            hpBarOffset = Vector3.new(0, 2, 0),
            maxDistance = 150,
            gameEntity = p22.gameEntity,
            serverInstance = p22.serverInstance
        }, nil, p22.gameEntity);
    end;
end;

function u8.createGameEntity(p23, p24) -- Line: 103
    -- upvalues: ReplicatedStorage (copy), CollectionService (copy), u2 (copy), Workspace (copy), StatefulEntityUtil (copy)
    local v25 = ReplicatedStorage.Assets.Misc.Eagle:Clone();
    CollectionService:AddTag(v25, "FirstPersonHidden");
    u2("BodyForce", {
        Name = "FalconForce",
        Force = Vector3.new(0, Workspace.Gravity * v25.PrimaryPart.AssemblyMass, 0),
        Parent = v25.PrimaryPart
    });
    StatefulEntityUtil:setEntityIgnoreQuery(v25);
    StatefulEntityUtil:setClientEntityNotCollidable(v25);
    v25:PivotTo(p24);
    p23.gameEntity = v25;
    v25.Parent = Workspace;
    p23:onHeartbeat();
    p23:registerClientGameEntity(v25);
end;

function u8.onEntityDamaged(p26, p27, p28) -- Line: 123
    -- upvalues: FalconState (copy), RandomUtil (copy), u5 (copy), SoundManager (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    if not p26.gameEntity then
        return nil;
    end;

    if p26.activeState == FalconState.SPAWNING or p26.activeState == FalconState.RECALLED then
        return nil;
    end;

    SoundManager:playSound(RandomUtil.fromList(unpack(u5)), {
        rollOffMaxDistance = 50,
        position = p26.gameEntity:GetPivot().Position
    });
    local v29 = AnimationUtil:playAnimation(p26.gameEntity, GameAnimationUtil:getAssetId(AnimationType.FALCON_RECOIL), {
        looped = false
    });

    if v29 then
        v29:AdjustSpeed(1.5);
        v29.Priority = Enum.AnimationPriority.Action3;
    end;
end;

function u8.onEntityDeath(p30) -- Line: 146
    -- upvalues: Players (copy), KnitClient (copy)
    if p30.owner == Players.LocalPlayer then
        KnitClient.Controllers.FalconerController:unmountFalconHealthbarGui();
    end;
end;

function u8.onStateEnter(p31, p32) -- Line: 151
    -- upvalues: FalconState (copy)
    if p32 == FalconState.RECALLED then
        p31:enterRecalledState();
    end;

    if p32 == FalconState.SCOUTING then
        p31:enterScoutingState();
    end;

    if p32 == FalconState.AGGRO then
        p31:enterAggroState();
    end;
end;

function u8.onStateExit(p33, p34) -- Line: 162
end;

function u8.handleActionRequest(p35, p36, p37) -- Line: 164
end;

function u8.onHeartbeat(u38) -- Line: 166
    -- upvalues: RunService (copy), Workspace (copy), FalconState (copy), ATTACK_RANGE (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local lastOwnerPositionPolledTime = u38.lastOwnerPositionPolledTime;

    if lastOwnerPositionPolledTime == 0 or (lastOwnerPositionPolledTime ~= lastOwnerPositionPolledTime or not lastOwnerPositionPolledTime) then
        u38.lastOwnerPositionPolledTime = 0;
    end;

    RunService.Heartbeat:Connect(function(p39) -- Line: 171
        -- upvalues: u38 (copy), Workspace (ref), FalconState (ref), ATTACK_RANGE (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        if u38.lastOwnerPositionPolledTime + 1 < Workspace:GetServerTimeNow() then
            local owner = u38.owner;

            if owner ~= nil then
                owner = owner.Character;

                if owner ~= nil then
                    owner = owner.PrimaryPart;

                    if owner ~= nil then
                        owner = owner.Position;
                    end;
                end;
            end;

            u38.lastOwnerPosition = owner;
            u38.lastOwnerPositionPolledTime = Workspace:GetServerTimeNow();
        end;

        if not (u38.gameEntity and u38.gameEntity.Parent) then
            return nil;
        end;

        if u38.activeState == FalconState.RECALLED then
            u38:followOwner(p39);
        end;

        if u38.activeState == FalconState.SCOUTING then
            u38:scoutStrikeZone(p39);
        end;

        if u38.activeState == FalconState.AGGRO then
            if not u38.currentTarget then
                return nil;
            end;

            local currentTarget = u38.currentTarget;

            if currentTarget ~= nil then
                currentTarget = currentTarget.PrimaryPart;

                if currentTarget ~= nil then
                    currentTarget = currentTarget.Position;
                end;
            end;

            local Position = u38.gameEntity:GetPivot().Position;

            if not (u38.currentTarget and (currentTarget and Position)) then
                return nil;
            end;

            u38:moveTowardsCurrentTarget(p39);
            local Magnitude = (currentTarget - Position).Magnitude;

            if Magnitude == 0 then
                Magnitude = false;
            elseif Magnitude ~= Magnitude then
                Magnitude = false;
            end;

            if (not Magnitude or (currentTarget - Position).Magnitude < ATTACK_RANGE + 5) and u38.lastAttackAnimationTime + 2 < Workspace:GetServerTimeNow() then
                u38.lastAttackAnimationTime = Workspace:GetServerTimeNow();
                local v40 = AnimationUtil:playAnimation(u38.gameEntity, GameAnimationUtil:getAssetId(AnimationType.FALCON_ATTACK), {
                    looped = false
                });

                if v40 then
                    v40:AdjustSpeed(1.5);
                    v40.Priority = Enum.AnimationPriority.Action;
                end;
            end;
        end;
    end);
end;

function u8.moveTowardsCurrentTarget(p41, p42) -- Line: 232
    -- upvalues: AGGRO_SPEED (copy)
    if not (p41.currentTarget and p41.gameEntity) then
        return nil;
    end;

    local currentTarget = p41.currentTarget;

    if currentTarget ~= nil then
        currentTarget = currentTarget.PrimaryPart;

        if currentTarget ~= nil then
            currentTarget = currentTarget.Position;
        end;
    end;

    if not currentTarget then
        return nil;
    end;

    p41:moveToTargetPosition(currentTarget, AGGRO_SPEED, currentTarget, p42);
end;

function u8.followOwner(p43, p44) -- Line: 249
    -- upvalues: MIN_Y (copy), MIN_DISTANCE_TO_TELEPORT (copy), RECALL_SPEED (copy), SoundManager (copy), GameSound (copy)
    if not (p43.owner and (p43.owner.Character and p43.gameEntity)) then
        return nil;
    end;

    local Character = p43.owner.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local Character2 = p43.owner.Character;

    if Character2 ~= nil then
        Character2 = Character2:FindFirstChild("LeftUpperArm");

        if Character2 ~= nil then
            Character2 = Character2:FindFirstChild("LeftShoulderAttachment");
        end;
    end;

    if Character2 ~= nil then
        Character2 = Character2.WorldPosition;
    end;

    if Character2 == nil then
        Character2 = Character;
    end;

    local v45 = Character2 + Vector3.new(0, 10, 0);
    local X = v45.X;
    local v46 = math.max(v45.Y, MIN_Y);
    local v47 = Vector3.new(X, v46, v45.Z);
    local v48 = not p43.lastOwnerPosition;

    if not v48 then
        v48 = p43.lastOwnerPosition;

        if v48 then
            v48 = (p43.lastOwnerPosition - Character).Magnitude;

            if v48 ~= 0 and (v48 == v48 and v48) then
                v48 = MIN_DISTANCE_TO_TELEPORT < (p43.lastOwnerPosition - Character).Magnitude;
            end;
        end;
    end;

    if v48 ~= 0 and (v48 == v48 and v48) then
        p43.gameEntity:PivotTo(CFrame.new(v47));

        return nil;
    end;

    p43:moveToTargetPosition(v47, RECALL_SPEED, v47, p44);
    local Magnitude = (p43.gameEntity:GetPivot().Position - v47).Magnitude;

    if p43.visible and Magnitude < 10 then
        p43:playDesummonEffects(CFrame.new(v47, p43.gameEntity:GetPivot().Position));
        local Position = p43.gameEntity:GetPivot().Position;
        SoundManager:playSound(GameSound.FALCON_DESUMMON, {
            rollOffMaxDistance = 60,
            position = Position
        });
    end;
end;

function u8.moveToTargetPosition(p49, p50, p51, p52, p53) -- Line: 313
    -- upvalues: MIN_MOVE_DISTANCE_TO_TARGET (copy)
    if not p49.gameEntity then
        return nil;
    end;

    local Position = p49.gameEntity:GetPivot().Position;

    if not Position then
        return nil;
    end;

    local v54 = not p50;

    if not v54 then
        local v55;

        if p50 == nil then
            v55 = p50;
        else
            v55 = (p50 - Position).Magnitude;
        end;

        v54 = v55 < MIN_MOVE_DISTANCE_TO_TARGET;
    end;

    if v54 then
        return nil;
    end;

    local Magnitude = (p50 - Position).Magnitude;
    local v56;

    if Magnitude == 0 or (Magnitude ~= Magnitude or not Magnitude) then
        v56 = p50 - Position;
    else
        v56 = (p50 - Position).Unit;
    end;

    if v56 == Vector3.new(nil, nil, nil) or not v56 then
        return nil;
    end;

    local v57 = Position + v56 * (p51 * p53);
    local Magnitude2 = (v57 - Position).Magnitude;

    if Magnitude2 == 0 then
        Magnitude2 = false;
    elseif Magnitude2 ~= Magnitude2 then
        Magnitude2 = false;
    end;

    if not Magnitude2 or (v57 - Position).Magnitude > (p50 - Position).Magnitude then
        v57 = p50;
    end;

    p49.gameEntity:PivotTo(CFrame.new(v57, p52));
end;

function u8.enterRecalledState(p58) -- Line: 372
    -- upvalues: Flamework (copy), FalconState (copy), KnitClient (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("StatefulEntityHpBarBillboard_" .. tostring(p58.entityUUID));
    p58.entityHealthbarOn = false;
    p58.lastState = FalconState.RECALLED;

    if not p58.owner then
        return nil;
    end;

    KnitClient.Controllers.FalconerController:disableRecallFalcon(p58.owner);

    if p58.divingTrack then
        p58.divingTrack:Stop();
    end;

    if p58.soaringTrack then
        p58.soaringTrack:Play();
    end;
end;

function u8.enterScoutingState(u59) -- Line: 387
    -- upvalues: FalconState (copy), SoundManager (copy), GameSound (copy), RandomUtil (copy), u7 (copy), KnitClient (copy)
    u59.elapsedTime = 0;

    if u59.lastState == FalconState.RECALLED then
        task.defer(function() -- Line: 390
            -- upvalues: u59 (copy), SoundManager (ref), GameSound (ref), RandomUtil (ref), u7 (ref)
            local gameEntity = u59.gameEntity;

            if gameEntity ~= nil then
                gameEntity = gameEntity:GetPivot();
            end;

            if gameEntity then
                u59:playSummonEffects(gameEntity);
            end;

            if u59.gameEntity then
                local Position = u59.gameEntity:GetPivot().Position;
                SoundManager:playSound(GameSound.FALCON_SUMMON, {
                    rollOffMaxDistance = 60,
                    position = Position
                });
                SoundManager:playSound(RandomUtil.fromList(unpack(u7)), {
                    rollOffMaxDistance = 50,
                    position = Position
                });
            end;
        end);
    end;

    if u59.divingTrack then
        u59.divingTrack:Stop();
    end;

    if u59.soaringTrack then
        u59.soaringTrack:Play();
    end;

    u59:createEntityHealthbar();
    u59.lastState = FalconState.SCOUTING;

    if not u59.owner then
        return nil;
    end;

    KnitClient.Controllers.FalconerController:enableRecallFalcon(u59.owner);
end;

function u8.enterAggroState(p60) -- Line: 427
    -- upvalues: RandomUtil (copy), u6 (copy), SoundManager (copy), FalconState (copy)
    if not p60.gameEntity then
        return nil;
    end;

    SoundManager:playSound(RandomUtil.fromList(unpack(u6)), {
        rollOffMaxDistance = 200,
        position = p60.gameEntity:GetPivot().Position
    });

    if p60.soaringTrack then
        p60.soaringTrack:Stop();
    end;

    if p60.divingTrack then
        p60.divingTrack:Play();
    end;

    p60:createEntityHealthbar();
    p60.lastState = FalconState.AGGRO;
end;

function u8.scoutStrikeZone(p61, p62) -- Line: 447
    -- upvalues: SCOUTING_RADIUS (copy), SCOUTING_HEIGHT (copy), SCOUTING_SPEED (copy)
    if not p61.strikeZoneEpicenter then
        return nil;
    end;

    if not p61.gameEntity then
        return nil;
    end;

    p61.elapsedTime = p61.elapsedTime + p62;
    local strikeZoneEpicenter = p61.strikeZoneEpicenter;
    local v63 = math.sin(p61.elapsedTime) * SCOUTING_RADIUS;
    local v64 = math.cos(p61.elapsedTime) * SCOUTING_RADIUS;
    local v65 = strikeZoneEpicenter + Vector3.new(v63, SCOUTING_HEIGHT, v64);
    p61:moveToTargetPosition(v65, SCOUTING_SPEED, v65, p62);
end;

function u8.playSummonEffects(p66, p67) -- Line: 460
    -- upvalues: TweenService (copy), ReplicatedStorage (copy), Workspace (copy), Players (copy), CollectionService (copy)
    local gameEntity = p66.gameEntity;

    if gameEntity ~= nil then
        gameEntity = gameEntity:FindFirstChild("falcon");
    end;

    if gameEntity then
        TweenService:Create(gameEntity, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
            Transparency = 0
        }):Play();
    end;

    local gameEntity2 = p66.gameEntity;

    if gameEntity2 ~= nil then
        local function _(p68) -- Line: 475
            return p68:IsA("Trail");
        end;

        local v69 = 0;
        gameEntity2 = {};

        for i, descendant in gameEntity2:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("Trail") == true then
                v69 = v69 + 1;
                gameEntity2[v69] = descendant;
            end;
        end;
    end;

    if gameEntity2 then
        for _, v in gameEntity2 do
            v.Transparency = NumberSequence.new(0.7, 0.925);
        end;
    end;

    p66.visible = true;
    local u70 = ReplicatedStorage.Assets.Effects.EagleSummon:Clone();
    u70.Parent = Workspace;
    local currentTarget = p66.currentTarget;

    if currentTarget ~= nil then
        currentTarget = currentTarget.PrimaryPart;

        if currentTarget ~= nil then
            currentTarget = currentTarget.Position;
        end;
    end;

    if currentTarget then
        p67 = CFrame.new(p67.Position, p66.currentTarget.PrimaryPart.Position);
    end;

    u70.CFrame = p67;
    local Specs = u70.RootAttachment.Specs;
    local Wind = u70.RootAttachment.Wind;
    local SummonCircle = u70.SummonCircle.SummonCircle;
    SummonCircle:Emit(1);
    local Smoke = u70.Smoke;
    Smoke:Emit(25);
    local FeatherParticle = u70.Feathers.FeatherParticle;
    FeatherParticle:Emit(10);

    if p66.owner == Players.LocalPlayer then
        CollectionService:AddTag(Specs, "FirstPersonHidden");
        CollectionService:AddTag(Wind, "FirstPersonHidden");
        CollectionService:AddTag(SummonCircle, "FirstPersonHidden");
        CollectionService:AddTag(Smoke, "FirstPersonHidden");
        CollectionService:AddTag(FeatherParticle, "FirstPersonHidden");
    end;

    task.delay(0.75, function() -- Line: 527
        -- upvalues: Specs (copy), Wind (copy)
        Specs.Enabled = false;
        Wind.Enabled = false;
    end);
    task.delay(2.5, function() -- Line: 531
        -- upvalues: u70 (copy)
        u70:Destroy();
    end);
end;

function u8.playDesummonEffects(p71, p72) -- Line: 535
    -- upvalues: TweenService (copy), ReplicatedStorage (copy), Workspace (copy), Players (copy), CollectionService (copy)
    local gameEntity = p71.gameEntity;

    if gameEntity ~= nil then
        gameEntity = gameEntity:FindFirstChild("falcon");
    end;

    if gameEntity then
        TweenService:Create(gameEntity, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
            Transparency = 1
        }):Play();
    end;

    local gameEntity2 = p71.gameEntity;

    if gameEntity2 ~= nil then
        local function _(p73) -- Line: 549
            return p73:IsA("Trail");
        end;

        local v74 = 0;
        gameEntity2 = {};

        for i, descendant in gameEntity2:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("Trail") == true then
                v74 = v74 + 1;
                gameEntity2[v74] = descendant;
            end;
        end;
    end;

    if gameEntity2 then
        for _, v in gameEntity2 do
            v.Transparency = NumberSequence.new(1);
        end;
    end;

    p71.visible = false;
    local u75 = ReplicatedStorage.Assets.Effects.EagleSummon:Clone();
    u75.Parent = Workspace;
    local currentTarget = p71.currentTarget;

    if currentTarget ~= nil then
        currentTarget = currentTarget.PrimaryPart;

        if currentTarget ~= nil then
            currentTarget = currentTarget.Position;
        end;
    end;

    if currentTarget then
        CFrame.new(p72.Position, p71.currentTarget.PrimaryPart.Position);
    end;

    u75.CFrame = p72;
    local Specs = u75.RootAttachment.Specs;
    local Wind = u75.RootAttachment.Wind;
    local SummonCircle = u75.SummonCircle.SummonCircle;
    SummonCircle:Emit(1);
    local Smoke = u75.Smoke;
    Smoke:Emit(20);

    if p71.owner == Players.LocalPlayer then
        CollectionService:AddTag(Specs, "FirstPersonHidden");
        CollectionService:AddTag(Wind, "FirstPersonHidden");
        CollectionService:AddTag(SummonCircle, "FirstPersonHidden");
        CollectionService:AddTag(Smoke, "FirstPersonHidden");
    end;

    task.delay(0.5, function() -- Line: 598
        -- upvalues: Specs (copy), Wind (copy)
        Specs.Enabled = false;
        Wind.Enabled = false;
    end);
    task.delay(2, function() -- Line: 602
        -- upvalues: u75 (copy)
        u75:Destroy();
    end);
end;

function u8.setUpAnimationTrack(p76) -- Line: 606
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy)
    local gameEntity = p76.gameEntity;

    if gameEntity ~= nil then
        gameEntity = gameEntity:WaitForChild("AnimationController", 3);

        if gameEntity ~= nil then
            gameEntity = gameEntity:WaitForChild("Animator", 3);
        end;
    end;

    p76.soaringTrack = gameEntity:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.FALCON_WING_FLAP));

    if p76.soaringTrack then
        p76.soaringTrack.Priority = Enum.AnimationPriority.Idle;
    end;

    p76.soaringTrack.Looped = true;
    p76.divingTrack = gameEntity:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.FALCON_DIVE));

    if p76.soaringTrack then
        p76.soaringTrack.Priority = Enum.AnimationPriority.Movement;
    end;

    p76.divingTrack.Looped = true;
end;

return {
    FalconClient = u8
};