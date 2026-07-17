-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
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
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u8 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid");
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local MountFlightControls = RuntimeLib.import(script, script.Parent.Parent.Parent, "mount", "mount-flight-controls").MountFlightControls;
local VehicleClient = RuntimeLib.import(script, script.Parent.Parent, "vehicle-client").VehicleClient;

local function map(p9, p10, p11, p12, p13) -- Line: 35
    return p12 + (p13 - p12) * ((p9 - p10) / (p11 - p10));
end;

local u14 = setmetatable({}, {
    __tostring = function() -- Line: 42, Name: __tostring
        return "JellyfishMountPilot";
    end,

    __index = VehicleClient
});
u14.__index = u14;

function u14.new(...) -- Line: 48
    -- upvalues: u14 (ref)
    local v15 = setmetatable({}, u14);

    return v15:constructor(...) or v15;
end;

function u14.constructor(u16, u17) -- Line: 52
    -- upvalues: VehicleClient (copy), u2 (copy), u8 (copy), Workspace (copy), Players (copy), u3 (copy), SoundService (copy), RunService (copy), u7 (copy), PlaceUtil (copy), MountFlightControls (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), Flamework (copy), AbilityId (copy), BedwarsImageId (copy), ClientSyncEvents (copy), MoveMountDirection (copy), InputActionType (copy), DeviceUtil (copy), KnitClient (copy), u4 (copy), MoveMountUI (copy)
    VehicleClient.constructor(u16, u17);
    u16.maid = u2.new();
    u16.pitchPid = u8.new(-5, 5, 0.09, 0, 0.03);
    u16.yawPid = u8.new(-40, 40, 0.022, 0, 0);
    u16.rollPid = u8.new(-10, 10, 0.1, 0, 0);
    u16.counterDriftPid = u8.new(-100, 100, 35, 0, 1);
    u16.levitationPid = u8.new(-200, 400, 20, 30, 0);
    u16.movePid = u8.new(-30, 30, 4, 0.6, 0);
    u16.heightGoal = 0;
    u16.holdingUp = false;
    u16.holdingDown = false;
    u16.entryTime = Workspace:GetServerTimeNow();
    u16.enginePowerScale = 1;
    u16.defaultCameraMaxZoomDistance = 14;
    u16.defaultCameraMinZoomDistance = 0.5;
    u16.maid = u2.new();
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

    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera then
        u16.defaultCameraMaxZoomDistance = 14;
        u16.defaultCameraMinZoomDistance = 0;
        CurrentCamera.CameraSubject = Root;
        Players.LocalPlayer.CameraMinZoomDistance = 14;
        Players.LocalPlayer.CameraMaxZoomDistance = 32;
        u16.maid:GiveTask(function() -- Line: 89
            -- upvalues: Players (ref), CurrentCamera (copy), u16 (copy)
            local Character2 = Players.LocalPlayer.Character;

            if Character2 ~= nil then
                Character2 = Character2:FindFirstChild("Humanoid");
            end;

            CurrentCamera.CameraSubject = Character2;
            Players.LocalPlayer.CameraMinZoomDistance = u16.defaultCameraMinZoomDistance;
            Players.LocalPlayer.CameraMaxZoomDistance = u16.defaultCameraMaxZoomDistance;
        end);
    end;

    local u18 = u3("Attachment", {
        Parent = Root
    });
    u16.maid:GiveTask(function() -- Line: 103
        -- upvalues: u18 (copy)
        u18:Destroy();
    end);
    u16.angularVelocity = u3("AngularVelocity", {
        MaxTorque = (1 / 0),
        RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
        Attachment0 = u18,
        Parent = Root
    });
    u16.maid:GiveTask(function() -- Line: 112
        -- upvalues: u16 (copy)
        u16.angularVelocity:Destroy();
    end);
    u16.worldSpaceForce = u3("VectorForce", {
        Name = "WorldSpaceForce",
        ApplyAtCenterOfMass = true,
        RelativeTo = Enum.ActuatorRelativeTo.World,
        Attachment0 = u18,
        Parent = u17
    });
    u16.maid:GiveTask(function() -- Line: 122
        -- upvalues: u16 (copy)
        u16.worldSpaceForce:Destroy();
    end);
    u16.localSpaceForce = u3("VectorForce", {
        Name = "LocalSpaceForce",
        ApplyAtCenterOfMass = true,
        RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
        Attachment0 = u18,
        Parent = Root
    });
    u16.maid:GiveTask(function() -- Line: 132
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
    u16.windSound = u3("Sound", {
        Name = "WindSound",
        Looped = true,
        Playing = true,
        Volume = 0.25,
        SoundId = "rbxassetid://" .. tostring(7910583431),
        Parent = SoundService
    });
    u16.heightGoal = Root.Position.Y + 10;
    u16.maid:GiveTask(RunService.Stepped:Connect(function(p19, p20) -- Line: 156
        -- upvalues: Root (copy), u7 (ref), u16 (copy), PlaceUtil (ref), u17 (copy), Workspace (ref)
        local CFrame2 = Root.CFrame;
        local Position = CFrame2.Position;
        local v21 = CFrame2:VectorToObjectSpace(Root.AssemblyLinearVelocity);
        local v22, _, v23 = CFrame2:ToOrientation();
        local v24 = u7:GetMoveVector();
        local LookVector = CFrame2.LookVector;
        local v25 = math.atan2(LookVector.Z, LookVector.X);
        local v26 = Root.AssemblyLinearVelocity * Vector3.new(1.5, 0, 1.5);
        local X = CFrame2:VectorToObjectSpace(v26).X;
        local v27 = -math.sign(X);
        local v28 = v26.Magnitude * v27;
        local v29 = CFrame;
        local v30 = CFrame.new(-v24.X, 0, 0);
        local v31 = v29.lookAt(Position, (CFrame2 * v30).Position);
        local v32 = os.clock();
        local v33 = math.sin(v32) * 0.3 + 0;
        local v34 = u16.holdingUp and not u16.holdingDown and 50 or (u16.holdingDown and not u16.holdingUp and -50 or 0);
        local v35;

        if PlaceUtil.isGameServer() then
            v35 = math.clamp(u16.heightGoal + v34 * p20, -50, 250);
        else
            v35 = u16.heightGoal + v34 * p20;
        end;

        u16.heightGoal = v35;
        local v36 = u16.levitationPid:Calculate(p20, u16.heightGoal + v33, Position.Y);
        local v37 = u16.counterDriftPid:Calculate(p20, 0, v21.Z);
        local v38 = u16.pitchPid:Calculate(p20, 5 * -v24.Z, (math.deg(v23)));
        local v39 = LookVector:Dot(v31.LookVector);
        local v40 = math.acos(v39);
        local Y = LookVector:Cross(v31.LookVector).Y;
        local v41 = math.clamp(Y, -1, 1);
        local v42 = v40 * -math.round(v41);
        local v43 = v42 ~= v42 and 0 or v42;
        local v44 = v24.Magnitude > 0.05;
        local v45;

        if v44 then
            local v46 = math.deg(v25 + v43);
            local yawPid = u16.yawPid;

            if math.abs(v24.X) <= 0.1 then
                v46 = math.deg(v25);
            end;

            v45 = yawPid:Calculate(p20, v46, (math.deg(v25)));
        else
            v45 = 0;
        end;

        local v47 = u16.rollPid:Calculate(p20, 5 * (not v44 and 0 or -1 + 2 * ((v43 - -3.141592653589793) / 6.283185307179586)), (math.deg(v22)));
        local v48 = u16.movePid:Calculate(p20, -63 + 133 * ((-v24.Z - -0.9) / 1.9), v28);
        local v49 = 0 + 0.5 * ((math.abs(v28) - 0) / 70);

        if u16.windSound then
            u16.windSound.Volume = v49;
        end;

        if u16.holdingUp and not u16.holdingDown then
            local v50 = u16;
            v50.enginePowerScale = v50.enginePowerScale + p20 * 0.96;
        elseif u16.holdingDown and not u16.holdingDown then
            local v51 = u16;
            v51.enginePowerScale = v51.enginePowerScale - p20 * 0.96;
        else
            local v52 = u16;
            v52.enginePowerScale = v52.enginePowerScale - p20 * 0.9;
        end;

        u16.enginePowerScale = math.clamp(u16.enginePowerScale, 0.95, 1);
        u16:setEnginePowerRatio(u16.enginePowerScale);

        if u17:GetAttribute("Dead") == true then
            u16.worldSpaceForce.Force = Vector3.new(0, 0, 0);
            u16.localSpaceForce.Force = Vector3.new(0, 0, 0);
            u16.angularVelocity.AngularVelocity = Vector3.new(0, 0, 0);
            u16.maid:DoCleaning();

            return;
        end;

        local AssemblyMass = Root.AssemblyMass;
        local v53 = (Workspace:GetServerTimeNow() - u16.entryTime) / 1;
        local v54 = math.clamp(v53, 0, 1);
        u16.worldSpaceForce.Force = Vector3.new(0, v36 * AssemblyMass * v54, 0);
        u16.localSpaceForce.Force = Vector3.new(-v48 * AssemblyMass, 0, v37 * AssemblyMass);
        u16.angularVelocity.AngularVelocity = Vector3.new(v47, v45 * 1.3, v38);
    end));
    local v55 = MountFlightControls.bindUpDownControls();
    u16.maid:GiveTask(v55.bindActionMaid);
    u16.maid:GiveTask(v55.shouldFlyUpRef.Changed:Connect(function(p56) -- Line: 252
        -- upvalues: u16 (copy)
        u16.holdingUp = p56;

        return u16.holdingUp;
    end));
    u16.maid:GiveTask(v55.shouldFlyDownRef.Changed:Connect(function(p57) -- Line: 256
        -- upvalues: u16 (copy)
        u16.holdingDown = p57;

        return u16.holdingDown;
    end));
    SoundManager:playSound(RandomUtil.fromList(GameSound.JELLYFISH_DEPLOY_1, GameSound.JELLYFISH_DEPLOY_2, GameSound.JELLYFISH_DEPLOY_3), {
        position = nil
    });
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.JELLYFISH_MOUNT_SWAP_COLOR, {
        abilityType = "MiscPrimary",
        abilityButton = {
            icon = BedwarsImageId.SWAP_MOBILE
        }
    }):andThen(function(p58) -- Line: 269
        -- upvalues: u16 (copy)
        u16.maid:GiveTask(p58);
    end);
    u16.maid:GiveTask(ClientSyncEvents.MoveMountButtonChange:connect(function(p59) -- Line: 273
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
        u16.maid:GiveTask(function() -- Line: 288
            -- upvalues: KnitClient (ref)
            return KnitClient.Controllers.MobileUiController:toggleMountMovementControls(false);
        end);

        return;
    end;

    local u60 = u4.mount(u4.createElement("ScreenGui", {
        ResetOnSpawn = false
    }, { u4.createElement(MoveMountUI) }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    u16.maid:GiveTask(function() -- Line: 297
        -- upvalues: u4 (ref), u60 (copy)
        u4.unmount(u60);
    end);
end;

function u14.onDisable(p61) -- Line: 302
    p61.maid:DoCleaning();
    local hoverSound = p61.hoverSound;

    if hoverSound ~= nil then
        hoverSound:Destroy();
    end;

    local windSound = p61.windSound;

    if windSound ~= nil then
        windSound:Destroy();
    end;
end;

return {
    JellyfishMountPilot = u14
};