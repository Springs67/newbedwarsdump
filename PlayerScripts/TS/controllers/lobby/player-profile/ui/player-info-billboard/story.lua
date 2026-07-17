-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local PlayerInfoBillboard = RuntimeLib.import(script, script.Parent, "player-info-billboard").PlayerInfoBillboard;

return function(p2) -- Line: 5
    -- upvalues: u1 (copy), PlayerInfoBillboard (copy)
    local u3 = u1.mount(u1.createElement(PlayerInfoBillboard, {
        UserId = 4555591649,
        ScreenPosition = Vector3.new(50, 50, 0),
        HelperText = "Double Click"
    }), p2);

    return function() -- Line: 11
        -- upvalues: u1 (ref), u3 (copy)
        u1.unmount(u3);
    end;
end;