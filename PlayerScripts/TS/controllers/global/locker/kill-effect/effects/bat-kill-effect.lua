-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "Anonymous";
    end,

    __index = KillEffect
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, ...) -- Line: 23
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p4, ...);
end;

function u2.onKill(p5, p6, p7, p8) -- Line: 26
    -- upvalues: u1 (copy), ReplicatedStorage (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy)
    local v9 = u1.new();
    local v10 = ReplicatedStorage.Assets.Effects.BatExplosion:Clone();
    v10.Parent = p7;
    v10.Position = p7:GetPivot().Position;
    EffectUtil:playEffects({ v10.Explosion });
    v9:GiveTask(v10);
    v9:GiveTask(SoundManager:playSound(GameSound.BAT_EXPLOSION, {
        position = p8.Position
    }));

    return v9;
end;

return u2;