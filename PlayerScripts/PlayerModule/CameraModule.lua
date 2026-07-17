-- Decompiled with Potassium's decompiler.

local u1 = {};
u1.__index = u1;
local u2 = { "CameraMinZoomDistance", "CameraMaxZoomDistance", "CameraMode", "DevCameraOcclusionMode", "DevComputerCameraMode", "DevTouchCameraMode", "DevComputerMovementMode", "DevTouchMovementMode", "DevEnableMouseLock" };
local u3 = { "ComputerCameraMovementMode", "ComputerMovementMode", "ControlMode", "GamepadCameraSensitivity", "MouseSensitivity", "RotationType", "TouchCameraMovementMode", "TouchMovementMode" };
local Players = game:GetService("Players");
local RunService = game:GetService("RunService");
local UserInputService = game:GetService("UserInputService");
local VRService = game:GetService("VRService");
local UserGameSettings = UserSettings():GetService("UserGameSettings");
local CommonUtils = script.Parent:WaitForChild("CommonUtils");
local ConnectionUtil = require(CommonUtils:WaitForChild("ConnectionUtil"));
local FlagUtil = require(CommonUtils:WaitForChild("FlagUtil"));
local CameraUtils = require(script:WaitForChild("CameraUtils"));
local CameraInput = require(script:WaitForChild("CameraInput"));
local ClassicCamera = require(script:WaitForChild("ClassicCamera"));
local OrbitalCamera = require(script:WaitForChild("OrbitalCamera"));
local LegacyCamera = require(script:WaitForChild("LegacyCamera"));
local VehicleCamera = require(script:WaitForChild("VehicleCamera"));
local VRCamera = require(script:WaitForChild("VRCamera"));
local VRVehicleCamera = require(script:WaitForChild("VRVehicleCamera"));
local Invisicam = require(script:WaitForChild("Invisicam"));
local Poppercam = require(script:WaitForChild("Poppercam"));
local TransparencyController = require(script:WaitForChild("TransparencyController"));
local MouseLockController = require(script:WaitForChild("MouseLockController"));
local u4 = {};
local u5 = {};
local PlayerScripts = Players.LocalPlayer:WaitForChild("PlayerScripts");
PlayerScripts:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Default);
PlayerScripts:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Follow);
PlayerScripts:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Classic);
PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Default);
PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Follow);
PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Classic);
PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.CameraToggle);
local u6 = FlagUtil.getUserFlag("UserRespectLegacyCameraOptions");
local u7 = FlagUtil.getUserFlag("UserPlayerConnectionMemoryLeak");

function u1.new() -- Line: 101
    -- upvalues: u1 (copy), u7 (copy), ConnectionUtil (copy), Players (copy), TransparencyController (copy), UserInputService (copy), MouseLockController (copy), u6 (copy), RunService (copy), u2 (copy), u3 (copy), UserGameSettings (copy)
    local u8 = setmetatable({}, u1);
    u8.activeCameraController = nil;
    u8.activeOcclusionModule = nil;
    u8.activeTransparencyController = nil;
    u8.activeMouseLockController = nil;
    u8.currentComputerCameraMovementMode = nil;
    u8.cameraSubjectChangedConn = nil;
    u8.cameraTypeChangedConn = nil;

    if u7 then
        u8.connectionUtil = ConnectionUtil.new();
    end;

    for _, v in pairs(Players:GetPlayers()) do
        u8:OnPlayerAdded(v);
    end;

    Players.PlayerAdded:Connect(function(p9) -- Line: 126
        -- upvalues: u8 (copy)
        u8:OnPlayerAdded(p9);
    end);

    if u7 then
        Players.PlayerRemoving:Connect(function(p10) -- Line: 131
            -- upvalues: u8 (copy)
            u8:OnPlayerRemoving(p10);
        end);
    end;

    u8.activeTransparencyController = TransparencyController.new();
    u8.activeTransparencyController:Enable(true);

    if not UserInputService.TouchEnabled then
        u8.activeMouseLockController = MouseLockController.new();
        local v11 = u8.activeMouseLockController:GetBindableToggleEvent();

        if v11 then
            v11:Connect(function() -- Line: 143
                -- upvalues: u8 (copy)
                u8:OnMouseLockToggled();
            end);
        end;
    end;

    if u6 then
        u8:ActivateCameraController();
    else
        u8:ActivateCameraController(u8:GetCameraControlChoice());
    end;

    u8:ActivateOcclusionModule(Players.LocalPlayer.DevCameraOcclusionMode);
    u8:OnCurrentCameraChanged();
    RunService:BindToRenderStep("cameraRenderUpdate", Enum.RenderPriority.Camera.Value, function(p12) -- Line: 156
        -- upvalues: u8 (copy)
        u8:Update(p12);
    end);

    for _, v in pairs(u2) do
        Players.LocalPlayer:GetPropertyChangedSignal(v):Connect(function() -- Line: 160
            -- upvalues: u8 (copy), v (copy)
            u8:OnLocalPlayerCameraPropertyChanged(v);
        end);
    end;

    for _, v in pairs(u3) do
        UserGameSettings:GetPropertyChangedSignal(v):Connect(function() -- Line: 166
            -- upvalues: u8 (copy), v (copy)
            u8:OnUserGameSettingsPropertyChanged(v);
        end);
    end;

    game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() -- Line: 170
        -- upvalues: u8 (copy)
        u8:OnCurrentCameraChanged();
    end);

    return u8;
end;

function u1.GetCameraMovementModeFromSettings(p13) -- Line: 177
    -- upvalues: Players (copy), CameraUtils (copy), UserInputService (copy), UserGameSettings (copy)
    if Players.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
        return CameraUtils.ConvertCameraModeEnumToStandard(Enum.ComputerCameraMovementMode.Classic);
    end;

    local v14, v15;

    if UserInputService.TouchEnabled then
        v14 = CameraUtils.ConvertCameraModeEnumToStandard(Players.LocalPlayer.DevTouchCameraMode);
        v15 = CameraUtils.ConvertCameraModeEnumToStandard(UserGameSettings.TouchCameraMovementMode);
    else
        v14 = CameraUtils.ConvertCameraModeEnumToStandard(Players.LocalPlayer.DevComputerCameraMode);
        v15 = CameraUtils.ConvertCameraModeEnumToStandard(UserGameSettings.ComputerCameraMovementMode);
    end;

    if v14 == Enum.DevComputerCameraMovementMode.UserChoice then
        return v15;
    end;

    return v14;
end;

function u1.ActivateOcclusionModule(p16, p17) -- Line: 202
    -- upvalues: Poppercam (copy), Invisicam (copy), u5 (copy), Players (copy)
    local v18;

    if p17 == Enum.DevCameraOcclusionMode.Zoom then
        v18 = Poppercam;
    else
        if p17 ~= Enum.DevCameraOcclusionMode.Invisicam then
            warn("CameraScript ActivateOcclusionModule called with unsupported mode");

            return;
        end;

        v18 = Invisicam;
    end;

    p16.occlusionMode = p17;

    if p16.activeOcclusionModule and p16.activeOcclusionModule:GetOcclusionMode() == p17 then
        if not p16.activeOcclusionModule:GetEnabled() then
            p16.activeOcclusionModule:Enable(true);
        end;

        return;
    end;

    local activeOcclusionModule = p16.activeOcclusionModule;
    p16.activeOcclusionModule = u5[v18];

    if not p16.activeOcclusionModule then
        p16.activeOcclusionModule = v18.new();

        if p16.activeOcclusionModule then
            u5[v18] = p16.activeOcclusionModule;
        end;
    end;

    if p16.activeOcclusionModule then
        if p16.activeOcclusionModule:GetOcclusionMode() ~= p17 then
            warn("CameraScript ActivateOcclusionModule mismatch: ", p16.activeOcclusionModule:GetOcclusionMode(), "~=", p17);
        end;

        if activeOcclusionModule then
            if activeOcclusionModule == p16.activeOcclusionModule then
                warn("CameraScript ActivateOcclusionModule failure to detect already running correct module");
            else
                activeOcclusionModule:Enable(false);
            end;
        end;

        if p17 == Enum.DevCameraOcclusionMode.Invisicam then
            if Players.LocalPlayer.Character then
                p16.activeOcclusionModule:CharacterAdded(Players.LocalPlayer.Character, Players.LocalPlayer);
            end;
        else
            for _, v in pairs(Players:GetPlayers()) do
                if v and v.Character then
                    p16.activeOcclusionModule:CharacterAdded(v.Character, v);
                end;
            end;

            p16.activeOcclusionModule:OnCameraSubjectChanged(game.Workspace.CurrentCamera.CameraSubject);
        end;

        p16.activeOcclusionModule:Enable(true);
    end;
end;

function u1.ShouldUseVehicleCamera(p19) -- Line: 281
    local CurrentCamera = workspace.CurrentCamera;

    if not CurrentCamera then
        return false;
    end;

    local CameraType = CurrentCamera.CameraType;
    local CameraSubject = CurrentCamera.CameraSubject;
    local v20 = CameraType == Enum.CameraType.Custom and true or CameraType == Enum.CameraType.Follow;
    local v21 = CameraSubject and CameraSubject:IsA("VehicleSeat") or false;
    local v22 = p19.occlusionMode ~= Enum.DevCameraOcclusionMode.Invisicam;

    if v21 then
        if not v20 then
            v22 = v20;
        end;
    else
        v22 = v21;
    end;

    return v22;
end;

function u1.ActivateCameraController(p23, p24, p25) -- Line: 297
    -- upvalues: u6 (copy), LegacyCamera (copy), VRService (copy), VRCamera (copy), ClassicCamera (copy), OrbitalCamera (copy), VRVehicleCamera (copy), VehicleCamera (copy), u4 (copy)
    if u6 then
        p25 = workspace.CurrentCamera.CameraType;
        p24 = p23:GetCameraMovementModeFromSettings();
    end;

    local v26 = nil;

    if u6 and true or p25 ~= nil then
        if p25 == Enum.CameraType.Scriptable then
            if p23.activeCameraController then
                p23.activeCameraController:Enable(false);
                p23.activeCameraController = nil;
            end;

            return;
        end;

        if p25 == Enum.CameraType.Custom then
            p24 = p23:GetCameraMovementModeFromSettings();
        elseif p25 == Enum.CameraType.Track then
            p24 = Enum.ComputerCameraMovementMode.Classic;
        elseif p25 == Enum.CameraType.Follow then
            p24 = Enum.ComputerCameraMovementMode.Follow;
        elseif p25 == Enum.CameraType.Orbital then
            p24 = Enum.ComputerCameraMovementMode.Orbital;
        elseif p25 == Enum.CameraType.Attach or (p25 == Enum.CameraType.Watch or p25 == Enum.CameraType.Fixed) then
            v26 = LegacyCamera;
        else
            warn("CameraScript encountered an unhandled Camera.CameraType value: ", p25);
        end;
    end;

    if not v26 then
        if VRService.VREnabled then
            v26 = VRCamera;
        elseif p24 == Enum.ComputerCameraMovementMode.Classic or (p24 == Enum.ComputerCameraMovementMode.Follow or (p24 == Enum.ComputerCameraMovementMode.Default or p24 == Enum.ComputerCameraMovementMode.CameraToggle)) then
            v26 = ClassicCamera;
        else
            if p24 ~= Enum.ComputerCameraMovementMode.Orbital then
                warn("ActivateCameraController did not select a module.");

                return;
            end;

            v26 = OrbitalCamera;
        end;
    end;

    if p23:ShouldUseVehicleCamera() then
        if VRService.VREnabled then
            v26 = VRVehicleCamera;
        else
            v26 = VehicleCamera;
        end;
    end;

    local v27;

    if u4[v26] then
        v27 = u4[v26];

        if v27.Reset then
            v27:Reset();
        end;
    else
        v27 = v26.new();
        u4[v26] = v27;
    end;

    if p23.activeCameraController then
        if p23.activeCameraController == v27 then
            if not p23.activeCameraController:GetEnabled() then
                p23.activeCameraController:Enable(true);
            end;
        else
            p23.activeCameraController:Enable(false);
            p23.activeCameraController = v27;
            p23.activeCameraController:Enable(true);
        end;
    elseif v27 ~= nil then
        p23.activeCameraController = v27;
        p23.activeCameraController:Enable(true);
    end;

    if p23.activeCameraController then
        if u6 then
            p23.activeCameraController:SetCameraMovementMode(p24);
            p23.activeCameraController:SetCameraType(p25);

            return;
        end;

        if p24 ~= nil then
            p23.activeCameraController:SetCameraMovementMode(p24);

            return;
        end;

        if p25 ~= nil then
            p23.activeCameraController:SetCameraType(p25);
        end;
    end;
end;

function u1.OnCameraSubjectChanged(p28) -- Line: 409
    local CurrentCamera = workspace.CurrentCamera;
    local v29;

    if CurrentCamera then
        v29 = CurrentCamera.CameraSubject;
    else
        v29 = CurrentCamera;
    end;

    if p28.activeTransparencyController then
        p28.activeTransparencyController:SetSubject(v29);
    end;

    if p28.activeOcclusionModule then
        p28.activeOcclusionModule:OnCameraSubjectChanged(v29);
    end;

    p28:ActivateCameraController(nil, CurrentCamera.CameraType);
end;

function u1.OnCameraTypeChanged(p30, p31) -- Line: 424
    -- upvalues: UserInputService (copy), CameraUtils (copy)
    if p31 == Enum.CameraType.Scriptable and UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
        CameraUtils.restoreMouseBehavior();
    end;

    p30:ActivateCameraController(nil, p31);
end;

function u1.OnCurrentCameraChanged(u32) -- Line: 436
    local CurrentCamera = game.Workspace.CurrentCamera;

    if not CurrentCamera then
        return;
    end;

    if u32.cameraSubjectChangedConn then
        u32.cameraSubjectChangedConn:Disconnect();
    end;

    if u32.cameraTypeChangedConn then
        u32.cameraTypeChangedConn:Disconnect();
    end;

    u32.cameraSubjectChangedConn = CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function() -- Line: 448
        -- upvalues: u32 (copy), CurrentCamera (copy)
        u32:OnCameraSubjectChanged(CurrentCamera.CameraSubject);
    end);
    u32.cameraTypeChangedConn = CurrentCamera:GetPropertyChangedSignal("CameraType"):Connect(function() -- Line: 452
        -- upvalues: u32 (copy), CurrentCamera (copy)
        u32:OnCameraTypeChanged(CurrentCamera.CameraType);
    end);
    u32:OnCameraSubjectChanged(CurrentCamera.CameraSubject);
    u32:OnCameraTypeChanged(CurrentCamera.CameraType);
end;

function u1.OnLocalPlayerCameraPropertyChanged(p33, p34) -- Line: 460
    -- upvalues: Players (copy), CameraUtils (copy)
    if p34 == "CameraMode" then
        if Players.LocalPlayer.CameraMode ~= Enum.CameraMode.LockFirstPerson then
            if Players.LocalPlayer.CameraMode ~= Enum.CameraMode.Classic then
                warn("Unhandled value for property player.CameraMode: ", Players.LocalPlayer.CameraMode);

                return;
            end;

            local v35 = p33:GetCameraMovementModeFromSettings();
            p33:ActivateCameraController(CameraUtils.ConvertCameraModeEnumToStandard(v35));

            return;
        end;

        if not p33.activeCameraController or p33.activeCameraController:GetModuleName() ~= "ClassicCamera" then
            p33:ActivateCameraController(CameraUtils.ConvertCameraModeEnumToStandard(Enum.DevComputerCameraMovementMode.Classic));
        end;

        if p33.activeCameraController then
            p33.activeCameraController:UpdateForDistancePropertyChange();
        end;
    else
        if p34 == "DevComputerCameraMode" or p34 == "DevTouchCameraMode" then
            local v36 = p33:GetCameraMovementModeFromSettings();
            p33:ActivateCameraController(CameraUtils.ConvertCameraModeEnumToStandard(v36));

            return;
        end;

        if p34 == "DevCameraOcclusionMode" then
            p33:ActivateOcclusionModule(Players.LocalPlayer.DevCameraOcclusionMode);

            return;
        end;

        if p34 == "CameraMinZoomDistance" or p34 == "CameraMaxZoomDistance" then
            if p33.activeCameraController then
                p33.activeCameraController:UpdateForDistancePropertyChange();
            end;
        else
            if p34 == "DevTouchMovementMode" then
                return;
            end;

            if p34 == "DevComputerMovementMode" then
                return;
            end;

            local _ = p34 == "DevEnableMouseLock";
        end;
    end;
end;

function u1.OnUserGameSettingsPropertyChanged(p37, p38) -- Line: 504
    -- upvalues: CameraUtils (copy)
    if p38 == "ComputerCameraMovementMode" then
        local v39 = p37:GetCameraMovementModeFromSettings();
        p37:ActivateCameraController(CameraUtils.ConvertCameraModeEnumToStandard(v39));
    end;
end;

function u1.Update(p40, p41) -- Line: 517
    -- upvalues: CameraInput (copy)
    if p40.activeCameraController then
        p40.activeCameraController:UpdateMouseBehavior();
        local v42, v43 = p40.activeCameraController:Update(p41);

        if p40.activeOcclusionModule then
            v42, v43 = p40.activeOcclusionModule:Update(p41, v42, v43);
        end;

        local CurrentCamera = game.Workspace.CurrentCamera;
        CurrentCamera.CFrame = v42;
        CurrentCamera.Focus = v43;

        if p40.activeTransparencyController then
            p40.activeTransparencyController:Update(p41);
        end;

        if CameraInput.getInputEnabled() then
            CameraInput.resetInputForFrameEnd();
        end;
    end;
end;

if not u6 then
    function u1.GetCameraControlChoice(p44) -- Line: 546
        -- upvalues: Players (copy), UserInputService (copy), CameraUtils (copy), UserGameSettings (copy)
        local LocalPlayer = Players.LocalPlayer;

        if LocalPlayer then
            if UserInputService:GetLastInputType() == Enum.UserInputType.Touch or UserInputService.TouchEnabled then
                if LocalPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice then
                    return CameraUtils.ConvertCameraModeEnumToStandard(UserGameSettings.TouchCameraMovementMode);
                end;

                return CameraUtils.ConvertCameraModeEnumToStandard(LocalPlayer.DevTouchCameraMode);
            end;

            if LocalPlayer.DevComputerCameraMode ~= Enum.DevComputerCameraMovementMode.UserChoice then
                return CameraUtils.ConvertCameraModeEnumToStandard(LocalPlayer.DevComputerCameraMode);
            end;

            local v45 = CameraUtils.ConvertCameraModeEnumToStandard(UserGameSettings.ComputerCameraMovementMode);

            return CameraUtils.ConvertCameraModeEnumToStandard(v45);
        end;
    end;
end;

function u1.OnCharacterAdded(p46, p47, p48) -- Line: 570
    if p46.activeOcclusionModule then
        p46.activeOcclusionModule:CharacterAdded(p47, p48);
    end;
end;

function u1.OnCharacterRemoving(p49, p50, p51) -- Line: 576
    if p49.activeOcclusionModule then
        p49.activeOcclusionModule:CharacterRemoving(p50, p51);
    end;
end;

function u1.OnPlayerAdded(u52, u53) -- Line: 582
    -- upvalues: u7 (copy)
    if u7 then
        u52.connectionUtil:trackConnection(`{u53.UserId}CharacterAdded`, u53.CharacterAdded:Connect(function(p54) -- Line: 584
            -- upvalues: u52 (copy), u53 (copy)
            u52:OnCharacterAdded(p54, u53);
        end));
        u52.connectionUtil:trackConnection(`{u53.UserId}CharacterRemoving`, u53.CharacterRemoving:Connect(function(p55) -- Line: 587
            -- upvalues: u52 (copy), u53 (copy)
            u52:OnCharacterRemoving(p55, u53);
        end));

        return;
    end;

    u53.CharacterAdded:Connect(function(p56) -- Line: 591
        -- upvalues: u52 (copy), u53 (copy)
        u52:OnCharacterAdded(p56, u53);
    end);
    u53.CharacterRemoving:Connect(function(p57) -- Line: 594
        -- upvalues: u52 (copy), u53 (copy)
        u52:OnCharacterRemoving(p57, u53);
    end);
end;

function u1.OnPlayerRemoving(p58, p59) -- Line: 600
    p58.connectionUtil:disconnect((`{p59.UserId}CharacterAdded`));
    p58.connectionUtil:disconnect((`{p59.UserId}CharacterRemoving`));
end;

function u1.OnMouseLockToggled(p60) -- Line: 605
    if p60.activeMouseLockController then
        local v61 = p60.activeMouseLockController:GetIsMouseLocked();
        local v62 = p60.activeMouseLockController:GetMouseLockOffset();

        if p60.activeCameraController then
            p60.activeCameraController:SetIsMouseLocked(v61);
            p60.activeCameraController:SetMouseLockOffset(v62);
        end;
    end;
end;

return u1.new();