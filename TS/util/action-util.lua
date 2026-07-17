-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v2.ContextActionService;
local Players = v2.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent, "client-sync-events").ClientSyncEvents;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "ActionUtil";
    end
});
u3.__index = u3;

function u3.new(...) -- Line: 16
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 20
end;

function u3.disableActions(p6, u7) -- Line: 22
    -- upvalues: u1 (copy), ClientSyncEvents (copy)
    local v8 = u1.new();

    if u7.disableSword then
        v8:GiveTask(ClientSyncEvents.BeforeSwordSwing:connect(function(p9) -- Line: 25
            p9:setCancelled(true);
        end));
        v8:GiveTask(ClientSyncEvents.SwordCharge:connect(function(p10) -- Line: 28
            p10:setCancelled(true);
        end));
    end;

    if u7.disableAbilities then
        v8:GiveTask(ClientSyncEvents.CanUseLocalAbility:connect(function(p11) -- Line: 33
            -- upvalues: u7 (copy)
            local enabledAbilityOverrides = u7.enabledAbilityOverrides;

            if enabledAbilityOverrides ~= nil then
                enabledAbilityOverrides = table.find(enabledAbilityOverrides, p11.ability) ~= nil;
            end;

            if enabledAbilityOverrides then
                return nil;
            end;

            p11:setCancelled(true);
        end));
        v8:GiveTask(ClientSyncEvents.AbilityUsed:connect(function(p12) -- Line: 44
            -- upvalues: u7 (copy)
            local enabledAbilityOverrides = u7.enabledAbilityOverrides;

            if enabledAbilityOverrides ~= nil then
                enabledAbilityOverrides = table.find(enabledAbilityOverrides, p12.ability) ~= nil;
            end;

            if enabledAbilityOverrides then
                return nil;
            end;

            p12:setCancelled(true);
        end));
    end;

    if u7.disableBlockPlacement then
        v8:GiveTask(ClientSyncEvents.PlaceBlock:connect(function(p13) -- Line: 57
            p13:setCancelled(true);
        end));
    end;

    if u7.disableBlockBreaking then
        v8:GiveTask(ClientSyncEvents.DamageBlock:connect(function(p14) -- Line: 62
            p14:setCancelled(true);
        end));
        v8:GiveTask(ClientSyncEvents.DamageBlockEffect:connect(function(p15) -- Line: 65
            -- upvalues: u7 (copy)
            if p15.fromPlayer == u7.player then
                p15:setCancelled(true);
            end;
        end));
    end;

    if u7.disableAiming then
        v8:GiveTask(ClientSyncEvents.BeginProjectileTargeting:connect(function(p16) -- Line: 72
            p16:setCancelled(true);
        end));
    end;

    if u7.disableConsumingItems then
        v8:GiveTask(ClientSyncEvents.StartConsuming:connect(function(p17) -- Line: 77
            p17:setCancelled(true);
        end));
    end;

    return v8;
end;

function u3.disableMovementInput(p18) -- Line: 83
    -- upvalues: ContextActionService (copy)
    local function _(p19) -- Line: 85
        -- upvalues: ContextActionService (ref)
        ContextActionService:BindAction("DisableMovement-" .. p19.Name, function() -- Line: 86
            return Enum.ContextActionResult.Sink;
        end, false, p19);
    end;

    for i, v in Enum.PlayerActions:GetEnumItems() do
        local _ = i - 1;
        ContextActionService:BindAction("DisableMovement-" .. v.Name, function() -- Line: 86
            return Enum.ContextActionResult.Sink;
        end, false, v);
    end;

    return function() -- Line: 93
        -- upvalues: ContextActionService (ref)
        local function _(p20) -- Line: 95
            -- upvalues: ContextActionService (ref)
            ContextActionService:UnbindAction("DisableMovement-" .. p20.Name);
        end;

        for i, v in Enum.PlayerActions:GetEnumItems() do
            local _ = i - 1;
            ContextActionService:UnbindAction("DisableMovement-" .. v.Name);
        end;
    end;
end;

function u3.freezePlayer(p21) -- Line: 103
    -- upvalues: Players (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if Character then
        Players.LocalPlayer.Character.PrimaryPart.Anchored = true;
    end;

    return function() -- Line: 111
        -- upvalues: Players (ref)
        local Character2 = Players.LocalPlayer.Character;

        if Character2 ~= nil then
            Character2 = Character2.PrimaryPart;
        end;

        if Character2 then
            Players.LocalPlayer.Character.PrimaryPart.Anchored = false;
        end;
    end;
end;

return {
    ActionUtil = u3
};