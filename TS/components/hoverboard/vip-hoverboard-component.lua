-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local AnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local RunService = v3.RunService;
local SoundService = v3.SoundService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "draw");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid");
local LocalPlayer = Players.LocalPlayer;
local u6 = { CFrame.new(-2, 0, 0), CFrame.new(0, 0, 0), CFrame.new(2, 0, 0) };

local function getClosestAngle(p7, p8) -- Line: 33
    return (p8 - p7 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793 + p7;
end;

local function map(p9, p10, p11, p12, p13) -- Line: 37
    return p12 + (p13 - p12) * ((p9 - p10) / (p11 - p10));
end;

local function easeOutCubic(p14) -- Line: 40
    return 1 - math.pow(1 - p14, 3);
end;

local u15 = setmetatable({}, {
    __tostring = function() -- Line: 46, Name: __tostring
        return "VipHoverboardComponent";
    end
});
u15.__index = u15;

function u15.new(...) -- Line: 51
    -- upvalues: u15 (ref)
    local v16 = setmetatable({}, u15);

    return v16:constructor(...) or v16;
end;

function u15.constructor(u17, p18) -- Line: 55
    -- upvalues: u5 (copy), u4 (copy), u6 (copy), u1 (copy), default (copy), LocalPlayer (copy), u2 (copy), Workspace (copy), SoundService (copy), AnimationUtil (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), Flamework (copy), AbilityId (copy), BedwarsImageId (copy), ClientSyncEvents (copy)
    u17.hoverboard = p18;
    u17.pitchPid = u5.new(-5, 5, 0.075, 0, 0);
    u17.yawPid = u5.new(-15, 15, 0.04, 0, 0);
    u17.rollPid = u5.new(-10, 10, 0.1, 0, 0);
    u17.counterDriftPid = u5.new(-10000, 10000, 2500, 1, 1);
    u17.levitationPid = u5.new(-300000, 300000, 16000, 750, 0);
    u17.movePid = u5.new(-4500, 4500, 100, 10, 0);
    u17.lastJumpTimestamp = 0;

    local function _() -- Line: 64
        -- upvalues: u4 (ref)
        return u4.ray(Ray.new());
    end;

    local v19 = table.create(#u6);

    for i, _ in u6 do
        local _ = i - 1;
        v19[i] = u4.ray(Ray.new());
    end;

    u17.debugRays = v19;
    u17.maid = u1.new();
    u17.abilityButtonMaid = u1.new();
    u17.spinning = false;
    u17.largeJumpCooldown = -1;
    u17.lastDirection = 0;
    u17.effectEnabled = false;
    u17.beamEffects = {};
    u17.moving = false;
    default.Debug("Got new VIP hoverboard at {@Location}", p18);
    local Character = LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart", 5);
    local Humanoid = Character:WaitForChild("Humanoid", 5);

    if not (HumanoidRootPart and Humanoid) then
        return nil;
    end;

    u17.character = Character;

    if not u17:isOwn() then
        return nil;
    end;

    default.Debug("VIP Hoverboard belongs to local player");
    Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
    local v20 = u2("Attachment", {
        Parent = p18
    });
    u17.angularVelocity = u2("AngularVelocity", {
        MaxTorque = (1 / 0),
        RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
        Attachment0 = v20,
        Parent = p18
    });
    u17.worldSpaceForce = u2("VectorForce", {
        Name = "WorldSpaceForce",
        ApplyAtCenterOfMass = true,
        RelativeTo = Enum.ActuatorRelativeTo.World,
        Attachment0 = v20,
        Parent = p18
    });
    u17.localSpaceForce = u2("VectorForce", {
        Name = "LocalSpaceForce",
        ApplyAtCenterOfMass = true,
        RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
        Attachment0 = v20,
        Parent = p18
    });
    u17.levitationPid:Debug("LevitationPID", Workspace);
    u17.counterDriftPid:Debug("CounterDriftPID", Workspace);
    u17.pitchPid:Debug("PitchPID", Workspace);
    u17.rollPid:Debug("RollPID", Workspace);
    u17.movePid:Debug("MovePID", Workspace);
    u17.yawPid:Debug("YawPID", Workspace);
    local v21 = RaycastParams.new();
    v21.FilterDescendantsInstances = { Workspace:FindFirstChild("Map"), Workspace:FindFirstChild("Lobby"), Workspace.Terrain };
    v21.FilterType = Enum.RaycastFilterType.Whitelist;
    u17.raycastParams = v21;
    u17.hoverSound = u2("Sound", {
        Name = "HoverSound",
        Looped = true,
        Playing = true,
        Volume = 1,
        SoundId = "rbxassetid://" .. tostring(7910584261),
        Parent = SoundService
    });
    u17.windSound = u2("Sound", {
        Name = "WindSound",
        Looped = true,
        Playing = true,
        Volume = 0.25,
        SoundId = "rbxassetid://" .. tostring(7910583431),
        Parent = SoundService
    });
    local v22 = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.HOVER_BOARD_JUMP));

    if v22 then
        task.delay(v22.Length, function() -- Line: 155
            -- upvalues: u17 (copy)
            u17:setAnimationManually();
        end);
    end;

    u17.abilityButtonMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.HOVERBOARD_LONG_JUMP, {
        abilityType = "ItemPrimary",
        abilityButton = {
            icon = BedwarsImageId.VIP_HOVER_BOARD
        }
    }):expect());
    u17.abilityButtonMaid:GiveTask(ClientSyncEvents.AbilityUsed:connect(function(p23) -- Line: 166
        -- upvalues: AbilityId (ref), Players (ref), u17 (copy)
        if p23.ability == AbilityId.HOVERBOARD_LONG_JUMP and p23.userCharacter == Players.LocalPlayer.Character then
            local Character2 = Players.LocalPlayer.Character;

            if Character2 ~= nil then
                Character2 = Character2.PrimaryPart;
            end;

            local v24;

            if Character2 == nil then
                v24 = Character2;
            else
                v24 = Character2.CFrame.LookVector.Unit * Vector3.new(1, 0, 1);
            end;

            local AssemblyMass = Character2.AssemblyMass;
            local Character3 = Players.LocalPlayer.Character;

            if Character3 ~= nil then
                Character3 = Character3.PrimaryPart;

                if Character3 ~= nil then
                    Character3 = Character3.AssemblyLinearVelocity;
                end;
            end;

            local Character4 = Players.LocalPlayer.Character;

            if Character4 ~= nil then
                Character4 = Character4.PrimaryPart;

                if Character4 ~= nil then
                    Character4 = Character4.AssemblyLinearVelocity.Magnitude;
                end;
            end;

            if v24 then
                if AssemblyMass ~= 0 and (AssemblyMass == AssemblyMass and AssemblyMass) then
                    if Character4 == 0 or Character4 ~= Character4 then
                        AssemblyMass = Character4;
                    elseif Character4 then
                        AssemblyMass = Character3;
                    else
                        AssemblyMass = Character4;
                    end;
                end;
            else
                AssemblyMass = v24;
            end;

            if AssemblyMass ~= 0 and (AssemblyMass == AssemblyMass and AssemblyMass) then
                if Character4 < 20 or Character3.Y < 5 then
                    u17:spinHorizontal();

                    return;
                end;

                if math.abs(u17.lastDirection) > 0.2 then
                    u17:sideTrick();

                    return;
                end;

                u17:spinVertical();
            end;
        end;
    end));
    task.spawn(function() -- Line: 220
        -- upvalues: u17 (copy)
        local Board = u17.hoverboard:WaitForChild("Board", 3);

        if Board ~= nil then
            local function _(p25) -- Line: 224
                -- upvalues: u17 (ref)
                if p25:IsA("Beam") then
                    table.insert(u17.beamEffects, p25);
                end;
            end;

            for i, descendant in Board:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("Beam") then
                    table.insert(u17.beamEffects, descendant);
                end;
            end;
        end;
    end);
    u17.maid:GiveTask(Character.Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function() -- Line: 236
        -- upvalues: u17 (copy), Character (copy), AnimationUtil (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref)
        if u17.spinning then
            return nil;
        end;

        if Character.Humanoid.MoveDirection.Magnitude > 0 and not u17.moving then
            u17.moving = true;
            local movementTrack = u17.movementTrack;

            if movementTrack ~= nil then
                movementTrack:Stop();
            end;

            local movementTrack2 = u17.movementTrack;

            if movementTrack2 ~= nil then
                movementTrack2:Destroy();
            end;

            u17.movementTrack = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.HOVER_BOARD_MOVE));

            if u17.animationModel then
                local boardMovementTrack = u17.boardMovementTrack;

                if boardMovementTrack ~= nil then
                    boardMovementTrack:Stop();
                end;

                local boardMovementTrack2 = u17.boardMovementTrack;

                if boardMovementTrack2 ~= nil then
                    boardMovementTrack2:Destroy();
                end;

                u17.boardMovementTrack = AnimationUtil:playAnimation(u17.animationModel, GameAnimationUtil:getAssetId(AnimationType.HOVERBOARD_MOVEMENT));
            end;
        elseif Character.Humanoid.MoveDirection.Magnitude == 0 and u17.moving then
            u17.moving = false;
            local movementTrack = u17.movementTrack;

            if movementTrack ~= nil then
                movementTrack:Stop();
            end;

            local movementTrack2 = u17.movementTrack;

            if movementTrack2 ~= nil then
                movementTrack2:Destroy();
            end;

            u17.movementTrack = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.HOVER_BOARD_IDLE));

            if u17.animationModel then
                local boardMovementTrack = u17.boardMovementTrack;

                if boardMovementTrack ~= nil then
                    boardMovementTrack:Stop();
                end;

                local boardMovementTrack2 = u17.boardMovementTrack;

                if boardMovementTrack2 ~= nil then
                    boardMovementTrack2:Destroy();
                end;

                u17.boardMovementTrack = AnimationUtil:playAnimation(u17.animationModel, GameAnimationUtil:getAssetId(AnimationType.HOVERBOARD_IDLE));
            end;
        end;
    end));
    u17.animationModel = u17.hoverboard:WaitForChild("viphoverboard", 3);
end;

function u15.spinVertical(u26) -- Line: 288
    -- upvalues: Players (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), RunService (copy)
    local u27 = 0;
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    u26.spinning = true;
    local v28 = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.HOVER_BOARD_JUMP));

    if v28 then
        task.delay(v28.Length, function() -- Line: 297
            -- upvalues: u26 (copy)
            u26:setAnimationManually();
        end);
    end;

    task.delay(0.2, function() -- Line: 301
        -- upvalues: RunService (ref), u27 (ref), u26 (copy), Character (copy)
        local u29 = nil;
        u29 = RunService.Heartbeat:Connect(function(p30) -- Line: 303
            -- upvalues: u27 (ref), u26 (ref), u29 (ref), Character (ref)
            if u27 > 0.5 then
                u26.spinning = false;
                u29:Disconnect();

                return nil;
            end;

            u27 = u27 + p30;
            Character:PivotTo(Character.PrimaryPart.CFrame * CFrame.Angles(0, 0, 12.566370614359172 * p30));
        end);
    end);
end;

function u15.spinHorizontal(u31) -- Line: 317
    -- upvalues: Players (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), RunService (copy)
    local u32 = 0;
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    u31.spinning = true;
    local v33 = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.HOVER_BOARD_JUMP));

    if v33 then
        task.delay(v33.Length, function() -- Line: 326
            -- upvalues: u31 (copy)
            u31:setAnimationManually();
        end);
    end;

    task.delay(0.2, function() -- Line: 330
        -- upvalues: RunService (ref), u32 (ref), u31 (copy), Character (copy)
        local u34 = nil;
        u34 = RunService.Heartbeat:Connect(function(p35) -- Line: 332
            -- upvalues: u32 (ref), u31 (ref), u34 (ref), Character (ref)
            if u32 > 0.5 then
                u31.spinning = false;
                u34:Disconnect();

                return nil;
            end;

            u32 = u32 + p35;
            Character:PivotTo(Character.PrimaryPart.CFrame * CFrame.Angles(0, (u31.lastDirection > 0 and -1 or 1) * 3.141592653589793 * 4 * p35, 0));
        end);
    end);
end;

function u15.sideTrick(u36) -- Line: 347
    -- upvalues: Players (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), RunService (copy)
    local u37 = 0;
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    u36.spinning = true;
    local v38 = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.HOVER_BOARD_JUMP));

    if v38 then
        task.delay(v38.Length, function() -- Line: 356
            -- upvalues: u36 (copy)
            u36:setAnimationManually();
        end);
    end;

    task.delay(0.2, function() -- Line: 360
        -- upvalues: RunService (ref), u37 (ref), u36 (copy), Character (copy)
        local u39 = nil;
        u39 = RunService.Heartbeat:Connect(function(p40) -- Line: 362
            -- upvalues: u37 (ref), u39 (ref), u36 (ref), Character (ref)
            if u37 > 0.5 then
                u39:Disconnect();
                u36.spinning = false;

                return nil;
            end;

            u37 = u37 + p40;
            Character:PivotTo(Character.PrimaryPart.CFrame * CFrame.Angles((u36.lastDirection > 0 and -1 or 1) * 3.141592653589793 * 4 * p40, 0, 0));
        end);
    end);
end;

function u15.SteppedUpdate(u41, p42) -- Line: 377
    -- upvalues: Players (copy), Workspace (copy), u6 (copy), KnitClient (copy), default2 (copy)
    local character = u41.character;

    if not (character and u41:isOwn()) then
        return nil;
    end;

    if u41.spinning then
        return nil;
    end;

    local CFrame2 = u41.hoverboard.CFrame;
    local Position = CFrame2.Position;
    local v43 = CFrame2:VectorToObjectSpace(u41.hoverboard.AssemblyLinearVelocity);
    local v44, _, v45 = CFrame2:ToOrientation();
    local Humanoid = character.Humanoid;
    local MoveDirection = Humanoid.MoveDirection;
    local v46 = -CFrame2:VectorToObjectSpace(MoveDirection).X;
    local LookVector = CFrame2.LookVector;
    local v47 = math.atan2(LookVector.Z, LookVector.X) + 1.5707963267948966;
    local v48 = u41.hoverboard.AssemblyLinearVelocity * Vector3.new(1, 0, 1);
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.AssemblyLinearVelocity.Magnitude;
        end;
    end;

    local X = CFrame2:VectorToObjectSpace(v48).X;
    local v49 = -math.sign(X);
    local v50 = v48.Magnitude * v49;
    u41.lastDirection = CFrame2.LookVector:Dot(MoveDirection);
    local v51 = (os.clock() - 0) / 0.5;
    local v52 = math.sin(v51) * 0.1 + 0 + 5;
    local u53 = Vector3.new(0, -v52, 0);

    local function _(p54, p55) -- Line: 418
        -- upvalues: CFrame2 (copy), Workspace (ref), u53 (copy), u41 (copy)
        local v56 = Workspace:Raycast((CFrame2 * p54).Position, u53, u41.raycastParams);

        if v56 then
            return v56.Position.Y;
        end;

        return nil;
    end;

    local v57 = {};
    local v58 = 0;
    local v59 = true;
    local v60 = 0;

    for i, v in u6 do
        local _ = i - 1;
        local v61 = Workspace:Raycast((CFrame2 * v).Position, u53, u41.raycastParams);
        local v62;

        if v61 then
            v62 = v61.Position.Y;
        else
            v62 = nil;
        end;

        if v62 ~= nil then
            v58 = v58 + 1;
            v57[v58] = v62;
        end;
    end;

    if #v57 > 0 then
        local function _(p63, p64) -- Line: 446
            if p64 < p63 then
                return p63;
            end;

            return p64;
        end;

        if #v57 == 0 then
            error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.");
        end;

        local v65 = v57[1];

        for i = 2, #v57 do
            local v66 = v57[i];
            local _ = i - 1;

            if v66 >= v65 then
                v65 = v66;
            end;
        end;

        v60 = u41.levitationPid:Calculate(p42, v65 + v52, Position.Y);
        local v67 = 1 - math.pow(1 - (1 - (0 + 1 * ((0.4 + 0.4 * ((Position.Y - v65 - 0) / (v52 - 0)) + (1 - (0.25 + 0.55 * ((v50 - 0) / 50))) - 0.65) / 0.9500000000000001))), 3);
        u41.hoverSound.PlaybackSpeed = v67;
    else
        v59 = false;
    end;

    local v68 = u41.counterDriftPid:Calculate(p42, 0, v43.Z);
    local v69 = u41.pitchPid:Calculate(p42, 15 * v46, (math.deg(v45)));
    local v70 = CFrame2:VectorToObjectSpace(MoveDirection) * Vector3.new(1, 0, 1);
    local v71 = math.atan2(v70.Z, -v70.X);
    local v72 = MoveDirection.Magnitude > 0.05;
    local v73;

    if v72 then
        local v74 = math.deg((v47 + v71 - v47 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793 + v47);
        v73 = u41.yawPid:Calculate(p42, v74, (math.deg(v47)));
    else
        v73 = 0;
    end;

    local v75 = u41.rollPid:Calculate(p42, 25 * (not v72 and 0 or -1 + 2 * ((v71 - -3.141592653589793) / 6.283185307179586)), (math.deg(v44)));
    local v76 = u41.movePid:Calculate(p42, -45 + 95 * ((v46 - -0.9) / 1.9), v50);
    local v77 = 0 + 0.5 * ((math.abs(v50) - 0) / 50);
    u41.windSound.Volume = v77;
    local Jump = Humanoid.Jump;
    local v78;

    if os.clock() - u41.lastJumpTimestamp >= 0.5 then
        v78 = Jump and v59;
    else
        v78 = false;
    end;

    local v79 = KnitClient.Controllers.SprintController:isSprinting();
    local Character2 = Players.LocalPlayer.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;

        if Character2 ~= nil then
            Character2 = Character2.AssemblyLinearVelocity.Magnitude;
        end;
    end;

    if v78 and not v79 or v78 and u41.largeJumpCooldown > Workspace:GetServerTimeNow() then
        u41.hoverboard:ApplyImpulse(Vector3.new(0, 1250, 0));
        u41.lastJumpTimestamp = os.clock();
    elseif v79 and v78 then
        u41.largeJumpCooldown = Workspace:GetServerTimeNow() + 3;
        local Character3 = Players.LocalPlayer.Character;

        if Character3 ~= nil then
            Character3 = Character3.PrimaryPart;
        end;

        local v80;

        if Character3 == nil then
            v80 = Character3;
        else
            v80 = Character3.CFrame.LookVector.Unit * Vector3.new(1, 0, 1);
        end;

        local AssemblyMass = Character3.AssemblyMass;

        if v80 then
            if AssemblyMass == 0 or AssemblyMass ~= AssemblyMass then
                Character2 = AssemblyMass;
            elseif not AssemblyMass then
                Character2 = AssemblyMass;
            end;
        else
            Character2 = v80;
        end;

        if Character2 ~= 0 and (Character2 == Character2 and Character2) then
            local v81;

            if v80 == nil then
                v81 = v80;
            else
                v81 = v80.Z;
            end;

            local v82 = Vector3.new(v81, v80.Y, -v80.X) * (25 * AssemblyMass) + Vector3.new(0, 1250, 0);
            default2.Client:Get("VipHoverBoardDash"):SendToServer({
                direction = v82
            });
            u41.hoverboard:ApplyImpulse(v82);
            u41.lastJumpTimestamp = os.clock() + 1;
        end;
    end;

    u41.worldSpaceForce.Force = Vector3.new(0, v60, 0);
    u41.localSpaceForce.Force = Vector3.new(-v76, 0, v68);
    u41.angularVelocity.AngularVelocity = Vector3.new(v75, v73, v69);
end;

function u15.setCharacterMassless(p83, p84) -- Line: 574
    local character = p83.character;

    if not character then
        return nil;
    end;

    for _, descendant in character:GetDescendants() do
        if descendant ~= p83.hoverboard and descendant:IsA("BasePart") then
            descendant.Massless = p84;
        end;
    end;
end;

function u15.dismountHoverboard(p85) -- Line: 588
    -- upvalues: default2 (copy)
    default2.Client:Get("DismountVipHoverboard"):SendToServer();
end;

function u15.Destroy(p86) -- Line: 591
    -- upvalues: default (copy)
    local character = p86.character;

    if not (character and p86:isOwn()) then
        return nil;
    end;

    default.Debug("Local hoverboard destroyed");
    character.HumanoidRootPart.Anchored = false;
    character.Humanoid:ChangeState(Enum.HumanoidStateType.Running);
    local hoverSound = p86.hoverSound;

    if hoverSound ~= nil then
        hoverSound:Destroy();
    end;

    local windSound = p86.windSound;

    if windSound ~= nil then
        windSound:Destroy();
    end;

    local maid = p86.maid;

    if maid ~= nil then
        maid:DoCleaning();
    end;

    local abilityButtonMaid = p86.abilityButtonMaid;

    if abilityButtonMaid ~= nil then
        abilityButtonMaid:DoCleaning();
    end;

    local movementTrack = p86.movementTrack;

    if movementTrack ~= nil then
        movementTrack:Stop();
    end;

    local movementTrack2 = p86.movementTrack;

    if movementTrack2 ~= nil then
        movementTrack2:Destroy();
    end;
end;

function u15.isOwn(p87) -- Line: 625
    local v88;

    if p87.character == nil then
        v88 = false;
    else
        v88 = p87.hoverboard.Parent == p87.character;
    end;

    return v88;
end;

function u15.enableBeams(p89) -- Line: 628
    p89.effectEnabled = true;

    local function _(p90) -- Line: 631
        p90.Enabled = true;
    end;

    for i, v in p89.beamEffects do
        local _ = i - 1;
        v.Enabled = true;
    end;
end;

function u15.disableBeams(p91) -- Line: 638
    p91.effectEnabled = false;

    local function _(p92) -- Line: 641
        p92.Enabled = false;
    end;

    for i, v in p91.beamEffects do
        local _ = i - 1;
        v.Enabled = false;
    end;
end;

function u15.setAnimationManually(p93) -- Line: 648
    -- upvalues: AnimationUtil (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy)
    local character = p93.character;

    if not character then
        return nil;
    end;

    if character.Humanoid.MoveDirection.Magnitude == 0 then
        p93.moving = false;
        local movementTrack = p93.movementTrack;

        if movementTrack ~= nil then
            movementTrack:Stop();
        end;

        local movementTrack2 = p93.movementTrack;

        if movementTrack2 ~= nil then
            movementTrack2:Destroy();
        end;

        p93.movementTrack = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.HOVER_BOARD_IDLE));

        if p93.animationModel then
            local boardMovementTrack = p93.boardMovementTrack;

            if boardMovementTrack ~= nil then
                boardMovementTrack:Stop();
            end;

            local boardMovementTrack2 = p93.boardMovementTrack;

            if boardMovementTrack2 ~= nil then
                boardMovementTrack2:Destroy();
            end;

            p93.boardMovementTrack = AnimationUtil:playAnimation(p93.animationModel, GameAnimationUtil:getAssetId(AnimationType.HOVERBOARD_IDLE));
        end;
    else
        p93.moving = true;
        local movementTrack = p93.movementTrack;

        if movementTrack ~= nil then
            movementTrack:Stop();
        end;

        local movementTrack2 = p93.movementTrack;

        if movementTrack2 ~= nil then
            movementTrack2:Destroy();
        end;

        p93.movementTrack = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.HOVER_BOARD_MOVE));

        if p93.animationModel then
            local boardMovementTrack = p93.boardMovementTrack;

            if boardMovementTrack ~= nil then
                boardMovementTrack:Stop();
            end;

            local boardMovementTrack2 = p93.boardMovementTrack;

            if boardMovementTrack2 ~= nil then
                boardMovementTrack2:Destroy();
            end;

            p93.boardMovementTrack = AnimationUtil:playAnimation(p93.animationModel, GameAnimationUtil:getAssetId(AnimationType.HOVERBOARD_MOVEMENT));
        end;
    end;
end;

u15.Tag = "VipHoverboard";

return u15;