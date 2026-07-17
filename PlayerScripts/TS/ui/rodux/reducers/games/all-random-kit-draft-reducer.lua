-- Decompiled with Potassium's decompiler.

local u1 = {
    kitSelection = {},
    kitPool = {},
    playerRerolls = {}
};

return {
    ARKDraftReducer = function(p2, p3) -- Line: 7, Name: ARKDraftReducer
        -- upvalues: u1 (copy)
        if p2 == nil then
            p2 = u1;
        end;

        if p3.type ~= "SetARKDraft" then
            return p2;
        end;

        local v4 = {};

        for i, v in p2 do
            v4[i] = v;
        end;

        for i, v in p3.data do
            v4[i] = v;
        end;

        return v4;
    end
};