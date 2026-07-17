-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local RunService = v1.RunService;
local UserInputService = v1.UserInputService;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local SummerWarsWaterAttr = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").SummerWarsWaterAttr;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "SummerWarsController";
    end,

    __index = GameKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 26
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 30
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p4, { GameType.SUMMER_WARS });
    p4.Name = "SummerWarsController";
    p4.lastWaterSwimUpRequest = 0;
end;

function u2.KnitStart(p5) -- Line: 35
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p5);
end;

function u2.onGameInit(u6) -- Line: 38
    -- upvalues: UserInputService (copy), WatchCharacter (copy), Players (copy), SummerWarsWaterAttr (copy), KnitClient (copy), RunService (copy)
    UserInputService.JumpRequest:Connect(function() -- Line: 39
        -- upvalues: u6 (copy)
        u6.lastWaterSwimUpRequest = os.clock();
    end);
    WatchCharacter(function(p7, u8, p9) -- Line: 42
        -- upvalues: Players (ref), SummerWarsWaterAttr (ref), u6 (copy), KnitClient (ref), RunService (ref)
        if p7 ~= Players.LocalPlayer then
            return nil;
        end;

        local function v10() -- Line: 46
            -- upvalues: u8 (copy), SummerWarsWaterAttr (ref), u6 (ref), KnitClient (ref)
            if u8:GetAttribute(SummerWarsWaterAttr.Name) == true then
                if u6.waterSwimSpeedModifier then
                    return nil;
                end;

                u6.waterSwimSpeedModifier = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    moveSpeedMultiplier = 0.675
                });

                return nil;
            end;

            local waterSwimSpeedModifier = u6.waterSwimSpeedModifier;

            if waterSwimSpeedModifier ~= nil then
                waterSwimSpeedModifier:Destroy();
            end;

            u6.waterSwimSpeedModifier = nil;
        end;

        p9:GiveTask(u8:GetAttributeChangedSignal(SummerWarsWaterAttr.Name):Connect(v10));
        p9:GiveTask(function() -- Line: 63
            -- upvalues: u6 (ref)
            local waterSwimSpeedModifier = u6.waterSwimSpeedModifier;

            if waterSwimSpeedModifier ~= nil then
                waterSwimSpeedModifier:Destroy();
            end;

            u6.waterSwimSpeedModifier = nil;
        end);
        p9:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 70
            -- upvalues: u6 (ref), u8 (copy)
            u6:applyWaterSwimUpAssist(u8);
        end));
        v10();
    end);
end;

function u2.applyWaterSwimUpAssist(p11, p12) -- Line: 76
    -- upvalues: SummerWarsWaterAttr (copy)
    if p12:GetAttribute(SummerWarsWaterAttr.Name) ~= true then
        return nil;
    end;

    local v13 = p12:FindFirstChildOfClass("Humanoid");

    if not v13 or v13:GetState() ~= Enum.HumanoidStateType.Swimming then
        return nil;
    end;

    local PrimaryPart = p12.PrimaryPart;

    if not PrimaryPart then
        return nil;
    end;

    local AssemblyLinearVelocity = PrimaryPart.AssemblyLinearVelocity;

    if AssemblyLinearVelocity.Y < -4 then
        PrimaryPart.AssemblyLinearVelocity = Vector3.new(AssemblyLinearVelocity.X, -4, AssemblyLinearVelocity.Z);
    end;

    local v14 = os.clock() - p11.lastWaterSwimUpRequest <= 0.25;

    if not (v13.Jump or v14) then
        return nil;
    end;

    local AssemblyLinearVelocity2 = PrimaryPart.AssemblyLinearVelocity;

    if AssemblyLinearVelocity2.Y >= 14 then
        return nil;
    end;

    PrimaryPart.AssemblyLinearVelocity = Vector3.new(AssemblyLinearVelocity2.X, 14, AssemblyLinearVelocity2.Z);
end;

KnitClient.CreateController(u2.new());

return nil;