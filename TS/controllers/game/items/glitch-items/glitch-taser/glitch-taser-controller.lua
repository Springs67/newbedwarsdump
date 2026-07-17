-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "GlitchTaserController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 17
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 21
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "GlitchTaserController";
end;

function u1.KnitStart(u4) -- Line: 25
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u4);
    default.Client:OnEvent("Tase", function(p5) -- Line: 27
        -- upvalues: u4 (copy)
        u4:taseSelf(p5.duration);
    end);
end;

function u1.taseSelf(p6, p7) -- Line: 31
    -- upvalues: Players (copy)
    local Character = Players.LocalPlayer.Character;

    if Character then
        Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
        local HumanoidRootPart = Character.HumanoidRootPart;
        local v8 = math.random(-30, 30);
        local v9 = math.random(-30, 30);
        HumanoidRootPart:ApplyAngularImpulse(Vector3.new(v8, v9, math.random(-30, 30)) * Character.HumanoidRootPart.AssemblyMass);
        task.delay(p7, function() -- Line: 39
            -- upvalues: Character (copy)
            Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running);
        end);
    end;
end;

KnitClient.CreateController(u1.new());

return nil;