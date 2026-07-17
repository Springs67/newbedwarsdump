-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local RunService = v4.RunService;
local SoundService = v4.SoundService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local v5 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "movement", "event", "move-mount-event");
local InputActionType = v5.InputActionType;
local MoveMountDirection = v5.MoveMountDirection;
local u6 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "player-control-module");
local FlyingBroomBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "flying-broom-balance-file").FlyingBroomBalance;
local u7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid");
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local MountFlightControls = RuntimeLib.import(script, script.Parent.Parent.Parent, "mount", "mount-flight-controls").MountFlightControls;
local VehicleClient = RuntimeLib.import(script, script.Parent.Parent, "vehicle-client").VehicleClient;
local FlyingBroomUi = RuntimeLib.import(script, script.Parent, "flying-broom-ui").FlyingBroomUi;
local FLYING_BROOM_MAX_SPEED = FlyingBroomBalance.FLYING_BROOM_MAX_SPEED;
local MAX_PITCH_TILT = FlyingBroomBalance.MAX_PITCH_TILT;
local MAX_ROLL_TILT = FlyingBroomBalance.MAX_ROLL_TILT;

local function map(p8, p9, p10, p11, p12) -- Line: 27
    return p11 + (p12 - p11) * ((p8 - p9) / (p10 - p9));
end;

local u13 = setmetatable({}, {
    __tostring = function() -- Line: 34, Name: __tostring
        return "FlyingBroomPilot";
    end,

    __index = VehicleClient
});
u13.__index = u13;

function u13.new(...) -- Line: 40
    -- upvalues: u13 (ref)
    local v14 = setmetatable({}, u13);

    return v14:constructor(...) or v14;
end;

function u13.constructor(u15, u16) -- Line: 44
    -- upvalues: VehicleClient (copy), u1 (copy), u7 (copy), Workspace (copy), Players (copy), u2 (copy), SoundService (copy), RunService (copy), u6 (copy), PlaceUtil (copy), MAX_PITCH_TILT (copy), MAX_ROLL_TILT (copy), FLYING_BROOM_MAX_SPEED (copy), MountFlightControls (copy), ClientSyncEvents (copy), MoveMountDirection (copy), InputActionType (copy), u3 (copy), FlyingBroomUi (copy)
    VehicleClient.constructor(u15, u16);
    u15.maid = u1.new();
    u15.pitchPid = u7.new(-5, 5, 0.09, 0, 0.03);
    u15.yawPid = u7.new(-40, 40, 0.022, 0, 0);
    u15.rollPid = u7.new(-10, 10, 0.1, 0, 0);
    u15.counterDriftPid = u7.new(-100, 100, 35, 0, 1);
    u15.levitationPid = u7.new(-200, 400, 20, 30, 0);
    u15.movePid = u7.new(-30, 30, 4, 0.6, 0);
    u15.heightGoal = 0;
    u15.holdingUp = false;
    u15.holdingDown = false;
    u15.entryTime = Workspace:GetServerTimeNow();
    u15.enginePowerScale = 1.1;
    u15.defaultCameraMaxZoomDistance = 14;
    u15.defaultCameraMinZoomDistance = 0.5;
    u15.maid = u1.new();
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    if not Character:FindFirstChild("Humanoid") then
        return nil;
    end;

    local Root = u16:FindFirstChild("Root");

    if not Root then
        return nil;
    end;

    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera then
        u15.defaultCameraMaxZoomDistance = 14;
        u15.defaultCameraMinZoomDistance = 0;
        CurrentCamera.CameraSubject = Root;
        Players.LocalPlayer.CameraMinZoomDistance = 14;
        Players.LocalPlayer.CameraMaxZoomDistance = 32;
        u15.maid:GiveTask(function() -- Line: 80
            -- upvalues: Players (ref), CurrentCamera (copy), u15 (copy)
            local Character2 = Players.LocalPlayer.Character;

            if Character2 ~= nil then
                Character2 = Character2:FindFirstChild("Humanoid");
            end;

            CurrentCamera.CameraSubject = Character2;
            Players.LocalPlayer.CameraMinZoomDistance = u15.defaultCameraMinZoomDistance;
            Players.LocalPlayer.CameraMaxZoomDistance = u15.defaultCameraMaxZoomDistance;
        end);
    end;

    local u17 = u2("Attachment", {
        Parent = Root
    });
    u15.maid:GiveTask(function() -- Line: 94
        -- upvalues: u17 (copy)
        u17:Destroy();
    end);
    u15.angularVelocity = u2("AngularVelocity", {
        MaxTorque = (1 / 0),
        RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
        Attachment0 = u17,
        Parent = Root
    });
    u15.maid:GiveTask(function() -- Line: 103
        -- upvalues: u15 (copy)
        u15.angularVelocity:Destroy();
    end);
    u15.worldSpaceForce = u2("VectorForce", {
        Name = "WorldSpaceForce",
        ApplyAtCenterOfMass = true,
        RelativeTo = Enum.ActuatorRelativeTo.World,
        Attachment0 = u17,
        Parent = u16
    });
    u15.maid:GiveTask(function() -- Line: 113
        -- upvalues: u15 (copy)
        u15.worldSpaceForce:Destroy();
    end);
    u15.localSpaceForce = u2("VectorForce", {
        Name = "LocalSpaceForce",
        ApplyAtCenterOfMass = true,
        RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
        Attachment0 = u17,
        Parent = Root
    });
    u15.maid:GiveTask(function() -- Line: 123
        -- upvalues: u15 (copy)
        u15.localSpaceForce:Destroy();
    end);
    u15.levitationPid:Debug("LevitationPID", Workspace);
    u15.counterDriftPid:Debug("CounterDriftPID", Workspace);
    u15.pitchPid:Debug("PitchPID", Workspace);
    u15.rollPid:Debug("RollPID", Workspace);
    u15.movePid:Debug("MovePID", Workspace);
    u15.yawPid:Debug("YawPID", Workspace);
    u15.maid:GiveTask(u15.levitationPid);
    u15.maid:GiveTask(u15.counterDriftPid);
    u15.maid:GiveTask(u15.pitchPid);
    u15.maid:GiveTask(u15.rollPid);
    u15.maid:GiveTask(u15.movePid);
    u15.maid:GiveTask(u15.yawPid);
    u15.windSound = u2("Sound", {
        Name = "WindSound",
        Looped = true,
        Playing = true,
        Volume = 0.25,
        SoundId = "rbxassetid://" .. tostring(7910583431),
        Parent = SoundService
    });
    u15.heightGoal = Root.Position.Y + 10;
    u15.maid:GiveTask(RunService.Stepped:Connect(function(p18, p19) -- Line: 147
        -- upvalues: Root (copy), u6 (ref), u15 (copy), PlaceUtil (ref), MAX_PITCH_TILT (ref), MAX_ROLL_TILT (ref), FLYING_BROOM_MAX_SPEED (ref), u16 (copy), Workspace (ref)
        local CFrame2 = Root.CFrame;
        local Position = CFrame2.Position;
        local v20 = CFrame2:VectorToObjectSpace(Root.AssemblyLinearVelocity);
        local v21, _, v22 = CFrame2:ToOrientation();
        local v23 = u6:GetMoveVector();
        local LookVector = CFrame2.LookVector;
        local v24 = math.atan2(LookVector.Z, LookVector.X);
        local v25 = Root.AssemblyLinearVelocity * Vector3.new(1.5, 0, 1.5);
        local X = CFrame2:VectorToObjectSpace(v25).X;
        local v26 = -math.sign(X);
        local v27 = v25.Magnitude * v26;
        local v28 = CFrame;
        local v29 = CFrame.new(-v23.X, 0, 0);
        local v30 = v28.lookAt(Position, (CFrame2 * v29).Position);
        local v31 = os.clock();
        local v32 = math.sin(v31) * 0.3 + 0;
        local v33 = u15.holdingUp and not u15.holdingDown and 20 or (u15.holdingDown and not u15.holdingUp and -20 or 0);
        local v34;

        if PlaceUtil.isGameServer() then
            v34 = math.clamp(u15.heightGoal + v33 * p19, -50, 250);
        else
            v34 = u15.heightGoal + v33 * p19;
        end;

        u15.heightGoal = v34;
        local v35 = u15.levitationPid:Calculate(p19, u15.heightGoal + v32, Position.Y);
        local v36 = u15.counterDriftPid:Calculate(p19, 0, v20.Z);
        local v37 = u15.pitchPid:Calculate(p19, MAX_PITCH_TILT * -v23.Z, (math.deg(v22)));
        local v38 = LookVector:Dot(v30.LookVector);
        local v39 = math.acos(v38);
        local Y = LookVector:Cross(v30.LookVector).Y;
        local v40 = math.clamp(Y, -1, 1);
        local v41 = v39 * -math.round(v40);
        local v42 = v41 ~= v41 and 0 or v41;
        local v43 = v23.Magnitude > 0.05;
        local v44;

        if v43 then
            local v45 = math.deg(v24 + v42);
            local yawPid = u15.yawPid;

            if math.abs(v23.X) <= 0.1 then
                v45 = math.deg(v24);
            end;

            v44 = yawPid:Calculate(p19, v45, (math.deg(v24)));
        else
            v44 = 0;
        end;

        local v46 = u15.rollPid:Calculate(p19, MAX_ROLL_TILT * (not v43 and 0 or -1 + 2 * ((v42 - -3.141592653589793) / 6.283185307179586)), (math.deg(v21)));
        local v47 = -FLYING_BROOM_MAX_SPEED * 0.9;
        local v48 = u15.movePid:Calculate(p19, v47 + (FLYING_BROOM_MAX_SPEED - v47) * ((-v23.Z - -0.9) / 1.9), v27);
        local v49 = 0 + 0.5 * ((math.abs(v27) - 0) / (FLYING_BROOM_MAX_SPEED - 0));

        if u15.windSound then
            u15.windSound.Volume = v49;
        end;

        if u15.holdingUp and not u15.holdingDown then
            local v50 = u15;
            v50.enginePowerScale = v50.enginePowerScale + p19 * 0.96;
        elseif u15.holdingDown and not u15.holdingDown then
            local v51 = u15;
            v51.enginePowerScale = v51.enginePowerScale - p19 * 0.96;
        else
            local v52 = u15;
            v52.enginePowerScale = v52.enginePowerScale - p19 * 0.99;
        end;

        u15.enginePowerScale = math.clamp(u15.enginePowerScale, 0.95, 1);
        u15:setEnginePowerRatio(u15.enginePowerScale);

        if u16:GetAttribute("Dead") == true then
            u15.worldSpaceForce.Force = Vector3.new(0, 0, 0);
            u15.localSpaceForce.Force = Vector3.new(0, 0, 0);
            u15.angularVelocity.AngularVelocity = Vector3.new(0, 0, 0);
            u15.maid:DoCleaning();

            return;
        end;

        local AssemblyMass = Root.AssemblyMass;
        local v53 = (Workspace:GetServerTimeNow() - u15.entryTime) / 1;
        local v54 = math.clamp(v53, 1, 1);
        u15.worldSpaceForce.Force = Vector3.new(0, v35 * AssemblyMass * v54, 0);
        u15.localSpaceForce.Force = Vector3.new(-v48 * AssemblyMass, 0, v36 * AssemblyMass);
        u15.angularVelocity.AngularVelocity = Vector3.new(v46, v44 * 1.2, v37);
    end));
    local v55 = MountFlightControls.bindUpDownControls();
    u15.maid:GiveTask(v55.bindActionMaid);
    u15.maid:GiveTask(v55.shouldFlyUpRef.Changed:Connect(function(p56) -- Line: 243
        -- upvalues: u15 (copy)
        u15.holdingUp = p56;

        return u15.holdingUp;
    end));
    u15.maid:GiveTask(v55.shouldFlyDownRef.Changed:Connect(function(p57) -- Line: 247
        -- upvalues: u15 (copy)
        u15.holdingDown = p57;

        return u15.holdingDown;
    end));
    u15.maid:GiveTask(ClientSyncEvents.MoveMountButtonChange:connect(function(p58) -- Line: 251
        -- upvalues: MoveMountDirection (ref), u15 (copy), InputActionType (ref)
        local direction = p58.direction;

        if direction == MoveMountDirection.UP then
            u15.holdingUp = p58.inputActionType == InputActionType.PRESS;

            return;
        end;

        if direction == MoveMountDirection.DOWN then
            u15.holdingDown = p58.inputActionType == InputActionType.PRESS;
        end;
    end));
    local u59 = u3.mount(u3.createElement("ScreenGui", {
        ResetOnSpawn = false
    }, { u3.createElement(FlyingBroomUi, {
            vehicleModel = u16
        }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    u15.maid:GiveTask(function() -- Line: 271
        -- upvalues: u3 (ref), u59 (copy)
        u3.unmount(u59);
    end);
end;

function u13.onDisable(p60) -- Line: 275
    p60.maid:DoCleaning();
    local hoverSound = p60.hoverSound;

    if hoverSound ~= nil then
        hoverSound:Destroy();
    end;

    local windSound = p60.windSound;

    if windSound ~= nil then
        windSound:Destroy();
    end;
end;

return {
    FlyingBroomPilot = u13
};