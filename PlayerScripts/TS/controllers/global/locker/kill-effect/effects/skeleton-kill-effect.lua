-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local OutCubic = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutCubic;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "SkeletonKillEffect";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 24
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, p7) -- Line: 28
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, p7);
    KillEffect.setPlayDefaultKillEffect(p6, false);
end;

function u4.onKill(p8, p9, u10, u11) -- Line: 32
    -- upvalues: u1 (copy), u2 (copy), Workspace (copy), ReplicatedStorage (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy), default (copy), OutCubic (copy)
    local u12 = u1.new();
    local v13 = {};
    local v14 = u2("Part", {
        Anchored = true,
        Transparency = 1,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        Position = u11.Position,
        Parent = Workspace
    });
    u12:GiveTask(v14);
    local v15 = ReplicatedStorage.Assets.Effects.SmokePuff:Clone();
    table.insert(v13, v15);
    v15.Parent = v14;
    local v16 = ReplicatedStorage.Assets.Effects.MagicSmoke:Clone();
    table.insert(v13, v16);
    v16.Parent = v14;
    EffectUtil:playEffects(v13, nil, {
        destroyAfterSec = 1,
        sizeMultiplier = 0.25
    });
    SoundManager:playSound(GameSound.GHOST_PILLAR_ERUPT, {
        playbackSpeedMultiplier = 1.7,
        rollOffMaxDistance = 40,
        position = u11.Position
    });
    SoundManager:playSound(GameSound.CLUE_DISCOVERED, {
        playbackSpeedMultiplier = 2,
        rollOffMaxDistance = 40,
        position = u11.Position
    });
    default(0.5, OutCubic, function(u17) -- Line: 68
        -- upvalues: u10 (copy)
        local function _(p18) -- Line: 70
            -- upvalues: u17 (copy)
            if p18:IsA("BasePart") then
                p18.Transparency = u17;
            end;
        end;

        for i, descendant in u10:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.Transparency = u17;
            end;
        end;
    end, 0, 1);
    local u19 = ReplicatedStorage.Assets.Misc.Skeleton:Clone();
    u12:GiveTask(u19);
    local TeamIndicator = u19:FindFirstChild("TeamIndicator");

    if TeamIndicator ~= nil then
        TeamIndicator:Destroy();
    end;

    local v20 = u19:FindFirstChild("3DClothing");

    if v20 ~= nil then
        local Head = v20:FindFirstChild("Head");

        if Head ~= nil then
            local Neon = Head:FindFirstChild("Neon");

            if Neon ~= nil then
                Neon:Destroy();
            end;
        end;
    end;

    u19:PivotTo(u11);
    p8:scaleModel(u19, 1.15, TweenInfo.new(0));

    local function _(p21) -- Line: 99
        if p21:IsA("BasePart") then
            p21.CollisionGroup = "ItemDrops";
            p21.CanCollide = true;
            p21.Anchored = true;
        end;
    end;

    for i, descendant in u19:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CollisionGroup = "ItemDrops";
            descendant.CanCollide = true;
            descendant.Anchored = true;
        end;
    end;

    u19.Parent = Workspace;
    task.delay(0.5, function() -- Line: 110
        -- upvalues: u19 (copy), SoundManager (ref), GameSound (ref), u11 (copy), u12 (copy)
        local function _(p22) -- Line: 113
            if p22:IsA("Motor6D") or p22:IsA("WeldConstraint") then
                p22:Destroy();

                return;
            end;

            if p22:IsA("BasePart") then
                p22.Anchored = false;
            end;
        end;

        for i, descendant in u19:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("Motor6D") or descendant:IsA("WeldConstraint") then
                descendant:Destroy();
            elseif descendant:IsA("BasePart") then
                descendant.Anchored = false;
            end;
        end;

        SoundManager:playSound(GameSound.ROCK_CRUMBLE_3, {
            rollOffMaxDistance = 40,
            position = u11.Position
        });
        task.delay(3, function() -- Line: 127
            -- upvalues: u12 (ref)
            u12:DoCleaning();
        end);
    end);

    return u12;
end;

return u4;