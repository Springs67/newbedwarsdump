-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local OwlBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "owl-balance-file").OwlBalance;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local CloudEnchantUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "cloud", "cloud-enchant-util").CloudEnchantUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local OwlStatus = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "owl", "owl-status").OwlStatus;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local OwlUtil = RuntimeLib.import(script, script.Parent, "owl-util").OwlUtil;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 39, Name: __tostring
        return "OwlAbilityController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 45
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 49
    -- upvalues: KnitController (copy), u3 (copy)
    KnitController.constructor(p8);
    p8.Name = "OwlAbilityController";
    p8.nextLiftReadyTime = -1;
    p8.maid = u3.new();
    p8.owlLiftAbilityEnabled = false;
    p8.liftMaid = u3.new();
    p8.lifting = false;
end;

function u6.KnitStart(u9) -- Line: 58
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), SyncEventPriority (copy), Flamework (copy), AbilityId (copy), AbilityMeta (copy), CooldownId (copy), AbilityState (copy), RunService (copy), EntityUtil (copy), Workspace (copy), CloudEnchantUtil (copy), default (copy), OwlUtil (copy), OwlStatus (copy), Players (copy)
    KnitController.KnitStart(u9);
    ClientSyncEvents.OwlNewTarget:setPriority(SyncEventPriority.LOWEST):connect(function(p10) -- Line: 60
        -- upvalues: u9 (copy), Flamework (ref), AbilityId (ref), AbilityMeta (ref), CooldownId (ref), AbilityState (ref)
        if not p10.target then
            u9.target = nil;
            u9.maid:DoCleaning();

            return;
        end;

        u9.target = p10.target;
        task.wait(0.5);
        u9.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.OWL_LIFT, AbilityMeta[AbilityId.OWL_LIFT].triggerConfig):expect());
        u9.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.OWL_HEAL, AbilityMeta[AbilityId.OWL_HEAL].triggerConfig):expect());
        u9.owlLiftAbility = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.OWL_LIFT);

        if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(CooldownId.OWL_LIFT) > 0.1 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u9.owlLiftAbility, AbilityState.ON_COOLDOWN);
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u9.owlLiftAbility, AbilityState.DISABLED);
    end);
    RunService.Heartbeat:Connect(function() -- Line: 80
        -- upvalues: u9 (copy), EntityUtil (ref), Workspace (ref), CloudEnchantUtil (ref), Flamework (ref), CooldownId (ref), AbilityState (ref)
        if not (u9.target and u9.owlLiftAbility) then
            return nil;
        end;

        local Character = u9.target.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        local v11 = EntityUtil:getEntity(u9.target);

        if v11 ~= nil then
            v11 = v11:getInstance();
        end;

        if not (Character and v11) then
            return nil;
        end;

        if Character.AssemblyLinearVelocity.Y < -20 and (Workspace:GetServerTimeNow() > u9.nextLiftReadyTime and (CloudEnchantUtil:isAboveVoid(v11) and not u9.owlLiftAbilityEnabled)) then
            u9.owlLiftAbilityEnabled = true;

            if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(CooldownId.OWL_LIFT) < 0.1 then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u9.owlLiftAbility, AbilityState.READY);
            else
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u9.owlLiftAbility, AbilityState.ON_COOLDOWN);
            end;
        end;

        if u9.owlLiftAbilityEnabled and not CloudEnchantUtil:isAboveVoid(v11) then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u9.owlLiftAbility, AbilityState.DISABLED);
            u9.owlLiftAbilityEnabled = false;
        end;
    end);
    default.Client:Get("ToggleOwlLiftForce"):Connect(function(p12, p13, p14) -- Line: 110
        -- upvalues: OwlUtil (ref), OwlStatus (ref), u9 (copy), Players (ref)
        if p14 then
            local v15 = OwlUtil:getOwlClientModelByUser(p12);

            if not v15 then
                return nil;
            end;

            v15:SetAttribute("Status", OwlStatus.LIFTING);
            u9:playHootSound(v15, p12);

            if p13 == Players.LocalPlayer then
                u9:applyLiftForce();
            end;
        else
            local v16 = OwlUtil:getOwlClientModelByUser(p12);

            if p13 == Players.LocalPlayer then
                u9:removeLiftForce();
            end;

            if not v16 then
                return nil;
            end;

            v16:SetAttribute("Status", OwlStatus.DEFAULT);
        end;
    end);
    default.Client:Get("OwlHealEvent"):Connect(function(p17, p18) -- Line: 132
        -- upvalues: OwlUtil (ref), u9 (copy), Players (ref)
        local v19 = OwlUtil:getOwlClientModelByUser(p17);

        if not v19 then
            return nil;
        end;

        u9:playHootSound(v19, p17);
        u9:healAnimation(p18, v19);

        if p18 == Players.LocalPlayer then
            u9:applySpeedBuff();
        end;
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p20) -- Line: 143
        -- upvalues: Players (ref), u9 (copy), AbilityId (ref), default (ref)
        if p20.userCharacter ~= Players.LocalPlayer.Character or not u9.target then
            return nil;
        end;

        if p20.ability == AbilityId.OWL_LIFT or p20.ability == AbilityId.OWL_HEAL then
            default.Client:Get("OwlActionAbilities"):SendToServer({
                target = u9.target,
                ability = p20.ability
            });
        end;
    end);
end;

function u6.isLifting(p21) -- Line: 155
    return p21.lifting;
end;

function u6.applyLiftForce(u22) -- Line: 158
    -- upvalues: Players (copy), u4 (copy), Workspace (copy), KnitClient2 (copy), RunService (copy), OwlBalance (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local AssemblyMass = Character.AssemblyMass;
    Character:ApplyImpulse((Vector3.new(0, AssemblyMass * Character.AssemblyLinearVelocity.Y * -1, 0)));
    local u23 = u4("BodyForce", {
        Name = "OwlLiftForce",
        Force = Vector3.new(0, Workspace.Gravity * AssemblyMass * 1.05, 0),
        Parent = Character
    });
    u22.liftMaid:GiveTask(u23);
    local v24 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
        constantSpeedMultiplier = 1
    });
    u22.liftMaid:GiveTask(v24);
    u22.lifting = true;
    u22.liftMaid:GiveTask(function() -- Line: 181
        -- upvalues: u22 (copy)
        u22.lifting = false;
    end);
    u22.liftMaid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 184
        -- upvalues: AssemblyMass (ref), Character (copy), u23 (copy), Workspace (ref)
        AssemblyMass = Character.AssemblyMass;

        if Character.AssemblyLinearVelocity.Y > 50 then
            u23.Force = Vector3.new(0, 0, 0);

            return nil;
        end;

        if Character.AssemblyLinearVelocity.Y > 30 then
            u23.Force = Vector3.new(0, Workspace.Gravity * AssemblyMass * 0.9, 0);

            return nil;
        end;

        if Character.AssemblyLinearVelocity.Y > 25 then
            u23.Force = Vector3.new(0, Workspace.Gravity * AssemblyMass, 0);
        end;

        if Character.AssemblyLinearVelocity.Y < 5 then
            u23.Force = Vector3.new(0, Workspace.Gravity * AssemblyMass * 1.05, 0);
        end;
    end));
    task.delay(OwlBalance.MAX_OWL_LIFT_DURATION, function() -- Line: 201
        -- upvalues: u22 (copy)
        u22.liftMaid:Destroy();
    end);
end;

function u6.removeLiftForce(p25) -- Line: 205
    -- upvalues: Players (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    p25.liftMaid:Destroy();

    if Character ~= nil then
        Character = Character:FindFirstChild("OwlLiftForce");
    end;

    if Character ~= nil then
        Character:Destroy();
    end;
end;

function u6.applySpeedBuff(p26) -- Line: 222
    -- upvalues: KnitClient2 (copy), OwlBalance (copy)
    local u27 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
        moveSpeedMultiplier = OwlBalance.OWL_SPEED_BUFF_MULTIPLIER
    });
    task.delay(OwlBalance.OWL_SPEED_BUFF_DURATION, function() -- Line: 226
        -- upvalues: u27 (copy)
        u27.Destroy();
    end);
end;

function u6.healAnimation(p28, p29, u30) -- Line: 230
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), u3 (copy), u4 (copy), BedwarsImageId (copy), TweenService (copy), ReplicatedStorage (copy)
    if not u30.PrimaryPart then
        return nil;
    end;

    if not p29.Character then
        return nil;
    end;

    local bulletOrigin = u30.PrimaryPart:FindFirstChild("bulletOrigin");
    local UpperTorso = p29.Character:WaitForChild("UpperTorso");

    if UpperTorso ~= nil then
        UpperTorso = UpperTorso:WaitForChild("BodyFrontAttachment");
    end;

    if not (bulletOrigin and UpperTorso) then
        return nil;
    end;

    local v31 = AnimationUtil:playAnimation(u30, GameAnimationUtil:getAssetId(AnimationType.OWL_HEAL));

    if not v31 then
        return nil;
    end;

    local u32 = u3.new();
    v31:AdjustSpeed(0.75);
    u32:GiveTask(v31);
    local v33 = u4("Beam", {
        TextureSpeed = 2,
        Width0 = 1,
        Width1 = 0.5,
        FaceCamera = true,
        Attachment0 = bulletOrigin,
        Attachment1 = UpperTorso,
        Texture = BedwarsImageId.WHITE_BEAM_ARROW,
        Color = ColorSequence.new(Color3.fromRGB(3, 176, 201)),
        Parent = bulletOrigin
    });
    u32:GiveTask(v33);
    local v34 = TweenService:Create(v33, TweenInfo.new(2), {
        Width0 = 3,
        Width1 = 1.5
    });
    u32:GiveTask(v34);
    v34:Play();
    local v35 = ReplicatedStorage.Assets.Effects.OwlHealEffect:Clone();
    v35.Position = UpperTorso.WorldPosition;
    v35.Parent = p29.Character;
    u32:GiveTask(v35);
    local v36 = {
        Part0 = v35
    };
    local Character = p29.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    v36.Part1 = Character;
    v36.Parent = v35;
    u32:GiveTask(u4("WeldConstraint", v36));
    u32:GiveTask(v31.Stopped:Connect(function() -- Line: 287
        -- upvalues: AnimationUtil (ref), u30 (copy), GameAnimationUtil (ref), AnimationType (ref), u32 (copy)
        AnimationUtil:playAnimation(u30, GameAnimationUtil:getAssetId(AnimationType.OWL_FLY));
        u32:Destroy();
    end));
end;

function u6.playHootSound(p37, p38, p39) -- Line: 292
    -- upvalues: RandomUtil (copy), OwlUtil (copy), SoundManager (copy)
    local v40 = RandomUtil.fromList(unpack(OwlUtil:getOwlHootSound(p39)));
    local v41 = {};
    local PrimaryPart = p38.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.Position;
    end;

    v41.position = PrimaryPart;
    v41.rollOffMaxDistance = 220;
    v41.volumeMultiplier = 1.2;
    SoundManager:playSound(v40, v41);
end;

KnitClient.CreateController(u6.new());

return nil;