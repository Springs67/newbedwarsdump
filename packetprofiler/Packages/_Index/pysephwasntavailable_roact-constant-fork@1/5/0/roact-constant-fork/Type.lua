-- Decompiled with Potassium's decompiler.

local Symbol = require(script.Parent.Symbol);
local strict = require(script.Parent.strict);
local u1 = newproxy(true);
local u2 = {};

local function addType(p3) -- Line: 19
    -- upvalues: u2 (copy), Symbol (copy)
    u2[p3] = Symbol.named("Roact" .. p3);
end;

u2.Binding = Symbol.named("RoactBinding");
u2.Element = Symbol.named("RoactElement");
u2.HostChangeEvent = Symbol.named("RoactHostChangeEvent");
u2.HostEvent = Symbol.named("RoactHostEvent");
u2.StatefulComponentClass = Symbol.named("RoactStatefulComponentClass");
u2.StatefulComponentInstance = Symbol.named("RoactStatefulComponentInstance");
u2.VirtualNode = Symbol.named("RoactVirtualNode");
u2.VirtualTree = Symbol.named("RoactVirtualTree");

function u2.of(p4) -- Line: 32
    -- upvalues: u1 (copy)
    if typeof(p4) == "table" then
        return p4[u1];
    end;

    return nil;
end;

getmetatable(u1).__index = u2;

getmetatable(u1).__tostring = function() -- Line: 42
    return "RoactType";
end;

strict(u2, "Type");

return u1;