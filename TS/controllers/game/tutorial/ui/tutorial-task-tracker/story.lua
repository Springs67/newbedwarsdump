-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local TutorialTaskTracker = RuntimeLib.import(script, script.Parent, "tutorial-task-tracker").TutorialTaskTracker;

return function(p3) -- Line: 7
    -- upvalues: ColorUtil (copy), u1 (copy), u2 (copy), TutorialTaskTracker (copy)
    local v4 = {
        {
            id = "collect_iron",
            currentProgress = 5,
            completed = true,
            meta = {
                totalProgress = 5,
                description = "Collect <font color=\"" .. ColorUtil.richTextColor(ColorUtil.hexColor(10413803)) .. "\">iron</font>"
            },
            maid = u1.new()
        },
        {
            id = "collect_diamond",
            currentProgress = 1,
            completed = false,
            meta = {
                totalProgress = 5,
                description = "Collect <font color=\"" .. ColorUtil.richTextColor(ColorUtil.hexColor(65520)) .. "\">diamonds</font>"
            },
            maid = u1.new()
        },
        {
            id = "buy_sword",
            currentProgress = 1,
            completed = false,
            meta = {
                totalProgress = 5,
                description = "Use <font color=\"" .. ColorUtil.richTextColor(ColorUtil.hexColor(10413803)) .. "\">iron</font> to buy a <font color=\"" .. ColorUtil.richTextColor(ColorUtil.hexColor(12830463)) .. "\">sword</font>"
            },
            maid = u1.new()
        }
    };
    local u5 = u2.mount(u2.createElement(TutorialTaskTracker, {
        CurrentTasks = v4,
        ScreenSizeY = p3.AbsoluteSize.Y
    }), p3);

    return function() -- Line: 40
        -- upvalues: u2 (ref), u5 (copy)
        return u2.unmount(u5);
    end;
end;