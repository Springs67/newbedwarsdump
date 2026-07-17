-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local getAbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").getAbilityMeta;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "AbilityStatusEffectController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 24
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "AbilityStatusEffectController";
end;

function u2.KnitStart(p5) -- Line: 32
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), Players (copy), u1 (copy), AbilityId (copy), getAbilityMeta (copy), Flamework (copy), SyncEventPriority (copy), EntityUtil (copy), StatusEffectUtil (copy)
    KnitController.KnitStart(p5);
    ClientSyncEvents.StatusEffectAdded:connect(function(p6) -- Line: 34
        -- upvalues: Players (ref), u1 (ref), AbilityId (ref), getAbilityMeta (ref), Flamework (ref)
        if p6.entityInstance ~= Players.LocalPlayer.Character then
            return nil;
        end;

        for _, v in u1.values(AbilityId) do
            local v7 = getAbilityMeta(v).blockingStatusEffects or {};

            if table.find(v7, p6.statusEffect) ~= nil then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):blockAbility(v, "status-effect:" .. p6.statusEffect);
            end;
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p8) -- Line: 46
        -- upvalues: Players (ref), u1 (ref), AbilityId (ref), getAbilityMeta (ref), Flamework (ref)
        if p8.entityInstance ~= Players.LocalPlayer.Character then
            return nil;
        end;

        for _, v in u1.values(AbilityId) do
            local v9 = getAbilityMeta(v).blockingStatusEffects or {};

            if table.find(v9, p8.statusEffect) ~= nil then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):unblockAbility(v, "status-effect:" .. p8.statusEffect);
            end;
        end;
    end);
    ClientSyncEvents.CanUseLocalAbility:setPriority(SyncEventPriority.HIGHEST):connect(function(p10) -- Line: 58
        -- upvalues: getAbilityMeta (ref), EntityUtil (ref), Players (ref), StatusEffectUtil (ref)
        if p10:isCancelled() then
            return nil;
        end;

        local v11 = getAbilityMeta(p10.ability);

        if not v11.blockingStatusEffects then
            return nil;
        end;

        local v12 = EntityUtil:getEntity(Players.LocalPlayer);

        if v12 ~= nil then
            v12 = v12:getInstance();
        end;

        if not v12 then
            return nil;
        end;

        if StatusEffectUtil:hasAnyActive(v12, v11.blockingStatusEffects) then
            p10:setCancelled(true);
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;