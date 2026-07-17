-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local MobileButton = v1.MobileButton;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v6.ContextActionService;
local Players = v6.Players;
local RunService = v6.RunService;
local UserInputService = v6.UserInputService;
local Workspace = v6.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "FlyController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 35
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 39
    -- upvalues: KnitController (copy), u3 (copy), u2 (copy)
    KnitController.constructor(p9);
    p9.Name = "FlyController";
    p9.flyEnabled = false;
    p9.isFlying = false;
    p9.flyEnabledMaid = u3.new();
    p9.flyingMaid = u3.new();
    p9.upHeld = false;
    p9.downHeld = false;
    p9.targetVerticalVelocity = u2.SingleMotor.new(0);
    p9.forceFlying = false;
    p9.lastMobileJumpRequest = 0;
end;

function u7.KnitStart(u10) -- Line: 52
    -- upvalues: KnitController (copy), default (copy), UserInputService (copy), ContextActionService (copy)
    KnitController.KnitStart(u10);
    default.Client:Get("SetFlyEnabled"):Connect(function(p11) -- Line: 54
        -- upvalues: u10 (copy)
        u10:setFlyEnabled(p11.enabled, p11.forceFlying);
    end);
    UserInputService.InputBegan:Connect(function(p12, p13) -- Line: 57
        -- upvalues: u10 (copy)
        if p13 then
            return nil;
        end;

        if p12.KeyCode == Enum.KeyCode.Space then
            u10.upHeld = true;
        end;
    end);
    UserInputService.InputEnded:Connect(function(p14) -- Line: 65
        -- upvalues: u10 (copy)
        if p14.KeyCode == Enum.KeyCode.Space then
            u10.upHeld = false;
        end;
    end);
    ContextActionService:BindActionAtPriority("fly-downward", function(p15, p16, p17) -- Line: 70
        -- upvalues: u10 (copy)
        if p16 == Enum.UserInputState.Begin then
            u10.downHeld = true;
        elseif p16 == Enum.UserInputState.End then
            u10.downHeld = false;
        end;

        return Enum.ContextActionResult.Pass;
    end, false, 10, Enum.KeyCode.LeftShift);

    if u10.flyEnabled then
        u10:handleEnabledFly();
    end;
end;

function u7.setFlyEnabled(p18, p19, p20) -- Line: 82
    if p18.flyEnabled == p19 then
        return nil;
    end;

    local v21;

    if p20 == nil then
        v21 = false;
    else
        v21 = p20;
    end;

    p18.forceFlying = v21;

    if p20 then
        if p19 then
            p18:setFlying(true);
        else
            p18:setFlying(false);
        end;
    end;

    p18.flyEnabled = p19;

    if p19 then
        p18:handleEnabledFly();

        return;
    end;

    p18.flyEnabledMaid:DoCleaning();
    p18.flyingMaid:DoCleaning();
end;

function u7.handleEnabledFly(u22) -- Line: 106
    -- upvalues: UserInputService (copy), DeviceUtil (copy)
    local u23 = 0;
    u22.flyEnabledMaid:GiveTask(UserInputService.InputBegan:Connect(function(p24, p25) -- Line: 108
        -- upvalues: u22 (copy), u23 (ref)
        if p25 then
            return nil;
        end;

        if u22.forceFlying then
            return nil;
        end;

        if p24.KeyCode ~= Enum.KeyCode.Space then
            return nil;
        end;

        if os.clock() - u23 >= 0.25 then
            u23 = os.clock();

            return;
        end;

        u22:setFlying(not u22.isFlying);
        u23 = 0;
    end));
    u22.flyEnabledMaid:GiveTask(UserInputService.JumpRequest:Connect(function() -- Line: 125
        -- upvalues: DeviceUtil (ref), u22 (copy)
        if not DeviceUtil.isMobileControls() then
            return nil;
        end;

        if u22.forceFlying then
            return nil;
        end;

        if os.time() - u22.lastMobileJumpRequest < 0.25 then
            return nil;
        end;

        u22.lastMobileJumpRequest = os.time();
        u22:setFlying(not u22.isFlying);
    end));
end;

function u7.setFlying(u26, p27) -- Line: 140
    -- upvalues: Players (copy), u2 (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), u4 (copy), Workspace (copy), DeviceUtil (copy), u5 (copy), MobileButton (copy), BedwarsImageId (copy), BedwarsUI (copy), KnitClient (copy), RunService (copy)
    if u26.isFlying == p27 then
        return nil;
    end;

    u26.isFlying = p27;

    if not p27 then
        u26.flyingMaid:DoCleaning();

        return nil;
    end;

    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.AssemblyLinearVelocity.Y;
        end;
    end;

    u26.targetVerticalVelocity = u2.SingleMotor.new(Character == nil and 0 or Character);
    local u28 = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.ROBLOX_GHOST_FLOATING));

    if u28 then
        u26.flyingMaid:GiveTask(function() -- Line: 168
            -- upvalues: u28 (copy)
            u28:Stop();
            u28:Destroy();
        end);
    end;

    local Character2 = Players.LocalPlayer.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;
    end;

    if Character2 then
        local u29 = u4("BodyForce", {
            Parent = Character2,
            Force = Vector3.new(0, Character2.AssemblyMass * Workspace.Gravity, 0)
        });
        u26.flyingMaid:GiveTask(function() -- Line: 184
            -- upvalues: Character2 (copy), u29 (copy)
            if not Character2.Parent then
                return nil;
            end;

            u29:Destroy();
        end);
    end;

    if DeviceUtil.isMobileControls() then
        local u30 = u5.mount(u5.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u5.createElement(MobileButton, {
                Image = BedwarsImageId.UP_MOBILE,
                Position = BedwarsUI:getActionMobileButtonPosition(),

                OnPressDown = function() -- Line: 199, Name: OnPressDown
                    -- upvalues: u26 (copy)
                    u26.upHeld = true;
                    u26.downHeld = false;
                end,

                OnPressUp = function() -- Line: 203, Name: OnPressUp
                    -- upvalues: u26 (copy)
                    u26.upHeld = false;
                    u26.downHeld = false;
                end
            }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));
        local v31 = {};
        local v32 = {
            Image = BedwarsImageId.DOWN_MOBILE,
            Position = BedwarsUI:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0),

            OnPressDown = function() -- Line: 221
                -- upvalues: u26 (copy)
                u26.upHeld = false;
                u26.downHeld = true;
            end,

            OnPressUp = function() -- Line: 225
                -- upvalues: u26 (copy)
                u26.upHeld = false;
                u26.downHeld = false;
            end
        };
        v31[#v31 + 1] = u5.createElement(MobileButton, v32);
        local u33 = u5.mount(u5.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, v31), Players.LocalPlayer:WaitForChild("PlayerGui"));
        u26.flyingMaid:GiveTask(function() -- Line: 231
            -- upvalues: u5 (ref), u30 (copy)
            return u5.unmount(u30);
        end);
        u26.flyingMaid:GiveTask(function() -- Line: 234
            -- upvalues: u5 (ref), u33 (copy)
            return u5.unmount(u33);
        end);
    end;

    local v34 = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
        constantSpeedMultiplier = 2
    });
    u26.flyingMaid:GiveTask(v34);
    u26.flyingMaid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 242
        -- upvalues: u26 (copy), u2 (ref), Players (ref)
        if u26.upHeld and not u26.downHeld then
            u26.targetVerticalVelocity:setGoal(u2.Spring.new(40, {
                frequency = 1,
                dampingRatio = 0.45
            }));
        elseif u26.upHeld or not u26.downHeld then
            u26.targetVerticalVelocity:setGoal(u2.Spring.new(0, {
                frequency = 1,
                dampingRatio = 0.45
            }));
        else
            u26.targetVerticalVelocity:setGoal(u2.Spring.new(-40, {
                frequency = 1,
                dampingRatio = 0.45
            }));
        end;

        local Character3 = Players.LocalPlayer.Character;
        local v35;

        if Character3 == nil then
            v35 = Character3;
        else
            v35 = Character3.PrimaryPart;
        end;

        if not v35 then
            return nil;
        end;

        local AssemblyLinearVelocity = Character3.PrimaryPart.AssemblyLinearVelocity;
        local v36 = u26.targetVerticalVelocity:getValue();
        local v37 = Vector3.new(0, v36, 0);
        Character3.PrimaryPart.AssemblyLinearVelocity = AssemblyLinearVelocity * Vector3.new(1, 0, 1) + v37;
    end));
end;

KnitClient.CreateController(u7.new());

return nil;