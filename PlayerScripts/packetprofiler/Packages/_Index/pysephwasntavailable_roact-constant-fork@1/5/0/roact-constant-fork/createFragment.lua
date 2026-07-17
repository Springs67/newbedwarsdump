-- Decompiled with Potassium's decompiler.

local ElementKind = require(script.Parent.ElementKind);
local Type = require(script.Parent.Type);

return function(p1) -- Line: 4, Name: createFragment
    -- upvalues: Type (copy), ElementKind (copy)
    return {
        [Type] = Type.Element,
        [ElementKind] = ElementKind.Fragment,
        elements = p1
    };
end;