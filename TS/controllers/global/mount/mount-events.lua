-- Decompiled with Potassium's decompiler.

local u1 = setmetatable({}, {
    __tostring = function() -- Line: 5, Name: __tostring
        return "GenericMountMounted";
    end
});
u1.__index = u1;

function u1.new(...) -- Line: 10
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, p4, p5, p6, p7) -- Line: 14
    p3.player = p4;
    p3.mountType = p5;
    p3.model = p6;
    p3.character = p7;
end;

local u8 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "GenericMountDismounted";
    end
});
u8.__index = u8;

function u8.new(...) -- Line: 29
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10, p11, p12) -- Line: 33
    p10.player = p11;
    p10.mountType = p12;
end;

return {
    GenericMountMounted = u1,
    GenericMountDismounted = u8
};