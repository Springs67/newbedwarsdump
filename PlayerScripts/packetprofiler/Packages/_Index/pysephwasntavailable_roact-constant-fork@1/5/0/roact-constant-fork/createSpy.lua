-- Decompiled with Potassium's decompiler.

local assertDeepEqual = require(script.Parent.assertDeepEqual);

return function(u1) -- Line: 11, Name: createSpy
    -- upvalues: assertDeepEqual (copy)
    local u2 = {
        callCount = 0,
        values = {},
        valuesLength = 0
    };

    function u2.value(...) -- Line: 16
        -- upvalues: u2 (copy), u1 (copy)
        u2.callCount = u2.callCount + 1;
        u2.values = { ... };
        u2.valuesLength = select("#", ...);

        if u1 == nil then
            return nil;
        end;

        return u1(...);
    end;

    function u2.assertCalledWith(p3, ...) -- Line: 27
        -- upvalues: u2 (copy)
        local v4 = select("#", ...);

        if u2.valuesLength ~= v4 then
            error(("Expected %d arguments, but was called with %d arguments"):format(u2.valuesLength, v4), 2);
        end;

        for i = 1, v4 do
            local v5 = select(i, ...) == u2.values[i];
            assert(v5, "value differs");
        end;
    end;

    function u2.assertCalledWithDeepEqual(p6, ...) -- Line: 41
        -- upvalues: u2 (copy), assertDeepEqual (ref)
        local v7 = select("#", ...);

        if u2.valuesLength ~= v7 then
            error(("Expected %d arguments, but was called with %d arguments"):format(u2.valuesLength, v7), 2);
        end;

        for i = 1, v7 do
            local v8 = select(i, ...);
            assertDeepEqual(u2.values[i], v8);
        end;
    end;

    function u2.captureValues(p9, ...) -- Line: 55
        -- upvalues: u2 (copy)
        local v10 = select("#", ...);
        assert(u2.valuesLength == v10, "length of expected values differs from stored values");
        local v11 = {};

        for i = 1, v10 do
            v11[select(i, ...)] = u2.values[i];
        end;

        return v11;
    end;

    setmetatable(u2, {
        __index = function(p12, p13) -- Line: 70, Name: __index
            error(("%q is not a valid member of spy"):format(p13));
        end
    });

    return u2;
end;