-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local SetUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").SetUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local WatchCharacter = v1.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local RunService = v5.RunService;
local UserInputService = v5.UserInputService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CatBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "cat-balance").CatBalance;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local InfectedTeamId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-team-id").InfectedTeamId;
local InfectedVariantType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-variant-type").InfectedVariantType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local StatefulEntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local RegionUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "region-util").RegionUtil;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 42, Name: __tostring
        return "InfectedProwlerController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 48
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 52
    -- upvalues: KnitController (copy), u3 (copy), u2 (copy)
    KnitController.constructor(p8);
    p8.Name = "InfectedProwlerController";
    p8.setupMaid = u3.new();
    p8.wallClimbMaid = u3.new();
    p8.wallMounted = false;
    p8.targetVerticalVelocity = u2.SingleMotor.new(0);
end;

function u6.KnitStart(u9) -- Line: 60
    -- upvalues: KnitController (copy), KnitClient (copy), QueueType (copy), AnimationType (copy), WatchCharacter (copy), InfectedTeamId (copy), InfectedVariantType (copy), default (copy)
    KnitController.KnitStart(u9);
    KnitClient.Controllers.MatchController:getQueueTypeAsync():andThen(function(p10) -- Line: 62
        -- upvalues: QueueType (ref), KnitClient (ref), AnimationType (ref), WatchCharacter (ref), InfectedTeamId (ref), InfectedVariantType (ref), u9 (copy)
        if p10 == QueueType.INFECTED then
            KnitClient.Controllers.PreloadController:runPreload({
                animations = { AnimationType.CLIMB_ROPE }
            });
            WatchCharacter(function(p11) -- Line: 67
                -- upvalues: InfectedTeamId (ref), InfectedVariantType (ref), u9 (ref)
                local v12 = p11:GetAttribute("Team");
                local v13 = p11:GetAttribute("InfectedVariantType");

                if v12 == InfectedTeamId.INFECTED and v13 == InfectedVariantType.PROWLER then
                    u9:setupWallClimbing();

                    return;
                end;

                u9.setupMaid:DoCleaning();
            end);
        end;
    end, function() -- Line: 77
        -- upvalues: default (ref)
        return default.Warn("[InfectedProwler] Could not retrieve queue type.");
    end);
end;

function u6.setupWallClimbing(u14) -- Line: 81
    -- upvalues: KnitClient (copy), Players (copy), BedwarsKit (copy), UserInputService (copy), ClientSyncEvents (copy), RunService (copy), EntityDamageEventZap (copy)
    u14.setupMaid:DoCleaning();
    local u15 = KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.INFECTED_PROWLER);

    if not u15 then
        return nil;
    end;

    u14.setupMaid:GiveTask(UserInputService.JumpRequest:Connect(function() -- Line: 88
        -- upvalues: u14 (copy), u15 (copy), Players (ref)
        if not (u14.wallMounted and u15) then
            return nil;
        end;

        local Character = Players.LocalPlayer.Character;

        if Character == nil or not Character.PrimaryPart then
            return nil;
        end;

        u14:dismountWall(Character, Character.PrimaryPart.CFrame.LookVector, false);
    end));
    u14.setupMaid:GiveTask(ClientSyncEvents.SwordSwing:connect(function(p16) -- Line: 99
        -- upvalues: u15 (copy), u14 (copy)
        if not p16:isCancelled() and (u15 and u14.wallMounted) then
            p16:setCancelled(true);
        end;
    end));
    u14.setupMaid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 105
        -- upvalues: u14 (copy)
        u14:stepWallClimbCheck();
    end));
    local u31 = EntityDamageEventZap.On(function(p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30) -- Line: 109
        -- upvalues: Players (ref), u14 (copy)
        if p17 ~= Players.LocalPlayer.Character then
            return nil;
        end;

        if p22 ~= nil then
            p22 = p22.disabled;
        end;

        if p22 then
            return nil;
        end;

        if not u14.wallMounted then
            return nil;
        end;

        local Character = Players.LocalPlayer.Character;

        if Character == nil or not Character.PrimaryPart then
            return nil;
        end;

        u14:dismountWall(Character, Character.PrimaryPart.CFrame.LookVector, true);
    end);
    u14.setupMaid:GiveTask(function() -- Line: 130
        -- upvalues: u31 (copy)
        u31();
    end);
end;

function u6.stepWallClimbCheck(p32) -- Line: 134
    -- upvalues: Players (copy), EntityUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy), CatBalance (copy), RegionUtil (copy), BlockEngine (copy), SetUtil (copy), GameQueryUtil (copy), StatefulEntityUtil (copy), u2 (copy)
    local Character = Players.LocalPlayer.Character;
    local v33;

    if Character == nil then
        v33 = Character;
    else
        v33 = Character.PrimaryPart;
    end;

    if not v33 then
        return nil;
    end;

    local Humanoid = Character:FindFirstChild("Humanoid");

    if not Humanoid then
        return nil;
    end;

    local Position = Character.PrimaryPart.Position;
    local LookVector = Character.PrimaryPart.CFrame.LookVector;
    local v34 = EntityUtil:getEntity(Players.LocalPlayer);

    if v34 ~= nil then
        v34 = v34:getInstance();
    end;

    if v34 and (StatusEffectUtil:isActive(v34, StatusEffectType.GROUNDED) or StatusEffectUtil:isActive(v34, StatusEffectType.FROSTED)) then
        if p32.wallMounted then
            p32:dismountWall(Character, LookVector, false);
        end;

        return nil;
    end;

    local v35 = Position + Vector3.new(0, 1, 0);
    local v36 = LookVector * CatBalance.WALL_RANGE;
    local v37 = RegionUtil:createRegion3(BlockEngine:getBlockPosition(v35), BlockEngine:getBlockPosition(v35 + v36));
    local v38 = SetUtil.values(BlockEngine:getStore():getBlocksInRegion3(v37));
    local v39;

    if #v38 > 0 then
        local v40 = RaycastParams.new();
        v40.FilterDescendantsInstances = v38;
        v40.FilterType = Enum.RaycastFilterType.Include;
        v39 = GameQueryUtil:raycast(v35, v36, v40, {
            ignorePart = function(p41) -- Line: 175, Name: ignorePart
                return p41:IsA("BasePart") and not p41.CanCollide and true or false;
            end
        });
    else
        v39 = nil;
    end;

    if not v39 then
        if p32.wallMounted then
            p32:dismountWall(Character, LookVector, true);
        end;

        p32.beginAttemptMountWallTime = nil;

        return nil;
    end;

    local v42 = false;

    for _, v in StatefulEntityUtil:getBlocksInRegion(v39.Instance.CFrame, Vector3.new(6, 6, 6), false, false) do
        local Unit = ((Character.PrimaryPart.Position - v.Position) * Vector3.new(1, 0, 1)).Unit;
        local v43 = math.sign(Unit.X);
        local v44 = math.sign(Unit.Z);
        local v45 = Vector3.new(v43, 0, v44);
        local v46 = math.abs(Humanoid.MoveDirection.X) > math.abs(Humanoid.MoveDirection.Z) and Vector3.new(0, 0, 1) or Vector3.new(1, 0, 0);
        local v47 = Humanoid.MoveDirection:Dot(v45 * v46);
        local v48 = math.acos(v47);
        local v49 = math.deg(v48);

        if v49 > 45 and v49 < 135 then
            v42 = true;
        end;
    end;

    if v39.Distance > CatBalance.MAX_DISTANCE_FROM_WALL then
        if p32.wallMounted then
            p32:dismountWall(Character, LookVector, true);
        end;

        p32.beginAttemptMountWallTime = nil;

        return nil;
    end;

    if v42 and Humanoid.MoveDirection.Magnitude ~= 0 then
        local beginAttemptMountWallTime = p32.beginAttemptMountWallTime;

        if beginAttemptMountWallTime == 0 or (beginAttemptMountWallTime ~= beginAttemptMountWallTime or not beginAttemptMountWallTime) then
            p32.beginAttemptMountWallTime = time();
        end;
    else
        p32.beginAttemptMountWallTime = nil;
    end;

    if p32.wallMounted then
        local PrimaryPart = Character.PrimaryPart;
        PrimaryPart:PivotTo(CFrame.new(PrimaryPart.CFrame.Position, PrimaryPart.CFrame.Position + v39.Normal * -1));
        local v50 = Humanoid.MoveDirection:Dot(v39.Normal);
        local v51 = math.acos(v50);
        local v52 = math.deg(v51);
        local v53 = v52 < 60;

        if v52 > 120 then
            local animationTrack = p32.animationTrack;

            if animationTrack ~= nil then
                animationTrack = animationTrack.IsPlaying;
            end;

            if animationTrack then
                local animationTrack2 = p32.animationTrack;

                if animationTrack2 ~= nil then
                    animationTrack2:AdjustSpeed(2);
                end;
            end;

            p32.targetVerticalVelocity:setGoal(u2.Spring.new(CatBalance.WALL_CLIMB_SPEED));
        elseif v53 then
            local animationTrack = p32.animationTrack;

            if animationTrack ~= nil then
                animationTrack = animationTrack.IsPlaying;
            end;

            if animationTrack then
                local animationTrack2 = p32.animationTrack;

                if animationTrack2 ~= nil then
                    animationTrack2:AdjustSpeed(-2);
                end;
            end;

            p32.targetVerticalVelocity:setGoal(u2.Spring.new(-CatBalance.WALL_CLIMB_SPEED));
        else
            if Humanoid.MoveDirection.Magnitude == 0 then
                local animationTrack = p32.animationTrack;

                if animationTrack ~= nil then
                    animationTrack = animationTrack.IsPlaying;
                end;

                if animationTrack then
                    animationTrack = p32.animationTrack.Speed ~= 0;
                end;

                if animationTrack then
                    if math.abs(p32.animationTrack.Speed) < 0.1 then
                        p32.animationTrack:AdjustSpeed(0);
                    else
                        p32.animationTrack:AdjustSpeed(p32.animationTrack.Speed * 0.95);
                    end;
                end;
            else
                local animationTrack = p32.animationTrack;

                if animationTrack ~= nil then
                    animationTrack = animationTrack.IsPlaying;
                end;

                if animationTrack then
                    local animationTrack2 = p32.animationTrack;

                    if animationTrack2 ~= nil then
                        animationTrack2:AdjustSpeed(-2);
                    end;
                end;
            end;

            p32.targetVerticalVelocity:setGoal(u2.Spring.new(0, {
                frequency = 1
            }));
        end;

        if v39.Normal.X == 0 then
            local AssemblyLinearVelocity = Character.PrimaryPart.AssemblyLinearVelocity;
            local v54 = p32.targetVerticalVelocity:getValue();
            local v55 = Vector3.new(0, v54, 0);
            Character.PrimaryPart.AssemblyLinearVelocity = AssemblyLinearVelocity * Vector3.new(1, 0, 0) + v55;
            Humanoid:Move((Vector3.new(Humanoid.MoveDirection.X, 0, 0)));
        else
            local AssemblyLinearVelocity = Character.PrimaryPart.AssemblyLinearVelocity;
            local v56 = p32.targetVerticalVelocity:getValue();
            local v57 = Vector3.new(0, v56, 0);
            Character.PrimaryPart.AssemblyLinearVelocity = AssemblyLinearVelocity * Vector3.new(0, 0, 1) + v57;
            Humanoid:Move((Vector3.new(0, 0, Humanoid.MoveDirection.Z)));
        end;
    end;

    local beginAttemptMountWallTime = p32.beginAttemptMountWallTime;

    if beginAttemptMountWallTime ~= 0 and (beginAttemptMountWallTime == beginAttemptMountWallTime and beginAttemptMountWallTime) then
        beginAttemptMountWallTime = time() - p32.beginAttemptMountWallTime > CatBalance.SECONDS_HOLD_TO_WALL_MOUNT;
    end;

    if beginAttemptMountWallTime ~= 0 and (beginAttemptMountWallTime == beginAttemptMountWallTime and beginAttemptMountWallTime) then
        if p32.wallMounted then
            return nil;
        end;

        p32:mountWall(Character);
    end;
end;

function u6.mountWall(u58, u59) -- Line: 329
    -- upvalues: default2 (copy), Players (copy), u4 (copy), Workspace (copy), GameAnimationUtil (copy), AnimationType (copy)
    task.spawn(function() -- Line: 330
        -- upvalues: default2 (ref)
        default2.Client:Get("CatWallClimbMount"):SendToServer();
    end);
    u58.wallClimbMaid:DoCleaning();
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    local AssemblyMass = Character.AssemblyMass;

    if not u58.liftBodyForce then
        u58.liftBodyForce = u4("BodyForce", {
            Name = "WallClimbAntiGrav",
            Force = Vector3.new(0, Workspace.Gravity * AssemblyMass, 0),
            Parent = Character
        });
    end;

    u58.wallClimbMaid:GiveTask(u58.liftBodyForce);
    u59.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false);
    u58.wallMounted = true;
    local u60 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.CLIMB_ROPE, {
        looped = true
    });
    u58.animationTrack = u60;

    if u58.animationTrack then
        u58.animationTrack.Priority = Enum.AnimationPriority.Movement;
        u58.animationTrack:AdjustSpeed(2);
    end;

    u58.wallClimbMaid:GiveTask(function() -- Line: 360
        -- upvalues: u58 (copy), u60 (copy), u59 (copy)
        u58.wallMounted = false;
        u58.beginAttemptMountWallTime = 0;

        if u60 then
            u60:Stop();
            u60:Destroy();
        end;

        u59.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true);
    end);
end;

function u6.dismountWall(p61, p62, u63, p64) -- Line: 370
    -- upvalues: default2 (copy)
    task.spawn(function() -- Line: 371
        -- upvalues: default2 (ref), u63 (copy)
        default2.Client:Get("CatWallClimbDismount"):SendToServer({
            direction = u63
        });
    end);

    if p61.wallMounted and p64 then
        local PrimaryPart = p62.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.AssemblyMass;
        end;

        p62.HumanoidRootPart:ApplyImpulse(Vector3.new(0, 1, 0) * (PrimaryPart == nil and 1 or PrimaryPart) * 25);
    end;

    p61.wallClimbMaid:DoCleaning();
end;

KnitClient.CreateController(u6.new());

return nil;