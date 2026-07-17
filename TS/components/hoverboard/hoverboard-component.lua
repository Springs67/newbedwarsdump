-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ActionButton = v1.ActionButton;
local GamepadAction = v1.GamepadAction;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "promise-character").default;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local SoundService = v4.SoundService;
local Workspace = v4.Workspace;
local default3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "draw");
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid");
local LocalPlayer = Players.LocalPlayer;
local u7 = { CFrame.new(-2, 0, 0), CFrame.new(0, 0, 0), CFrame.new(2, 0, 0) };

local function getClosestAngle(p8, p9) -- Line: 29
    return (p9 - p8 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793 + p8;
end;

local function map(p10, p11, p12, p13, p14) -- Line: 33
    return p13 + (p14 - p13) * ((p10 - p11) / (p12 - p11));
end;

local function easeOutCubic(p15) -- Line: 36
    return 1 - math.pow(1 - p15, 3);
end;

local u16 = setmetatable({}, {
    __tostring = function() -- Line: 42, Name: __tostring
        return "HoverboardComponent";
    end
});
u16.__index = u16;

function u16.new(...) -- Line: 47
    -- upvalues: u16 (ref)
    local v17 = setmetatable({}, u16);

    return v17:constructor(...) or v17;
end;

function u16.constructor(u18, p19) -- Line: 51
    -- upvalues: u6 (copy), u5 (copy), u7 (copy), default (copy), default2 (copy), LocalPlayer (copy), u2 (copy), Workspace (copy), SoundService (copy), Flamework (copy), u3 (copy), ActionButton (copy), GamepadAction (copy)
    u18.hoverboard = p19;
    u18.pitchPid = u6.new(-5, 5, 0.075, 0, 0);
    u18.yawPid = u6.new(-15, 15, 0.04, 0, 0);
    u18.rollPid = u6.new(-10, 10, 0.1, 0, 0);
    u18.counterDriftPid = u6.new(-10000, 10000, 2500, 1, 1);
    u18.levitationPid = u6.new(-300000, 300000, 16000, 750, 0);
    u18.movePid = u6.new(-4500, 4500, 100, 10, 0);
    u18.lastJumpTimestamp = 0;

    local function _() -- Line: 60
        -- upvalues: u5 (ref)
        return u5.ray(Ray.new());
    end;

    local v20 = table.create(#u7);

    for i, _ in u7 do
        local _ = i - 1;
        v20[i] = u5.ray(Ray.new());
    end;

    u18.debugRays = v20;
    default.Debug("Got new hoverboard at {@Location}", p19);
    u18.character = default2(LocalPlayer.Character):expect();

    if not u18:isOwn() then
        return nil;
    end;

    default.Debug("Hoverboard belongs to local player");
    u18.character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
    local v21 = u2("Attachment", {
        Parent = p19
    });
    u18.angularVelocity = u2("AngularVelocity", {
        MaxTorque = (1 / 0),
        RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
        Attachment0 = v21,
        Parent = p19
    });
    u18.worldSpaceForce = u2("VectorForce", {
        Name = "WorldSpaceForce",
        ApplyAtCenterOfMass = true,
        RelativeTo = Enum.ActuatorRelativeTo.World,
        Attachment0 = v21,
        Parent = p19
    });
    u18.localSpaceForce = u2("VectorForce", {
        Name = "LocalSpaceForce",
        ApplyAtCenterOfMass = true,
        RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
        Attachment0 = v21,
        Parent = p19
    });
    u18.levitationPid:Debug("LevitationPID", Workspace);
    u18.counterDriftPid:Debug("CounterDriftPID", Workspace);
    u18.pitchPid:Debug("PitchPID", Workspace);
    u18.rollPid:Debug("RollPID", Workspace);
    u18.movePid:Debug("MovePID", Workspace);
    u18.yawPid:Debug("YawPID", Workspace);
    local v22 = RaycastParams.new();
    v22.FilterDescendantsInstances = { Workspace:FindFirstChild("Map"), Workspace:FindFirstChild("Lobby"), Workspace.Terrain };
    v22.FilterType = Enum.RaycastFilterType.Whitelist;
    u18.raycastParams = v22;
    u18.hoverSound = u2("Sound", {
        Name = "HoverSound",
        Looped = true,
        Playing = true,
        Volume = 1,
        SoundId = "rbxassetid://" .. tostring(7910584261),
        Parent = SoundService
    });
    u18.windSound = u2("Sound", {
        Name = "WindSound",
        Looped = true,
        Playing = true,
        Volume = 0.25,
        SoundId = "rbxassetid://" .. tostring(7910583431),
        Parent = SoundService
    });
    u18.actionButtonMaid = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u3.createElement(ActionButton, {
        actionName = "HoverboardDismount",
        text = "Dismount Hoverboard",
        interactionKey = Enum.KeyCode.X,
        gamepadInteractionKey = GamepadAction.CloseMenu,

        onActivated = function() -- Line: 138, Name: onActivated
            -- upvalues: u18 (copy)
            u18:dismountHoverboard();
        end
    }));
end;

function u16.SteppedUpdate(u23, p24) -- Line: 144
    -- upvalues: Workspace (copy), u7 (copy)
    if not u23:isOwn() then
        return nil;
    end;

    local CFrame2 = u23.hoverboard.CFrame;
    local Position = CFrame2.Position;
    local v25 = CFrame2:VectorToObjectSpace(u23.hoverboard.AssemblyLinearVelocity);
    local v26, _, v27 = CFrame2:ToOrientation();
    local Humanoid = u23.character.Humanoid;
    local MoveDirection = Humanoid.MoveDirection;
    local v28 = -CFrame2:VectorToObjectSpace(MoveDirection).X;
    local LookVector = CFrame2.LookVector;
    local v29 = math.atan2(LookVector.Z, LookVector.X) + 1.5707963267948966;
    local v30 = u23.hoverboard.AssemblyLinearVelocity * Vector3.new(1, 0, 1);
    local X = CFrame2:VectorToObjectSpace(v30).X;
    local v31 = -math.sign(X);
    local v32 = v30.Magnitude * v31;
    local v33 = (os.clock() - 0) / 0.5;
    local v34 = math.sin(v33) * 0.1 + 0 + 5;
    local u35 = Vector3.new(0, -v34, 0);

    local function _(p36, p37) -- Line: 172
        -- upvalues: CFrame2 (copy), Workspace (ref), u35 (copy), u23 (copy)
        local v38 = Workspace:Raycast((CFrame2 * p36).Position, u35, u23.raycastParams);

        if v38 then
            return v38.Position.Y;
        end;

        return nil;
    end;

    local v39 = {};
    local v40 = 0;
    local v41 = true;
    local v42 = 0;

    for i, v in u7 do
        local _ = i - 1;
        local v43 = Workspace:Raycast((CFrame2 * v).Position, u35, u23.raycastParams);
        local v44;

        if v43 then
            v44 = v43.Position.Y;
        else
            v44 = nil;
        end;

        if v44 ~= nil then
            v40 = v40 + 1;
            v39[v40] = v44;
        end;
    end;

    if #v39 > 0 then
        local function _(p45, p46) -- Line: 200
            if p46 < p45 then
                return p45;
            end;

            return p46;
        end;

        if #v39 == 0 then
            error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.");
        end;

        local v47 = v39[1];

        for i = 2, #v39 do
            local v48 = v39[i];
            local _ = i - 1;

            if v48 >= v47 then
                v47 = v48;
            end;
        end;

        v42 = u23.levitationPid:Calculate(p24, v47 + v34, Position.Y);
        local v49 = 1 - math.pow(1 - (1 - (0 + 1 * ((0.4 + 0.4 * ((Position.Y - v47 - 0) / (v34 - 0)) + (1 - (0.25 + 0.55 * ((v32 - 0) / 40))) - 0.65) / 0.9500000000000001))), 3);
        u23.hoverSound.PlaybackSpeed = v49;
    else
        v41 = false;
    end;

    local v50 = u23.counterDriftPid:Calculate(p24, 0, v25.Z);
    local v51 = u23.pitchPid:Calculate(p24, 15 * v28, (math.deg(v27)));
    local v52 = CFrame2:VectorToObjectSpace(MoveDirection) * Vector3.new(1, 0, 1);
    local v53 = math.atan2(v52.Z, -v52.X);
    local v54 = MoveDirection.Magnitude > 0.05;
    local v55;

    if v54 then
        local v56 = math.deg((v29 + v53 - v29 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793 + v29);
        v55 = u23.yawPid:Calculate(p24, v56, (math.deg(v29)));
    else
        v55 = 0;
    end;

    local v57 = u23.rollPid:Calculate(p24, 25 * (not v54 and 0 or -1 + 2 * ((v53 - -3.141592653589793) / 6.283185307179586)), (math.deg(v26)));
    local v58 = u23.movePid:Calculate(p24, -36 + 76 * ((v28 - -0.9) / 1.9), v32);
    local v59 = 0 + 0.5 * ((math.abs(v32) - 0) / 40);
    u23.windSound.Volume = v59;
    local Jump = Humanoid.Jump;
    local v60;

    if os.clock() - u23.lastJumpTimestamp >= 0.5 then
        v60 = Jump and v41;
    else
        v60 = false;
    end;

    if v60 then
        u23.hoverboard:ApplyImpulse(Vector3.new(0, 3250, 0));
        u23.lastJumpTimestamp = os.clock();
    end;

    u23.worldSpaceForce.Force = Vector3.new(0, v42, 0);
    u23.localSpaceForce.Force = Vector3.new(-v58, 0, v50);
    u23.angularVelocity.AngularVelocity = Vector3.new(v57, v55, v51);
end;

function u16.setCharacterMassless(p61, p62) -- Line: 280
    for _, descendant in p61.character:GetDescendants() do
        if descendant ~= p61.hoverboard and descendant:IsA("BasePart") then
            descendant.Massless = p62;
        end;
    end;
end;

function u16.dismountHoverboard(p63) -- Line: 290
    -- upvalues: default3 (copy)
    default3.Client:Get("DismountHoverboard"):SendToServer();
end;

function u16.Destroy(p64) -- Line: 293
    -- upvalues: default (copy)
    if not p64:isOwn() then
        return nil;
    end;

    default.Debug("Local hoverboard destroyed");
    p64.character.HumanoidRootPart.Anchored = false;
    local character = p64.character;

    if character ~= nil then
        local Humanoid = character.Humanoid;

        if Humanoid ~= nil then
            Humanoid:ChangeState(Enum.HumanoidStateType.Running);
        end;
    end;

    p64.hoverSound:Destroy();
    p64.windSound:Destroy();
    p64.actionButtonMaid:DoCleaning();
end;

function u16.isOwn(p65) -- Line: 311
    return p65.hoverboard.Parent == p65.character;
end;

u16.Tag = "Hoverboard";

return u16;