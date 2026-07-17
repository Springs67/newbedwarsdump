-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectHudListScreen = RuntimeLib.import(script, script.Parent, "status-effect-hud-list").StatusEffectHudListScreen;

return function(p2) -- Line: 6
    -- upvalues: u1 (copy), StatusEffectHudListScreen (copy), StatusEffectType (copy)
    local u3 = u1.mount(u1.createElement(StatusEffectHudListScreen, {
        StatusEffects = {
            {
                expireTime = 90,
                stacks = 2,
                statusEffect = StatusEffectType.FORCEFIELD
            },
            {
                stacks = 0,
                statusEffect = StatusEffectType.ENCHANT_FIRE
            },
            {
                expireTime = 15,
                stacks = 0,
                statusEffect = StatusEffectType.GIANT
            }
        },
        Position = UDim2.fromScale(0.5, 0.1)
    }), p2);

    return function() -- Line: 22
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;