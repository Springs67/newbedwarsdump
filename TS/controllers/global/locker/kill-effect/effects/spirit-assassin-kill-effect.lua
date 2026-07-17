-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "SpiritAssassinKillEffect";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 26
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, p7) -- Line: 30
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, p7);
    KillEffect.setPlayDefaultKillEffect(p6, false);
end;

function u4.onKill(p8, p9, p10, p11) -- Line: 34
    -- upvalues: u2 (copy), EntityUtil (copy), Workspace (copy), KillEffect (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    local u12 = u2.new();
    local PrimaryPart = p10.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.CFrame;
    end;

    if PrimaryPart == nil then
        return u12;
    end;

    local v13 = EntityUtil:getEntity(p9);

    if v13 ~= nil then
        v13:hideNametag();
    end;

    p10.Archivable = true;
    local u14 = p10:Clone();
    u14.HumanoidRootPart.Anchored = true;
    u14.Parent = Workspace;
    local Animator = u14.Humanoid.Animator;
    KillEffect.hideCharacter(p8, p10);
    u12:GiveTask(u14);
    local v15 = AnimationUtil:playAnimation(Animator, GameAnimationUtil:getAssetId(AnimationType.SPIRIT_ASSASSIN_KILL_EFFECT_PLAYER), {
        looped = true
    });
    u12:GiveTask(SoundManager:playSound(GameSound.SPIRIT_ASSASSIN_GHOST_DRAG, {
        rollOffMaxDistance = 160,
        looped = false,
        volumeMultiplier = 0.8,
        position = PrimaryPart.Position
    }));
    u12:GiveTask(p8:setupGhosts(u14, PrimaryPart, u12));

    if v15 ~= nil then
        v15.Stopped:Connect(function() -- Line: 68
            -- upvalues: u12 (copy), u14 (copy)
            local v16 = u12;

            if v16 ~= nil then
                v16:DoCleaning();
            end;

            local v17 = u14;

            if v17 ~= nil then
                v17:Destroy();
            end;
        end);
    end;

    task.delay(7.12, function() -- Line: 79
        -- upvalues: u12 (copy), u14 (copy)
        local v18 = u12;

        if v18 ~= nil then
            v18:DoCleaning();
        end;

        local v19 = u14;

        if v19 ~= nil then
            v19:Destroy();
        end;
    end);

    return u12;
end;

function u4.setupGhosts(p20, p21, p22, p23) -- Line: 91
    -- upvalues: Workspace (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local u24 = p21:Clone();
    local u25 = p21:Clone();
    local u26 = p21:Clone();
    local v27 = { u24, u25, u26 };
    u24.HumanoidRootPart.Anchored = true;
    u24.Parent = Workspace;
    u24:PivotTo(p22);
    u24.Name = "GhostFront";
    u25.HumanoidRootPart.Anchored = true;
    u25.Parent = Workspace;
    u25:PivotTo(p22);
    u25.Name = "GhostBack1";
    u26.HumanoidRootPart.Anchored = true;
    u26.Parent = Workspace;
    u26:PivotTo(p22);
    u26.Name = "GhostBack2";
    local Animator = u25.Humanoid.Animator;
    local Animator2 = u26.Humanoid.Animator;
    local v28 = AnimationUtil:playAnimation(u24.Humanoid.Animator, GameAnimationUtil:getAssetId(AnimationType.SPIRIT_ASSASSIN_KILL_EFFECT_GHOST_1), {
        looped = false
    });
    local v29 = AnimationUtil:playAnimation(Animator, GameAnimationUtil:getAssetId(AnimationType.SPIRIT_ASSASSIN_KILL_EFFECT_GHOST_2), {
        looped = false
    });
    local v30 = AnimationUtil:playAnimation(Animator2, GameAnimationUtil:getAssetId(AnimationType.SPIRIT_ASSASSIN_KILL_EFFECT_GHOST_3), {
        looped = false
    });

    if v28 ~= nil then
        v28.Stopped:Connect(function() -- Line: 123
            -- upvalues: u24 (copy)
            local v31 = u24;

            if v31 ~= nil then
                v31:Destroy();
            end;
        end);
    end;

    if v29 ~= nil then
        v29.Stopped:Connect(function() -- Line: 132
            -- upvalues: u25 (copy)
            local v32 = u25;

            if v32 ~= nil then
                v32:Destroy();
            end;
        end);
    end;

    if v30 ~= nil then
        v30.Stopped:Connect(function() -- Line: 141
            -- upvalues: u26 (copy)
            local v33 = u26;

            if v33 ~= nil then
                v33:Destroy();
            end;
        end);
    end;

    p23:GiveTask(u24);
    p23:GiveTask(u25);
    p23:GiveTask(u26);
    p20:applyGhostEffects(v27);

    return p23;
end;

function u4.applyGhostEffects(p34, p35) -- Line: 154
    -- upvalues: TweenService (copy)
    local function v37(p36) -- Line: 156
        -- upvalues: TweenService (ref)
        for _, descendant in p36:GetDescendants() do
            if descendant:IsA("BasePart") and descendant.Transparency < 0.5 then
                if descendant:GetAttribute("SpiritTransparency") == nil then
                    descendant:SetAttribute("SpiritTransparency", descendant.Transparency);
                end;

                TweenService:Create(descendant, TweenInfo.new(0.1), {
                    Transparency = 0.369
                }):Play();
                descendant.Material = Enum.Material.ForceField;
            end;
        end;
    end;

    for i, v in p35 do
        v37(v, i - 1, p35);
    end;
end;

return u4;