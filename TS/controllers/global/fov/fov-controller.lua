-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local MathExtras = v1.MathExtras;
local StatusModifier = v1.StatusModifier;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local RunService = v3.RunService;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "FovController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 28
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(u6) -- Line: 32
    -- upvalues: KnitController (copy), u2 (copy), StatusModifier (copy), MathExtras (copy), ClientStore (copy)
    KnitController.constructor(u6);
    u6.Name = "FovController";
    u6.fovMultiplier = 1;
    u6.fov = 80;
    u6.activeFOVTween = nil;
    u6.fovOverrides = {};
    u6.funnyFOVMaid = u2.new();
    u6.isInFunnyMode = false;
    u6.fovModifier = StatusModifier.new(function(p7) -- Line: 41
        -- upvalues: u6 (copy), MathExtras (ref), ClientStore (ref)
        local v8 = 0;

        for _, v in p7 do
            local modifierMax = v.modifierMax;

            if modifierMax ~= 0 and (modifierMax == modifierMax and modifierMax) then
                modifierMax = v.modifierMax <= u6:getFOV() / u6:getBaseFOV();
            end;

            if (modifierMax == 0 or (modifierMax ~= modifierMax or not modifierMax)) and v.fovMultiplier ~= nil then
                v8 = v8 + MathExtras:getPercentFromMultiplier(v.fovMultiplier);
            end;
        end;

        u6.fovMultiplier = MathExtras:getMultiplierFromPercent(v8);
        u6:setFOV(ClientStore:getState().Settings.fov);
    end);
end;

function u4.KnitStart(u9) -- Line: 59
    -- upvalues: KnitController (copy), Players (copy), KnitClient (copy), ClientStore (copy), Workspace (copy), RunService (copy)
    KnitController.KnitStart(u9);
    Players.LocalPlayer.CharacterAdded:Connect(function() -- Line: 61
        -- upvalues: u9 (copy)
        u9.fovModifier:clear();
    end);
    KnitClient.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p10) -- Line: 65
        -- upvalues: u9 (copy), ClientStore (ref)
        u9:setFOV(ClientStore:getState().Settings.fov);
    end);
    ClientStore.changed:connect(function(p11, p12) -- Line: 69
        -- upvalues: u9 (copy), Workspace (ref), RunService (ref)
        if p11.Settings.fov ~= p12.Settings.fov then
            u9:setFOV(p11.Settings.fov);

            if p11.Settings.fov >= 360 and not u9.isInFunnyMode then
                local CurrentCamera = Workspace.CurrentCamera;

                if CurrentCamera then
                    u9.isInFunnyMode = true;
                    u9.funnyFOVMaid:GiveTask(RunService.RenderStepped:Connect(function() -- Line: 77
                        -- upvalues: CurrentCamera (copy)
                        CurrentCamera.CFrame = CurrentCamera.CFrame * CFrame.new(0, 0, 0, 0.5, 0, 0, 0, 0.5, 0, 0, 0, 1);
                    end));
                end;
            else
                u9.funnyFOVMaid:DoCleaning();
                u9.isInFunnyMode = false;
            end;
        end;
    end);
end;

function u4.addModifier(p13, p14) -- Line: 92
    return p13.fovModifier:addModifier(p14);
end;

function u4.getFOVStatusModifier(p15) -- Line: 95
    return p15.fovModifier;
end;

function u4.getFOV(p16) -- Line: 98
    return p16.fov;
end;

function u4.getBaseFOV(p17) -- Line: 101
    -- upvalues: KnitClient (copy), DeviceUtil (copy), ClientStore (copy)
    local v18 = KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective();

    if DeviceUtil.isMobileControls() then
        if v18 == 0 then
            return ClientStore:getState().Settings.fov;
        end;

        return ClientStore:getState().Settings.fov - 10;
    end;

    if v18 == 0 then
        return ClientStore:getState().Settings.fov;
    end;

    return ClientStore:getState().Settings.fov - 10;
end;

function u4.setFOV(p19, p20) -- Line: 117
    -- upvalues: KnitClient (copy), DeviceUtil (copy), Workspace (copy)
    local v21 = KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective();

    if DeviceUtil.isMobileControls() then
        if v21 ~= 0 then
            p20 = p20 - 10;
        end;
    elseif v21 == 0 then
        p20 = p20 + 0;
    else
        p20 = p20 - 10;
    end;

    Workspace.CurrentCamera.FieldOfView = p20 * p19.fovMultiplier;
    p19.fov = p20 * p19.fovMultiplier;
end;

function u4.playUIOpenFOVTween(u22) -- Line: 133
    -- upvalues: Workspace (copy), TweenService (copy)
    local v23 = TweenService:Create(Workspace.CurrentCamera, TweenInfo.new(0.22, Enum.EasingStyle.Cubic), {
        FieldOfView = u22:getBaseFOV() + 10
    });
    u22.activeFOVTween = v23;

    if next(u22.fovOverrides) ~= nil then
        return v23;
    end;

    v23:Play();
    local u24 = nil;
    local u25 = v23.Completed:Once(function() -- Line: 144
        -- upvalues: u22 (copy), u24 (ref)
        u22.activeFOVTween = nil;
        u24:Disconnect();
    end);
    u24 = v23.Destroying:Once(function() -- Line: 148
        -- upvalues: u22 (copy), u25 (copy)
        u22.activeFOVTween = nil;
        u25:Disconnect();
    end);

    return v23;
end;

function u4.playUICloseFOVTween(u26) -- Line: 154
    -- upvalues: Workspace (copy), TweenService (copy)
    local v27 = TweenService:Create(Workspace.CurrentCamera, TweenInfo.new(0.22, Enum.EasingStyle.Cubic), {
        FieldOfView = u26:getBaseFOV()
    });
    u26.activeFOVTween = v27;

    if next(u26.fovOverrides) ~= nil then
        return v27;
    end;

    v27:Play();
    local u28 = nil;
    local u29 = v27.Completed:Once(function() -- Line: 165
        -- upvalues: u26 (copy), u28 (ref)
        u26.activeFOVTween = nil;
        u28:Disconnect();
    end);
    u28 = v27.Destroying:Once(function() -- Line: 169
        -- upvalues: u26 (copy), u29 (copy)
        u26.activeFOVTween = nil;
        u29:Disconnect();
    end);

    return v27;
end;

function u4.setFOVOverride(p30, p31, p32, p33) -- Line: 175
    p30.fovOverrides[p31] = {
        fov = p32,
        priority = p33
    };
end;

function u4.removeFOVOverride(p34, p35) -- Line: 184
    p34.fovOverrides[p35] = nil;
end;

function u4.disableActiveTween(p36) -- Line: 189
    local activeFOVTween = p36.activeFOVTween;

    if activeFOVTween ~= nil then
        activeFOVTween:Destroy();
    end;
end;

KnitClient.CreateController(u4.new());

return nil;