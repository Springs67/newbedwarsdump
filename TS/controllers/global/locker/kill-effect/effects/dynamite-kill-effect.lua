-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u3 = Color3.fromRGB(115, 115, 115);
local u4 = Color3.fromRGB(74, 74, 74);
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "DynamiteKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 26
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 30
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p7, p8);
    KillEffect.setPlayDefaultKillEffect(p7, false);
end;

function u5.onKill(p9, p10, p11, p12) -- Line: 34
    -- upvalues: u1 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), SoundManager (copy), GameSound (copy), TweenService (copy), RuntimeLib (copy), EffectUtil (copy), u3 (copy), u4 (copy)
    local u13 = u1.new();
    p11.Archivable = true;
    local u14 = p11:Clone();
    u14.Parent = Workspace;
    u13:GiveTask(u14);
    KillEffect.hideCharacter(p9, p11);

    local function _(p15) -- Line: 43
        if p15:IsA("Highlight") then
            p15:Destroy();
        end;
    end;

    for i, descendant in u14:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("Highlight") then
            descendant:Destroy();
        end;
    end;

    local u16 = ReplicatedStorage.Assets.Effects.DynamiteBundle:Clone();
    u16.Parent = Workspace;
    u16:PivotTo(u14:GetPivot() + u14:GetPivot().LookVector.Unit * 1.2);
    u13:GiveTask(u16);
    local u17 = SoundManager:playSound(GameSound.SPARKLER_LOOP, {
        looped = true,
        position = u14:GetPivot().Position
    });
    u13:GiveTask(u17);
    local SparklerPos1 = u16:WaitForChild("Part"):WaitForChild("SparklerPos1");
    local SparklerPos2 = u16:WaitForChild("Part"):WaitForChild("SparklerPos2");
    local u18 = ReplicatedStorage.Assets.Effects.SparklerEffect:Clone();
    u18.Parent = Workspace;
    u18:PivotTo(SparklerPos1.WorldCFrame);
    u13:GiveTask(u18);
    TweenService:Create(u18, TweenInfo.new(0.9, Enum.EasingStyle.Linear), {
        Position = SparklerPos2.WorldPosition
    }):Play();
    local u32 = RuntimeLib.Promise.delay(0.9):andThen(function() -- Line: 74
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), u14 (copy), u13 (copy), SoundManager (ref), GameSound (ref), EffectUtil (ref), u17 (copy), u18 (copy), u16 (copy), u3 (ref), u4 (ref), TweenService (ref)
        local v19 = ReplicatedStorage.Assets.Effects.DynamiteExplosion:Clone();
        v19.Parent = Workspace;
        v19:PivotTo(u14:GetPivot());
        u13:GiveTask(v19);
        u13:GiveTask(SoundManager:playSound(GameSound.INVISIBLE_LANDMINE_EXPLOSION, {
            volumeMultiplier = 0.8,
            position = u14:GetPivot().Position
        }));
        EffectUtil:playEffects(v19:GetDescendants(), nil, {
            destroyAfterSec = 4
        });
        u17:Destroy();
        u18:Destroy();
        u16:Destroy();
        local u20 = {};
        local u21 = {};
        local u22 = {};
        local u23 = {};
        local u24 = {};

        for _, descendant in u14:GetDescendants() do
            if descendant:IsA("BasePart") then
                descendant.Color = u3;
                table.insert(u20, descendant);

                if descendant:IsA("MeshPart") and descendant.TextureID ~= "" then
                    descendant.Material = Enum.Material.Plastic;
                    descendant.TextureID = "";
                end;

                if descendant.Name == "LeftHand" or (descendant.Name == "LeftFoot" or (descendant.Name == "RightHand" or (descendant.Name == "RightFoot" or (descendant.Name == "UpperTorso" or descendant.Name == "Head")))) then
                    local v25 = ReplicatedStorage.Assets.Effects.DynamiteSmoke:Clone();
                    v25.Parent = descendant;
                    v25.Enabled = true;
                    v25.LockedToPart = true;
                    v25.Acceleration = Vector3.new(0, 5.5, 0);
                    table.insert(u21, v25);
                    u13:GiveTask(v25);
                end;
            elseif descendant:IsA("Texture") or (descendant:IsA("Clothing") or descendant:IsA("Decal")) then
                descendant.Color3 = u4;

                if descendant:IsA("Texture") or descendant:IsA("Decal") then
                    table.insert(u22, descendant);
                end;
            elseif descendant:IsA("ParticleEmitter") or (descendant:IsA("Trail") or descendant:IsA("Beam")) then
                table.insert(u23, descendant);
            elseif descendant:IsA("WeldConstraint") or descendant:IsA("Weld") then
                table.insert(u24, descendant);
            end;
        end;

        task.delay(1.25, function() -- Line: 129
            -- upvalues: u23 (copy), u14 (ref), u24 (copy), u21 (copy), TweenService (ref), u20 (copy), u22 (copy)
            local function _(p26) -- Line: 130
                p26:Destroy();
            end;

            for i, v in u23 do
                local _ = i - 1;
                v:Destroy();
            end;

            u14:BreakJoints();

            local function _(p27) -- Line: 138
                if p27.Parent ~= nil then
                    p27:Destroy();
                end;
            end;

            for i, v in u24 do
                local _ = i - 1;

                if v.Parent ~= nil then
                    v:Destroy();
                end;
            end;

            local u28 = TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);

            local function _(u29) -- Line: 148
                task.delay(1, function() -- Line: 149
                    -- upvalues: u29 (copy)
                    u29.Enabled = false;
                end);
            end;

            for i, v in u21 do
                local _ = i - 1;
                task.delay(1, function() -- Line: 149
                    -- upvalues: v (copy)
                    v.Enabled = false;
                end);
            end;

            local function _(p30) -- Line: 156
                -- upvalues: TweenService (ref), u28 (copy)
                TweenService:Create(p30, u28, {
                    Transparency = 1
                }):Play();
            end;

            for i, v in u20 do
                local _ = i - 1;
                TweenService:Create(v, u28, {
                    Transparency = 1
                }):Play();
            end;

            local function _(p31) -- Line: 165
                -- upvalues: TweenService (ref), u28 (copy)
                TweenService:Create(p31, u28, {
                    Transparency = 1
                }):Play();
            end;

            for i, v in u22 do
                local _ = i - 1;
                TweenService:Create(v, u28, {
                    Transparency = 1
                }):Play();
            end;
        end);
        task.delay(3.4, function() -- Line: 175
            -- upvalues: u13 (ref)
            u13:DoCleaning();
        end);
    end);
    u13:GiveTask(function() -- Line: 180
        -- upvalues: u32 (copy)
        return u32:cancel();
    end);

    return u13;
end;

return u5;