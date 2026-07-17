-- Decompiled with Potassium's decompiler.

return function(p1, p2) -- Line: 2, Name: strict
    local u3 = p2 or tostring(p1);

    return setmetatable(p1, {
        __index = function(p4, p5) -- Line: 8, Name: __index
            -- upvalues: u3 (copy)
            local v6 = ("%q (%s) is not a valid member of %s"):format(tostring(p5), typeof(p5), u3);
            error(v6, 2);
        end,

        __newindex = function(p7, p8, p9) -- Line: 14, Name: __newindex
            -- upvalues: u3 (copy)
            local v10 = ("%q (%s) is not a valid member of %s"):format(tostring(p8), typeof(p8), u3);
            error(v10, 2);
        end
    });
end;