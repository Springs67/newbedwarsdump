-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConstantManager = v1.ConstantManager;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v6.Lighting;
local Players = v6.Players;
local RunService = v6.RunService;
local TweenService = v6.TweenService;
local UserInputService = v6.UserInputService;
local Workspace = v6.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local FadeUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "fade", "fade-util").FadeUtil;
local ScreenShakeUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "screen-shake", "screen-shake-util").ScreenShakeUtil;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local OrbitalSatelliteBalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "orbital-satellite", "orbital-satellite-balance").OrbitalSatelliteBalanceFile;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "draw");
local u8 = ConstantManager.registerConstants(script, {
    Sensitivity = 0.001,
    ControllerDeltaMultiplier = 5,
    AngleLowerLimitY = 1.6,
    AngleUpperLimitY = 1.6,
    DampingRatio = 0.75,
    Frequency = 4,
    AimSendRate = 0.1,
    RingRotationSpeed = 1
});
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 48, Name: __tostring
        return "OrbitalSatelliteController";
    end,

    __index = KnitController
});
u9.__index = u9;

function u9.new(...) -- Line: 54
    -- upvalues: u9 (ref)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11) -- Line: 58
    -- upvalues: KnitController (copy), default (copy), u4 (copy), u7 (copy)
    KnitController.constructor(p11);
    p11.Name = "OrbitalSatelliteController";
    p11.remotes = default.Client:GetNamespace("OrbitalSatellite");
    p11.inSatellite = false;
    p11.localSatelliteMaid = u4.new();
    p11.debugRay = u7.ray(Ray.new());
end;

function u9.KnitStart(u12) -- Line: 66
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ItemType (copy), WatchCollectionTag (copy), Players (copy), KnitClient2 (copy), GameAnimationUtil (copy), AnimationType (copy), OrbitalSatelliteBalanceFile (copy)
    KnitController.KnitStart(u12);
    ClientSyncEvents.StartConsuming:connect(function(p13) -- Line: 68
        -- upvalues: ItemType (ref), u12 (copy)
        if p13.itemType == ItemType.ORBITAL_SATELLITE_TABLET and u12.inSatellite then
            p13:setCancelled(true);
        end;
    end);
    WatchCollectionTag("OrbitalSatellite", function(u14) -- Line: 75
        -- upvalues: u12 (copy), Players (ref), KnitClient2 (ref), GameAnimationUtil (ref), AnimationType (ref), OrbitalSatelliteBalanceFile (ref)
        task.spawn(function() -- Line: 76
            -- upvalues: u14 (copy), u12 (ref), Players (ref), KnitClient2 (ref), GameAnimationUtil (ref), AnimationType (ref), OrbitalSatelliteBalanceFile (ref)
            u14:WaitForChild("Camera");
            task.spawn(function() -- Line: 78
                -- upvalues: u12 (ref), u14 (ref)
                u12:hookSatellite(u14);
            end);

            if u14:GetAttribute("Owner") ~= Players.LocalPlayer.UserId then
                return nil;
            end;

            local u15 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
                blockSprint = true,
                moveSpeedMultiplier = 0
            });
            u12.localSatelliteMaid:GiveTask(function() -- Line: 90
                -- upvalues: u15 (copy)
                u15.Destroy();
            end);
            local u16 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.USE_TABLET, {
                looped = true
            });
            u12.localSatelliteMaid:GiveTask(function() -- Line: 97
                -- upvalues: u16 (copy)
                local v17 = u16;

                if v17 ~= nil then
                    v17:Stop();
                end;
            end);
            u12:enterSatelliteView(u14);
            task.delay(OrbitalSatelliteBalanceFile.LASER_CHARGE_DURATION, function() -- Line: 104
                -- upvalues: u12 (ref), u14 (ref)
                u12:enableSatelliteControls(u14);
            end);
            local u18 = nil;
            local u19 = nil;
            u18 = u14.Destroying:Connect(function() -- Line: 109
                -- upvalues: u12 (ref), u14 (ref), u18 (ref), u19 (ref)
                u12:cleanup(u14);
                local v20 = u18;

                if v20 ~= nil then
                    v20:Disconnect();
                end;

                local v21 = u19;

                if v21 ~= nil then
                    v21:Disconnect();
                end;
            end);
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character:FindFirstChildWhichIsA("Humanoid");
            end;

            if Character ~= nil then
                Character = Character.Died:Connect(function() -- Line: 127
                    -- upvalues: u12 (ref), u14 (ref), u18 (ref), u19 (ref)
                    u12:cleanup(u14);
                    local v22 = u18;

                    if v22 ~= nil then
                        v22:Disconnect();
                    end;

                    local v23 = u19;

                    if v23 ~= nil then
                        v23:Disconnect();
                    end;
                end);
            end;

            u19 = Character;
            task.delay(OrbitalSatelliteBalanceFile.LASER_CHARGE_DURATION + OrbitalSatelliteBalanceFile.LASER_DURATION - 1.2, function() -- Line: 142
                -- upvalues: u12 (ref), u14 (ref)
                u12:deactivateLaser(u14);
                task.delay(1, function() -- Line: 144
                    -- upvalues: u12 (ref), u14 (ref)
                    u12.localSatelliteMaid:DoCleaning();
                    u14:Destroy();
                end);
            end);
        end);
    end);
end;

function u9.hookSatellite(u24, u25) -- Line: 152
    -- upvalues: u4 (copy), RunService (copy), Players (copy), KnitClient2 (copy), SoundManager (copy), GameSound (copy), ScreenShakeUtil (copy), TweenService (copy)
    local u26 = u4.new();
    local u27 = true;
    u25:WaitForChild("Crystal", 1);
    u26:GiveTask(u25.AncestryChanged:Connect(function() -- Line: 156
        -- upvalues: u25 (copy), u27 (ref), u26 (copy)
        if not u25.Parent then
            u27 = false;
            u26:DoCleaning();
        end;
    end));
    local u28 = 0;
    u26:GiveTask(RunService.Heartbeat:Connect(function(p29) -- Line: 165
        -- upvalues: u28 (ref), u25 (copy)
        u28 = u28 + p29;
        local v30 = u25.Star.OuterMetalRing.Motor6D.C0 * CFrame.Angles(0, p29 * 1.5, 0);
        u25.Star.OuterMetalRing.Motor6D.C0 = v30;
        local v31 = u25.Star.InnerMetalRing.Motor6D.C0 * CFrame.Angles(p29 * 2, 0, 0);
        u25.Star.InnerMetalRing.Motor6D.C0 = v31;
        local C0 = u25.Star.Aura.Motor6D.C0;
        local v32 = CFrame.Angles(0, p29 * -7, 0);
        u25.Star.Aura.Motor6D.C0 = C0 * v32;
        local C02 = u25.Star.Aura2.Motor6D.C0;
        local v33 = CFrame.Angles(0, p29 * 7, 0);
        u25.Star.Aura2.Motor6D.C0 = C02 * v33;
    end));

    if u25:GetAttribute("Owner") ~= Players.LocalPlayer.UserId then
        local Character = Players.LocalPlayer.Character;

        if not Character then
            return nil;
        end;

        local u34 = false;
        local u35 = nil;
        local u36 = KnitClient2.Controllers.MapController:getCFrame("center"):expect();

        if u36 ~= nil then
            u36 = u36.Position;
        end;

        if u36 == nil then
            u36 = Character:GetPivot().Position;
        end;

        local function v42() -- Line: 199
            -- upvalues: u25 (copy), u36 (copy)
            local v37 = u25:GetAttribute("AngleX");
            local v38 = u25:GetAttribute("AngleY");

            if v37 == nil or v38 == nil then
                return nil;
            end;

            if u25 == nil then
                return nil;
            end;

            local v39 = CFrame.new(u25.Rotate.Position, u36);
            local v40 = CFrame.Angles(0, math.rad(v37), 0);
            local v41 = CFrame.Angles(math.rad(v38), 0, 0);
            u25.Rotate.CFrame = v39 * v40 * v41;
        end;

        u26:GiveTask(u25:GetAttributeChangedSignal("AngleX"):Connect(v42));
        u26:GiveTask(u25:GetAttributeChangedSignal("AngleY"):Connect(v42));
        local u43 = 0;
        u24.localSatelliteMaid:GiveTask(RunService.Heartbeat:Connect(function(p44) -- Line: 218
            -- upvalues: u25 (copy), u43 (ref), Players (ref), u34 (ref), u35 (ref), SoundManager (ref), GameSound (ref), ScreenShakeUtil (ref)
            if u25 == nil then
                return nil;
            end;

            if u43 < time() then
                u43 = time() + 0.5;
                local Unit = Ray.new(u25.Rotate.CFrame.Position, u25.Laser.CFrame.Position - u25.Rotate.CFrame.Position).Unit;
                local Character2 = Players.LocalPlayer.Character;

                if Character2 then
                    local v45 = Unit:ClosestPoint(Character2:GetPivot().Position);

                    if (Character2:GetPivot().Position - v45).Magnitude < 30 then
                        if not u34 then
                            if u35 then
                                u35:Play();
                                u34 = true;
                            else
                                u35 = SoundManager:playModifiableSound(GameSound.ORB_SAT_LASER_IMPACT_LOOP, {
                                    looped = true,
                                    position = v45
                                });
                                u34 = true;
                            end;
                        end;

                        local Position = Character2:GetPivot().Position;
                        ScreenShakeUtil.shake(v45, (v45 - Position).Unit, {
                            magnitude = 1,
                            duration = 0.5
                        });

                        return;
                    end;

                    local v46 = u35;

                    if v46 ~= nil then
                        v46:Pause();
                    end;

                    u34 = false;
                end;
            end;
        end));
    end;

    SoundManager:playSound(GameSound.ORB_SAT_LASER_CHARGE);

    local function _(p47) -- Line: 302
        if p47:IsA("ParticleEmitter") then
            p47.Enabled = true;
        end;
    end;

    for i, child in u25.Crystal.ChargeEffect:GetChildren() do
        local _ = i - 1;

        if child:IsA("ParticleEmitter") then
            child.Enabled = true;
        end;
    end;

    task.wait(2);

    local function _(p48) -- Line: 312
        if p48:IsA("ParticleEmitter") then
            p48.Enabled = false;
        end;
    end;

    for i, child in u25.Crystal.ChargeEffect:GetChildren() do
        local _ = i - 1;

        if child:IsA("ParticleEmitter") then
            child.Enabled = false;
        end;
    end;

    local u49 = SoundManager:playSound(GameSound.ORB_SAT_LASER_FIRE_LOOP);
    u24.localSatelliteMaid:GiveTask(function() -- Line: 324
        -- upvalues: u49 (copy)
        local v50 = u49;

        if v50 ~= nil then
            v50:Stop();
        end;

        local v51 = u49;

        if v51 ~= nil then
            v51:Destroy();
        end;
    end);
    task.delay(1, function() -- Line: 334
        -- upvalues: u25 (copy), u27 (ref), KnitClient2 (ref), SoundManager (ref), GameSound (ref), u24 (copy), TweenService (ref)
        if not (u25 and u27) then
            return nil;
        end;

        KnitClient2.Controllers.ScreenShakeController:shake(u25.Crystal.Position, u25.Crystal.Position - u25.Camera.Position, {
            magnitude = 2,
            duration = 0.46
        });

        local function _(p52) -- Line: 347
            if p52:IsA("Beam") then
                p52.Enabled = true;
            end;
        end;

        for i, child in u25.Laser.Beam:GetChildren() do
            local _ = i - 1;

            if child:IsA("Beam") then
                child.Enabled = true;
            end;
        end;

        local function _(p53) -- Line: 356
            if p53:IsA("ParticleEmitter") then
                p53.Enabled = true;
            end;
        end;

        for i, child in u25.ImpactEffect:GetChildren() do
            local _ = i - 1;

            if child:IsA("ParticleEmitter") then
                child.Enabled = true;
            end;
        end;

        local u54 = SoundManager:playSound(GameSound.ORB_SAT_LASER_IMPACT_LOOP, {
            parent = u25.ImpactEffect
        });
        u24.localSatelliteMaid:GiveTask(function() -- Line: 367
            -- upvalues: u54 (copy)
            local v55 = u54;

            if v55 ~= nil then
                v55:Stop();
            end;

            local v56 = u54;

            if v56 ~= nil then
                v56:Destroy();
            end;
        end);
        TweenService:Create(u25.Laser, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {
            Size = Vector3.new(600, u25.Laser.Size.Y, u25.Laser.Size.Z)
        }):Play();
        TweenService:Create(u25.Laser.Motor6D, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {
            C1 = u25.Laser.Motor6D.C1 * CFrame.new(-300, 0, 0)
        }):Play();
        task.delay(0.6, function() -- Line: 389
            -- upvalues: u25 (ref), u27 (ref), SoundManager (ref), GameSound (ref), u24 (ref), KnitClient2 (ref)
            if not (u25 and u27) then
                return nil;
            end;

            local u57 = SoundManager:playSound(GameSound.ORB_SAT_LASER_AMBIENT_LOOP, {
                looped = true
            });
            u24.localSatelliteMaid:GiveTask(function() -- Line: 396
                -- upvalues: u57 (copy)
                local v58 = u57;

                if v58 ~= nil then
                    v58:Stop();
                end;

                local v59 = u57;

                if v59 ~= nil then
                    v59:Destroy();
                end;
            end);
            KnitClient2.Controllers.ScreenShakeController:shake(u25.Crystal.Position, u25.Crystal.Position - u25.Camera.Position, {
                magnitude = 0.6,
                duration = 10
            });
        end);
    end);
end;

function u9.enterSatelliteView(u60, p61) -- Line: 417
    -- upvalues: SoundManager (copy), GameSound (copy), u5 (copy), Lighting (copy), Workspace (copy), FadeUtil (copy), TweenService (copy), WatchCharacter (copy), Players (copy), Theme (copy)
    if u60.inSatellite then
        return nil;
    end;

    u60.inSatellite = true;
    u60.localSatelliteMaid:DoCleaning();
    local u62 = SoundManager:playSound(GameSound.ORB_SAT_ACTIVATE);
    local u63 = u5("DepthOfFieldEffect", {
        Name = "SatelliteDepthOfField",
        InFocusRadius = 50,
        FocusDistance = 200,
        FarIntensity = 0.5,
        NearIntensity = 0,
        Parent = Lighting
    });
    u60.localSatelliteMaid:GiveTask(function() -- Line: 433
        -- upvalues: u63 (copy), u62 (copy)
        u63:Destroy();
        local v64 = u62;

        if v64 ~= nil then
            v64:Stop();
        end;

        local v65 = u62;

        if v65 ~= nil then
            v65:Destroy();
        end;
    end);
    local CurrentCamera = Workspace.CurrentCamera;

    if not CurrentCamera then
        return nil;
    end;

    local CameraType = CurrentCamera.CameraType;
    local FieldOfView = CurrentCamera.FieldOfView;
    CurrentCamera.CameraType = Enum.CameraType.Scriptable;
    CurrentCamera.FieldOfView = 90;
    FadeUtil:fade(0.12, 0.12, 0.7);
    TweenService:Create(CurrentCamera, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        CFrame = p61.Camera.CFrame
    }):Play();
    u60.localSatelliteMaid:GiveTask(WatchCharacter(function(p66, p67, p68) -- Line: 459
        -- upvalues: Players (ref), u5 (ref), Theme (ref), u60 (copy)
        if p66.Team == Players.LocalPlayer.Team then
            return nil;
        end;

        local u69 = u5("BillboardGui", {
            StudsOffset = Vector3.new(0, 7, 0),
            AlwaysOnTop = true,
            Parent = p67.PrimaryPart,
            Size = UDim2.fromOffset(40, 40),
            Children = { u5("ImageLabel", {
                    Image = "rbxassetid://9429977101",
                    BackgroundTransparency = 1,
                    ImageTransparency = 0,
                    Size = UDim2.fromScale(1, 1),
                    ScaleType = Enum.ScaleType.Fit,
                    ImageColor3 = Theme.mcRed
                }) }
        });
        p68:GiveTask(u69);
        u60.localSatelliteMaid:GiveTask(function() -- Line: 478
            -- upvalues: u69 (copy)
            u69:Destroy();
        end);
    end));
    u60.localSatelliteMaid:GiveTask(function() -- Line: 483
        -- upvalues: FadeUtil (ref), CurrentCamera (copy), CameraType (copy), FieldOfView (copy)
        FadeUtil:fade(0.12, 0.12, 0.7);
        CurrentCamera.CameraType = CameraType;
        CurrentCamera.FieldOfView = FieldOfView;
    end);
end;

function u9.enableSatelliteControls(u70, u71) -- Line: 489
    -- upvalues: Players (copy), UserInputService (copy), u3 (copy), KnitClient2 (copy), RunService (copy), u8 (copy), Workspace (copy)
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    local u72 = 0;
    local u73 = 0;
    local u74 = 0;
    local MouseBehavior = UserInputService.MouseBehavior;
    local u75 = u3.GroupMotor.new({
        x = 0,
        y = 0
    });
    local u76 = KnitClient2.Controllers.MapController:getCFrame("center"):expect();

    if u76 ~= nil then
        u76 = u76.Position;
    end;

    if u76 == nil then
        u76 = Character:GetPivot().Position;
    end;

    local u81 = u75:onStep(function(p77) -- Line: 512
        -- upvalues: u71 (copy), u76 (copy)
        if u71 == nil then
            return nil;
        end;

        local v78 = CFrame.new(u71.Rotate.Position, u76);
        local v79 = CFrame.Angles(0, p77.x, 0);
        local v80 = CFrame.Angles(p77.y, 0, 0);
        u71.Rotate.CFrame = v78 * v79 * v80;
    end);
    u70.localSatelliteMaid:GiveTask(function() -- Line: 521
        -- upvalues: u81 (copy)
        u81:disconnect();
    end);
    local u82 = "satellite_" .. tostring(Players.LocalPlayer.UserId);
    u70.localSatelliteMaid:GiveTask(function() -- Line: 526
        -- upvalues: RunService (ref), u82 (copy), UserInputService (ref), MouseBehavior (copy)
        RunService:UnbindFromRenderStep(u82);
        UserInputService.MouseBehavior = MouseBehavior;
        UserInputService.MouseIconEnabled = true;
    end);
    RunService:BindToRenderStep(u82, Enum.RenderPriority.Camera.Value + 2, function() -- Line: 531
        -- upvalues: UserInputService (ref), u73 (ref), u8 (ref), u74 (ref), u75 (copy), u3 (ref), Workspace (ref), u71 (copy), u72 (ref), u70 (copy)
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter;
        UserInputService.MouseIconEnabled = false;
        local v83 = UserInputService:GetMouseDelta();
        u73 = u73 - v83.X * u8.Sensitivity;
        u74 = math.clamp(u74 - v83.Y * u8.Sensitivity, -u8.AngleLowerLimitY, u8.AngleUpperLimitY);
        u75:setGoal({
            x = u3.Spring.new(u73, {
                dampingRatio = u8.DampingRatio,
                frequency = u8.Frequency
            }),
            y = u3.Spring.new(u74, {
                dampingRatio = u8.DampingRatio,
                frequency = u8.Frequency
            })
        });
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera then
            CurrentCamera.CFrame = u71.Camera.CFrame;
        end;

        if u72 < time() then
            u72 = time() + u8.AimSendRate;
            u70.remotes:Get("AimSatellite"):SendToServer({
                angleX = math.deg(u73 % 6.283185307179586),
                angleY = math.deg(u74)
            });
        end;
    end);
end;

function u9.deactivateLaser(p84, p85) -- Line: 564
    -- upvalues: SoundManager (copy), GameSound (copy), TweenService (copy)
    local X = p85.Laser.Size.X;
    SoundManager:playSound(GameSound.ORB_SAT_LASER_POWER_DOWN);
    TweenService:Create(p85.Laser, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
        Size = Vector3.new(0, p85.Laser.Size.Y, p85.Laser.Size.Z)
    }):Play();
    TweenService:Create(p85.Laser.Motor6D, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
        C1 = p85.Laser.Motor6D.C1 * CFrame.new(-X / 2, 0, 0)
    }):Play();
end;

function u9.cleanup(p86, p87) -- Line: 580
    p86.inSatellite = false;
    p86.localSatelliteMaid:DoCleaning();
    p86.remotes:Get("ExitSatellite"):SendToServer(p87);
end;

KnitClient.CreateController(u9.new());

return nil;