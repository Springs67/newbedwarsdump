-- Decompiled with Potassium's decompiler.

local u1 = setmetatable({}, {
    __tostring = function() -- Line: 5, Name: __tostring
        return "GuidedProjectileDetonateEvent";
    end
});
u1.__index = u1;

function u1.new(...) -- Line: 10
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, p4, p5) -- Line: 14
    p3.guidedProjectileType = p4;
    p3.position = p5;
end;

local u6 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "GuidedProjectileRemovedEvent";
    end
});
u6.__index = u6;

function u6.new(...) -- Line: 27
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, p9, p10) -- Line: 31
    p8.guidedProjectileType = p9;
    p8.model = p10;
end;

local u11 = setmetatable({}, {
    __tostring = function() -- Line: 39, Name: __tostring
        return "GuidedProjectileDisablingEvent";
    end
});
u11.__index = u11;

function u11.new(...) -- Line: 44
    -- upvalues: u11 (ref)
    local v12 = setmetatable({}, u11);

    return v12:constructor(...) or v12;
end;

function u11.constructor(p13, p14, p15) -- Line: 48
    p13.guidedProjectileType = p14;
    p13.model = p15;
end;

local u16 = setmetatable({}, {
    __tostring = function() -- Line: 56, Name: __tostring
        return "GuidedProjectileEnablingEvent";
    end
});
u16.__index = u16;

function u16.new(...) -- Line: 61
    -- upvalues: u16 (ref)
    local v17 = setmetatable({}, u16);

    return v17:constructor(...) or v17;
end;

function u16.constructor(p18, p19, p20) -- Line: 65
    p18.guidedProjectileType = p19;
    p18.model = p20;
end;

return {
    GuidedProjectileDetonateEvent = u1,
    GuidedProjectileRemovedEvent = u6,
    GuidedProjectileDisablingEvent = u11,
    GuidedProjectileEnablingEvent = u16
};