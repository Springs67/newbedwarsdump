-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local MathExtras = v1.MathExtras;
local StatusModifier = v1.StatusModifier;
local WatchCharacter = v1.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContentProvider = v4.ContentProvider;
local ContextActionService = v4.ContextActionService;
local Players = v4.Players;
local TweenService = v4.TweenService;
local UserInputService = v4.UserInputService;
local Workspace = v4.Workspace;
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Setting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting;
local SprintConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sprint", "sprint-constants").SprintConstants;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "SprintController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 34
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(u8) -- Line: 38
    -- upvalues: KnitController (copy), u5 (copy), u2 (copy), StatusModifier (copy), MathExtras (copy), SprintConstants (copy)
    KnitController.constructor(u8);
    u8.Name = "SprintController";
    u8.blockSprintStatusSignal = u5.new();
    u8.sprintMaid = u2.new();
    u8.sprinting = false;
    u8.attemptingSprint = false;
    u8.moveSpeedMultiplier = 1;
    u8.blockSprint = false;
    u8.maxSpeed = nil;
    u8.immediateStop = false;
    u8.shiftLockEnabled = false;
    u8.movementStatusModifier = StatusModifier.new(function(p9) -- Line: 51
        -- upvalues: MathExtras (ref), u8 (copy), SprintConstants (ref)
        local v10 = false;
        local v11 = 0;
        local v12 = false;

        for _, v in p9 do
            if v.moveSpeedMultiplier ~= nil then
                if v.moveSpeedMultiplier == 0 then
                    v12 = true;
                else
                    v11 = v11 + MathExtras:getPercentFromMultiplier(v.moveSpeedMultiplier);
                end;
            end;

            if v.blockSprint ~= nil then
                v10 = v10 or v.blockSprint;
            end;
        end;

        u8.blockSprint = v10;
        u8.blockSprintStatusSignal:Fire(u8.blockSprint);
        u8.moveSpeedMultiplier = v12 and 0 or MathExtras:getMultiplierFromPercent(v11);

        for _, v in p9 do
            local constantSpeedMultiplier = v.constantSpeedMultiplier;

            if constantSpeedMultiplier ~= nil then
                u8.moveSpeedMultiplier = constantSpeedMultiplier;
            end;
        end;

        if u8.blockSprint then
            u8:stopSprinting(false);
        elseif u8.attemptingSprint and not u8.sprinting then
            u8:startSprinting();
        end;

        if u8.sprinting then
            u8:setSpeed(SprintConstants.RUN_SPEED);

            return;
        end;

        u8:setSpeed(SprintConstants.WALK_SPEED);
    end);
end;

function u6.KnitStart(u13) -- Line: 94
    -- upvalues: Players (copy), KnitClient (copy), Setting (copy), ClientSyncEvents (copy), SprintConstants (copy), UserInputService (copy), ContextActionService (copy), WatchCharacter (copy), Workspace (copy), DeviceUtil (copy), ContentProvider (copy), u3 (copy), BedwarsImageId (copy)
    Players.LocalPlayer.CharacterAdded:Connect(function() -- Line: 95
        -- upvalues: u13 (copy)
        u13.movementStatusModifier:clear();
    end);
    u13:setBindingForSprint(false);
    task.spawn(function() -- Line: 100
        -- upvalues: KnitClient (ref), Setting (ref), u13 (copy)
        KnitClient.Controllers.SettingsController:waitForSettings();
        u13.shiftLockEnabled = KnitClient.Controllers.SettingsController:getSetting(Setting.PC_SHIFT_LOCK) == true;

        if u13.shiftLockEnabled then
            u13:setBindingForSprint(true);
        end;
    end);
    Players.LocalPlayer.CharacterAdded:Connect(function(p14) -- Line: 108
        -- upvalues: u13 (copy)
        local v15 = p14:GetAttribute("Locked");

        if v15 == 0 or (v15 ~= v15 or (v15 == "" or not v15)) then
            u13.movementStatusModifier:clear();
        end;
    end);
    ClientSyncEvents.SettingChanged:connect(function(p16) -- Line: 115
        -- upvalues: Setting (ref), u13 (copy)
        local v17 = p16.setting == Setting.PC_SHIFT_LOCK and typeof(p16.value) == "boolean";

        if v17 then
            local value = p16.value;
            u13.shiftLockEnabled = value;
            u13:stopSprinting(false);

            if value then
                u13:setBindingForSprint(true);

                return;
            end;

            u13:setBindingForSprint(false);
        end;
    end);
    u13:setSpeed(SprintConstants.WALK_SPEED);

    if UserInputService.GamepadEnabled then
        ContextActionService:BindAction("sprint-gamepad", function(p18, p19, p20) -- Line: 134
            -- upvalues: u13 (copy)
            if p19 == Enum.UserInputState.Begin then
                if u13.sprinting then
                    u13:stopSprinting(true);

                    return;
                end;

                u13:startSprinting();
            end;
        end, false, Enum.KeyCode.ButtonL3);
        ContextActionService:UnbindAction("id");
    end;

    WatchCharacter(function(p21, p22) -- Line: 145
        -- upvalues: Players (ref), u13 (copy)
        if p21 == Players.LocalPlayer then
            if u13.sprinting then
                u13:startSprinting();

                return;
            end;

            u13:stopSprinting(false);
        end;
    end);
    KnitClient.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p23) -- Line: 154
        -- upvalues: Workspace (ref), KnitClient (ref), u13 (copy), SprintConstants (ref)
        Workspace.CurrentCamera.FieldOfView = KnitClient.Controllers.FovController:getFOV() * (not u13.sprinting and 1 or SprintConstants.RUN_FOV_MULT);
    end);
    task.spawn(function() -- Line: 157
        -- upvalues: DeviceUtil (ref), ContentProvider (ref), u3 (ref), BedwarsImageId (ref), u13 (copy)
        if DeviceUtil.isMobileControls() then
            ContentProvider:PreloadAsync({ u3("ImageLabel", {
                    Image = BedwarsImageId.SPRINT_ON_MOBILE
                }) });
            u13:startSprinting();
        end;
    end);
end;

function u6.setBindingForSprint(u24, p25) -- Line: 166
    -- upvalues: DeviceUtil (copy), ContextActionService (copy)
    if p25 and not DeviceUtil.isMobileControls() then
        ContextActionService:UnbindAction("sprint");
        ContextActionService:BindActionAtPriority("sprint-pc-lock", function(p26, p27, p28) -- Line: 169
            -- upvalues: u24 (copy)
            if p27 == Enum.UserInputState.Begin then
                if u24.sprinting then
                    u24:stopSprinting(true);

                    return;
                end;

                u24:startSprinting();
            end;
        end, false, 1, Enum.KeyCode.LeftShift);

        return;
    end;

    ContextActionService:UnbindAction("sprint-pc-lock");
    ContextActionService:BindActionAtPriority("sprint", function(p29, p30, p31) -- Line: 180
        -- upvalues: u24 (copy)
        if p30 == Enum.UserInputState.Begin then
            u24:startSprinting();

            return;
        end;

        if p30 == Enum.UserInputState.End then
            u24:stopSprinting(true);
        end;
    end, false, 1, Enum.KeyCode.LeftShift);
end;

function u6.getMovementStatusModifier(p32) -- Line: 189
    return p32.movementStatusModifier;
end;

function u6.setSpeed(p33, p34) -- Line: 192
    -- upvalues: Players (copy)
    local v35 = Players.LocalPlayer.Character and Players.LocalPlayer.Character:WaitForChild("Humanoid", 5);

    if v35 then
        local v36 = p34 * p33.moveSpeedMultiplier;
        local maxSpeed = p33.maxSpeed;

        if maxSpeed ~= 0 and (maxSpeed == maxSpeed and maxSpeed) then
            v36 = math.min(p33.maxSpeed, v36);
        end;

        v35.WalkSpeed = v36;
    end;
end;

function u6.isSprinting(p37) -- Line: 202
    return p37.sprinting;
end;

function u6.startSprinting(u38) -- Line: 205
    -- upvalues: Workspace (copy), Players (copy), SprintConstants (copy), KnitClient (copy)
    local v39 = Workspace:GetAttribute("FreecamEnabled");

    if v39 ~= 0 and (v39 == v39 and (v39 ~= "" and v39)) then
        return nil;
    end;

    if u38.blockSprint then
        return nil;
    end;

    u38.sprinting = true;
    u38.attemptingSprint = true;
    Players.LocalPlayer:SetAttribute("Sprinting", true);
    u38:setSpeed(SprintConstants.RUN_SPEED);
    u38:tweenCameraFOV(KnitClient.Controllers.FovController:getFOV() * SprintConstants.RUN_FOV_MULT, 0.1);
    u38.sprintMaid:GiveTask(function() -- Line: 219
        -- upvalues: u38 (copy), SprintConstants (ref), KnitClient (ref)
        u38:setSpeed(SprintConstants.WALK_SPEED);
        local v40 = u38:tweenCameraFOV(KnitClient.Controllers.FovController:getFOV(), 0.1);

        if u38.immediateStop then
            v40:DoCleaning();
        end;
    end);
end;

function u6.stopSprinting(p41, p42, p43) -- Line: 227
    -- upvalues: Players (copy)
    if p43 == nil then
        p43 = false;
    end;

    Players.LocalPlayer:SetAttribute("Sprinting", false);

    if not p41.sprinting then
        return nil;
    end;

    if p43 then
        p41.immediateStop = true;
    end;

    p41.sprintMaid:DoCleaning();
    p41.immediateStop = false;
    p41.sprinting = false;

    if p42 then
        p41.attemptingSprint = false;
    end;
end;

function u6.tweenCameraFOV(p44, p45, p46) -- Line: 245
    -- upvalues: u2 (copy), TweenService (copy), Workspace (copy)
    local v47 = u2.new();
    local u48 = TweenService:Create(Workspace.CurrentCamera, TweenInfo.new(p46, Enum.EasingStyle.Linear), {
        FieldOfView = p45
    });
    u48:Play();
    v47:GiveTask(function() -- Line: 251
        -- upvalues: u48 (copy)
        u48:Cancel();
        u48:Destroy();
    end);

    return v47;
end;

KnitClient.CreateController(u6.new());

return nil;