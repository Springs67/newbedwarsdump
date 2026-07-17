-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local GuiService = v2.GuiService;
local Players = v2.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u3 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "player-cameras-module");
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "ShiftLockController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 23
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "ShiftLockController";
    p6.disablers = {};
end;

function u4.KnitStart(u7) -- Line: 32
    -- upvalues: Players (copy), ClientSyncEvents (copy), u3 (copy), GuiService (copy)
    local PlayerScripts = Players.LocalPlayer:WaitForChild("PlayerScripts");

    if PlayerScripts ~= nil then
        PlayerScripts = PlayerScripts:FindFirstChild("MouseLockController", true);
    end;

    if not PlayerScripts then
        return nil;
    end;

    PlayerScripts:GetAttributeChangedSignal("MouseLocked"):Connect(function() -- Line: 43
        -- upvalues: ClientSyncEvents (ref), PlayerScripts (copy)
        local ShiftLockToggle = ClientSyncEvents.ShiftLockToggle;
        local v8 = PlayerScripts:GetAttribute("MouseLocked");

        if v8 == nil then
            v8 = false;
        end;

        ShiftLockToggle:fire(v8);
    end);
    u7.boundKeys = PlayerScripts:WaitForChild("BoundKeys");

    if not u7.boundKeys then
        return nil;
    end;

    local UserGameSettings = UserSettings():GetService("UserGameSettings");
    UserGameSettings:GetPropertyChangedSignal("ControlMode"):Connect(function() -- Line: 57
        -- upvalues: u7 (copy), UserGameSettings (copy), u3 (ref)
        if not u7:isShiftLockAllowed() then
            return nil;
        end;

        local activeCameraController = u3.activeCameraController;

        if UserGameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch then
            activeCameraController:SetIsMouseLocked(true);

            return;
        end;

        activeCameraController:SetIsMouseLocked(false);
    end);
    ClientSyncEvents.AppClose:connect(function() -- Line: 72
        -- upvalues: GuiService (ref)
        GuiService.SelectedObject = nil;
    end);
    u7:bindGamepadShiftLock();
    u7:refreshBoundKeys();
end;

function u4.bindGamepadShiftLock(u9) -- Line: 80
    -- upvalues: u3 (copy), Flamework (copy)
    local v10 = u3;
    local activeCameraController = v10.activeCameraController;
    local activeMouseLockController = v10.activeMouseLockController;
    local u11 = activeMouseLockController:GetIsMouseLocked();

    local function u12() -- Line: 85
        -- upvalues: u11 (ref), activeMouseLockController (copy), activeCameraController (copy)
        u11 = not u11;

        if not u11 then
            activeCameraController:SetIsMouseLocked(false);

            return;
        end;

        if activeMouseLockController:GetIsMouseLocked() then
            activeMouseLockController:OnMouseLockToggled();
        end;

        activeCameraController:SetMouseLockOffset((Vector3.new()));
        activeCameraController:SetIsMouseLocked(true);
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        actionId = "GamepadToggleShiftLock",
        action = "ToggleShiftLock",

        boundFunction = function(p13, p14, p15) -- Line: 101, Name: boundFunction
            -- upvalues: u9 (copy), u12 (copy)
            if p14 == Enum.UserInputState.End and u9:isShiftLockAllowed() then
                u12();
            end;
        end
    });
end;

function u4.refreshBoundKeys(p16) -- Line: 110
    if not p16.boundKeys then
        return nil;
    end;

    local v17 = p16:isShiftLockAllowed();
    p16.boundKeys.Value = v17 and "LeftControl,RightControl" or "";
end;

function u4.registerShiftLockControlDisabler(u18, u19) -- Line: 117
    -- upvalues: u1 (copy)
    u18.disablers[u19] = true;
    u18:refreshBoundKeys();
    local v20 = u1.new();
    v20:GiveTask(function() -- Line: 123
        -- upvalues: u18 (copy), u19 (copy)
        return u18:unregisterShiftLockControlDisabler(u19);
    end);

    return v20;
end;

function u4.unregisterShiftLockControlDisabler(p21, p22) -- Line: 128
    p21.disablers[p22] = nil;
    p21:refreshBoundKeys();
end;

function u4.isShiftLockAllowed(p23) -- Line: 134
    local v24 = 0;

    for _ in p23.disablers do
        v24 = v24 + 1;
    end;

    return v24 == 0;
end;

return {
    ShiftLockController = KnitClient.CreateController(u4.new())
};