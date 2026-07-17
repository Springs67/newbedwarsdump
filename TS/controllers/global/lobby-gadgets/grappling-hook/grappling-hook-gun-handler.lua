-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConstantManager = v1.ConstantManager;
local GameQueryUtil = v1.GameQueryUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "grappling-hook", "grappling-hook-util");
local GrapplingHookConst = v5.GrapplingHookConst;
local GrapplingHookFunctions = v5.GrapplingHookFunctions;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SharedSyncEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local u6 = ConstantManager.registerConstants(script, {
    FORCE_SCALAR = 400,
    RUNTIME_MULT = 0.12
});
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "GrapplingHookGunHandler";
    end,

    __index = HandKnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 37
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 41
    -- upvalues: HandKnitController (copy), GrapplingHookFunctions (copy), u2 (copy)
    HandKnitController.constructor(p9);
    p9.Name = "GrapplingHookGunHandler";
    p9.grapplingHook = {
        state = GrapplingHookFunctions.UNEQUIPPED
    };
    p9.maid = u2.new();
    p9.transitMaid = u2.new();
    p9.shotId = "";
end;

function u7.KnitStart(u10) -- Line: 51
    -- upvalues: HandKnitController (copy), default (copy), SharedSyncEvents (copy), Players (copy), ClientSyncEvents (copy)
    HandKnitController.KnitStart(u10);
    default.Client:Get("CutGrappleLine"):Connect(function(p11) -- Line: 53
        -- upvalues: u10 (copy)
        u10.transitMaid:DoCleaning();
    end);
    SharedSyncEvents.HookFunctionSwapEvent:connect(function(p12) -- Line: 56
        -- upvalues: Players (ref), u10 (copy)
        if p12.player ~= Players.LocalPlayer then
            return nil;
        end;

        u10.grapplingHook.state = p12.hookFunction;
    end);
    ClientSyncEvents.ProjectileLaunched:connect(function(p13) -- Line: 62
        -- upvalues: Players (ref), u10 (copy)
        if p13.shooter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        local launchData = p13.launchData;

        if launchData ~= nil then
            launchData = launchData.shotId;
        end;

        u10.shotId = launchData == nil and "" or launchData;
    end);
end;

function u7.getHookState(p14) -- Line: 77
    return p14.grapplingHook.state;
end;

function u7.setHookState(p15, p16) -- Line: 80
    p15.grapplingHook.state = p16;
end;

function u7.isRelevantItem(p17, p18) -- Line: 83
    -- upvalues: ItemType (copy)
    return p18.itemType == ItemType.GRAPPLING_HOOK;
end;

function u7.onEnable(u19, p20, p21) -- Line: 86
    -- upvalues: GrapplingHookFunctions (copy), SharedSyncEvents (copy), Players (copy), u2 (copy), Flamework (copy), CooldownId (copy)
    u19.grapplingHook.state = GrapplingHookFunctions.HOOK_CHAMBERED;
    SharedSyncEvents.HookFunctionSwapEvent:fire(Players.LocalPlayer, GrapplingHookFunctions.HOOK_CHAMBERED);
    u19.maid:GiveTask(function() -- Line: 89
        -- upvalues: u19 (copy), GrapplingHookFunctions (ref), SharedSyncEvents (ref), Players (ref)
        u19.grapplingHook.state = GrapplingHookFunctions.UNEQUIPPED;
        SharedSyncEvents.HookFunctionSwapEvent:fire(Players.LocalPlayer, GrapplingHookFunctions.UNEQUIPPED);
    end);
    u19:setupYield(function() -- Line: 93
        -- upvalues: u2 (ref), Flamework (ref), CooldownId (ref)
        local u22 = u2.new();
        u22:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(CooldownId.GRAPPLING_HOOK));

        return function() -- Line: 96
            -- upvalues: u22 (copy)
            u22:DoCleaning();
        end;
    end);

    return nil;
end;

function u7.onDisable(p23) -- Line: 102
    p23.maid:DoCleaning();

    return nil;
end;

function u7.transit(p24, u25, p26, p27) -- Line: 106
    -- upvalues: Players (copy), GameQueryUtil (copy), Workspace (copy), u3 (copy), KnitClient (copy), GrapplingHookConst (copy), RunService (copy), u6 (copy)
    local u28 = p26 + Vector3.new(0, 6, 0);

    if u25 ~= Players.LocalPlayer then
        return nil;
    end;

    local Character = u25.Character;
    local Character2 = u25.Character;

    if Character2 ~= nil then
        Character2 = Character2:FindFirstChild("Humanoid");
    end;

    if not (Character and Character2) then
        return nil;
    end;

    local PrimaryPart = Character.PrimaryPart;

    if PrimaryPart == nil then
        return nil;
    end;

    local AssemblyMass = PrimaryPart.AssemblyMass;
    Character.PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 20, 0);

    if not GameQueryUtil:raycast(PrimaryPart.Position + Vector3.new(0, -5, 0), Vector3.new(0, -100, 0)) and Character2:GetState() == Enum.HumanoidStateType.Freefall then
        Character.PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, Workspace.Gravity / 3, 0);
    end;

    local _ = (u28 - Character.PrimaryPart.Position).Magnitude;
    local v29 = {
        Name = "LiftForce",
        Force = Vector3.new(0, 0, 0),
        ApplyAtCenterOfMass = true,
        Parent = Character2.RootPart,
        RelativeTo = Enum.ActuatorRelativeTo.World
    };
    local RootPart = Character2.RootPart;

    if RootPart ~= nil then
        RootPart = RootPart:WaitForChild("RootRigAttachment");
    end;

    v29.Attachment0 = RootPart;
    local u30 = u3("VectorForce", v29);
    local v31 = {
        Name = "SwivelForce",
        Force = Vector3.new(0, 0, 0),
        ApplyAtCenterOfMass = true,
        Parent = Character2.RootPart,
        RelativeTo = Enum.ActuatorRelativeTo.World
    };
    local RootPart2 = Character2.RootPart;

    if RootPart2 ~= nil then
        RootPart2 = RootPart2:WaitForChild("RootRigAttachment");
    end;

    v31.Attachment0 = RootPart2;
    local u32 = u3("VectorForce", v31);
    local u33 = u3("BodyForce", {
        Name = "AntiGravity",
        Force = Vector3.new(0, 0, 0),
        Parent = PrimaryPart
    });
    local u34 = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
        constantSpeedMultiplier = GrapplingHookConst.SPEED
    });
    Character2:ChangeState(Enum.HumanoidStateType.Freefall);
    Character2.PlatformStand = true;
    task.delay(0.1, function() -- Line: 178
        -- upvalues: Character2 (copy)
        Character2.PlatformStand = false;
    end);
    local u35 = 0.5;
    local u36 = 0;
    RunService:BindToRenderStep("GrappleHook", Enum.RenderPriority.Last.Value, function(p37) -- Line: 183
        -- upvalues: u36 (ref), u35 (ref), u25 (copy), u28 (ref), AssemblyMass (ref), u6 (ref), u30 (copy), Character2 (copy), u32 (copy), GrapplingHookConst (ref), u33 (copy), Character (copy)
        u36 = u36 + p37;
        u35 = math.clamp(u35 - p37 / 0.5, 0, 0.5);
        local Character3 = u25.Character;

        if Character3 ~= nil then
            Character3 = Character3.PrimaryPart;

            if Character3 ~= nil then
                Character3 = Character3.Position;
            end;
        end;

        if Character3 == nil then
            return nil;
        end;

        local Unit = (u28 - Character3).Unit;
        local Character4 = u25.Character;

        if Character4 ~= nil then
            Character4 = Character4.PrimaryPart;

            if Character4 ~= nil then
                Character4 = Character4.AssemblyMass;
            end;
        end;

        if Character4 == nil then
            Character4 = AssemblyMass;
        end;

        AssemblyMass = Character4;
        u30.Force = Unit * u6.FORCE_SCALAR * AssemblyMass;
        local MoveDirection = Character2.MoveDirection;
        u32.Force = (MoveDirection - Unit * MoveDirection:Dot(Unit)) * u6.FORCE_SCALAR * u35 * AssemblyMass * 1.2;
        u33.Force = GrapplingHookConst.FORCE_ADDITIVE * AssemblyMass;
        Character.PrimaryPart.AssemblyLinearVelocity = Character.PrimaryPart.AssemblyLinearVelocity:Lerp(Unit * 20, (math.clamp(u36 * u6.RUNTIME_MULT, 0, 1)));
    end);
    p24.transitMaid:GiveTask(function() -- Line: 234
        -- upvalues: RunService (ref), u30 (copy), u32 (copy), u33 (copy), u34 (copy), Character2 (copy)
        RunService:UnbindFromRenderStep("GrappleHook");
        u30:Destroy();
        u32:Destroy();
        u33:Destroy();
        u34.Destroy();
        Character2:ChangeState(Enum.HumanoidStateType.Landed);
    end);
end;

KnitClient.CreateController(u7.new());

return {
    GrapplingHookGunHandler = u7
};