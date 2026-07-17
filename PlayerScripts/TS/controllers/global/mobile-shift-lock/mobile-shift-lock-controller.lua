-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local RunService = v3.RunService;
local UserInputService = v3.UserInputService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;

local function WithCharacter(u4) -- Line: 15
    -- upvalues: Players (copy), RuntimeLib (copy)
    if Players.LocalPlayer.Character then
        u4(Players.LocalPlayer.Character);

        return nil;
    end;

    RuntimeLib.Promise.try(function() -- Line: 20
        -- upvalues: Players (ref)
        return Players.LocalPlayer.CharacterAdded:Wait();
    end):andThen(function() -- Line: 23
        -- upvalues: u4 (copy), Players (ref)
        u4(Players.LocalPlayer.Character);
    end);
end;

local function WithHumanoid(u5) -- Line: 28
    -- upvalues: WithCharacter (copy), RuntimeLib (copy)
    WithCharacter(function(u6) -- Line: 29
        -- upvalues: RuntimeLib (ref), u5 (copy)
        RuntimeLib.Promise.try(function() -- Line: 30
            -- upvalues: u6 (copy)
            return u6:WaitForChild("Humanoid");
        end):andThen(function(p7) -- Line: 33
            -- upvalues: u5 (ref)
            u5(p7);
        end);
    end);
end;

local u8 = setmetatable({}, {
    __tostring = function() -- Line: 43, Name: __tostring
        return "MobileShiftLockController";
    end,

    __index = KnitController
});
u8.__index = u8;

function u8.new(...) -- Line: 49
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10, ...) -- Line: 53
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p10, ...);
    p10.Name = "MobileShiftLockController";
    p10.maid = u1.new();
    p10.enabled = false;
    p10.blocked = false;
end;

function u8.KnitStart(u11) -- Line: 60
    -- upvalues: KnitController (copy), DeviceUtil (copy), ClientStore (copy)
    KnitController.KnitStart(u11);

    if not DeviceUtil.isMobileControls() then
        return nil;
    end;

    ClientStore.changed:connect(function(p12, p13) -- Line: 65
        -- upvalues: u11 (copy)
        if p12.Settings.mobileShiftLock ~= p13.Settings.mobileShiftLock then
            if p12.Settings.mobileShiftLock then
                u11:enable(false);

                return;
            end;

            u11:disable(false);
        end;
    end);
end;

function u8.enable(u14, p15) -- Line: 75
    -- upvalues: DeviceUtil (copy), default (copy), ClientStore (copy), WithCharacter (copy), RuntimeLib (copy), RunService (copy), Workspace (copy), u2 (copy), Players (copy), UserInputService (copy)
    if u14.blocked then
        return nil;
    end;

    if not DeviceUtil.isMobileControls() then
        return nil;
    end;

    u14:disable(false);

    if p15 == nil and true or p15 then
        default.Client:WaitFor("ToggleMobileShiftLock"):andThen(function(p16) -- Line: 88
            p16:SendToServer({
                enabled = true
            });
        end);
        ClientStore:dispatch({
            type = "SettingsUpdateSome",
            settings = {
                mobileShiftLock = true
            }
        });
    end;

    u14.enabled = true;
    u14.maid:GiveTask(function() -- Line: 102
        -- upvalues: u14 (copy)
        u14.enabled = false;
    end);
    u14.maid:GiveTask(function() -- Line: 105
        -- upvalues: u14 (copy)
        u14.savedFrame = nil;
    end);
    local RotationType = UserSettings():GetService("UserGameSettings").RotationType;
    u14.maid:GiveTask(function() -- Line: 109
        -- upvalues: RotationType (copy)
        UserSettings():GetService("UserGameSettings").RotationType = RotationType;
    end);
    UserSettings():GetService("UserGameSettings").RotationType = Enum.RotationType.CameraRelative;

    local function u18(u17) -- Line: 113
        -- upvalues: u14 (copy)
        local AutoRotate = u17.AutoRotate;
        u14.maid:GiveTask(function() -- Line: 115
            -- upvalues: u17 (copy), AutoRotate (copy)
            u17.AutoRotate = AutoRotate;
        end);
        u17.AutoRotate = false;
    end;

    WithCharacter(function(u19) -- Line: 29
        -- upvalues: RuntimeLib (ref), u18 (copy)
        RuntimeLib.Promise.try(function() -- Line: 30
            -- upvalues: u19 (copy)
            return u19:WaitForChild("Humanoid");
        end):andThen(function(p20) -- Line: 33
            -- upvalues: u18 (ref)
            u18(p20);
        end);
    end);
    RunService:BindToRenderStep("MSL_PreCamera", Enum.RenderPriority.Camera.Value - 1, function() -- Line: 120
        -- upvalues: Workspace (ref), u14 (copy)
        local CurrentCamera = Workspace.CurrentCamera;

        if u14.savedFrame then
            CurrentCamera.CFrame = u14.savedFrame;
        end;
    end);
    local u21 = u2.mount(u2.createFragment({
        MouseIcon = u2.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u2.createElement("ImageLabel", {
                Image = "rbxassetid://7368844459",
                BackgroundTransparency = 1,
                Size = UDim2.fromOffset(6, 6),
                Position = UDim2.new(0.5, 0, 0.5, -game:GetService("GuiService"):GetGuiInset().Y / 2)
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) }) })
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    u14.maid:GiveTask(function() -- Line: 142
        -- upvalues: u2 (ref), u21 (copy)
        u2.unmount(u21);
    end);
    local MouseBehavior = UserInputService.MouseBehavior;
    local MouseIconEnabled = UserInputService.MouseIconEnabled;
    u14.maid:GiveTask(function() -- Line: 147
        -- upvalues: UserInputService (ref), MouseBehavior (copy), MouseIconEnabled (copy)
        UserInputService.MouseBehavior = MouseBehavior;
        UserInputService.MouseIconEnabled = MouseIconEnabled;
    end);
    Players.LocalPlayer.CameraMinZoomDistance = 14;
    Players.LocalPlayer.CameraMaxZoomDistance = 14;
    u14.maid:GiveTask(function() -- Line: 153
        -- upvalues: Players (ref)
        Players.LocalPlayer.CameraMinZoomDistance = 0;
        Players.LocalPlayer.CameraMaxZoomDistance = 14;
    end);
    RunService:BindToRenderStep("MSL_PostCamera", Enum.RenderPriority.Camera.Value + 1, function() -- Line: 157
        -- upvalues: UserInputService (ref), Workspace (ref), u14 (copy), WithCharacter (ref), RuntimeLib (ref)
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter;
        UserInputService.MouseIconEnabled = false;
        local CurrentCamera = Workspace.CurrentCamera;
        u14.savedFrame = CurrentCamera.CFrame;

        local function u24(p22) -- Line: 162
            -- upvalues: CurrentCamera (copy)
            local RootPart = p22.RootPart;
            local CFrame2 = RootPart.CFrame;
            local _, _, _ = CFrame2:ToOrientation();
            local _, v23 = CurrentCamera.CFrame:ToOrientation();
            RootPart.CFrame = CFrame.new(CFrame2.Position) * CFrame.Angles(0, v23, 0);
            CurrentCamera.CFrame = CurrentCamera.CFrame * CFrame.new(Vector3.new(2, 0, 0));
        end;

        WithCharacter(function(u25) -- Line: 29
            -- upvalues: RuntimeLib (ref), u24 (copy)
            RuntimeLib.Promise.try(function() -- Line: 30
                -- upvalues: u25 (copy)
                return u25:WaitForChild("Humanoid");
            end):andThen(function(p26) -- Line: 33
                -- upvalues: u24 (ref)
                u24(p26);
            end);
        end);
    end);
    u14.maid:GiveTask(function() -- Line: 176
        -- upvalues: RunService (ref)
        RunService:UnbindFromRenderStep("MSL_PreCamera");
        RunService:UnbindFromRenderStep("MSL_PostCamera");
    end);
end;

function u8.disable(p27, p28) -- Line: 181
    -- upvalues: default (copy), ClientStore (copy)
    p27.maid:DoCleaning();

    if p28 == nil and true or p28 then
        default.Client:WaitFor("ToggleMobileShiftLock"):andThen(function(p29) -- Line: 188
            p29:SendToServer({
                enabled = false
            });
        end);
        ClientStore:dispatch({
            type = "SettingsUpdateSome",
            settings = {
                mobileShiftLock = false
            }
        });
    end;
end;

function u8.isEnabled(p30) -- Line: 202
    return p30.enabled;
end;

function u8.blockShiftLock(p31, p32) -- Line: 205
    -- upvalues: ClientStore (copy)
    p31.blocked = p32;

    if p32 then
        p31:disable(false);

        return;
    end;

    if not p32 and ClientStore:getState().Settings.mobileShiftLock then
        p31:enable(false);
    end;
end;

KnitClient.CreateController(u8.new());

return nil;