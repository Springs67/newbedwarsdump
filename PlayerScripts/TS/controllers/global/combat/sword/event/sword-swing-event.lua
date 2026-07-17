-- Decompiled with Potassium's decompiler.

local CancellableEvent = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").CancellableEvent;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 8, Name: __tostring
        return "SwordSwingEvent";
    end,

    __index = CancellableEvent
});
u1.__index = u1;

function u1.new(...) -- Line: 14
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, p4, p5, p6, p7, p8) -- Line: 18
    -- upvalues: CancellableEvent (copy)
    CancellableEvent.constructor(p3);
    p3.targetEntity = p4;
    p3.swordType = p5;
    p3.attackSpeed = p6;
    p3.chargedAttack = p7;
    p3.config = p8;
end;

function u1.bufferAttack(p9, p10) -- Line: 26
    local bufferTime = p9.bufferTime;

    if bufferTime == 0 then
        bufferTime = false;
    elseif bufferTime ~= bufferTime then
        bufferTime = false;
    end;

    if not bufferTime or p10 < p9.bufferTime then
        p9.bufferTime = p10;
    end;
end;

return {
    SwordSwingEvent = u1
};