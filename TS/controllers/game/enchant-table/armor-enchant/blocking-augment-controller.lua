-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local ArmorEnchantType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").ArmorEnchantType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local ArmorAugmentController = RuntimeLib.import(script, script.Parent, "armor-augment-controller").ArmorAugmentController;
local AUGMENT_UPGRADE_EFFECT_DURATION = RuntimeLib.import(script, script.Parent, "armor-augment-manager-controller").AUGMENT_UPGRADE_EFFECT_DURATION;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "BlockingAugmentController";
    end,

    __index = ArmorAugmentController
});
u3.__index = u3;

function u3.new(...) -- Line: 31
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 35
    -- upvalues: ArmorAugmentController (copy), ArmorEnchantType (copy), StatusEffectType (copy)
    ArmorAugmentController.constructor(p5, ArmorEnchantType.BLOCKING, StatusEffectType.ARMOR_ENCHANT_BLOCKING);
    p5.Name = "BlockingAugmentController";
    p5.shieldEffectMap = {};
end;

function u3.KnitStart(u6) -- Line: 40
    -- upvalues: ArmorAugmentController (copy), default (copy), StatusEffectUtil (copy), StatusEffectType (copy), SoundManager (copy), GameSound (copy)
    ArmorAugmentController.KnitStart(u6);
    default.Client:Get("BlockingEnchantOffCooldown"):Connect(function(p7) -- Line: 42
        -- upvalues: StatusEffectUtil (ref), StatusEffectType (ref), u6 (copy), SoundManager (ref), GameSound (ref)
        if not p7.player.Character then
            return nil;
        end;

        if StatusEffectUtil:getActive(p7.player.Character, StatusEffectType.ARMOR_ENCHANT_BLOCKING) then
            u6:takeShieldEffectOffCooldown(p7.player);
            SoundManager:playSound(GameSound.ARMOR_BLOCK_CD_OFF, {
                position = p7.player.Character:GetPivot().Position
            });
        end;
    end);
end;

function u3.onArmorAugmentUpgraded(u8, u9) -- Line: 55
    -- upvalues: KnitClient (copy), AUGMENT_UPGRADE_EFFECT_DURATION (copy)
    KnitClient.Controllers.ArmorAugmentManagerController:playVoidifyEffect(u9);
    task.delay(AUGMENT_UPGRADE_EFFECT_DURATION, function() -- Line: 57
        -- upvalues: u8 (copy), u9 (copy)
        u8:setUpShieldEffect(u9);
    end);
end;

function u3.onArmorAugmentProced(p10, p11, p12) -- Line: 61
    -- upvalues: SoundManager (copy), GameSound (copy), Players (copy), KnitClient (copy)
    if not p11.Character then
        return nil;
    end;

    SoundManager:playSound(GameSound.VOID_SHIELD_BREAK, {
        position = p11.Character:GetPivot().Position
    });
    p10:playProcEffect(p11);

    if p12 == Players.LocalPlayer then
        local Character = p11.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        if Character then
            KnitClient.Controllers.DamageIndicatorController:spawnDamageIndicator(Character, 1, {
                text = "Blocked",
                color = Color3.fromRGB(255, 107, 245)
            });
        end;
    end;
end;

function u3.onArmorEnchantRemoved(p13, p14) -- Line: 86
    local v15 = p13.shieldEffectMap[p14];

    if v15 ~= nil then
        v15:Destroy();
    end;
end;

function u3.playProcEffect(p16, u17) -- Line: 95
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), RunService (copy), scaleModel (copy)
    if not u17.Character then
        return nil;
    end;

    local u18 = ReplicatedStorage.Assets.Effects.VoidShieldBreak:Clone();
    u18:PivotTo(u17.Character:GetPivot());
    u18.Parent = Workspace;
    local Shield = u18:WaitForChild("Shield", 3);
    Shield.Transparency = 0.4;
    local u19 = tick() + 1;
    local u20 = 1;
    RunService.Heartbeat:Connect(function(p21) -- Line: 106
        -- upvalues: u19 (copy), Shield (copy), u17 (copy), u18 (copy), scaleModel (ref), u20 (ref)
        if u19 < tick() + p21 then
            Shield:Destroy();

            return nil;
        end;

        if not u17.Character then
            return nil;
        end;

        u18:PivotTo(u17.Character:GetPivot());
        local v22 = Shield;
        v22.Transparency = v22.Transparency + p21 * 2.5;
        scaleModel(u18, u20);
        u20 = u20 + p21;
    end);
    p16:putShieldEffectOnCooldown(u17);
end;

function u3.setUpShieldEffect(p23, p24) -- Line: 121
    -- upvalues: ReplicatedStorage (copy), CollectionService (copy), u1 (copy)
    local Character = p24.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local v25 = ReplicatedStorage.Assets.Effects.BlockingEnchantShields:Clone();
    v25.Parent = p24.Character;
    v25:PivotTo(p24.Character.PrimaryPart.CFrame);
    p23.shieldEffectMap[p24] = v25;

    local function _(p26) -- Line: 136
        -- upvalues: CollectionService (ref)
        CollectionService:AddTag(p26, "FirstPersonHidden");
    end;

    for i, descendant in v25:GetDescendants() do
        local _ = i - 1;
        CollectionService:AddTag(descendant, "FirstPersonHidden");
    end;

    u1("WeldConstraint", {
        Part0 = v25,
        Part1 = p24.Character.PrimaryPart,
        Parent = p24.Character
    });
    p23:tweenShieldSizeUp(v25.Shields);
end;

function u3.tweenShieldSizeUp(p27, p28) -- Line: 149
    -- upvalues: TweenService (copy)
    TweenService:Create(p28, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
        Size = Vector3.new(6, 2.4, 6)
    }):Play();
end;

function u3.putShieldEffectOnCooldown(p29, p30) -- Line: 154
    -- upvalues: TweenService (copy)
    local u31 = p29.shieldEffectMap[p30];

    if not u31 then
        return nil;
    end;

    TweenService:Create(u31.Shields, TweenInfo.new(0.4, Enum.EasingStyle.Sine), {
        Transparency = 1
    }):Play();
    task.delay(0.4, function() -- Line: 165
        -- upvalues: u31 (copy)
        u31.Shields.Size = Vector3.new(2, 1.3, 2);
    end);
end;

function u3.takeShieldEffectOffCooldown(p32, p33) -- Line: 169
    -- upvalues: TweenService (copy)
    local v34 = p32.shieldEffectMap[p33];

    if not v34 then
        p32:setUpShieldEffect(p33);

        return nil;
    end;

    TweenService:Create(v34.Shields, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        Transparency = 0.3
    }):Play();
    p32:tweenShieldSizeUp(v34.Shields);
end;

KnitClient.CreateController(u3.new());

return nil;