-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ProvisionalProgressBarCore = RuntimeLib.import(script, script.Parent, "provisional-progress-bar-core").ProvisionalProgressBarCore;

return function(p2) -- Line: 6
    -- upvalues: CreateRoduxApp (copy), ProvisionalProgressBarCore (copy), u1 (copy)
    local u3 = CreateRoduxApp("ProvisionalProgressBarAppWrapper", ProvisionalProgressBarCore, {
        RankedMatchesPlayed = 3
    }, {}, {
        Parent = p2
    });

    return function() -- Line: 12
        -- upvalues: u1 (ref), u3 (copy)
        u1.unmount(u3);
    end;
end;