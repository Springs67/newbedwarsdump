-- Decompiled with Potassium's decompiler.

local Binding = require(script.Parent.Binding);

return function() -- Line: 7, Name: createRef
    -- upvalues: Binding (copy)
    local u1, _ = Binding.create(nil);
    local v2 = {};
    setmetatable(v2, {
        __index = function(p3, p4) -- Line: 16, Name: __index
            -- upvalues: u1 (copy)
            if p4 == "current" then
                return u1:getValue();
            end;

            return u1[p4];
        end,

        __newindex = function(p5, p6, p7) -- Line: 23, Name: __newindex
            -- upvalues: u1 (copy)
            if p6 == "current" then
                error("Cannot assign to the \'current\' property of refs", 2);
            end;

            u1[p6] = p7;
        end,

        __tostring = function(p8) -- Line: 30, Name: __tostring
            -- upvalues: u1 (copy)
            return ("RoactRef(%s)"):format((tostring(u1:getValue())));
        end
    });

    return v2;
end;