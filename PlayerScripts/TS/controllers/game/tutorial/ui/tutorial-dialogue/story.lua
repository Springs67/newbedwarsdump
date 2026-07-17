-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local TutorialType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tutorial", "tutorial-type").TutorialType;
local TutorialDialogue = RuntimeLib.import(script, script.Parent, "tutorial-dialogue").TutorialDialogue;

return function(p2) -- Line: 8
    -- upvalues: ColorUtil (copy), Theme (copy), u1 (copy), TutorialDialogue (copy), TutorialType (copy)
    local v3 = { "hello <b>world</b>!", "welcome to my <font color=\"" .. ColorUtil.richTextColor(Theme.backgroundError) .. "\">tutorial</font> :)" };
    local u4 = u1.mount(u1.createElement(TutorialDialogue, {
        TutorialType = TutorialType.BEGINNER,
        Dialogue = v3
    }), p2);

    return function() -- Line: 14
        -- upvalues: u1 (ref), u4 (copy)
        return u1.unmount(u4);
    end;
end;