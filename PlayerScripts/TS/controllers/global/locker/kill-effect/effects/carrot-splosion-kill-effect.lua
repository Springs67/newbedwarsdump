-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "CarrotSplosionKillEffect";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 23
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, ...) -- Line: 27
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, ...);
end;

function u4.onKill(p7, p8, p9, p10) -- Line: 30
    -- upvalues: u2 (copy), ReplicatedStorage (copy), GameQueryUtil (copy), Workspace (copy), SoundManager (copy), GameSound (copy), EffectUtil (copy), RuntimeLib (copy)
    local u11 = u2.new();
    local v12 = ReplicatedStorage.Assets.Effects.CarrotSplosionEffect:Clone();
    GameQueryUtil:setQueryIgnored(v12, true);
    v12.Transparency = 1;
    v12.CFrame = p10;
    v12.Parent = Workspace;
    u11:GiveTask(v12);
    u11:GiveTask(SoundManager:playSound(GameSound.STAR_KILL_EFFECT, {
        position = p10.Position
    }));
    EffectUtil:playInstanceEffects({ v12 });
    RuntimeLib.Promise.delay(4):andThen(function() -- Line: 44
        -- upvalues: u11 (copy)
        u11:DoCleaning();
    end);

    return u11;
end;

return u4;