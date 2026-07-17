-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local DasherProgressBar = RuntimeLib.import(script, script.Parent, "dasher-progress-bar").DasherProgressBar;

return function(p2) -- Line: 5
    -- upvalues: u1 (copy), DasherProgressBar (copy)
    local u3 = u1.mount(u1.createElement(DasherProgressBar, {
        chargeTime = 3
    }), p2, "DasherCharge");

    return function() -- Line: 9
        -- upvalues: u1 (ref), u3 (copy)
        u1.unmount(u3);
    end;
end;