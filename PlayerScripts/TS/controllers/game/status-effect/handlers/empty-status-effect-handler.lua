-- Decompiled with Potassium's decompiler.

local ClientStatusEffectHandler = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent, "client-status-effect-handler").ClientStatusEffectHandler;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 8, Name: __tostring
        return "EmptyStatusEffectHandler";
    end,

    __index = ClientStatusEffectHandler
});
u1.__index = u1;

function u1.new(...) -- Line: 14
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, ...) -- Line: 18
    -- upvalues: ClientStatusEffectHandler (copy)
    ClientStatusEffectHandler.constructor(p3, ...);
end;

function u1.onApply(p4, p5, p6) -- Line: 21
end;

function u1.onRemove(p7, p8, p9) -- Line: 23
end;

return {
    EmptyStatusEffectHandler = u1
};