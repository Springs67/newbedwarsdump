-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local TweenService = v2.TweenService;
local ArmorEnchantType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").ArmorEnchantType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local ArmorAugmentController = RuntimeLib.import(script, script.Parent, "armor-augment-controller").ArmorAugmentController;
local AUGMENT_UPGRADE_EFFECT_DURATION = RuntimeLib.import(script, script.Parent, "armor-augment-manager-controller").AUGMENT_UPGRADE_EFFECT_DURATION;
local u3 = { GameSound.ENDURANCE_ROCK_HIT_1, GameSound.ENDURANCE_ROCK_HIT_2, GameSound.ENDURANCE_ROCK_HIT_3 };
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "EnduranceAugmentController";
    end,

    __index = ArmorAugmentController
});
u4.__index = u4;

function u4.new(...) -- Line: 28
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 32
    -- upvalues: ArmorAugmentController (copy), ArmorEnchantType (copy), StatusEffectType (copy)
    ArmorAugmentController.constructor(p6, ArmorEnchantType.ENDURANCE, StatusEffectType.ARMOR_ENCHANT_ENDURANCE);
    p6.Name = "EnduranceAugmentController";
    p6.rockEffectMap = {};
end;

function u4.KnitStart(p7) -- Line: 37
    -- upvalues: ArmorAugmentController (copy)
    ArmorAugmentController.KnitStart(p7);
end;

function u4.onArmorAugmentUpgraded(u8, u9) -- Line: 40
    -- upvalues: KnitClient (copy), AUGMENT_UPGRADE_EFFECT_DURATION (copy)
    KnitClient.Controllers.ArmorAugmentManagerController:playVoidifyEffect(u9);
    task.delay(AUGMENT_UPGRADE_EFFECT_DURATION, function() -- Line: 42
        -- upvalues: u8 (copy), u9 (copy)
        u8:setUpRockEffect(u9);
    end);
end;

function u4.onArmorAugmentProced(p10, p11, p12) -- Line: 46
    -- upvalues: Players (copy), u3 (copy), SoundManager (copy)
    if p11 ~= Players.LocalPlayer then
        return nil;
    end;

    if p11 ~= p12 then
        return nil;
    end;

    SoundManager:playSound(u3[math.random(0, #u3 - 1) + 1], {
        volumeMultiplier = 0.5
    });
end;

function u4.onArmorEnchantRemoved(p13, p14) -- Line: 58
    local v15 = p13.rockEffectMap[p14];

    if v15 ~= nil then
        v15:Destroy();
    end;
end;

function u4.setUpRockEffect(p16, p17) -- Line: 67
    -- upvalues: ReplicatedStorage (copy), CollectionService (copy), EffectUtil (copy), u1 (copy)
    local Character = p17.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local v18 = ReplicatedStorage.Assets.Effects.EnduranceEnchantRocks:Clone();
    v18.Parent = p17.Character;
    v18:PivotTo(p17.Character.PrimaryPart.CFrame);
    p16.rockEffectMap[p17] = v18;
    local u19 = {};

    local function _(p20) -- Line: 83
        -- upvalues: u19 (copy), CollectionService (ref)
        if p20:IsA("ParticleEmitter") then
            table.insert(u19, p20);

            return;
        end;

        if p20:IsA("Part") then
            CollectionService:AddTag(p20, "FirstPersonHidden");
        end;
    end;

    for i, descendant in v18:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            table.insert(u19, descendant);
        elseif descendant:IsA("Part") then
            CollectionService:AddTag(descendant, "FirstPersonHidden");
        end;
    end;

    EffectUtil:playEffects(u19, p17.Character);
    u1("WeldConstraint", {
        Part0 = v18,
        Part1 = p17.Character.PrimaryPart,
        Parent = p17.Character
    });
    p16:tweenTransparencyUp(v18);
end;

function u4.tweenTransparencyUp(p21, p22) -- Line: 103
    -- upvalues: TweenService (copy)
    local v23 = p22:GetDescendants();

    local function v25(p24) -- Line: 105
        -- upvalues: TweenService (ref)
        if p24:IsA("MeshPart") then
            TweenService:Create(p24, TweenInfo.new(1.2, Enum.EasingStyle.Sine), {
                Transparency = 0
            }):Play();
        end;
    end;

    for i, v in v23 do
        v25(v, i - 1, v23);
    end;
end;

KnitClient.CreateController(u4.new());

return nil;