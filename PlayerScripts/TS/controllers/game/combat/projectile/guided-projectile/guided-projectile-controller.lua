-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local RunService = v5.RunService;
local UserInputService = v5.UserInputService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local GuidedProjectileMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "guided-projectile", "guided-projectile-meta").GuidedProjectileMeta;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "GuidedProjectileController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 32
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 36
    -- upvalues: KnitController (copy), default2 (copy), u2 (copy)
    KnitController.constructor(p8);
    p8.Name = "GuidedProjectileController";
    p8.fireGuidedProjectile = default2.Client:Get("FireGuidedProjectile");
    p8.angleX = 0;
    p8.angleY = 0;
    p8.directionMotor = u2.GroupMotor.new({
        cameraX = 0,
        cameraY = 0,
        modelX = 0,
        modelY = 0
    });
end;

function u6.KnitStart(u9) -- Line: 49
    -- upvalues: KnitController (copy), Workspace (copy), RunService (copy), Players (copy), GuidedProjectileMeta (copy), UserInputService (copy), u2 (copy), default2 (copy), ClientSyncEvents (copy)
    KnitController.KnitStart(u9);
    local CurrentCamera = Workspace.CurrentCamera;
    RunService.RenderStepped:Connect(function() -- Line: 52
        -- upvalues: u9 (copy), Players (ref), GuidedProjectileMeta (ref), Workspace (ref), CurrentCamera (copy), UserInputService (ref), u2 (ref)
        if u9.currentlyGuidingProjectile then
            if u9.currentlyGuidingProjectile.enabled == false then
                return nil;
            end;

            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                local function _(p10) -- Line: 61
                    if p10:IsA("BasePart") then
                        p10.LocalTransparencyModifier = 0;
                    end;
                end;

                for i, descendant in Character:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("BasePart") then
                        descendant.LocalTransparencyModifier = 0;
                    end;
                end;
            end;

            local model = u9.currentlyGuidingProjectile.model;
            local v11 = model:GetPrimaryPartCFrame();
            local v12 = GuidedProjectileMeta[u9.currentlyGuidingProjectile.type];

            if u9.currentlyGuidingProjectile.disabling ~= true then
                u9.currentlyGuidingProjectile.forces.antiGravity.Force = Vector3.new(0, model.PrimaryPart.AssemblyMass * Workspace.Gravity, 0);
                model.PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0);

                if v12.doNotSetVelocity ~= true then
                    local speed = v12.speed;
                    model.PrimaryPart.AssemblyLinearVelocity = v11.LookVector * (speed == nil and 45 or speed);
                end;
            end;

            local v13 = u9.directionMotor:getValue();
            local v14 = v12.flightRotation or Vector3.new();
            local v15 = CFrame.Angles(v14.X, v14.Y, v14.Z);
            local v16 = CFrame.new(v11.Position) * v15;
            local v17 = CFrame.Angles(0, v13.modelX, 0);
            local v18 = CFrame.Angles(v13.modelY, 0, 0);
            model:PivotTo(v16 * v17 * v18);
            local v19 = CFrame.new(v11.Position) * v15;
            local v20 = CFrame.Angles(0, v13.cameraX, 0);
            local v21 = CFrame.Angles(v13.cameraY, 0, 0);
            local v22 = CFrame.new(v12.cameraOffset or Vector3.new(0, 2, 5));
            CurrentCamera.CFrame = v19 * v20 * v21 * v22;
            local v23;

            if u9.thumbstickPosition then
                v23 = Vector2.new(u9.thumbstickPosition.X, -u9.thumbstickPosition.Y) * 8;
            else
                v23 = UserInputService:GetMouseDelta();
            end;

            u9.angleX = u9.angleX - v23.X * 0.004;
            local yAngleLimit = v12.yAngleLimit;

            if yAngleLimit ~= nil then
                yAngleLimit = yAngleLimit.lower;
            end;

            local yAngleLimit2 = v12.yAngleLimit;

            if yAngleLimit2 ~= nil then
                yAngleLimit2 = yAngleLimit2.upper;
            end;

            u9.angleY = math.clamp(u9.angleY - v23.Y * 0.004, yAngleLimit == nil and -0.8 or yAngleLimit, yAngleLimit2 == nil and 0.8 or yAngleLimit2);
            local v24 = {
                frequency = 4,
                dampingRatio = 0.85
            };
            local v25 = u2.Spring.new(v13.cameraX, v24);
            local v26 = u2.Spring.new(v13.cameraY, v24);

            if v12.modelSpringSettings then
                if v12.modelSpringSettings == "Instant" then
                    v25 = u2.Instant.new(v13.cameraX);
                    v26 = u2.Instant.new(v13.cameraY);
                else
                    v25 = u2.Spring.new(v13.cameraX, v12.modelSpringSettings);
                    v26 = u2.Spring.new(v13.cameraY, v12.modelSpringSettings);
                end;
            end;

            u9.directionMotor:setGoal({
                cameraX = u2.Spring.new(u9.angleX, v24),
                cameraY = u2.Spring.new(u9.angleY, v24),
                modelX = v25,
                modelY = v26
            });
        end;
    end);
    default2.Client:OnEvent("GuidedProjectileDetonated", function(p27) -- Line: 148
        -- upvalues: u9 (copy), GuidedProjectileMeta (ref), CurrentCamera (copy), ClientSyncEvents (ref)
        local position = p27.position;

        if u9.currentlyGuidingProjectile ~= nil and u9.currentlyGuidingProjectile.model == p27.model then
            position = u9.currentlyGuidingProjectile.model:GetPrimaryPartCFrame().Position;
            local v28 = GuidedProjectileMeta[u9.currentlyGuidingProjectile.type];
            u9:destroyGuidedProjectile();
            CurrentCamera.CameraType = Enum.CameraType.Scriptable;
            local observeExplosionTime = v28.observeExplosionTime;
            task.delay(observeExplosionTime == nil and 2 or observeExplosionTime, function() -- Line: 161
                -- upvalues: CurrentCamera (ref)
                CurrentCamera.CameraType = Enum.CameraType.Custom;
            end);
        end;

        ClientSyncEvents.GuidedProjectileDetonated:fire(p27.type, position);
    end);
    UserInputService.InputChanged:Connect(function(p29) -- Line: 167
        -- upvalues: u9 (copy)
        if p29.UserInputType == Enum.UserInputType.Gamepad1 and p29.KeyCode == Enum.KeyCode.Thumbstick2 then
            u9:handleConsoleInput(p29);
        end;
    end);
    UserInputService.InputEnded:Connect(function(p30) -- Line: 174
        -- upvalues: u9 (copy)
        if p30.UserInputType == Enum.UserInputType.Gamepad1 and p30.KeyCode == Enum.KeyCode.Thumbstick2 then
            u9.thumbstickPosition = nil;
        end;
    end);
end;

function u6.setupGuidedProjectileMaid(u31, p32, u33, p34) -- Line: 182
    -- upvalues: GuidedProjectileMeta (copy), u3 (copy), Flamework (copy), CooldownId (copy), Workspace (copy), KnitClient2 (copy), UserInputService (copy), RunService (copy), KnitClient (copy), ClientSyncEvents (copy), default2 (copy)
    local v35 = GuidedProjectileMeta[p32];
    local v36 = u3.new();

    if not v35.dontShowCooldown then
        v36:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(CooldownId.GUIDED_PROJECTILE));
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.GUIDED_PROJECTILE, p34 - Workspace:GetServerTimeNow(), {
        cooldownBar = {
            color = v35.barColor or Color3.fromRGB(255, 176, 31)
        }
    });
    v36:GiveTask(function() -- Line: 193
        -- upvalues: Flamework (ref), CooldownId (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(CooldownId.GUIDED_PROJECTILE);
    end);
    v36:GiveTask(KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
        constantSpeedMultiplier = 0,
        blockSprint = true
    }));
    UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter;
    UserInputService.MouseIconEnabled = false;
    RunService:BindToRenderStep("KeepMouseLocked", Enum.RenderPriority.Camera.Value - 1, function() -- Line: 202
        -- upvalues: UserInputService (ref)
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter;
    end);
    v36:GiveTask(function() -- Line: 205
        -- upvalues: RunService (ref)
        return RunService:UnbindFromRenderStep("KeepMouseLocked");
    end);
    v36:GiveTask(function() -- Line: 208
        -- upvalues: UserInputService (ref)
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default;
        UserInputService.MouseIconEnabled = true;
        task.delay(0.1, function() -- Line: 211
            -- upvalues: UserInputService (ref)
            UserInputService.MouseBehavior = Enum.MouseBehavior.Default;
        end);
    end);
    local FovController = KnitClient.Controllers.FovController;
    local v37 = {};
    local fov = v35.fov;
    v37.fovMultiplier = (fov == nil and 85 or fov) / KnitClient.Controllers.FovController:getBaseFOV();
    v36:GiveTask(FovController:addModifier(v37));
    Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
    v36:GiveTask(function() -- Line: 226
        -- upvalues: Workspace (ref)
        Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
    end);
    v36:GiveTask(function() -- Line: 229
        -- upvalues: u31 (copy), ClientSyncEvents (ref)
        if u31.currentlyGuidingProjectile then
            ClientSyncEvents.GuidedProjectileRemoved:fire(u31.currentlyGuidingProjectile.type, u31.currentlyGuidingProjectile.model);
        end;
    end);
    local u38 = KnitClient.Controllers.ViewmodelController:addDisabler();
    v36:GiveTask(function() -- Line: 235
        -- upvalues: KnitClient (ref), u38 (copy)
        KnitClient.Controllers.ViewmodelController:removeDisabler(u38);
    end);
    ClientSyncEvents.GuidedProjectileEnabling:fire(p32, u33);
    task.spawn(function() -- Line: 239
        -- upvalues: default2 (ref), u33 (copy)
        default2.Client:Get("GuidedProjectileClientControlStateChanged"):SendToServer({
            newState = true,
            model = u33
        });
    end);

    return v36;
end;

u6.launch = RuntimeLib.async(function(u39, p40) -- Line: 247
    -- upvalues: RuntimeLib (copy), getItemMeta (copy), Workspace (copy), u4 (copy), default (copy)
    local v41 = RuntimeLib.await(u39.fireGuidedProjectile:CallServerAsync(p40));

    if not v41 then
        default.Warn("Server rejected request to launch guided projectile");

        return;
    end;

    local guidedProjectile = getItemMeta(p40).guidedProjectileSource.guidedProjectile;
    local model = v41.model;
    local explodeTime = v41.explodeTime;
    model.AncestryChanged:Connect(function(p42, p43) -- Line: 254
        -- upvalues: Workspace (ref), u39 (copy)
        if p43 ~= nil then
            p43 = p43:IsDescendantOf(Workspace);
        end;

        if not p43 then
            u39:destroyGuidedProjectile();
        end;
    end);

    if not model.PrimaryPart then
        model:GetPropertyChangedSignal("PrimaryPart"):Wait();
    end;

    local PrimaryPart = model.PrimaryPart;
    local v44 = u39:setupGuidedProjectileMaid(guidedProjectile, model, explodeTime);
    local v45 = u4("BodyForce", {
        Name = "AntiGravity",
        Force = Vector3.new(0, PrimaryPart.AssemblyMass * Workspace.Gravity, 0),
        Parent = PrimaryPart
    });
    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera ~= nil then
        CurrentCamera = CurrentCamera.CFrame.LookVector;
    end;

    local v46 = CurrentCamera == nil and Vector3.new(0, 1, 0) or CurrentCamera;
    u39.angleX = math.atan2(v46.Z, -v46.X) + 1.5707963267948966;
    u39.angleY = 0;

    local function _(p47) -- Line: 297
        return p47:IsA("Sound");
    end;

    local v48 = 0;
    local v49 = {};
    local v50 = {
        enabled = true,
        disabling = false,
        maid = v44,
        type = guidedProjectile,
        model = model,
        explodeTime = explodeTime,
        forces = {
            antiGravity = v45
        }
    };

    for i, descendant in model:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("Sound") == true then
            v48 = v48 + 1;
            v49[v48] = descendant;
        end;
    end;

    v50.sounds = v49;
    u39.currentlyGuidingProjectile = v50;
end);

function u6.handleConsoleInput(p51, p52) -- Line: 316
    if p52.Position.Magnitude > 0.1 then
        p51.thumbstickPosition = p52.Position;

        return;
    end;

    p51.thumbstickPosition = nil;
end;

function u6.getCurrentGuidedProjectile(p53) -- Line: 323
    return p53.currentlyGuidingProjectile and {
        model = p53.currentlyGuidingProjectile.model,
        type = p53.currentlyGuidingProjectile.type,
        forces = p53.currentlyGuidingProjectile.forces,
        sounds = p53.currentlyGuidingProjectile.sounds,
        enabled = p53.currentlyGuidingProjectile.enabled,
        disabling = p53.currentlyGuidingProjectile.disabling
    } or nil;
end;

function u6.enableGuidedProjectile(p54) -- Line: 337
    -- upvalues: Workspace (copy)
    if p54.currentlyGuidingProjectile and not p54.currentlyGuidingProjectile.disabling then
        p54.currentlyGuidingProjectile.maid = p54:setupGuidedProjectileMaid(p54.currentlyGuidingProjectile.type, p54.currentlyGuidingProjectile.model, p54.currentlyGuidingProjectile.explodeTime);
        p54.currentlyGuidingProjectile.enabled = true;
        p54.currentlyGuidingProjectile.forces.antiGravity.Force = Vector3.new(0, Workspace.Gravity * p54.currentlyGuidingProjectile.model.PrimaryPart.AssemblyMass, 0);
    end;
end;

function u6.disableGuidedProjectile(u55, p56) -- Line: 344
    -- upvalues: ClientSyncEvents (copy), default2 (copy)
    if u55.currentlyGuidingProjectile and not u55.currentlyGuidingProjectile.disabling then
        u55.currentlyGuidingProjectile.disabling = true;
        ClientSyncEvents.GuidedProjectileDisabling:fire(u55.currentlyGuidingProjectile.type, u55.currentlyGuidingProjectile.model);
        task.spawn(function() -- Line: 348
            -- upvalues: default2 (ref), u55 (copy)
            default2.Client:Get("GuidedProjectileClientControlStateChanged"):SendToServer({
                newState = false,
                model = u55.currentlyGuidingProjectile.model
            });
        end);
        task.delay(p56 == nil and 0.1 or p56, function() -- Line: 359
            -- upvalues: u55 (copy)
            if u55.currentlyGuidingProjectile then
                u55.currentlyGuidingProjectile.disabling = false;
                u55.currentlyGuidingProjectile.maid:DoCleaning();
                u55.currentlyGuidingProjectile.enabled = false;
                u55.currentlyGuidingProjectile.forces.antiGravity.Force = Vector3.new(0, 0, 0);
            end;
        end);
    end;
end;

function u6.destroyGuidedProjectile(p57) -- Line: 369
    if p57.currentlyGuidingProjectile then
        p57.currentlyGuidingProjectile.maid:DoCleaning();

        if p57.currentlyGuidingProjectile.model then
            p57.currentlyGuidingProjectile.model:Destroy();
        end;

        p57.currentlyGuidingProjectile = nil;
    end;
end;

KnitClient.CreateController(u6.new());

return nil;