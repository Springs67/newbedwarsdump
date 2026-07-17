-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "IceQueenAbilityController";
    end,

    __index = BaseKitController
});
u2.__index = u2;

function u2.new(...) -- Line: 27
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 31
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p4, BedwarsKit.ICE_QUEEN);
    p4.Name = "IceQueenAbilityController";
    p4.frozenTargets = {};
end;

function u2.onKitLocalActivated(u5, p6) -- Line: 36
    -- upvalues: WatchCollectionTag (copy), Flamework (copy), AbilityId (copy), AbilityMeta (copy), AbilityState (copy)
    p6:GiveTask(WatchCollectionTag("entity", function(u7) -- Line: 37
        -- upvalues: u5 (copy)
        u7:GetAttributeChangedSignal("IceQueenStacks"):Connect(function() -- Line: 38
            -- upvalues: u7 (copy), u5 (ref)
            local v8 = u7:GetAttribute("IceQueenStacks");

            if v8 == nil or v8 == 0 then
                u5.frozenTargets[u7] = nil;

                return;
            end;

            u5.frozenTargets[u7] = true;
        end);
    end));
    local v9 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
    local ICE_QUEEN = AbilityId.ICE_QUEEN;
    local v10 = {};

    for i, v in AbilityMeta[AbilityId.ICE_QUEEN].triggerConfig do
        v10[i] = v;
    end;

    v9:enableAbility(ICE_QUEEN, v10):expect();
    u5.enabledAbility = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.ICE_QUEEN);

    if not u5:shouldEnableAbility() and u5.enabledAbility then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u5.enabledAbility, AbilityState.DISABLED);
    end;

    task.defer(function() -- Line: 62
        -- upvalues: u5 (copy)
        while true do
            local v11 = task.wait(0.5);

            if v11 == 0 or (v11 ~= v11 or not (v11 and u5.enabledAbility)) then
                break;
            end;

            if u5:shouldEnableAbility() then
                u5:enableAbility();
            else
                u5:disableAbility();
            end;
        end;
    end);
end;

function u2.onAbilityUsed(p12, p13, p14) -- Line: 79
    -- upvalues: Players (copy), AbilityId (copy), GameAnimationUtil (copy), AnimationType (copy)
    if p14.userCharacter == Players.LocalPlayer.Character and p14.ability == AbilityId.ICE_QUEEN then
        GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.NECROMANCER_SUMMON);
    end;
end;

function u2.onKitLocalDeactivated(p15) -- Line: 84
end;

function u2.onKitReplicationActivated(p16, p17) -- Line: 86
end;

function u2.onKitReplicationDeactivated(p18) -- Line: 88
end;

function u2.onInnateAbilityEnabled(p19, p20, p21) -- Line: 90
end;

function u2.shouldEnableAbility(p22) -- Line: 92
    return #p22:getNearbyTargets() ~= 0;
end;

function u2.enableAbility(p23) -- Line: 98
    -- upvalues: Flamework (copy), CooldownId (copy), AbilityState (copy)
    if not p23.enabledAbility then
        return nil;
    end;

    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(CooldownId.ICE_QUEEN) <= 0 then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p23.enabledAbility, AbilityState.READY);

        return;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p23.enabledAbility, AbilityState.ON_COOLDOWN);
end;

function u2.disableAbility(p24) -- Line: 109
    -- upvalues: Flamework (copy), AbilityState (copy)
    if not p24.enabledAbility then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p24.enabledAbility, AbilityState.DISABLED);
end;

function u2.getNearbyTargets(p25) -- Line: 115
    -- upvalues: EntityUtil (copy), Players (copy)
    local v26 = EntityUtil:getLocalPlayerEntity();
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not (v26 and Character) then
        return {};
    end;

    local v27 = {};

    for i in p25.frozenTargets do
        local PrimaryPart = i.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if PrimaryPart and (PrimaryPart - Character).Magnitude <= 30 then
            local v28 = EntityUtil:getEntity(i);

            if v28 and v26:canAttack(v28) then
                table.insert(v27, i);
            end;
        end;
    end;

    return v27;
end;

KnitClient.CreateController(u2.new());

return nil;