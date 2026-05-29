local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent, "triple-shot-progress-bar").TripleShotProgressBar
return function(p4) --[[ Line: 5 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local u5 = u2.mount(u2.createElement(u3, {
        ["chargeTime"] = 3,
        ["title"] = "Triple Shot"
    }), p4, "ChargeTripleShot")
    return function() --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u5
        --]]
        u2.unmount(u5)
    end
end