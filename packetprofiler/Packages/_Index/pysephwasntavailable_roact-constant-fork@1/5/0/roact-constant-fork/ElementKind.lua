-- Decompiled with Potassium's decompiler.

local Symbol = require(script.Parent.Symbol);
local strict = require(script.Parent.strict);
local Portal = require(script.Parent.Portal);
local u1 = newproxy(true);
local v3 = {
    Portal = Symbol.named("Portal"),
    Host = Symbol.named("Host"),
    Function = Symbol.named("Function"),
    Stateful = Symbol.named("Stateful"),
    Fragment = Symbol.named("Fragment"),

    of = function(p2) -- Line: 25, Name: of
        -- upvalues: u1 (copy)
        if typeof(p2) == "table" then
            return p2[u1];
        end;

        return nil;
    end
};
local u4 = {
    string = v3.Host,
    ["function"] = v3.Function,
    table = v3.Stateful
};

function v3.fromComponent(p5) -- Line: 39
    -- upvalues: Portal (copy), u1 (copy), u4 (copy)
    if p5 == Portal then
        return u1.Portal;
    end;

    return u4[typeof(p5)];
end;

getmetatable(u1).__index = v3;
strict(v3, "ElementKind");

return u1;