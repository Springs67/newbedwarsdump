-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v7.Players;
local ReplicatedStorage = v7.ReplicatedStorage;
local RunService = v7.RunService;
local Workspace = v7.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local v8 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "movement", "event", "move-mount-event");
local InputActionType = v8.InputActionType;
local MoveMountDirection = v8.MoveMountDirection;
local MoveMountUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "movement", "move-mount-ui").MoveMountUI;
local MountFlightControls = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "mount", "mount-flight-controls").MountFlightControls;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WinEffect = RuntimeLib.import(script, script.Parent.Parent, "win-effect").WinEffect;
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 37, Name: __tostring
        return "DustDevilWinEffectController";
    end,

    __index = WinEffect
});
u9.__index = u9;

function u9.new(...) -- Line: 43
    -- upvalues: u9 (ref)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11) -- Line: 47
    -- upvalues: WinEffect (copy), WinEffectType (copy), u4 (copy)
    WinEffect.constructor(p11, WinEffectType.DUST_DEVIL);
    p11.Name = "DustDevilWinEffectController";
    p11.upHeld = false;
    p11.downHeld = false;
    p11.maid = u4.new();
end;

function u9.KnitStart(u12) -- Line: 54
    -- upvalues: WinEffect (copy), ClientSyncEvents (copy), MoveMountDirection (copy), InputActionType (copy), default (copy), KnitClient2 (copy), GameSound (copy), AnimationType (copy), u3 (copy), EntityUtil (copy), ReplicatedStorage (copy), Players (copy), Workspace (copy), AnimationUtil (copy), GameAnimationUtil (copy), u5 (copy), RunService (copy)
    WinEffect.KnitStart(u12);
    u12.maid:GiveTask(ClientSyncEvents.MoveMountButtonChange:connect(function(p13) -- Line: 56
        -- upvalues: MoveMountDirection (ref), u12 (copy), InputActionType (ref)
        local direction = p13.direction;

        if direction == MoveMountDirection.UP then
            u12.upHeld = p13.inputActionType == InputActionType.PRESS;

            return;
        end;

        if direction == MoveMountDirection.DOWN then
            u12.downHeld = p13.inputActionType == InputActionType.PRESS;
        end;
    end));
    default.Client:OnEvent("DustDevilWinEffectSetupComplete", function(p14) -- Line: 69
        -- upvalues: KnitClient2 (ref), GameSound (ref), AnimationType (ref), u3 (ref), EntityUtil (ref), ReplicatedStorage (ref), u12 (copy), Players (ref), Workspace (ref), AnimationUtil (ref), GameAnimationUtil (ref), u5 (ref), RunService (ref)
        KnitClient2.Controllers.PreloadController:runPreload({
            sounds = { GameSound.DUST_DEVIL_LOOP, GameSound.DUST_DEVIL_PICKUP_LOOP },
            animations = { AnimationType.DUST_DEVIL_PLAYER, AnimationType.DUST_DEVIL_SPIN }
        });
        local winningPlayer = p14.winningPlayer;
        local u15 = u3.SingleMotor.new(0);
        local Character = winningPlayer.Character;
        local v16;

        if Character == nil then
            v16 = Character;
        else
            v16 = Character.PrimaryPart;
        end;

        if not v16 then
            return nil;
        end;

        local Humanoid = Character:FindFirstChild("Humanoid");

        if not Humanoid then
            return nil;
        end;

        local v17 = EntityUtil:getEntity(winningPlayer);

        if not v17 then
            return nil;
        end;

        local u18 = ReplicatedStorage.Assets.Misc.DustDevil:Clone();

        if not u18.PrimaryPart then
            return nil;
        end;

        u12:setUpDustDevil(u18, Character.HumanoidRootPart.CFrame, winningPlayer);

        if Players.LocalPlayer == winningPlayer then
            u12:mountUi(winningPlayer);
            u12:bindControls();
            u12:orientCamera(u18.PrimaryPart);
        end;

        Character.Archivable = true;
        local u19 = Character:Clone();

        if u19 then
            u19.Parent = Workspace;
            u19.Name = "DustDevilEye";
            local Head = u19:FindFirstChild("Head");

            if Head ~= nil then
                Head = Head:FindFirstChild("Nametag");
            end;

            if Head then
                Head:Destroy();
            end;

            local Head2 = u19:FindFirstChild("Head");

            if Head2 ~= nil then
                Head2 = Head2:FindFirstChild("StatusEffectTagGui");
            end;

            if Head2 then
                Head2:Destroy();
            end;

            AnimationUtil:playAnimation(u19, GameAnimationUtil:getAssetId(AnimationType.DUST_DEVIL_PLAYER), {
                looped = true
            });
        end;

        v17:getInstance():SetAttribute("Transparency", 1);
        v17:hideNametag();
        local PrimaryPart = Character.PrimaryPart;
        u5("BodyForce", {
            Name = "AntiGrav",
            Force = Vector3.new(0, Workspace.Gravity * PrimaryPart.AssemblyMass, 0),
            Parent = PrimaryPart
        });
        local v20 = u5("Attachment", {
            Parent = Character.PrimaryPart
        });
        u5("AngularVelocity", {
            MaxTorque = 5000,
            RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
            Attachment0 = v20,
            Parent = Character.PrimaryPart
        });
        local u21 = Workspace:GetServerTimeNow();
        local CFrame2 = Character.PrimaryPart.CFrame;
        local CFrame3 = u18.PrimaryPart.CFrame;
        RunService.Heartbeat:Connect(function(p22) -- Line: 156
            -- upvalues: Character (copy), Workspace (ref), u18 (copy), u21 (ref), CFrame2 (ref), CFrame3 (ref), u19 (copy), Players (ref), winningPlayer (copy), u12 (ref), u15 (copy), u3 (ref), Humanoid (copy)
            local v23 = Character;

            if v23 ~= nil then
                v23 = v23.PrimaryPart;
            end;

            if not v23 then
                return nil;
            end;

            local v24 = Workspace:GetServerTimeNow();
            u18:PivotTo(Character.PrimaryPart.CFrame);

            if u21 + 0.6 <= v24 then
                u21 = v24;
                CFrame2 = Character.PrimaryPart.CFrame;

                if not u18.PrimaryPart then
                    return nil;
                end;

                CFrame3 = u18.PrimaryPart.CFrame;
            end;

            local v25 = u19;

            if v25 ~= nil then
                v25 = v25.PrimaryPart;
            end;

            if v25 then
                u19:PivotTo(u18:GetPivot() + Vector3.new(0, 10, 0));
                u19.PrimaryPart.Orientation = u19.PrimaryPart.Orientation + Vector3.new(0, 15, 0);
            end;

            if Players.LocalPlayer == winningPlayer then
                local CFrame4 = Character.PrimaryPart.CFrame;
                local v26 = CFrame.new(0, 0, -35 * p22);
                Character.PrimaryPart.CFrame = CFrame4 * v26;

                if u12.upHeld and not u12.downHeld then
                    u15:setGoal(u3.Spring.new(10));
                elseif u12.downHeld and not u12.upHeld then
                    u15:setGoal(u3.Spring.new(-10));
                else
                    u15:setGoal(u3.Spring.new(0, {
                        frequency = 1
                    }));
                end;

                local PrimaryPart2 = Character.PrimaryPart;
                local v27 = u15:getValue();
                PrimaryPart2.AssemblyLinearVelocity = Vector3.new(0, v27, 0);
                Humanoid:Move(Vector3.new(0, 0, 0));
            end;
        end);
    end);
end;

function u9.onWin(p28, p29) -- Line: 207
end;

function u9.setUpDustDevil(p30, p31, p32, u33) -- Line: 209
    -- upvalues: Workspace (copy), u5 (copy), SoundManager (copy), GameSound (copy), RunService (copy), default (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    if not p31.PrimaryPart then
        return nil;
    end;

    p31.Parent = Workspace;
    p31:PivotTo(p32);

    local function _(p34) -- Line: 216
        if p34:IsA("BasePart") then
            p34.CanCollide = false;
            p34.CanTouch = false;
        end;
    end;

    for i, descendant in p31:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CanCollide = false;
            descendant.CanTouch = false;
        end;
    end;

    u5("VectorForce", {
        Name = "DevilAntiGrav",
        Force = Vector3.new(0, 10 * p31.PrimaryPart.AssemblyMass, 0),
        Parent = p31
    });
    SoundManager:playSound(GameSound.DUST_DEVIL_LOOP, {
        volumeMultiplier = 0.5,
        rollOffMaxDistance = 240,
        rollOffMinDistance = 50,
        looped = true,
        parent = p31.PrimaryPart
    });
    local u35 = SoundManager:playModifiableSound(GameSound.DUST_DEVIL_PICKUP_LOOP, {
        volumeMultiplier = 0.8,
        rollOffMaxDistance = 240,
        rollOffMinDistance = 50,
        looped = true,
        parent = p31.PrimaryPart
    });
    u35.Volume = 0;
    RunService.Heartbeat:Connect(function(p36) -- Line: 248
        -- upvalues: u35 (copy)
        u35.Volume = math.max(0, u35.Volume - p36 * 2);
    end);
    default.Client:OnEvent("WhirlwindEffect", function(p37) -- Line: 251
        -- upvalues: u33 (copy), u35 (copy)
        if p37.id ~= "DustDevilWinEffect_" .. tostring(u33.UserId) then
            return nil;
        end;

        u35.Volume = 2;
    end);
    local AnimationController = p31:FindFirstChild("AnimationController");

    if AnimationController ~= nil then
        AnimationController = AnimationController:FindFirstChild("Animator");
    end;

    if AnimationController then
        AnimationUtil:playAnimation(AnimationController, GameAnimationUtil:getAssetId(AnimationType.DUST_DEVIL_SPIN), {
            looped = true
        });
    end;
end;

function u9.mountUi(p38, p39) -- Line: 268
    -- upvalues: DeviceUtil (copy), KnitClient2 (copy), u6 (copy), MoveMountUI (copy)
    if DeviceUtil.isMobileControls() then
        KnitClient2.Controllers.MobileUiController:toggleMountMovementControls(true);
        p38.maid:GiveTask(function() -- Line: 271
            -- upvalues: KnitClient2 (ref)
            KnitClient2.Controllers.MobileUiController:toggleMountMovementControls(false);
        end);

        return;
    end;

    local u40 = u6.mount(u6.createElement("ScreenGui", {
        ResetOnSpawn = false
    }, { u6.createElement(MoveMountUI) }), p39:WaitForChild("PlayerGui"));
    p38.maid:GiveTask(function() -- Line: 280
        -- upvalues: u6 (ref), u40 (copy)
        u6.unmount(u40);
    end);
end;

function u9.orientCamera(p41, p42) -- Line: 285
    -- upvalues: Workspace (copy), Players (copy)
    if Workspace.CurrentCamera then
        Workspace.CurrentCamera.CameraSubject = p42;
        Players.LocalPlayer.CameraMaxZoomDistance = 100;
        Players.LocalPlayer.CameraMinZoomDistance = 60;
    end;
end;

function u9.bindControls(u43) -- Line: 292
    -- upvalues: MountFlightControls (copy)
    local v44 = MountFlightControls.bindUpDownControls();
    u43.maid:GiveTask(v44.bindActionMaid);
    u43.maid:GiveTask(v44.shouldFlyUpRef.Changed:Connect(function(p45) -- Line: 295
        -- upvalues: u43 (copy)
        u43.upHeld = p45;

        return u43.upHeld;
    end));
    u43.maid:GiveTask(v44.shouldFlyDownRef.Changed:Connect(function(p46) -- Line: 299
        -- upvalues: u43 (copy)
        u43.downHeld = p46;

        return u43.downHeld;
    end));
end;

KnitClient.CreateController(u9.new());

return nil;