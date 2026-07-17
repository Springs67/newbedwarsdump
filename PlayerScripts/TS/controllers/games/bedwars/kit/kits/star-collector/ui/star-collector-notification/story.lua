-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StarCollectorNotification = RuntimeLib.import(script, script.Parent, "star-collector-notification").StarCollectorNotification;

return function(p2) -- Line: 5
    -- upvalues: u1 (copy), StarCollectorNotification (copy)
    local u3 = u1.mount(u1.createElement(StarCollectorNotification, {
        text = "crit +1",
        textColor3 = Color3.fromRGB(253, 166, 91)
    }), p2);

    return function() -- Line: 10
        -- upvalues: u1 (ref), u3 (copy)
        u1.unmount(u3);
    end;
end;