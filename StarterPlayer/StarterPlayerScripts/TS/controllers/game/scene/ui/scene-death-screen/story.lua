local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent, "scene-death-screen").SceneDeathScreen
return function(p4) --[[ Line: 5 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local u5 = u2.mount(u2.createElement(u3, {
        ["hints"] = { "Don\'t Fall!", "Be hasty. The fog will catch up to you" }
    }), p4)
    return function() --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u5
        --]]
        return u2.unmount(u5)
    end
end