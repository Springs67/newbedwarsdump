-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local ReplicatedStorage = v2.ReplicatedStorage;
local TweenService = v2.TweenService;
local ArmorEnchantType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").ArmorEnchantType;
local EnchantBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-util").EnchantBalance;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local ArmorAugmentController = RuntimeLib.import(script, script.Parent, "armor-augment-controller").ArmorAugmentController;
local AUGMENT_UPGRADE_EFFECT_DURATION = RuntimeLib.import(script, script.Parent, "armor-augment-manager-controller").AUGMENT_UPGRADE_EFFECT_DURATION;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "FrostAugmentController";
    end,

    __index = ArmorAugmentController
});
u3.__index = u3;

function u3.new(...) -- Line: 28
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 32
    -- upvalues: ArmorAugmentController (copy), ArmorEnchantType (copy), StatusEffectType (copy)
    ArmorAugmentController.constructor(p5, ArmorEnchantType.FROST, StatusEffectType.ARMOR_ENCHANT_FROST);
    p5.Name = "FrostAugmentController";
    p5.iceEffectMap = {};
end;

function u3.KnitStart(p6) -- Line: 37
    -- upvalues: ArmorAugmentController (copy)
    ArmorAugmentController.KnitStart(p6);
end;

function u3.onArmorAugmentUpgraded(u7, u8) -- Line: 40
    -- upvalues: KnitClient (copy), AUGMENT_UPGRADE_EFFECT_DURATION (copy)
    KnitClient.Controllers.ArmorAugmentManagerController:playVoidifyEffect(u8);
    task.delay(AUGMENT_UPGRADE_EFFECT_DURATION, function() -- Line: 42
        -- upvalues: u7 (copy), u8 (copy)
        u7:setUpIceEffect(u8);
    end);
end;

function u3.onArmorAugmentProced(p9, p10, p11) -- Line: 46
    -- upvalues: SoundManager (copy), GameSound (copy)
    if not p10.Character then
        return nil;
    end;

    p9:playProcEffect(p10);
    SoundManager:playSound(GameSound.FROST_ARMOR_ICY_BLAST, {
        position = p10.Character:GetPivot().Position
    });
end;

function u3.onArmorEnchantRemoved(p12, p13) -- Line: 55
    local v14 = p12.iceEffectMap[p13];

    if v14 ~= nil then
        v14:Destroy();
    end;
end;

function u3.playProcEffect(p15, p16) -- Line: 64
    -- upvalues: EffectUtil (copy)
    if not p16.Character then
        return nil;
    end;

    local v17 = p15.iceEffectMap[p16];

    if not v17 then
        p15:setUpIceEffect(p16);
    end;

    if v17 ~= nil then
        local function _(p18) -- Line: 77
            return p18:IsA("ParticleEmitter");
        end;

        local v19 = 0;
        v17 = {};

        for i, descendant in v17:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ParticleEmitter") == true then
                v19 = v19 + 1;
                v17[v19] = descendant;
            end;
        end;
    end;

    if v17 then
        EffectUtil:playEffects(v17, p16.Character);
    end;

    p15:putIceEffectOnCooldown(p16);
end;

function u3.setUpIceEffect(p20, p21) -- Line: 98
    -- upvalues: ReplicatedStorage (copy), CollectionService (copy), u1 (copy)
    local Character = p21.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local v22 = ReplicatedStorage.Assets.Effects.FrostEnchantIce:Clone();
    v22.Parent = p21.Character;
    v22:PivotTo(p21.Character.PrimaryPart.CFrame);
    p20.iceEffectMap[p21] = v22;

    local function _(p23) -- Line: 113
        -- upvalues: CollectionService (ref)
        if not p23:IsA("ParticleEmitter") then
            CollectionService:AddTag(p23, "FirstPersonHidden");
        end;
    end;

    for i, descendant in v22:GetDescendants() do
        local _ = i - 1;

        if not descendant:IsA("ParticleEmitter") then
            CollectionService:AddTag(descendant, "FirstPersonHidden");
        end;
    end;

    u1("WeldConstraint", {
        Part0 = v22,
        Part1 = p21.Character.PrimaryPart,
        Parent = p21.Character
    });
    p20:tweenTransparencyUp(v22);
end;

function u3.tweenTransparencyUp(p24, p25) -- Line: 128
    -- upvalues: TweenService (copy)
    local v26 = p25:GetDescendants();

    local function v28(p27) -- Line: 130
        -- upvalues: TweenService (ref)
        if p27:IsA("MeshPart") then
            TweenService:Create(p27, TweenInfo.new(0.8, Enum.EasingStyle.Sine), {
                Transparency = 0
            }):Play();

            return;
        end;

        if p27:IsA("Decal") then
            TweenService:Create(p27, TweenInfo.new(1.2, Enum.EasingStyle.Sine), {
                Transparency = 0
            }):Play();
        end;
    end;

    for i, v in v26 do
        v28(v, i - 1, v26);
    end;
end;

function u3.putIceEffectOnCooldown(u29, u30) -- Line: 145
    -- upvalues: EnchantBalance (copy), StatusEffectUtil (copy), StatusEffectType (copy), SoundManager (copy), GameSound (copy)
    local v31 = u29.iceEffectMap[u30];

    if not v31 then
        return nil;
    end;

    local function _(p32) -- Line: 153
        if p32:IsA("MeshPart") or p32:IsA("Decal") then
            p32.Transparency = 1;
        end;
    end;

    for i, descendant in v31:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("MeshPart") or descendant:IsA("Decal") then
            descendant.Transparency = 1;
        end;
    end;

    task.delay(EnchantBalance.FROST_COOLDOWN, function() -- Line: 161
        -- upvalues: u30 (copy), StatusEffectUtil (ref), StatusEffectType (ref), u29 (copy), SoundManager (ref), GameSound (ref)
        if not u30.Character then
            return nil;
        end;

        if StatusEffectUtil:getActive(u30.Character, StatusEffectType.ARMOR_ENCHANT_FROST) then
            u29:takeIceEffectOffCooldown(u30);
            SoundManager:playSound(GameSound.FROST_ARMOR_CD_OFF, {
                position = u30.Character:GetPivot().Position
            });
        end;
    end);
end;

function u3.takeIceEffectOffCooldown(p33, p34) -- Line: 174
    local v35 = p33.iceEffectMap[p34];

    if not v35 then
        p33:setUpIceEffect(p34);

        return nil;
    end;

    p33:tweenTransparencyUp(v35);
end;

KnitClient.CreateController(u3.new());

return nil;