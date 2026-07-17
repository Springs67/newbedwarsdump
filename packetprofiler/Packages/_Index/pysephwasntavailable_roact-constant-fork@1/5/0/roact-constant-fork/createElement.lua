-- Decompiled with Potassium's decompiler.

local Children = require(script.Parent.PropMarkers.Children);
local ElementKind = require(script.Parent.ElementKind);
local Logging = require(script.Parent.Logging);
local Type = require(script.Parent.Type);
local u1 = require(script.Parent.GlobalConfig).get();

return function(p2, p3, p4) -- Line: 37, Name: createElement
    -- upvalues: u1 (copy), Children (copy), Logging (copy), ElementKind (copy), Type (copy)
    if u1.typeChecks then
        assert(p2 ~= nil, "`component` is required");
        local v5 = typeof(p3) == "table" and true or p3 == nil;
        assert(v5, "`props` must be a table or nil");
        local v6 = typeof(p4) == "table" and true or p4 == nil;
        assert(v6, "`children` must be a table or nil");
    end;

    local v7 = p3 == nil and {} or p3;

    if p4 ~= nil then
        if v7[Children] ~= nil then
            Logging.warnOnce("The prop `Roact.Children` was defined but was overridden by the third parameter to createElement!\nThis can happen when a component passes props through to a child element but also uses the `children` argument:\n\n\tRoact.createElement(\"Frame\", passedProps, {\n\t\tchild = ...\n\t})\n\nInstead, consider using a utility function to merge tables of children together:\n\n\tlocal children = mergeTables(passedProps[Roact.Children], {\n\t\tchild = ...\n\t})\n\n\tlocal fullProps = mergeTables(passedProps, {\n\t\t[Roact.Children] = children\n\t})\n\n\tRoact.createElement(\"Frame\", fullProps)");
        end;

        v7[Children] = p4;
    end;

    local v8 = ElementKind.fromComponent(p2);
    local v9 = {
        [Type] = Type.Element,
        [ElementKind] = v8,
        component = p2,
        props = v7
    };

    if u1.elementTracing then
        v9.source = debug.traceback("", 2):sub(2);
    end;

    return v9;
end;