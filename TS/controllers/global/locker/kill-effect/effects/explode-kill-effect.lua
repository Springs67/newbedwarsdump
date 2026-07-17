-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 9, Name: __tostring
        return "Anonymous";
    end,

    __index = KillEffect
});
u1.__index = u1;

function u1.new(...) -- Line: 15
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, ...) -- Line: 19
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p3, ...);
end;

function u1.onKill(p4, p5, p6, p7) -- Line: 22
    -- upvalues: KnitClient (copy)
    return KnitClient.Controllers.ExplosionController:playExplodeEffect(p7.Position, 0.5, {});
end;

return u1;