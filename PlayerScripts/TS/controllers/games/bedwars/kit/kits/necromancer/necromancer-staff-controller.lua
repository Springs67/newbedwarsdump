-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local v4 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "target-selector", "target-selector-util");
local TargetSelector = v4.TargetSelector;
local TargetType = v4.TargetType;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local findSurfacePosition = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-util").findSurfacePosition;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local NecromancerSummonType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "necromancer", "necromancer-kit-util").NecromancerSummonType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local NecromancerStaffUiBase = RuntimeLib.import(script, script.Parent, "ui", "necromancer-staff-base").NecromancerStaffUiBase;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "NecromancerStaffController";
    end,

    __index = HandKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 44
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 48
    -- upvalues: HandKnitController (copy), u2 (copy), NecromancerSummonType (copy)
    HandKnitController.constructor(p7);
    p7.Name = "NecromancerStaffController";
    p7.maid = u2.new();
    p7.summonMode = NecromancerSummonType.MELEE;
    p7.animationCooldown = -1;
end;

function u5.KnitStart(u8) -- Line: 55
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), AbilityId (copy), Players (copy), NecromancerSummonType (copy), SoundManager (copy), GameSound (copy), ClientStore (copy), Workspace (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), ItemType (copy), ReplicatedStorage (copy), EffectUtil (copy), KnitClient (copy), BedwarsKitSkin (copy), findSurfacePosition (copy), TargetSelector (copy), default (copy), u2 (copy), RunService (copy)
    HandKnitController.KnitStart(u8);
    ClientSyncEvents.AbilityUsed:connect(function(p9) -- Line: 57
        -- upvalues: AbilityId (ref), Players (ref), u8 (copy), NecromancerSummonType (ref), SoundManager (ref), GameSound (ref), ClientStore (ref), Workspace (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        if p9.ability == AbilityId.NECROMANCER_SWAP and p9.userCharacter == Players.LocalPlayer.Character then
            if u8.summonMode == NecromancerSummonType.MELEE then
                u8.summonMode = NecromancerSummonType.PROJECTILE;
                SoundManager:playSound(GameSound.WARLOCK_HEAL_START);
                ClientStore:dispatch({
                    type = "NecromancerSetMode",
                    necromancerSummonMode = u8.summonMode
                });

                if Workspace:GetServerTimeNow() > u8.animationCooldown then
                    AnimationUtil:playAnimation(Players.LocalPlayer.Character, GameAnimationUtil:getAssetId(AnimationType.NECROMANCER_SWAP));
                    u8.animationCooldown = Workspace:GetServerTimeNow() + 1;
                end;
            else
                u8.summonMode = NecromancerSummonType.MELEE;
                SoundManager:playSound(GameSound.WARLOCK_SIPHON_START);
                ClientStore:dispatch({
                    type = "NecromancerSetMode",
                    necromancerSummonMode = u8.summonMode
                });

                if Workspace:GetServerTimeNow() > u8.animationCooldown then
                    AnimationUtil:playAnimation(Players.LocalPlayer.Character, GameAnimationUtil:getAssetId(AnimationType.WIZARD_LIGHTNING_STRIKE_CAST));
                    u8.animationCooldown = Workspace:GetServerTimeNow() + 1;
                end;
            end;
        end;
    end);
    ClientSyncEvents.BeginProjectileTargeting:connect(function(p10) -- Line: 84
        -- upvalues: ItemType (ref), Players (ref)
        local v11 = p10.handItem.itemType == ItemType.NECROMANCER_STAFF;

        if v11 then
            local v12 = Players.LocalPlayer:GetAttribute("SkeletonCount");

            if v12 == 0 or v12 ~= v12 then
                v12 = false;
            elseif v12 == "" then
                v12 = false;
            end;

            v11 = not v12;
        end;

        if v11 then
            p10:setCancelled(true);
        end;
    end);
    ClientSyncEvents.ProjectileHit:connect(function(p13) -- Line: 94
        -- upvalues: Players (ref), u8 (copy), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), KnitClient (ref), GameSound (ref), BedwarsKitSkin (ref), findSurfacePosition (ref), SoundManager (ref)
        if p13:isCancelled() then
            return nil;
        end;

        if p13.projectileType ~= "deploy_skeleton" or not p13.shooter then
            return nil;
        end;

        local v14 = Players:GetPlayerFromCharacter(p13.shooter:getInstance());

        if not v14 then
            return nil;
        end;

        u8:playSummonAnimation(v14);
        local u15 = ReplicatedStorage.Assets.Effects.NecromancerExplosion:Clone();
        u15.Parent = Workspace;
        u15:PivotTo(p13.hitData.hitCFrame);
        EffectUtil:playEffects({ u15 }, nil);
        task.delay(2, function() -- Line: 110
            -- upvalues: u15 (copy)
            u15:Destroy();
        end);
        local v16 = KnitClient.Controllers.KitSkinController:getKitSkin(p13.shooter:getInstance());
        local CRYPT_SUMMON_SKELETON = GameSound.CRYPT_SUMMON_SKELETON;
        local u17;

        if v16 == BedwarsKitSkin.NECROMANCER_CHRISTMAS then
            u17 = ReplicatedStorage.Assets.Effects.SkeletonSummonChristmas:Clone();
            CRYPT_SUMMON_SKELETON = GameSound.CRYPT_SUMMON_SKELETON_XMAS;
        elseif v16 == BedwarsKitSkin.CRYPTWRECKED then
            u17 = ReplicatedStorage.Assets.Effects.SkeletonSummonCryptwrecked:Clone();
            CRYPT_SUMMON_SKELETON = GameSound.CRYPT_SUMMON_SKELETON_CRYPTWRECKED;
        else
            u17 = ReplicatedStorage.Assets.Effects.SummoningSmoke:Clone();
        end;

        u17.Parent = Workspace;
        local v18 = findSurfacePosition(p13.hitData.hitCFrame.Position);

        if not v18 then
            return nil;
        end;

        SoundManager:playSound(CRYPT_SUMMON_SKELETON, {
            position = v18
        });
        u17.Position = v18;
        EffectUtil:playEffects({ u17 }, nil);
        task.delay(6, function() -- Line: 138
            -- upvalues: u17 (ref)
            u17:Destroy();
        end);
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p19) -- Line: 142
        -- upvalues: Players (ref), AbilityId (ref), TargetSelector (ref), default (ref)
        if p19.userCharacter == Players.LocalPlayer.Character and p19.ability == AbilityId.NECROMANCER_SKELETONS_ATTACK then
            local v20 = TargetSelector:getTargetEntity();

            if not v20 then
                p19:setCancelled(true);

                return nil;
            end;

            default.Client:Get("NecromancerSelectTarget"):SendToServer({
                target = v20:getInstance()
            });
        end;
    end);
    default.Client:Get("NecromancerRecall"):Connect(function(p21) -- Line: 154
        -- upvalues: KnitClient (ref), GameSound (ref), BedwarsKitSkin (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), u2 (ref), RunService (ref)
        local Character = p21.caster.Character;

        if not Character then
            return nil;
        end;

        local v22 = KnitClient.Controllers.KitSkinController:getKitSkin(Character);
        local CRYPT_SUMMON_SKELETON = GameSound.CRYPT_SUMMON_SKELETON;
        local u23;

        if v22 == BedwarsKitSkin.NECROMANCER_CHRISTMAS then
            u23 = ReplicatedStorage.Assets.Effects.SkeletonSummonChristmas;
            CRYPT_SUMMON_SKELETON = GameSound.CRYPT_SUMMON_SKELETON_XMAS;
        elseif v22 == BedwarsKitSkin.CRYPTWRECKED then
            u23 = ReplicatedStorage.Assets.Effects.SkeletonSummonCryptwrecked;
            CRYPT_SUMMON_SKELETON = GameSound.CRYPT_SUMMON_SKELETON_CRYPTWRECKED;
        else
            u23 = ReplicatedStorage.Assets.Effects.SummoningSmoke;
        end;

        local u24 = u23:Clone();
        u24.Position = p21.targetPos - Vector3.new(0, 2, 0);
        u24.Parent = Workspace;
        EffectUtil:playEffects({ u24 }, nil);
        task.delay(3, function() -- Line: 177
            -- upvalues: u24 (copy)
            u24:Destroy();
        end);
        AnimationUtil:playAnimation(Character, GameAnimationUtil:getAssetId(AnimationType.HALLOWEEN_BOSS_CAST));
        SoundManager:playSound(CRYPT_SUMMON_SKELETON, {
            position = p21.targetPos
        });
        local skeletons = p21.skeletons;

        local function v30(u25) -- Line: 185
            -- upvalues: u2 (ref), u23 (ref), Workspace (ref), RunService (ref)
            local u26 = u2.new();
            local u27 = u23:Clone();
            u27.Parent = Workspace;
            local Circle = u27:WaitForChild("Circle", 1);

            if Circle then
                local function _(p28) -- Line: 192
                    if p28:IsA("ParticleEmitter") then
                        p28:Emit(1);
                    end;
                end;

                for i, child in Circle:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("ParticleEmitter") then
                        child:Emit(1);
                    end;
                end;
            end;

            u26:GiveTask(u27);
            u26:GiveTask(RunService.Heartbeat:Connect(function(p29) -- Line: 202
                -- upvalues: u25 (copy), u27 (copy), Workspace (ref)
                local PrimaryPart = u25.PrimaryPart;

                if PrimaryPart ~= nil then
                    PrimaryPart = PrimaryPart.Position;
                end;

                if not PrimaryPart or u27.Parent ~= Workspace then
                    return nil;
                end;

                u27.Position = PrimaryPart - Vector3.new(0, 2, 0);
            end));
            task.delay(1.5, function() -- Line: 214
                -- upvalues: u26 (copy)
                u26:DoCleaning();
            end);
        end;

        for i, v in skeletons do
            v30(v, i - 1, skeletons);
        end;
    end);
end;

function u5.isRelevantItem(p31, p32) -- Line: 223
    -- upvalues: ItemType (copy)
    return p32.itemType == ItemType.NECROMANCER_STAFF;
end;

function u5.onEnable(u33, p34, p35) -- Line: 226
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityMeta (copy), u2 (copy), NecromancerStaffUiBase (copy), NecromancerSummonType (copy), TargetSelector (copy), TargetType (copy), AbilityState (copy), ClientSyncEvents (copy), CooldownId (copy)
    u33:setupYield(function() -- Line: 227
        -- upvalues: u33 (copy), Flamework (ref), AbilityId (ref), AbilityMeta (ref)
        u33.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.NECROMANCER_RECALL_SKELETONS, AbilityMeta[AbilityId.NECROMANCER_RECALL_SKELETONS].triggerConfig):expect());

        return function() -- Line: 229
            -- upvalues: u33 (ref)
            u33.maid:DoCleaning();
        end;
    end);
    u33:setupYield(function() -- Line: 233
        -- upvalues: u33 (copy), Flamework (ref), AbilityId (ref), AbilityMeta (ref)
        u33.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.NECROMANCER_SKELETONS_ATTACK, AbilityMeta[AbilityId.NECROMANCER_SKELETONS_ATTACK].triggerConfig):expect());
        u33.targetAbilityRef = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.NECROMANCER_SKELETONS_ATTACK);

        return function() -- Line: 236
            -- upvalues: u33 (ref)
            u33.maid:DoCleaning();
        end;
    end);
    u33:setupYield(function() -- Line: 240
        -- upvalues: u2 (ref), Flamework (ref), u33 (copy)
        local u36 = u2.new();
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
            action = "KitPrimary",
            actionId = "necromancer-swap",

            boundFunction = function(p37, p38, p39) -- Line: 245, Name: boundFunction
                -- upvalues: u33 (ref)
                if p38 == Enum.UserInputState.Begin then
                    u33:swap();
                end;
            end
        });

        return function() -- Line: 251
            -- upvalues: u36 (copy)
            u36:DoCleaning();
        end;
    end);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "NecromancerStaffBase",
        app = NecromancerStaffUiBase
    }, {
        ChangeAbility = function(p40) -- Line: 259, Name: ChangeAbility
            -- upvalues: u33 (copy)
            return u33:swap();
        end,

        Modes = { NecromancerSummonType.MELEE, NecromancerSummonType.PROJECTILE }
    });
    TargetSelector:enableTargetSelector(TargetType.ENTITY, {
        requireSight = true,
        distance = 30
    });

    if not TargetSelector:getTargetEntity() and u33.targetAbilityRef then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u33.targetAbilityRef, AbilityState.DISABLED);
    end;

    u33.maid:GiveTask(ClientSyncEvents.NewSelectorTarget:connect(function(p41) -- Line: 271
        -- upvalues: u33 (copy), Flamework (ref), AbilityId (ref), AbilityState (ref), CooldownId (ref)
        if not u33.targetAbilityRef then
            u33.targetAbilityRef = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.NECROMANCER_SKELETONS_ATTACK);
        end;

        if not u33.targetAbilityRef then
            return nil;
        end;

        if not p41.target or u33.targetAbilityRef.abilityState ~= AbilityState.DISABLED then
            if not p41.target and (u33.targetAbilityRef.abilityState == AbilityState.READY or u33.targetAbilityRef.abilityState == AbilityState.ON_COOLDOWN) then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u33.targetAbilityRef, AbilityState.DISABLED);
            end;

            return;
        end;

        if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(CooldownId.NECROMANCER_SKELETON_MARK) > 0 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u33.targetAbilityRef, AbilityState.ON_COOLDOWN);

            return;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u33.targetAbilityRef, AbilityState.READY);
    end));
end;

function u5.onDisable(p42) -- Line: 289
    -- upvalues: TargetSelector (copy), Flamework (copy)
    p42.maid:DoCleaning();
    TargetSelector:disableTargetSelector();
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("NecromancerStaffBase");
end;

function u5.playSummonAnimation(p43, p44) -- Line: 294
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    AnimationUtil:playAnimation(p44, GameAnimationUtil:getAssetId(AnimationType.NECROMANCER_SUMMON), {
        looped = false
    });
end;

function u5.swap(p45) -- Line: 299
    -- upvalues: Flamework (copy), AbilityId (copy)
    if not p45:isEnabled() then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.NECROMANCER_SWAP);
end;

KnitClient.CreateController(u5.new());

return nil;