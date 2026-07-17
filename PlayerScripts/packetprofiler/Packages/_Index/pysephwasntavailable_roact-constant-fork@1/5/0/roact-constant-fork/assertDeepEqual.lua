-- Decompiled with Potassium's decompiler.

local function deepEqual(p1, p2) -- Line: 10
    -- upvalues: deepEqual (copy)
    if typeof(p1) ~= typeof(p2) then
        return false, ("{1} is of type %s, but {2} is of type %s"):format(typeof(p1), (typeof(p2)));
    end;

    if typeof(p1) ~= "table" then
        if p1 == p2 then
            return true, nil;
        end;

        return false, "{1} ~= {2}";
    end;

    local v3 = {};

    for i, v in pairs(p1) do
        v3[i] = true;
        local v4, v5 = deepEqual(v, p2[i]);

        if not v4 and v5 then
            return false, v5:gsub("{1}", ("{1}[%s]"):format((tostring(i)))):gsub("{2}", ("{2}[%s]"):format((tostring(i))));
        end;
    end;

    for i, v in pairs(p2) do
        if not v3[i] then
            local v6, v7 = deepEqual(v, p1[i]);

            if not v6 and v7 then
                return false, v7:gsub("{1}", ("{1}[%s]"):format((tostring(i)))):gsub("{2}", ("{2}[%s]"):format((tostring(i))));
            end;
        end;
    end;

    return true, nil;
end;

return function(p8, p9) -- Line: 57, Name: assertDeepEqual
    -- upvalues: deepEqual (copy)
    local v10, v11 = deepEqual(p8, p9);

    if not v10 and v11 then
        local v12 = ("Values were not deep-equal.\n%s"):format((v11:gsub("{1}", "first"):gsub("{2}", "second")));
        error(v12, 2);
    end;
end;