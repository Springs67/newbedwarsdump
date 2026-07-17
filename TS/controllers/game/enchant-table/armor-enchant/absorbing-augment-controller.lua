-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local MathExtras = v1.MathExtras;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local ReplicatedStorage = v3.ReplicatedStorage;
local ArmorEnchantType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").ArmorEnchantType;
local EnchantBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-util").EnchantBalance;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local ArmorAugmentController = RuntimeLib.import(script, script.Parent, "armor-augment-controller").ArmorAugmentController;
local AUGMENT_UPGRADE_EFFECT_DURATION = RuntimeLib.import(script, script.Parent, "armor-augment-manager-controller").AUGMENT_UPGRADE_EFFECT_DURATION;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "AbsorbingAugmentController";
    end,

    __index = ArmorAugmentController
});
u4.__index = u4;

function u4.new(...) -- Line: 31
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 35
    -- upvalues: ArmorAugmentController (copy), ArmorEnchantType (copy), StatusEffectType (copy)
    ArmorAugmentController.constructor(p6, ArmorEnchantType.ABSORPTION, StatusEffectType.ARMOR_ENCHANT_ABSORPTION);
    p6.Name = "AbsorbingAugmentController";
    p6.damageStoredConnectionMap = {};
    p6.bubbleEffectMap = {};
end;

function u4.KnitStart(p7) -- Line: 41
    -- upvalues: ArmorAugmentController (copy)
    ArmorAugmentController.KnitStart(p7);
end;

function u4.onArmorAugmentUpgraded(u8, u9) -- Line: 44
    -- upvalues: KnitClient (copy), AUGMENT_UPGRADE_EFFECT_DURATION (copy), MathExtras (copy), EnchantBalance (copy)
    KnitClient.Controllers.ArmorAugmentManagerController:playVoidifyEffect(u9);
    task.delay(AUGMENT_UPGRADE_EFFECT_DURATION, function() -- Line: 46
        -- upvalues: u8 (copy), u9 (copy), MathExtras (ref), EnchantBalance (ref)
        u8:setUpBubbleEffect(u9);
        local v12 = u9:GetAttributeChangedSignal("DamageStored"):Connect(function() -- Line: 48
            -- upvalues: u8 (ref), u9 (ref), MathExtras (ref), EnchantBalance (ref)
            local v10 = u8.bubbleEffectMap[u9];

            if v10 ~= nil then
                v10 = v10.Bubble;
            end;

            if not v10 then
                return nil;
            end;

            v10.Transparency = MathExtras:rangeMap(u9:GetAttribute("DamageStored"), { 0, EnchantBalance.ABSORBING_AMOUNT_MAX }, { 0.6, 0.2 });
            local v11 = MathExtras:rangeMap(u9:GetAttribute("DamageStored"), { 0, EnchantBalance.ABSORBING_AMOUNT_MAX }, { 3, 6 });
            v10.Size = Vector3.new(v11, v11, v11);
        end);
        u8.damageStoredConnectionMap[u9] = v12;
    end);
end;

function u4.onArmorAugmentProced(p13, p14, p15) -- Line: 69
    -- upvalues: SoundManager (copy), GameSound (copy)
    if not p14.Character then
        return nil;
    end;

    SoundManager:playSound(GameSound.ABSORPTION_BUBBLE_POP, {
        volumeMultiplier = 1.8,
        position = p14.Character:GetPivot().Position
    });
    p13:playEffect(p14);
end;

function u4.onArmorEnchantRemoved(p16, p17) -- Line: 79
    local v18 = p16.damageStoredConnectionMap[p17];

    if v18 ~= nil then
        v18:Disconnect();
    end;

    local v19 = p16.bubbleEffectMap[p17];

    if v19 ~= nil then
        v19:Destroy();
    end;
end;

function u4.playEffect(p20, p21) -- Line: 95
    if not p21.Character then
        return nil;
    end;
end;

function u4.setUpBubbleEffect(p22, p23) -- Line: 100
    -- upvalues: ReplicatedStorage (copy), CollectionService (copy), u2 (copy)
    local Character = p23.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local v24 = ReplicatedStorage.Assets.Effects.AbsorptionEnchantBubble:Clone();
    v24.Parent = p23.Character;
    v24:PivotTo(p23.Character.PrimaryPart.CFrame);
    p22.bubbleEffectMap[p23] = v24;

    local function _(p25) -- Line: 115
        -- upvalues: CollectionService (ref)
        CollectionService:AddTag(p25, "FirstPersonHidden");
    end;

    for i, descendant in v24:GetDescendants() do
        local _ = i - 1;
        CollectionService:AddTag(descendant, "FirstPersonHidden");
    end;

    u2("WeldConstraint", {
        Part0 = v24,
        Part1 = p23.Character.PrimaryPart,
        Parent = p23.Character
    });
end;

KnitClient.CreateController(u4.new());

return nil;