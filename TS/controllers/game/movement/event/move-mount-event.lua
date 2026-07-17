-- Decompiled with Potassium's decompiler.

local v1 = {};
local v2 = setmetatable({}, {
    __index = v1
});
v2.UP = 0;
v1[0] = "UP";
v2.DOWN = 1;
v1[1] = "DOWN";
local v3 = {};
local v4 = setmetatable({}, {
    __index = v3
});
v4.PRESS = 0;
v3[0] = "PRESS";
v4.RELEASE = 1;
v3[1] = "RELEASE";
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "MoveMountEvent";
    end
});
u5.__index = u5;

function u5.new(...) -- Line: 32
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8, p9) -- Line: 36
    p7.direction = p8;
    p7.inputActionType = p9;
end;

return {
    MoveMountDirection = v2,
    InputActionType = v4,
    MoveMountEvent = u5
};