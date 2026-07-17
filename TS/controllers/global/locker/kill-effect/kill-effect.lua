-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local TweenService = v2.TweenService;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 10, Name: __tostring
        return "KillEffect";
    end
});
u3.__index = u3;

function u3.new(...) -- Line: 15
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, p6) -- Line: 19
    p5.killerPlayer = p6;
    p5.playDefaultKillEffect = true;
end;

function u3.onKill(p7, p8, p9, p10) -- Line: 23
    -- upvalues: u1 (copy)
    return u1.new();
end;

function u3.isLocalKiller(p11) -- Line: 26
    -- upvalues: Players (copy)
    return Players.LocalPlayer == p11.killerPlayer;
end;

function u3.setPlayDefaultKillEffect(p12, p13) -- Line: 29
    p12.playDefaultKillEffect = p13;
end;

function u3.isPlayDefaultKillEffect(p14) -- Line: 32
    return p14.playDefaultKillEffect;
end;

function u3.hideCharacter(p15, p16) -- Line: 35
    local v17 = p16:GetDescendants();

    local function v19(p18) -- Line: 37
        if p18:IsA("BasePart") then
            p18.Transparency = 1;

            return;
        end;

        if p18:IsA("Decal") then
            p18.Transparency = 1;

            return;
        end;

        if p18:IsA("BillboardGui") then
            p18:Destroy();

            return;
        end;

        if p18:IsA("ParticleEmitter") then
            p18.Transparency = NumberSequence.new(1);
        end;
    end;

    for i, v in v17 do
        v19(v, i - 1, v17);
    end;
end;

function u3.anchorCharacter(p20, p21) -- Line: 52
    local function _(p22) -- Line: 54
        if p22:IsA("BasePart") then
            p22.Anchored = true;
        end;
    end;

    for i, descendant in p21:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.Anchored = true;
        end;
    end;
end;

function u3.scaleModel(p23, p24, p25, p26) -- Line: 63
    -- upvalues: TweenService (copy)
    local PrimaryPart = p24.PrimaryPart;
    local v27 = nil;

    for _, descendant in p24:GetDescendants() do
        if descendant:IsA("BasePart") then
            v27 = TweenService:Create(descendant, p26, {
                CFrame = PrimaryPart.CFrame:Lerp(descendant.CFrame, p25),
                Size = descendant.Size * p25
            });
            v27:Play();
        end;
    end;

    return v27;
end;

return {
    KillEffect = u3
};