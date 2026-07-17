-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "FlowerSplosionKillEffect";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 24
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, ...) -- Line: 28
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, ...);
    p6.springColors = {
        Color3.fromRGB(249, 150, 174),
        Color3.fromRGB(159, 244, 223),
        Color3.fromRGB(246, 240, 163),
        Color3.fromRGB(107, 206, 238),
        Color3.fromRGB(217, 182, 253),
        Color3.fromRGB(135, 221, 89),
        Color3.fromRGB(4, 118, 7)
    };
end;

function u4.onKill(u7, p8, p9, p10) -- Line: 32
    -- upvalues: u2 (copy), ReplicatedStorage (copy), GameQueryUtil (copy), Workspace (copy), RandomUtil (copy), SoundManager (copy), GameSound (copy), EffectUtil (copy), RuntimeLib (copy)
    local u11 = u2.new();
    local v12 = ReplicatedStorage.Assets.Effects.FlowerSplosionEffect:Clone();
    GameQueryUtil:setQueryIgnored(v12, true);
    v12.Transparency = 1;
    v12.CFrame = p10;
    v12.Parent = Workspace;
    u11:GiveTask(v12);
    local Attachment = v12.Attachment;

    local function _(p13) -- Line: 43
        -- upvalues: RandomUtil (ref), u7 (copy)
        local v14 = RandomUtil.fromList(u7.springColors)[1];
        p13.Color = ColorSequence.new(v14);
    end;

    for i, v in {
        Attachment.Flower,
        Attachment.Flower1,
        Attachment.Flower2,
        Attachment.Flower3
    } do
        local _ = i - 1;
        local v15 = RandomUtil.fromList(u7.springColors)[1];
        v.Color = ColorSequence.new(v15);
    end;

    u11:GiveTask(SoundManager:playSound(GameSound.STAR_KILL_EFFECT, {
        position = p10.Position
    }));
    EffectUtil:playInstanceEffects({ v12 });
    RuntimeLib.Promise.delay(4):andThen(function() -- Line: 55
        -- upvalues: u11 (copy)
        u11:DoCleaning();
    end);

    return u11;
end;

return u4;