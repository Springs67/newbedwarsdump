-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local LobbyEnvironment = RuntimeLib.import(script, script.Parent.Parent.Parent, "lobby", "ambience", "environments", "lobby-environment").LobbyEnvironment;
local OG_LOBBY_ENVIRONMENT = RuntimeLib.import(script, script.Parent.Parent.Parent, "lobby", "ambience", "environments", "og-lobby-environment").OG_LOBBY_ENVIRONMENT;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u6 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "screen-space");
local ScreenWidthToWorldWidth = u6.ScreenWidthToWorldWidth;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "BackdropController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 33
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 37
    -- upvalues: KnitController (copy), Workspace (copy), u3 (copy)
    KnitController.constructor(p9);
    p9.Name = "BackdropController";
    p9.camera = Workspace.CurrentCamera;
    p9.fov = 0;
    p9.maid = u3.new();
end;

function u7.KnitStart(p10) -- Line: 44
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p10);
end;

function u7.setupBackdrop(u11, p12) -- Line: 47
    -- upvalues: u3 (copy), KnitClient2 (copy), DeviceUtil (copy), KnitClient (copy), Players (copy), Flamework (copy), u4 (copy), Workspace (copy), ColorUtil (copy), Theme (copy), RunService (copy), OG_LOBBY_ENVIRONMENT (copy), LobbyEnvironment (copy)
    u11.maid:DoCleaning();
    u11.maid = u3.new();
    u11.fov = p12.fov;
    KnitClient2.Controllers.LobbyHudController:hideLobbyHud("backdrop-open");
    KnitClient2.Controllers.HotbarController:hideHotbar("backdrop-open");

    if DeviceUtil.isMobileControls() then
        KnitClient.Controllers.MobileUiController:hideUi("backdrop-open");
    end;

    local u13 = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui");
    local u14;

    if u13 == nil then
        u14 = u13;
    else
        u14 = u13:FindFirstChild("ActionBarScreenGui");
    end;

    if u14 then
        u14.Enabled = false;
    end;

    local u15;

    if u13 == nil then
        u15 = u13;
    else
        u15 = u13:FindFirstChild("RoactTree");
    end;

    if u15 then
        u15.Enabled = false;
    end;

    if u13 ~= nil then
        u13 = u13:FindFirstChild("QueueRegionDisplay");
    end;

    if u13 then
        u13.Enabled = false;
    end;

    u11.maid:GiveTask(function() -- Line: 82
        -- upvalues: DeviceUtil (ref), KnitClient (ref), KnitClient2 (ref), u14 (copy), u15 (copy), u13 (copy)
        if DeviceUtil.isMobileControls() then
            KnitClient.Controllers.MobileUiController:unhideUi("backdrop-open");
        end;

        KnitClient2.Controllers.LobbyHudController:unhideLobbyHud("backdrop-open");
        KnitClient2.Controllers.HotbarController:unhideHotbar("backdrop-open");

        if u14 then
            u14.Enabled = true;
        end;

        if u15 then
            u15.Enabled = true;
        end;

        if u13 then
            u13.Enabled = true;
        end;
    end);
    local u16 = {};

    local function _(p17) -- Line: 101
        -- upvalues: Flamework (ref), u16 (copy)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):blockAbility(p17.abilityId, "backdrop-open");
        table.insert(u16, p17.abilityId);
    end;

    for _, v in Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbilities() do
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):blockAbility(v.abilityId, "backdrop-open");
        table.insert(u16, v.abilityId);
    end;

    u11.maid:GiveTask(function() -- Line: 109
        -- upvalues: Flamework (ref), u16 (copy)
        local function _(p18) -- Line: 110
            -- upvalues: Flamework (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):unblockAbility(p18, "backdrop-open");
        end;

        for i, v in u16 do
            local _ = i - 1;
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):unblockAbility(v, "backdrop-open");
        end;
    end);
    u11.maid:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
        blockSprint = true
    }));
    local u19 = u4("Part", {
        Name = "Backdrop",
        CastShadow = false,
        Anchored = true,
        Transparency = 1,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        Size = u11:getBackdropSize(),
        CFrame = p12.cframe,
        Parent = Workspace
    });
    local v20 = {
        LightInfluence = 0,
        Parent = u19,
        Face = Enum.NormalId.Back
    };
    local v21 = {};
    local image = p12.image;
    v21.Image = image == nil and "" or image;
    v21.Size = UDim2.fromScale(1, 1);
    v21.ScaleType = Enum.ScaleType.Stretch;
    v21.BackgroundColor3 = p12.backgroundColor or ColorUtil.darken(Theme.backgroundPrimary, 0.25);
    local imageTransparency = p12.imageTransparency;
    v21.ImageTransparency = imageTransparency == nil and 0.9 or imageTransparency;
    v21.BorderSizePixel = 0;
    v20.Children = { u4("ImageLabel", v21) };
    u4("SurfaceGui", v20);
    RunService:BindToRenderStep("viewport-backdrop", Enum.RenderPriority.Camera.Value + 3, function() -- Line: 160
        -- upvalues: u11 (copy), u19 (copy)
        if u11.camera then
            u19.CFrame = CFrame.lookAt(u19.CFrame.Position, u11.camera:GetPivot().Position);
            u19.CFrame = u11.camera:GetPivot() + u11.camera:GetPivot().LookVector * 140;
        end;
    end);
    local camera = u11.camera;

    if camera ~= nil then
        camera = camera:GetPropertyChangedSignal("ViewportSize"):Connect(function() -- Line: 170
            -- upvalues: u11 (copy)
            if u11.backdrop then
                u11.backdrop.Size = u11:getBackdropSize();
            end;
        end);
    end;

    local u22 = KnitClient.Controllers.EnvironmentController:getCurrentEnvironment();
    KnitClient.Controllers.EnvironmentController:setupEnvironment(OG_LOBBY_ENVIRONMENT);
    u11.maid:GiveTask(function() -- Line: 180
        -- upvalues: KnitClient (ref), u22 (copy), LobbyEnvironment (ref)
        KnitClient.Controllers.EnvironmentController:setupEnvironment(u22 or LobbyEnvironment);
    end);
    local u23 = KnitClient2.Controllers.LightingController:getAtmosphereModifier():addModifier(100, {
        Density = 0
    });
    local u24 = KnitClient2.Controllers.LightingController.sunRayModifier:addModifier(100, {
        Enabled = false
    });
    local u25 = KnitClient2.Controllers.LightingController.colorCorrectionModifier:addModifier(100, {
        Saturation = 0
    });
    u11.maid:GiveTask(function() -- Line: 192
        -- upvalues: u23 (copy), u24 (copy), u25 (copy), KnitClient (ref), u22 (copy), LobbyEnvironment (ref)
        u23:destroy();
        u24:destroy();
        u25:destroy();
        KnitClient.Controllers.EnvironmentController:setupEnvironment(u22 or LobbyEnvironment);
    end);
    KnitClient.Controllers.ShiftLockController:registerShiftLockControlDisabler("backdrop");
    u11.maid:GiveTask(function() -- Line: 200
        -- upvalues: KnitClient (ref)
        return KnitClient.Controllers.ShiftLockController:unregisterShiftLockControlDisabler("backdrop");
    end);
    u11.backdrop = u19;
    u11.maid:GiveTask(u19);
    u11.maid:GiveTask(function() -- Line: 205
        -- upvalues: camera (copy)
        local v26 = camera;

        if v26 ~= nil then
            v26 = v26:Disconnect();
        end;

        return v26;
    end);
    u11.maid:GiveTask(function() -- Line: 212
        -- upvalues: RunService (ref)
        return RunService:UnbindFromRenderStep("viewport-backdrop");
    end);
end;

function u7.clearBackdrop(p27) -- Line: 216
    p27.maid:DoCleaning();
end;

function u7.changeBackdropFov(p28, p29) -- Line: 219
    if not p28.backdrop then
        return nil;
    end;

    p28.fov = p29;
    p28.backdrop.Size = p28:getBackdropSize();
end;

function u7.getBackdropSize(p30) -- Line: 226
    -- upvalues: ScreenWidthToWorldWidth (copy), u6 (copy)
    local v31 = ScreenWidthToWorldWidth(u6.ViewSizeX(), -1, p30.fov) * 165;
    local v32 = ScreenWidthToWorldWidth(u6.ViewSizeY(), -1, p30.fov) * 165;

    return Vector3.new(v31, v32, 1);
end;

KnitClient.CreateController(u7.new());

return nil;