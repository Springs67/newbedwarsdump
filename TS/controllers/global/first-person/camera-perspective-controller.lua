-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v1.ContextActionService;
local Players = v1.Players;
local RunService = v1.RunService;
local Workspace = v1.Workspace;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local Setting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "CameraPerspectiveController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 24
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 28
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p5);
    p5.Name = "CameraPerspectiveController";
    p5.PerspectiveChanged = u2.new();
    p5.cachedCameraPerspective = 1;
end;

function u3.KnitStart(u6) -- Line: 34
    -- upvalues: RunService (copy), ClientSyncEvents (copy), Setting (copy), Players (copy), KnitClient (copy), ContextActionService (copy)
    RunService:BindToRenderStep("perspective-check", Enum.RenderPriority.Camera.Value, function(p7) -- Line: 35
        -- upvalues: u6 (copy)
        local cachedCameraPerspective = u6.cachedCameraPerspective;
        u6.cachedCameraPerspective = u6:calculateCameraPerspective();

        if cachedCameraPerspective ~= u6.cachedCameraPerspective then
            u6.PerspectiveChanged:Fire(u6.cachedCameraPerspective);
        end;
    end);
    ClientSyncEvents.SettingChanged:connect(function(p8) -- Line: 42
        -- upvalues: Setting (ref), u6 (copy), Players (ref), KnitClient (ref), ContextActionService (ref)
        if p8.setting ~= Setting.LOCK_CAMERA then
            return nil;
        end;

        local value = p8.value;

        if value == 0 or (value ~= value or not value) then
            Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic;
            KnitClient.Controllers.MobileShiftLockController:blockShiftLock(false);
            ContextActionService:UnbindAction("DisableMouseWheel");
            ContextActionService:UnbindAction("DisableBaseCameraKeyboardZoom");
        else
            if u6.cachedCameraPerspective == 0 then
                Players.LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson;
                KnitClient.Controllers.MobileShiftLockController:blockShiftLock(true);

                return;
            end;

            if u6.cachedCameraPerspective == 1 then
                ContextActionService:BindAction("DisableMouseWheel", function(p9, p10, p11) -- Line: 54
                    return Enum.ContextActionResult.Sink;
                end, false, Enum.UserInputType.MouseWheel);
                ContextActionService:BindActionAtPriority("DisableBaseCameraKeyboardZoom", function() -- Line: 58
                    return Enum.ContextActionResult.Sink;
                end, false, 2001, Enum.KeyCode.I, Enum.KeyCode.O);
            end;
        end;
    end);
end;

function u3.calculateCameraPerspective(p12) -- Line: 71
    -- upvalues: Workspace (copy)
    return Workspace.CurrentCamera and ((Workspace.CurrentCamera.CFrame.Position - Workspace.CurrentCamera.Focus.Position).Magnitude <= 1 and 0 or 1) or p12.cachedCameraPerspective;
end;

function u3.getCameraPerspective(p13) -- Line: 83
    return p13.cachedCameraPerspective;
end;

return {
    CameraPerspectiveController = KnitClient.CreateController(u3.new())
};