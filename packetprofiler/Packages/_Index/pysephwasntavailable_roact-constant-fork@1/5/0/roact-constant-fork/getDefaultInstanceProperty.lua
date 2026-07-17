-- Decompiled with Potassium's decompiler.

local u1 = require(script.Parent.Symbol).named("Nil");
local u2 = {};

return function(p3, u4) -- Line: 16, Name: getDefaultInstanceProperty
    -- upvalues: u2 (copy), u1 (copy)
    local v5 = u2[p3];

    if v5 then
        local v6 = v5[u4];

        if v6 == u1 then
            return true, nil;
        end;

        if v6 ~= nil then
            return true, v6;
        end;
    else
        v5 = {};
        u2[p3] = v5;
    end;

    local u7 = Instance.new(p3);
    local success, result = pcall(function() -- Line: 37
        -- upvalues: u7 (copy), u4 (copy)
        return u7[u4];
    end);
    u7:Destroy();

    if success then
        if result == nil then
            v5[u4] = u1;

            return success, result;
        end;

        v5[u4] = result;
    end;

    return success, result;
end;