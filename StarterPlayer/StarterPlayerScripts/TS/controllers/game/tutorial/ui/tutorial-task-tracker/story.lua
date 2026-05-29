local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u5 = v1.import(script, script.Parent, "tutorial-task-tracker").TutorialTaskTracker
return function(p6) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u4
        [4] = u5
    --]]
    local v7 = {}
    local v8 = {
        ["id"] = "collect_iron",
        ["currentProgress"] = 5,
        ["completed"] = true,
        ["meta"] = {
            ["totalProgress"] = 5,
            ["description"] = "Collect <font color=\"" .. u2.richTextColor(u2.hexColor(10413803)) .. "\">iron</font>"
        },
        ["maid"] = u3.new()
    }
    local v9 = {
        ["id"] = "collect_diamond",
        ["currentProgress"] = 1,
        ["completed"] = false,
        ["meta"] = {
            ["totalProgress"] = 5,
            ["description"] = "Collect <font color=\"" .. u2.richTextColor(u2.hexColor(65520)) .. "\">diamonds</font>"
        },
        ["maid"] = u3.new()
    }
    local v10 = {
        ["id"] = "buy_sword",
        ["currentProgress"] = 1,
        ["completed"] = false,
        ["meta"] = {
            ["totalProgress"] = 5,
            ["description"] = "Use <font color=\"" .. u2.richTextColor(u2.hexColor(10413803)) .. "\">iron</font> to buy a <font color=\"" .. u2.richTextColor(u2.hexColor(12830463)) .. "\">sword</font>"
        },
        ["maid"] = u3.new()
    }
    __set_list(v7, 1, {v8, v9, v10})
    local u11 = u4.mount(u4.createElement(u5, {
        ["CurrentTasks"] = v7,
        ["ScreenSizeY"] = p6.AbsoluteSize.Y
    }), p6)
    return function() --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u11
        --]]
        return u4.unmount(u11)
    end
end