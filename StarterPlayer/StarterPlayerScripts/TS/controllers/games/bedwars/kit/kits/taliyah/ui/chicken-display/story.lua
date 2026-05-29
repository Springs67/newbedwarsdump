local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "global", "hotbar", "ui", "hotbar-app").HotbarApp
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u6 = v1.import(script, script.Parent, "chicken-ui").ChickenUi
return function(p7) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u2
        [4] = u6
        [5] = u5
    --]]
    local u8 = u4("hotbar", u3, {}, {}, {
        ["Parent"] = p7
    })
    local u9 = u2.mount(u2.createElement(u6, {
        ["chickenPrice"] = 5,
        ["currency"] = u5.EMERALD
    }), p7)
    return function() --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
            [3] = u9
        --]]
        u2.unmount(u8)
        u2.unmount(u9)
    end
end