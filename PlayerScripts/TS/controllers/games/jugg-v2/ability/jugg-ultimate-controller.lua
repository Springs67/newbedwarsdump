-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local JuggernautUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "juggernaut-balance-file").JuggernautUtil;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local DamageType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "JuggUltimateController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 39
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 43
    -- upvalues: KnitController (copy), u3 (copy), Players (copy), AnimationType (copy)
    KnitController.constructor(p7);
    p7.Name = "JuggUltimateController";
    p7.maid = u3.new();
    p7.defaultCameraMaxDistance = Players.LocalPlayer.CameraMaxZoomDistance;
    p7.defaultCameraMinDistance = Players.LocalPlayer.CameraMinZoomDistance;
    p7.animationList = { AnimationType.HEAVENLY_SWORD_SWING, AnimationType.JUGGERNAUT_SWING };
end;

function u5.KnitStart(u8) -- Line: 51
    -- upvalues: KnitClient (copy), GameType (copy), default (copy), Players (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), EntityDamageEventZap (copy), DamageType (copy)
    KnitClient.Controllers.PreloadController:runPreload({
        animations = u8.animationList,
        loadOnGameTypes = { GameType.JUGGERNAUT_V2 }
    });
    default.Client:Get("NewJuggernaut"):Connect(function(p9) -- Line: 56
        -- upvalues: Players (ref), u8 (copy)
        if p9.player == Players.LocalPlayer then
            u8:mountAbility();

            return;
        end;

        local v10 = Players.LocalPlayer:GetAttribute("Juggernaut");

        if v10 == 0 or (v10 ~= v10 or (v10 == "" or not v10)) then
            u8:unmountAbility();
        end;
    end);
    default.Client:Get("EntityDeathEvent"):Connect(function(p11) -- Line: 66
        -- upvalues: Players (ref), u8 (copy)
        if Players:GetPlayerFromCharacter(p11.entityInstance) == Players.LocalPlayer then
            u8:unmountAbility();
        end;
    end);
    default.Client:Get("JuggernautStabGroundEvent"):Connect(function(u12) -- Line: 72
        -- upvalues: AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), Players (ref), u8 (copy)
        local Character = u12.player.Character;

        if Character ~= nil then
            Character = Character:GetPrimaryPartCFrame().Position;
        end;

        if not Character then
            return nil;
        end;

        local v13 = AnimationUtil:playAnimation(u12.player, GameAnimationUtil:getAssetId(AnimationType.HEAVENLY_SWORD_CHARGE));
        SoundManager:playSound(GameSound.SPIRIT_DAGGER_CHARGE, {
            rollOffMaxDistance = 45,
            volumeMultiplier = 0.7,
            position = Character
        });
        local Character2 = Players.LocalPlayer.Character;

        if Character2 ~= nil then
            Character2 = Character2.PrimaryPart;

            if Character2 ~= nil then
                Character2 = Character2.Position;
            end;
        end;

        if Character2 then
            Character2 = (Character2 - Character).Magnitude <= 40;
        end;

        if Character2 then
            u8:shakeScreen(Character);
        end;

        v13:AdjustSpeed(2);
        v13.Stopped:Connect(function() -- Line: 105
            -- upvalues: u8 (ref), u12 (copy)
            u8:playTweenEffect(u12.player, u12.victims);
        end);
    end);
    default.Client:Get("JuggernautUseUltEvent"):Connect(function(p14) -- Line: 109
        -- upvalues: u8 (copy)
        u8:stabGroundAnimation(p14.player);
        u8:playStabGroundEffect(p14.player);
    end);
    EntityDamageEventZap.On(function(p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28) -- Line: 113
        -- upvalues: DamageType (ref), Players (ref), u8 (copy)
        if p17 ~= DamageType.JUGGERNAUT_ULT then
            return nil;
        end;

        local JuggUltSlash = p15:FindFirstChild("JuggUltSlash");
        local v29 = Players:GetPlayerFromCharacter(p15);

        if JuggUltSlash and v29 then
            u8:playExplosionEffect(v29);
            JuggUltSlash:Destroy();
        end;
    end);
end;

function u5.playStabGroundEffect(u30, u31) -- Line: 125
    -- upvalues: Players (copy), Workspace (copy), SoundManager (copy), GameSound (copy)
    if u31 == Players.LocalPlayer then
        local Character = u31.Character;
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = (CurrentCamera.CFrame.Position - Character.Head.Position).Magnitude;
        end;

        u30.cameraDistance = CurrentCamera;
        Players.LocalPlayer.CameraMaxZoomDistance = u30.defaultCameraMaxDistance * 2;
        Players.LocalPlayer.CameraMinZoomDistance = u30.defaultCameraMaxDistance * 2;
        Players.LocalPlayer.CameraMinZoomDistance = u30.defaultCameraMinDistance;
    end;

    task.delay(0.7, function() -- Line: 139
        -- upvalues: u31 (copy), u30 (copy), SoundManager (ref), GameSound (ref)
        local Character = u31.Character;

        if Character ~= nil then
            Character = Character:GetPrimaryPartCFrame();
        end;

        if not Character then
            return nil;
        end;

        u30:playStomperEffects(Character + Character.LookVector.Unit * 3);
        local JUGGERNAUT_GROUND_SMASH = GameSound.JUGGERNAUT_GROUND_SMASH;
        local v32 = {};
        local Character2 = u31.Character;

        if Character2 ~= nil then
            Character2 = Character2:GetPrimaryPartCFrame().Position;
        end;

        v32.position = Character2;
        v32.rollOffMaxDistance = 45;
        v32.volumeMultiplier = 0.7;
        SoundManager:playSound(JUGGERNAUT_GROUND_SMASH, v32);
    end);
end;

function u5.playTweenEffect(u33, u34, p35) -- Line: 166
    -- upvalues: Workspace (copy), Players (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), TweenService (copy), SoundManager (copy), GameSound (copy)
    local Character = u34.Character;
    Character.Archivable = true;
    local u36 = Character:Clone();
    u36.Parent = Workspace;

    if u34 == Players.LocalPlayer then
        Workspace.CurrentCamera.CameraSubject = u36.Humanoid;
    end;

    u34.Character:SetAttribute("Transparency", 1);
    u36:PivotTo(Character:GetPrimaryPartCFrame());
    local Animator = u36.Humanoid.Animator;
    local v37 = 0;

    for _, v in p35 do
        local u38 = AnimationUtil:playAnimation(v, GameAnimationUtil:getAssetId(AnimationType.DRAGON_SLAYER_LAUNCH_LOOP));
        task.delay(#p35 * 0.2 + 1.5, function() -- Line: 180
            -- upvalues: u38 (copy)
            u38:Stop();
            u38:Destroy();
        end);
        u36.PrimaryPart.Anchored = false;
        local v39 = TweenInfo.new(0.05);
        local u40 = TweenService:Create(u36.PrimaryPart, v39, {
            CFrame = CFrame.new(v.Character.PrimaryPart.Position)
        });
        local u41 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(u33.animationList[v37 + 1]));
        v37 = v37 == 1 and 0 or 1;
        u40:Play();
        u40.Completed:Connect(function() -- Line: 196
            -- upvalues: u36 (copy), u41 (copy), u40 (copy), u33 (copy), v (copy)
            u36.PrimaryPart.Anchored = true;
            u41:AdjustSpeed(3);
            u41:Play();
            u40:Destroy();
            task.delay(0.05, function() -- Line: 201
                -- upvalues: u33 (ref), u36 (ref), v (ref)
                u33:playSlashEffect(u36, v.Character);
            end);
        end);
        task.wait(0.2);
    end;

    local v42 = TweenInfo.new(0.05);
    local v43 = TweenService:Create(u36.PrimaryPart, v42, {
        CFrame = Character:GetPrimaryPartCFrame()
    });
    v43:Play();
    local u44 = AnimationUtil:playAnimation(u34, GameAnimationUtil:getAssetId(AnimationType.JUGGERNAUT_ULTIMATE));
    u44:GetMarkerReachedSignal("air2"):Connect(function() -- Line: 213
        -- upvalues: u44 (copy)
        u44:AdjustSpeed(0);
        task.delay(0.25, function() -- Line: 215
            -- upvalues: u44 (ref)
            u44:AdjustSpeed(1);
        end);
    end);
    u44:GetMarkerReachedSignal("slam"):Connect(function() -- Line: 219
        -- upvalues: u34 (copy), u33 (copy), SoundManager (ref), GameSound (ref)
        local Character2 = u34.Character;

        if Character2 ~= nil then
            Character2 = Character2:GetPrimaryPartCFrame();
        end;

        if Character2 ~= nil then
            Character2 = Character2 + Character2.LookVector.Unit * 3;
        end;

        if Character2 then
            u33:stabGroundExplosionEffect(Character2);
        end;

        local STOMPER_HIT = GameSound.STOMPER_HIT;
        local v45 = {};

        if Character2 ~= nil then
            Character2 = Character2.Position;
        end;

        v45.position = Character2;
        v45.rollOffMaxDistance = 45;
        v45.volumeMultiplier = 0.7;
        SoundManager:playSound(STOMPER_HIT, v45);
    end);
    v43.Completed:Connect(function() -- Line: 247
        -- upvalues: u34 (copy), Players (ref), Workspace (ref), u36 (copy), Character (copy), u33 (copy)
        if u34 == Players.LocalPlayer then
            Workspace.CurrentCamera.CameraSubject = Players.LocalPlayer.Character.Humanoid;
        end;

        u36:Destroy();
        Character:SetAttribute("Transparency", 0);
        task.delay(1.5, function() -- Line: 253
            -- upvalues: u34 (ref), Players (ref), u33 (ref)
            local v46;

            if u34 == Players.LocalPlayer then
                v46 = u33.cameraDistance;
            else
                v46 = false;
            end;

            if v46 ~= 0 and (v46 == v46 and v46) then
                Players.LocalPlayer.CameraMaxZoomDistance = u33.cameraDistance;
                Players.LocalPlayer.CameraMaxZoomDistance = u33.defaultCameraMaxDistance;
            end;
        end);
    end);
end;

function u5.mountAbility(p47) -- Line: 262
    -- upvalues: Flamework (copy), AbilityId (copy), BedwarsImageId (copy), CooldownId (copy), JuggernautUtil (copy)
    local u48 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.JUGGERNAUT_ULTIMATE, {
        abilityType = "ItemPrimary",
        abilityButton = {
            icon = BedwarsImageId.JUGG_BARB_ULT
        }
    }):expect();
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.JUGGERNAUT_ULT, JuggernautUtil.ULT_COOLDOWN);
    p47.maid:GiveTask(function() -- Line: 270
        -- upvalues: u48 (copy)
        u48.Destroy();
    end);
end;

function u5.unmountAbility(p49) -- Line: 274
    p49.maid:DoCleaning();
end;

function u5.playSlashEffect(p50, p51, p52) -- Line: 277
    -- upvalues: SoundManager (copy), GameSound (copy), ReplicatedStorage (copy)
    local v53 = p51:GetPrimaryPartCFrame();

    if not v53 then
        return nil;
    end;

    SoundManager:playSound(GameSound.SPIRIT_DAGGER_SLASH, {
        rollOffMaxDistance = 45,
        volumeMultiplier = 0.7,
        position = v53.Position
    });
    local v54 = ReplicatedStorage.Assets.Effects.JuggernautSwing:Clone();
    v54.Name = "JuggUltSlash";
    v54:PivotTo(v53);
    v54.Parent = p52;
    v54:PivotTo(v53 * CFrame.new(0, 0, -2));
end;

function u5.playExplosionEffect(p55, p56) -- Line: 296
    -- upvalues: ReplicatedStorage (copy), Workspace (copy)
    local u57 = ReplicatedStorage.Assets.Effects.JuggernautUltExplosion:Clone();
    local Character = p56.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    u57.Position = Character;
    u57.Parent = Workspace;

    local function _(p58) -- Line: 312
        if p58:IsA("ParticleEmitter") then
            p58:Emit(30);
        end;
    end;

    for i, descendant in u57:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant:Emit(30);
        end;
    end;

    task.delay(1, function() -- Line: 320
        -- upvalues: u57 (copy)
        u57:Destroy();
    end);
end;

function u5.playStomperEffects(p59, p60) -- Line: 324
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy)
    local u61 = ReplicatedStorage.Assets.Effects.Stomper:Clone();

    if not u61.PrimaryPart then
        return nil;
    end;

    u61:PivotTo(p60);
    u61.Parent = Workspace;
    EffectUtil:playEffects({ u61 }, nil);
    task.delay(0.5, function() -- Line: 333
        -- upvalues: u61 (copy)
        u61:Destroy();
    end);
end;

function u5.stabGroundExplosionEffect(p62, p63) -- Line: 337
    -- upvalues: ReplicatedStorage (copy), Workspace (copy)
    local Position = p63.Position;
    local u64 = ReplicatedStorage.Assets.Effects.NewJuggernaut:Clone();
    u64.Position = Position;
    u64.Parent = Workspace;

    local function _(p65) -- Line: 343
        if p65:IsA("ParticleEmitter") then
            p65:Emit(30);
        end;
    end;

    for i, descendant in u64:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant:Emit(30);
        end;
    end;

    task.delay(1, function() -- Line: 351
        -- upvalues: u64 (copy)
        u64:Destroy();
    end);
end;

function u5.stabGroundAnimation(p66, p67) -- Line: 355
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), Players (copy), KnitClient2 (copy)
    AnimationUtil:playAnimation(p67, GameAnimationUtil:getAssetId(AnimationType.JUGGERNAUT_STAB_GROUND));

    if p67 == Players.LocalPlayer then
        KnitClient2.Controllers.ViewmodelController:playAnimation(AnimationType.JUGGERNAUT_GROUND_STAB_FP);
    end;
end;

function u5.shakeScreen(p68, p69) -- Line: 361
    -- upvalues: Players (copy), KnitClient (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:GetPrimaryPartCFrame();
    end;

    if not Character then
        return nil;
    end;

    KnitClient.Controllers.ScreenShakeController:shake(p69, Character.LookVector, {
        magnitude = 5,
        cycles = 5,
        duration = 0.4
    });
end;

KnitClient.CreateController(u5.new());

return nil;