-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "sorcerer-balance");
local SorcererBalance = v6.SorcererBalance;
local SorcererTier = v6.SorcererTier;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ExplosionType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local HalloweenKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kits").HalloweenKit;
local HalloweenUpgradeUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-util").HalloweenUpgradeUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local SpellChargeComponent = RuntimeLib.import(script, script.Parent.Parent.Parent, "bedwars", "kit", "kits", "sorcerer", "ui", "spell-charge-progress").SpellChargeComponent;
local u7 = { ExplosionType.SORCERER_EXPLOSION_1, ExplosionType.SORCERER_EXPLOSION_2, ExplosionType.SORCERER_EXPLOSION_3 };
local u8 = { ExplosionType.SORCERER_EXPLOSION_1_HUGE, ExplosionType.SORCERER_EXPLOSION_2_HUGE, ExplosionType.SORCERER_EXPLOSION_3_HUGE };
local u9 = {
    ExplosionType.SORCERER_EXPLOSION_FRAG_1,
    ExplosionType.SORCERER_EXPLOSION_FRAG_2,
    ExplosionType.SORCERER_EXPLOSION_FRAG_3,
    ExplosionType.SORCERER_EXPLOSION_FRAG_1_HUGE,
    ExplosionType.SORCERER_EXPLOSION_FRAG_2_HUGE,
    ExplosionType.SORCERER_EXPLOSION_FRAG_3_HUGE
};
local u10 = setmetatable({}, {
    __tostring = function() -- Line: 45, Name: __tostring
        return "HalloweenAbilityDeathAdderTreeController";
    end,

    __index = GameKnitController
});
u10.__index = u10;

function u10.new(...) -- Line: 51
    -- upvalues: u10 (ref)
    local v11 = setmetatable({}, u10);

    return v11:constructor(...) or v11;
end;

function u10.constructor(p12) -- Line: 55
    -- upvalues: GameKnitController (copy), GameType (copy), u2 (copy)
    GameKnitController.constructor(p12, { GameType.HALLOWEEN_2025_EVENT_PVE });
    p12.Name = "HalloweenAbilityDeathAdderTreeController";
    p12.chargeMaid = u2.new();
    p12.spellEffectMaidMap = {};
    p12.spellAbilityMaid = u2.new();
end;

function u10.KnitStart(p13) -- Line: 62
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p13);
end;

function u10.onGameInit(u14) -- Line: 65
    -- upvalues: default (copy), EntityUtil (copy), HalloweenUpgradeUtil (copy), HalloweenKit (copy), Players (copy), ClientSyncEvents (copy), AbilityId (copy), Flamework (copy), BedwarsImageId (copy), AbilityState (copy), Workspace (copy), RunService (copy), SorcererBalance (copy), SorcererTier (copy), u4 (copy), SpellChargeComponent (copy), KnitClient (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), u7 (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), EffectUtil (copy), u8 (copy), u9 (copy), ExplosionType (copy)
    default.Client:Get("EntityDeathEvent"):Connect(function(p15) -- Line: 66
        -- upvalues: EntityUtil (ref), HalloweenUpgradeUtil (ref), HalloweenKit (ref), u14 (copy), Players (ref)
        local v16 = EntityUtil:getEntity(p15.entityInstance);

        if v16 ~= nil then
            v16 = v16:getPlayer();
        end;

        if v16 and HalloweenUpgradeUtil:isHalloweenKit(v16, HalloweenKit.SORCERER) then
            u14:endSpellCastEffects(v16);

            if v16 == Players.LocalPlayer then
                u14.chargeMaid:DoCleaning();
            end;
        end;
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p17) -- Line: 79
        -- upvalues: Players (ref), AbilityId (ref), u14 (copy), Flamework (ref), BedwarsImageId (ref), AbilityState (ref), Workspace (ref), RunService (ref), SorcererBalance (ref), SorcererTier (ref), u4 (ref), SpellChargeComponent (ref), default (ref), KnitClient (ref), ClientSyncEvents (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        local v18 = Players:GetPlayerFromCharacter(p17.userCharacter);

        if not v18 then
            return nil;
        end;

        if p17.ability == AbilityId.SORCERER_EXPLOSION_HALLOWEEN then
            u14:playSpellCastEffects(v18);

            if p17.userCharacter ~= Players.LocalPlayer.Character then
                return nil;
            end;

            u14:createAimLine();

            if u14.abilityRef ~= nil then
                u14.abilityRef.Destroy();
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.SORCERER_PROJECTILE_FIRE, {
                abilityType = "KitPrimary",
                abilityButton = {
                    icon = BedwarsImageId.SORCERER_FIRE_ABILITY
                },

                getExtraData = function() -- Line: 98, Name: getExtraData
                    -- upvalues: u14 (ref)
                    return {
                        direction = u14:getProjectileDirection()
                    };
                end
            }):andThen(function(p19) -- Line: 104
                -- upvalues: u14 (ref)
                u14.abilityRef = p19;
            end);
            u14.chargeMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.SORCERER_PROJECTILE_CANCEL, {
                abilityType = "KitSecondary",
                abilityButton = {
                    icon = "rbxassetid://16812686987"
                },

                getExtraData = function() -- Line: 113, Name: getExtraData
                end
            }):expect());
            local v20 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.SORCERER_PROJECTILE_FIRE);

            if v20 then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v20, AbilityState.DISABLED);
            end;

            local u21 = Workspace:GetServerTimeNow();
            local u23 = RunService.Heartbeat:Connect(function() -- Line: 120
                -- upvalues: Workspace (ref), u21 (copy), SorcererBalance (ref), SorcererTier (ref), Flamework (ref), AbilityId (ref), AbilityState (ref)
                local v22 = Workspace:GetServerTimeNow() - u21 > SorcererBalance.getSorcererTierData(SorcererTier.TIER_1).secCharge and Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.SORCERER_PROJECTILE_FIRE);

                if v22 then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v22, AbilityState.READY);
                end;
            end);
            u14.chargeMaid:GiveTask(function() -- Line: 129
                -- upvalues: u14 (ref), u23 (copy), Flamework (ref), AbilityId (ref), BedwarsImageId (ref)
                if u14.abilityRef ~= nil then
                    u14.abilityRef.Destroy();
                end;

                u23:Disconnect();
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.SORCERER_EXPLOSION_HALLOWEEN, {
                    abilityType = "KitPrimary",
                    abilityButton = {
                        icon = BedwarsImageId.SORCERER_ABILITY_TIER_3
                    },

                    getExtraData = function() -- Line: 139, Name: getExtraData
                        -- upvalues: u14 (ref)
                        return {
                            direction = u14:getProjectileDirection()
                        };
                    end
                }):andThen(function(p24) -- Line: 145
                    -- upvalues: u14 (ref)
                    u14.abilityRef = p24;
                end);
            end);
            u14.chargeMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(SpellChargeComponent, {
                maxTier = 3
            })));
            default.Client:Get("SorcererSpellChargeStartedHalloween"):SendToServer();
            u14.chargeMaid:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                moveSpeedMultiplier = SorcererBalance.SPELL_CHARGE_MOVE_SPEED_MODIFIER
            }));
            KnitClient.Controllers.SwordController:toggleSwordSwing(true);
            KnitClient.Controllers.BlockPlacementController:disableBlockPlacer();
            local u26 = ClientSyncEvents.BeginProjectileTargeting:connect(function(p25) -- Line: 159
                p25:setCancelled(true);

                return nil;
            end);
            u14.chargeMaid:GiveTask(function() -- Line: 163
                -- upvalues: KnitClient (ref), u26 (copy)
                KnitClient.Controllers.SwordController:toggleSwordSwing(false);
                KnitClient.Controllers.BlockPlacementController:enableBlockPlacer();
                u26:Destroy();
            end);
            u14.targetingAnimationTrack = AnimationUtil:playAnimation(v18.Character.Humanoid.Animator, GameAnimationUtil:getAssetId(AnimationType.SORCERER_SPELL_CHARGE), {
                looped = true
            });
            u14.targetingAnimationTrack.Priority = Enum.AnimationPriority.Action4;
        end;

        if p17.ability == AbilityId.SORCERER_PROJECTILE_FIRE or p17.ability == AbilityId.SORCERER_PROJECTILE_CANCEL then
            u14:endSpellCastEffects(v18);

            if p17.userCharacter ~= Players.LocalPlayer.Character then
                return nil;
            end;

            u14.chargeMaid:DoCleaning();
            local targetingAnimationTrack = u14.targetingAnimationTrack;

            if targetingAnimationTrack ~= nil then
                targetingAnimationTrack:Stop();
            end;
        end;
    end);
    ClientSyncEvents.ExplosionEffect:connect(function(p27) -- Line: 187
        -- upvalues: u7 (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        if table.find(u7, p27.explosionType) == nil then
            return nil;
        end;

        SoundManager:playSound(GameSound.SORCERER_PROJECTILE_HIT, {
            rollOffMaxDistance = 250,
            position = p27.position
        });
        local v28 = ReplicatedStorage.Assets.Effects.SorcererExplosion:Clone();
        v28.Parent = Workspace;
        v28.CFrame = CFrame.new(p27.position);
        EffectUtil:playEffects({ v28 }, nil, {
            destroyAfterSec = 3
        });
    end);
    ClientSyncEvents.ExplosionEffect:connect(function(p29) -- Line: 203
        -- upvalues: u8 (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        if table.find(u8, p29.explosionType) == nil then
            return nil;
        end;

        SoundManager:playSound(GameSound.SORCERER_PROJECTILE_HIT, {
            rollOffMaxDistance = 250,
            position = p29.position
        });
        local v30 = ReplicatedStorage.Assets.Effects.SorcererExplosionHuge:Clone();
        v30.Parent = Workspace;
        v30.CFrame = CFrame.new(p29.position);
        EffectUtil:playEffects({ v30 }, nil, {
            destroyAfterSec = 3
        });
    end);
    ClientSyncEvents.ExplosionEffect:connect(function(p31) -- Line: 219
        -- upvalues: u9 (ref), SoundManager (ref), GameSound (ref), ExplosionType (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        if table.find(u9, p31.explosionType) == nil then
            return nil;
        end;

        SoundManager:playSound(GameSound.SORCERER_PROJECTILE_HIT, {
            rollOffMaxDistance = 250,
            position = p31.position
        });
        local v32;

        if (p31.explosionType == ExplosionType.SORCERER_EXPLOSION_FRAG_1_HUGE or p31.explosionType == ExplosionType.SORCERER_EXPLOSION_FRAG_2_HUGE) and true or p31.explosionType == ExplosionType.SORCERER_EXPLOSION_FRAG_3_HUGE then
            v32 = ReplicatedStorage.Assets.Effects.SorcererExplosionHuge:Clone();
        else
            v32 = ReplicatedStorage.Assets.Effects.SorcererExplosion:Clone();
        end;

        v32.Parent = Workspace;
        v32.CFrame = CFrame.new(p31.position);
        EffectUtil:playEffects({ v32 }, nil, {
            destroyAfterSec = 3
        });
    end);
    default.Client:Get("PlaySorcererSpellEffectsHalloween"):Connect(function(p33) -- Line: 236
        -- upvalues: u14 (copy)
        u14:playSpellCastEffects(p33.sorcerer);
    end);
    default.Client:Get("EndSorcererSpellEffectsHalloween"):Connect(function(p34) -- Line: 239
        -- upvalues: u14 (copy), SoundManager (ref), GameSound (ref), Players (ref), Workspace (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        u14:endSpellCastEffects(p34.sorcerer);

        if not p34.projectileFired then
            return nil;
        end;

        local Character = p34.sorcerer.Character;

        if Character ~= nil then
            Character = Character:GetPivot().Position;
        end;

        if Character then
            SoundManager:playSound(GameSound.SORCERER_PROJECTILE_SHOOT, {
                position = Character
            });
        end;

        if p34.sorcerer ~= Players.LocalPlayer then
            return nil;
        end;

        u14.chargeMaid:DoCleaning();
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame.LookVector;
        end;

        local Character2 = Players.LocalPlayer.Character;

        if Character2 ~= nil then
            Character2 = Character2:GetPivot();
        end;

        if CurrentCamera and Character2 then
            local v35 = CFrame.new(Character2.Position, Character2.Position + CurrentCamera * 10);
            local Character3 = Players.LocalPlayer.Character;

            if Character3 ~= nil then
                Character3:PivotTo(v35);
            end;
        end;

        AnimationUtil:playAnimation(p34.sorcerer.Character.Humanoid.Animator, GameAnimationUtil:getAssetId(AnimationType.COMET_VOLLEY_COMET_FIRED), {
            looped = false
        });
        local targetingAnimationTrack = u14.targetingAnimationTrack;

        if targetingAnimationTrack ~= nil then
            targetingAnimationTrack:Stop();
        end;
    end);
end;

function u10.playSpellCastEffects(p36, p37) -- Line: 289
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), u3 (copy), u2 (copy), SoundManager (copy), GameSound (copy), Players (copy), CollectionService (copy), KnitClient (copy), RunService (copy), SorcererBalance (copy)
    local Character = p37.Character;

    if not Character then
        return nil;
    end;

    local Character2 = p37.Character;

    if Character2 ~= nil then
        Character2 = Character2:GetPivot().LookVector.Unit;
    end;

    if not Character2 then
        return nil;
    end;

    local Character3 = p37.Character;

    if Character3 ~= nil then
        Character3 = Character3:GetPivot().Position;
    end;

    if not Character3 then
        return nil;
    end;

    local v38 = CFrame.new(Character3 + Character2 * 3, Character3 + Character2);
    local v39 = ReplicatedStorage.Assets.Effects.SorcererSpellCast:Clone();
    v39.Parent = Workspace;
    v39.CFrame = v38;
    u3("WeldConstraint", {
        Part0 = Character.PrimaryPart,
        Part1 = v39,
        Parent = v39
    });
    local v40 = p36.spellEffectMaidMap[p37] or u2.new();
    v40:GiveTask(v39);
    p36.spellEffectMaidMap[p37] = v40;
    local SORCERER_SPELL_CHARGING_LOOP = GameSound.SORCERER_SPELL_CHARGING_LOOP;
    local v41 = {};
    local Character4 = p37.Character;

    if Character4 ~= nil then
        Character4 = Character4.PrimaryPart;
    end;

    v41.parent = Character4;
    v41.position = Character3;
    v41.looped = true;
    v40:GiveTask(SoundManager:playSound(SORCERER_SPELL_CHARGING_LOOP, v41));
    local Specs = v39.ChargeUpParticles.Specs;
    local EnergyPull1 = v39.ChargeUpParticles.EnergyPull1;
    local EnergyPull2 = v39.ChargeUpParticles.EnergyPull2;
    local MagicCircle = v39.MagicCircle1.MagicCircle;
    local MagicCircle2 = v39.MagicCircle2.MagicCircle;
    local MagicCircle3 = v39.MagicCircle3.MagicCircle;

    if p37 == Players.LocalPlayer then
        CollectionService:AddTag(Specs, "FirstPersonHidden");
        CollectionService:AddTag(EnergyPull1, "FirstPersonHidden");
        CollectionService:AddTag(EnergyPull2, "FirstPersonHidden");
        CollectionService:AddTag(MagicCircle, "FirstPersonHidden");
        CollectionService:AddTag(MagicCircle2, "FirstPersonHidden");
        CollectionService:AddTag(MagicCircle3, "FirstPersonHidden");
    end;

    local SORCERER_SPELL_UPGRADES = GameSound.SORCERER_SPELL_UPGRADES;
    local v42 = {};
    local Character5 = p37.Character;

    if Character5 ~= nil then
        Character5 = Character5.PrimaryPart;
    end;

    v42.parent = Character5;
    v42.position = Character3;
    local u43 = SoundManager:playModifiableSound(SORCERER_SPELL_UPGRADES, v42);
    u43:Pause();
    v40:GiveTask(u43);
    local u44 = Workspace:GetServerTimeNow();
    local u45 = true;
    MagicCircle3.Lifetime = NumberRange.new(120);
    MagicCircle3.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.0004166666666666667, 0.1, 0), NumberSequenceKeypoint.new(1, 0.1, 0) });
    local u46 = KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective();
    v40:GiveTask((RunService.Heartbeat:Connect(function() -- Line: 383
        -- upvalues: Workspace (ref), u44 (copy), SorcererBalance (ref), u45 (ref), u46 (ref), KnitClient (ref), MagicCircle3 (copy), Specs (copy), EnergyPull1 (copy), EnergyPull2 (copy), u43 (copy)
        local v47 = Workspace:GetServerTimeNow() - u44;

        if SorcererBalance.getSorcererTierData(SorcererBalance.HIGHEST_TIER).secCharge < v47 and u45 then
            u46 = KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective();

            if u46 == 1 then
                MagicCircle3:Emit(1);
            end;

            u45 = false;
            local v48 = Specs;
            v48.Rate = v48.Rate + 20;
            local v49 = EnergyPull1;
            v49.Rate = v49.Rate + 5;
            local v50 = EnergyPull2;
            v50.Rate = v50.Rate + 5;
        end;

        if v47 > 3.5 then
            u43:Pause();
        end;
    end)));
end;

function u10.createAimLine(u51) -- Line: 402
    -- upvalues: Players (copy), Workspace (copy), u3 (copy), ReplicatedStorage (copy), GameQueryUtil (copy), DeviceUtil (copy), CollectionService (copy), RunService (copy), SorcererBalance (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local u52 = u3("Part", {
        Transparency = 1,
        CanCollide = false,
        Anchored = false,
        Parent = Workspace
    });
    local u53 = ReplicatedStorage.Assets.Effects.SorcererHitIndicator:Clone();
    u53.Parent = Workspace;
    u52:PivotTo(Players.LocalPlayer.Character:GetPivot());
    local v54 = u3("WeldConstraint", {
        Part0 = u52,
        Part1 = Players.LocalPlayer.Character.PrimaryPart,
        Parent = Players.LocalPlayer.Character
    });
    u51.chargeMaid:GiveTask(v54);
    GameQueryUtil:setQueryIgnored(u52, true);
    GameQueryUtil:setQueryIgnored(u53, true);
    local v55 = u3("Attachment", {
        Parent = u52
    });
    local v56 = u3("Attachment", {
        Parent = u53
    });
    local u57 = DeviceUtil.isMobileControls() and 3 or 1;
    local u58 = u3("Beam", {
        FaceCamera = true,
        Segments = 300,
        Brightness = 1,
        Attachment0 = v55,
        Attachment1 = v56,
        Color = ColorSequence.new(Color3.fromRGB(255, 115, 250)),
        Transparency = NumberSequence.new(0),
        Width0 = u57 * 0.08,
        Width1 = u57 * 0.08,
        Parent = Workspace
    });
    CollectionService:AddTag(u58, "projectile-preview-beam");
    u51.chargeMaid:GiveTask(u58);
    local u59 = 0;
    local v66 = RunService.Heartbeat:Connect(function() -- Line: 451
        -- upvalues: u59 (ref), SorcererBalance (ref), Workspace (ref), u52 (copy), u53 (copy), Players (ref), u51 (copy), u58 (copy), u57 (copy), u53 (copy)
        u59 = SorcererBalance.getSorcererTierData(SorcererBalance.HIGHEST_TIER).secCharge * SorcererBalance.getSorcererTierData(SorcererBalance.HIGHEST_TIER).secCharge;
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame;
        end;

        if not CurrentCamera then
            return nil;
        end;

        local v60 = u52;

        if v60 ~= nil then
            v60 = v60.Position;
        end;

        if not v60 then
            return nil;
        end;

        if not u53 then
            return nil;
        end;

        local Character2 = Players.LocalPlayer.Character;

        if Character2 ~= nil then
            Character2 = Character2:GetPivot().Position;
        end;

        if not Character2 then
            return nil;
        end;

        local v61 = u51:getProjectileDirection();
        local v62 = Workspace:Raycast(Character2 + v61 * 5, v61 * u59);

        if v62 then
            local v63 = u53;

            if v63 ~= nil then
                v63:PivotTo(CFrame.new(v62.Position));
            end;

            u58.Color = ColorSequence.new(Color3.fromRGB(255, 36, 247));
            u58.Width0 = u57 * 0.1;
            u58.Width1 = u57 * 0.1;
            u58.Transparency = NumberSequence.new(0);
            u53.Color = Color3.new(1, 0.03, 0.9);
            u53.Transparency = 0;
            u53.Attachment.ParticleEmitter.Enabled = true;

            return;
        end;

        local v64 = u52.Position + v61 * u59;
        local v65 = u53;

        if v65 ~= nil then
            v65:PivotTo(CFrame.new(v64));
        end;

        u58.Color = ColorSequence.new(Color3.fromRGB(255, 242, 255));
        u58.Transparency = NumberSequence.new(0.3);
        u58.Width0 = u57 * 0.08;
        u58.Width1 = u57 * 0.08;
        u53.Color = Color3.new(1, 0.95, 1);
        u53.Transparency = 0.8;
        u53.Attachment.ParticleEmitter.Enabled = false;
    end);
    u51.chargeMaid:GiveTask(v66);
end;

function u10.getProjectileDirection(p67) -- Line: 519
    -- upvalues: Workspace (copy), KnitClient (copy)
    local LookVector = Workspace.CurrentCamera.CFrame.LookVector;

    if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 1 then
        LookVector = Vector3.new(LookVector.X, LookVector.Y + 0.3, LookVector.Z);
    end;

    return LookVector;
end;

function u10.endSpellCastEffects(p68, p69) -- Line: 526
    local v70 = p68.spellEffectMaidMap[p69];

    if v70 ~= nil then
        v70:DoCleaning();
    end;
end;

function u10.enableHalloweenAbility(u71) -- Line: 535
    -- upvalues: Flamework (copy), AbilityId (copy), BedwarsImageId (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.SORCERER_EXPLOSION_HALLOWEEN, {
        abilityType = "KitPrimary",
        abilityButton = {
            icon = BedwarsImageId.SORCERER_ABILITY_TIER_3
        },

        getExtraData = function() -- Line: 541, Name: getExtraData
        end
    }):andThen(function(p72) -- Line: 543
        -- upvalues: u71 (copy)
        u71.abilityRef = p72;
        u71.spellAbilityMaid:GiveTask(p72);
    end);
end;

KnitClient.CreateController(u10.new());

return nil;