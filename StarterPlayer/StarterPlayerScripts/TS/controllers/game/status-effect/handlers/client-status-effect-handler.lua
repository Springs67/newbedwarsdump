local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
return {
    ["ClientStatusEffectHandler"] = {
        ["constructor"] = function(p2) --[[ Name: constructor, Line 7 ]]
            --[[
            Upvalues:
                [1] = u1
            --]]
            p2.maid = u1.new()
        end,
        ["apply"] = function(p3, p4, p5) --[[ Name: apply, Line 10 ]]
            p3:onApply(p4, p5)
        end,
        ["remove"] = function(p6, p7, p8) --[[ Name: remove, Line 13 ]]
            p6.maid:DoCleaning()
            p6:onRemove(p7, p8)
        end
    }
}