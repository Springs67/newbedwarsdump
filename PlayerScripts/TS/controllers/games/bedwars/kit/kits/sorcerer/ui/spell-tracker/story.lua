-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local SorcererKit = RuntimeLib.import(script, script.Parent, "spell-tracker").SorcererKit;

return function(p2) -- Line: 5
    -- upvalues: u1 (copy), SorcererKit (copy)
    local u3 = u1.mount(u1.createElement(SorcererKit, {
        progress = 0.5,
        spellCharges = 1
    }), p2);

    return function() -- Line: 10
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;