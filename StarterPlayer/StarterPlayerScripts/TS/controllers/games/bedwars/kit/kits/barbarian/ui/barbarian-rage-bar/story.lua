local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u4 = v1.import(script, script.Parent, "barbarian-rage-bar").BarbarianRageBar
return function(p5) --[[ Line: 6 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u2
    --]]
    local u6 = u3("BarbarianRageBar", u4, {}, {}, {
        ["Parent"] = p5
    })
    return function() --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
        --]]
        return u2.unmount(u6)
    end
end