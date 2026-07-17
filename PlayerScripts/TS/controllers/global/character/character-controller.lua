-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local CharacterUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "character", "character-util").CharacterUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "CharacterController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 19
    -- upvalues: u1 (copy)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "CharacterController";
end;

function u1.KnitStart(p4) -- Line: 27
    -- upvalues: WatchCharacter (copy), CharacterUtil (copy), Players (copy)
    WatchCharacter(function(p5, u6) -- Line: 28
        -- upvalues: CharacterUtil (ref), Players (ref)
        local Humanoid = u6:WaitForChild("Humanoid");
        Humanoid.Died:Connect(function() -- Line: 30
            -- upvalues: CharacterUtil (ref), u6 (copy)
            return CharacterUtil.breakJoints(u6);
        end);

        if p5 == Players.LocalPlayer then
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false);
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false);
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;