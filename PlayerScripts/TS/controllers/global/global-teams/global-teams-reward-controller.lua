-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 9, Name: __tostring
        return "GlobalTeamsRewardController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 15
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 19
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "GlobalTeamsRewardController";
end;

function u1.KnitStart(p4) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p4);
end;

KnitClient.CreateController(u1.new());

return nil;