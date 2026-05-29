local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent, "flag-capture-ui").FlagScoreUI
return function(p4) --[[ Line: 5 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local u5 = u2.mount(u2.createElement(u3, {
        ["yourScore"] = 1,
        ["enemyScore"] = 2,
        ["yourFlag"] = true,
        ["enemyFlag"] = false,
        ["teamFlagPosition"] = 0,
        ["enemyFlagPosition"] = 1,
        ["neutralFlagPosition"] = nil
    }), p4)
    return function() --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u5
        --]]
        return u2.unmount(u5)
    end
end