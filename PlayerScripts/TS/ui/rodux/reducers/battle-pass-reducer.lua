-- Decompiled with Potassium's decompiler.

local BattlePassUtils = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local u1 = {
    experience = 0,
    paid = false,
    level = 1
};

return {
    BattlePassReducer = function(p2, p3) -- Line: 9, Name: BattlePassReducer
        -- upvalues: u1 (copy), BattlePassUtils (copy)
        if p2 == nil then
            p2 = u1;
        end;

        if p3.type == "BattlePassUpdateAll" then
            local v4 = BattlePassUtils.getLevelFromExperience(p3.battlePass.experience);
            local v5 = {};

            for i, v in p2 do
                v5[i] = v;
            end;

            for i, v in p3.battlePass do
                v5[i] = v;
            end;

            v5.level = v4;

            return v5;
        end;

        if p3.type ~= "BattlePassSetXP" then
            if p3.type ~= "BattlePassSetPaid" then
                return p2;
            end;

            local v6 = {};

            for i, v in p2 do
                v6[i] = v;
            end;

            v6.paid = p3.paid;

            return v6;
        end;

        local v7 = BattlePassUtils.getLevelFromExperience(p3.experience);
        local v8 = {};

        for i, v in p2 do
            v8[i] = v;
        end;

        v8.experience = p3.experience;
        v8.level = v7;

        return v8;
    end
};