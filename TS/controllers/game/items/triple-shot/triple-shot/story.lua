-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local TripleShotProgressBar = RuntimeLib.import(script, script.Parent, "triple-shot-progress-bar").TripleShotProgressBar;

return function(p2) -- Line: 5
    -- upvalues: u1 (copy), TripleShotProgressBar (copy)
    local u3 = u1.mount(u1.createElement(TripleShotProgressBar, {
        chargeTime = 3,
        title = "Triple Shot"
    }), p2, "ChargeTripleShot");

    return function() -- Line: 10
        -- upvalues: u1 (ref), u3 (copy)
        u1.unmount(u3);
    end;
end;