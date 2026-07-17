-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "ButterflyExplosionKillEffect";
    end,

    __index = KillEffect
});
u3.__index = u3;

function u3.new(...) -- Line: 23
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, p6) -- Line: 27
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p5, p6);
    KillEffect.setPlayDefaultKillEffect(p5, false);
end;

function u3.onKill(p7, p8, p9, p10) -- Line: 31
    -- upvalues: u1 (copy), Workspace (copy), KillEffect (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), EffectUtil (copy)
    local u11 = u1.new();
    p9.Archivable = true;
    local v12 = p9:Clone();
    v12.HumanoidRootPart.Anchored = true;
    v12:PivotTo(p10);
    v12.Parent = Workspace;
    KillEffect.hideCharacter(p7, p9);
    u11:GiveTask(v12);
    local _DamageHighlight_ = v12:FindFirstChild("_DamageHighlight_");

    if _DamageHighlight_ then
        _DamageHighlight_:Destroy();
    end;

    local function _(p13) -- Line: 48
        if p13:IsA("GuiObject") then
            p13.Transparency = 1;

            return;
        end;

        if p13:IsA("UIStroke") then
            p13.Transparency = 1;

            return;
        end;

        if p13:IsA("Decal") then
            p13.Transparency = 1;
        end;
    end;

    for i, descendant in v12:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("GuiObject") then
            descendant.Transparency = 1;
        elseif descendant:IsA("UIStroke") then
            descendant.Transparency = 1;
        elseif descendant:IsA("Decal") then
            descendant.Transparency = 1;
        end;
    end;

    SoundManager:playSound(GameSound.BREAK_FROZEN_BLOCK, {
        position = p10.Position
    });
    local v14 = ReplicatedStorage.Assets.Effects.AeryKillEffect:Clone();
    v14:PivotTo(p10);
    v14.Parent = Workspace;
    u11:GiveTask(v14);
    EffectUtil:playInstanceEffects({ v14 }, {
        destroyAfterSec = 5
    });
    p7:fade(v12:GetDescendants(), "out", 1.5);
    u11:GiveTask((SoundManager:playSound(GameSound.AERY_BUTTERFLY_SOUND_EFFECT, {
        position = p10.Position
    })));
    task.delay(5, function() -- Line: 75
        -- upvalues: u11 (copy)
        u11:DoCleaning();
    end);

    return u11;
end;

function u3.fade(p15, p16, u17, u18) -- Line: 80
    -- upvalues: default (copy), Linear (copy)
    local function v21(u19) -- Line: 82
        -- upvalues: u18 (copy), default (ref), Linear (ref), u17 (copy)
        if u19:IsA("BasePart") then
            if u18 ~= 0 and (u18 == u18 and u18) then
                default(u18, Linear, function(p20) -- Line: 85
                    -- upvalues: u19 (copy)
                    u19.LocalTransparencyModifier = p20;
                end, u17 == "in" and 1 or 0, u17 == "in" and 0 or 1):Play();

                return;
            end;

            u19.LocalTransparencyModifier = u17 == "in" and 0 or 1;
        end;
    end;

    for i, v in p16 do
        v21(v, i - 1, p16);
    end;
end;

return u3;