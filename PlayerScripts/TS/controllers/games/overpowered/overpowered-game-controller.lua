-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local OverpoweredGameBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "overpowered", "overpowered-game-balance").OverpoweredGameBalance;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "OverpoweredGameController";
    end,

    __index = GameKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 21
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 25
    -- upvalues: GameKnitController (copy), GameType (copy), u1 (copy)
    GameKnitController.constructor(p4, { GameType.OVERPOWERED });
    p4.Name = "OverpoweredGameController";
    p4.moveSpeedModifierMaid = u1.new();
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p5);
end;

function u2.onGameInit(u6) -- Line: 33
    -- upvalues: WatchCharacter (copy), Players (copy), KnitClient (copy), OverpoweredGameBalance (copy), ClientSyncEvents (copy)
    WatchCharacter(function(p7, p8) -- Line: 35
        -- upvalues: Players (ref), u6 (copy), KnitClient (ref), OverpoweredGameBalance (ref)
        if p7 == Players.LocalPlayer then
            task.delay(0.1, function() -- Line: 37
                -- upvalues: u6 (ref), KnitClient (ref), OverpoweredGameBalance (ref)
                u6.moveSpeedModifierMaid:DoCleaning();
                local v9 = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    moveSpeedMultiplier = OverpoweredGameBalance.MoveSpeedMultiplier
                });
                u6.moveSpeedModifierMaid:GiveTask(v9);
            end);
        end;
    end);
    ClientSyncEvents.AbilityCooldownModifierCheck:connect(function(p10) -- Line: 48
        -- upvalues: OverpoweredGameBalance (ref)
        p10.cooldown = p10.cooldown * OverpoweredGameBalance.AbilityCooldownMultiplier;
    end);
    ClientSyncEvents.ProjectileCooldownModifierCheck:connect(function(p11) -- Line: 51
        -- upvalues: OverpoweredGameBalance (ref)
        p11.cooldown = p11.cooldown * OverpoweredGameBalance.ProjectileCooldownMultiplier;
    end);
    ClientSyncEvents.ProjectileMaxChargeTimeModifierCheck:connect(function(p12) -- Line: 54
        -- upvalues: OverpoweredGameBalance (ref)
        p12.maxChargeTime = p12.maxChargeTime * OverpoweredGameBalance.ProjectileMaxChargeTimeMultiplier;
    end);
    ClientSyncEvents.CropGrowthTimeModifierCheck:connect(function(p13) -- Line: 57
        -- upvalues: OverpoweredGameBalance (ref)
        p13.growthTime = p13.growthTime * OverpoweredGameBalance.CropGrowthTimeMultiplier;
    end);
    ClientSyncEvents.KitProgressModifierCheck:connect(function(p14) -- Line: 60
        -- upvalues: OverpoweredGameBalance (ref)
        p14.amount = p14.amount * OverpoweredGameBalance.KitProgressMultiplier;
    end);
    ClientSyncEvents.ItemCooldownModifierCheck:connect(function(p15) -- Line: 63
        -- upvalues: OverpoweredGameBalance (ref)
        p15.cooldown = p15.cooldown * OverpoweredGameBalance.ItemCooldownMultiplier;
    end);
    ClientSyncEvents.ResourceSpawnDelayModifierCheck:connect(function(p16) -- Line: 66
        -- upvalues: OverpoweredGameBalance (ref)
        p16.spawnDelay = p16.spawnDelay * OverpoweredGameBalance.ResourceSpawnDelayMultiplier;
    end);
    ClientSyncEvents.RepeatingGiveItemModifierCheck:connect(function(p17) -- Line: 69
        -- upvalues: OverpoweredGameBalance (ref)
        p17.interval = p17.interval * OverpoweredGameBalance.RepeatingGiveItemIntervalMultiplier;
    end);
    ClientSyncEvents.BuffDurationModifierCheck:connect(function(p18) -- Line: 72
        -- upvalues: OverpoweredGameBalance (ref)
        p18.duration = p18.duration * OverpoweredGameBalance.BuffDurationMultiplier;
    end);
    ClientSyncEvents.DebuffDurationModifierCheck:connect(function(p19) -- Line: 75
        -- upvalues: OverpoweredGameBalance (ref)
        p19.duration = p19.duration * OverpoweredGameBalance.DebuffDurationMultiplier;
    end);
    ClientSyncEvents.CastTimeModifierCheck:connect(function(p20) -- Line: 78
        -- upvalues: OverpoweredGameBalance (ref)
        p20.castTime = p20.castTime * OverpoweredGameBalance.CastTimeMultiplier;
    end);
    ClientSyncEvents.AbilityTickDelayModifierCheck:connect(function(p21) -- Line: 81
        -- upvalues: OverpoweredGameBalance (ref)
        p21.tickDelay = p21.tickDelay * OverpoweredGameBalance.AbilityTickDelayMultiplier;
    end);
    ClientSyncEvents.ConsumableConsumeTimeModifierCheck:connect(function(p22) -- Line: 84
        -- upvalues: OverpoweredGameBalance (ref)
        p22.consumeTime = p22.consumeTime * OverpoweredGameBalance.ConsumableConsumeTimeMultiplier;
    end);
    ClientSyncEvents.SwordChargeTimeModifierCheck:connect(function(p23) -- Line: 87
        -- upvalues: OverpoweredGameBalance (ref)
        p23.maxChargeTime = p23.maxChargeTime * OverpoweredGameBalance.SwordChargeTimeMultiplier;

        if p23.minChargeTime ~= nil then
            p23.minChargeTime = p23.minChargeTime * OverpoweredGameBalance.SwordChargeTimeMultiplier;
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;