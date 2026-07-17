-- Decompiled with Potassium's decompiler.

local u1 = {
    allKitProgress = {},
    effectUnlocks = {},
    allKitXpPotential = {},
    selectedArmorTrimConfigs = {}
};

return {
    ArmorTrimReducer = function(p2, p3) -- Line: 8, Name: ArmorTrimReducer
        -- upvalues: u1 (copy)
        if p2 == nil then
            p2 = u1;
        end;

        if p3.type ~= "SetArmorTrimData" then
            return p2;
        end;

        local v4 = {};

        for i, v in p2 do
            v4[i] = v;
        end;

        v4.allKitProgress = p3.allKitProgress;
        v4.effectUnlocks = p3.effectUnlocks;
        v4.allKitXpPotential = p3.allKitXpPotential;
        v4.selectedArmorTrimConfigs = p3.selectedArmorTrimConfigs;

        return v4;
    end
};