local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tutorial", "tutorial-type").TutorialType
local u6 = v1.import(script, script.Parent, "tutorial-dialogue").TutorialDialogue
return function(p7) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u3
        [4] = u6
        [5] = u5
    --]]
    local v8 = { "hello <b>world</b>!", "welcome to my <font color=\"" .. u2.richTextColor(u4.backgroundError) .. "\">tutorial</font> :)" }
    local u9 = u3.mount(u3.createElement(u6, {
        ["TutorialType"] = u5.BEGINNER,
        ["Dialogue"] = v8
    }), p7)
    return function() --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u9
        --]]
        return u3.unmount(u9)
    end
end