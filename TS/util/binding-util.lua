local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["BindingFromMotor"] = function(p2) --[[ Name: BindingFromMotor, Line 4 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local v3, v4 = u1.createBinding(p2:getValue())
        p2:onStep(v4)
        return v3
    end
}