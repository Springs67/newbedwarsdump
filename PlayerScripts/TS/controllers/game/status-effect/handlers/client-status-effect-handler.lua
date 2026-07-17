-- Decompiled with Potassium's decompiler.

local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");

return {
    ClientStatusEffectHandler = {
        constructor = function(p2) -- Line: 7, Name: constructor
            -- upvalues: u1 (copy)
            p2.maid = u1.new();
        end,

        apply = function(p3, p4, p5) -- Line: 10, Name: apply
            p3:onApply(p4, p5);
        end,

        remove = function(p6, p7, p8) -- Line: 13, Name: remove
            p6.maid:DoCleaning();
            p6:onRemove(p7, p8);
        end
    }
};