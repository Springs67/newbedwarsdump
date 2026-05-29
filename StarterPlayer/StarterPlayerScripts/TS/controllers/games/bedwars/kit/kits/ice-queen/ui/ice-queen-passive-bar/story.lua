local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.StarterGui
local u5 = v3.Workspace
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u7 = v1.import(script, script.Parent, "ice-queen-passive-bar").IceQueenPassiveBarWrapper
return function(_) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u6
        [4] = u7
        [5] = u4
    --]]
    local u8 = Instance.new("Part")
    u8.Parent = u5
    local u9 = u6("ice-queen-passive-bar", u7, {
        ["bar"] = u2.createBinding(3),
        ["adornee"] = u8
    }, {}, {
        ["Parent"] = u4
    })
    return function() --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u9
            [3] = u8
        --]]
        u2.unmount(u9)
        u8:Destroy()
    end
end