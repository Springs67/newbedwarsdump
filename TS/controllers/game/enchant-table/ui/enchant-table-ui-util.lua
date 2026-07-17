-- Decompiled with Potassium's decompiler.

local ItemType = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;

return {
    EnchantTableUIUtil = {
        getThemeColor = function(p1) -- Line: 7
            -- upvalues: ItemType (copy)
            local v2 = Color3.fromRGB(255, 173, 69);

            if p1 == ItemType.ENCHANT_TABLE_GLITCHED then
                v2 = Color3.fromRGB(64, 255, 255);
            end;

            return v2;
        end,

        convertToRoman = function(p3) -- Line: 15
            local v4 = {
                M = 1000,
                CM = 900,
                D = 500,
                CD = 400,
                C = 100,
                XC = 90,
                L = 50,
                XL = 40,
                X = 10,
                IX = 9,
                V = 5,
                IV = 4,
                I = 1
            };
            local v5 = "";

            for _, v in { "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" } do
                local v6 = math.floor(p3 / v4[v]);
                p3 = p3 - v6 * v4[v];
                v5 = v5 .. string.rep(v, v6);
            end;

            return v5;
        end
    }
};