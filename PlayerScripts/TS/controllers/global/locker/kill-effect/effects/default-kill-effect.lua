-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local CharacterUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "character", "character-util").CharacterUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 10, Name: __tostring
        return "DefaultKillEffect";
    end,

    __index = KillEffect
});
u2.__index = u2;

function u2.new(...) -- Line: 16
    -- upvalues: u2 (copy)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, p5) -- Line: 20
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p4, p5);
    KillEffect.setPlayDefaultKillEffect(p4, false);
end;

function u2.onKill(p6, p7, p8, p9) -- Line: 24
    -- upvalues: CharacterUtil (copy), u1 (copy)
    CharacterUtil.breakJoints(p8);

    return u1.new();
end;

return u2;