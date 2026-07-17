-- Decompiled with Potassium's decompiler.

local u1 = setmetatable({}, {
    __tostring = function() -- Line: 6, Name: __tostring
        return "CancelEmoteClientEvent";
    end
});
u1.__index = u1;

function u1.new(...) -- Line: 11
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 15
end;

return {
    CancelEmoteClientEvent = u1
};