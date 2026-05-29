local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u4 = v1.import(script, script.Parent, "squad-launcher-ui").SquadLauncherUI
return function(p5) --[[ Line: 6 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u3
    --]]
    local u6 = u2.mount(u2.createElement(u4, {
        ["StartTime"] = u3:GetServerTimeNow(),
        ["EndTime"] = u3:GetServerTimeNow() + 8
    }), p5)
    return function() --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
        --]]
        return u2.unmount(u6)
    end
end