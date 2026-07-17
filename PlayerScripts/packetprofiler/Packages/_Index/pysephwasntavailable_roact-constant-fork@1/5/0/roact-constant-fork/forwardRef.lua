-- Decompiled with Potassium's decompiler.

local assign = require(script.Parent.assign);
local None = require(script.Parent.None);
local Ref = require(script.Parent.PropMarkers.Ref);
local u1 = require(script.Parent.GlobalConfig).get();
local u2 = {
    [Ref] = None
};

return function(u3) -- Line: 15, Name: forwardRef
    -- upvalues: u1 (copy), Ref (copy), assign (copy), u2 (copy)
    if u1.typeChecks then
        local v4 = typeof(u3) == "function";
        assert(v4, "Expected arg #1 to be a function");
    end;

    return function(p5) -- Line: 20
        -- upvalues: Ref (ref), assign (ref), u2 (ref), u3 (copy)
        local v6 = p5[Ref];

        return u3(assign({}, p5, u2), v6);
    end;
end;