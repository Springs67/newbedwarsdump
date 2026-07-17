-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v4.ContextActionService;
local Players = v4.Players;
local RunService = v4.RunService;
local SoundService = v4.SoundService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local v5 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "movement", "event", "move-mount-event");
local InputActionType = v5.InputActionType;
local MoveMountDirection = v5.MoveMountDirection;
local MoveMountUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "movement", "move-mount-ui").MoveMountUI;
local u6 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "player-control-module");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid");
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local v8 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "helicopter", "helicopter-missile");
local HelicopterMissile = v8.HelicopterMissile;
local MISSILE_FIRE_RATE = v8.MISSILE_FIRE_RATE;
local MountFlightControls = RuntimeLib.import(script, script.Parent.Parent.Parent, "mount", "mount-flight-controls").MountFlightControls;
local VehicleClient = RuntimeLib.import(script, script.Parent.Parent, "vehicle-client").VehicleClient;
local _ = { CFrame.new(-2, 0, 0), CFrame.new(0, 0, 0), CFrame.new(2, 0, 0) };

local function map(p9, p10, p11, p12, p13) -- Line: 36
    return p12 + (p13 - p12) * ((p9 - p10) / (p11 - p10));
end;

local u14 = setmetatable({}, {
    __tostring = function() -- Line: 43, Name: __tostring
        return "HelicopterPilotClient";
    end,

    __index = VehicleClient
});
u14.__index = u14;

function u14.new(...) -- Line: 49
    -- upvalues: u14 (ref)
    local v15 = setmetatable({}, u14);

    return v15:constructor(...) or v15;
end;

function u14.constructor(u16, u17, p18) -- Line: 53
    -- upvalues: VehicleClient (copy), u1 (copy), u7 (copy), Workspace (copy), Players (copy), u2 (copy), SoundService (copy), RunService (copy), u6 (copy), PlaceUtil (copy), MountFlightControls (copy), ClientSyncEvents (copy), MoveMountDirection (copy), InputActionType (copy), DeviceUtil (copy), KnitClient (copy), u3 (copy), MoveMountUI (copy)
    VehicleClient.constructor(u16, u17);
    u16.maid = u1.new();
    u16.pitchPid = u7.new(-5, 5, 0.04, 0, 0.03);
    u16.yawPid = u7.new(-10, 10, 0.009, 0, 0);
    u16.rollPid = u7.new(-10, 10, 0.07, 0, 0);
    u16.counterDriftPid = u7.new(-50, 50, 25, 0, 1);
    u16.levitationPid = u7.new(-400, 400, 20, 30, 0);
    u16.movePid = u7.new(-30, 30, 4, 0.5, 0);
    u16.heightGoal = 0;
    u16.holdingUp = false;
    u16.holdingDown = false;
    u16.entryTime = Workspace:GetServerTimeNow();
    u16.enginePowerScale = 0.6;
    u16.maid = u1.new();
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    if not Character:FindFirstChild("Humanoid") then
        return nil;
    end;

    local Root = u17:FindFirstChild("Root");

    if not Root then
        return nil;
    end;

    if Workspace.CurrentCamera then
        Workspace.CurrentCamera.CameraSubject = Root;
        Players.LocalPlayer.CameraMaxZoomDistance = 20;
        Players.LocalPlayer.CameraMinZoomDistance = 20;
        u16.maid:GiveTask(function() -- Line: 84
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

    local u19 = u2("Attachment", {
        Parent = Root
    });
    u16.maid:GiveTask(function() -- Line: 98
        -- upvalues: u19 (copy)
        u19:Destroy();
    end);
    u16.angularVelocity = u2("AngularVelocity", {
        MaxTorque = (1 / 0),
        RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
        Attachment0 = u19,
        Parent = Root
    });
    u16.maid:GiveTask(function() -- Line: 107
        -- upvalues: u16 (copy)
        u16.angularVelocity:Destroy();
    end);
    u16.worldSpaceForce = u2("VectorForce", {
        Name = "WorldSpaceForce",
        ApplyAtCenterOfMass = true,
        RelativeTo = Enum.ActuatorRelativeTo.World,
        Attachment0 = u19,
        Parent = u17
    });
    u16.maid:GiveTask(function() -- Line: 117
        -- upvalues: u16 (copy)
        u16.worldSpaceForce:Destroy();
    end);
    u16.localSpaceForce = u2("VectorForce", {
        Name = "LocalSpaceForce",
        ApplyAtCenterOfMass = true,
        RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
        Attachment0 = u19,
        Parent = Root
    });
    u16.maid:GiveTask(function() -- Line: 127
        -- upvalues: u16 (copy)
        u16.localSpaceForce:Destroy();
    end);
    u16.levitationPid:Debug("LevitationPID", Workspace);
    u16.counterDriftPid:Debug("CounterDriftPID", Workspace);
    u16.pitchPid:Debug("PitchPID", Workspace);
    u16.rollPid:Debug("RollPID", Workspace);
    u16.movePid:Debug("MovePID", Workspace);
    u16.yawPid:Debug("YawPID", Workspace);
    u16.maid:GiveTask(u16.levitationPid);
    u16.maid:GiveTask(u16.counterDriftPid);
    u16.maid:GiveTask(u16.pitchPid);
    u16.maid:GiveTask(u16.rollPid);
    u16.maid:GiveTask(u16.movePid);
    u16.maid:GiveTask(u16.yawPid);
    u16.windSound = u2("Sound", {
        Name = "WindSound",
        Looped = true,
        Playing = true,
        Volume = 0.25,
        SoundId = "rbxassetid://" .. tostring(7910583431),
        Parent = SoundService
    });
    u16.heightGoal = Root.Position.Y;
    u16.maid:GiveTask(RunService.Stepped:Connect(function(p20, p21) -- Line: 151
        -- upvalues: Root (copy), u6 (ref), u16 (copy), PlaceUtil (ref), u17 (copy), Workspace (ref)
        local CFrame2 = Root.CFrame;
        local Position = CFrame2.Position;
        local v22 = CFrame2:VectorToObjectSpace(Root.AssemblyLinearVelocity);
        local v23, _, v24 = CFrame2:ToOrientation();
        local v25 = u6:GetMoveVector();
        local LookVector = CFrame2.LookVector;
        local v26 = math.atan2(LookVector.Z, LookVector.X);
        local v27 = Root.AssemblyLinearVelocity * Vector3.new(1, 0, 1);
        local X = CFrame2:VectorToObjectSpace(v27).X;
        local v28 = -math.sign(X);
        local v29 = v27.Magnitude * v28;
        local v30 = CFrame;
        local v31 = CFrame.new(-v25.X, 0, 0);
        local v32 = v30.lookAt(Position, (CFrame2 * v31).Position);
        local v33 = os.clock();
        local v34 = math.sin(v33) * 0.7 + 0;
        local v35 = u16.holdingUp and not u16.holdingDown and 10 or (u16.holdingDown and not u16.holdingUp and -9 or 0);
        local v36;

        if PlaceUtil.isGameServer() then
            v36 = math.clamp(u16.heightGoal + v35 * p21, -50, 200);
        else
            v36 = u16.heightGoal + v35 * p21;
        end;

        u16.heightGoal = v36;
        local v37 = u16.levitationPid:Calculate(p21, u16.heightGoal + v34, Position.Y);
        local v38 = u16.counterDriftPid:Calculate(p21, 0, v22.Z);
        local v39 = u16.pitchPid:Calculate(p21, 15 * -v25.Z, (math.deg(v24)));
        local v40 = LookVector:Dot(v32.LookVector);
        local v41 = math.acos(v40);
        local Y = LookVector:Cross(v32.LookVector).Y;
        local v42 = math.clamp(Y, -1, 1);
        local v43 = v41 * -math.round(v42);
        local v44 = v43 ~= v43 and 0 or v43;
        local v45 = v25.Magnitude > 0.05;
        local v46;

        if v45 then
            local v47 = math.deg(v26 + v44);
            local yawPid = u16.yawPid;

            if math.abs(v25.X) <= 0.1 then
                v47 = math.deg(v26);
            end;

            v46 = yawPid:Calculate(p21, v47, (math.deg(v26)));
        else
            v46 = 0;
        end;

        local v48 = u16.rollPid:Calculate(p21, 25 * (not v45 and 0 or -1 + 2 * ((v44 - -3.141592653589793) / 6.283185307179586)), (math.deg(v23)));
        local v49 = u16.movePid:Calculate(p21, -36 + 76 * ((-v25.Z - -0.9) / 1.9), v29);
        local v50 = 0 + 0.5 * ((math.abs(v29) - 0) / 40);

        if u16.windSound then
            u16.windSound.Volume = v50;
        end;

        if u16.holdingUp and not u16.holdingDown then
            local v51 = u16;
            v51.enginePowerScale = v51.enginePowerScale + p21 * 0.4;
        elseif u16.holdingDown and not u16.holdingDown then
            local v52 = u16;
            v52.enginePowerScale = v52.enginePowerScale - p21 * 0.3;
        else
            local v53 = u16;
            v53.enginePowerScale = v53.enginePowerScale - p21 * 0.3;
        end;

        u16.enginePowerScale = math.clamp(u16.enginePowerScale, 0.6, 1);
        u16:setEnginePowerRatio(u16.enginePowerScale);

        if u17:GetAttribute("Dead") == true then
            u16.worldSpaceForce.Force = Vector3.new(0, 0, 0);
            u16.localSpaceForce.Force = Vector3.new(0, 0, 0);
            u16.angularVelocity.AngularVelocity = Vector3.new(0, 0, 0);

            return;
        end;

        local AssemblyMass = Root.AssemblyMass;
        local v54 = (Workspace:GetServerTimeNow() - u16.entryTime) / 1;
        local v55 = math.clamp(v54, 0, 1);
        u16.worldSpaceForce.Force = Vector3.new(0, v37 * AssemblyMass * v55, 0);
        u16.localSpaceForce.Force = Vector3.new(-v49 * AssemblyMass, 0, v38 * AssemblyMass);
        u16.angularVelocity.AngularVelocity = Vector3.new(v48, v46, v39);
    end));
    local v56 = MountFlightControls.bindUpDownControls();
    u16.maid:GiveTask(v56.bindActionMaid);
    u16.maid:GiveTask(v56.shouldFlyUpRef.Changed:Connect(function(p57) -- Line: 246
        -- upvalues: u16 (copy)
        u16.holdingUp = p57;

        return u16.holdingUp;
    end));
    u16.maid:GiveTask(v56.shouldFlyDownRef.Changed:Connect(function(p58) -- Line: 250
        -- upvalues: u16 (copy)
        u16.holdingDown = p58;

        return u16.holdingDown;
    end));
    u16.maid:GiveTask(ClientSyncEvents.MoveMountButtonChange:connect(function(p59) -- Line: 254
        -- upvalues: MoveMountDirection (ref), u16 (copy), InputActionType (ref)
        local direction = p59.direction;

        if direction == MoveMountDirection.UP then
            u16.holdingUp = p59.inputActionType == InputActionType.PRESS;

            return;
        end;

        if direction == MoveMountDirection.DOWN then
            u16.holdingDown = p59.inputActionType == InputActionType.PRESS;
        end;
    end));

    if DeviceUtil.isMobileControls() then
        KnitClient.Controllers.MobileUiController:toggleMountMovementControls(true);
        u16.maid:GiveTask(function() -- Line: 269
            -- upvalues: KnitClient (ref)
            return KnitClient.Controllers.MobileUiController:toggleMountMovementControls(false);
        end);
    else
        local u60 = u3.mount(u3.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u3.createElement(MoveMountUI) }), Players.LocalPlayer:WaitForChild("PlayerGui"));
        u16.maid:GiveTask(function() -- Line: 278
            -- upvalues: u3 (ref), u60 (copy)
            u3.unmount(u60);
        end);
    end;

    if p18 then
        u16:setupAttackHeli(u17, Root);
    end;
end;

function u14.setupAttackHeli(p61, u62, u63) -- Line: 286
    -- upvalues: HelicopterMissile (copy), Players (copy), default (copy), MISSILE_FIRE_RATE (copy), Flamework (copy), RunService (copy), ClientSyncEvents (copy), SyncEventPriority (copy), ContextActionService (copy)
    local u64 = nil;
    local u65 = 0;
    local u66 = Random.new();

    local function u72() -- Line: 290
        -- upvalues: u66 (copy), u63 (copy), HelicopterMissile (ref), Players (ref), default (ref)
        local v67 = u66:NextNumber() < 0.5 and -1 or 1;
        local v68 = u66:NextNumber(2.5, 6) * v67;
        local CFrame2 = u63.CFrame;
        local v69 = CFrame.Angles(0, 1.5707963267948966, 0);
        local v70 = CFrame.new(v68, -3, -2);
        local v71 = CFrame2 * v69 * v70;
        local Position = v71.Position;
        local LookVector = v71.LookVector;
        HelicopterMissile.new(Position, LookVector, Players.LocalPlayer):fire(0, function() -- Line: 300
        end);
        default.Client:GetNamespace("Helicopter"):Get("FireMissile"):SendToServer(Position, LookVector);
    end;

    local function u74() -- Line: 303
        -- upvalues: u65 (ref), MISSILE_FIRE_RATE (ref), u62 (copy), u72 (copy)
        local v73 = time();

        if v73 - u65 < MISSILE_FIRE_RATE then
            return nil;
        end;

        if u62:GetAttribute("Dead") or u62:GetAttribute("AttackEnergy") <= 0 then
            return nil;
        end;

        u65 = v73;
        u72();
    end;

    local v78 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "helicopter-attack",

        boundFunction = function(p75, p76, p77) -- Line: 318, Name: boundFunction
            -- upvalues: u64 (ref), RunService (ref), u74 (copy)
            if p76 == Enum.UserInputState.Begin then
                if not u64 then
                    u64 = RunService.Heartbeat:Connect(u74);
                end;
            elseif p76 == Enum.UserInputState.End and u64 then
                u64:Disconnect();
                u64 = nil;
            end;
        end,

        priority = Enum.ContextActionPriority.High.Value
    });
    p61.maid:GiveTask(v78);
    p61.maid:GiveTask(ClientSyncEvents.MobileSwordButtonPressed:setPriority(SyncEventPriority.HIGH):connect(function(p79) -- Line: 333
        -- upvalues: u64 (ref), RunService (ref), u74 (copy)
        p79:setCancelled(true);

        if p79.state == "down" then
            if not u64 then
                u64 = RunService.Heartbeat:Connect(u74);
            end;
        elseif u64 then
            u64:Disconnect();
            u64 = nil;
        end;
    end));
    p61.maid:GiveTask(function() -- Line: 346
        -- upvalues: ContextActionService (ref), u64 (ref)
        ContextActionService:UnbindAction("helicopter-attack");

        if u64 then
            u64:Disconnect();
        end;
    end);
end;

function u14.onDisable(p80) -- Line: 353
    p80.maid:DoCleaning();
    local hoverSound = p80.hoverSound;

    if hoverSound ~= nil then
        hoverSound:Destroy();
    end;

    local windSound = p80.windSound;

    if windSound ~= nil then
        windSound:Destroy();
    end;
end;

return {
    HelicopterPilotClient = u14
};