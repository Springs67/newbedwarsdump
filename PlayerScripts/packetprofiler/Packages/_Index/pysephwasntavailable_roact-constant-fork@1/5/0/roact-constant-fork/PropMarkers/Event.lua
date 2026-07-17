-- Decompiled with Potassium's decompiler.

local Type = require(script.Parent.Parent.Type);
local u1 = {};
local u3 = {
    __tostring = function(p2) -- Line: 21, Name: __tostring
        return ("RoactHostEvent(%s)"):format(p2.name);
    end
};
setmetatable(u1, {
    __index = function(p4, p5) -- Line: 27, Name: __index
        -- upvalues: Type (copy), u3 (copy), u1 (copy)
        local v6 = {
            [Type] = Type.HostEvent,
            name = p5
        };
        setmetatable(v6, u3);
        u1[p5] = v6;

        return v6;
    end
});

return u1;