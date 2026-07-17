-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local RunService = v1.RunService;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ProjectileMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local IdUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "id-util").IdUtil;
local ProjectileHandler = RuntimeLib.import(script, script.Parent.Parent, "projectile-handler").ProjectileHandler;
local QuickCastBulletPool = RuntimeLib.import(script, script.Parent, "quick-cast-bullet").QuickCastBulletPool;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "QuickCastBulletController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 25
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "QuickCastBulletController";
    p4.modelPools = {};
    p4.activeVisuals = {};
    p4.cooldown = -1;
end;

function u2.KnitStart(u5) -- Line: 36
    -- upvalues: KnitController (copy), RunService (copy), default (copy), Players (copy), Workspace (copy), ProjectileMeta (copy)
    KnitController.KnitStart(u5);
    RunService.RenderStepped:Connect(function(p6) -- Line: 38
        -- upvalues: u5 (copy)
        return u5:renderStep(p6);
    end);
    default.Client:Get("ReplicateQuickCastBullet"):Connect(function(p7) -- Line: 41
        -- upvalues: Players (ref), u5 (copy), Workspace (ref), ProjectileMeta (ref)
        if p7.shooter == Players.LocalPlayer then
            return nil;
        end;

        local v8 = u5.modelPools[p7.projectileType];

        if not v8 then
            v8 = u5:createModelPool(p7.projectileType);

            if not v8 then
                return nil;
            end;

            u5.modelPools[p7.projectileType] = v8;
        end;

        local v9 = v8:getModel();
        v9:PivotTo(CFrame.new(p7.position, p7.position + p7.initialVelocity));
        v9.Parent = Workspace;
        local gravitationalAcceleration = ProjectileMeta[p7.projectileType].gravitationalAcceleration;
        u5.activeVisuals[p7.projectileRefId] = {
            data = {
                radius = 0,
                gravityMultiplier = 1,
                id = p7.projectileRefId,
                projectileType = p7.projectileType,
                shooter = p7.shooter,
                position = p7.position,
                velocity = p7.initialVelocity,
                startTime = p7.startTime,
                gravitationalAcceleration = gravitationalAcceleration == nil and 183 or gravitationalAcceleration
            },
            model = v9
        };
    end);
    default.Client:Get("QuickCastBulletHit"):Connect(function(p10) -- Line: 90
        -- upvalues: u5 (copy)
        u5:destroyVisual(p10.id);
    end);
end;

function u2.fireLocalProjectile(p11, p12, p13, p14) -- Line: 94
    -- upvalues: Workspace (copy), ProjectileMeta (copy), IdUtil (copy), KnitClient (copy), ProjectileHandler (copy), Players (copy), default (copy)
    if p11.cooldown > Workspace:GetServerTimeNow() then
        return nil;
    end;

    p11.cooldown = Workspace:GetServerTimeNow() + 0.08;
    local v15 = ProjectileMeta[p12];
    local v16 = IdUtil.generateId(8);
    local v17 = KnitClient.Controllers.DefaultProjectileSourceController:getProjectileHandler();
    local v18;

    if v17 == nil then
        v18 = v17;
    else
        v18 = v17.inputInfo;
    end;

    if v17 ~= nil then
        v17 = v17.targetPoint;
    end;

    local v19;

    if p14 then
        v19 = Workspace.CurrentCamera;

        if v19 ~= nil then
            v19 = v19.ViewportSize / 2 - Vector2.new(0, game:GetService("GuiService"):GetGuiInset().Y / 2);
        end;
    else
        v19 = nil;
    end;

    local v20 = ProjectileHandler.new(1, 1, p12, v18, v17, Vector3.new(0, 0, 0), 0, v19);
    local v21 = KnitClient.Controllers.ProjectileController:calculateImportantLaunchValues(v20, false, p13);

    if not v21 then
        return nil;
    end;

    local v22 = {
        radius = 0,
        gravityMultiplier = 1,
        id = v16,
        projectileType = p12,
        shooter = Players.LocalPlayer,
        position = v21.positionFrom,
        velocity = v21.initialVelocity,
        startTime = Workspace:GetServerTimeNow()
    };
    local gravitationalAcceleration = v15.gravitationalAcceleration;
    v22.gravitationalAcceleration = gravitationalAcceleration == nil and 183 or gravitationalAcceleration;

    if not v21 then
        return nil;
    end;

    default.Client:Get("FireQuickCastBullet"):SendToServer({
        id = v16,
        projectileType = p12,
        fromPosition = v21.positionFrom,
        velocity = v21.initialVelocity,
        fireTime = Workspace:GetServerTimeNow()
    });
    local v23 = p11.modelPools[v22.projectileType];

    if not v23 then
        v23 = p11:createModelPool(v22.projectileType);

        if not v23 then
            return nil;
        end;

        p11.modelPools[v22.projectileType] = v23;
    end;

    local v24 = v23:getModel();
    v24:PivotTo(CFrame.new(v22.position, v22.position + v22.velocity));
    p11.activeVisuals[v22.id] = {
        data = v22,
        model = v24
    };
end;

function u2.renderStep(p25, p26) -- Line: 184
    -- upvalues: ProjectileMeta (copy)
    for _, v in p25.activeVisuals do
        local data = v.data;
        local v27 = data.velocity * p26;
        local gravitationalAcceleration = ProjectileMeta[v.data.projectileType].gravitationalAcceleration;
        data.velocity = data.velocity + Vector3.new(0, -((gravitationalAcceleration == nil and 183 or gravitationalAcceleration) * data.gravityMultiplier) * p26, 0);
        data.position = data.position + v27;
        v.model:PivotTo(CFrame.new(data.position, data.position + data.velocity));
    end;
end;

function u2.destroyVisual(p28, p29) -- Line: 210
    local v30 = p28.activeVisuals[p29];

    if v30 then
        local v31 = p28.modelPools[v30.data.projectileType];

        if v31 then
            v31:returnModel(v30.model);
        else
            v30.model:Destroy();
        end;

        p28.activeVisuals[p29] = nil;
    end;
end;

function u2.createModelPool(p32, p33) -- Line: 228
    -- upvalues: ReplicatedStorage (copy), QuickCastBulletPool (copy)
    local Assets = ReplicatedStorage:WaitForChild("Assets", 3);

    if Assets ~= nil then
        Assets = Assets:WaitForChild("Projectiles", 3);
    end;

    local v34 = Assets:WaitForChild(p33);

    if v34 then
        return QuickCastBulletPool.new(v34);
    end;

    return nil;
end;

KnitClient.CreateController(u2.new());

return nil;