-- Decompiled with Potassium's decompiler.

local CancellableEvent = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").CancellableEvent;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 9, Name: __tostring
        return "SwordChargeEvent";
    end,

    __index = CancellableEvent
});
u1.__index = u1;

function u1.new(...) -- Line: 15
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, p4, p5, p6) -- Line: 19
    -- upvalues: CancellableEvent (copy)
    CancellableEvent.constructor(p3);
    p3.chargeState = p4;
    p3.itemType = p5;
    p3.refId = p6;
end;

return {
    SwordChargeEvent = u1
};