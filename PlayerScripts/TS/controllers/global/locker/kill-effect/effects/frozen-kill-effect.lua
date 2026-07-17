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
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "FrozenKillEffect";
    end,

    __index = KillEffect
});
u3.__index = u3;

function u3.new(...) -- Line: 22
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, p6) -- Line: 26
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p5, p6);
    KillEffect.setPlayDefaultKillEffect(p5, false);
end;

function u3.onKill(u7, p8, p9, p10) -- Line: 30
    -- upvalues: u1 (copy), Workspace (copy), KillEffect (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy)
    local u11 = u1.new();
    p9.Archivable = true;
    local u12 = p9:Clone();
    u12.HumanoidRootPart.Anchored = true;
    u12:PivotTo(p10);
    u12.Parent = Workspace;
    KillEffect.hideCharacter(u7, p9);
    u11:GiveTask(u12);
    local _DamageHighlight_ = u12:FindFirstChild("_DamageHighlight_");

    if _DamageHighlight_ then
        _DamageHighlight_:Destroy();
    end;

    local function _(p13) -- Line: 47
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

    for i, descendant in u12:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("GuiObject") then
            descendant.Transparency = 1;
        elseif descendant:IsA("UIStroke") then
            descendant.Transparency = 1;
        elseif descendant:IsA("Decal") then
            descendant.Transparency = 1;
        end;
    end;

    SoundManager:playSound(GameSound.SEAHORSE_FREEZE, {
        position = p10.Position
    });
    local u14 = ReplicatedStorage.Assets.Effects.FrostKillEffect:Clone();

    local function _(p15) -- Line: 64
        -- upvalues: u7 (copy)
        if p15:IsA("Model") then
            u7:fade(p15:GetChildren(), "out");
        end;
    end;

    for i, child in u14.Root["ice shards"]:GetChildren() do
        local _ = i - 1;

        if child:IsA("Model") then
            u7:fade(child:GetChildren(), "out");
        end;
    end;

    u7:fade(u14.Root.ice:GetChildren(), "out");
    u14:PivotTo(p10);
    u14.Parent = Workspace;
    u11:GiveTask(u14);
    local u16 = 0;

    local function _(u17) -- Line: 78
        -- upvalues: u16 (ref), u7 (copy)
        if u17:IsA("Model") then
            task.delay(u16 * 0.5, function() -- Line: 80
                -- upvalues: u7 (ref), u17 (copy)
                u7:fade(u17:GetChildren(), "in", 1);
            end);
            u16 = u16 + 1;
        end;
    end;

    for i, child in u14.Root["ice shards"]:GetChildren() do
        local _ = i - 1;

        if child:IsA("Model") then
            task.delay(u16 * 0.5, function() -- Line: 80
                -- upvalues: u7 (copy), child (copy)
                u7:fade(child:GetChildren(), "in", 1);
            end);
            u16 = u16 + 1;
        end;
    end;

    u7:fade(u14.Root.ice:GetChildren(), "in", 1.5);
    task.delay(4, function() -- Line: 90
        -- upvalues: u7 (copy), u12 (copy), u14 (copy)
        u7:fade(u12:GetDescendants(), "out", 1.5);

        local function _(p18) -- Line: 93
            -- upvalues: u7 (ref)
            if p18:IsA("Model") then
                u7:fade(p18:GetChildren(), "out", 1.5);
            end;
        end;

        for i, child in u14.Root["ice shards"]:GetChildren() do
            local _ = i - 1;

            if child:IsA("Model") then
                u7:fade(child:GetChildren(), "out", 1.5);
            end;
        end;

        u7:fade(u14.Root.ice:GetChildren(), "out", 1.5);
    end);
    task.delay(5.5, function() -- Line: 103
        -- upvalues: u11 (copy)
        u11:DoCleaning();
    end);

    return u11;
end;

function u3.fade(p19, p20, u21, u22) -- Line: 108
    -- upvalues: default (copy), Linear (copy)
    local function v25(u23) -- Line: 110
        -- upvalues: u22 (copy), default (ref), Linear (ref), u21 (copy)
        if u23:IsA("BasePart") then
            if u22 ~= 0 and (u22 == u22 and u22) then
                default(u22, Linear, function(p24) -- Line: 113
                    -- upvalues: u23 (copy)
                    u23.LocalTransparencyModifier = p24;
                end, u21 == "in" and 1 or 0, u21 == "in" and 0 or 1):Play();

                return;
            end;

            u23.LocalTransparencyModifier = u21 == "in" and 0 or 1;
        end;
    end;

    for i, v in p20 do
        v25(v, i - 1, p20);
    end;
end;

return u3;