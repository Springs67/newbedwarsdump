-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ActionButton = v1.ActionButton;
local AnimationUtil = v1.AnimationUtil;
local GamepadAction = v1.GamepadAction;
local MathExtras = v1.MathExtras;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "promise-character").default;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local SoundService = v5.SoundService;
local Workspace = v5.Workspace;
local VignetteType = RuntimeLib.import(script, script.Parent.Parent.Parent, "controllers", "global", "effect", "vignette", "vignette-meta").VignetteType;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "draw");
local getPlayerKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getPlayerKitSkin;
local PartFollowUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "part-follow-util").PartFollowUtil;
local u7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid");
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u8 = PlaceUtil.isLobbyServer() and 60 or 340;
local u9 = { CFrame.new(-2, 0, 0), CFrame.new(0, 0, 0), CFrame.new(2, 0, 0) };

local function getClosestAngle(p10, p11) -- Line: 47
    return (p11 - p10 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793 + p10;
end;

local function map(p12, p13, p14, p15, p16) -- Line: 51
    return p15 + (p16 - p15) * ((p12 - p13) / (p14 - p13));
end;

local function easeOutCubic(p17) -- Line: 54
    return 1 - math.pow(1 - p17, 3);
end;

local u18 = setmetatable({}, {
    __tostring = function() -- Line: 60, Name: __tostring
        return "SnowboardComponent";
    end
});
u18.__index = u18;

function u18.new(...) -- Line: 65
    -- upvalues: u18 (ref)
    local v19 = setmetatable({}, u18);

    return v19:constructor(...) or v19;
end;

function u18.constructor(u20, p21) -- Line: 69
    -- upvalues: u7 (copy), u6 (copy), u9 (copy), u2 (copy), default (copy), Players (copy), getPlayerKitSkin (copy), default2 (copy), Workspace (copy), EntityUtil (copy), PartFollowUtil (copy), KnitClient (copy), ReplicatedStorage (copy), WeldUtil (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), u3 (copy), GameSound (copy), SoundService (copy), Flamework (copy), u4 (copy), ActionButton (copy), GamepadAction (copy)
    u20.hoverboard = p21;
    u20.pitchPid = u7.new(-5, 5, 0.075, 0, 0);
    u20.yawPid = u7.new(-15, 15, 0.04, 0, 0);
    u20.rollPid = u7.new(-10, 10, 0.1, 0, 0);
    u20.counterDriftPid = u7.new(-10000, 10000, 2500, 1, 1);
    u20.levitationPid = u7.new(-300000, 300000, 16000, 750, 0);
    u20.movePid = u7.new(-4500, 4500, 100, 10, 0);
    u20.lastJumpTimestamp = 0;

    local function _() -- Line: 78
        -- upvalues: u6 (ref)
        return u6.ray(Ray.new());
    end;

    local v22 = table.create(#u9);

    for i, _ in u9 do
        local _ = i - 1;
        v22[i] = u6.ray(Ray.new());
    end;

    u20.debugRays = v22;
    u20.moving = false;
    u20.isGoingFast = false;
    u20.maid = u2.new();
    default.Debug("Got new hoverboard at {@Location}", p21);
    u20.player = Players:GetPlayerByUserId(p21:GetAttribute("OwnerUserId"));

    if not u20.player then
        default.Warn("Snowboard has no valid owner, not running snowboard component");

        return nil;
    end;

    local v23;

    if getPlayerKitSkin(u20.player) ~= nil then
        v23 = u20.player.Character;
    else
        v23 = default2(u20.player.Character):expect();
    end;

    u20.character = v23;

    if not p21:IsDescendantOf(Workspace) then
        return nil;
    end;

    if not u20.character then
        default.Warn("Player {@Player} has no valid R15 character, not running snowboard component", u20.player);

        return nil;
    end;

    u20.humanoid = u20.character.Humanoid;

    if not u20.humanoid then
        default.Warn("Player {@Player} has no valid Humanoid, not running snowboard component", u20.player);

        return nil;
    end;

    u20.character.Archivable = true;
    u20.characterClone = u20.character:Clone();
    u20.character.Archivable = false;
    u20.characterClone:AddTag("SnowboardClone");
    u20.characterClone.HumanoidRootPart.Anchored = true;
    local v24 = u20.characterClone:FindFirstChild(p21.Name);

    if v24 then
        v24:Destroy();
    end;

    local _DamageHighlight_ = u20.characterClone:FindFirstChild("_DamageHighlight_");

    if _DamageHighlight_ then
        _DamageHighlight_:Destroy();
    end;

    local u25 = EntityUtil:getEntity(u20.character);

    if u25 and u25 ~= nil then
        u25:hideNametag();
    end;

    u20.maid:GiveTask(function() -- Line: 135
        -- upvalues: u25 (copy)
        if u25 then
            u25:showNametag();
        end;
    end);
    u20.characterClone.Parent = Workspace;
    u20.maid:GiveTask(PartFollowUtil.startFollowing(u20.characterClone.HumanoidRootPart, u20.character.HumanoidRootPart, Vector3.new(0, -3.3, 0), true, false, Vector3.new(0, 180, 0)));
    local u26 = {
        transparency = 1
    };
    KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(u20.character):addModifier(u26);
    u20.maid:GiveTask(function() -- Line: 150
        -- upvalues: KnitClient (ref), u20 (copy), u26 (copy)
        KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(u20.character):removeModifier(u26);
    end);
    local v27 = p21:GetAttribute("SnowboardName");
    local v28 = ReplicatedStorage.Assets.Misc.Snowboards:FindFirstChild(v27):Clone();
    v28.Name = "VisibleSnowboard";

    local function _(p29) -- Line: 161
        if p29:IsA("BasePart") then
            p29.CanCollide = false;
        end;
    end;

    for i, descendant in v28:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CanCollide = false;
        end;
    end;

    v28:PivotTo(p21.CFrame * (CFrame.new(0, -3, 0) * CFrame.Angles(0, 1.5707963267948966, 0)));
    v28.Parent = Workspace;
    WeldUtil:weldParts(v28.PrimaryPart, p21);
    local u30 = ReplicatedStorage.Assets.Effects.SnowboardParticle:Clone();
    u30:PivotTo(v28:GetPivot() * CFrame.new(0, 0, 3));
    u30.Parent = Workspace;
    WeldUtil:weldParts(u30, v28.PrimaryPart);
    u20.maid:GiveTask(function() -- Line: 186
        -- upvalues: u30 (copy)
        u30:Destroy();
    end);
    u20.snowParticleEmitter = u30.Pivot.ParticleEmitter;
    u20.movementTrack = AnimationUtil:playAnimation(u20.characterClone, GameAnimationUtil:getAssetId(AnimationType.HOVER_BOARD_IDLE), {
        looped = true
    });

    if not u20:isOwner() then
        return nil;
    end;

    default.Debug("Hoverboard belongs to local player");
    KnitClient.Controllers.CameraController:registerCameraSubject("snowboard-component", 1, u20.characterClone:FindFirstChild("Humanoid"));
    u20.maid:GiveTask(function() -- Line: 200
        -- upvalues: u20 (copy), KnitClient (ref)
        if u20:isOwner() then
            KnitClient.Controllers.CameraController:deregisterCameraSubject("snowboard-component");
        end;
    end);
    u20.character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
    local v31 = u3("Attachment", {
        Parent = p21
    });
    u20.angularVelocity = u3("AngularVelocity", {
        MaxTorque = (1 / 0),
        RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
        Attachment0 = v31,
        Parent = p21
    });
    u20.worldSpaceForce = u3("VectorForce", {
        Name = "WorldSpaceForce",
        ApplyAtCenterOfMass = true,
        RelativeTo = Enum.ActuatorRelativeTo.World,
        Attachment0 = v31,
        Parent = p21
    });
    u20.localSpaceForce = u3("VectorForce", {
        Name = "LocalSpaceForce",
        ApplyAtCenterOfMass = true,
        RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
        Attachment0 = v31,
        Parent = p21
    });
    u20.levitationPid:Debug("LevitationPID", Workspace);
    u20.counterDriftPid:Debug("CounterDriftPID", Workspace);
    u20.pitchPid:Debug("PitchPID", Workspace);
    u20.rollPid:Debug("RollPID", Workspace);
    u20.movePid:Debug("MovePID", Workspace);
    u20.yawPid:Debug("YawPID", Workspace);
    local v32 = RaycastParams.new();
    v32.FilterDescendantsInstances = { Workspace:FindFirstChild("Map"), Workspace:FindFirstChild("Lobby"), Workspace.Terrain };
    v32.FilterType = Enum.RaycastFilterType.Whitelist;
    u20.raycastParams = v32;
    u20.hoverSound = u3("Sound", {
        Name = "SnowboardSound",
        Looped = true,
        Playing = true,
        Volume = 0.5,
        SoundId = GameSound.SNOWBOARD_LOOP,
        Parent = SoundService
    });
    local v33 = p21:GetAttribute("DisableDismount");

    if v33 == nil then
        v33 = false;
    end;

    if not v33 then
        u20.actionButtonMaid = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(ActionButton, {
            actionName = "SnowboardDismount",
            text = "Dismount Snowboard",
            interactionKey = Enum.KeyCode.X,
            gamepadInteractionKey = GamepadAction.CloseMenu,

            onActivated = function() -- Line: 272, Name: onActivated
                -- upvalues: u20 (copy)
                u20:dismountSnowboard();
            end
        }));
    end;
end;

function u18.SteppedUpdate(u34, p35) -- Line: 316
    -- upvalues: MathExtras (copy), Workspace (copy), u9 (copy), u8 (copy), KnitClient (copy), VignetteType (copy)
    if u34.snowParticleEmitter then
        if u34.hoverboard.AssemblyAngularVelocity.Magnitude < 1 then
            u34.snowParticleEmitter.Rate = 0;
        else
            local v36 = MathExtras:rangeMap(u34.hoverboard.AssemblyLinearVelocity.Magnitude, { 0, 50 }, { 50, 200 });
            local v37 = math.clamp(v36, 50, 200);
            u34.snowParticleEmitter.Rate = v37;
        end;
    end;

    if not (u34:isOwner() and u34.humanoid) then
        return nil;
    end;

    local CFrame2 = u34.hoverboard.CFrame;
    local Position = CFrame2.Position;
    local v38 = CFrame2:VectorToObjectSpace(u34.hoverboard.AssemblyLinearVelocity);
    local v39, _, v40 = CFrame2:ToOrientation();
    local MoveDirection = u34.humanoid.MoveDirection;
    local v41 = -CFrame2:VectorToObjectSpace(MoveDirection).X;
    local LookVector = CFrame2.LookVector;
    local v42 = math.atan2(LookVector.Z, LookVector.X) + 1.5707963267948966;
    local v43 = u34.hoverboard.AssemblyLinearVelocity * Vector3.new(1, 0, 1);
    local X = CFrame2:VectorToObjectSpace(v43).X;
    local v44 = -math.sign(X);
    local v45 = v43.Magnitude * v44;
    local v46 = (os.clock() - 0) / 0.5;
    local v47 = math.sin(v46) * 0.1 + 0 + 5;
    local u48 = Vector3.new(0, -v47, 0);

    local function _(p49, p50) -- Line: 353
        -- upvalues: CFrame2 (copy), Workspace (ref), u48 (copy), u34 (copy)
        local v51 = Workspace:Raycast((CFrame2 * p49).Position, u48, u34.raycastParams);

        if v51 then
            return v51.Position.Y;
        end;

        return nil;
    end;

    local v52 = {};
    local v53 = 0;
    local v54 = true;
    local v55 = 0;

    for i, v in u9 do
        local _ = i - 1;
        local v56 = Workspace:Raycast((CFrame2 * v).Position, u48, u34.raycastParams);
        local v57;

        if v56 then
            v57 = v56.Position.Y;
        else
            v57 = nil;
        end;

        if v57 ~= nil then
            v53 = v53 + 1;
            v52[v53] = v57;
        end;
    end;

    if #v52 > 0 then
        local function _(p58, p59) -- Line: 381
            if p59 < p58 then
                return p58;
            end;

            return p59;
        end;

        if #v52 == 0 then
            error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.");
        end;

        local v60 = v52[1];

        for i = 2, #v52 do
            local v61 = v52[i];
            local _ = i - 1;

            if v61 >= v60 then
                v60 = v61;
            end;
        end;

        v55 = u34.levitationPid:Calculate(p35, v60 + v47, Position.Y);
        local v62 = 1 - math.pow(1 - (1 - (0 + 1 * ((0.4 + 0.4 * ((Position.Y - v60 - 0) / (v47 - 0)) + (1 - (0.25 + 0.55 * ((v45 - 0) / (u8 - 0)))) - 0.65) / 0.9500000000000001))), 3);

        if u34.hoverSound then
            u34.hoverSound.PlaybackSpeed = v62;
        end;
    else
        v54 = false;
    end;

    local v63 = u34.counterDriftPid:Calculate(p35, 0, v38.Z);
    local v64 = u34.pitchPid:Calculate(p35, 15 * v41, (math.deg(v40)));
    local v65 = CFrame2:VectorToObjectSpace(MoveDirection) * Vector3.new(1, 0, 1);
    local v66 = math.atan2(v65.Z, -v65.X);
    local v67 = MoveDirection.Magnitude > 0.05;
    local v68;

    if v67 then
        local v69 = math.deg((v42 + v66 - v42 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793 + v42);
        v68 = u34.yawPid:Calculate(p35, v69, (math.deg(v42)));
    else
        v68 = 0;
    end;

    u34.rollPid:Calculate(p35, 25 * (not v67 and 0 or -1 + 2 * ((v66 - -3.141592653589793) / 6.283185307179586)), (math.deg(v39)));
    local v70 = -u8 * 0.9;
    local v71 = u34.movePid:Calculate(p35, v70 + (u8 - v70) * ((v41 - -0.9) / 1.9), v45);
    local v72 = 0 + 0.5 * ((math.abs(v45) - 0) / (u8 - 0));

    if u34.windSound then
        u34.windSound.Volume = v72;
    end;

    local Jump = u34.humanoid.Jump;
    local v73;

    if os.clock() - u34.lastJumpTimestamp >= 0.5 then
        v73 = Jump and v54;
    else
        v73 = false;
    end;

    if v73 then
        u34.hoverboard:ApplyImpulse(Vector3.new(0, 3250, 0));
        u34.lastJumpTimestamp = os.clock();
    end;

    u34.worldSpaceForce.Force = Vector3.new(0, v55, 0);
    u34.localSpaceForce.Force = Vector3.new(-v71, 0, v63);
    u34.angularVelocity.AngularVelocity = Vector3.new(0, v68, v64);

    if u34.hoverboard.AssemblyLinearVelocity.Magnitude <= 50 or u34.isGoingFast then
        if u34.hoverboard.AssemblyLinearVelocity.Magnitude <= 50 and u34.isGoingFast then
            u34.isGoingFast = false;
            KnitClient.Controllers.VignetteController:destroyVignette(VignetteType.SPEED);
        end;

        return;
    end;

    u34.isGoingFast = true;
    KnitClient.Controllers.VignetteController:createVignette(VignetteType.SPEED);
end;

function u18.dismountSnowboard(p74) -- Line: 473
    -- upvalues: default3 (copy)
    default3.Client:Get("DismountSnowboard"):SendToServer();
end;

function u18.Destroy(p75) -- Line: 476
    -- upvalues: KnitClient (copy), VignetteType (copy), default (copy)
    local maid = p75.maid;

    if maid ~= nil then
        maid:DoCleaning();
    end;

    if p75.characterClone then
        p75.characterClone:Destroy();
    end;

    if p75.hoverSound then
        p75.hoverSound:Destroy();
    end;

    if p75.windSound then
        p75.windSound:Destroy();
    end;

    local actionButtonMaid = p75.actionButtonMaid;

    if actionButtonMaid ~= nil then
        actionButtonMaid:DoCleaning();
    end;

    if not p75:isOwner() then
        return nil;
    end;

    KnitClient.Controllers.VignetteController:destroyVignette(VignetteType.SPEED);
    default.Debug("Local hoverboard destroyed");
    local character = p75.character;

    if character ~= nil then
        character = character.HumanoidRootPart;
    end;

    if character then
        p75.character.HumanoidRootPart.Anchored = false;
    end;

    local humanoid = p75.humanoid;

    if humanoid ~= nil then
        humanoid:ChangeState(Enum.HumanoidStateType.Running);
    end;
end;

function u18.isOwner(p76) -- Line: 512
    -- upvalues: Players (copy)
    return p76.player == Players.LocalPlayer;
end;

u18.Tag = "Snowboard";

return u18;