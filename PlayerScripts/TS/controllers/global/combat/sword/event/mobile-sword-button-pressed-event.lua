-- Decompiled with Potassium's decompiler.

local CancellableEvent = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").CancellableEvent;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 8, Name: __tostring
        return "MobileSwordButtonPressedEvent";
    end,

    __index = CancellableEvent
});
u1.__index = u1;

function u1.new(...) -- Line: 14
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, p4, p5) -- Line: 18
    -- upvalues: CancellableEvent (copy)
    CancellableEvent.constructor(p3);
    p3.state = p4;
    p3.input = p5;
end;

return {
    MobileSwordButtonPressedEvent = u1
};