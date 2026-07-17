-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "FireworkArrowController";
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
    p3.Name = "FireworkArrowController";
end;

function u1.KnitStart(p4) -- Line: 25
    -- upvalues: KnitController (copy), default (copy), KnitClient (copy), FireworkType (copy)
    KnitController.KnitStart(p4);
    default.Client:OnEvent("FireworkArrowExplode", function(p5) -- Line: 27
        -- upvalues: KnitClient (ref), FireworkType (ref)
        KnitClient.Controllers.FireworkController:playFireworkEffect(p5.position, FireworkType.NORMAL);
    end);
end;

KnitClient.CreateController(u1.new());

return nil;