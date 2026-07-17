-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local FlagScoreUI = RuntimeLib.import(script, script.Parent, "flag-capture-ui").FlagScoreUI;

return function(p2) -- Line: 5
    -- upvalues: u1 (copy), FlagScoreUI (copy)
    local u3 = u1.mount(u1.createElement(FlagScoreUI, {
        yourScore = 1,
        enemyScore = 2,
        yourFlag = true,
        enemyFlag = false,
        teamFlagPosition = 0,
        enemyFlagPosition = 1,
        neutralFlagPosition = nil
    }), p2);

    return function() -- Line: 15
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;