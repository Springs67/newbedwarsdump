local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent, "hotbar", "ui", "hotbar-app").HotbarApp
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, script.Parent, "seahorse-display").SeahorseDisplay
return function(p6) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u2
        [4] = u5
    --]]
    local u7 = u4("hotbar", u3, {}, {}, {
        ["Parent"] = p6
    })
    local u8 = u2.mount(u2.createElement(u5, {
        ["stacks"] = 150
    }), p6)
    return function() --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u7
            [3] = u8
        --]]
        u2.unmount(u7)
        u2.unmount(u8)
    end
end