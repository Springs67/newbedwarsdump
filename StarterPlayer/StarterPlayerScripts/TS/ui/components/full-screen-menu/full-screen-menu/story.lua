local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent, "full-screen-menu").FullScreenMenu
local u4 = v1.import(script, script.Parent, "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets
return function(p5) --[[ Line: 6 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u3
    --]]
    local v6 = u2
    local v7 = {}
    local v8 = {}
    for v9, v10 in u4.BACKGROUND_BLUR_PRESET do
        v7[v9] = v10
    end
    function v7.OnClick() --[[ Line: 13 ]]
        print("backgroundclick")
    end
    v8.Background = v7
    v8.BackButton = {
        ["OnClick"] = function() --[[ Name: OnClick, Line 18 ]]
            print("back")
        end
    }
    v8.ExitButton = {
        ["OnClick"] = function() --[[ Name: OnClick, Line 23 ]]
            print("exit")
        end
    }
    local u11 = v6.mount(u2.createElement(u3, v8), p5)
    return function() --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u11
        --]]
        u2.unmount(u11)
    end
end