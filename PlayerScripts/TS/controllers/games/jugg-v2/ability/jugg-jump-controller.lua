-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "JuggJumpController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 20
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 24
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p5);
    p5.Name = "JuggJumpController";
    p5.jumpMaid = u2.new();
end;

function u3.KnitStart(u6) -- Line: 29
    -- upvalues: KnitController (copy), default (copy), Players (copy), KnitClient2 (copy)
    KnitController.KnitStart(u6);
    default.Client:Get("NewJuggernaut"):Connect(function(p7) -- Line: 31
        -- upvalues: Players (ref), KnitClient2 (ref), u6 (copy)
        if p7.player ~= Players.LocalPlayer then
            return nil;
        end;

        task.wait(2);
        local v8 = KnitClient2.Controllers.JumpHeightController:getJumpModifier():addModifier({
            airJumps = 1
        });
        u6.jumpMaid:GiveTask(v8);
    end);
    default.Client:Get("EntityDeathEvent"):Connect(function(p9) -- Line: 41
        -- upvalues: Players (ref), u6 (copy)
        if Players:GetPlayerFromCharacter(p9.entityInstance) == Players.LocalPlayer then
            u6.jumpMaid:DoCleaning();
        end;
    end);
end;

KnitClient.CreateController(u3.new());

return nil;