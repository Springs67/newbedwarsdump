-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "InfernalShieldUltEffectController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 28
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "InfernalShieldUltEffectController";
end;

function u3.KnitStart(u6) -- Line: 36
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u6);
    default.Client:Get("ShieldUltEffect"):Connect(function(p7) -- Line: 38
        -- upvalues: u6 (copy)
        u6:shieldUltEffect(p7.player, p7.target);
    end);
end;

function u3.shieldUltEffect(u8, u9, p10) -- Line: 42
    -- upvalues: ReplicatedStorage (copy), KnitClient (copy), EntityUtil (copy), Workspace (copy), Players (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), GameSound (copy), SoundManager (copy), TweenService (copy)
    local u11 = ReplicatedStorage.Assets.Effects.ShieldUltMark:Clone();
    KnitClient.Controllers.InfernalShieldController:changeIndicatorColor(u9, u11);
    local Character = u9.Character;
    local u12 = EntityUtil:getEntity(u9);

    if u12 ~= nil then
        u12:hideNametag();
    end;

    local PrimaryPart = Character.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.Position;
    end;

    if not (Character and PrimaryPart) then
        return nil;
    end;

    Character.Archivable = true;
    local u13 = Character:Clone();
    u13:SetAttribute("Transparency", 0);
    u13.Parent = Workspace;

    if u9 == Players.LocalPlayer then
        Workspace.CurrentCamera.CameraSubject = u13.Humanoid;
    end;

    local Animator = u13.Humanoid.Animator;

    if not u13.PrimaryPart then
        return nil;
    end;

    Character:SetAttribute("Transparency", 1);
    local v14 = u8:getHighPoint(PrimaryPart, p10);
    local v15 = AnimationUtil:playAnimation(Animator, GameAnimationUtil:getAssetId(AnimationType.INFERNAL_SHIELD_CHARGE));
    local u16 = KnitClient.Controllers.InfernalShieldController:getKitSkinMeta(u9);

    if u16 ~= nil then
        u16 = u16.shielder;

        if u16 ~= nil then
            u16 = u16.sound;
        end;
    end;

    local v17;

    if u16 == nil then
        v17 = u16;
    else
        v17 = u16.launchSound;
    end;

    local v18;

    if v17 == "" or not v17 then
        v18 = GameSound.SHIELDER_CHARGE_1;
    elseif u16 == nil then
        v18 = u16;
    else
        v18 = u16.launchSound;
    end;

    local v19;

    if u16 == nil then
        v19 = u16;
    else
        v19 = u16.leapSound;
    end;

    local v20;

    if v19 == "" or not v19 then
        v20 = GameSound.SHIELDER_LEAP;
    elseif u16 == nil then
        v20 = u16;
    else
        v20 = u16.leapSound;
    end;

    local v21;

    if u16 == nil then
        v21 = u16;
    else
        v21 = u16.landingSound;
    end;

    if v21 == "" or not v21 then
        u16 = GameSound.SHIELDER_SMASH_1;
    elseif u16 ~= nil then
        u16 = u16.landingSound;
    end;

    local v22 = {};
    local Character2 = u9.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;

        if Character2 ~= nil then
            Character2 = Character2.Position;
        end;
    end;

    v22.position = Character2;
    v22.rollOffMaxDistance = 220;
    SoundManager:playSound(v18, v22);
    task.wait(1);

    if v15 ~= nil then
        v15:Destroy();
    end;

    local u23 = AnimationUtil:playAnimation(Animator, GameAnimationUtil:getAssetId(AnimationType.INFERNAL_SHIELD_LEAP));
    local u24 = nil;
    local v25 = TweenInfo.new(0.5);
    local v26 = TweenService:Create(u13.PrimaryPart, v25, {
        CFrame = CFrame.new(v14, p10)
    });
    v26:Play();
    local v27 = {};
    local Character3 = u9.Character;

    if Character3 ~= nil then
        Character3 = Character3.PrimaryPart;

        if Character3 ~= nil then
            Character3 = Character3.Position;
        end;
    end;

    v27.position = Character3;
    v27.rollOffMaxDistance = 220;
    SoundManager:playSound(v20, v27);
    local PrimaryPart2 = u13.PrimaryPart;
    local v28 = TweenInfo.new(0.3);
    local v29 = {};
    local PrimaryPart3 = Character.PrimaryPart;

    if PrimaryPart3 ~= nil then
        PrimaryPart3 = PrimaryPart3.CFrame;
    end;

    v29.CFrame = PrimaryPart3;
    local u30 = TweenService:Create(PrimaryPart2, v28, v29);
    task.delay(0.1, function() -- Line: 182
        -- upvalues: u9 (copy), u11 (copy), Workspace (ref)
        local Character4 = u9.Character;

        if Character4 ~= nil then
            Character4 = Character4.PrimaryPart;

            if Character4 ~= nil then
                Character4 = Character4.Position;
            end;
        end;

        if Character4 then
            u11.Position = u9.Character.PrimaryPart.Position - Vector3.new(0, 2, 0);
            u11.Parent = Workspace;
        end;
    end);
    task.delay(0.7, function() -- Line: 198
        -- upvalues: u8 (copy), u9 (copy), SoundManager (ref), u16 (copy)
        u8:playParticleEffect(u9);
        local v31 = {};
        local Character4 = u9.Character;

        if Character4 ~= nil then
            Character4 = Character4.PrimaryPart;

            if Character4 ~= nil then
                Character4 = Character4.Position;
            end;
        end;

        v31.position = Character4;
        v31.rollOffMaxDistance = 220;
        SoundManager:playSound(u16, v31);
    end);
    v26.Completed:Connect(function() -- Line: 215
        -- upvalues: u30 (copy), u23 (copy), u24 (ref), AnimationUtil (ref), Animator (copy), GameAnimationUtil (ref), AnimationType (ref), u9 (copy)
        u30:Play();
        local v32 = u23;

        if v32 ~= nil then
            v32:Destroy();
        end;

        u24 = AnimationUtil:playAnimation(Animator, GameAnimationUtil:getAssetId(AnimationType.INFERNAL_SHIELD_SLAM));
        AnimationUtil:playAnimation(u9, GameAnimationUtil:getAssetId(AnimationType.INFERNAL_SHIELD_SLAM));
    end);
    u30.Completed:Connect(function() -- Line: 224
        -- upvalues: u13 (copy), Character (copy), u9 (copy), Players (ref), Workspace (ref), u12 (copy), u11 (copy)
        u13:Destroy();
        Character:SetAttribute("Transparency", 0);

        if u9 == Players.LocalPlayer then
            Workspace.CurrentCamera.CameraSubject = Character.Humanoid;
        end;

        local v33 = u12;

        if v33 ~= nil then
            v33:showNametag();
        end;

        u11:Destroy();
    end);
end;

function u3.getHighPoint(p34, p35, p36) -- Line: 237
    return Vector3.new((p35.X + p36.X) / 2, p35.Y + 50, (p35.Z + p36.Z) / 2);
end;

function u3.playParticleEffect(p37, p38) -- Line: 243
    -- upvalues: ReplicatedStorage (copy), KnitClient (copy), Workspace (copy), Players (copy)
    local Character = p38.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local ShieldUltEffect = ReplicatedStorage.Assets.Effects.ShieldUltEffect;
    local v39 = KnitClient.Controllers.InfernalShieldController:getKitSkinMeta(p38);

    if v39 ~= nil then
        v39 = v39.shielder;

        if v39 ~= nil then
            v39 = v39.effect;
        end;
    end;

    local u40 = (v39 or ShieldUltEffect):Clone();
    local u41 = ReplicatedStorage.Assets.Effects.GroudCrack:Clone();
    u40.Position = Character;
    u40.Parent = Workspace;
    u41.Position = Character;
    u41.Parent = Workspace;
    local Character2 = Players.LocalPlayer.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;

        if Character2 ~= nil then
            Character2 = Character2.Position;
        end;
    end;

    if Character2 then
        Character2 = (Character2 - Character).Magnitude <= 20;
    end;

    if Character2 then
        p37:shakeScreen(Character);
    end;

    local function _(p42) -- Line: 291
        if p42:IsA("ParticleEmitter") then
            p42:Emit(30);
        end;
    end;

    for i, descendant in u40:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant:Emit(30);
        end;
    end;

    task.delay(1, function() -- Line: 299
        -- upvalues: u40 (copy), u41 (copy)
        u40:Destroy();
        u41:Destroy();
    end);
end;

function u3.shakeScreen(p43, p44) -- Line: 304
    -- upvalues: Players (copy), KnitClient (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:GetPrimaryPartCFrame();
    end;

    if not Character then
        return nil;
    end;

    KnitClient.Controllers.ScreenShakeController:shake(p44, Character.LookVector, {
        magnitude = 5,
        cycles = 5,
        duration = 0.4
    });
end;

KnitClient.CreateController(u3.new());

return nil;