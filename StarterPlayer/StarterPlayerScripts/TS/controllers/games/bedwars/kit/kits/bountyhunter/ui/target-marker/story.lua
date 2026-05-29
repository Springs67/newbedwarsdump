local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, script.Parent, "target-marker").TargetMarker
return function(p6) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u3
        [4] = u2
    --]]
    local u7 = u4("TargetMarker", u5, {
        ["player"] = u3.LocalPlayer or {
            ["UserId"] = 87365146
        }
    }, {}, {
        ["Parent"] = p6
    })
    return function() --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u7
        --]]
        return u2.unmount(u7)
    end
end