-- Decompiled with Potassium's decompiler.

local u1 = setmetatable({}, {
    __tostring = function() -- Line: 5, Name: __tostring
        return "DebrisComponent";
    end
});
u1.__index = u1;

function u1.new(...) -- Line: 10
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, u4) -- Line: 14
    local v5 = u4:GetAttribute("DestroyAfter");
    task.delay(v5 == nil and 300 or v5, function() -- Line: 21
        -- upvalues: u4 (copy)
        u4:Destroy();
    end);
end;

function u1.Destroy(p6) -- Line: 25
end;

u1.Tag = "DebrisComponent";

return u1;