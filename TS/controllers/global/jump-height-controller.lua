-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local StatusModifier = v1.StatusModifier;
local WatchCharacter = v1.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local StarterPlayer = v2.StarterPlayer;
local UserInputService = v2.UserInputService;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "JumpHeightController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 25
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(u5) -- Line: 29
    -- upvalues: KnitController (copy), StatusModifier (copy), StarterPlayer (copy)
    KnitController.constructor(u5);
    u5.Name = "JumpHeightController";
    u5.jumpSpeedMultiplier = 1;
    u5.allowedAirJumps = 0;
    u5.jumpModifier = StatusModifier.new(function(p6) -- Line: 34
        -- upvalues: u5 (copy), StarterPlayer (ref)
        local v7 = 0;
        local v8 = 0;
        local v9 = 0;
        local v10 = false;

        for _, v in p6 do
            if v.jumpHeightMultiplier ~= nil then
                if v.jumpHeightMultiplier <= 0 then
                    v10 = true;
                elseif v.jumpHeightMultiplier < 1 then
                    v7 = v7 + 1 / v.jumpHeightMultiplier;
                elseif v.jumpHeightMultiplier > 1 then
                    v9 = v9 + v.jumpHeightMultiplier;
                end;
            end;

            if v.airJumps ~= nil then
                v8 = v8 + v.airJumps;
            end;
        end;

        u5.jumpSpeedMultiplier = v10 and 0 or (v9 == 0 and 1 or v9) / (v7 == 0 and 1 or v7);
        u5.allowedAirJumps = v8;
        u5:setJumpHeight(StarterPlayer.CharacterJumpHeight);
    end);
end;

function u3.KnitStart(u11) -- Line: 65
    -- upvalues: KnitController (copy), WatchCharacter (copy), Players (copy), default (copy), UserInputService (copy), Workspace (copy), default2 (copy)
    KnitController.KnitStart(u11);
    WatchCharacter(function(p12, p13, p14) -- Line: 67
        -- upvalues: Players (ref), default (ref), u11 (copy), UserInputService (ref), Workspace (ref), default2 (ref)
        if p12 ~= Players.LocalPlayer then
            return nil;
        end;

        local Humanoid = p13:WaitForChild("Humanoid", 1);

        if Humanoid == nil then
            default.Warn("Could not find humanoid");

            return nil;
        end;

        u11.jumpModifier:clear();
        local u15 = false;
        local u16 = false;
        local u17 = 0;
        local u18 = -1;
        p14:GiveTask(Humanoid.StateChanged:Connect(function(p19, p20) -- Line: 81
            -- upvalues: u16 (ref), u17 (ref), u11 (ref)
            if p20 ~= Enum.HumanoidStateType.Landed then
                if p20 == Enum.HumanoidStateType.Freefall then
                    u16 = true;
                end;

                return;
            end;

            u16 = false;
            u17 = 0;

            local function _(p21) -- Line: 86
                -- upvalues: u11 (ref)
                if p21.deleteWhenLanded then
                    u11.jumpModifier:removeModifier(p21);
                end;
            end;

            for i in u11.jumpModifier:getModifiers() do
                if i.deleteWhenLanded then
                    u11.jumpModifier:removeModifier(i);
                end;
            end;
        end));
        p14:GiveTask(UserInputService.JumpRequest:Connect(function() -- Line: 98
            -- upvalues: u15 (ref), u11 (ref), u16 (ref), u17 (ref), u18 (ref), Workspace (ref), default2 (ref), Humanoid (copy)
            if u15 then
                return nil;
            end;

            if u11.allowedAirJumps < 1 then
                return nil;
            end;

            u15 = true;

            if u16 and (u17 < u11.allowedAirJumps and u18 < Workspace:GetServerTimeNow()) then
                u18 = Workspace:GetServerTimeNow() + 0.25;
                default2.Client:Get("NotifyAirJump"):SendToServer();
                u17 = u17 + 1;
                Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
            end;

            task.wait(0.25);
            u15 = false;
        end));
    end);
end;

function u3.setJumpHeight(p22, p23) -- Line: 118
    -- upvalues: Players (copy)
    local v24 = Players.LocalPlayer.Character and Players.LocalPlayer.Character:WaitForChild("Humanoid");

    if v24 then
        v24.JumpHeight = p23 * p22.jumpSpeedMultiplier;
    end;
end;

function u3.getJumpModifier(p25) -- Line: 126
    return p25.jumpModifier;
end;

KnitClient.CreateController(u3.new());

return nil;