-- Decompiled with Potassium's decompiler.

local Type = require(script.Parent.Type);

local function noop() -- Line: 5
    return nil;
end;

local u1 = {
    UseParentKey = require(script.Parent.Symbol).named("UseParentKey")
};

function u1.iterateElements(u2) -- Line: 43
    -- upvalues: Type (copy), u1 (copy), noop (copy)
    if Type.of(u2) == Type.Element then
        local u3 = false;

        return function(p4, p5) -- Line: 50
            -- upvalues: u3 (ref), u1 (ref), u2 (copy)
            if u3 then
                return nil;
            end;

            u3 = true;

            return u1.UseParentKey, u2;
        end;
    end;

    local v6 = typeof(u2);

    if u2 == nil or v6 == "boolean" then
        return noop;
    end;

    if v6 == "table" then
        return pairs(u2);
    end;

    error("Invalid elements");
end;

function u1.getElementByKey(p7, p8) -- Line: 82
    -- upvalues: Type (copy), u1 (copy)
    if p7 == nil or typeof(p7) == "boolean" then
        return nil;
    end;

    if Type.of(p7) == Type.Element then
        if p8 == u1.UseParentKey then
            return p7;
        end;

        return nil;
    end;

    if typeof(p7) == "table" then
        return p7[p8];
    end;

    error("Invalid elements");
end;

return u1;