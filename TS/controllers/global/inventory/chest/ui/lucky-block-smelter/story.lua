-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local SmelterHeader = RuntimeLib.import(script, script.Parent, "smelter-header").SmelterHeader;

return function(p2) -- Line: 5
    -- upvalues: u1 (copy), SmelterHeader (copy)
    local u3 = u1.mount(u1.createElement(SmelterHeader, {
        SmeltPoints = 0.07
    }), p2);

    return function() -- Line: 9
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;