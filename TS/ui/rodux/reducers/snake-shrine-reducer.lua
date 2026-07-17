-- Decompiled with Potassium's decompiler.

local u1 = {
    costMultipliers = {},
    buffCounts = {},
    activeBuffCounts = {}
};

return {
    SnakeShrineReducer = function(p2, p3) -- Line: 7, Name: SnakeShrineReducer
        -- upvalues: u1 (copy)
        if p2 == nil then
            p2 = u1;
        end;

        local v4 = {};

        for i, v in p2 do
            v4[i] = v;
        end;

        if p3.type ~= "UpdateSnakeShrinePurchaseState" then
            return v4;
        end;

        v4.costMultipliers = p3.costMultipliers;
        v4.buffCounts = p3.buffCounts;
        v4.activeBuffCounts = p3.activeBuffCounts;

        return v4;
    end
};