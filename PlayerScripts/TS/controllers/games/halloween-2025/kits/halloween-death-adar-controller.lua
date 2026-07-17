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
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local v8 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "sorcerer-balance");
local SorcererBalance = v8.SorcererBalance;
local SorcererTier = v8.SorcererTier;
local ExplosionType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local HalloweenKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kits").HalloweenKit;
local HalloweenUpgradeUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-util").HalloweenUpgradeUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local SpellChargeComponent = RuntimeLib.import(script, script.Parent.Parent.Parent, "bedwars", "kit", "kits", "sorcerer", "ui", "spell-charge-progress").SpellChargeComponent;
local SorcererKit = RuntimeLib.import(script, script.Parent.Parent.Parent, "bedwars", "kit", "kits", "sorcerer", "ui", "spell-tracker").SorcererKit;
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

local function _(p14, p15) -- Line: 64
    p14[p15.abilityId] = true;

    return p14;
end;

local u16 = {};

for i = 1, #v13 do
    local _ = i - 1;
    u16[v13[i].abilityId] = true;
end;

local u17 = setmetatable({}, {
    __tostring = function() -- Line: 82, Name: __tostring
        return "HalloweenDeathAdarController";
    end,

    __index = GameKnitController
});
u17.__index = u17;

function u17.new(...) -- Line: 88
    -- upvalues: u17 (ref)
    local v18 = setmetatable({}, u17);

    return v18:constructor(...) or v18;
end;

function u17.constructor(p19) -- Line: 92
    -- upvalues: GameKnitController (copy), GameType (copy), u4 (copy)
    GameKnitController.constructor(p19, { GameType.HALLOWEEN_2025_EVENT_PVE });
    p19.Name = "HalloweenDeathAdarController";
    p19.spellEffectMaidMap = {};
    p19.kitMaid = u4.new();
    p19.chargeMaid = u4.new();
    p19.currentSpellLevel = 1;
    p19.progressTierBarMaid = u4.new();
    p19.spellAbilityMaid = u4.new();
    p19.inited = false;
end;

function u17.KnitStart(p20) -- Line: 103
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p20);
end;

function u17.onGameInit(u21) -- Line: 106
    -- upvalues: default (copy), HalloweenKit (copy), ClientSyncEvents (copy), Players (copy), u16 (copy), Flamework (copy), AbilityId (copy), AbilityMeta (copy), AbilityState (copy), Workspace (copy), RunService (copy), SorcererBalance (copy), SorcererTier (copy), u6 (copy), SpellChargeComponent (copy), KnitClient (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    default.Client:Get("HalloweenSetKit"):Connect(function(p22) -- Line: 107
        -- upvalues: u21 (copy), HalloweenKit (ref)
        if not u21.inited then
            if p22.kit == HalloweenKit.SORCERER then
                u21:initKit();
            end;

            u21.inited = true;
        end;
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p23) -- Line: 115
        -- upvalues: Players (ref), u16 (ref), u21 (copy), Flamework (ref), AbilityId (ref), AbilityMeta (ref), AbilityState (ref), Workspace (ref), RunService (ref), SorcererBalance (ref), SorcererTier (ref), u6 (ref), SpellChargeComponent (ref), default (ref), KnitClient (ref), ClientSyncEvents (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        local v24 = Players:GetPlayerFromCharacter(p23.userCharacter);

        if not v24 then
            return nil;
        end;

        if u16[p23.ability] == nil then
            if p23.ability == AbilityId.SORCERER_PROJECTILE_FIRE or p23.ability == AbilityId.SORCERER_PROJECTILE_CANCEL then
                u21:endSpellCastEffects(v24);

                if p23.userCharacter ~= Players.LocalPlayer.Character then
                    return nil;
                end;

                u21.chargeMaid:DoCleaning();
                local targetingAnimationTrack = u21.targetingAnimationTrack;

                if targetingAnimationTrack ~= nil then
                    targetingAnimationTrack:Stop();
                end;
            end;

            return;
        end;

        u21:playSpellCastEffects(v24);

        if p23.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        u21:createAimLine();

        if u21.abilityRef ~= nil then
            u21.abilityRef.Destroy();
        end;

        local v25 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
        local SORCERER_PROJECTILE_FIRE = AbilityId.SORCERER_PROJECTILE_FIRE;
        local v26 = {};

        for i, v in AbilityMeta[AbilityId.SORCERER_PROJECTILE_FIRE].triggerConfig do
            v26[i] = v;
        end;

        function v26.getExtraData() -- Line: 137
            -- upvalues: u21 (ref)
            return {
                direction = u21:getProjectileDirection()
            };
        end;

        v25:enableAbility(SORCERER_PROJECTILE_FIRE, v26):andThen(function(p27) -- Line: 143
            -- upvalues: u21 (ref)
            u21.abilityRef = p27;
            u21.chargeMaid:GiveTask(p27);
        end);
        local chargeMaid = u21.chargeMaid;
        local v28 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
        local SORCERER_PROJECTILE_CANCEL = AbilityId.SORCERER_PROJECTILE_CANCEL;
        local v29 = {};

        for i, v in AbilityMeta[AbilityId.SORCERER_PROJECTILE_CANCEL].triggerConfig do
            v29[i] = v;
        end;

        function v29.getExtraData() -- Line: 155
        end;

        chargeMaid:GiveTask(v28:enableAbility(SORCERER_PROJECTILE_CANCEL, v29):expect());
        local v30 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.SORCERER_PROJECTILE_FIRE);

        if v30 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v30, AbilityState.DISABLED);
        end;

        local u31 = Workspace:GetServerTimeNow();
        local u33 = RunService.Heartbeat:Connect(function() -- Line: 162
            -- upvalues: Workspace (ref), u31 (copy), SorcererBalance (ref), SorcererTier (ref), Flamework (ref), AbilityId (ref), AbilityState (ref)
            local v32 = Workspace:GetServerTimeNow() - u31 > SorcererBalance.getSorcererTierData(SorcererTier.TIER_1).secCharge and Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.SORCERER_PROJECTILE_FIRE);

            if v32 then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v32, AbilityState.READY);
            end;
        end);
        u21.chargeMaid:GiveTask(function() -- Line: 171
            -- upvalues: u21 (ref), u33 (copy)
            if u21.abilityRef ~= nil then
                u21.abilityRef.Destroy();
            end;

            u33:Disconnect();
            u21:syncExplosiveAbility();
        end);
        u21.chargeMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u6.createElement(SpellChargeComponent, {
            maxTier = SorcererBalance.getSorcererTier(Players.LocalPlayer)
        })));
        default.Client:Get("SorcererSpellChargeStarted"):SendToServer();
        u21.chargeMaid:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
            moveSpeedMultiplier = SorcererBalance.SPELL_CHARGE_MOVE_SPEED_MODIFIER
        }));
        KnitClient.Controllers.SwordController:toggleSwordSwing(true);
        KnitClient.Controllers.BlockPlacementController:disableBlockPlacer();
        local u35 = ClientSyncEvents.BeginProjectileTargeting:connect(function(p34) -- Line: 187
            p34:setCancelled(true);

            return nil;
        end);
        u21.chargeMaid:GiveTask(function() -- Line: 191
            -- upvalues: KnitClient (ref), u35 (copy)
            KnitClient.Controllers.SwordController:toggleSwordSwing(false);
            KnitClient.Controllers.BlockPlacementController:enableBlockPlacer();
            u35:Destroy();
        end);
        u21.targetingAnimationTrack = AnimationUtil:playAnimation(v24.Character.Humanoid.Animator, GameAnimationUtil:getAssetId(AnimationType.SORCERER_SPELL_CHARGE), {
            looped = true
        });
        u21.targetingAnimationTrack.Priority = Enum.AnimationPriority.Action4;
    end);
end;

function u17.initKit(u36) -- Line: 215
    -- upvalues: u4 (copy), u6 (copy), SorcererKit (copy), Players (copy), KnitClient (copy), WatchCollectionTag (copy), CollectionService (copy), default (copy), HalloweenUpgradeUtil (copy), HalloweenKit (copy), ClientSyncEvents (copy), u9 (copy), u12 (copy), u11 (copy), SoundManager (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local v37 = u4.new();
    local u38 = u6.mount(u6.createElement(SorcererKit), Players.LocalPlayer:WaitForChild("PlayerGui"));
    v37:GiveTask(function() -- Line: 218
        -- upvalues: u6 (ref), u38 (copy)
        u6.unmount(u38);
    end);
    KnitClient.Controllers.HalloweenAbilityDeathAdderTreeController:enableHalloweenAbility();
    v37:GiveTask(WatchCollectionTag("alchemy_crystal", function(p39) -- Line: 224
        -- upvalues: u36 (copy)
        u36:recolorCrystal(p39);
    end));

    local function _(p40) -- Line: 228
        -- upvalues: u36 (copy)
        u36:recolorCrystal(p40);
    end;

    for i, v in CollectionService:GetTagged("alchemy_crystal") do
        local _ = i - 1;
        u36:recolorCrystal(v);
    end;

    v37:GiveTask(default.Client:Get("EntityDeathEvent"):Connect(function(p41) -- Line: 260
        -- upvalues: Players (ref), HalloweenUpgradeUtil (ref), HalloweenKit (ref), u36 (copy)
        local v42 = Players:GetPlayerFromCharacter(p41.entityInstance);

        if not v42 then
            return nil;
        end;

        if not HalloweenUpgradeUtil:isHalloweenKit(v42, HalloweenKit.SORCERER) then
            return nil;
        end;

        u36:endSpellCastEffects(v42);

        if v42 == Players.LocalPlayer then
            u36.chargeMaid:DoCleaning();
        end;
    end));
    v37:GiveTask(ClientSyncEvents.ExplosionEffect:connect(function(p43) -- Line: 273
        -- upvalues: u9 (ref), u12 (ref), u11 (ref), SoundManager (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        if table.find(u9, p43.explosionType) == nil then
            return nil;
        end;

        local v44 = p43.extraData == "sorcererIceExplosion";
        local v45;

        if v44 then
            v45 = u12.HIT;
        else
            v45 = u11.HIT;
        end;

        SoundManager:playSound(v45, {
            rollOffMaxDistance = 250,
            position = p43.position
        });
        local v46;

        if v44 then
            v46 = ReplicatedStorage.Assets.Effects.IceSorcererExplosion:Clone();
        else
            v46 = ReplicatedStorage.Assets.Effects.SorcererExplosion:Clone();
        end;

        v46.Parent = Workspace;
        v46.CFrame = CFrame.new(p43.position);
        EffectUtil:playEffects({ v46 }, nil, {
            destroyAfterSec = 3
        });
    end));
    v37:GiveTask(default.Client:Get("PlaySorcererSpellEffects"):Connect(function(p47) -- Line: 291
        -- upvalues: u36 (copy)
        u36:playSpellCastEffects(p47.sorcerer);
    end));
    v37:GiveTask(default.Client:Get("EndSorcererSpellEffects"):Connect(function(p48) -- Line: 294
        -- upvalues: u36 (copy), SoundManager (ref), Players (ref), Workspace (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        u36:endSpellCastEffects(p48.sorcerer);

        if not p48.projectileFired then
            return nil;
        end;

        local Character = p48.sorcerer.Character;

        if Character ~= nil then
            Character = Character:GetPivot().Position;
        end;

        if Character then
            SoundManager:playSound(u36:getSounds(p48.sorcerer).SHOT, {
                position = Character
            });
        end;

        if p48.sorcerer ~= Players.LocalPlayer then
            return nil;
        end;

        u36.chargeMaid:DoCleaning();
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame.LookVector;
        end;

        local Character2 = Players.LocalPlayer.Character;

        if Character2 ~= nil then
            Character2 = Character2:GetPivot();
        end;

        if CurrentCamera and Character2 then
            local v49 = CFrame.new(Character2.Position, Character2.Position + CurrentCamera * 10);
            local Character3 = Players.LocalPlayer.Character;

            if Character3 ~= nil then
                Character3:PivotTo(v49);
            end;
        end;

        AnimationUtil:playAnimation(p48.sorcerer.Character.Humanoid.Animator, GameAnimationUtil:getAssetId(AnimationType.COMET_VOLLEY_COMET_FIRED), {
            looped = false
        });
        local targetingAnimationTrack = u36.targetingAnimationTrack;

        if targetingAnimationTrack ~= nil then
            targetingAnimationTrack:Stop();
        end;
    end));
end;

function u17.playSpellCastEffects(p50, p51) -- Line: 344
    -- upvalues: KnitClient2 (copy), BedwarsKitSkin (copy), ReplicatedStorage (copy), Workspace (copy), u5 (copy), u4 (copy), SoundManager (copy), Players (copy), CollectionService (copy), SorcererBalance (copy), SorcererTier (copy), KnitClient (copy), RunService (copy)
    local Character = p51.Character;

    if not Character then
        return nil;
    end;

    local Character2 = p51.Character;

    if Character2 ~= nil then
        Character2 = Character2:GetPivot().LookVector.Unit;
    end;

    if not Character2 then
        return nil;
    end;

    local Character3 = p51.Character;

    if Character3 ~= nil then
        Character3 = Character3:GetPivot().Position;
    end;

    if not Character3 then
        return nil;
    end;

    local v52 = CFrame.new(Character3 + Character2 * 3, Character3 + Character2);
    local v53;

    if KnitClient2.Controllers.KitController:getKitSkin(Character) == BedwarsKitSkin.SORCERER_ICE_QUEEN then
        v53 = ReplicatedStorage.Assets.Effects.IceSorcererSpellCast:Clone();
    else
        v53 = ReplicatedStorage.Assets.Effects.SorcererSpellCast:Clone();
    end;

    v53.Parent = Workspace;
    v53.CFrame = v52;
    u5("WeldConstraint", {
        Part0 = Character.PrimaryPart,
        Part1 = v53,
        Parent = v53
    });
    local v54 = p50.spellEffectMaidMap[p51] or u4.new();
    v54:GiveTask(v53);
    p50.spellEffectMaidMap[p51] = v54;
    local CHARGE_LOOP = p50:getSounds(p51).CHARGE_LOOP;
    local v55 = {};
    local Character4 = p51.Character;

    if Character4 ~= nil then
        Character4 = Character4.PrimaryPart;
    end;

    v55.parent = Character4;
    v55.position = Character3;
    v55.looped = true;
    v54:GiveTask(SoundManager:playSound(CHARGE_LOOP, v55));
    local Specs = v53.ChargeUpParticles.Specs;
    local EnergyPull1 = v53.ChargeUpParticles.EnergyPull1;
    local EnergyPull2 = v53.ChargeUpParticles.EnergyPull2;
    local MagicCircle = v53.MagicCircle1.MagicCircle;
    local MagicCircle2 = v53.MagicCircle2.MagicCircle;
    local MagicCircle3 = v53.MagicCircle3.MagicCircle;

    if p51 == Players.LocalPlayer then
        CollectionService:AddTag(Specs, "FirstPersonHidden");
        CollectionService:AddTag(EnergyPull1, "FirstPersonHidden");
        CollectionService:AddTag(EnergyPull2, "FirstPersonHidden");
        CollectionService:AddTag(MagicCircle, "FirstPersonHidden");
        CollectionService:AddTag(MagicCircle2, "FirstPersonHidden");
        CollectionService:AddTag(MagicCircle3, "FirstPersonHidden");
    end;

    local UPGRADE_1 = p50:getSounds(p51).UPGRADE_1;
    local v56 = {};
    local Character5 = p51.Character;

    if Character5 ~= nil then
        Character5 = Character5.PrimaryPart;
    end;

    v56.parent = Character5;
    v56.position = Character3;
    local u57 = SoundManager:playModifiableSound(UPGRADE_1, v56);
    u57:Pause();
    v54:GiveTask(u57);
    local u58 = Workspace:GetServerTimeNow();
    local v59 = p51:GetAttribute("CrystalsCollected");
    local _ = (v59 == 0 or (v59 ~= v59 or not v59)) and 0 or v59;
    local u60 = true;
    local u61 = false;
    local u62 = false;
    local u63 = 3.5;
    local v64 = SorcererBalance.getSorcererTier(Players.LocalPlayer);
    local u65 = SorcererBalance.getSorcererTierData(v64);

    if v64 == SorcererTier.TIER_5 then
        MagicCircle3.Lifetime = NumberRange.new(120);
        MagicCircle3.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.0004166666666666667, 0.1, 0), NumberSequenceKeypoint.new(1, 0.1, 0) });
        u61 = true;
        u62 = true;
    elseif v64 == SorcererTier.TIER_4 or v64 == SorcererTier.TIER_3 then
        MagicCircle2.Lifetime = NumberRange.new(120);
        MagicCircle2.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.0004166666666666667, 0.1, 0), NumberSequenceKeypoint.new(1, 0.1, 0) });
        u61 = true;
        u63 = 2.5;
    else
        MagicCircle.Lifetime = NumberRange.new(120);
        MagicCircle.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.0004166666666666667, 0.1, 0), NumberSequenceKeypoint.new(1, 0.1, 0) });
        u63 = 1.5;
    end;

    local u66 = KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective();
    v54:GiveTask((RunService.Heartbeat:Connect(function() -- Line: 457
        -- upvalues: Workspace (ref), u58 (copy), u65 (copy), u60 (ref), u66 (ref), KnitClient (ref), MagicCircle (copy), Specs (copy), EnergyPull1 (copy), EnergyPull2 (copy), u57 (copy), u61 (ref), MagicCircle2 (copy), u62 (ref), MagicCircle3 (copy), u63 (ref)
        local v67 = Workspace:GetServerTimeNow() - u58;

        if u65.secCharge < v67 and u60 then
            u66 = KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective();

            if u66 == 1 then
                MagicCircle:Emit(1);
            end;

            u60 = false;
            local v68 = Specs;
            v68.Rate = v68.Rate + 10;
            local v69 = EnergyPull1;
            v69.Rate = v69.Rate + 5;
            local v70 = EnergyPull2;
            v70.Rate = v70.Rate + 5;
            u57:Play();
        end;

        if u65.secCharge < v67 and u61 then
            u66 = KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective();

            if u66 == 1 then
                MagicCircle2:Emit(1);
            end;

            u61 = false;
            local v71 = Specs;
            v71.Rate = v71.Rate + 20;
            local v72 = EnergyPull1;
            v72.Rate = v72.Rate + 5;
            local v73 = EnergyPull2;
            v73.Rate = v73.Rate + 5;
        end;

        if u65.secCharge < v67 and u62 then
            u66 = KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective();

            if u66 == 1 then
                MagicCircle3:Emit(1);
            end;

            u62 = false;
            local v74 = Specs;
            v74.Rate = v74.Rate + 20;
            local v75 = EnergyPull1;
            v75.Rate = v75.Rate + 5;
            local v76 = EnergyPull2;
            v76.Rate = v76.Rate + 5;
        end;

        if u63 < v67 then
            u57:Pause();
        end;
    end)));
end;

function u17.endSpellCastEffects(p77, p78) -- Line: 498
    local v79 = p77.spellEffectMaidMap[p78];

    if v79 ~= nil then
        v79:DoCleaning();
    end;
end;

function u17.syncExplosiveAbility(u80) -- Line: 507
    -- upvalues: SorcererBalance (copy), Players (copy), Flamework (copy)
    local v81 = SorcererBalance.getSorcererTier(Players.LocalPlayer);
    local v82 = SorcererBalance.getSorcererTierData(v81);

    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(v82.abilityId) then
        return false;
    end;

    u80.spellAbilityMaid:DoCleaning();
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(v82.abilityId, {
        abilityType = "KitPrimary",
        abilityButton = {
            icon = v82.abilityIcon
        },

        getExtraData = function() -- Line: 520, Name: getExtraData
            -- upvalues: u80 (copy)
            return {
                direction = u80:getProjectileDirection()
            };
        end
    }):andThen(function(p83) -- Line: 526
        -- upvalues: u80 (copy)
        u80.kitMaid:GiveTask(p83);
        u80.abilityRef = p83;
        u80.spellAbilityMaid:GiveTask(p83);
    end);

    return true;
end;

function u17.getProjectileDirection(p84) -- Line: 536
    -- upvalues: Workspace (copy), KnitClient (copy)
    local LookVector = Workspace.CurrentCamera.CFrame.LookVector;

    if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 1 then
        LookVector = Vector3.new(LookVector.X, LookVector.Y + 0.3, LookVector.Z);
    end;

    return LookVector;
end;

function u17.createAimLine(u85) -- Line: 544
    -- upvalues: Players (copy), Workspace (copy), u5 (copy), ReplicatedStorage (copy), GameQueryUtil (copy), DeviceUtil (copy), CollectionService (copy), RunService (copy), SorcererBalance (copy), SorcererTier (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    u85.aimLineOrigin = u5("Part", {
        Transparency = 1,
        CanCollide = false,
        Anchored = false,
        Parent = Workspace
    });
    local u86 = ReplicatedStorage.Assets.Effects.SorcererHitIndicator:Clone();
    u86.Parent = Workspace;
    u85.aimLineEnd = u86;
    u85.aimLineOrigin:PivotTo(Players.LocalPlayer.Character:GetPivot());
    local v87 = u5("WeldConstraint", {
        Part0 = u85.aimLineOrigin,
        Part1 = Players.LocalPlayer.Character.PrimaryPart,
        Parent = Players.LocalPlayer.Character
    });
    u85.chargeMaid:GiveTask(v87);
    GameQueryUtil:setQueryIgnored(u85.aimLineOrigin, true);
    GameQueryUtil:setQueryIgnored(u85.aimLineEnd, true);
    local v88 = u5("Attachment", {
        Parent = u85.aimLineOrigin
    });
    local v89 = u5("Attachment", {
        Parent = u85.aimLineEnd
    });
    local u90 = DeviceUtil.isMobileControls() and 3 or 1;
    local u91 = u5("Beam", {
        FaceCamera = true,
        Segments = 300,
        Brightness = 1,
        Attachment0 = v88,
        Attachment1 = v89,
        Color = ColorSequence.new(Color3.fromRGB(255, 115, 250)),
        Transparency = NumberSequence.new(0),
        Width0 = u90 * 0.08,
        Width1 = u90 * 0.08,
        Parent = Workspace
    });
    CollectionService:AddTag(u91, "projectile-preview-beam");
    u85.chargeMaid:GiveTask(u91);
    local u92 = 0;
    local u93 = Workspace:GetServerTimeNow();
    local v108 = RunService.Heartbeat:Connect(function() -- Line: 594
        -- upvalues: Workspace (ref), u93 (copy), SorcererBalance (ref), Players (ref), u92 (ref), SorcererTier (ref), u85 (copy), CollectionService (ref), u91 (copy), u90 (copy), u86 (copy)
        local v94 = Workspace:GetServerTimeNow() - u93;
        local v95 = SorcererBalance.getSorcererTier(Players.LocalPlayer);
        local v96 = SorcererBalance.getSorcererTierData(v95);
        u92 = v96.projectileVelocity * v96.projectileLifetime;

        if v94 < SorcererBalance.getSorcererTierData(SorcererTier.TIER_2).secCharge then
            local v97 = SorcererBalance.getSorcererTierData(SorcererTier.TIER_1);
            u92 = v97.projectileVelocity * v97.projectileLifetime;
        elseif v94 < SorcererBalance.getSorcererTierData(SorcererTier.TIER_3).secCharge and u85.currentSpellLevel > 1 then
            local v98 = SorcererBalance.getSorcererTierData(SorcererTier.TIER_2);
            u92 = v98.projectileVelocity * v98.projectileLifetime;
        elseif v94 < SorcererBalance.getSorcererTierData(SorcererTier.TIER_4).secCharge and u85.currentSpellLevel > 2 then
            local v99 = SorcererBalance.getSorcererTierData(SorcererTier.TIER_3);
            u92 = v99.projectileVelocity * v99.projectileLifetime;
        elseif v94 < SorcererBalance.getSorcererTierData(SorcererTier.TIER_5).secCharge and u85.currentSpellLevel > 3 then
            local v100 = SorcererBalance.getSorcererTierData(SorcererTier.TIER_4);
            u92 = v100.projectileVelocity * v100.projectileLifetime;
        elseif u85.currentSpellLevel > 4 then
            local v101 = SorcererBalance.getSorcererTierData(SorcererTier.TIER_5);
            u92 = v101.projectileVelocity * v101.projectileLifetime;
        end;

        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame;
        end;

        if not CurrentCamera then
            return nil;
        end;

        local aimLineOrigin = u85.aimLineOrigin;

        if aimLineOrigin ~= nil then
            aimLineOrigin = aimLineOrigin.Position;
        end;

        if not aimLineOrigin then
            return nil;
        end;

        if not u85.aimLineEnd then
            return nil;
        end;

        local Character2 = Players.LocalPlayer.Character;

        if Character2 ~= nil then
            Character2 = Character2:GetPivot().Position;
        end;

        if not Character2 then
            return nil;
        end;

        local v102 = u85:getProjectileDirection();
        local v103 = RaycastParams.new();
        local v104 = {};
        local v105 = CollectionService:GetTagged("DontBlockAbilityRaycast");
        table.move(v105, 1, #v105, #v104 + 1, v104);
        v103.FilterDescendantsInstances = v104;
        v103.FilterType = Enum.RaycastFilterType.Exclude;
        local v106 = Workspace:Raycast(Character2 + v102 * 5, v102 * u92, v103);

        if v106 then
            local aimLineEnd = u85.aimLineEnd;

            if aimLineEnd ~= nil then
                aimLineEnd:PivotTo(CFrame.new(v106.Position));
            end;

            u91.Color = ColorSequence.new(Color3.fromRGB(255, 36, 247));
            u91.Width0 = u90 * 0.1;
            u91.Width1 = u90 * 0.1;
            u91.Transparency = NumberSequence.new(0);
            u85.aimLineEnd.Color = Color3.new(1, 0.03, 0.9);
            u85.aimLineEnd.Transparency = 0;
            u86.Attachment.ParticleEmitter.Enabled = true;

            return;
        end;

        local v107 = u85.aimLineOrigin.Position + v102 * u92;
        local aimLineEnd = u85.aimLineEnd;

        if aimLineEnd ~= nil then
            aimLineEnd:PivotTo(CFrame.new(v107));
        end;

        u91.Color = ColorSequence.new(Color3.fromRGB(255, 242, 255));
        u91.Transparency = NumberSequence.new(0.3);
        u91.Width0 = u90 * 0.08;
        u91.Width1 = u90 * 0.08;
        u85.aimLineEnd.Color = Color3.new(1, 0.95, 1);
        u85.aimLineEnd.Transparency = 0.8;
        u86.Attachment.ParticleEmitter.Enabled = false;
    end);
    u85.chargeMaid:GiveTask(v108);
end;

function u17.getSounds(p109, p110) -- Line: 688
    -- upvalues: u11 (copy), KnitClient (copy), BedwarsKitSkin (copy), u12 (copy)
    if not p110.Character then
        return u11;
    end;

    if KnitClient.Controllers.KitController:getKitSkin(p110.Character) == BedwarsKitSkin.SORCERER_ICE_QUEEN then
        return u12;
    end;

    return u11;
end;

function u17.recolorCrystal(p111, p112) -- Line: 698
    -- upvalues: Players (copy), isUsingKit (copy), BedwarsKit (copy), KnitClient2 (copy), BedwarsKitSkin (copy), u10 (copy)
    if not Players.LocalPlayer.Character then
        return nil;
    end;

    if not isUsingKit(Players.LocalPlayer, BedwarsKit.SORCERER) then
        return nil;
    end;

    if KnitClient2.Controllers.KitController:getKitSkin(Players.LocalPlayer.Character) == BedwarsKitSkin.SORCERER_ICE_QUEEN then
        local function _(p113) -- Line: 708
            -- upvalues: u10 (ref)
            if p113:IsA("MeshPart") then
                p113.Color = u10;

                return;
            end;

            if p113:IsA("PointLight") then
                p113.Color = u10;
            end;
        end;

        for i, descendant in p112:GetDescendants() do
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