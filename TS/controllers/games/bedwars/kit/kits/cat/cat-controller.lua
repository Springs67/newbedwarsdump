-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local SetUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").SetUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v7.Players;
local RunService = v7.RunService;
local StarterPlayer = v7.StarterPlayer;
local UserInputService = v7.UserInputService;
local Workspace = v7.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CatStaminaAttr = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").CatStaminaAttr;
local CatBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "cat-balance").CatBalance;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatefulEntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local RegionUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "region-util").RegionUtil;
local GetAttribute = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local CatStaminaBar = RuntimeLib.import(script, script.Parent, "ui", "cat-stamina-bar").CatStaminaBar;
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 50, Name: __tostring
        return "CatController";
    end,

    __index = BaseKitController
});
u8.__index = u8;

function u8.new(...) -- Line: 56
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 60
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), GameSound (copy), u4 (copy), u3 (copy)
    BaseKitController.constructor(p10, BedwarsKit.CAT, {
        sounds = {
            GameSound.CAT_POUNCE_1,
            GameSound.CAT_POUNCE_2,
            GameSound.CAT_POUNCE_3,
            GameSound.CAT_LAND,
            GameSound.CAT_SCRATCH_1,
            GameSound.CAT_SCRATCH_2,
            GameSound.CAT_SCRATCH_3
        }
    });
    p10.Name = "CatController";
    p10.jumpMaid = u4.new();
    p10.wallClimbMaid = u4.new();
    p10.midLeap = false;
    p10.wallMounted = false;
    p10.targetVerticalVelocity = u3.SingleMotor.new(0);
end;

function u8.KnitStart(p11) -- Line: 71
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p11);
end;

function u8.onKitLocalActivated(u12, u13) -- Line: 74
    -- upvalues: UserInputService (copy), KnitClient (copy), Players (copy), BedwarsKit (copy), ClientSyncEvents (copy), AbilityId (copy), EntityUtil (copy), Flamework (copy), AbilityMeta (copy), Workspace (copy), RunService (copy), EntityDamageEventZap (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy), default (copy), u6 (copy), CatStaminaBar (copy)
    UserInputService.JumpRequest:Connect(function() -- Line: 76
        -- upvalues: u12 (copy), KnitClient (ref), Players (ref), BedwarsKit (ref)
        if not u12.wallMounted then
            return nil;
        end;

        if not KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.CAT) then
            return nil;
        end;

        local Character = Players.LocalPlayer.Character;

        if Character == nil or not Character.PrimaryPart then
            return nil;
        end;

        u12:dismountWall(Character, Character.PrimaryPart.CFrame.LookVector, false);
    end);
    ClientSyncEvents.CanUseLocalAbility:connect(function(p14) -- Line: 90
        -- upvalues: AbilityId (ref), KnitClient (ref), Players (ref), BedwarsKit (ref), EntityUtil (ref)
        if p14.ability ~= AbilityId.CAT_POUNCE then
            return nil;
        end;

        if not KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.CAT) then
            return nil;
        end;

        local v15 = EntityUtil:getEntity(p14.userCharacter);

        if v15 ~= nil then
            v15 = v15:isAlive();
        end;

        if not v15 then
            p14:setCancelled(true);
        end;
    end);
    local v16 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
    local CAT_POUNCE = AbilityId.CAT_POUNCE;
    local v17 = {};

    for i, v in AbilityMeta[AbilityId.CAT_POUNCE].triggerConfig do
        v17[i] = v;
    end;

    function v17.getExtraData() -- Line: 112
        -- upvalues: Workspace (ref)
        return {
            direction = Workspace.CurrentCamera.CFrame.LookVector
        };
    end;

    v16:enableAbility(CAT_POUNCE, v17):andThen(function(p18) -- Line: 118
        -- upvalues: u13 (copy)
        u13:GiveTask(p18);
    end);
    u13:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 123
        -- upvalues: u12 (copy)
        debug.profilebegin("cat-climb");
        u12:stepWallClimbCheck();
        debug.profileend();
    end));
    u13:GiveTask((EntityDamageEventZap.On(function(p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31, p32) -- Line: 129
        -- upvalues: Players (ref), u12 (copy)
        if p19 ~= Players.LocalPlayer.Character then
            return nil;
        end;

        if p24 ~= nil then
            p24 = p24.disabled;
        end;

        if p24 then
            return nil;
        end;

        if not u12.wallMounted then
            return nil;
        end;

        local Character = Players.LocalPlayer.Character;

        if Character == nil or not Character.PrimaryPart then
            return nil;
        end;

        u12:dismountWall(Character, Character.PrimaryPart.CFrame.LookVector, true);
    end)));
    u13:GiveTask(ClientSyncEvents.SwordSwing:connect(function(p33) -- Line: 151
        -- upvalues: KnitClient (ref), Players (ref), BedwarsKit (ref), u12 (copy)
        if p33:isCancelled() then
            return nil;
        end;

        if not KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.CAT) then
            return nil;
        end;

        if u12.wallMounted or u12.midLeap then
            p33:setCancelled(true);
        end;
    end));
    u13:GiveTask(ClientSyncEvents.GroundTouch:connect(function(p34) -- Line: 163
        -- upvalues: u12 (copy), Players (ref), KnitClient (ref), BedwarsKit (ref), EntityUtil (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref), GameAnimationUtil (ref), AnimationType (ref)
        if not u12.midLeap then
            return nil;
        end;

        u12.jumpMaid:DoCleaning();
        local LocalPlayer = Players.LocalPlayer;

        if not KnitClient.Controllers.KitController:isUsingKit(LocalPlayer, BedwarsKit.CAT) then
            return nil;
        end;

        local v35 = EntityUtil:getEntity(LocalPlayer);

        if not v35 then
            return nil;
        end;

        local PrimaryPart = v35:getInstance().PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if not PrimaryPart then
            return nil;
        end;

        if u12.wallMounted then
            return nil;
        end;

        local v36 = RandomUtil.fromList(unpack({ GameSound.CAT_SCRATCH_1, GameSound.CAT_SCRATCH_2, GameSound.CAT_SCRATCH_3 }));
        local v37 = {};
        local PrimaryPart2 = v35:getInstance().PrimaryPart;

        if PrimaryPart2 ~= nil then
            PrimaryPart2 = PrimaryPart2.Position;
        end;

        v37.position = PrimaryPart2;
        SoundManager:playSound(v36, v37);
        GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.BEAR_CLAWS_SWIPE);
    end));
    default.Client:WaitFor("EntityDeathEvent"):andThen(function(p38) -- Line: 201
        -- upvalues: u13 (copy), Players (ref), u12 (copy)
        u13:GiveTask(p38:Connect(function(p39) -- Line: 202
            -- upvalues: Players (ref), u12 (ref)
            if p39.entityInstance ~= Players.LocalPlayer.Character then
                return nil;
            end;

            u12.jumpMaid:DoCleaning();
        end));
    end);
    u13:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u6.createFragment({
        CatStaminaBar = u6.createElement(CatStaminaBar)
    })));
end;

function u8.onKitLocalDeactivated(p40) -- Line: 214
end;

function u8.onKitReplicationActivated(p41, p42) -- Line: 216
end;

function u8.onKitReplicationDeactivated(p43) -- Line: 218
end;

function u8.onInnateAbilityEnabled(p44, p45, p46) -- Line: 220
end;

function u8.onAbilityUsed(p47, p48, p49) -- Line: 222
    -- upvalues: Players (copy), AbilityId (copy), KnitClient (copy), BedwarsKit (copy)
    if p49.userCharacter ~= Players.LocalPlayer.Character then
        return nil;
    end;

    if p49:isCancelled() then
        return nil;
    end;

    if p49.ability ~= AbilityId.CAT_POUNCE then
        return nil;
    end;

    if not KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.CAT) then
        return nil;
    end;

    p47:pounce();
end;

function u8.stepWallClimbCheck(p50) -- Line: 237
    -- upvalues: Players (copy), EntityUtil (copy), GetAttribute (copy), CatStaminaAttr (copy), StatusEffectUtil (copy), StatusEffectType (copy), CatBalance (copy), RegionUtil (copy), BlockEngine (copy), SetUtil (copy), GameQueryUtil (copy), StatefulEntityUtil (copy), u3 (copy)
    local Character = Players.LocalPlayer.Character;
    local v51;

    if Character == nil then
        v51 = Character;
    else
        v51 = Character.PrimaryPart;
    end;

    if not v51 then
        return nil;
    end;

    local Humanoid = Character:FindFirstChild("Humanoid");

    if not Humanoid then
        return nil;
    end;

    local Position = Character.PrimaryPart.Position;
    local LookVector = Character.PrimaryPart.CFrame.LookVector;
    local v52 = EntityUtil:getEntity(Players.LocalPlayer);

    if v52 ~= nil then
        v52 = v52:getInstance();
    end;

    local v53 = GetAttribute(Players.LocalPlayer, CatStaminaAttr);

    if v52 and (StatusEffectUtil:isActive(v52, StatusEffectType.GROUNDED) or StatusEffectUtil:isActive(v52, StatusEffectType.FROSTED)) or (v53 == nil and 0 or v53) <= 0 then
        if p50.wallMounted then
            p50:dismountWall(Character, LookVector, false);
        end;

        return nil;
    end;

    local v54 = Position + Vector3.new(0, 1, 0);
    local v55 = LookVector * CatBalance.WALL_RANGE;
    local v56 = RegionUtil:createRegion3(BlockEngine:getBlockPosition(v54), BlockEngine:getBlockPosition(v54 + v55));
    local v57 = SetUtil.values(BlockEngine:getStore():getBlocksInRegion3(v56));
    local v58;

    if #v57 > 0 then
        local v59 = RaycastParams.new();
        v59.FilterDescendantsInstances = v57;
        v59.FilterType = Enum.RaycastFilterType.Include;
        v58 = GameQueryUtil:raycast(v54, v55, v59, {
            ignorePart = function(p60) -- Line: 283, Name: ignorePart
                return p60:IsA("BasePart") and not p60.CanCollide and true or false;
            end
        });
    else
        v58 = nil;
    end;

    if not v58 then
        if p50.wallMounted then
            p50:dismountWall(Character, LookVector, true);
        end;

        p50.beginAttemptMountWallTime = nil;

        return nil;
    end;

    local v61 = false;

    for _, v in StatefulEntityUtil:getBlocksInRegion(v58.Instance.CFrame, Vector3.new(6, 6, 6), false, false) do
        local Unit = ((Character.PrimaryPart.Position - v.Position) * Vector3.new(1, 0, 1)).Unit;
        local v62 = math.sign(Unit.X);
        local v63 = math.sign(Unit.Z);
        local v64 = Vector3.new(v62, 0, v63);
        local v65 = math.abs(Humanoid.MoveDirection.X) > math.abs(Humanoid.MoveDirection.Z) and Vector3.new(0, 0, 1) or Vector3.new(1, 0, 0);
        local v66 = Humanoid.MoveDirection:Dot(v64 * v65);
        local v67 = math.acos(v66);
        local v68 = math.deg(v67);

        if v68 > 45 and v68 < 135 then
            v61 = true;
        end;
    end;

    if v58.Distance > CatBalance.MAX_DISTANCE_FROM_WALL then
        if p50.wallMounted then
            p50:dismountWall(Character, LookVector, true);
        end;

        p50.beginAttemptMountWallTime = nil;

        return nil;
    end;

    if v61 and Humanoid.MoveDirection.Magnitude ~= 0 then
        local beginAttemptMountWallTime = p50.beginAttemptMountWallTime;

        if beginAttemptMountWallTime == 0 or (beginAttemptMountWallTime ~= beginAttemptMountWallTime or not beginAttemptMountWallTime) then
            p50.beginAttemptMountWallTime = time();
        end;
    else
        p50.beginAttemptMountWallTime = nil;
    end;

    if p50.wallMounted then
        local PrimaryPart = Character.PrimaryPart;
        PrimaryPart:PivotTo(CFrame.new(PrimaryPart.CFrame.Position, PrimaryPart.CFrame.Position + v58.Normal * -1));
        local v69 = Humanoid.MoveDirection:Dot(v58.Normal);
        local v70 = math.acos(v69);
        local v71 = math.deg(v70);
        local v72 = v71 < 60;

        if v71 > 120 then
            local animationTrack = p50.animationTrack;

            if animationTrack ~= nil then
                animationTrack = animationTrack.IsPlaying;
            end;

            if animationTrack then
                local animationTrack2 = p50.animationTrack;

                if animationTrack2 ~= nil then
                    animationTrack2:AdjustSpeed(2);
                end;
            end;

            p50.targetVerticalVelocity:setGoal(u3.Spring.new(CatBalance.WALL_CLIMB_SPEED));
        elseif v72 then
            local animationTrack = p50.animationTrack;

            if animationTrack ~= nil then
                animationTrack = animationTrack.IsPlaying;
            end;

            if animationTrack then
                local animationTrack2 = p50.animationTrack;

                if animationTrack2 ~= nil then
                    animationTrack2:AdjustSpeed(-2);
                end;
            end;

            p50.targetVerticalVelocity:setGoal(u3.Spring.new(-CatBalance.WALL_CLIMB_SPEED));
        else
            if Humanoid.MoveDirection.Magnitude == 0 then
                local animationTrack = p50.animationTrack;

                if animationTrack ~= nil then
                    animationTrack = animationTrack.IsPlaying;
                end;

                if animationTrack then
                    animationTrack = p50.animationTrack.Speed ~= 0;
                end;

                if animationTrack then
                    if math.abs(p50.animationTrack.Speed) < 0.1 then
                        p50.animationTrack:AdjustSpeed(0);
                    else
                        p50.animationTrack:AdjustSpeed(p50.animationTrack.Speed * 0.95);
                    end;
                end;
            else
                local animationTrack = p50.animationTrack;

                if animationTrack ~= nil then
                    animationTrack = animationTrack.IsPlaying;
                end;

                if animationTrack then
                    local animationTrack2 = p50.animationTrack;

                    if animationTrack2 ~= nil then
                        animationTrack2:AdjustSpeed(-2);
                    end;
                end;
            end;

            p50.targetVerticalVelocity:setGoal(u3.Spring.new(0, {
                frequency = 1
            }));
        end;

        if v58.Normal.X == 0 then
            local AssemblyLinearVelocity = Character.PrimaryPart.AssemblyLinearVelocity;
            local v73 = p50.targetVerticalVelocity:getValue();
            local v74 = Vector3.new(0, v73, 0);
            Character.PrimaryPart.AssemblyLinearVelocity = AssemblyLinearVelocity * Vector3.new(1, 0, 0) + v74;
            Humanoid:Move((Vector3.new(Humanoid.MoveDirection.X, 0, 0)));
        else
            local AssemblyLinearVelocity = Character.PrimaryPart.AssemblyLinearVelocity;
            local v75 = p50.targetVerticalVelocity:getValue();
            local v76 = Vector3.new(0, v75, 0);
            Character.PrimaryPart.AssemblyLinearVelocity = AssemblyLinearVelocity * Vector3.new(0, 0, 1) + v76;
            Humanoid:Move((Vector3.new(0, 0, Humanoid.MoveDirection.Z)));
        end;
    end;

    local beginAttemptMountWallTime = p50.beginAttemptMountWallTime;

    if beginAttemptMountWallTime ~= 0 and (beginAttemptMountWallTime == beginAttemptMountWallTime and beginAttemptMountWallTime) then
        beginAttemptMountWallTime = p50.midLeap or time() - p50.beginAttemptMountWallTime > CatBalance.SECONDS_HOLD_TO_WALL_MOUNT;
    end;

    if beginAttemptMountWallTime ~= 0 and (beginAttemptMountWallTime == beginAttemptMountWallTime and beginAttemptMountWallTime) then
        if p50.wallMounted then
            return nil;
        end;

        p50:mountWall(Character);
    end;
end;

function u8.mountWall(u77, u78) -- Line: 437
    -- upvalues: default (copy), Players (copy), u5 (copy), Workspace (copy), GameAnimationUtil (copy), AnimationType (copy)
    task.spawn(function() -- Line: 438
        -- upvalues: default (ref)
        default.Client:Get("CatWallClimbMount"):SendToServer();
    end);
    u77.wallClimbMaid:DoCleaning();
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    local AssemblyMass = Character.AssemblyMass;

    if not u77.liftBodyForce then
        u77.liftBodyForce = u5("BodyForce", {
            Name = "WallClimbAntiGrav",
            Force = Vector3.new(0, Workspace.Gravity * AssemblyMass, 0),
            Parent = Character
        });
    end;

    u77.wallClimbMaid:GiveTask(u77.liftBodyForce);
    u78.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false);
    u77.wallMounted = true;
    u77.midLeap = false;
    local u79 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.CLIMB_ROPE, {
        looped = true
    });
    u77.animationTrack = u79;

    if u77.animationTrack then
        u77.animationTrack.Priority = Enum.AnimationPriority.Movement;
        u77.animationTrack:AdjustSpeed(2);
    end;

    u77.wallClimbMaid:GiveTask(function() -- Line: 471
        -- upvalues: u77 (copy), u79 (copy), u78 (copy)
        u77.wallMounted = false;
        u77.beginAttemptMountWallTime = 0;

        if u79 then
            u79:Stop();
            u79:Destroy();
        end;

        u78.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true);
    end);
end;

function u8.dismountWall(p80, p81, u82, p83) -- Line: 481
    -- upvalues: default (copy)
    task.spawn(function() -- Line: 482
        -- upvalues: default (ref), u82 (copy)
        default.Client:Get("CatWallClimbDismount"):SendToServer({
            direction = u82
        });
    end);

    if p80.wallMounted and p83 then
        local PrimaryPart = p81.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.AssemblyMass;
        end;

        p81.HumanoidRootPart:ApplyImpulse(Vector3.new(0, 1, 0) * (PrimaryPart == nil and 1 or PrimaryPart) * 25);
    end;

    p80.wallClimbMaid:DoCleaning();
end;

function u8.leap(u84, p85, p86) -- Line: 503
    -- upvalues: KnitClient2 (copy), StarterPlayer (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), KnitClient (copy), AnimationType (copy)
    u84.midLeap = true;
    u84.jumpMaid:GiveTask(function() -- Line: 508
        -- upvalues: u84 (copy)
        u84.midLeap = false;
    end);
    p85.HumanoidRootPart.CFrame = CFrame.lookAt(p85.HumanoidRootPart.Position, p85.HumanoidRootPart.Position + p86 * Vector3.new(1, 0, 1));
    p85.Humanoid.JumpHeight = 0.5;
    p85.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
    local PrimaryPart = p85.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.AssemblyMass;
    end;

    p85.HumanoidRootPart:ApplyImpulse(p86.Unit * Vector3.new(1, 0, 1) * (PrimaryPart == nil and 1 or PrimaryPart) * 70);
    KnitClient2.Controllers.JumpHeightController:setJumpHeight(StarterPlayer.CharacterJumpHeight);
    SoundManager:playSound(RandomUtil.fromList(unpack({ GameSound.CAT_POUNCE_1, GameSound.CAT_POUNCE_2, GameSound.CAT_POUNCE_3 })), {
        position = p85.HumanoidRootPart.Position
    });
    KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.DAGGER_CHARGE);
end;

function u8.pounce(p87) -- Line: 537
    -- upvalues: Players (copy), Workspace (copy), KnitClient (copy), AnimationType (copy)
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    p87:leap(Character, Workspace.CurrentCamera.CFrame.LookVector);
    KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_USE_ITEM);
end;

KnitClient.CreateController(u8.new());

return nil;