-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v7.CollectionService;
local Players = v7.Players;
local ReplicatedStorage = v7.ReplicatedStorage;
local RunService = v7.RunService;
local Workspace = v7.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local v8 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "sorcerer-balance");
local SorcererBalance = v8.SorcererBalance;
local SorcererTier = v8.SorcererTier;
local ExplosionType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local SpellChargeComponent = RuntimeLib.import(script, script.Parent, "ui", "spell-charge-progress").SpellChargeComponent;
local SorcererKit = RuntimeLib.import(script, script.Parent, "ui", "spell-tracker").SorcererKit;
local u9 = { ExplosionType.SORCERER_EXPLOSION_1, ExplosionType.SORCERER_EXPLOSION_2, ExplosionType.SORCERER_EXPLOSION_3 };
local u10 = Color3.fromRGB(89, 149, 182);
local u11 = {
    UPGRADE_1 = GameSound.SORCERER_SPELL_UPGRADES,
    UPGRADE_2 = GameSound.SORCERER_SPELL_UPGRADES,
    UPGRADE_3 = GameSound.SORCERER_SPELL_UPGRADES,
    SHOT = GameSound.SORCERER_PROJECTILE_SHOOT,
    HIT = GameSound.SORCERER_PROJECTILE_HIT,
    CHARGE_LOOP = GameSound.SORCERER_SPELL_CHARGING_LOOP
};
local u12 = {
    UPGRADE_1 = GameSound.SORCERER_ICE_CHARGE_UPGRADE_1,
    UPGRADE_2 = GameSound.SORCERER_ICE_CHARGE_UPGRADE_2,
    UPGRADE_3 = GameSound.SORCERER_ICE_CHARGE_UPGRADE_3,
    SHOT = GameSound.SORCERER_ICE_PROJECTILE_SHOT,
    HIT = GameSound.SORCERER_ICE_PROJECTILE_HIT,
    CHARGE_LOOP = GameSound.SORCERER_ICE_CHARGE_LOOP
};
local v13 = v3.values(SorcererBalance.getSorcererMeta());

local function _(p14, p15) -- Line: 61
    p14[p15.abilityId] = true;

    return p14;
end;

local u16 = {};

for i = 1, #v13 do
    local _ = i - 1;
    u16[v13[i].abilityId] = true;
end;

local u17 = setmetatable({}, {
    __tostring = function() -- Line: 79, Name: __tostring
        return "SorcererController";
    end,

    __index = BaseKitController
});
u17.__index = u17;

function u17.new(...) -- Line: 85
    -- upvalues: u17 (ref)
    local v18 = setmetatable({}, u17);

    return v18:constructor(...) or v18;
end;

function u17.constructor(p19) -- Line: 89
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), u4 (copy)
    BaseKitController.constructor(p19, BedwarsKit.SORCERER);
    p19.Name = "SorcererController";
    p19.spellEffectMaidMap = {};
    p19.kitMaid = u4.new();
    p19.chargeMaid = u4.new();
    p19.currentSpellLevel = 1;
    p19.progressTierBarMaid = u4.new();
    p19.spellAbilityMaid = u4.new();
end;

function u17.KnitStart(p20) -- Line: 99
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p20);
end;

function u17.onKitLocalActivated(u21, u22) -- Line: 102
    -- upvalues: u6 (copy), SorcererKit (copy), Players (copy), Flamework (copy), AbilityId (copy), AbilityMeta (copy), AbilityState (copy), WatchCollectionTag (copy), CollectionService (copy), SorcererBalance (copy), default (copy), isUsingKit (copy), BedwarsKit (copy), ClientSyncEvents (copy), u9 (copy), u12 (copy), u11 (copy), SoundManager (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local u23 = u6.mount(u6.createElement(SorcererKit), Players.LocalPlayer:WaitForChild("PlayerGui"));
    u22:GiveTask(function() -- Line: 105
        -- upvalues: u6 (ref), u23 (copy)
        u6.unmount(u23);
    end);
    local v24 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
    local SORCERER_EXPLOSION_TIER_1 = AbilityId.SORCERER_EXPLOSION_TIER_1;
    local v25 = {};

    for i, v in AbilityMeta[AbilityId.SORCERER_EXPLOSION_TIER_1].triggerConfig do
        v25[i] = v;
    end;

    function v25.getExtraData() -- Line: 114
    end;

    v24:enableAbility(SORCERER_EXPLOSION_TIER_1, v25):andThen(function(p26) -- Line: 116
        -- upvalues: u21 (copy), u22 (copy)
        u21.abilityRef = p26;
        u21.spellAbilityMaid:GiveTask(p26);
        u22:GiveTask(u21.abilityRef);
    end);
    u21.enabledAbility = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.SORCERER_EXPLOSION_TIER_1);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u21.enabledAbility, AbilityState.DISABLED);
    u22:GiveTask(WatchCollectionTag("alchemy_crystal", function(p27) -- Line: 124
        -- upvalues: u21 (copy)
        u21:recolorCrystal(p27);
    end));

    local function _(p28) -- Line: 128
        -- upvalues: u21 (copy)
        u21:recolorCrystal(p28);
    end;

    for i, v in CollectionService:GetTagged("alchemy_crystal") do
        local _ = i - 1;
        u21:recolorCrystal(v);
    end;

    u22:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("SpellCharges"):Connect(function() -- Line: 134
        -- upvalues: u21 (copy), Flamework (ref), AbilityId (ref)
        u21:syncAbilityEnabled();
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.SORCERER_PROJECTILE_CANCEL);
    end));
    u22:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("CrystalsCollected"):Connect(function() -- Line: 138
        -- upvalues: Players (ref), SorcererBalance (ref), u21 (copy)
        local v29 = Players.LocalPlayer:GetAttribute("CrystalsCollected");

        if v29 == 0 or (v29 ~= v29 or not v29) then
            return nil;
        end;

        local v30 = SorcererBalance.getSorcererTier(Players.LocalPlayer);
        local v31 = SorcererBalance.getSorcererTierData(v30);

        if u21.currentSpellLevel ~= v30 then
            u21.currentSpellLevel = v30;
            u21.progressTierBarMaid:DoCleaning();
            local enabledAbility = u21.enabledAbility;

            if enabledAbility ~= nil then
                enabledAbility = enabledAbility.abilityId;
            end;

            if enabledAbility ~= v31.abilityId then
                u21:syncExplosiveAbility();
            end;
        end;
    end));
    u22:GiveTask(default.Client:Get("EntityDeathEvent"):Connect(function(p32) -- Line: 158
        -- upvalues: Players (ref), isUsingKit (ref), BedwarsKit (ref), u21 (copy)
        local v33 = Players:GetPlayerFromCharacter(p32.entityInstance);

        if not v33 then
            return nil;
        end;

        if not isUsingKit(v33, BedwarsKit.SORCERER) then
            return nil;
        end;

        u21:endSpellCastEffects(v33);

        if v33 == Players.LocalPlayer then
            u21.chargeMaid:DoCleaning();
        end;
    end));
    u22:GiveTask(ClientSyncEvents.ExplosionEffect:connect(function(p34) -- Line: 171
        -- upvalues: u9 (ref), u12 (ref), u11 (ref), SoundManager (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        if table.find(u9, p34.explosionType) == nil then
            return nil;
        end;

        local v35 = p34.extraData == "sorcererIceExplosion";
        local v36;

        if v35 then
            v36 = u12.HIT;
        else
            v36 = u11.HIT;
        end;

        SoundManager:playSound(v36, {
            rollOffMaxDistance = 250,
            position = p34.position
        });
        local v37;

        if v35 then
            v37 = ReplicatedStorage.Assets.Effects.IceSorcererExplosion:Clone();
        else
            v37 = ReplicatedStorage.Assets.Effects.SorcererExplosion:Clone();
        end;

        v37.Parent = Workspace;
        v37.CFrame = CFrame.new(p34.position);
        EffectUtil:playEffects({ v37 }, nil, {
            destroyAfterSec = 3
        });
    end));
    u22:GiveTask(default.Client:Get("PlaySorcererSpellEffects"):Connect(function(p38) -- Line: 189
        -- upvalues: u21 (copy)
        u21:playSpellCastEffects(p38.sorcerer);
    end));
    u22:GiveTask(default.Client:Get("EndSorcererSpellEffects"):Connect(function(p39) -- Line: 192
        -- upvalues: u21 (copy), SoundManager (ref), Players (ref), Workspace (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        u21:endSpellCastEffects(p39.sorcerer);

        if not p39.projectileFired then
            return nil;
        end;

        local Character = p39.sorcerer.Character;

        if Character ~= nil then
            Character = Character:GetPivot().Position;
        end;

        if Character then
            SoundManager:playSound(u21:getSounds(p39.sorcerer).SHOT, {
                position = Character
            });
        end;

        if p39.sorcerer ~= Players.LocalPlayer then
            return nil;
        end;

        u21.chargeMaid:DoCleaning();
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame.LookVector;
        end;

        local Character2 = Players.LocalPlayer.Character;

        if Character2 ~= nil then
            Character2 = Character2:GetPivot();
        end;

        if CurrentCamera and Character2 then
            local v40 = CFrame.new(Character2.Position, Character2.Position + CurrentCamera * 10);
            local Character3 = Players.LocalPlayer.Character;

            if Character3 ~= nil then
                Character3:PivotTo(v40);
            end;
        end;

        AnimationUtil:playAnimation(p39.sorcerer.Character.Humanoid.Animator, GameAnimationUtil:getAssetId(AnimationType.COMET_VOLLEY_COMET_FIRED), {
            looped = false
        });
        local targetingAnimationTrack = u21.targetingAnimationTrack;

        if targetingAnimationTrack ~= nil then
            targetingAnimationTrack:Stop();
        end;
    end));
end;

function u17.onKitLocalDeactivated(p41) -- Line: 242
end;

function u17.onKitReplicationActivated(p42, p43) -- Line: 244
end;

function u17.onKitReplicationDeactivated(p44) -- Line: 246
end;

function u17.onInnateAbilityEnabled(p45, p46, p47) -- Line: 248
end;

function u17.onAbilityUsed(u48, p49, p50) -- Line: 250
    -- upvalues: Players (copy), isUsingKit (copy), BedwarsKit (copy), u16 (copy), Flamework (copy), AbilityId (copy), AbilityMeta (copy), AbilityState (copy), Workspace (copy), SorcererBalance (copy), SorcererTier (copy), ClientSyncEvents (copy), RunService (copy), u6 (copy), SpellChargeComponent (copy), default (copy), KnitClient (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local v51 = Players:GetPlayerFromCharacter(p50.userCharacter);

    if not v51 then
        return nil;
    end;

    if not isUsingKit(v51, BedwarsKit.SORCERER) then
        return nil;
    end;

    if u16[p50.ability] == nil then
        if p50.ability == AbilityId.SORCERER_PROJECTILE_FIRE or p50.ability == AbilityId.SORCERER_PROJECTILE_CANCEL then
            u48:endSpellCastEffects(v51);

            if p50.userCharacter ~= Players.LocalPlayer.Character then
                return nil;
            end;

            u48.chargeMaid:DoCleaning();
            local targetingAnimationTrack = u48.targetingAnimationTrack;

            if targetingAnimationTrack ~= nil then
                targetingAnimationTrack:Stop();
            end;
        end;

        return;
    end;

    u48:playSpellCastEffects(v51);

    if p50.userCharacter ~= Players.LocalPlayer.Character then
        return nil;
    end;

    u48:createAimLine();

    if u48.abilityRef ~= nil then
        u48.abilityRef.Destroy();
    end;

    local v52 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
    local SORCERER_PROJECTILE_FIRE = AbilityId.SORCERER_PROJECTILE_FIRE;
    local v53 = {};

    for i, v in AbilityMeta[AbilityId.SORCERER_PROJECTILE_FIRE].triggerConfig do
        v53[i] = v;
    end;

    function v53.getExtraData() -- Line: 274
        -- upvalues: u48 (copy)
        return {
            direction = u48:getProjectileDirection()
        };
    end;

    v52:enableAbility(SORCERER_PROJECTILE_FIRE, v53):andThen(function(p54) -- Line: 280
        -- upvalues: u48 (copy)
        u48.abilityRef = p54;
        u48.chargeMaid:GiveTask(p54);
    end);
    local chargeMaid = u48.chargeMaid;
    local v55 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
    local SORCERER_PROJECTILE_CANCEL = AbilityId.SORCERER_PROJECTILE_CANCEL;
    local v56 = {};

    for i, v in AbilityMeta[AbilityId.SORCERER_PROJECTILE_CANCEL].triggerConfig do
        v56[i] = v;
    end;

    function v56.getExtraData() -- Line: 292
    end;

    chargeMaid:GiveTask(v55:enableAbility(SORCERER_PROJECTILE_CANCEL, v56):expect());
    local v57 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.SORCERER_PROJECTILE_FIRE);

    if v57 then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v57, AbilityState.DISABLED);
    end;

    local u58 = Workspace:GetServerTimeNow();
    local secCharge = SorcererBalance.getSorcererTierData(SorcererTier.TIER_1).secCharge;
    local castTime = ClientSyncEvents.CastTimeModifierCheck:fire(secCharge).castTime;
    local u60 = RunService.Heartbeat:Connect(function() -- Line: 301
        -- upvalues: Workspace (ref), u58 (copy), castTime (ref), Flamework (ref), AbilityId (ref), AbilityState (ref)
        local v59 = castTime < Workspace:GetServerTimeNow() - u58 and Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.SORCERER_PROJECTILE_FIRE);

        if v59 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v59, AbilityState.READY);
        end;
    end);
    u48.chargeMaid:GiveTask(function() -- Line: 310
        -- upvalues: u48 (copy), u60 (copy)
        if u48.abilityRef ~= nil then
            u48.abilityRef.Destroy();
        end;

        u60:Disconnect();
        u48:syncExplosiveAbility();
    end);
    u48.chargeMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u6.createElement(SpellChargeComponent, {
        maxTier = SorcererBalance.getSorcererTier(Players.LocalPlayer)
    })));
    default.Client:Get("SorcererSpellChargeStarted"):SendToServer();
    u48.chargeMaid:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
        moveSpeedMultiplier = SorcererBalance.SPELL_CHARGE_MOVE_SPEED_MODIFIER
    }));
    KnitClient.Controllers.SwordController:toggleSwordSwing(true);
    KnitClient.Controllers.BlockPlacementController:disableBlockPlacer();
    local u62 = ClientSyncEvents.BeginProjectileTargeting:connect(function(p61) -- Line: 326
        p61:setCancelled(true);

        return nil;
    end);
    u48.chargeMaid:GiveTask(function() -- Line: 330
        -- upvalues: KnitClient (ref), u62 (copy)
        KnitClient.Controllers.SwordController:toggleSwordSwing(false);
        KnitClient.Controllers.BlockPlacementController:enableBlockPlacer();
        u62:Destroy();
    end);
    u48.targetingAnimationTrack = AnimationUtil:playAnimation(v51.Character.Humanoid.Animator, GameAnimationUtil:getAssetId(AnimationType.SORCERER_SPELL_CHARGE), {
        looped = true
    });
    u48.targetingAnimationTrack.Priority = Enum.AnimationPriority.Action4;
end;

function u17.playSpellCastEffects(p63, p64) -- Line: 353
    -- upvalues: KnitClient2 (copy), BedwarsKitSkin (copy), ReplicatedStorage (copy), Workspace (copy), u5 (copy), u4 (copy), SoundManager (copy), Players (copy), CollectionService (copy), SorcererBalance (copy), ClientSyncEvents (copy), SorcererTier (copy), KnitClient (copy), RunService (copy)
    local Character = p64.Character;

    if not Character then
        return nil;
    end;

    local Character2 = p64.Character;

    if Character2 ~= nil then
        Character2 = Character2:GetPivot().LookVector.Unit;
    end;

    if not Character2 then
        return nil;
    end;

    local Character3 = p64.Character;

    if Character3 ~= nil then
        Character3 = Character3:GetPivot().Position;
    end;

    if not Character3 then
        return nil;
    end;

    local v65 = CFrame.new(Character3 + Character2 * 3, Character3 + Character2);
    local v66;

    if KnitClient2.Controllers.KitController:getKitSkin(Character) == BedwarsKitSkin.SORCERER_ICE_QUEEN then
        v66 = ReplicatedStorage.Assets.Effects.IceSorcererSpellCast:Clone();
    else
        v66 = ReplicatedStorage.Assets.Effects.SorcererSpellCast:Clone();
    end;

    v66.Parent = Workspace;
    v66.CFrame = v65;
    u5("WeldConstraint", {
        Part0 = Character.PrimaryPart,
        Part1 = v66,
        Parent = v66
    });
    local v67 = p63.spellEffectMaidMap[p64] or u4.new();
    v67:GiveTask(v66);
    p63.spellEffectMaidMap[p64] = v67;
    local CHARGE_LOOP = p63:getSounds(p64).CHARGE_LOOP;
    local v68 = {};
    local Character4 = p64.Character;

    if Character4 ~= nil then
        Character4 = Character4.PrimaryPart;
    end;

    v68.parent = Character4;
    v68.position = Character3;
    v68.looped = true;
    v67:GiveTask(SoundManager:playSound(CHARGE_LOOP, v68));
    local Specs = v66.ChargeUpParticles.Specs;
    local EnergyPull1 = v66.ChargeUpParticles.EnergyPull1;
    local EnergyPull2 = v66.ChargeUpParticles.EnergyPull2;
    local MagicCircle = v66.MagicCircle1.MagicCircle;
    local MagicCircle2 = v66.MagicCircle2.MagicCircle;
    local MagicCircle3 = v66.MagicCircle3.MagicCircle;

    if p64 == Players.LocalPlayer then
        CollectionService:AddTag(Specs, "FirstPersonHidden");
        CollectionService:AddTag(EnergyPull1, "FirstPersonHidden");
        CollectionService:AddTag(EnergyPull2, "FirstPersonHidden");
        CollectionService:AddTag(MagicCircle, "FirstPersonHidden");
        CollectionService:AddTag(MagicCircle2, "FirstPersonHidden");
        CollectionService:AddTag(MagicCircle3, "FirstPersonHidden");
    end;

    local UPGRADE_1 = p63:getSounds(p64).UPGRADE_1;
    local v69 = {};
    local Character5 = p64.Character;

    if Character5 ~= nil then
        Character5 = Character5.PrimaryPart;
    end;

    v69.parent = Character5;
    v69.position = Character3;
    local u70 = SoundManager:playModifiableSound(UPGRADE_1, v69);
    u70:Pause();
    v67:GiveTask(u70);
    local u71 = Workspace:GetServerTimeNow();
    local v72 = p64:GetAttribute("CrystalsCollected");
    local _ = (v72 == 0 or (v72 ~= v72 or not v72)) and 0 or v72;
    local u73 = true;
    local u74 = false;
    local u75 = false;
    local u76 = 3.5;
    local v77 = SorcererBalance.getSorcererTier(Players.LocalPlayer);
    local v78 = SorcererBalance.getSorcererTierData(v77);
    local castTime = ClientSyncEvents.CastTimeModifierCheck:fire(v78.secCharge).castTime;

    if v77 == SorcererTier.TIER_5 then
        MagicCircle3.Lifetime = NumberRange.new(120);
        MagicCircle3.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.0004166666666666667, 0.1, 0), NumberSequenceKeypoint.new(1, 0.1, 0) });
        u75 = true;
        u74 = true;
    elseif v77 == SorcererTier.TIER_4 or v77 == SorcererTier.TIER_3 then
        MagicCircle2.Lifetime = NumberRange.new(120);
        MagicCircle2.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.0004166666666666667, 0.1, 0), NumberSequenceKeypoint.new(1, 0.1, 0) });
        u76 = 2.5;
        u74 = true;
    else
        MagicCircle.Lifetime = NumberRange.new(120);
        MagicCircle.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.0004166666666666667, 0.1, 0), NumberSequenceKeypoint.new(1, 0.1, 0) });
        u76 = 1.5;
    end;

    local u79 = KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective();
    v67:GiveTask((RunService.Heartbeat:Connect(function() -- Line: 467
        -- upvalues: Workspace (ref), u71 (copy), castTime (copy), u73 (ref), u79 (ref), KnitClient (ref), MagicCircle (copy), Specs (copy), EnergyPull1 (copy), EnergyPull2 (copy), u70 (copy), u74 (ref), MagicCircle2 (copy), u75 (ref), MagicCircle3 (copy), u76 (ref)
        local v80 = Workspace:GetServerTimeNow() - u71;

        if castTime < v80 and u73 then
            u79 = KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective();

            if u79 == 1 then
                MagicCircle:Emit(1);
            end;

            u73 = false;
            local v81 = Specs;
            v81.Rate = v81.Rate + 10;
            local v82 = EnergyPull1;
            v82.Rate = v82.Rate + 5;
            local v83 = EnergyPull2;
            v83.Rate = v83.Rate + 5;
            u70:Play();
        end;

        if castTime < v80 and u74 then
            u79 = KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective();

            if u79 == 1 then
                MagicCircle2:Emit(1);
            end;

            u74 = false;
            local v84 = Specs;
            v84.Rate = v84.Rate + 20;
            local v85 = EnergyPull1;
            v85.Rate = v85.Rate + 5;
            local v86 = EnergyPull2;
            v86.Rate = v86.Rate + 5;
        end;

        if castTime < v80 and u75 then
            u79 = KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective();

            if u79 == 1 then
                MagicCircle3:Emit(1);
            end;

            u75 = false;
            local v87 = Specs;
            v87.Rate = v87.Rate + 20;
            local v88 = EnergyPull1;
            v88.Rate = v88.Rate + 5;
            local v89 = EnergyPull2;
            v89.Rate = v89.Rate + 5;
        end;

        if u76 < v80 then
            u70:Pause();
        end;
    end)));
end;

function u17.endSpellCastEffects(p90, p91) -- Line: 508
    local v92 = p90.spellEffectMaidMap[p91];

    if v92 ~= nil then
        v92:DoCleaning();
    end;
end;

function u17.syncAbilityEnabled(p93) -- Line: 517
    -- upvalues: Players (copy), Flamework (copy), AbilityState (copy)
    local v94 = Players.LocalPlayer:GetAttribute("SpellCharges");

    if not p93.enabledAbility then
        return nil;
    end;

    if ((v94 == 0 or (v94 ~= v94 or not v94)) and 0 or v94) == 0 then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p93.enabledAbility, AbilityState.DISABLED);

        return;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p93.enabledAbility, AbilityState.READY);
end;

function u17.syncExplosiveAbility(u95) -- Line: 532
    -- upvalues: SorcererBalance (copy), Players (copy), Flamework (copy)
    local v96 = SorcererBalance.getSorcererTier(Players.LocalPlayer);
    local v97 = SorcererBalance.getSorcererTierData(v96);

    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(v97.abilityId) then
        return false;
    end;

    u95.spellAbilityMaid:DoCleaning();
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(v97.abilityId, {
        abilityType = "KitPrimary",
        abilityButton = {
            icon = v97.abilityIcon
        },

        getExtraData = function() -- Line: 545, Name: getExtraData
            -- upvalues: u95 (copy)
            return {
                direction = u95:getProjectileDirection()
            };
        end
    }):andThen(function(p98) -- Line: 551
        -- upvalues: u95 (copy)
        u95.kitMaid:GiveTask(p98);
        u95.abilityRef = p98;
        u95.spellAbilityMaid:GiveTask(p98);
    end);
    u95.enabledAbility = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(v97.abilityId);
    u95:syncAbilityEnabled();

    return true;
end;

function u17.getProjectileDirection(p99) -- Line: 561
    -- upvalues: Workspace (copy), KnitClient (copy)
    local LookVector = Workspace.CurrentCamera.CFrame.LookVector;

    if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 1 then
        LookVector = Vector3.new(LookVector.X, LookVector.Y + 0.3, LookVector.Z);
    end;

    return LookVector;
end;

function u17.createAimLine(u100) -- Line: 569
    -- upvalues: Players (copy), Workspace (copy), u5 (copy), ReplicatedStorage (copy), GameQueryUtil (copy), DeviceUtil (copy), CollectionService (copy), RunService (copy), SorcererBalance (copy), ClientSyncEvents (copy), SorcererTier (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    u100.aimLineOrigin = u5("Part", {
        Transparency = 1,
        CanCollide = false,
        Anchored = false,
        Parent = Workspace
    });
    local u101 = ReplicatedStorage.Assets.Effects.SorcererHitIndicator:Clone();
    u101.Parent = Workspace;
    u100.aimLineEnd = u101;
    u100.aimLineOrigin:PivotTo(Players.LocalPlayer.Character:GetPivot());
    local v102 = u5("WeldConstraint", {
        Part0 = u100.aimLineOrigin,
        Part1 = Players.LocalPlayer.Character.PrimaryPart,
        Parent = Players.LocalPlayer.Character
    });
    u100.chargeMaid:GiveTask(v102);
    GameQueryUtil:setQueryIgnored(u100.aimLineOrigin, true);
    GameQueryUtil:setQueryIgnored(u100.aimLineEnd, true);
    local v103 = u5("Attachment", {
        Parent = u100.aimLineOrigin
    });
    local v104 = u5("Attachment", {
        Parent = u100.aimLineEnd
    });
    local u105 = DeviceUtil.isMobileControls() and 3 or 1;
    local u106 = u5("Beam", {
        FaceCamera = true,
        Segments = 300,
        Brightness = 1,
        Attachment0 = v103,
        Attachment1 = v104,
        Color = ColorSequence.new(Color3.fromRGB(255, 115, 250)),
        Transparency = NumberSequence.new(0),
        Width0 = u105 * 0.08,
        Width1 = u105 * 0.08,
        Parent = Workspace
    });
    CollectionService:AddTag(u106, "projectile-preview-beam");
    u100.chargeMaid:GiveTask(u106);
    local u107 = 0;
    local u108 = Workspace:GetServerTimeNow();
    local v123 = RunService.Heartbeat:Connect(function() -- Line: 619
        -- upvalues: Workspace (ref), u108 (copy), SorcererBalance (ref), Players (ref), u107 (ref), ClientSyncEvents (ref), SorcererTier (ref), u100 (copy), CollectionService (ref), u106 (copy), u105 (copy), u101 (copy)
        local v109 = Workspace:GetServerTimeNow() - u108;
        local v110 = SorcererBalance.getSorcererTier(Players.LocalPlayer);
        local v111 = SorcererBalance.getSorcererTierData(v110);
        u107 = v111.projectileVelocity * v111.projectileLifetime;

        if v109 < ClientSyncEvents.CastTimeModifierCheck:fire(SorcererBalance.getSorcererTierData(SorcererTier.TIER_2).secCharge).castTime then
            local v112 = SorcererBalance.getSorcererTierData(SorcererTier.TIER_1);
            u107 = v112.projectileVelocity * v112.projectileLifetime;
        elseif v109 < ClientSyncEvents.CastTimeModifierCheck:fire(SorcererBalance.getSorcererTierData(SorcererTier.TIER_3).secCharge).castTime and u100.currentSpellLevel > 1 then
            local v113 = SorcererBalance.getSorcererTierData(SorcererTier.TIER_2);
            u107 = v113.projectileVelocity * v113.projectileLifetime;
        elseif v109 < ClientSyncEvents.CastTimeModifierCheck:fire(SorcererBalance.getSorcererTierData(SorcererTier.TIER_4).secCharge).castTime and u100.currentSpellLevel > 2 then
            local v114 = SorcererBalance.getSorcererTierData(SorcererTier.TIER_3);
            u107 = v114.projectileVelocity * v114.projectileLifetime;
        elseif v109 < ClientSyncEvents.CastTimeModifierCheck:fire(SorcererBalance.getSorcererTierData(SorcererTier.TIER_5).secCharge).castTime and u100.currentSpellLevel > 3 then
            local v115 = SorcererBalance.getSorcererTierData(SorcererTier.TIER_4);
            u107 = v115.projectileVelocity * v115.projectileLifetime;
        elseif u100.currentSpellLevel > 4 then
            local v116 = SorcererBalance.getSorcererTierData(SorcererTier.TIER_5);
            u107 = v116.projectileVelocity * v116.projectileLifetime;
        end;

        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame;
        end;

        if not CurrentCamera then
            return nil;
        end;

        local aimLineOrigin = u100.aimLineOrigin;

        if aimLineOrigin ~= nil then
            aimLineOrigin = aimLineOrigin.Position;
        end;

        if not aimLineOrigin then
            return nil;
        end;

        if not u100.aimLineEnd then
            return nil;
        end;

        local Character2 = Players.LocalPlayer.Character;

        if Character2 ~= nil then
            Character2 = Character2:GetPivot().Position;
        end;

        if not Character2 then
            return nil;
        end;

        local v117 = u100:getProjectileDirection();
        local v118 = RaycastParams.new();
        local v119 = {};
        local v120 = CollectionService:GetTagged("DontBlockAbilityRaycast");
        table.move(v120, 1, #v120, #v119 + 1, v119);
        v118.FilterDescendantsInstances = v119;
        v118.FilterType = Enum.RaycastFilterType.Exclude;
        local v121 = Workspace:Raycast(Character2 + v117 * 5, v117 * u107, v118);

        if v121 then
            local aimLineEnd = u100.aimLineEnd;

            if aimLineEnd ~= nil then
                aimLineEnd:PivotTo(CFrame.new(v121.Position));
            end;

            u106.Color = ColorSequence.new(Color3.fromRGB(255, 36, 247));
            u106.Width0 = u105 * 0.1;
            u106.Width1 = u105 * 0.1;
            u106.Transparency = NumberSequence.new(0);
            u100.aimLineEnd.Color = Color3.new(1, 0.03, 0.9);
            u100.aimLineEnd.Transparency = 0;
            u101.Attachment.ParticleEmitter.Enabled = true;

            return;
        end;

        local v122 = u100.aimLineOrigin.Position + v117 * u107;
        local aimLineEnd = u100.aimLineEnd;

        if aimLineEnd ~= nil then
            aimLineEnd:PivotTo(CFrame.new(v122));
        end;

        u106.Color = ColorSequence.new(Color3.fromRGB(255, 242, 255));
        u106.Transparency = NumberSequence.new(0.3);
        u106.Width0 = u105 * 0.08;
        u106.Width1 = u105 * 0.08;
        u100.aimLineEnd.Color = Color3.new(1, 0.95, 1);
        u100.aimLineEnd.Transparency = 0.8;
        u101.Attachment.ParticleEmitter.Enabled = false;
    end);
    u100.chargeMaid:GiveTask(v123);
end;

function u17.getSounds(p124, p125) -- Line: 713
    -- upvalues: u11 (copy), KnitClient (copy), BedwarsKitSkin (copy), u12 (copy)
    if not p125.Character then
        return u11;
    end;

    if KnitClient.Controllers.KitController:getKitSkin(p125.Character) == BedwarsKitSkin.SORCERER_ICE_QUEEN then
        return u12;
    end;

    return u11;
end;

function u17.recolorCrystal(p126, p127) -- Line: 723
    -- upvalues: Players (copy), isUsingKit (copy), BedwarsKit (copy), KnitClient2 (copy), BedwarsKitSkin (copy), u10 (copy)
    if not Players.LocalPlayer.Character then
        return nil;
    end;

    if not isUsingKit(Players.LocalPlayer, BedwarsKit.SORCERER) then
        return nil;
    end;

    if KnitClient2.Controllers.KitController:getKitSkin(Players.LocalPlayer.Character) == BedwarsKitSkin.SORCERER_ICE_QUEEN then
        local function _(p128) -- Line: 733
            -- upvalues: u10 (ref)
            if p128:IsA("MeshPart") then
                p128.Color = u10;

                return;
            end;

            if p128:IsA("PointLight") then
                p128.Color = u10;
            end;
        end;

        for i, descendant in p127:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("MeshPart") then
                descendant.Color = u10;
            elseif descendant:IsA("PointLight") then
                descendant.Color = u10;
            end;
        end;
    end;
end;

KnitClient.CreateController(u17.new());

return nil;