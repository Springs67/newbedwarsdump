-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local MathExtras = v1.MathExtras;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local RunService = v5.RunService;
local SoundService = v5.SoundService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local v6 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "movement", "event", "move-mount-event");
local InputActionType = v6.InputActionType;
local MoveMountDirection = v6.MoveMountDirection;
local MoveMountUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "movement", "move-mount-ui").MoveMountUI;
local u7 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "player-control-module");
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u8 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid");
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local MountFlightControls = RuntimeLib.import(script, script.Parent.Parent.Parent, "mount", "mount-flight-controls").MountFlightControls;
local VehicleClient = RuntimeLib.import(script, script.Parent.Parent, "vehicle-client").VehicleClient;
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 34, Name: __tostring
        return "SleighPilot";
    end,

    __index = VehicleClient
});
u9.__index = u9;

function u9.new(...) -- Line: 40
    -- upvalues: u9 (ref)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(u11, u12) -- Line: 44
    -- upvalues: VehicleClient (copy), u2 (copy), u8 (copy), Workspace (copy), Players (copy), u3 (copy), SoundService (copy), GameSound (copy), RunService (copy), u7 (copy), PlaceUtil (copy), MathExtras (copy), MountFlightControls (copy), ClientSyncEvents (copy), MoveMountDirection (copy), InputActionType (copy), DeviceUtil (copy), KnitClient (copy), u4 (copy), MoveMountUI (copy)
    VehicleClient.constructor(u11, u12);
    u11.maid = u2.new();
    u11.pitchPid = u8.new(-5, 5, 0.04, 0, 0.03);
    u11.yawPid = u8.new(-10, 10, 0.009, 0, 0);
    u11.rollPid = u8.new(-10, 10, 0.07, 0, 0);
    u11.counterDriftPid = u8.new(-50, 50, 25, 0, 1);
    u11.levitationPid = u8.new(-400, 400, 20, 30, 0);
    u11.movePid = u8.new(-30, 30, 4, 0.5, 0);
    u11.heightGoal = 0;
    u11.holdingUp = false;
    u11.holdingDown = false;
    u11.entryTime = Workspace:GetServerTimeNow();
    u11.enginePowerScale = 0.6;
    u11.maid = u2.new();
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    if not Character:FindFirstChild("Humanoid") then
        return nil;
    end;

    local Root = u12:FindFirstChild("Root");

    if not Root then
        return nil;
    end;

    if Workspace.CurrentCamera then
        Workspace.CurrentCamera.CameraSubject = Root;
        Players.LocalPlayer.CameraMaxZoomDistance = 20;
        Players.LocalPlayer.CameraMinZoomDistance = 20;
        u11.maid:GiveTask(function() -- Line: 75
            -- upvalues: Players (ref), Workspace (ref)
            Players.LocalPlayer.CameraMaxZoomDistance = 14;
            Players.LocalPlayer.CameraMinZoomDistance = 0;
            local Character2 = Players.LocalPlayer.Character;

            if Character2 ~= nil then
                Character2 = Character2:FindFirstChild("Humanoid");
            end;

            Workspace.CurrentCamera.CameraSubject = Character2;
        end);
    end;

    local u13 = u3("Attachment", {
        Parent = Root
    });
    u11.maid:GiveTask(function() -- Line: 89
        -- upvalues: u13 (copy)
        u13:Destroy();
    end);
    u11.angularVelocity = u3("AngularVelocity", {
        MaxTorque = (1 / 0),
        RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
        Attachment0 = u13,
        Parent = Root
    });
    u11.maid:GiveTask(function() -- Line: 98
        -- upvalues: u11 (copy)
        u11.angularVelocity:Destroy();
    end);
    u11.worldSpaceForce = u3("VectorForce", {
        Name = "WorldSpaceForce",
        ApplyAtCenterOfMass = true,
        RelativeTo = Enum.ActuatorRelativeTo.World,
        Attachment0 = u13,
        Parent = u12
    });
    u11.maid:GiveTask(function() -- Line: 108
        -- upvalues: u11 (copy)
        u11.worldSpaceForce:Destroy();
    end);
    u11.localSpaceForce = u3("VectorForce", {
        Name = "LocalSpaceForce",
        ApplyAtCenterOfMass = true,
        RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
        Attachment0 = u13,
        Parent = Root
    });
    u11.maid:GiveTask(function() -- Line: 118
        -- upvalues: u11 (copy)
        u11.localSpaceForce:Destroy();
    end);
    u11.levitationPid:Debug("LevitationPID", Workspace);
    u11.counterDriftPid:Debug("CounterDriftPID", Workspace);
    u11.pitchPid:Debug("PitchPID", Workspace);
    u11.rollPid:Debug("RollPID", Workspace);
    u11.movePid:Debug("MovePID", Workspace);
    u11.yawPid:Debug("YawPID", Workspace);
    u11.maid:GiveTask(u11.levitationPid);
    u11.maid:GiveTask(u11.counterDriftPid);
    u11.maid:GiveTask(u11.pitchPid);
    u11.maid:GiveTask(u11.rollPid);
    u11.maid:GiveTask(u11.movePid);
    u11.maid:GiveTask(u11.yawPid);
    u11.windSound = u3("Sound", {
        Name = "WindSound",
        Looped = true,
        Playing = true,
        Volume = 0.25,
        SoundId = "rbxassetid://" .. tostring(7910583431),
        Parent = SoundService
    });
    u11.jingleBellSound = u3("Sound", {
        Name = "JingleBellSound",
        Looped = true,
        Playing = true,
        Volume = 0.25,
        SoundId = GameSound.JINGLE_BELLS,
        Parent = SoundService
    });
    u11.heightGoal = Root.Position.Y;
    u11.maid:GiveTask(RunService.Stepped:Connect(function(p14, p15) -- Line: 150
        -- upvalues: Root (copy), u7 (ref), u11 (copy), PlaceUtil (ref), MathExtras (ref), u12 (copy), Workspace (ref)
        local CFrame2 = Root.CFrame;
        local Position = CFrame2.Position;
        local v16 = CFrame2:VectorToObjectSpace(Root.AssemblyLinearVelocity);
        local v17, _, v18 = CFrame2:ToOrientation();
        local v19 = u7:GetMoveVector();
        local LookVector = CFrame2.LookVector;
        local v20 = math.atan2(LookVector.Z, LookVector.X);
        local v21 = Root.AssemblyLinearVelocity * Vector3.new(1, 0, 1);
        local X = CFrame2:VectorToObjectSpace(v21).X;
        local v22 = -math.sign(X);
        local v23 = v21.Magnitude * v22;
        local v24 = CFrame;
        local v25 = CFrame.new(-v19.X, 0, 0);
        local v26 = v24.lookAt(Position, (CFrame2 * v25).Position);
        local v27 = os.clock();
        local v28 = math.sin(v27) * 0.7 + 0;
        local v29 = u11.holdingUp and not u11.holdingDown and 10 or (u11.holdingDown and not u11.holdingUp and -9 or 0);
        local v30;

        if PlaceUtil.isGameServer() then
            v30 = math.clamp(u11.heightGoal + v29 * p15, -50, 200);
        else
            v30 = u11.heightGoal + v29 * p15;
        end;

        u11.heightGoal = v30;
        local v31 = u11.levitationPid:Calculate(p15, u11.heightGoal + v28, Position.Y);
        local v32 = u11.counterDriftPid:Calculate(p15, 0, v16.Z);
        local v33 = u11.pitchPid:Calculate(p15, 15 * -v19.Z, (math.deg(v18)));
        local v34 = LookVector:Dot(v26.LookVector);
        local v35 = math.acos(v34);
        local Y = LookVector:Cross(v26.LookVector).Y;
        local v36 = math.clamp(Y, -1, 1);
        local v37 = v35 * -math.round(v36);
        local v38 = v37 ~= v37 and 0 or v37;
        local v39 = v19.Magnitude > 0.05;
        local v40;

        if v39 then
            local v41 = math.deg(v20 + v38);
            local yawPid = u11.yawPid;

            if math.abs(v19.X) <= 0.1 then
                v41 = math.deg(v20);
            end;

            v40 = yawPid:Calculate(p15, v41, (math.deg(v20)));
        else
            v40 = 0;
        end;

        local v42 = not v39 and 0 or MathExtras:rangeMap(v38, { -3.141592653589793, 3.141592653589793 }, { -1, 1 });
        local v43 = u11.rollPid:Calculate(p15, 25 * v42, (math.deg(v17)));
        local v44 = MathExtras:rangeMap(-v19.Z, { -0.9, 1 }, { -36, 40 });
        local v45 = u11.movePid:Calculate(p15, v44, v23);

        if u11.windSound then
            local v46 = MathExtras:rangeMap(math.abs(v23), { 0, 40 }, { 0, 0.5 });
            u11.windSound.Volume = v46;
        end;

        if u11.jingleBellSound then
            local v47 = MathExtras:rangeMap(math.abs(v23), { 0, 40 }, { 0, 0.25 });
            u11.jingleBellSound.Volume = v47;
        end;

        if u11.holdingUp and not u11.holdingDown then
            local v48 = u11;
            v48.enginePowerScale = v48.enginePowerScale + p15 * 0.4;
        elseif u11.holdingDown and not u11.holdingDown then
            local v49 = u11;
            v49.enginePowerScale = v49.enginePowerScale - p15 * 0.3;
        else
            local v50 = u11;
            v50.enginePowerScale = v50.enginePowerScale - p15 * 0.3;
        end;

        u11.enginePowerScale = math.clamp(u11.enginePowerScale, 0.6, 1);
        u11:setEnginePowerRatio(u11.enginePowerScale);

        if u12:GetAttribute("Dead") == true then
            u11.worldSpaceForce.Force = Vector3.new(0, 0, 0);
            u11.localSpaceForce.Force = Vector3.new(0, 0, 0);
            u11.angularVelocity.AngularVelocity = Vector3.new(0, 0, 0);

            return;
        end;

        local AssemblyMass = Root.AssemblyMass;
        local v51 = (Workspace:GetServerTimeNow() - u11.entryTime) / 1;
        local v52 = math.clamp(v51, 0, 1);
        u11.worldSpaceForce.Force = Vector3.new(0, v31 * AssemblyMass * v52, 0);
        u11.localSpaceForce.Force = Vector3.new(-v45 * AssemblyMass, 0, v32 * AssemblyMass);
        u11.angularVelocity.AngularVelocity = Vector3.new(v43, v40, v33);
    end));
    local v53 = MountFlightControls.bindUpDownControls();
    u11.maid:GiveTask(v53.bindActionMaid);
    u11.maid:GiveTask(v53.shouldFlyUpRef.Changed:Connect(function(p54) -- Line: 249
        -- upvalues: u11 (copy)
        u11.holdingUp = p54;

        return u11.holdingUp;
    end));
    u11.maid:GiveTask(v53.shouldFlyDownRef.Changed:Connect(function(p55) -- Line: 253
        -- upvalues: u11 (copy)
        u11.holdingDown = p55;

        return u11.holdingDown;
    end));
    u11.maid:GiveTask(ClientSyncEvents.MoveMountButtonChange:connect(function(p56) -- Line: 257
        -- upvalues: MoveMountDirection (ref), u11 (copy), InputActionType (ref)
        local direction = p56.direction;

        if direction == MoveMountDirection.UP then
            u11.holdingUp = p56.inputActionType == InputActionType.PRESS;

            return;
        end;

        if direction == MoveMountDirection.DOWN then
            u11.holdingDown = p56.inputActionType == InputActionType.PRESS;
        end;
    end));

    if DeviceUtil.isMobileControls() then
        KnitClient.Controllers.MobileUiController:toggleMountMovementControls(true);
        u11.maid:GiveTask(function() -- Line: 272
            -- upvalues: KnitClient (ref)
            return KnitClient.Controllers.MobileUiController:toggleMountMovementControls(false);
        end);

        return;
    end;

    local u57 = u4.mount(u4.createElement("ScreenGui", {
        ResetOnSpawn = false
    }, { u4.createElement(MoveMountUI) }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    u11.maid:GiveTask(function() -- Line: 281
        -- upvalues: u4 (ref), u57 (copy)
        u4.unmount(u57);
    end);
end;

function u9.onDisable(p58) -- Line: 286
    p58.maid:DoCleaning();
    local hoverSound = p58.hoverSound;

    if hoverSound ~= nil then
        hoverSound:Destroy();
    end;

    local windSound = p58.windSound;

    if windSound ~= nil then
        windSound:Destroy();
    end;

    local jingleBellSound = p58.jingleBellSound;

    if jingleBellSound ~= nil then
        jingleBellSound:Destroy();
    end;
end;

return {
    SleighPilot = u9
};