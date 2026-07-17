-- Decompiled with Potassium's decompiler.

local u1 = setmetatable({}, {
    __tostring = function() -- Line: 5, Name: __tostring
        return "NumberSequenceBuilder";
    end
});
u1.__index = u1;

function u1.new(...) -- Line: 10
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 14
    p3.keypoints = {};
end;

function u1.addKeypoint(p4, p5, p6) -- Line: 17
    local keypoints = p4.keypoints;
    local v7 = NumberSequenceKeypoint.new(p5, p6);
    table.insert(keypoints, v7);

    return p4;
end;

function u1.build(p8) -- Line: 23
    if #p8.keypoints == 1 then
        return NumberSequence.new(p8.keypoints[1].Value);
    end;

    return NumberSequence.new(p8.keypoints);
end;

return {
    NumberSequenceBuilder = u1
};