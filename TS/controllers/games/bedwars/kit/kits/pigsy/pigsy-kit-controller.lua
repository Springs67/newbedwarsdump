-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "PigsyKitController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 18
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 22
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p5);
    p5.Name = "PigsyKitController";
    p5.maid = u2.new();
end;

function u3.KnitStart(u6) -- Line: 27
    -- upvalues: KnitController (copy), KnitClient2 (copy)
    KnitController.KnitStart(u6);
    KnitClient2.Controllers.KitController:watchLocalKit(function(p7) -- Line: 29
        -- upvalues: u6 (copy)
        u6.maid:DoCleaning();
    end);
end;

KnitClient.CreateController(u3.new());

return nil;