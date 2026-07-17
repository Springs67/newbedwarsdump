-- Decompiled with Potassium's decompiler.

local Component = require(script.Parent.Component);
local v1 = Component:extend("PureComponent");
v1.extend = Component.extend;

function v1.shouldUpdate(p2, p3, p4) -- Line: 15
    if p4 ~= p2.state then
        return true;
    end;

    if p3 == p2.props then
        return false;
    end;

    for i, v in pairs(p3) do
        if p2.props[i] ~= v then
            return true;
        end;
    end;

    for i, v in pairs(p2.props) do
        if p3[i] ~= v then
            return true;
        end;
    end;

    return false;
end;

return v1;