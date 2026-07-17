-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local RunService = v1.RunService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ConfigType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-type").ConfigType;
local getConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-util").getConfig;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "CharacterPhysicsController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 20
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, ...) -- Line: 24
    -- upvalues: KnitController (copy), getConfig (copy), ConfigType (copy)
    KnitController.constructor(p4, ...);
    p4.Name = "CharacterPhysicsController";
    p4.maxFallSpeed = getConfig(ConfigType.TerminalFallSpeed);
end;

function u2.KnitStart(u5) -- Line: 29
    -- upvalues: KnitController (copy), RunService (copy), Players (copy)
    KnitController.KnitStart(u5);
    RunService.Heartbeat:Connect(function() -- Line: 31
        -- upvalues: Players (ref), u5 (copy)
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        if not Character then
            return nil;
        end;

        local AssemblyLinearVelocity = Character.AssemblyLinearVelocity;
        local v6 = -u5.maxFallSpeed;

        if v6 <= AssemblyLinearVelocity.Y then
            return nil;
        end;

        Character.AssemblyLinearVelocity = Vector3.new(AssemblyLinearVelocity.X, v6, AssemblyLinearVelocity.Z);
    end);
end;

KnitClient.CreateController(u2.new());

return nil;