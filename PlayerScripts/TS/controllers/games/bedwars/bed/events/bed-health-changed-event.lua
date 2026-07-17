-- Decompiled with Potassium's decompiler.

local u1 = setmetatable({}, {
    __tostring = function() -- Line: 5, Name: __tostring
        return "BedDamagedEvent";
    end
});
u1.__index = u1;

function u1.new(...) -- Line: 10
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, p4, p5, p6, p7) -- Line: 14
    p3.teamId = p4;
    p3.bedHealth = p5;
    p3.platingHealth = p6;
    p3.platingDamaged = p7;
end;

return {
    BedDamagedEvent = u1
};