-- Decompiled with Potassium's decompiler.

local None = require(script.Parent.None);

return function(p1, ...) -- Line: 9, Name: assign
    -- upvalues: None (copy)
    for i = 1, select("#", ...) do
        local v2 = select(i, ...);

        if v2 ~= nil then
            for i2, v in pairs(v2) do
                if v == None then
                    p1[i2] = nil;
                else
                    p1[i2] = v;
                end;
            end;
        end;
    end;

    return p1;
end;