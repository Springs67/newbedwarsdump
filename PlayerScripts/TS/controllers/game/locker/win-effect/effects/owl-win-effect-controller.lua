-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local AnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local MountFlightControls = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "mount", "mount-flight-controls").MountFlightControls;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WinEffect = RuntimeLib.import(script, script.Parent.Parent, "win-effect").WinEffect;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "OwlWinEffectController";
    end,

    __index = WinEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 32
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 36
    -- upvalues: WinEffect (copy), WinEffectType (copy), u2 (copy)
    WinEffect.constructor(p7, WinEffectType.OWL);
    p7.Name = "OwlWinEffectController";
    p7.maid = u2.new();
    p7.upHeld = false;
    p7.downHeld = false;
end;

function u5.KnitStart(u8) -- Line: 43
    -- upvalues: WinEffect (copy), default (copy), EntityUtil (copy), u3 (copy), Workspace (copy), ReplicatedStorage (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), Players (copy), u1 (copy), RunService (copy)
    WinEffect.KnitStart(u8);
    default.Client:Get("OwlWinEffectSetupComplete"):Connect(function(p9) -- Line: 45
        -- upvalues: EntityUtil (ref), u3 (ref), Workspace (ref), u8 (copy), ReplicatedStorage (ref), GameSound (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), Players (ref), u1 (ref), RunService (ref)
        local winningPlayer = p9.winningPlayer;
        local Character = winningPlayer.Character;

        if not Character then
            return nil;
        end;

        if not Character.PrimaryPart then
            return nil;
        end;

        local PrimaryPart = Character.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.CFrame;
        end;

        if not PrimaryPart then
            return nil;
        end;

        local Humanoid = Character:FindFirstChild("Humanoid");

        if not Humanoid then
            return nil;
        end;

        local PrimaryPart2 = Character.PrimaryPart;

        if not PrimaryPart2 then
            return nil;
        end;

        local u10 = EntityUtil:getEntity(winningPlayer);

        if not u10 then
            return nil;
        end;

        local v11 = u3("Folder", {
            Parent = Workspace,
            Name = "Owl_" .. winningPlayer.Name
        });
        u8.maid:GiveTask(v11);
        local u12 = ReplicatedStorage.Assets.Pets.Owl:Clone();

        if not u12.PrimaryPart then
            return nil;
        end;

        u12:PivotTo(PrimaryPart);

        local function _(p13) -- Line: 86
            if p13:IsA("Part") then
                p13.CanCollide = false;
                p13.CanQuery = false;
                p13.CanTouch = false;
            end;
        end;

        for i, descendant in u12:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("Part") then
                descendant.CanCollide = false;
                descendant.CanQuery = false;
                descendant.CanTouch = false;
            end;
        end;

        u12.PrimaryPart.Anchored = true;
        u12:ScaleTo(5);
        u12.Parent = v11;
        local RootPart = u12:FindFirstChild("RootPart");

        if RootPart ~= nil then
            RootPart = RootPart:FindFirstChild("master_bone");

            if RootPart ~= nil then
                RootPart = RootPart:FindFirstChild("torso");
            end;
        end;

        if not RootPart then
            return nil;
        end;

        u3("Sound", {
            Name = "OwlWinEffectSound",
            Looped = true,
            SoundId = GameSound.OWL_FLY,
            Parent = Character.PrimaryPart
        }):Play();
        AnimationUtil:playAnimation(u12.AnimationController.Animator, GameAnimationUtil:getAssetId(AnimationType.OWL_FLY_STEADY_HEIGHT), {
            looped = true
        });

        if Players.LocalPlayer == winningPlayer then
            u8:bindFlightControls();
            u8:orientCamera(Character.PrimaryPart);
        end;

        Character.Archivable = true;
        local u14 = Character:Clone();
        u14.Parent = v11;
        u14.Name = "Pilot";

        local function _(p15) -- Line: 133
            if p15:IsA("Part") then
                p15.CanCollide = false;
                p15.CanQuery = false;
                p15.CanTouch = false;
            end;
        end;

        for i, descendant in u14:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("Part") then
                descendant.CanCollide = false;
                descendant.CanQuery = false;
                descendant.CanTouch = false;
            end;
        end;

        u14.PrimaryPart.Anchored = true;
        u14:PivotTo(u12:GetPivot() + Vector3.new(0, 10, 0));
        u8.maid:GiveTask(u14);
        local u16 = u14:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation((u3("Animation", {
            AnimationId = GameAnimationUtil:getAssetId(AnimationType.R15_SIT)
        })));
        u16:Play();
        u8.maid:GiveTask(function() -- Line: 156
            -- upvalues: u16 (copy)
            u16:Stop();
            u16:Destroy();
        end);
        u10:getInstance():SetAttribute("Transparency", 1);
        u10:hideNametag();
        u8.maid:GiveTask(function() -- Line: 163
            -- upvalues: u10 (copy)
            u10:getInstance():SetAttribute("Transparency", 0);
            u10:showNametag();
        end);
        Character.PrimaryPart.CanCollide = false;
        u3("BodyForce", {
            Name = "AntiGrav",
            Force = Vector3.new(0, Workspace.Gravity * PrimaryPart2.AssemblyMass, 0),
            Parent = PrimaryPart2
        });
        local v17 = u3("Attachment", {
            Parent = Character.PrimaryPart
        });
        u3("AngularVelocity", {
            MaxTorque = 5000,
            RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
            Attachment0 = v17,
            Parent = Character.PrimaryPart
        });
        local u18 = u1.SingleMotor.new(0);
        RunService.Heartbeat:Connect(function(p19) -- Line: 188
            -- upvalues: Character (copy), u14 (copy), u8 (ref), u18 (copy), u1 (ref), Humanoid (copy), u12 (copy)
            if not Character.PrimaryPart then
                return nil;
            end;

            if not u14.PrimaryPart then
                return nil;
            end;

            local CFrame2 = Character.PrimaryPart.CFrame;
            local v20 = CFrame.new(0, 0, -35 * p19);
            Character.PrimaryPart.CFrame = CFrame2 * v20;

            if u8.upHeld and not u8.downHeld then
                u18:setGoal(u1.Spring.new(10));
            elseif u8.downHeld and not u8.upHeld then
                u18:setGoal(u1.Spring.new(-10));
            else
                u18:setGoal(u1.Spring.new(0, {
                    frequency = 1
                }));
            end;

            local PrimaryPart3 = Character.PrimaryPart;
            local v21 = u18:getValue();
            PrimaryPart3.AssemblyLinearVelocity = Vector3.new(0, v21, 0);
            Humanoid:Move(Vector3.new(0, 0, 0));
            u12:PivotTo(Character.PrimaryPart.CFrame);
            u14:PivotTo(Character.PrimaryPart.CFrame + Vector3.new(0, 4, 0));
        end);
    end);
end;

function u5.onWin(p22, p23) -- Line: 221
end;

function u5.orientCamera(p24, p25) -- Line: 223
    -- upvalues: Workspace (copy), Players (copy)
    if Workspace.CurrentCamera then
        Workspace.CurrentCamera.CameraSubject = p25;
        Players.LocalPlayer.CameraMaxZoomDistance = 30;
        Players.LocalPlayer.CameraMinZoomDistance = 30;
    end;
end;

function u5.bindFlightControls(u26) -- Line: 230
    -- upvalues: MountFlightControls (copy)
    local v27 = MountFlightControls.bindUpDownControls();
    u26.maid:GiveTask(v27.bindActionMaid);
    u26.maid:GiveTask(v27.shouldFlyUpRef.Changed:Connect(function(p28) -- Line: 233
        -- upvalues: u26 (copy)
        u26.upHeld = p28;

        return u26.upHeld;
    end));
    u26.maid:GiveTask(v27.shouldFlyDownRef.Changed:Connect(function(p29) -- Line: 237
        -- upvalues: u26 (copy)
        u26.downHeld = p29;

        return u26.downHeld;
    end));
end;

KnitClient.CreateController(u5.new());

return nil;