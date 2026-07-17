-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local ArmorEnchantType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").ArmorEnchantType;
local EnchantBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-util").EnchantBalance;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local ArmorAugmentController = RuntimeLib.import(script, script.Parent, "armor-augment-controller").ArmorAugmentController;
local AUGMENT_UPGRADE_EFFECT_DURATION = RuntimeLib.import(script, script.Parent, "armor-augment-manager-controller").AUGMENT_UPGRADE_EFFECT_DURATION;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "SafeguardAugmentController";
    end,

    __index = ArmorAugmentController
});
u3.__index = u3;

function u3.new(...) -- Line: 29
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 33
    -- upvalues: ArmorAugmentController (copy), ArmorEnchantType (copy), StatusEffectType (copy)
    ArmorAugmentController.constructor(p5, ArmorEnchantType.SAFEGUARD, StatusEffectType.ARMOR_ENCHANT_SAFEGUARD);
    p5.Name = "SafeguardAugmentController";
    p5.musicEffectMap = {};
end;

function u3.KnitStart(p6) -- Line: 38
    -- upvalues: ArmorAugmentController (copy)
    ArmorAugmentController.KnitStart(p6);
end;

function u3.onArmorAugmentUpgraded(u7, u8) -- Line: 41
    -- upvalues: KnitClient (copy), AUGMENT_UPGRADE_EFFECT_DURATION (copy)
    KnitClient.Controllers.ArmorAugmentManagerController:playVoidifyEffect(u8);
    task.delay(AUGMENT_UPGRADE_EFFECT_DURATION, function() -- Line: 43
        -- upvalues: u7 (copy), u8 (copy)
        u7:setUpMusicEffect(u8);
    end);
end;

function u3.onArmorAugmentProced(p9, p10, p11) -- Line: 47
    -- upvalues: SoundManager (copy), GameSound (copy)
    if not p10.Character then
        return nil;
    end;

    p9:playProcEffect(p10);
    SoundManager:playSound(GameSound.SOUND_BARRIER_PULSE, {
        position = p10.Character:GetPivot().Position
    });
end;

function u3.onArmorEnchantRemoved(p12, p13) -- Line: 56
    local v14 = p12.musicEffectMap[p13];

    if v14 ~= nil then
        v14:Destroy();
    end;

    p12.musicEffectMap[p13] = nil;
end;

function u3.playProcEffect(p15, p16) -- Line: 68
    -- upvalues: EffectUtil (copy)
    if not p16.Character then
        return nil;
    end;

    local v17 = p15.musicEffectMap[p16];

    if not v17 then
        p15:setUpMusicEffect(p16);
    end;

    if v17 ~= nil then
        local function _(p18) -- Line: 81
            return p18:IsA("ParticleEmitter");
        end;

        local v19 = 0;
        v17 = {};

        for i, descendant in v17.Explosion:GetDescendants() do
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

    p15:putMusicEffectOnCooldown(p16);
end;

function u3.setUpMusicEffect(u20, u21) -- Line: 102
    -- upvalues: ReplicatedStorage (copy), Players (copy), CollectionService (copy), u1 (copy), RunService (copy)
    local Character = u21.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local u22 = ReplicatedStorage.Assets.Effects.SoundBarrierEnchantMusic:Clone();
    u22.Parent = u21.Character;
    u22:PivotTo(u21.Character.PrimaryPart.CFrame);
    u20.musicEffectMap[u21] = u22;

    if u21 == Players.LocalPlayer then
        CollectionService:AddTag(u22.Notes.MusicNotes, "FirstPersonHidden");
    end;

    u1("WeldConstraint", {
        Part0 = u22,
        Part1 = u21.Character.PrimaryPart,
        Parent = u21.Character
    });
    local u23 = 0;
    local Position = u22.Position;
    local u24 = nil;
    u24 = RunService.Heartbeat:Connect(function(p25) -- Line: 129
        -- upvalues: u23 (ref), u20 (copy), u21 (copy), Position (ref), u24 (ref), u22 (copy)
        u23 = u23 + p25;
        local v26 = u20.musicEffectMap[u21];

        if v26 ~= nil then
            v26 = v26.Position;
        end;

        Position = v26;

        if not Position then
            u24:Disconnect();

            return nil;
        end;

        if not u21.Character then
            u24:Disconnect();

            return nil;
        end;

        local v27 = math.sin(u23 * 1.3) * 4;
        local v28 = math.cos(u23 * 1.3) * 4;
        local v29 = Position + Vector3.new(v27, 0, v28);
        local v30 = math.sin((u23 + 0.1) * 1.3) * 4;
        local v31 = math.cos((u23 + 0.1) * 1.3) * 4;
        local v32 = Position + Vector3.new(v30, 0, v31);
        u22.Notes:PivotTo(CFrame.new(v29, v32));
    end);
end;

function u3.putMusicEffectOnCooldown(u33, u34) -- Line: 156
    -- upvalues: EnchantBalance (copy), StatusEffectUtil (copy), StatusEffectType (copy), SoundManager (copy), GameSound (copy)
    local v35 = u33.musicEffectMap[u34];

    if not v35 then
        return nil;
    end;

    local function _(p36) -- Line: 164
        if p36:IsA("ParticleEmitter") then
            p36.Enabled = false;
        end;
    end;

    for i, descendant in v35:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant.Enabled = false;
        end;
    end;

    task.delay(EnchantBalance.SAFEGUARD_COOLDOWN, function() -- Line: 172
        -- upvalues: u34 (copy), StatusEffectUtil (ref), StatusEffectType (ref), u33 (copy), SoundManager (ref), GameSound (ref)
        if not u34.Character then
            return nil;
        end;

        if StatusEffectUtil:getActive(u34.Character, StatusEffectType.ARMOR_ENCHANT_SAFEGUARD) then
            u33:takeMusicEffectOffCooldown(u34);
            SoundManager:playSound(GameSound.SOUND_BARRIER_CD_OFF, {
                position = u34.Character:GetPivot().Position
            });
        end;
    end);
end;

function u3.takeMusicEffectOffCooldown(p37, p38) -- Line: 185
    local v39 = p37.musicEffectMap[p38];

    if not v39 then
        p37:setUpMusicEffect(p38);

        return nil;
    end;

    local function _(p40) -- Line: 194
        if p40:IsA("ParticleEmitter") then
            p40.Enabled = true;
        end;
    end;

    for i, descendant in v39.Notes:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant.Enabled = true;
        end;
    end;
end;

KnitClient.CreateController(u3.new());

return nil;