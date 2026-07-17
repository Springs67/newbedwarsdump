-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local SmokeStatusEffectHandler = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "smoke", "smoke-status-effect-handler").SmokeStatusEffectHandler;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "SmokeBombController";
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
    p3.Name = "SmokeBombController";
end;

function u1.KnitStart(p4) -- Line: 25
    -- upvalues: KnitController (copy), KnitClient (copy), StatusEffectType (copy), SmokeStatusEffectHandler (copy)
    KnitController.KnitStart(p4);
    KnitClient.Controllers.StatusEffectController:setHandler(StatusEffectType.SMOKE_INVISIBILITY, SmokeStatusEffectHandler);
end;

KnitClient.CreateController(u1.new());

return nil;