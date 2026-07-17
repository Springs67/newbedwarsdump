-- Decompiled with Potassium's decompiler.

local u1 = {
    inventory = {},
    record = {}
};

return {
    ConsumableReducer = function(p2, p3) -- Line: 6, Name: ConsumableReducer
        -- upvalues: u1 (copy)
        if p2 == nil then
            p2 = u1;
        end;

        if p3.type == "ConsumableSetSome" then
            local v4 = {};

            for i, v in p2 do
                v4[i] = v;
            end;

            for i, v in p3.data do
                v4[i] = v;
            end;

            return v4;
        end;

        if p3.type == "ConsumableSetInventory" then
            local v5 = {};

            for i, v in p2 do
                v5[i] = v;
            end;

            v5.inventory = p3.inventory;

            return v5;
        end;

        if p3.type ~= "ConsumableSetRecord" then
            return p2;
        end;

        local v6 = {};

        for i, v in p2 do
            v6[i] = v;
        end;

        v6.record = p3.record;

        return v6;
    end
};