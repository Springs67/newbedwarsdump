-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local DamageType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
local RespawnTimer = RuntimeLib.import(script, script.Parent, "respawn-timer").RespawnTimer;

return function(p2) -- Line: 6
    -- upvalues: u1 (copy), RespawnTimer (copy), DamageType (copy)
    local u3 = u1.mount(u1.createElement(RespawnTimer, {
        RespawnDuration = 5,
        DamageType = DamageType.VOID
    }), p2);

    return function() -- Line: 11
        -- upvalues: u1 (ref), u3 (copy)
        u1.unmount(u3);
    end;
end;