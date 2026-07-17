-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ArmorEnchantType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").ArmorEnchantType;
local EnchantBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-util").EnchantBalance;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local ArmorAugmentController = RuntimeLib.import(script, script.Parent, "armor-augment-controller").ArmorAugmentController;
local AUGMENT_UPGRADE_EFFECT_DURATION = RuntimeLib.import(script, script.Parent, "armor-augment-manager-controller").AUGMENT_UPGRADE_EFFECT_DURATION;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "SwiftAugmentController";
    end,

    __index = ArmorAugmentController
});
u4.__index = u4;

function u4.new(...) -- Line: 27
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 31
    -- upvalues: ArmorAugmentController (copy), ArmorEnchantType (copy), StatusEffectType (copy), u2 (copy)
    ArmorAugmentController.constructor(p6, ArmorEnchantType.SWIFT, StatusEffectType.ARMOR_ENCHANT_SWIFT);
    p6.Name = "SwiftAugmentController";
    p6.swiftMaid = u2.new();
end;

function u4.KnitStart(u7) -- Line: 36
    -- upvalues: ArmorAugmentController (copy), default (copy)
    ArmorAugmentController.KnitStart(u7);
    u7.pulseEffect = u7:initPulseEffect();
    u7.trailEffectLeft = u7:initTrailEffect();
    u7.trailEffectRight = u7:initTrailEffect();
    default.Client:Get("OutOfCombatTaskTriggered"):Connect(function(p8) -- Line: 41
        -- upvalues: u7 (copy)
        if p8.taskName ~= "SwiftEnchantSpeedBuff" then
            return nil;
        end;

        u7:applySpeedBuff(p8.taskPlayer);
    end);
end;

function u4.onArmorAugmentUpgraded(u9, u10) -- Line: 48
    -- upvalues: KnitClient (copy), AUGMENT_UPGRADE_EFFECT_DURATION (copy)
    KnitClient.Controllers.ArmorAugmentManagerController:playVoidifyEffect(u10);
    task.delay(AUGMENT_UPGRADE_EFFECT_DURATION, function() -- Line: 50
        -- upvalues: u9 (copy), u10 (copy)
        u9:applySpeedBuff(u10);
    end);
end;

function u4.onArmorAugmentProced(p11, p12, p13) -- Line: 54
    p11:removeSpeedBuff(p12);
end;

function u4.onArmorEnchantRemoved(p14, p15) -- Line: 57
    p14:removeSpeedBuff(p15);
end;

function u4.applySpeedBuff(u16, p17) -- Line: 60
    -- upvalues: Players (copy), KnitClient2 (copy), EnchantBalance (copy)
    if p17 ~= Players.LocalPlayer then
        return nil;
    end;

    local v18 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
        moveSpeedMultiplier = 1 + EnchantBalance.SWIFT_SPEED_PERCENT / 100
    });
    u16.swiftMaid:GiveTask(task.spawn(function() -- Line: 67
        -- upvalues: u16 (copy)
        u16:addTrailEffects();
        u16:playPulseEffect();
    end));
    u16.swiftMaid:GiveTask(v18);
end;

function u4.removeSpeedBuff(p19, p20) -- Line: 73
    -- upvalues: Players (copy)
    if p20 ~= Players.LocalPlayer then
        return nil;
    end;

    p19.swiftMaid:DoCleaning();
end;

function u4.playPulseEffect(u21) -- Line: 79
    -- upvalues: Players (copy), SoundManager (copy), GameSound (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:WaitForChild("HumanoidRootPart", 3);
    end;

    if u21.pulseEffect and Character then
        u21.pulseEffect.Parent = Character;
        u21.pulseEffect.Enabled = true;
        u21.pulseEffect:Emit(1);
        SoundManager:playSound(GameSound.SWIFT_ENCHANT_PULSE_ACTIVATE, {
            volumeMultiplier = 0.6
        });
        task.delay(1, function() -- Line: 92
            -- upvalues: u21 (copy)
            if u21.pulseEffect then
                u21.pulseEffect.Enabled = false;
                u21.pulseEffect.Parent = nil;
            end;
        end);
    end;
end;

function u4.addTrailEffects(u22) -- Line: 100
    -- upvalues: Players (copy)
    local Character = Players.LocalPlayer.Character;

    if u22.trailEffectLeft and (u22.trailEffectRight and Character) then
        local RightLowerLeg = Character:WaitForChild("RightLowerLeg", 3);
        local LeftLowerLeg = Character:WaitForChild("LeftLowerLeg", 3);

        if not (RightLowerLeg and LeftLowerLeg) then
            return nil;
        end;

        local RightAnkleRigAttachment = RightLowerLeg:WaitForChild("RightAnkleRigAttachment", 1);
        local RightKneeRigAttachment = RightLowerLeg:WaitForChild("RightKneeRigAttachment", 1);
        local LeftAnkleRigAttachment = LeftLowerLeg:WaitForChild("LeftAnkleRigAttachment", 1);
        local LeftKneeRigAttachment = LeftLowerLeg:WaitForChild("LeftKneeRigAttachment", 1);

        local function _(p23, p24) -- Line: 113
            -- upvalues: LeftAnkleRigAttachment (copy), RightAnkleRigAttachment (copy), LeftKneeRigAttachment (copy), RightKneeRigAttachment (copy), LeftLowerLeg (copy), RightLowerLeg (copy)
            local v25;

            if p24 == 0 then
                v25 = LeftAnkleRigAttachment;
            else
                v25 = RightAnkleRigAttachment;
            end;

            p23.Attachment0 = v25;
            local v26;

            if p24 == 0 then
                v26 = LeftKneeRigAttachment;
            else
                v26 = RightKneeRigAttachment;
            end;

            p23.Attachment1 = v26;
            local v27;

            if p24 == 0 then
                v27 = LeftLowerLeg;
            else
                v27 = RightLowerLeg;
            end;

            p23.Parent = v27;
            p23.Enabled = true;
        end;

        for i, v in { u22.trailEffectLeft, u22.trailEffectRight } do
            local v28 = i - 1;
            local v29;

            if v28 == 0 then
                v29 = LeftAnkleRigAttachment;
            else
                v29 = RightAnkleRigAttachment;
            end;

            v.Attachment0 = v29;
            local v30;

            if v28 == 0 then
                v30 = LeftKneeRigAttachment;
            else
                v30 = RightKneeRigAttachment;
            end;

            v.Attachment1 = v30;
            local v31;

            if v28 == 0 then
                v31 = LeftLowerLeg;
            else
                v31 = RightLowerLeg;
            end;

            v.Parent = v31;
            v.Enabled = true;
        end;

        u22.swiftMaid:GiveTask(function() -- Line: 122
            -- upvalues: u22 (copy)
            if u22.trailEffectLeft and u22.trailEffectRight then
                u22.trailEffectLeft.Enabled = false;
                u22.trailEffectLeft.Parent = nil;
                u22.trailEffectRight.Enabled = false;
                u22.trailEffectRight.Parent = nil;
            end;
        end);
    end;
end;

function u4.initPulseEffect(p32) -- Line: 132
    -- upvalues: u3 (copy)
    local v33 = u3("ParticleEmitter", {
        LightEmission = 1,
        Acceleration = Vector3.new(0, 4, 0),
        Drag = 3.5,
        Rate = 1,
        TimeScale = 1,
        Texture = "rbxassetid://10553903882",
        ZOffset = 0.11,
        Color = ColorSequence.new(Color3.fromRGB(188, 231, 249)),
        Orientation = Enum.ParticleOrientation.FacingCamera,
        Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(0.265, 6.5, 0.383), NumberSequenceKeypoint.new(1, 9, 0) }),
        Transparency = NumberSequence.new(0.412, 1),
        EmissionDirection = Enum.NormalId.Top,
        Lifetime = NumberRange.new(0.35, 0.55)
    });
    v33:SetAttribute("FirstPersonVisible", false);

    return v33;
end;

function u4.initTrailEffect(p34) -- Line: 151
    -- upvalues: u3 (copy)
    return u3("Trail", {
        LightEmission = 0.25,
        Lifetime = 0.5,
        MaxLength = 75,
        Texture = "rbxassetid://10548595199",
        Transparency = NumberSequence.new(0, 0.35),
        Color = ColorSequence.new(Color3.fromRGB(61, 166, 232))
    });
end;

KnitClient.CreateController(u4.new());

return nil;