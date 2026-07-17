-- Decompiled with Potassium's decompiler.

local u1 = {
    internalTypeChecks = false,
    typeChecks = false,
    elementTracing = false,
    propValidation = false
};
local u2 = {};

for i in pairs(u1) do
    table.insert(u2, i);
end;

local u3 = {};

function u3.new() -- Line: 35
    -- upvalues: u2 (copy), u3 (copy), u1 (copy)
    local u7 = {
        _currentConfig = setmetatable({}, {
            __index = function(p4, p5) -- Line: 39, Name: __index
                -- upvalues: u2 (ref)
                local v6 = ("Invalid global configuration key %q. Valid configuration keys are: %s"):format(tostring(p5), table.concat(u2, ", "));
                error(v6, 3);
            end
        })
    };

    function u7.set(...) -- Line: 52
        -- upvalues: u3 (ref), u7 (copy)
        return u3.set(u7, ...);
    end;

    function u7.get(...) -- Line: 56
        -- upvalues: u3 (ref), u7 (copy)
        return u3.get(u7, ...);
    end;

    function u7.scoped(...) -- Line: 60
        -- upvalues: u3 (ref), u7 (copy)
        return u3.scoped(u7, ...);
    end;

    u7.set(u1);

    return u7;
end;

function u3.set(p8, p9) -- Line: 69
    -- upvalues: u1 (copy), u2 (copy)
    for i, v in pairs(p9) do
        if u1[i] == nil then
            local v10 = ("Invalid global configuration key %q (type %s). Valid configuration keys are: %s"):format(tostring(i), typeof(i), table.concat(u2, ", "));
            error(v10, 3);
        end;

        if typeof(v) ~= "boolean" then
            local v11 = ("Invalid value %q (type %s) for global configuration key %q. Valid values are: true, false"):format(tostring(v), typeof(v), (tostring(i)));
            error(v11, 3);
        end;

        p8._currentConfig[i] = v;
    end;
end;

function u3.get(p12) -- Line: 96
    return p12._currentConfig;
end;

function u3.scoped(p13, p14, p15) -- Line: 100
    local v16 = {};

    for i, v in pairs(p13._currentConfig) do
        v16[i] = v;
    end;

    p13.set(p14);
    local success, result = pcall(p15);
    p13.set(v16);
    assert(success, result);
end;

return u3;