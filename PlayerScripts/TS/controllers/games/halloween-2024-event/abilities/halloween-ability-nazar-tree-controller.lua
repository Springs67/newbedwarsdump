-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local AbilityState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AbilityState;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local LifeForceAttr = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").LifeForceAttr;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local HalloweenAbilityType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-type").HalloweenAbilityType;
local HalloweenBalanceConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-balance-config").HalloweenBalanceConfig;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local GetAttribute = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "HalloweenAbilityNazarTreeController";
    end,

    __index = GameKnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 28
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 32
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p3, { GameType.HALLOWEEN_2024_EVENT });
    p3.Name = "HalloweenAbilityNazarTreeController";
    p3.isStatusEffectActive = false;
end;

function u1.KnitStart(p4) -- Line: 37
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p4);
end;

function u1.onGameInit(u5) -- Line: 40
    -- upvalues: default (copy), HalloweenAbilityType (copy), Players (copy), KnitClient (copy), Flamework (copy), AbilityId (copy), AbilityMeta (copy), AbilityState (copy), ClientSyncEvents (copy), StatusEffectType (copy), LifeForceAttr (copy), GetAttribute (copy), HalloweenBalanceConfig (copy)
    default.Client:GetNamespace("Halloween2024Remotes"):Get("GiveSkillUpgrade"):Connect(function(p6) -- Line: 41
        -- upvalues: HalloweenAbilityType (ref), Players (ref), KnitClient (ref), Flamework (ref), AbilityId (ref), AbilityMeta (ref), u5 (copy), AbilityState (ref)
        if p6.halloweenAbilityType == HalloweenAbilityType.NAZAR_STARTER and p6.player == Players.LocalPlayer then
            KnitClient.Controllers.LifeForceUiController:mountLifeForceUi();
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(AbilityId.CONSUME_LIFE_FORCE);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(AbilityId.ENABLE_LIFE_FORCE_ATTACK);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.HALLOWEEN_NAZAR_KNOCKBACK_STRIKE, AbilityMeta[AbilityId.HALLOWEEN_NAZAR_KNOCKBACK_STRIKE].triggerConfig);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.ENABLE_LIFE_FORCE_ATTACK, AbilityMeta[AbilityId.ENABLE_LIFE_FORCE_ATTACK].triggerConfig);
            u5.enabledAbility = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.HALLOWEEN_NAZAR_KNOCKBACK_STRIKE);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u5.enabledAbility, AbilityState.DISABLED);
        end;
    end);
    ClientSyncEvents.StatusEffectAdded:connect(function(p7) -- Line: 55
        -- upvalues: Players (ref), StatusEffectType (ref), Flamework (ref), u5 (copy), AbilityState (ref)
        if p7.entityInstance == Players.LocalPlayer.Character and p7.statusEffect == StatusEffectType.NAZAR_HALLOWEEN_KNOCKBACK_STRIKE then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u5.enabledAbility, AbilityState.DISABLED);
            u5.isStatusEffectActive = true;
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p8) -- Line: 61
        -- upvalues: Players (ref), StatusEffectType (ref), Flamework (ref), u5 (copy), AbilityState (ref)
        if p8.entityInstance == Players.LocalPlayer.Character and p8.statusEffect == StatusEffectType.NAZAR_HALLOWEEN_KNOCKBACK_STRIKE then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u5.enabledAbility, AbilityState.READY);
            u5.isStatusEffectActive = false;
        end;
    end);
    Players.LocalPlayer:GetAttributeChangedSignal(LifeForceAttr.Name):Connect(function() -- Line: 67
        -- upvalues: GetAttribute (ref), Players (ref), LifeForceAttr (ref), HalloweenBalanceConfig (ref), u5 (copy), Flamework (ref), AbilityState (ref)
        local v9 = GetAttribute(Players.LocalPlayer, LifeForceAttr);
        local v10 = v9 == nil and 0 or v9;

        if v10 < HalloweenBalanceConfig.NAZAR_KNOCKBACK_STRIKE_LIFE_FORCE_COST and not u5.isStatusEffectActive then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u5.enabledAbility, AbilityState.DISABLED);

            return;
        end;

        if HalloweenBalanceConfig.NAZAR_KNOCKBACK_STRIKE_LIFE_FORCE_COST <= v10 and not u5.isStatusEffectActive then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u5.enabledAbility, AbilityState.READY);
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;