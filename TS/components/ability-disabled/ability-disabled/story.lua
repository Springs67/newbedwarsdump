-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local AbilityDisabled = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AbilityDisabled;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return function(p2) -- Line: 5
    -- upvalues: u1 (copy), AbilityDisabled (copy)
    local u3 = u1.mount(u1.createElement(AbilityDisabled), p2);

    return function() -- Line: 7
        -- upvalues: u1 (ref), u3 (copy)
        u1.unmount(u3);
    end;
end;