-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local AbilityState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AbilityState;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local LifeForceAttr = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").LifeForceAttr;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local NazarKitBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "nazar", "nazar-kit-balance").NazarKitBalance;
local HalloweenBalanceConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-balance-config").HalloweenBalanceConfig;
local HalloweenKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kits").HalloweenKit;
local ArmorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "armor-util").ArmorUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local GetAttribute = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute;
local LifeForceUi = RuntimeLib.import(script, script.Parent.Parent.Parent, "bedwars", "kit", "kits", "nazar", "life-force-ui").LifeForceUi;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "HalloweenNazarController";
    end,

    __index = GameKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 39
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 43
    -- upvalues: GameKnitController (copy), GameType (copy), u1 (copy)
    GameKnitController.constructor(p6, { GameType.HALLOWEEN_2025_EVENT_PVE });
    p6.Name = "HalloweenNazarController";
    p6.lifeForceUiMaid = u1.new();
    p6.lifeForceUiKey = "LifeForceUI";
    p6.isStatusEffectActive = false;
    p6.inited = false;
    p6.empowerMaid = {};
end;

function u4.KnitStart(p7) -- Line: 52
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p7);
end;

function u4.onGameInit(u8) -- Line: 55
    -- upvalues: ClientSyncEvents (copy), Players (copy), StatusEffectType (copy), Flamework (copy), AbilityState (copy), default (copy), HalloweenKit (copy), SyncEventPriority (copy), NazarKitBalance (copy), getItemMeta (copy), AbilityId (copy)
    ClientSyncEvents.StatusEffectAdded:connect(function(p9) -- Line: 56
        -- upvalues: Players (ref), StatusEffectType (ref), Flamework (ref), u8 (copy), AbilityState (ref)
        if p9.entityInstance == Players.LocalPlayer.Character and p9.statusEffect == StatusEffectType.NAZAR_HALLOWEEN_KNOCKBACK_STRIKE then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u8.enabledAbility, AbilityState.DISABLED);
            u8.isStatusEffectActive = true;
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p10) -- Line: 62
        -- upvalues: Players (ref), StatusEffectType (ref), Flamework (ref), u8 (copy), AbilityState (ref)
        if p10.entityInstance == Players.LocalPlayer.Character and p10.statusEffect == StatusEffectType.NAZAR_HALLOWEEN_KNOCKBACK_STRIKE then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u8.enabledAbility, AbilityState.READY);
            u8.isStatusEffectActive = false;
        end;
    end);
    default.Client:Get("HalloweenSetKit"):Connect(function(p11) -- Line: 68
        -- upvalues: u8 (copy), HalloweenKit (ref)
        if not u8.inited and p11.kit == HalloweenKit.NAZAR then
            u8:mountLifeForceUi();
            u8:mountAbility();
            u8.inited = true;
        end;
    end);
    ClientSyncEvents.ProjectileLaunched:setPriority(SyncEventPriority.HIGH):connect(function(p12) -- Line: 77
        -- upvalues: NazarKitBalance (ref), u8 (copy)
        local v13 = not p12:isLocalShooter();

        if not v13 then
            v13 = not (NazarKitBalance.HEALTH_TAKEN_BY_PROJECTILE[p12.projectileType] ~= nil);
        end;

        if v13 then
            return nil;
        end;

        if not u8:hasHealthToFireProjectile(p12.projectileType) then
            p12.projectile:Destroy();
            p12:setCancelled(true);
        end;
    end);
    ClientSyncEvents.BeginProjectileTargeting:setPriority(SyncEventPriority.HIGH):connect(function(p14) -- Line: 92
        -- upvalues: getItemMeta (ref), NazarKitBalance (ref), u8 (copy)
        local projectileSource = getItemMeta(p14.handItem.itemType).projectileSource;

        if projectileSource ~= nil then
            projectileSource = projectileSource.projectileType(nil);
        end;

        if not projectileSource or NazarKitBalance.HEALTH_TAKEN_BY_PROJECTILE[projectileSource] == nil then
            return nil;
        end;

        if not u8:hasHealthToFireProjectile(projectileSource) then
            p14:setCancelled(true);
        end;
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p15) -- Line: 105
        -- upvalues: AbilityId (ref), u8 (copy)
        if p15:isCancelled() then
            return nil;
        end;

        if p15.ability == AbilityId.ENABLE_LIFE_FORCE_ATTACK then
            u8:addEmpowerParticles(p15.userCharacter);

            return;
        end;

        if p15.ability == AbilityId.DISABLE_LIFE_FORCE_ATTACK then
            local v16 = u8.empowerMaid[p15.userCharacter];

            if v16 ~= nil then
                v16:DoCleaning();
            end;
        end;
    end);
end;

function u4.hasHealthToFireProjectile(p17, p18) -- Line: 121
    -- upvalues: NazarKitBalance (copy), ArmorUtil (copy), Players (copy), EntityUtil (copy)
    local v19 = NazarKitBalance.HEALTH_TAKEN_BY_PROJECTILE[p18];

    if not v19 then
        return true;
    end;

    local v20 = ArmorUtil.calculateDamageAfterArmor(Players.LocalPlayer, v19.damage, v19.armorMult);
    local v21 = EntityUtil:getEntity(Players.LocalPlayer);

    if v21 ~= nil then
        v21 = v21:getHealth();
    end;

    return v20 < (v21 == nil and 0 or v21);
end;

function u4.addEmpowerParticles(p22, u23) -- Line: 139
    -- upvalues: ReplicatedStorage (copy), MapUtil (copy), u1 (copy)
    local v24 = ReplicatedStorage.Assets.Effects.Empower:Clone():GetChildren();
    local v25 = ReplicatedStorage.Assets.Effects.Empower:Clone():GetChildren();
    local u26 = MapUtil.getOrCreate(p22.empowerMaid, u23, u1.new());

    local function _(p27) -- Line: 143
        -- upvalues: u23 (copy), u26 (copy)
        p27.Parent = u23.LeftHand;
        u26:GiveTask(p27);
    end;

    for i, v in v24 do
        local _ = i - 1;
        v.Parent = u23.LeftHand;
        u26:GiveTask(v);
    end;

    local function _(p28) -- Line: 150
        -- upvalues: u23 (copy), u26 (copy)
        p28.Parent = u23.RightHand;
        u26:GiveTask(p28);
    end;

    for i, v in v25 do
        local _ = i - 1;
        v.Parent = u23.RightHand;
        u26:GiveTask(v);
    end;
end;

function u4.mountAbility(u29) -- Line: 158
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityMeta (copy), Players (copy), LifeForceAttr (copy), GetAttribute (copy), HalloweenBalanceConfig (copy), AbilityState (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(AbilityId.DISABLE_LIFE_FORCE_ATTACK);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.ENABLE_LIFE_FORCE_ATTACK, AbilityMeta[AbilityId.ENABLE_LIFE_FORCE_ATTACK].triggerConfig);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.CONSUME_LIFE_FORCE, AbilityMeta[AbilityId.CONSUME_LIFE_FORCE].triggerConfig);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.HALLOWEEN_NAZAR_KNOCKBACK_STRIKE, AbilityMeta[AbilityId.HALLOWEEN_NAZAR_KNOCKBACK_STRIKE].triggerConfig);
    u29.enabledAbility = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.HALLOWEEN_NAZAR_KNOCKBACK_STRIKE);
    Players.LocalPlayer:GetAttributeChangedSignal(LifeForceAttr.Name):Connect(function() -- Line: 164
        -- upvalues: GetAttribute (ref), Players (ref), LifeForceAttr (ref), HalloweenBalanceConfig (ref), u29 (copy), Flamework (ref), AbilityState (ref)
        local v30 = GetAttribute(Players.LocalPlayer, LifeForceAttr);
        local v31 = v30 == nil and 0 or v30;

        if v31 < HalloweenBalanceConfig.NAZAR_KNOCKBACK_STRIKE_LIFE_FORCE_COST and not u29.isStatusEffectActive then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u29.enabledAbility, AbilityState.DISABLED);

            return;
        end;

        if HalloweenBalanceConfig.NAZAR_KNOCKBACK_STRIKE_LIFE_FORCE_COST <= v31 and not u29.isStatusEffectActive then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u29.enabledAbility, AbilityState.READY);
        end;
    end);
end;

function u4.mountLifeForceUi(p32) -- Line: 177
    -- upvalues: Flamework (copy), u2 (copy), LifeForceUi (copy)
    p32.lifeForceUiMaid:DoCleaning();
    p32.lifeForceUiMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u2.createFragment({
        [p32.lifeForceUiKey] = u2.createElement(LifeForceUi)
    })));
end;

KnitClient.CreateController(u4.new());

return nil;